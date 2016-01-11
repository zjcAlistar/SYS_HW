
_finder：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <addFileItem>:
//测试相关函数
void printItemList();
void testHandlers();

// 文件项列表相关操作
void addFileItem(struct stat st, char *name, Rect pos) {
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	53                   	push   %ebx
       4:	83 ec 24             	sub    $0x24,%esp
	//int i;
	struct fileItem *temp = (struct fileItem *) malloc(sizeof(struct fileItem));
       7:	83 ec 0c             	sub    $0xc,%esp
       a:	6a 30                	push   $0x30
       c:	e8 75 40 00 00       	call   4086 <malloc>
      11:	83 c4 10             	add    $0x10,%esp
      14:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
      17:	83 ec 0c             	sub    $0xc,%esp
      1a:	6a 20                	push   $0x20
      1c:	e8 65 40 00 00       	call   4086 <malloc>
      21:	83 c4 10             	add    $0x10,%esp
      24:	89 c2                	mov    %eax,%edx
      26:	8b 45 f4             	mov    -0xc(%ebp),%eax
      29:	89 50 14             	mov    %edx,0x14(%eax)
	strcpy(temp->name, name);
      2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
      2f:	8b 40 14             	mov    0x14(%eax),%eax
      32:	83 ec 08             	sub    $0x8,%esp
      35:	ff 75 1c             	pushl  0x1c(%ebp)
      38:	50                   	push   %eax
      39:	e8 6a 39 00 00       	call   39a8 <strcpy>
      3e:	83 c4 10             	add    $0x10,%esp
//    for (i = 0; name[i] != 0; i++)
//    	{
//    		printf(0, "%d : %c\n", i, name[i]);
//    	}
	//printf(0, "copying name\n");
	temp->st = st;
      41:	8b 45 f4             	mov    -0xc(%ebp),%eax
      44:	8b 55 08             	mov    0x8(%ebp),%edx
      47:	89 10                	mov    %edx,(%eax)
      49:	8b 55 0c             	mov    0xc(%ebp),%edx
      4c:	89 50 04             	mov    %edx,0x4(%eax)
      4f:	8b 55 10             	mov    0x10(%ebp),%edx
      52:	89 50 08             	mov    %edx,0x8(%eax)
      55:	8b 55 14             	mov    0x14(%ebp),%edx
      58:	89 50 0c             	mov    %edx,0xc(%eax)
      5b:	8b 55 18             	mov    0x18(%ebp),%edx
      5e:	89 50 10             	mov    %edx,0x10(%eax)
	temp->pos = getPos(context, itemCounter);
      61:	8b 15 48 ef 00 00    	mov    0xef48,%edx
      67:	8b 5d f4             	mov    -0xc(%ebp),%ebx
      6a:	8d 45 d8             	lea    -0x28(%ebp),%eax
      6d:	83 ec 0c             	sub    $0xc,%esp
      70:	52                   	push   %edx
      71:	ff 35 30 1f 01 00    	pushl  0x11f30
      77:	ff 35 2c 1f 01 00    	pushl  0x11f2c
      7d:	ff 35 28 1f 01 00    	pushl  0x11f28
      83:	50                   	push   %eax
      84:	e8 e7 0a 00 00       	call   b70 <getPos>
      89:	83 c4 1c             	add    $0x1c,%esp
      8c:	8b 45 d8             	mov    -0x28(%ebp),%eax
      8f:	89 43 18             	mov    %eax,0x18(%ebx)
      92:	8b 45 dc             	mov    -0x24(%ebp),%eax
      95:	89 43 1c             	mov    %eax,0x1c(%ebx)
      98:	8b 45 e0             	mov    -0x20(%ebp),%eax
      9b:	89 43 20             	mov    %eax,0x20(%ebx)
      9e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      a1:	89 43 24             	mov    %eax,0x24(%ebx)
	temp->next = fileItemList;
      a4:	8b 15 44 ef 00 00    	mov    0xef44,%edx
      aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
      ad:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
      b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
      b3:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
      ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
      bd:	a3 44 ef 00 00       	mov    %eax,0xef44
}
      c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      c5:	c9                   	leave  
      c6:	c3                   	ret    

000000c7 <freeFileItemList>:

void freeFileItemList() {
      c7:	55                   	push   %ebp
      c8:	89 e5                	mov    %esp,%ebp
      ca:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
      cd:	a1 44 ef 00 00       	mov    0xef44,%eax
      d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
      d5:	eb 2f                	jmp    106 <freeFileItemList+0x3f>
		temp = p;
      d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
      da:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
      dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
      e0:	8b 40 2c             	mov    0x2c(%eax),%eax
      e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
		free(temp->name);
      e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
      e9:	8b 40 14             	mov    0x14(%eax),%eax
      ec:	83 ec 0c             	sub    $0xc,%esp
      ef:	50                   	push   %eax
      f0:	e8 50 3e 00 00       	call   3f45 <free>
      f5:	83 c4 10             	add    $0x10,%esp
		free(temp);
      f8:	83 ec 0c             	sub    $0xc,%esp
      fb:	ff 75 f0             	pushl  -0x10(%ebp)
      fe:	e8 42 3e 00 00       	call   3f45 <free>
     103:	83 c4 10             	add    $0x10,%esp
}

void freeFileItemList() {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
     106:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     10a:	75 cb                	jne    d7 <freeFileItemList+0x10>
		temp = p;
		p = p->next;
		free(temp->name);
		free(temp);
	}
	fileItemList = 0;
     10c:	c7 05 44 ef 00 00 00 	movl   $0x0,0xef44
     113:	00 00 00 
}
     116:	c9                   	leave  
     117:	c3                   	ret    

00000118 <fmtname>:

// 文件信息相关操作
char* fmtname(char *path) {
     118:	55                   	push   %ebp
     119:	89 e5                	mov    %esp,%ebp
     11b:	83 ec 18             	sub    $0x18,%esp
	//static char buf[DIRSIZ+1];
	char *p;

	// Find first character after last slash.
	for (p = path + strlen(path); p >= path && *p != '/'; p--)
     11e:	83 ec 0c             	sub    $0xc,%esp
     121:	ff 75 08             	pushl  0x8(%ebp)
     124:	e8 ee 38 00 00       	call   3a17 <strlen>
     129:	83 c4 10             	add    $0x10,%esp
     12c:	89 c2                	mov    %eax,%edx
     12e:	8b 45 08             	mov    0x8(%ebp),%eax
     131:	01 d0                	add    %edx,%eax
     133:	89 45 f4             	mov    %eax,-0xc(%ebp)
     136:	eb 04                	jmp    13c <fmtname+0x24>
     138:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     13c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     13f:	3b 45 08             	cmp    0x8(%ebp),%eax
     142:	72 0a                	jb     14e <fmtname+0x36>
     144:	8b 45 f4             	mov    -0xc(%ebp),%eax
     147:	0f b6 00             	movzbl (%eax),%eax
     14a:	3c 2f                	cmp    $0x2f,%al
     14c:	75 ea                	jne    138 <fmtname+0x20>
		;
	p++;
     14e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

	return p;
     152:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     155:	c9                   	leave  
     156:	c3                   	ret    

00000157 <isListable>:

int isListable(char *name, short type) {
     157:	55                   	push   %ebp
     158:	89 e5                	mov    %esp,%ebp
     15a:	83 ec 14             	sub    $0x14,%esp
     15d:	8b 45 0c             	mov    0xc(%ebp),%eax
     160:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	char *p = name;
     164:	8b 45 08             	mov    0x8(%ebp),%eax
     167:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (*p == '.') return 0;
     16a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     16d:	0f b6 00             	movzbl (%eax),%eax
     170:	3c 2e                	cmp    $0x2e,%al
     172:	75 07                	jne    17b <isListable+0x24>
     174:	b8 00 00 00 00       	mov    $0x0,%eax
     179:	eb 34                	jmp    1af <isListable+0x58>
	if (type == T_DIR) return 1;
     17b:	66 83 7d ec 01       	cmpw   $0x1,-0x14(%ebp)
     180:	75 07                	jne    189 <isListable+0x32>
     182:	b8 01 00 00 00       	mov    $0x1,%eax
     187:	eb 26                	jmp    1af <isListable+0x58>
	while (*p != 0) {
     189:	eb 15                	jmp    1a0 <isListable+0x49>
		if (*p == '.')
     18b:	8b 45 fc             	mov    -0x4(%ebp),%eax
     18e:	0f b6 00             	movzbl (%eax),%eax
     191:	3c 2e                	cmp    $0x2e,%al
     193:	75 07                	jne    19c <isListable+0x45>
			return 1;
     195:	b8 01 00 00 00       	mov    $0x1,%eax
     19a:	eb 13                	jmp    1af <isListable+0x58>
		p++;
     19c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)

int isListable(char *name, short type) {
	char *p = name;
	if (*p == '.') return 0;
	if (type == T_DIR) return 1;
	while (*p != 0) {
     1a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
     1a3:	0f b6 00             	movzbl (%eax),%eax
     1a6:	84 c0                	test   %al,%al
     1a8:	75 e1                	jne    18b <isListable+0x34>
		if (*p == '.')
			return 1;
		p++;
	}
	return 0;
     1aa:	b8 00 00 00 00       	mov    $0x0,%eax
}
     1af:	c9                   	leave  
     1b0:	c3                   	ret    

000001b1 <list>:

void list(char *path) {
     1b1:	55                   	push   %ebp
     1b2:	89 e5                	mov    %esp,%ebp
     1b4:	57                   	push   %edi
     1b5:	56                   	push   %esi
     1b6:	53                   	push   %ebx
     1b7:	81 ec 4c 02 00 00    	sub    $0x24c,%esp
	char buf[512], *p;
	int fd;
	struct dirent de;
	struct stat st;

	itemCounter = 0;
     1bd:	c7 05 48 ef 00 00 00 	movl   $0x0,0xef48
     1c4:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     1c7:	83 ec 08             	sub    $0x8,%esp
     1ca:	6a 00                	push   $0x0
     1cc:	ff 75 08             	pushl  0x8(%ebp)
     1cf:	e8 44 3a 00 00       	call   3c18 <open>
     1d4:	83 c4 10             	add    $0x10,%esp
     1d7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     1da:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     1de:	79 1a                	jns    1fa <list+0x49>
		printf(2, "ls: cannot open %s\n", path);
     1e0:	83 ec 04             	sub    $0x4,%esp
     1e3:	ff 75 08             	pushl  0x8(%ebp)
     1e6:	68 80 a4 00 00       	push   $0xa480
     1eb:	6a 02                	push   $0x2
     1ed:	e8 c3 3b 00 00       	call   3db5 <printf>
     1f2:	83 c4 10             	add    $0x10,%esp
		return;
     1f5:	e9 52 02 00 00       	jmp    44c <list+0x29b>
	}

	if (fstat(fd, &st) < 0) {
     1fa:	83 ec 08             	sub    $0x8,%esp
     1fd:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     203:	50                   	push   %eax
     204:	ff 75 e4             	pushl  -0x1c(%ebp)
     207:	e8 24 3a 00 00       	call   3c30 <fstat>
     20c:	83 c4 10             	add    $0x10,%esp
     20f:	85 c0                	test   %eax,%eax
     211:	79 28                	jns    23b <list+0x8a>
		printf(2, "ls: cannot stat %s\n", path);
     213:	83 ec 04             	sub    $0x4,%esp
     216:	ff 75 08             	pushl  0x8(%ebp)
     219:	68 94 a4 00 00       	push   $0xa494
     21e:	6a 02                	push   $0x2
     220:	e8 90 3b 00 00       	call   3db5 <printf>
     225:	83 c4 10             	add    $0x10,%esp
		close(fd);
     228:	83 ec 0c             	sub    $0xc,%esp
     22b:	ff 75 e4             	pushl  -0x1c(%ebp)
     22e:	e8 cd 39 00 00       	call   3c00 <close>
     233:	83 c4 10             	add    $0x10,%esp
		return;
     236:	e9 11 02 00 00       	jmp    44c <list+0x29b>
	}

	switch (st.type) {
     23b:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     242:	98                   	cwtl   
     243:	83 f8 01             	cmp    $0x1,%eax
     246:	74 48                	je     290 <list+0xdf>
     248:	83 f8 02             	cmp    $0x2,%eax
     24b:	0f 85 ed 01 00 00    	jne    43e <list+0x28d>
	case T_FILE:
		printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
     251:	8b bd bc fd ff ff    	mov    -0x244(%ebp),%edi
     257:	8b b5 b4 fd ff ff    	mov    -0x24c(%ebp),%esi
     25d:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     264:	0f bf d8             	movswl %ax,%ebx
     267:	83 ec 0c             	sub    $0xc,%esp
     26a:	ff 75 08             	pushl  0x8(%ebp)
     26d:	e8 a6 fe ff ff       	call   118 <fmtname>
     272:	83 c4 10             	add    $0x10,%esp
     275:	83 ec 08             	sub    $0x8,%esp
     278:	57                   	push   %edi
     279:	56                   	push   %esi
     27a:	53                   	push   %ebx
     27b:	50                   	push   %eax
     27c:	68 a8 a4 00 00       	push   $0xa4a8
     281:	6a 01                	push   $0x1
     283:	e8 2d 3b 00 00       	call   3db5 <printf>
     288:	83 c4 20             	add    $0x20,%esp
		break;
     28b:	e9 ae 01 00 00       	jmp    43e <list+0x28d>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     290:	83 ec 0c             	sub    $0xc,%esp
     293:	ff 75 08             	pushl  0x8(%ebp)
     296:	e8 7c 37 00 00       	call   3a17 <strlen>
     29b:	83 c4 10             	add    $0x10,%esp
     29e:	83 c0 10             	add    $0x10,%eax
     2a1:	3d 00 02 00 00       	cmp    $0x200,%eax
     2a6:	76 17                	jbe    2bf <list+0x10e>
			printf(1, "ls: path too long\n");
     2a8:	83 ec 08             	sub    $0x8,%esp
     2ab:	68 b5 a4 00 00       	push   $0xa4b5
     2b0:	6a 01                	push   $0x1
     2b2:	e8 fe 3a 00 00       	call   3db5 <printf>
     2b7:	83 c4 10             	add    $0x10,%esp
			break;
     2ba:	e9 7f 01 00 00       	jmp    43e <list+0x28d>
		}
		strcpy(buf, path);
     2bf:	83 ec 08             	sub    $0x8,%esp
     2c2:	ff 75 08             	pushl  0x8(%ebp)
     2c5:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2cb:	50                   	push   %eax
     2cc:	e8 d7 36 00 00       	call   39a8 <strcpy>
     2d1:	83 c4 10             	add    $0x10,%esp
		p = buf + strlen(buf);
     2d4:	83 ec 0c             	sub    $0xc,%esp
     2d7:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2dd:	50                   	push   %eax
     2de:	e8 34 37 00 00       	call   3a17 <strlen>
     2e3:	83 c4 10             	add    $0x10,%esp
     2e6:	89 c2                	mov    %eax,%edx
     2e8:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2ee:	01 d0                	add    %edx,%eax
     2f0:	89 45 e0             	mov    %eax,-0x20(%ebp)
		*p++ = '/';
     2f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
     2f6:	8d 50 01             	lea    0x1(%eax),%edx
     2f9:	89 55 e0             	mov    %edx,-0x20(%ebp)
     2fc:	c6 00 2f             	movb   $0x2f,(%eax)
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     2ff:	e9 19 01 00 00       	jmp    41d <list+0x26c>
			if (de.inum == 0)
     304:	0f b7 85 c0 fd ff ff 	movzwl -0x240(%ebp),%eax
     30b:	66 85 c0             	test   %ax,%ax
     30e:	75 05                	jne    315 <list+0x164>
				continue;
     310:	e9 08 01 00 00       	jmp    41d <list+0x26c>
			memmove(p, de.name, DIRSIZ);
     315:	83 ec 04             	sub    $0x4,%esp
     318:	6a 0e                	push   $0xe
     31a:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     320:	83 c0 02             	add    $0x2,%eax
     323:	50                   	push   %eax
     324:	ff 75 e0             	pushl  -0x20(%ebp)
     327:	e8 67 38 00 00       	call   3b93 <memmove>
     32c:	83 c4 10             	add    $0x10,%esp
			p[DIRSIZ] = 0;
     32f:	8b 45 e0             	mov    -0x20(%ebp),%eax
     332:	83 c0 0e             	add    $0xe,%eax
     335:	c6 00 00             	movb   $0x0,(%eax)
			if (stat(buf, &st) < 0) {
     338:	83 ec 08             	sub    $0x8,%esp
     33b:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     341:	50                   	push   %eax
     342:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     348:	50                   	push   %eax
     349:	e8 ab 37 00 00       	call   3af9 <stat>
     34e:	83 c4 10             	add    $0x10,%esp
     351:	85 c0                	test   %eax,%eax
     353:	79 1e                	jns    373 <list+0x1c2>
				printf(1, "ls: cannot stat %s\n", buf);
     355:	83 ec 04             	sub    $0x4,%esp
     358:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     35e:	50                   	push   %eax
     35f:	68 94 a4 00 00       	push   $0xa494
     364:	6a 01                	push   $0x1
     366:	e8 4a 3a 00 00       	call   3db5 <printf>
     36b:	83 c4 10             	add    $0x10,%esp
				continue;
     36e:	e9 aa 00 00 00       	jmp    41d <list+0x26c>
			}
			if (isListable(fmtname(buf), st.type)) {
     373:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     37a:	0f bf d8             	movswl %ax,%ebx
     37d:	83 ec 0c             	sub    $0xc,%esp
     380:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     386:	50                   	push   %eax
     387:	e8 8c fd ff ff       	call   118 <fmtname>
     38c:	83 c4 10             	add    $0x10,%esp
     38f:	83 ec 08             	sub    $0x8,%esp
     392:	53                   	push   %ebx
     393:	50                   	push   %eax
     394:	e8 be fd ff ff       	call   157 <isListable>
     399:	83 c4 10             	add    $0x10,%esp
     39c:	85 c0                	test   %eax,%eax
     39e:	74 7d                	je     41d <list+0x26c>
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
     3a0:	8b 15 48 ef 00 00    	mov    0xef48,%edx
     3a6:	8d 45 d0             	lea    -0x30(%ebp),%eax
     3a9:	83 ec 0c             	sub    $0xc,%esp
     3ac:	52                   	push   %edx
     3ad:	ff 35 30 1f 01 00    	pushl  0x11f30
     3b3:	ff 35 2c 1f 01 00    	pushl  0x11f2c
     3b9:	ff 35 28 1f 01 00    	pushl  0x11f28
     3bf:	50                   	push   %eax
     3c0:	e8 ab 07 00 00       	call   b70 <getPos>
     3c5:	83 c4 1c             	add    $0x1c,%esp
     3c8:	83 ec 0c             	sub    $0xc,%esp
     3cb:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     3d1:	50                   	push   %eax
     3d2:	e8 41 fd ff ff       	call   118 <fmtname>
     3d7:	83 c4 10             	add    $0x10,%esp
     3da:	83 ec 08             	sub    $0x8,%esp
     3dd:	ff 75 dc             	pushl  -0x24(%ebp)
     3e0:	ff 75 d8             	pushl  -0x28(%ebp)
     3e3:	ff 75 d4             	pushl  -0x2c(%ebp)
     3e6:	ff 75 d0             	pushl  -0x30(%ebp)
     3e9:	50                   	push   %eax
     3ea:	ff b5 bc fd ff ff    	pushl  -0x244(%ebp)
     3f0:	ff b5 b8 fd ff ff    	pushl  -0x248(%ebp)
     3f6:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
     3fc:	ff b5 b0 fd ff ff    	pushl  -0x250(%ebp)
     402:	ff b5 ac fd ff ff    	pushl  -0x254(%ebp)
     408:	e8 f3 fb ff ff       	call   0 <addFileItem>
     40d:	83 c4 30             	add    $0x30,%esp
				itemCounter++;
     410:	a1 48 ef 00 00       	mov    0xef48,%eax
     415:	83 c0 01             	add    $0x1,%eax
     418:	a3 48 ef 00 00       	mov    %eax,0xef48
			break;
		}
		strcpy(buf, path);
		p = buf + strlen(buf);
		*p++ = '/';
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     41d:	83 ec 04             	sub    $0x4,%esp
     420:	6a 10                	push   $0x10
     422:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     428:	50                   	push   %eax
     429:	ff 75 e4             	pushl  -0x1c(%ebp)
     42c:	e8 bf 37 00 00       	call   3bf0 <read>
     431:	83 c4 10             	add    $0x10,%esp
     434:	83 f8 10             	cmp    $0x10,%eax
     437:	0f 84 c7 fe ff ff    	je     304 <list+0x153>
			if (isListable(fmtname(buf), st.type)) {
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
				itemCounter++;
			}
		}
		break;
     43d:	90                   	nop
	}
	close(fd);
     43e:	83 ec 0c             	sub    $0xc,%esp
     441:	ff 75 e4             	pushl  -0x1c(%ebp)
     444:	e8 b7 37 00 00       	call   3c00 <close>
     449:	83 c4 10             	add    $0x10,%esp
}
     44c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     44f:	5b                   	pop    %ebx
     450:	5e                   	pop    %esi
     451:	5f                   	pop    %edi
     452:	5d                   	pop    %ebp
     453:	c3                   	ret    

00000454 <drawItem>:
#define FILE_ICON_BIG 0
#define FILE_ICON_SMALL 1
#define FOLDER_ICON_BIG 2
#define FOLDER_ICON_SMALL 3

void drawItem(Context context, char *name, struct stat st, Rect rect, int chosen) {
     454:	55                   	push   %ebp
     455:	89 e5                	mov    %esp,%ebp
     457:	53                   	push   %ebx
     458:	83 ec 14             	sub    $0x14,%esp
	//cprintf("draw finder Item: type=%d counter=%d\n", type, n);
	unsigned short nameColor;
	if (chosen == 0) 
     45b:	83 7d 3c 00          	cmpl   $0x0,0x3c(%ebp)
     45f:	75 08                	jne    469 <drawItem+0x15>
		nameColor = 0x0;
     461:	66 c7 45 f6 00 00    	movw   $0x0,-0xa(%ebp)
     467:	eb 32                	jmp    49b <drawItem+0x47>
	else 
	{
		nameColor = 0xFFFF;
     469:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
     46f:	8b 45 38             	mov    0x38(%ebp),%eax
     472:	89 c3                	mov    %eax,%ebx
     474:	8b 45 34             	mov    0x34(%ebp),%eax
     477:	89 c1                	mov    %eax,%ecx
     479:	8b 45 30             	mov    0x30(%ebp),%eax
     47c:	89 c2                	mov    %eax,%edx
     47e:	8b 45 2c             	mov    0x2c(%ebp),%eax
     481:	68 10 21 00 00       	push   $0x2110
     486:	53                   	push   %ebx
     487:	51                   	push   %ecx
     488:	52                   	push   %edx
     489:	50                   	push   %eax
     48a:	ff 75 10             	pushl  0x10(%ebp)
     48d:	ff 75 0c             	pushl  0xc(%ebp)
     490:	ff 75 08             	pushl  0x8(%ebp)
     493:	e8 45 1e 00 00       	call   22dd <fill_rect>
     498:	83 c4 20             	add    $0x20,%esp
	}
	if (style == ICON_STYLE) {
     49b:	a1 84 e5 00 00       	mov    0xe584,%eax
     4a0:	83 f8 01             	cmp    $0x1,%eax
     4a3:	0f 85 d2 00 00 00    	jne    57b <drawItem+0x127>
		switch (st.type) {
     4a9:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     4ad:	98                   	cwtl   
     4ae:	83 f8 01             	cmp    $0x1,%eax
     4b1:	74 38                	je     4eb <drawItem+0x97>
     4b3:	83 f8 02             	cmp    $0x2,%eax
     4b6:	75 65                	jne    51d <drawItem+0xc9>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     4b8:	8b 45 30             	mov    0x30(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     4bb:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     4be:	8b 45 2c             	mov    0x2c(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     4c1:	83 c0 19             	add    $0x19,%eax
     4c4:	52                   	push   %edx
     4c5:	50                   	push   %eax
     4c6:	ff 35 f0 e5 00 00    	pushl  0xe5f0
     4cc:	ff 35 ec e5 00 00    	pushl  0xe5ec
     4d2:	ff 35 e8 e5 00 00    	pushl  0xe5e8
     4d8:	ff 75 10             	pushl  0x10(%ebp)
     4db:	ff 75 0c             	pushl  0xc(%ebp)
     4de:	ff 75 08             	pushl  0x8(%ebp)
     4e1:	e8 01 24 00 00       	call   28e7 <draw_picture>
     4e6:	83 c4 20             	add    $0x20,%esp
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     4e9:	eb 32                	jmp    51d <drawItem+0xc9>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     4eb:	8b 45 30             	mov    0x30(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     4ee:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     4f1:	8b 45 2c             	mov    0x2c(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     4f4:	83 c0 19             	add    $0x19,%eax
     4f7:	52                   	push   %edx
     4f8:	50                   	push   %eax
     4f9:	ff 35 58 e6 00 00    	pushl  0xe658
     4ff:	ff 35 54 e6 00 00    	pushl  0xe654
     505:	ff 35 50 e6 00 00    	pushl  0xe650
     50b:	ff 75 10             	pushl  0x10(%ebp)
     50e:	ff 75 0c             	pushl  0xc(%ebp)
     511:	ff 75 08             	pushl  0x8(%ebp)
     514:	e8 ce 23 00 00       	call   28e7 <draw_picture>
     519:	83 c4 20             	add    $0x20,%esp
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     51c:	90                   	nop
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
     51d:	83 ec 0c             	sub    $0xc,%esp
     520:	ff 75 14             	pushl  0x14(%ebp)
     523:	e8 ef 34 00 00       	call   3a17 <strlen>
     528:	83 c4 10             	add    $0x10,%esp
     52b:	89 c2                	mov    %eax,%edx
     52d:	b8 00 00 00 00       	mov    $0x0,%eax
     532:	29 d0                	sub    %edx,%eax
     534:	c1 e0 02             	shl    $0x2,%eax
     537:	83 c0 30             	add    $0x30,%eax
     53a:	89 45 f0             	mov    %eax,-0x10(%ebp)
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
     53d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     541:	79 07                	jns    54a <drawItem+0xf6>
			indent = 0;
     543:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
     54a:	8b 45 30             	mov    0x30(%ebp),%eax
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
			indent = 0;
		puts_str(context, name, nameColor, rect.start.x + indent,
     54d:	8d 48 46             	lea    0x46(%eax),%ecx
     550:	8b 55 2c             	mov    0x2c(%ebp),%edx
     553:	8b 45 f0             	mov    -0x10(%ebp),%eax
     556:	01 c2                	add    %eax,%edx
     558:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     55c:	83 ec 04             	sub    $0x4,%esp
     55f:	51                   	push   %ecx
     560:	52                   	push   %edx
     561:	50                   	push   %eax
     562:	ff 75 14             	pushl  0x14(%ebp)
     565:	ff 75 10             	pushl  0x10(%ebp)
     568:	ff 75 0c             	pushl  0xc(%ebp)
     56b:	ff 75 08             	pushl  0x8(%ebp)
     56e:	e8 c5 22 00 00       	call   2838 <puts_str>
     573:	83 c4 20             	add    $0x20,%esp
     576:	e9 e1 00 00 00       	jmp    65c <drawItem+0x208>
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
     57b:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     57f:	98                   	cwtl   
     580:	83 f8 01             	cmp    $0x1,%eax
     583:	74 7b                	je     600 <drawItem+0x1ac>
     585:	83 f8 02             	cmp    $0x2,%eax
     588:	0f 85 a4 00 00 00    	jne    632 <drawItem+0x1de>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     58e:	8b 45 30             	mov    0x30(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     591:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     594:	8b 45 2c             	mov    0x2c(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     597:	83 c0 08             	add    $0x8,%eax
     59a:	52                   	push   %edx
     59b:	50                   	push   %eax
     59c:	ff 35 24 e6 00 00    	pushl  0xe624
     5a2:	ff 35 20 e6 00 00    	pushl  0xe620
     5a8:	ff 35 1c e6 00 00    	pushl  0xe61c
     5ae:	ff 75 10             	pushl  0x10(%ebp)
     5b1:	ff 75 0c             	pushl  0xc(%ebp)
     5b4:	ff 75 08             	pushl  0x8(%ebp)
     5b7:	e8 2b 23 00 00       	call   28e7 <draw_picture>
     5bc:	83 c4 20             	add    $0x20,%esp
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
     5bf:	8b 45 28             	mov    0x28(%ebp),%eax
     5c2:	83 ec 0c             	sub    $0xc,%esp
     5c5:	50                   	push   %eax
     5c6:	e8 96 00 00 00       	call   661 <sizeFormat>
     5cb:	83 c4 10             	add    $0x10,%esp
     5ce:	89 45 ec             	mov    %eax,-0x14(%ebp)
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
     5d1:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
     5d4:	8d 48 03             	lea    0x3(%eax),%ecx
     5d7:	8b 45 2c             	mov    0x2c(%ebp),%eax
     5da:	8d 90 c8 00 00 00    	lea    0xc8(%eax),%edx
     5e0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     5e4:	83 ec 04             	sub    $0x4,%esp
     5e7:	51                   	push   %ecx
     5e8:	52                   	push   %edx
     5e9:	50                   	push   %eax
     5ea:	ff 75 ec             	pushl  -0x14(%ebp)
     5ed:	ff 75 10             	pushl  0x10(%ebp)
     5f0:	ff 75 0c             	pushl  0xc(%ebp)
     5f3:	ff 75 08             	pushl  0x8(%ebp)
     5f6:	e8 3d 22 00 00       	call   2838 <puts_str>
     5fb:	83 c4 20             	add    $0x20,%esp
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     5fe:	eb 32                	jmp    632 <drawItem+0x1de>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     600:	8b 45 30             	mov    0x30(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     603:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     606:	8b 45 2c             	mov    0x2c(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     609:	83 c0 08             	add    $0x8,%eax
     60c:	52                   	push   %edx
     60d:	50                   	push   %eax
     60e:	ff 35 8c e6 00 00    	pushl  0xe68c
     614:	ff 35 88 e6 00 00    	pushl  0xe688
     61a:	ff 35 84 e6 00 00    	pushl  0xe684
     620:	ff 75 10             	pushl  0x10(%ebp)
     623:	ff 75 0c             	pushl  0xc(%ebp)
     626:	ff 75 08             	pushl  0x8(%ebp)
     629:	e8 b9 22 00 00       	call   28e7 <draw_picture>
     62e:	83 c4 20             	add    $0x20,%esp
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     631:	90                   	nop
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
				rect.start.y + LIST_ITEM_OFFSET_Y);
     632:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
     635:	8d 48 03             	lea    0x3(%eax),%ecx
     638:	8b 45 2c             	mov    0x2c(%ebp),%eax
     63b:	8d 50 28             	lea    0x28(%eax),%edx
     63e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     642:	83 ec 04             	sub    $0x4,%esp
     645:	51                   	push   %ecx
     646:	52                   	push   %edx
     647:	50                   	push   %eax
     648:	ff 75 14             	pushl  0x14(%ebp)
     64b:	ff 75 10             	pushl  0x10(%ebp)
     64e:	ff 75 0c             	pushl  0xc(%ebp)
     651:	ff 75 08             	pushl  0x8(%ebp)
     654:	e8 df 21 00 00       	call   2838 <puts_str>
     659:	83 c4 20             	add    $0x20,%esp
				rect.start.y + LIST_ITEM_OFFSET_Y);
	}
}
     65c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     65f:	c9                   	leave  
     660:	c3                   	ret    

00000661 <sizeFormat>:

char *sizeFormat(uint size){
     661:	55                   	push   %ebp
     662:	89 e5                	mov    %esp,%ebp
     664:	53                   	push   %ebx
     665:	83 ec 14             	sub    $0x14,%esp
	char* result = (char *) malloc(12 * sizeof(char));
     668:	83 ec 0c             	sub    $0xc,%esp
     66b:	6a 0c                	push   $0xc
     66d:	e8 14 3a 00 00       	call   4086 <malloc>
     672:	83 c4 10             	add    $0x10,%esp
     675:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int n = 0;
     678:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (size > 0x400) 
     67f:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
     686:	0f 86 8b 00 00 00    	jbe    717 <sizeFormat+0xb6>
	{
		size = size / (0x400);
     68c:	8b 45 08             	mov    0x8(%ebp),%eax
     68f:	c1 e8 0a             	shr    $0xa,%eax
     692:	89 45 08             	mov    %eax,0x8(%ebp)
		do{
			result[n++] = (size % 10) + '0';
     695:	8b 45 f4             	mov    -0xc(%ebp),%eax
     698:	8d 50 01             	lea    0x1(%eax),%edx
     69b:	89 55 f4             	mov    %edx,-0xc(%ebp)
     69e:	89 c2                	mov    %eax,%edx
     6a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     6a3:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     6a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
     6a9:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     6ae:	89 c8                	mov    %ecx,%eax
     6b0:	f7 e2                	mul    %edx
     6b2:	c1 ea 03             	shr    $0x3,%edx
     6b5:	89 d0                	mov    %edx,%eax
     6b7:	c1 e0 02             	shl    $0x2,%eax
     6ba:	01 d0                	add    %edx,%eax
     6bc:	01 c0                	add    %eax,%eax
     6be:	29 c1                	sub    %eax,%ecx
     6c0:	89 ca                	mov    %ecx,%edx
     6c2:	89 d0                	mov    %edx,%eax
     6c4:	83 c0 30             	add    $0x30,%eax
     6c7:	88 03                	mov    %al,(%ebx)
			size /= 10;
     6c9:	8b 45 08             	mov    0x8(%ebp),%eax
     6cc:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     6d1:	f7 e2                	mul    %edx
     6d3:	89 d0                	mov    %edx,%eax
     6d5:	c1 e8 03             	shr    $0x3,%eax
     6d8:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     6db:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     6df:	75 b4                	jne    695 <sizeFormat+0x34>
		result[n++] = 'K';
     6e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6e4:	8d 50 01             	lea    0x1(%eax),%edx
     6e7:	89 55 f4             	mov    %edx,-0xc(%ebp)
     6ea:	89 c2                	mov    %eax,%edx
     6ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
     6ef:	01 d0                	add    %edx,%eax
     6f1:	c6 00 4b             	movb   $0x4b,(%eax)
		result[n++] = 'b';
     6f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6f7:	8d 50 01             	lea    0x1(%eax),%edx
     6fa:	89 55 f4             	mov    %edx,-0xc(%ebp)
     6fd:	89 c2                	mov    %eax,%edx
     6ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
     702:	01 d0                	add    %edx,%eax
     704:	c6 00 62             	movb   $0x62,(%eax)
		result[n] = 0;
     707:	8b 55 f4             	mov    -0xc(%ebp),%edx
     70a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     70d:	01 d0                	add    %edx,%eax
     70f:	c6 00 00             	movb   $0x0,(%eax)
     712:	e9 a3 00 00 00       	jmp    7ba <sizeFormat+0x159>
	}
	else 
	{
		do{
			result[n++] = (size % 10) + '0';
     717:	8b 45 f4             	mov    -0xc(%ebp),%eax
     71a:	8d 50 01             	lea    0x1(%eax),%edx
     71d:	89 55 f4             	mov    %edx,-0xc(%ebp)
     720:	89 c2                	mov    %eax,%edx
     722:	8b 45 f0             	mov    -0x10(%ebp),%eax
     725:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     728:	8b 4d 08             	mov    0x8(%ebp),%ecx
     72b:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     730:	89 c8                	mov    %ecx,%eax
     732:	f7 e2                	mul    %edx
     734:	c1 ea 03             	shr    $0x3,%edx
     737:	89 d0                	mov    %edx,%eax
     739:	c1 e0 02             	shl    $0x2,%eax
     73c:	01 d0                	add    %edx,%eax
     73e:	01 c0                	add    %eax,%eax
     740:	29 c1                	sub    %eax,%ecx
     742:	89 ca                	mov    %ecx,%edx
     744:	89 d0                	mov    %edx,%eax
     746:	83 c0 30             	add    $0x30,%eax
     749:	88 03                	mov    %al,(%ebx)
			size /= 10;
     74b:	8b 45 08             	mov    0x8(%ebp),%eax
     74e:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     753:	f7 e2                	mul    %edx
     755:	89 d0                	mov    %edx,%eax
     757:	c1 e8 03             	shr    $0x3,%eax
     75a:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     75d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     761:	75 b4                	jne    717 <sizeFormat+0xb6>
		result[n++] = 'b';
     763:	8b 45 f4             	mov    -0xc(%ebp),%eax
     766:	8d 50 01             	lea    0x1(%eax),%edx
     769:	89 55 f4             	mov    %edx,-0xc(%ebp)
     76c:	89 c2                	mov    %eax,%edx
     76e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     771:	01 d0                	add    %edx,%eax
     773:	c6 00 62             	movb   $0x62,(%eax)
		result[n++] = 'y';
     776:	8b 45 f4             	mov    -0xc(%ebp),%eax
     779:	8d 50 01             	lea    0x1(%eax),%edx
     77c:	89 55 f4             	mov    %edx,-0xc(%ebp)
     77f:	89 c2                	mov    %eax,%edx
     781:	8b 45 f0             	mov    -0x10(%ebp),%eax
     784:	01 d0                	add    %edx,%eax
     786:	c6 00 79             	movb   $0x79,(%eax)
		result[n++] = 't';
     789:	8b 45 f4             	mov    -0xc(%ebp),%eax
     78c:	8d 50 01             	lea    0x1(%eax),%edx
     78f:	89 55 f4             	mov    %edx,-0xc(%ebp)
     792:	89 c2                	mov    %eax,%edx
     794:	8b 45 f0             	mov    -0x10(%ebp),%eax
     797:	01 d0                	add    %edx,%eax
     799:	c6 00 74             	movb   $0x74,(%eax)
		result[n++] = 'e';
     79c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     79f:	8d 50 01             	lea    0x1(%eax),%edx
     7a2:	89 55 f4             	mov    %edx,-0xc(%ebp)
     7a5:	89 c2                	mov    %eax,%edx
     7a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7aa:	01 d0                	add    %edx,%eax
     7ac:	c6 00 65             	movb   $0x65,(%eax)
		result[n] = 0;
     7af:	8b 55 f4             	mov    -0xc(%ebp),%edx
     7b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7b5:	01 d0                	add    %edx,%eax
     7b7:	c6 00 00             	movb   $0x0,(%eax)
	}
	return result;
     7ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     7bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     7c0:	c9                   	leave  
     7c1:	c3                   	ret    

000007c2 <drawFinderWnd>:
		7 * BUTTON_WIDTH + 200, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "trash.bmp",
		8 * BUTTON_WIDTH + 200, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) } };

void drawFinderWnd(Context context) {
     7c2:	55                   	push   %ebp
     7c3:	89 e5                	mov    %esp,%ebp
     7c5:	83 ec 08             	sub    $0x8,%esp
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
     7c8:	8b 45 0c             	mov    0xc(%ebp),%eax
     7cb:	83 e8 01             	sub    $0x1,%eax
     7ce:	6a 00                	push   $0x0
     7d0:	6a 00                	push   $0x0
     7d2:	50                   	push   %eax
     7d3:	6a 00                	push   $0x0
     7d5:	6a 00                	push   $0x0
     7d7:	ff 75 10             	pushl  0x10(%ebp)
     7da:	ff 75 0c             	pushl  0xc(%ebp)
     7dd:	ff 75 08             	pushl  0x8(%ebp)
     7e0:	e8 be 21 00 00       	call   29a3 <draw_line>
     7e5:	83 c4 20             	add    $0x20,%esp
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
     7e8:	8b 45 10             	mov    0x10(%ebp),%eax

void drawFinderWnd(Context context) {
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
     7eb:	8d 48 ff             	lea    -0x1(%eax),%ecx
     7ee:	8b 45 0c             	mov    0xc(%ebp),%eax
     7f1:	8d 50 ff             	lea    -0x1(%eax),%edx
     7f4:	8b 45 0c             	mov    0xc(%ebp),%eax
     7f7:	83 e8 01             	sub    $0x1,%eax
     7fa:	6a 00                	push   $0x0
     7fc:	51                   	push   %ecx
     7fd:	52                   	push   %edx
     7fe:	6a 00                	push   $0x0
     800:	50                   	push   %eax
     801:	ff 75 10             	pushl  0x10(%ebp)
     804:	ff 75 0c             	pushl  0xc(%ebp)
     807:	ff 75 08             	pushl  0x8(%ebp)
     80a:	e8 94 21 00 00       	call   29a3 <draw_line>
     80f:	83 c4 20             	add    $0x20,%esp
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     812:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     815:	8d 48 ff             	lea    -0x1(%eax),%ecx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     818:	8b 45 0c             	mov    0xc(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     81b:	8d 50 ff             	lea    -0x1(%eax),%edx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     81e:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     821:	83 e8 01             	sub    $0x1,%eax
     824:	6a 00                	push   $0x0
     826:	51                   	push   %ecx
     827:	52                   	push   %edx
     828:	50                   	push   %eax
     829:	6a 00                	push   $0x0
     82b:	ff 75 10             	pushl  0x10(%ebp)
     82e:	ff 75 0c             	pushl  0xc(%ebp)
     831:	ff 75 08             	pushl  0x8(%ebp)
     834:	e8 6a 21 00 00       	call   29a3 <draw_line>
     839:	83 c4 20             	add    $0x20,%esp
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0, context.height - 1, 0, 0, BORDERLINE_COLOR);
     83c:	8b 45 10             	mov    0x10(%ebp),%eax
     83f:	83 e8 01             	sub    $0x1,%eax
     842:	6a 00                	push   $0x0
     844:	6a 00                	push   $0x0
     846:	6a 00                	push   $0x0
     848:	50                   	push   %eax
     849:	6a 00                	push   $0x0
     84b:	ff 75 10             	pushl  0x10(%ebp)
     84e:	ff 75 0c             	pushl  0xc(%ebp)
     851:	ff 75 08             	pushl  0x8(%ebp)
     854:	e8 4a 21 00 00       	call   29a3 <draw_line>
     859:	83 c4 20             	add    $0x20,%esp
	fill_rect(context, 1, 1, context.width - 2, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT,
     85c:	8b 45 0c             	mov    0xc(%ebp),%eax
     85f:	83 e8 02             	sub    $0x2,%eax
     862:	68 18 c6 00 00       	push   $0xc618
     867:	6a 46                	push   $0x46
     869:	50                   	push   %eax
     86a:	6a 01                	push   $0x1
     86c:	6a 01                	push   $0x1
     86e:	ff 75 10             	pushl  0x10(%ebp)
     871:	ff 75 0c             	pushl  0xc(%ebp)
     874:	ff 75 08             	pushl  0x8(%ebp)
     877:	e8 61 1a 00 00       	call   22dd <fill_rect>
     87c:	83 c4 20             	add    $0x20,%esp
			TOOLSBAR_COLOR);
	puts_str(context, "Finder", 0, WINDOW_WIDTH / 2, 3);
     87f:	83 ec 04             	sub    $0x4,%esp
     882:	6a 03                	push   $0x3
     884:	68 2c 01 00 00       	push   $0x12c
     889:	6a 00                	push   $0x0
     88b:	68 c8 a4 00 00       	push   $0xa4c8
     890:	ff 75 10             	pushl  0x10(%ebp)
     893:	ff 75 0c             	pushl  0xc(%ebp)
     896:	ff 75 08             	pushl  0x8(%ebp)
     899:	e8 9a 1f 00 00       	call   2838 <puts_str>
     89e:	83 c4 20             	add    $0x20,%esp
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     8a1:	83 ec 0c             	sub    $0xc,%esp
     8a4:	6a 0c                	push   $0xc
     8a6:	68 c0 e6 00 00       	push   $0xe6c0
     8ab:	ff 75 10             	pushl  0x10(%ebp)
     8ae:	ff 75 0c             	pushl  0xc(%ebp)
     8b1:	ff 75 08             	pushl  0x8(%ebp)
     8b4:	e8 af 23 00 00       	call   2c68 <draw_iconlist>
     8b9:	83 c4 20             	add    $0x20,%esp


}
     8bc:	c9                   	leave  
     8bd:	c3                   	ret    

000008be <drawFinderContent>:

void drawFinderContent(Context context) {
     8be:	55                   	push   %ebp
     8bf:	89 e5                	mov    %esp,%ebp
     8c1:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *p;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
     8c4:	c7 45 f0 46 00 00 00 	movl   $0x46,-0x10(%ebp)
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
     8cb:	a1 84 e5 00 00       	mov    0xe584,%eax
     8d0:	83 f8 02             	cmp    $0x2,%eax
     8d3:	75 04                	jne    8d9 <drawFinderContent+0x1b>
     8d5:	83 45 f0 1c          	addl   $0x1c,-0x10(%ebp)
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
     8d9:	8b 45 10             	mov    0x10(%ebp),%eax
     8dc:	83 e8 48             	sub    $0x48,%eax
	struct fileItem *p;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
     8df:	89 c1                	mov    %eax,%ecx
     8e1:	8b 45 0c             	mov    0xc(%ebp),%eax
     8e4:	83 e8 02             	sub    $0x2,%eax
     8e7:	89 c2                	mov    %eax,%edx
     8e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8ec:	68 ff ff 00 00       	push   $0xffff
     8f1:	51                   	push   %ecx
     8f2:	52                   	push   %edx
     8f3:	50                   	push   %eax
     8f4:	6a 01                	push   $0x1
     8f6:	ff 75 10             	pushl  0x10(%ebp)
     8f9:	ff 75 0c             	pushl  0xc(%ebp)
     8fc:	ff 75 08             	pushl  0x8(%ebp)
     8ff:	e8 d9 19 00 00       	call   22dd <fill_rect>
     904:	83 c4 20             	add    $0x20,%esp
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     907:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     90a:	8d 48 ff             	lea    -0x1(%eax),%ecx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     90d:	8b 45 0c             	mov    0xc(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     910:	8d 50 ff             	lea    -0x1(%eax),%edx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     913:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     916:	83 e8 01             	sub    $0x1,%eax
     919:	6a 00                	push   $0x0
     91b:	51                   	push   %ecx
     91c:	52                   	push   %edx
     91d:	50                   	push   %eax
     91e:	6a 00                	push   $0x0
     920:	ff 75 10             	pushl  0x10(%ebp)
     923:	ff 75 0c             	pushl  0xc(%ebp)
     926:	ff 75 08             	pushl  0x8(%ebp)
     929:	e8 75 20 00 00       	call   29a3 <draw_line>
     92e:	83 c4 20             	add    $0x20,%esp
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);

	//printf(0, "listing complete!\n");
	//printItemList();
	p = fileItemList;
     931:	a1 44 ef 00 00       	mov    0xef44,%eax
     936:	89 45 f4             	mov    %eax,-0xc(%ebp)
	itemCounter = 0;
     939:	c7 05 48 ef 00 00 00 	movl   $0x0,0xef48
     940:	00 00 00 
	while (p != 0) {
     943:	eb 4b                	jmp    990 <drawFinderContent+0xd2>
		//printf(0, "draw item\n");
		drawItem(context, p->name, p->st, p->pos, p->chosen);
     945:	8b 45 f4             	mov    -0xc(%ebp),%eax
     948:	8b 40 28             	mov    0x28(%eax),%eax
     94b:	8b 55 f4             	mov    -0xc(%ebp),%edx
     94e:	8b 52 14             	mov    0x14(%edx),%edx
     951:	83 ec 08             	sub    $0x8,%esp
     954:	50                   	push   %eax
     955:	8b 45 f4             	mov    -0xc(%ebp),%eax
     958:	ff 70 24             	pushl  0x24(%eax)
     95b:	ff 70 20             	pushl  0x20(%eax)
     95e:	ff 70 1c             	pushl  0x1c(%eax)
     961:	ff 70 18             	pushl  0x18(%eax)
     964:	8b 45 f4             	mov    -0xc(%ebp),%eax
     967:	ff 70 10             	pushl  0x10(%eax)
     96a:	ff 70 0c             	pushl  0xc(%eax)
     96d:	ff 70 08             	pushl  0x8(%eax)
     970:	ff 70 04             	pushl  0x4(%eax)
     973:	ff 30                	pushl  (%eax)
     975:	52                   	push   %edx
     976:	ff 75 10             	pushl  0x10(%ebp)
     979:	ff 75 0c             	pushl  0xc(%ebp)
     97c:	ff 75 08             	pushl  0x8(%ebp)
     97f:	e8 d0 fa ff ff       	call   454 <drawItem>
     984:	83 c4 40             	add    $0x40,%esp
		p = p->next;
     987:	8b 45 f4             	mov    -0xc(%ebp),%eax
     98a:	8b 40 2c             	mov    0x2c(%eax),%eax
     98d:	89 45 f4             	mov    %eax,-0xc(%ebp)

	//printf(0, "listing complete!\n");
	//printItemList();
	p = fileItemList;
	itemCounter = 0;
	while (p != 0) {
     990:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     994:	75 af                	jne    945 <drawFinderContent+0x87>
		//printf(0, "draw item\n");
		drawItem(context, p->name, p->st, p->pos, p->chosen);
		p = p->next;
	}

	if (style == LIST_STYLE)
     996:	a1 84 e5 00 00       	mov    0xe584,%eax
     99b:	83 f8 02             	cmp    $0x2,%eax
     99e:	0f 85 a8 00 00 00    	jne    a4c <drawFinderContent+0x18e>
		{
			fill_rect(context, 1, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_FILENAME - 2, TAGBAR_HEIGHT, TAGBAR_COLOR);
     9a4:	68 14 a5 00 00       	push   $0xa514
     9a9:	6a 1c                	push   $0x1c
     9ab:	6a 26                	push   $0x26
     9ad:	6a 47                	push   $0x47
     9af:	6a 01                	push   $0x1
     9b1:	ff 75 10             	pushl  0x10(%ebp)
     9b4:	ff 75 0c             	pushl  0xc(%ebp)
     9b7:	ff 75 08             	pushl  0x8(%ebp)
     9ba:	e8 1e 19 00 00       	call   22dd <fill_rect>
     9bf:	83 c4 20             	add    $0x20,%esp
			fill_rect(context, LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     9c2:	68 14 a5 00 00       	push   $0xa514
     9c7:	6a 1c                	push   $0x1c
     9c9:	68 9f 00 00 00       	push   $0x9f
     9ce:	6a 47                	push   $0x47
     9d0:	6a 28                	push   $0x28
     9d2:	ff 75 10             	pushl  0x10(%ebp)
     9d5:	ff 75 0c             	pushl  0xc(%ebp)
     9d8:	ff 75 08             	pushl  0x8(%ebp)
     9db:	e8 fd 18 00 00       	call   22dd <fill_rect>
     9e0:	83 c4 20             	add    $0x20,%esp
			fill_rect(context, LIST_ITEM_SIZE, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, context.width - LIST_ITEM_SIZE - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     9e3:	8b 45 0c             	mov    0xc(%ebp),%eax
     9e6:	2d c9 00 00 00       	sub    $0xc9,%eax
     9eb:	68 14 a5 00 00       	push   $0xa514
     9f0:	6a 1c                	push   $0x1c
     9f2:	50                   	push   %eax
     9f3:	6a 47                	push   $0x47
     9f5:	68 c8 00 00 00       	push   $0xc8
     9fa:	ff 75 10             	pushl  0x10(%ebp)
     9fd:	ff 75 0c             	pushl  0xc(%ebp)
     a00:	ff 75 08             	pushl  0x8(%ebp)
     a03:	e8 d5 18 00 00       	call   22dd <fill_rect>
     a08:	83 c4 20             	add    $0x20,%esp
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     a0b:	83 ec 04             	sub    $0x4,%esp
     a0e:	6a 50                	push   $0x50
     a10:	6a 2b                	push   $0x2b
     a12:	6a 00                	push   $0x0
     a14:	68 cf a4 00 00       	push   $0xa4cf
     a19:	ff 75 10             	pushl  0x10(%ebp)
     a1c:	ff 75 0c             	pushl  0xc(%ebp)
     a1f:	ff 75 08             	pushl  0x8(%ebp)
     a22:	e8 11 1e 00 00       	call   2838 <puts_str>
     a27:	83 c4 20             	add    $0x20,%esp
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     a2a:	83 ec 04             	sub    $0x4,%esp
     a2d:	6a 50                	push   $0x50
     a2f:	68 cb 00 00 00       	push   $0xcb
     a34:	6a 00                	push   $0x0
     a36:	68 d4 a4 00 00       	push   $0xa4d4
     a3b:	ff 75 10             	pushl  0x10(%ebp)
     a3e:	ff 75 0c             	pushl  0xc(%ebp)
     a41:	ff 75 08             	pushl  0x8(%ebp)
     a44:	e8 ef 1d 00 00       	call   2838 <puts_str>
     a49:	83 c4 20             	add    $0x20,%esp
		}
}
     a4c:	c9                   	leave  
     a4d:	c3                   	ret    

00000a4e <int2str>:

char * int2str(int i)
{
     a4e:	55                   	push   %ebp
     a4f:	89 e5                	mov    %esp,%ebp
     a51:	53                   	push   %ebx
     a52:	83 ec 14             	sub    $0x14,%esp
	int j;
	int n = 0;
     a55:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	char *result = (char *)malloc(4*sizeof(char));
     a5c:	83 ec 0c             	sub    $0xc,%esp
     a5f:	6a 04                	push   $0x4
     a61:	e8 20 36 00 00       	call   4086 <malloc>
     a66:	83 c4 10             	add    $0x10,%esp
     a69:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
     a6c:	83 ec 0c             	sub    $0xc,%esp
     a6f:	6a 04                	push   $0x4
     a71:	e8 10 36 00 00       	call   4086 <malloc>
     a76:	83 c4 10             	add    $0x10,%esp
     a79:	89 45 e8             	mov    %eax,-0x18(%ebp)
	do{
		result[n++] = (i % 10) + '0';
     a7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a7f:	8d 50 01             	lea    0x1(%eax),%edx
     a82:	89 55 f0             	mov    %edx,-0x10(%ebp)
     a85:	89 c2                	mov    %eax,%edx
     a87:	8b 45 ec             	mov    -0x14(%ebp),%eax
     a8a:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     a8d:	8b 4d 08             	mov    0x8(%ebp),%ecx
     a90:	ba 67 66 66 66       	mov    $0x66666667,%edx
     a95:	89 c8                	mov    %ecx,%eax
     a97:	f7 ea                	imul   %edx
     a99:	c1 fa 02             	sar    $0x2,%edx
     a9c:	89 c8                	mov    %ecx,%eax
     a9e:	c1 f8 1f             	sar    $0x1f,%eax
     aa1:	29 c2                	sub    %eax,%edx
     aa3:	89 d0                	mov    %edx,%eax
     aa5:	c1 e0 02             	shl    $0x2,%eax
     aa8:	01 d0                	add    %edx,%eax
     aaa:	01 c0                	add    %eax,%eax
     aac:	29 c1                	sub    %eax,%ecx
     aae:	89 ca                	mov    %ecx,%edx
     ab0:	89 d0                	mov    %edx,%eax
     ab2:	83 c0 30             	add    $0x30,%eax
     ab5:	88 03                	mov    %al,(%ebx)
		i /= 10;
     ab7:	8b 4d 08             	mov    0x8(%ebp),%ecx
     aba:	ba 67 66 66 66       	mov    $0x66666667,%edx
     abf:	89 c8                	mov    %ecx,%eax
     ac1:	f7 ea                	imul   %edx
     ac3:	c1 fa 02             	sar    $0x2,%edx
     ac6:	89 c8                	mov    %ecx,%eax
     ac8:	c1 f8 1f             	sar    $0x1f,%eax
     acb:	29 c2                	sub    %eax,%edx
     acd:	89 d0                	mov    %edx,%eax
     acf:	89 45 08             	mov    %eax,0x8(%ebp)
	}while (i!=0);
     ad2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     ad6:	75 a4                	jne    a7c <int2str+0x2e>
	result[n] = 0;
     ad8:	8b 55 f0             	mov    -0x10(%ebp),%edx
     adb:	8b 45 ec             	mov    -0x14(%ebp),%eax
     ade:	01 d0                	add    %edx,%eax
     ae0:	c6 00 00             	movb   $0x0,(%eax)

	for (j = 0; j < n; j++)
     ae3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     aea:	eb 21                	jmp    b0d <int2str+0xbf>
	{
		temp[j] = result[n-1-j];
     aec:	8b 55 f4             	mov    -0xc(%ebp),%edx
     aef:	8b 45 e8             	mov    -0x18(%ebp),%eax
     af2:	01 c2                	add    %eax,%edx
     af4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     af7:	83 e8 01             	sub    $0x1,%eax
     afa:	2b 45 f4             	sub    -0xc(%ebp),%eax
     afd:	89 c1                	mov    %eax,%ecx
     aff:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b02:	01 c8                	add    %ecx,%eax
     b04:	0f b6 00             	movzbl (%eax),%eax
     b07:	88 02                	mov    %al,(%edx)
		result[n++] = (i % 10) + '0';
		i /= 10;
	}while (i!=0);
	result[n] = 0;

	for (j = 0; j < n; j++)
     b09:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     b0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b10:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     b13:	7c d7                	jl     aec <int2str+0x9e>
	{
		temp[j] = result[n-1-j];
	}
	temp[n] = 0;
     b15:	8b 55 f0             	mov    -0x10(%ebp),%edx
     b18:	8b 45 e8             	mov    -0x18(%ebp),%eax
     b1b:	01 d0                	add    %edx,%eax
     b1d:	c6 00 00             	movb   $0x0,(%eax)
	free(result);
     b20:	83 ec 0c             	sub    $0xc,%esp
     b23:	ff 75 ec             	pushl  -0x14(%ebp)
     b26:	e8 1a 34 00 00       	call   3f45 <free>
     b2b:	83 c4 10             	add    $0x10,%esp
	return temp;
     b2e:	8b 45 e8             	mov    -0x18(%ebp),%eax
}
     b31:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b34:	c9                   	leave  
     b35:	c3                   	ret    

00000b36 <printItemList>:

void printItemList() {
     b36:	55                   	push   %ebp
     b37:	89 e5                	mov    %esp,%ebp
     b39:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *p;
	p = fileItemList;
     b3c:	a1 44 ef 00 00       	mov    0xef44,%eax
     b41:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     b44:	eb 22                	jmp    b68 <printItemList+0x32>
		printf(0, "%s\n", p->name);
     b46:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b49:	8b 40 14             	mov    0x14(%eax),%eax
     b4c:	83 ec 04             	sub    $0x4,%esp
     b4f:	50                   	push   %eax
     b50:	68 d9 a4 00 00       	push   $0xa4d9
     b55:	6a 00                	push   $0x0
     b57:	e8 59 32 00 00       	call   3db5 <printf>
     b5c:	83 c4 10             	add    $0x10,%esp
		p = p->next;
     b5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b62:	8b 40 2c             	mov    0x2c(%eax),%eax
     b65:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void printItemList() {
	struct fileItem *p;
	p = fileItemList;
	while (p != 0) {
     b68:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     b6c:	75 d8                	jne    b46 <printItemList+0x10>
		printf(0, "%s\n", p->name);
		p = p->next;
	}
}
     b6e:	c9                   	leave  
     b6f:	c3                   	ret    

00000b70 <getPos>:

Rect getPos(Context context, int n) {
     b70:	55                   	push   %ebp
     b71:	89 e5                	mov    %esp,%ebp
     b73:	83 ec 28             	sub    $0x28,%esp
	if (style == ICON_STYLE) {
     b76:	a1 84 e5 00 00       	mov    0xe584,%eax
     b7b:	83 f8 01             	cmp    $0x1,%eax
     b7e:	75 6e                	jne    bee <getPos+0x7e>
		int m = context.width / (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
     b80:	8b 4d 10             	mov    0x10(%ebp),%ecx
     b83:	ba 7f e0 07 7e       	mov    $0x7e07e07f,%edx
     b88:	89 c8                	mov    %ecx,%eax
     b8a:	f7 ea                	imul   %edx
     b8c:	c1 fa 06             	sar    $0x6,%edx
     b8f:	89 c8                	mov    %ecx,%eax
     b91:	c1 f8 1f             	sar    $0x1f,%eax
     b94:	29 c2                	sub    %eax,%edx
     b96:	89 d0                	mov    %edx,%eax
     b98:	89 45 f4             	mov    %eax,-0xc(%ebp)
		int r = n / m;
     b9b:	8b 45 18             	mov    0x18(%ebp),%eax
     b9e:	99                   	cltd   
     b9f:	f7 7d f4             	idivl  -0xc(%ebp)
     ba2:	89 45 f0             	mov    %eax,-0x10(%ebp)
		int c = n % m;
     ba5:	8b 45 18             	mov    0x18(%ebp),%eax
     ba8:	99                   	cltd   
     ba9:	f7 7d f4             	idivl  -0xc(%ebp)
     bac:	89 55 ec             	mov    %edx,-0x14(%ebp)
		int y_top = r * (ICON_ITEM_HEIGHT + ICON_ITEM_GAP_Y)+ TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + ICON_ITEM_GAP_Y;
     baf:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bb2:	6b c0 73             	imul   $0x73,%eax,%eax
     bb5:	83 c0 5a             	add    $0x5a,%eax
     bb8:	89 45 e8             	mov    %eax,-0x18(%ebp)
		int x_left = c * (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
     bbb:	8b 45 ec             	mov    -0x14(%ebp),%eax
     bbe:	01 c0                	add    %eax,%eax
     bc0:	89 c2                	mov    %eax,%edx
     bc2:	c1 e2 06             	shl    $0x6,%edx
     bc5:	01 d0                	add    %edx,%eax
     bc7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		return initRect(x_left, y_top + scrollOffset, ICON_ITEM_WIDTH,
     bca:	8b 15 40 ef 00 00    	mov    0xef40,%edx
     bd0:	8b 45 e8             	mov    -0x18(%ebp),%eax
     bd3:	01 c2                	add    %eax,%edx
     bd5:	8b 45 08             	mov    0x8(%ebp),%eax
     bd8:	83 ec 0c             	sub    $0xc,%esp
     bdb:	6a 5f                	push   $0x5f
     bdd:	6a 64                	push   $0x64
     bdf:	52                   	push   %edx
     be0:	ff 75 e4             	pushl  -0x1c(%ebp)
     be3:	50                   	push   %eax
     be4:	e8 3f 28 00 00       	call   3428 <initRect>
     be9:	83 c4 1c             	add    $0x1c,%esp
     bec:	eb 2c                	jmp    c1a <getPos+0xaa>
				ICON_ITEM_HEIGHT);
	} else {
		return initRect(0, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT + n * (LIST_ITEM_HEIGHT + LIST_ITEM_GAP) + scrollOffset, context.width,
     bee:	8b 4d 10             	mov    0x10(%ebp),%ecx
     bf1:	8b 55 18             	mov    0x18(%ebp),%edx
     bf4:	89 d0                	mov    %edx,%eax
     bf6:	c1 e0 05             	shl    $0x5,%eax
     bf9:	29 d0                	sub    %edx,%eax
     bfb:	8d 50 62             	lea    0x62(%eax),%edx
     bfe:	a1 40 ef 00 00       	mov    0xef40,%eax
     c03:	01 c2                	add    %eax,%edx
     c05:	8b 45 08             	mov    0x8(%ebp),%eax
     c08:	83 ec 0c             	sub    $0xc,%esp
     c0b:	6a 1e                	push   $0x1e
     c0d:	51                   	push   %ecx
     c0e:	52                   	push   %edx
     c0f:	6a 00                	push   $0x0
     c11:	50                   	push   %eax
     c12:	e8 11 28 00 00       	call   3428 <initRect>
     c17:	83 c4 1c             	add    $0x1c,%esp
				LIST_ITEM_HEIGHT);
	}
}
     c1a:	8b 45 08             	mov    0x8(%ebp),%eax
     c1d:	c9                   	leave  
     c1e:	c2 04 00             	ret    $0x4

00000c21 <addItemEvent>:

// 事件处理相关操作
void addItemEvent(ClickableManager *cm, struct fileItem item) {
     c21:	55                   	push   %ebp
     c22:	89 e5                	mov    %esp,%ebp
     c24:	83 ec 08             	sub    $0x8,%esp
	if (style == ICON_STYLE) {
     c27:	a1 84 e5 00 00       	mov    0xe584,%eax
     c2c:	83 f8 01             	cmp    $0x1,%eax
     c2f:	75 0d                	jne    c3e <addItemEvent+0x1d>
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)
     c31:	8b 45 28             	mov    0x28(%ebp),%eax
     c34:	83 f8 45             	cmp    $0x45,%eax
     c37:	7f 12                	jg     c4b <addItemEvent+0x2a>
			return;
     c39:	e9 95 00 00 00       	jmp    cd3 <addItemEvent+0xb2>
	} else {
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)
     c3e:	8b 45 28             	mov    0x28(%ebp),%eax
     c41:	83 f8 61             	cmp    $0x61,%eax
     c44:	7f 05                	jg     c4b <addItemEvent+0x2a>
			return;
     c46:	e9 88 00 00 00       	jmp    cd3 <addItemEvent+0xb2>
	}
	switch (item.st.type) {
     c4b:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
     c4f:	98                   	cwtl   
     c50:	83 f8 01             	cmp    $0x1,%eax
     c53:	74 28                	je     c7d <addItemEvent+0x5c>
     c55:	83 f8 02             	cmp    $0x2,%eax
     c58:	75 67                	jne    cc1 <addItemEvent+0xa0>
	case T_FILE:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     c5a:	83 ec 04             	sub    $0x4,%esp
     c5d:	68 e0 1a 00 00       	push   $0x1ae0
     c62:	6a 02                	push   $0x2
     c64:	ff 75 30             	pushl  0x30(%ebp)
     c67:	ff 75 2c             	pushl  0x2c(%ebp)
     c6a:	ff 75 28             	pushl  0x28(%ebp)
     c6d:	ff 75 24             	pushl  0x24(%ebp)
     c70:	ff 75 08             	pushl  0x8(%ebp)
     c73:	e8 92 28 00 00       	call   350a <createClickable>
     c78:	83 c4 20             	add    $0x20,%esp
		break;
     c7b:	eb 56                	jmp    cd3 <addItemEvent+0xb2>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     c7d:	83 ec 04             	sub    $0x4,%esp
     c80:	68 e0 1a 00 00       	push   $0x1ae0
     c85:	6a 02                	push   $0x2
     c87:	ff 75 30             	pushl  0x30(%ebp)
     c8a:	ff 75 2c             	pushl  0x2c(%ebp)
     c8d:	ff 75 28             	pushl  0x28(%ebp)
     c90:	ff 75 24             	pushl  0x24(%ebp)
     c93:	ff 75 08             	pushl  0x8(%ebp)
     c96:	e8 6f 28 00 00       	call   350a <createClickable>
     c9b:	83 c4 20             	add    $0x20,%esp
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_enterDir);
     c9e:	83 ec 04             	sub    $0x4,%esp
     ca1:	68 67 11 00 00       	push   $0x1167
     ca6:	6a 04                	push   $0x4
     ca8:	ff 75 30             	pushl  0x30(%ebp)
     cab:	ff 75 2c             	pushl  0x2c(%ebp)
     cae:	ff 75 28             	pushl  0x28(%ebp)
     cb1:	ff 75 24             	pushl  0x24(%ebp)
     cb4:	ff 75 08             	pushl  0x8(%ebp)
     cb7:	e8 4e 28 00 00       	call   350a <createClickable>
     cbc:	83 c4 20             	add    $0x20,%esp
		break;
     cbf:	eb 12                	jmp    cd3 <addItemEvent+0xb2>
	default:
		printf(0, "unknown file type!");
     cc1:	83 ec 08             	sub    $0x8,%esp
     cc4:	68 dd a4 00 00       	push   $0xa4dd
     cc9:	6a 00                	push   $0x0
     ccb:	e8 e5 30 00 00       	call   3db5 <printf>
     cd0:	83 c4 10             	add    $0x10,%esp
	}
}
     cd3:	c9                   	leave  
     cd4:	c3                   	ret    

00000cd5 <addListEvent>:

void addListEvent(ClickableManager *cm) {
     cd5:	55                   	push   %ebp
     cd6:	89 e5                	mov    %esp,%ebp
     cd8:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
     cdb:	a1 44 ef 00 00       	mov    0xef44,%eax
     ce0:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     ce3:	eb 43                	jmp    d28 <addListEvent+0x53>
		temp = p;
     ce5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ce8:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
     ceb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cee:	8b 40 2c             	mov    0x2c(%eax),%eax
     cf1:	89 45 f4             	mov    %eax,-0xc(%ebp)
		addItemEvent(cm, *temp);
     cf4:	83 ec 0c             	sub    $0xc,%esp
     cf7:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cfa:	ff 70 2c             	pushl  0x2c(%eax)
     cfd:	ff 70 28             	pushl  0x28(%eax)
     d00:	ff 70 24             	pushl  0x24(%eax)
     d03:	ff 70 20             	pushl  0x20(%eax)
     d06:	ff 70 1c             	pushl  0x1c(%eax)
     d09:	ff 70 18             	pushl  0x18(%eax)
     d0c:	ff 70 14             	pushl  0x14(%eax)
     d0f:	ff 70 10             	pushl  0x10(%eax)
     d12:	ff 70 0c             	pushl  0xc(%eax)
     d15:	ff 70 08             	pushl  0x8(%eax)
     d18:	ff 70 04             	pushl  0x4(%eax)
     d1b:	ff 30                	pushl  (%eax)
     d1d:	ff 75 08             	pushl  0x8(%ebp)
     d20:	e8 fc fe ff ff       	call   c21 <addItemEvent>
     d25:	83 c4 40             	add    $0x40,%esp
}

void addListEvent(ClickableManager *cm) {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
     d28:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     d2c:	75 b7                	jne    ce5 <addListEvent+0x10>
		temp = p;
		p = p->next;
		addItemEvent(cm, *temp);
	}
}
     d2e:	c9                   	leave  
     d2f:	c3                   	ret    

00000d30 <addWndEvent>:

Handler wndEvents[] = { h_closeWnd, h_empty, h_chvm2, h_chvm1, h_newFolder,
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_copyFile, h_pasteFile };

void addWndEvent(ClickableManager *cm) {
     d30:	55                   	push   %ebp
     d31:	89 e5                	mov    %esp,%ebp
     d33:	57                   	push   %edi
     d34:	56                   	push   %esi
     d35:	53                   	push   %ebx
     d36:	83 ec 2c             	sub    $0x2c,%esp
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
     d39:	c7 45 e0 0c 00 00 00 	movl   $0xc,-0x20(%ebp)
	for (i = 0; i < n; i++) {
     d40:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     d47:	e9 81 00 00 00       	jmp    dcd <addWndEvent+0x9d>
		createClickable(cm,
     d4c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d4f:	8b 1c 85 40 e9 00 00 	mov    0xe940(,%eax,4),%ebx
     d56:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d59:	6b c0 34             	imul   $0x34,%eax,%eax
     d5c:	83 c0 20             	add    $0x20,%eax
     d5f:	05 c0 e6 00 00       	add    $0xe6c0,%eax
     d64:	8b 78 10             	mov    0x10(%eax),%edi
     d67:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d6a:	6b c0 34             	imul   $0x34,%eax,%eax
     d6d:	83 c0 20             	add    $0x20,%eax
     d70:	05 c0 e6 00 00       	add    $0xe6c0,%eax
     d75:	8b 70 0c             	mov    0xc(%eax),%esi
     d78:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d7b:	6b c0 34             	imul   $0x34,%eax,%eax
     d7e:	83 c0 20             	add    $0x20,%eax
     d81:	05 c0 e6 00 00       	add    $0xe6c0,%eax
     d86:	8b 48 04             	mov    0x4(%eax),%ecx
     d89:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d8c:	6b c0 34             	imul   $0x34,%eax,%eax
     d8f:	83 c0 20             	add    $0x20,%eax
     d92:	05 c0 e6 00 00       	add    $0xe6c0,%eax
     d97:	8b 10                	mov    (%eax),%edx
     d99:	8d 45 d0             	lea    -0x30(%ebp),%eax
     d9c:	83 ec 0c             	sub    $0xc,%esp
     d9f:	57                   	push   %edi
     da0:	56                   	push   %esi
     da1:	51                   	push   %ecx
     da2:	52                   	push   %edx
     da3:	50                   	push   %eax
     da4:	e8 7f 26 00 00       	call   3428 <initRect>
     da9:	83 c4 1c             	add    $0x1c,%esp
     dac:	83 ec 04             	sub    $0x4,%esp
     daf:	53                   	push   %ebx
     db0:	6a 02                	push   $0x2
     db2:	ff 75 dc             	pushl  -0x24(%ebp)
     db5:	ff 75 d8             	pushl  -0x28(%ebp)
     db8:	ff 75 d4             	pushl  -0x2c(%ebp)
     dbb:	ff 75 d0             	pushl  -0x30(%ebp)
     dbe:	ff 75 08             	pushl  0x8(%ebp)
     dc1:	e8 44 27 00 00       	call   350a <createClickable>
     dc6:	83 c4 20             	add    $0x20,%esp
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_copyFile, h_pasteFile };

void addWndEvent(ClickableManager *cm) {
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
	for (i = 0; i < n; i++) {
     dc9:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
     dcd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     dd0:	3b 45 e0             	cmp    -0x20(%ebp),%eax
     dd3:	0f 8c 73 ff ff ff    	jl     d4c <addWndEvent+0x1c>
		createClickable(cm,
				initRect(wndRes[i].position_x, wndRes[i].position_y,
						wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
				wndEvents[i]);
	}
}
     dd9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ddc:	5b                   	pop    %ebx
     ddd:	5e                   	pop    %esi
     dde:	5f                   	pop    %edi
     ddf:	5d                   	pop    %ebp
     de0:	c3                   	ret    

00000de1 <getFileItem>:

struct fileItem * getFileItem(Point point) {
     de1:	55                   	push   %ebp
     de2:	89 e5                	mov    %esp,%ebp
     de4:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *p = fileItemList;
     de7:	a1 44 ef 00 00       	mov    0xef44,%eax
     dec:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     def:	eb 32                	jmp    e23 <getFileItem+0x42>
		if (isIn(point, p->pos)) {
     df1:	83 ec 08             	sub    $0x8,%esp
     df4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     df7:	ff 70 24             	pushl  0x24(%eax)
     dfa:	ff 70 20             	pushl  0x20(%eax)
     dfd:	ff 70 1c             	pushl  0x1c(%eax)
     e00:	ff 70 18             	pushl  0x18(%eax)
     e03:	ff 75 0c             	pushl  0xc(%ebp)
     e06:	ff 75 08             	pushl  0x8(%ebp)
     e09:	e8 6b 26 00 00       	call   3479 <isIn>
     e0e:	83 c4 20             	add    $0x20,%esp
     e11:	85 c0                	test   %eax,%eax
     e13:	74 05                	je     e1a <getFileItem+0x39>
			return p;
     e15:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e18:	eb 14                	jmp    e2e <getFileItem+0x4d>
		}
		p = p->next;
     e1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e1d:	8b 40 2c             	mov    0x2c(%eax),%eax
     e20:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
}

struct fileItem * getFileItem(Point point) {
	struct fileItem *p = fileItemList;
	while (p != 0) {
     e23:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e27:	75 c8                	jne    df1 <getFileItem+0x10>
		if (isIn(point, p->pos)) {
			return p;
		}
		p = p->next;
	}
	return 0;
     e29:	b8 00 00 00 00       	mov    $0x0,%eax
}
     e2e:	c9                   	leave  
     e2f:	c3                   	ret    

00000e30 <scrollDown>:

void scrollDown() {
     e30:	55                   	push   %ebp
     e31:	89 e5                	mov    %esp,%ebp
     e33:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *q = fileItemList;
     e36:	a1 44 ef 00 00       	mov    0xef44,%eax
     e3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// while (q != 0)
	// {
	// 	p = q;
	// 	q = q->next;
	// }
	if (style == ICON_STYLE){
     e3e:	a1 84 e5 00 00       	mov    0xe584,%eax
     e43:	83 f8 01             	cmp    $0x1,%eax
     e46:	75 44                	jne    e8c <scrollDown+0x5c>
		if(q->pos.start.y > (WINDOW_HEIGHT - ICON_ITEM_HEIGHT)){
     e48:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e4b:	8b 40 1c             	mov    0x1c(%eax),%eax
     e4e:	3d 63 01 00 00       	cmp    $0x163,%eax
     e53:	7e 79                	jle    ece <scrollDown+0x9e>
			if(q->pos.start.y > WINDOW_HEIGHT){
     e55:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e58:	8b 40 1c             	mov    0x1c(%eax),%eax
     e5b:	3d c2 01 00 00       	cmp    $0x1c2,%eax
     e60:	7e 0f                	jle    e71 <scrollDown+0x41>
				scrollOffset -= SCROLL_UNIT;
     e62:	a1 40 ef 00 00       	mov    0xef40,%eax
     e67:	83 e8 1e             	sub    $0x1e,%eax
     e6a:	a3 40 ef 00 00       	mov    %eax,0xef40
     e6f:	eb 5d                	jmp    ece <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - ICON_ITEM_HEIGHT));
     e71:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e74:	8b 40 1c             	mov    0x1c(%eax),%eax
     e77:	ba 63 01 00 00       	mov    $0x163,%edx
     e7c:	29 c2                	sub    %eax,%edx
     e7e:	a1 40 ef 00 00       	mov    0xef40,%eax
     e83:	01 d0                	add    %edx,%eax
     e85:	a3 40 ef 00 00       	mov    %eax,0xef40
     e8a:	eb 42                	jmp    ece <scrollDown+0x9e>
			}
		}
	}
	else{
		if(q->pos.start.y > (WINDOW_HEIGHT - LIST_ITEM_HEIGHT)){
     e8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e8f:	8b 40 1c             	mov    0x1c(%eax),%eax
     e92:	3d a4 01 00 00       	cmp    $0x1a4,%eax
     e97:	7e 35                	jle    ece <scrollDown+0x9e>
			if(q->pos.start.y > WINDOW_HEIGHT){
     e99:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e9c:	8b 40 1c             	mov    0x1c(%eax),%eax
     e9f:	3d c2 01 00 00       	cmp    $0x1c2,%eax
     ea4:	7e 0f                	jle    eb5 <scrollDown+0x85>
				scrollOffset -= SCROLL_UNIT;
     ea6:	a1 40 ef 00 00       	mov    0xef40,%eax
     eab:	83 e8 1e             	sub    $0x1e,%eax
     eae:	a3 40 ef 00 00       	mov    %eax,0xef40
     eb3:	eb 19                	jmp    ece <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - LIST_ITEM_HEIGHT));
     eb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     eb8:	8b 40 1c             	mov    0x1c(%eax),%eax
     ebb:	ba a4 01 00 00       	mov    $0x1a4,%edx
     ec0:	29 c2                	sub    %eax,%edx
     ec2:	a1 40 ef 00 00       	mov    0xef40,%eax
     ec7:	01 d0                	add    %edx,%eax
     ec9:	a3 40 ef 00 00       	mov    %eax,0xef40
			}
		}
	}
	//printf(0, "tryingToScrollDown, current Offset %d\n", scrollOffset);
	printf(0, "scrollDown, current Offset %d\n", scrollOffset);
     ece:	a1 40 ef 00 00       	mov    0xef40,%eax
     ed3:	83 ec 04             	sub    $0x4,%esp
     ed6:	50                   	push   %eax
     ed7:	68 f0 a4 00 00       	push   $0xa4f0
     edc:	6a 00                	push   $0x0
     ede:	e8 d2 2e 00 00       	call   3db5 <printf>
     ee3:	83 c4 10             	add    $0x10,%esp
}
     ee6:	c9                   	leave  
     ee7:	c3                   	ret    

00000ee8 <h_scrollDown>:

void h_scrollDown(Point p) {
     ee8:	55                   	push   %ebp
     ee9:	89 e5                	mov    %esp,%ebp
     eeb:	83 ec 18             	sub    $0x18,%esp
	scrollDown();
     eee:	e8 3d ff ff ff       	call   e30 <scrollDown>
	freeFileItemList();
     ef3:	e8 cf f1 ff ff       	call   c7 <freeFileItemList>
	list(".");
     ef8:	83 ec 0c             	sub    $0xc,%esp
     efb:	68 0f a5 00 00       	push   $0xa50f
     f00:	e8 ac f2 ff ff       	call   1b1 <list>
     f05:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
     f08:	83 ec 04             	sub    $0x4,%esp
     f0b:	ff 35 30 1f 01 00    	pushl  0x11f30
     f11:	ff 35 2c 1f 01 00    	pushl  0x11f2c
     f17:	ff 35 28 1f 01 00    	pushl  0x11f28
     f1d:	e8 9c f9 ff ff       	call   8be <drawFinderContent>
     f22:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
     f25:	83 ec 04             	sub    $0x4,%esp
     f28:	ff 35 30 1f 01 00    	pushl  0x11f30
     f2e:	ff 35 2c 1f 01 00    	pushl  0x11f2c
     f34:	ff 35 28 1f 01 00    	pushl  0x11f28
     f3a:	e8 83 f8 ff ff       	call   7c2 <drawFinderWnd>
     f3f:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
     f42:	8d 45 e8             	lea    -0x18(%ebp),%eax
     f45:	83 ec 0c             	sub    $0xc,%esp
     f48:	68 58 02 00 00       	push   $0x258
     f4d:	68 20 03 00 00       	push   $0x320
     f52:	6a 00                	push   $0x0
     f54:	6a 00                	push   $0x0
     f56:	50                   	push   %eax
     f57:	e8 cc 24 00 00       	call   3428 <initRect>
     f5c:	83 c4 1c             	add    $0x1c,%esp
     f5f:	83 ec 0c             	sub    $0xc,%esp
     f62:	ff 75 f4             	pushl  -0xc(%ebp)
     f65:	ff 75 f0             	pushl  -0x10(%ebp)
     f68:	ff 75 ec             	pushl  -0x14(%ebp)
     f6b:	ff 75 e8             	pushl  -0x18(%ebp)
     f6e:	68 34 1f 01 00       	push   $0x11f34
     f73:	e8 75 26 00 00       	call   35ed <deleteClickable>
     f78:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
     f7b:	83 ec 0c             	sub    $0xc,%esp
     f7e:	68 34 1f 01 00       	push   $0x11f34
     f83:	e8 a8 fd ff ff       	call   d30 <addWndEvent>
     f88:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
     f8b:	83 ec 0c             	sub    $0xc,%esp
     f8e:	68 34 1f 01 00       	push   $0x11f34
     f93:	e8 3d fd ff ff       	call   cd5 <addListEvent>
     f98:	83 c4 10             	add    $0x10,%esp
}
     f9b:	c9                   	leave  
     f9c:	c3                   	ret    

00000f9d <scrollUp>:

void scrollUp() {
     f9d:	55                   	push   %ebp
     f9e:	89 e5                	mov    %esp,%ebp
     fa0:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *q = fileItemList;
     fa3:	a1 44 ef 00 00       	mov    0xef44,%eax
     fa8:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p;
	while (q != 0)
     fab:	eb 0f                	jmp    fbc <scrollUp+0x1f>
	{
		p = q;
     fad:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fb0:	89 45 f0             	mov    %eax,-0x10(%ebp)
		q = q->next;
     fb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fb6:	8b 40 2c             	mov    0x2c(%eax),%eax
     fb9:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void scrollUp() {
	struct fileItem *q = fileItemList;
	struct fileItem *p;
	while (q != 0)
     fbc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     fc0:	75 eb                	jne    fad <scrollUp+0x10>
	{
		p = q;
		q = q->next;
	}
	if (style == ICON_STYLE){
     fc2:	a1 84 e5 00 00       	mov    0xe584,%eax
     fc7:	83 f8 01             	cmp    $0x1,%eax
     fca:	75 40                	jne    100c <scrollUp+0x6f>
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)){
     fcc:	8b 45 f0             	mov    -0x10(%ebp),%eax
     fcf:	8b 40 1c             	mov    0x1c(%eax),%eax
     fd2:	83 f8 45             	cmp    $0x45,%eax
     fd5:	7f 73                	jg     104a <scrollUp+0xad>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - ICON_ITEM_HEIGHT)){
     fd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
     fda:	8b 40 1c             	mov    0x1c(%eax),%eax
     fdd:	83 f8 e7             	cmp    $0xffffffe7,%eax
     fe0:	7d 0f                	jge    ff1 <scrollUp+0x54>
				scrollOffset += SCROLL_UNIT;
     fe2:	a1 40 ef 00 00       	mov    0xef40,%eax
     fe7:	83 c0 1e             	add    $0x1e,%eax
     fea:	a3 40 ef 00 00       	mov    %eax,0xef40
     fef:	eb 59                	jmp    104a <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT));
     ff1:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ff4:	8b 40 1c             	mov    0x1c(%eax),%eax
     ff7:	ba 46 00 00 00       	mov    $0x46,%edx
     ffc:	29 c2                	sub    %eax,%edx
     ffe:	a1 40 ef 00 00       	mov    0xef40,%eax
    1003:	01 d0                	add    %edx,%eax
    1005:	a3 40 ef 00 00       	mov    %eax,0xef40
    100a:	eb 3e                	jmp    104a <scrollUp+0xad>
			}
		}
	}
	else{
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)){
    100c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    100f:	8b 40 1c             	mov    0x1c(%eax),%eax
    1012:	83 f8 61             	cmp    $0x61,%eax
    1015:	7f 33                	jg     104a <scrollUp+0xad>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - LIST_ITEM_HEIGHT)){
    1017:	8b 45 f0             	mov    -0x10(%ebp),%eax
    101a:	8b 40 1c             	mov    0x1c(%eax),%eax
    101d:	83 f8 43             	cmp    $0x43,%eax
    1020:	7f 0f                	jg     1031 <scrollUp+0x94>
				scrollOffset += SCROLL_UNIT;
    1022:	a1 40 ef 00 00       	mov    0xef40,%eax
    1027:	83 c0 1e             	add    $0x1e,%eax
    102a:	a3 40 ef 00 00       	mov    %eax,0xef40
    102f:	eb 19                	jmp    104a <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT));
    1031:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1034:	8b 40 1c             	mov    0x1c(%eax),%eax
    1037:	ba 62 00 00 00       	mov    $0x62,%edx
    103c:	29 c2                	sub    %eax,%edx
    103e:	a1 40 ef 00 00       	mov    0xef40,%eax
    1043:	01 d0                	add    %edx,%eax
    1045:	a3 40 ef 00 00       	mov    %eax,0xef40
			}
		}
	}
	//printf(0, "tryingToScrollUp, current Offset %d\n", scrollOffset);
	printf(0, "scrollUp, current Offset %d\n", scrollOffset);
    104a:	a1 40 ef 00 00       	mov    0xef40,%eax
    104f:	83 ec 04             	sub    $0x4,%esp
    1052:	50                   	push   %eax
    1053:	68 11 a5 00 00       	push   $0xa511
    1058:	6a 00                	push   $0x0
    105a:	e8 56 2d 00 00       	call   3db5 <printf>
    105f:	83 c4 10             	add    $0x10,%esp
}
    1062:	c9                   	leave  
    1063:	c3                   	ret    

00001064 <h_scrollUp>:

void h_scrollUp(Point p) {
    1064:	55                   	push   %ebp
    1065:	89 e5                	mov    %esp,%ebp
    1067:	83 ec 18             	sub    $0x18,%esp
	scrollUp();
    106a:	e8 2e ff ff ff       	call   f9d <scrollUp>
	freeFileItemList();
    106f:	e8 53 f0 ff ff       	call   c7 <freeFileItemList>
	list(".");
    1074:	83 ec 0c             	sub    $0xc,%esp
    1077:	68 0f a5 00 00       	push   $0xa50f
    107c:	e8 30 f1 ff ff       	call   1b1 <list>
    1081:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    1084:	83 ec 04             	sub    $0x4,%esp
    1087:	ff 35 30 1f 01 00    	pushl  0x11f30
    108d:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    1093:	ff 35 28 1f 01 00    	pushl  0x11f28
    1099:	e8 20 f8 ff ff       	call   8be <drawFinderContent>
    109e:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    10a1:	83 ec 04             	sub    $0x4,%esp
    10a4:	ff 35 30 1f 01 00    	pushl  0x11f30
    10aa:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    10b0:	ff 35 28 1f 01 00    	pushl  0x11f28
    10b6:	e8 07 f7 ff ff       	call   7c2 <drawFinderWnd>
    10bb:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    10be:	8d 45 e8             	lea    -0x18(%ebp),%eax
    10c1:	83 ec 0c             	sub    $0xc,%esp
    10c4:	68 58 02 00 00       	push   $0x258
    10c9:	68 20 03 00 00       	push   $0x320
    10ce:	6a 00                	push   $0x0
    10d0:	6a 00                	push   $0x0
    10d2:	50                   	push   %eax
    10d3:	e8 50 23 00 00       	call   3428 <initRect>
    10d8:	83 c4 1c             	add    $0x1c,%esp
    10db:	83 ec 0c             	sub    $0xc,%esp
    10de:	ff 75 f4             	pushl  -0xc(%ebp)
    10e1:	ff 75 f0             	pushl  -0x10(%ebp)
    10e4:	ff 75 ec             	pushl  -0x14(%ebp)
    10e7:	ff 75 e8             	pushl  -0x18(%ebp)
    10ea:	68 34 1f 01 00       	push   $0x11f34
    10ef:	e8 f9 24 00 00       	call   35ed <deleteClickable>
    10f4:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    10f7:	83 ec 0c             	sub    $0xc,%esp
    10fa:	68 34 1f 01 00       	push   $0x11f34
    10ff:	e8 2c fc ff ff       	call   d30 <addWndEvent>
    1104:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1107:	83 ec 0c             	sub    $0xc,%esp
    110a:	68 34 1f 01 00       	push   $0x11f34
    110f:	e8 c1 fb ff ff       	call   cd5 <addListEvent>
    1114:	83 c4 10             	add    $0x10,%esp
}
    1117:	c9                   	leave  
    1118:	c3                   	ret    

00001119 <enterDir>:

// Handlers
void enterDir(char *name) {
    1119:	55                   	push   %ebp
    111a:	89 e5                	mov    %esp,%ebp
    111c:	83 ec 08             	sub    $0x8,%esp
	scrollOffset = 0;
    111f:	c7 05 40 ef 00 00 00 	movl   $0x0,0xef40
    1126:	00 00 00 
	printf(0, "entering : %s\n", name);
    1129:	83 ec 04             	sub    $0x4,%esp
    112c:	ff 75 08             	pushl  0x8(%ebp)
    112f:	68 2e a5 00 00       	push   $0xa52e
    1134:	6a 00                	push   $0x0
    1136:	e8 7a 2c 00 00       	call   3db5 <printf>
    113b:	83 c4 10             	add    $0x10,%esp
	if (chdir(name) < 0)
    113e:	83 ec 0c             	sub    $0xc,%esp
    1141:	ff 75 08             	pushl  0x8(%ebp)
    1144:	e8 ff 2a 00 00       	call   3c48 <chdir>
    1149:	83 c4 10             	add    $0x10,%esp
    114c:	85 c0                	test   %eax,%eax
    114e:	79 15                	jns    1165 <enterDir+0x4c>
		printf(2, "cannot cd %s\n", name);
    1150:	83 ec 04             	sub    $0x4,%esp
    1153:	ff 75 08             	pushl  0x8(%ebp)
    1156:	68 3d a5 00 00       	push   $0xa53d
    115b:	6a 02                	push   $0x2
    115d:	e8 53 2c 00 00       	call   3db5 <printf>
    1162:	83 c4 10             	add    $0x10,%esp
}
    1165:	c9                   	leave  
    1166:	c3                   	ret    

00001167 <h_enterDir>:

void h_enterDir(Point p) {
    1167:	55                   	push   %ebp
    1168:	89 e5                	mov    %esp,%ebp
    116a:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = getFileItem(p);
    116d:	83 ec 08             	sub    $0x8,%esp
    1170:	ff 75 0c             	pushl  0xc(%ebp)
    1173:	ff 75 08             	pushl  0x8(%ebp)
    1176:	e8 66 fc ff ff       	call   de1 <getFileItem>
    117b:	83 c4 10             	add    $0x10,%esp
    117e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	enterDir(temp->name);
    1181:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1184:	8b 40 14             	mov    0x14(%eax),%eax
    1187:	83 ec 0c             	sub    $0xc,%esp
    118a:	50                   	push   %eax
    118b:	e8 89 ff ff ff       	call   1119 <enterDir>
    1190:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    1193:	e8 2f ef ff ff       	call   c7 <freeFileItemList>
	list(".");
    1198:	83 ec 0c             	sub    $0xc,%esp
    119b:	68 0f a5 00 00       	push   $0xa50f
    11a0:	e8 0c f0 ff ff       	call   1b1 <list>
    11a5:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    11a8:	83 ec 04             	sub    $0x4,%esp
    11ab:	ff 35 30 1f 01 00    	pushl  0x11f30
    11b1:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    11b7:	ff 35 28 1f 01 00    	pushl  0x11f28
    11bd:	e8 fc f6 ff ff       	call   8be <drawFinderContent>
    11c2:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    11c5:	83 ec 04             	sub    $0x4,%esp
    11c8:	ff 35 30 1f 01 00    	pushl  0x11f30
    11ce:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    11d4:	ff 35 28 1f 01 00    	pushl  0x11f28
    11da:	e8 e3 f5 ff ff       	call   7c2 <drawFinderWnd>
    11df:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    11e2:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    11e5:	83 ec 0c             	sub    $0xc,%esp
    11e8:	68 58 02 00 00       	push   $0x258
    11ed:	68 20 03 00 00       	push   $0x320
    11f2:	6a 00                	push   $0x0
    11f4:	6a 00                	push   $0x0
    11f6:	50                   	push   %eax
    11f7:	e8 2c 22 00 00       	call   3428 <initRect>
    11fc:	83 c4 1c             	add    $0x1c,%esp
    11ff:	83 ec 0c             	sub    $0xc,%esp
    1202:	ff 75 f0             	pushl  -0x10(%ebp)
    1205:	ff 75 ec             	pushl  -0x14(%ebp)
    1208:	ff 75 e8             	pushl  -0x18(%ebp)
    120b:	ff 75 e4             	pushl  -0x1c(%ebp)
    120e:	68 34 1f 01 00       	push   $0x11f34
    1213:	e8 d5 23 00 00       	call   35ed <deleteClickable>
    1218:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    121b:	83 ec 0c             	sub    $0xc,%esp
    121e:	68 34 1f 01 00       	push   $0x11f34
    1223:	e8 08 fb ff ff       	call   d30 <addWndEvent>
    1228:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    122b:	83 ec 0c             	sub    $0xc,%esp
    122e:	68 34 1f 01 00       	push   $0x11f34
    1233:	e8 9d fa ff ff       	call   cd5 <addListEvent>
    1238:	83 c4 10             	add    $0x10,%esp
}
    123b:	c9                   	leave  
    123c:	c3                   	ret    

0000123d <newFile>:

void newFile(char *name) {
    123d:	55                   	push   %ebp
    123e:	89 e5                	mov    %esp,%ebp
    1240:	83 ec 18             	sub    $0x18,%esp
	int fd;
	int n = strlen(name);
    1243:	83 ec 0c             	sub    $0xc,%esp
    1246:	ff 75 08             	pushl  0x8(%ebp)
    1249:	e8 c9 27 00 00       	call   3a17 <strlen>
    124e:	83 c4 10             	add    $0x10,%esp
    1251:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 8;
    1254:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
	int counter;
	while ((fd = open(name, 0)) > 0)
    125b:	eb 70                	jmp    12cd <newFile+0x90>
	{
		n = strlen(name);
    125d:	83 ec 0c             	sub    $0xc,%esp
    1260:	ff 75 08             	pushl  0x8(%ebp)
    1263:	e8 af 27 00 00       	call   3a17 <strlen>
    1268:	83 c4 10             	add    $0x10,%esp
    126b:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    126e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1271:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1274:	75 09                	jne    127f <newFile+0x42>
		{
			counter = 1;
    1276:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    127d:	eb 1b                	jmp    129a <newFile+0x5d>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    127f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1282:	8b 45 08             	mov    0x8(%ebp),%eax
    1285:	01 d0                	add    %edx,%eax
    1287:	83 ec 0c             	sub    $0xc,%esp
    128a:	50                   	push   %eax
    128b:	e8 b6 28 00 00       	call   3b46 <atoi>
    1290:	83 c4 10             	add    $0x10,%esp
    1293:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    1296:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    129a:	83 ec 0c             	sub    $0xc,%esp
    129d:	ff 75 f4             	pushl  -0xc(%ebp)
    12a0:	e8 a9 f7 ff ff       	call   a4e <int2str>
    12a5:	83 c4 10             	add    $0x10,%esp
    12a8:	89 c1                	mov    %eax,%ecx
    12aa:	8b 55 ec             	mov    -0x14(%ebp),%edx
    12ad:	8b 45 08             	mov    0x8(%ebp),%eax
    12b0:	01 d0                	add    %edx,%eax
    12b2:	83 ec 08             	sub    $0x8,%esp
    12b5:	51                   	push   %ecx
    12b6:	50                   	push   %eax
    12b7:	e8 ec 26 00 00       	call   39a8 <strcpy>
    12bc:	83 c4 10             	add    $0x10,%esp
		close(fd);
    12bf:	83 ec 0c             	sub    $0xc,%esp
    12c2:	ff 75 e8             	pushl  -0x18(%ebp)
    12c5:	e8 36 29 00 00       	call   3c00 <close>
    12ca:	83 c4 10             	add    $0x10,%esp
void newFile(char *name) {
	int fd;
	int n = strlen(name);
	int baseLen = 8;
	int counter;
	while ((fd = open(name, 0)) > 0)
    12cd:	83 ec 08             	sub    $0x8,%esp
    12d0:	6a 00                	push   $0x0
    12d2:	ff 75 08             	pushl  0x8(%ebp)
    12d5:	e8 3e 29 00 00       	call   3c18 <open>
    12da:	83 c4 10             	add    $0x10,%esp
    12dd:	89 45 e8             	mov    %eax,-0x18(%ebp)
    12e0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    12e4:	0f 8f 73 ff ff ff    	jg     125d <newFile+0x20>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		close(fd);
	}
	if ((fd = open(name, O_CREATE)) < 0) {
    12ea:	83 ec 08             	sub    $0x8,%esp
    12ed:	68 00 02 00 00       	push   $0x200
    12f2:	ff 75 08             	pushl  0x8(%ebp)
    12f5:	e8 1e 29 00 00       	call   3c18 <open>
    12fa:	83 c4 10             	add    $0x10,%esp
    12fd:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1300:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1304:	79 1a                	jns    1320 <newFile+0xe3>
		printf(0, "cat: cannot open %s\n", name);
    1306:	83 ec 04             	sub    $0x4,%esp
    1309:	ff 75 08             	pushl  0x8(%ebp)
    130c:	68 4b a5 00 00       	push   $0xa54b
    1311:	6a 00                	push   $0x0
    1313:	e8 9d 2a 00 00       	call   3db5 <printf>
    1318:	83 c4 10             	add    $0x10,%esp
		exit();
    131b:	e8 b8 28 00 00       	call   3bd8 <exit>
	}
	close(fd);
    1320:	83 ec 0c             	sub    $0xc,%esp
    1323:	ff 75 e8             	pushl  -0x18(%ebp)
    1326:	e8 d5 28 00 00       	call   3c00 <close>
    132b:	83 c4 10             	add    $0x10,%esp
}
    132e:	c9                   	leave  
    132f:	c3                   	ret    

00001330 <h_newFile>:

void h_newFile(Point p) {
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	83 ec 38             	sub    $0x38,%esp
	char nf[32] = "file.txt";
    1336:	c7 45 c8 66 69 6c 65 	movl   $0x656c6966,-0x38(%ebp)
    133d:	c7 45 cc 2e 74 78 74 	movl   $0x7478742e,-0x34(%ebp)
    1344:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    134b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    1352:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1359:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    1360:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1367:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFile(nf);
    136e:	83 ec 0c             	sub    $0xc,%esp
    1371:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1374:	50                   	push   %eax
    1375:	e8 c3 fe ff ff       	call   123d <newFile>
    137a:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    137d:	e8 45 ed ff ff       	call   c7 <freeFileItemList>
	list(".");
    1382:	83 ec 0c             	sub    $0xc,%esp
    1385:	68 0f a5 00 00       	push   $0xa50f
    138a:	e8 22 ee ff ff       	call   1b1 <list>
    138f:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    1392:	83 ec 04             	sub    $0x4,%esp
    1395:	ff 35 30 1f 01 00    	pushl  0x11f30
    139b:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    13a1:	ff 35 28 1f 01 00    	pushl  0x11f28
    13a7:	e8 12 f5 ff ff       	call   8be <drawFinderContent>
    13ac:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    13af:	83 ec 04             	sub    $0x4,%esp
    13b2:	ff 35 30 1f 01 00    	pushl  0x11f30
    13b8:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    13be:	ff 35 28 1f 01 00    	pushl  0x11f28
    13c4:	e8 f9 f3 ff ff       	call   7c2 <drawFinderWnd>
    13c9:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    13cc:	8d 45 e8             	lea    -0x18(%ebp),%eax
    13cf:	83 ec 0c             	sub    $0xc,%esp
    13d2:	68 58 02 00 00       	push   $0x258
    13d7:	68 20 03 00 00       	push   $0x320
    13dc:	6a 00                	push   $0x0
    13de:	6a 00                	push   $0x0
    13e0:	50                   	push   %eax
    13e1:	e8 42 20 00 00       	call   3428 <initRect>
    13e6:	83 c4 1c             	add    $0x1c,%esp
    13e9:	83 ec 0c             	sub    $0xc,%esp
    13ec:	ff 75 f4             	pushl  -0xc(%ebp)
    13ef:	ff 75 f0             	pushl  -0x10(%ebp)
    13f2:	ff 75 ec             	pushl  -0x14(%ebp)
    13f5:	ff 75 e8             	pushl  -0x18(%ebp)
    13f8:	68 34 1f 01 00       	push   $0x11f34
    13fd:	e8 eb 21 00 00       	call   35ed <deleteClickable>
    1402:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1405:	83 ec 0c             	sub    $0xc,%esp
    1408:	68 34 1f 01 00       	push   $0x11f34
    140d:	e8 1e f9 ff ff       	call   d30 <addWndEvent>
    1412:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1415:	83 ec 0c             	sub    $0xc,%esp
    1418:	68 34 1f 01 00       	push   $0x11f34
    141d:	e8 b3 f8 ff ff       	call   cd5 <addListEvent>
    1422:	83 c4 10             	add    $0x10,%esp
}
    1425:	c9                   	leave  
    1426:	c3                   	ret    

00001427 <newFolder>:

void newFolder(char *name) {
    1427:	55                   	push   %ebp
    1428:	89 e5                	mov    %esp,%ebp
    142a:	83 ec 18             	sub    $0x18,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
    142d:	83 ec 0c             	sub    $0xc,%esp
    1430:	ff 75 08             	pushl  0x8(%ebp)
    1433:	e8 df 25 00 00       	call   3a17 <strlen>
    1438:	83 c4 10             	add    $0x10,%esp
    143b:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 9;
    143e:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%ebp)
	int counter;
	while (mkdir(name) < 0) {
    1445:	eb 62                	jmp    14a9 <newFolder+0x82>
		n = strlen(name);
    1447:	83 ec 0c             	sub    $0xc,%esp
    144a:	ff 75 08             	pushl  0x8(%ebp)
    144d:	e8 c5 25 00 00       	call   3a17 <strlen>
    1452:	83 c4 10             	add    $0x10,%esp
    1455:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    1458:	8b 45 f0             	mov    -0x10(%ebp),%eax
    145b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    145e:	75 09                	jne    1469 <newFolder+0x42>
		{
			counter = 1;
    1460:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1467:	eb 1b                	jmp    1484 <newFolder+0x5d>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    1469:	8b 55 ec             	mov    -0x14(%ebp),%edx
    146c:	8b 45 08             	mov    0x8(%ebp),%eax
    146f:	01 d0                	add    %edx,%eax
    1471:	83 ec 0c             	sub    $0xc,%esp
    1474:	50                   	push   %eax
    1475:	e8 cc 26 00 00       	call   3b46 <atoi>
    147a:	83 c4 10             	add    $0x10,%esp
    147d:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    1480:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    1484:	83 ec 0c             	sub    $0xc,%esp
    1487:	ff 75 f4             	pushl  -0xc(%ebp)
    148a:	e8 bf f5 ff ff       	call   a4e <int2str>
    148f:	83 c4 10             	add    $0x10,%esp
    1492:	89 c1                	mov    %eax,%ecx
    1494:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1497:	8b 45 08             	mov    0x8(%ebp),%eax
    149a:	01 d0                	add    %edx,%eax
    149c:	83 ec 08             	sub    $0x8,%esp
    149f:	51                   	push   %ecx
    14a0:	50                   	push   %eax
    14a1:	e8 02 25 00 00       	call   39a8 <strcpy>
    14a6:	83 c4 10             	add    $0x10,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    14a9:	83 ec 0c             	sub    $0xc,%esp
    14ac:	ff 75 08             	pushl  0x8(%ebp)
    14af:	e8 8c 27 00 00       	call   3c40 <mkdir>
    14b4:	83 c4 10             	add    $0x10,%esp
    14b7:	85 c0                	test   %eax,%eax
    14b9:	78 8c                	js     1447 <newFolder+0x20>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		//printf(0, "mkdir: %s failed to create\n", newfolder);
	}
}
    14bb:	c9                   	leave  
    14bc:	c3                   	ret    

000014bd <h_newFolder>:

void h_newFolder(Point p) {
    14bd:	55                   	push   %ebp
    14be:	89 e5                	mov    %esp,%ebp
    14c0:	83 ec 38             	sub    $0x38,%esp
	char nf[32] = "newFolder";
    14c3:	c7 45 c8 6e 65 77 46 	movl   $0x4677656e,-0x38(%ebp)
    14ca:	c7 45 cc 6f 6c 64 65 	movl   $0x65646c6f,-0x34(%ebp)
    14d1:	c7 45 d0 72 00 00 00 	movl   $0x72,-0x30(%ebp)
    14d8:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    14df:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    14e6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    14ed:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    14f4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFolder(nf);
    14fb:	83 ec 0c             	sub    $0xc,%esp
    14fe:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1501:	50                   	push   %eax
    1502:	e8 20 ff ff ff       	call   1427 <newFolder>
    1507:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    150a:	e8 b8 eb ff ff       	call   c7 <freeFileItemList>
	printf(0, "new folder!\n");
    150f:	83 ec 08             	sub    $0x8,%esp
    1512:	68 60 a5 00 00       	push   $0xa560
    1517:	6a 00                	push   $0x0
    1519:	e8 97 28 00 00       	call   3db5 <printf>
    151e:	83 c4 10             	add    $0x10,%esp
	list(".");
    1521:	83 ec 0c             	sub    $0xc,%esp
    1524:	68 0f a5 00 00       	push   $0xa50f
    1529:	e8 83 ec ff ff       	call   1b1 <list>
    152e:	83 c4 10             	add    $0x10,%esp
	printItemList();
    1531:	e8 00 f6 ff ff       	call   b36 <printItemList>
	drawFinderContent(context);
    1536:	83 ec 04             	sub    $0x4,%esp
    1539:	ff 35 30 1f 01 00    	pushl  0x11f30
    153f:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    1545:	ff 35 28 1f 01 00    	pushl  0x11f28
    154b:	e8 6e f3 ff ff       	call   8be <drawFinderContent>
    1550:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1553:	83 ec 04             	sub    $0x4,%esp
    1556:	ff 35 30 1f 01 00    	pushl  0x11f30
    155c:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    1562:	ff 35 28 1f 01 00    	pushl  0x11f28
    1568:	e8 55 f2 ff ff       	call   7c2 <drawFinderWnd>
    156d:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1570:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1573:	83 ec 0c             	sub    $0xc,%esp
    1576:	68 58 02 00 00       	push   $0x258
    157b:	68 20 03 00 00       	push   $0x320
    1580:	6a 00                	push   $0x0
    1582:	6a 00                	push   $0x0
    1584:	50                   	push   %eax
    1585:	e8 9e 1e 00 00       	call   3428 <initRect>
    158a:	83 c4 1c             	add    $0x1c,%esp
    158d:	83 ec 0c             	sub    $0xc,%esp
    1590:	ff 75 f4             	pushl  -0xc(%ebp)
    1593:	ff 75 f0             	pushl  -0x10(%ebp)
    1596:	ff 75 ec             	pushl  -0x14(%ebp)
    1599:	ff 75 e8             	pushl  -0x18(%ebp)
    159c:	68 34 1f 01 00       	push   $0x11f34
    15a1:	e8 47 20 00 00       	call   35ed <deleteClickable>
    15a6:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    15a9:	83 ec 0c             	sub    $0xc,%esp
    15ac:	68 34 1f 01 00       	push   $0x11f34
    15b1:	e8 7a f7 ff ff       	call   d30 <addWndEvent>
    15b6:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    15b9:	83 ec 0c             	sub    $0xc,%esp
    15bc:	68 34 1f 01 00       	push   $0x11f34
    15c1:	e8 0f f7 ff ff       	call   cd5 <addListEvent>
    15c6:	83 c4 10             	add    $0x10,%esp
}
    15c9:	c9                   	leave  
    15ca:	c3                   	ret    

000015cb <deleteFile>:

void deleteFile(char *name)
{
    15cb:	55                   	push   %ebp
    15cc:	89 e5                	mov    %esp,%ebp
    15ce:	83 ec 18             	sub    $0x18,%esp
	printf(0, "currently having sex with %s\n", name);
    15d1:	83 ec 04             	sub    $0x4,%esp
    15d4:	ff 75 08             	pushl  0x8(%ebp)
    15d7:	68 6d a5 00 00       	push   $0xa56d
    15dc:	6a 00                	push   $0x0
    15de:	e8 d2 27 00 00       	call   3db5 <printf>
    15e3:	83 c4 10             	add    $0x10,%esp
	if(unlink(name) < 0){
    15e6:	83 ec 0c             	sub    $0xc,%esp
    15e9:	ff 75 08             	pushl  0x8(%ebp)
    15ec:	e8 37 26 00 00       	call   3c28 <unlink>
    15f1:	83 c4 10             	add    $0x10,%esp
    15f4:	85 c0                	test   %eax,%eax
    15f6:	0f 89 b3 00 00 00    	jns    16af <deleteFile+0xe4>
		if (chdir(name) < 0){
    15fc:	83 ec 0c             	sub    $0xc,%esp
    15ff:	ff 75 08             	pushl  0x8(%ebp)
    1602:	e8 41 26 00 00       	call   3c48 <chdir>
    1607:	83 c4 10             	add    $0x10,%esp
    160a:	85 c0                	test   %eax,%eax
    160c:	79 1a                	jns    1628 <deleteFile+0x5d>
			printf(2, "rm: %s failed to delete\n", name);
    160e:	83 ec 04             	sub    $0x4,%esp
    1611:	ff 75 08             	pushl  0x8(%ebp)
    1614:	68 8b a5 00 00       	push   $0xa58b
    1619:	6a 02                	push   $0x2
    161b:	e8 95 27 00 00       	call   3db5 <printf>
    1620:	83 c4 10             	add    $0x10,%esp
    1623:	e9 87 00 00 00       	jmp    16af <deleteFile+0xe4>
		}
		else{
			freeFileItemList();
    1628:	e8 9a ea ff ff       	call   c7 <freeFileItemList>
			list(".");
    162d:	83 ec 0c             	sub    $0xc,%esp
    1630:	68 0f a5 00 00       	push   $0xa50f
    1635:	e8 77 eb ff ff       	call   1b1 <list>
    163a:	83 c4 10             	add    $0x10,%esp
			struct fileItem *p;
			p = fileItemList;
    163d:	a1 44 ef 00 00       	mov    0xef44,%eax
    1642:	89 45 f4             	mov    %eax,-0xc(%ebp)
			while (p != 0) {
    1645:	eb 2f                	jmp    1676 <deleteFile+0xab>
				deleteFile(p->name);
    1647:	8b 45 f4             	mov    -0xc(%ebp),%eax
    164a:	8b 40 14             	mov    0x14(%eax),%eax
    164d:	83 ec 0c             	sub    $0xc,%esp
    1650:	50                   	push   %eax
    1651:	e8 75 ff ff ff       	call   15cb <deleteFile>
    1656:	83 c4 10             	add    $0x10,%esp
				freeFileItemList();
    1659:	e8 69 ea ff ff       	call   c7 <freeFileItemList>
				list(".");
    165e:	83 ec 0c             	sub    $0xc,%esp
    1661:	68 0f a5 00 00       	push   $0xa50f
    1666:	e8 46 eb ff ff       	call   1b1 <list>
    166b:	83 c4 10             	add    $0x10,%esp
				p = fileItemList;
    166e:	a1 44 ef 00 00       	mov    0xef44,%eax
    1673:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else{
			freeFileItemList();
			list(".");
			struct fileItem *p;
			p = fileItemList;
			while (p != 0) {
    1676:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    167a:	75 cb                	jne    1647 <deleteFile+0x7c>
				deleteFile(p->name);
				freeFileItemList();
				list(".");
				p = fileItemList;
			}
			chdir("..");
    167c:	83 ec 0c             	sub    $0xc,%esp
    167f:	68 a4 a5 00 00       	push   $0xa5a4
    1684:	e8 bf 25 00 00       	call   3c48 <chdir>
    1689:	83 c4 10             	add    $0x10,%esp
			freeFileItemList();
    168c:	e8 36 ea ff ff       	call   c7 <freeFileItemList>
			list(".");
    1691:	83 ec 0c             	sub    $0xc,%esp
    1694:	68 0f a5 00 00       	push   $0xa50f
    1699:	e8 13 eb ff ff       	call   1b1 <list>
    169e:	83 c4 10             	add    $0x10,%esp
			unlink(name);
    16a1:	83 ec 0c             	sub    $0xc,%esp
    16a4:	ff 75 08             	pushl  0x8(%ebp)
    16a7:	e8 7c 25 00 00       	call   3c28 <unlink>
    16ac:	83 c4 10             	add    $0x10,%esp
		}
	}
}
    16af:	c9                   	leave  
    16b0:	c3                   	ret    

000016b1 <h_deleteFile>:
void h_deleteFile(Point p) {
    16b1:	55                   	push   %ebp
    16b2:	89 e5                	mov    %esp,%ebp
    16b4:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    16b7:	a1 44 ef 00 00       	mov    0xef44,%eax
    16bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
    16bf:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    16c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    16cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    16cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
	printf(0, "hi1\n");
    16d2:	83 ec 08             	sub    $0x8,%esp
    16d5:	68 a7 a5 00 00       	push   $0xa5a7
    16da:	6a 00                	push   $0x0
    16dc:	e8 d4 26 00 00       	call   3db5 <printf>
    16e1:	83 c4 10             	add    $0x10,%esp
	while (q != 0)
    16e4:	e9 90 00 00 00       	jmp    1779 <h_deleteFile+0xc8>
	{
		printf(0, "hi2\n");
    16e9:	83 ec 08             	sub    $0x8,%esp
    16ec:	68 ac a5 00 00       	push   $0xa5ac
    16f1:	6a 00                	push   $0x0
    16f3:	e8 bd 26 00 00       	call   3db5 <printf>
    16f8:	83 c4 10             	add    $0x10,%esp
		if (q->chosen)
    16fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16fe:	8b 40 28             	mov    0x28(%eax),%eax
    1701:	85 c0                	test   %eax,%eax
    1703:	74 6b                	je     1770 <h_deleteFile+0xbf>
		{
			p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
    1705:	83 ec 0c             	sub    $0xc,%esp
    1708:	6a 30                	push   $0x30
    170a:	e8 77 29 00 00       	call   4086 <malloc>
    170f:	83 c4 10             	add    $0x10,%esp
    1712:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    1715:	83 ec 0c             	sub    $0xc,%esp
    1718:	6a 20                	push   $0x20
    171a:	e8 67 29 00 00       	call   4086 <malloc>
    171f:	83 c4 10             	add    $0x10,%esp
    1722:	89 c2                	mov    %eax,%edx
    1724:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1727:	89 50 14             	mov    %edx,0x14(%eax)
			strcpy(p1->name, q->name);
    172a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    172d:	8b 50 14             	mov    0x14(%eax),%edx
    1730:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1733:	8b 40 14             	mov    0x14(%eax),%eax
    1736:	83 ec 08             	sub    $0x8,%esp
    1739:	52                   	push   %edx
    173a:	50                   	push   %eax
    173b:	e8 68 22 00 00       	call   39a8 <strcpy>
    1740:	83 c4 10             	add    $0x10,%esp
			if(head == 0)
    1743:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1747:	75 0e                	jne    1757 <h_deleteFile+0xa6>
			{
				head = p1;
    1749:	8b 45 f0             	mov    -0x10(%ebp),%eax
    174c:	89 45 ec             	mov    %eax,-0x14(%ebp)
				p2 = p1;
    174f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1752:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1755:	eb 0f                	jmp    1766 <h_deleteFile+0xb5>
			} else {
				p2->next = p1;
    1757:	8b 45 e8             	mov    -0x18(%ebp),%eax
    175a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    175d:	89 50 2c             	mov    %edx,0x2c(%eax)
				p2 = p1;
    1760:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1763:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}
			p1->next = 0;
    1766:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1769:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
		}
		q = q->next;
    1770:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1773:	8b 40 2c             	mov    0x2c(%eax),%eax
    1776:	89 45 f4             	mov    %eax,-0xc(%ebp)
void h_deleteFile(Point p) {
	struct fileItem *q = fileItemList;
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
	printf(0, "hi1\n");
	while (q != 0)
    1779:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    177d:	0f 85 66 ff ff ff    	jne    16e9 <h_deleteFile+0x38>
			}
			p1->next = 0;
		}
		q = q->next;
	}
	p1 = head;
    1783:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1786:	89 45 f0             	mov    %eax,-0x10(%ebp)
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
    1789:	83 ec 08             	sub    $0x8,%esp
    178c:	68 b4 a5 00 00       	push   $0xa5b4
    1791:	6a 00                	push   $0x0
    1793:	e8 1d 26 00 00       	call   3db5 <printf>
    1798:	83 c4 10             	add    $0x10,%esp
	while (p1 != 0)
    179b:	eb 1b                	jmp    17b8 <h_deleteFile+0x107>
	{
		deleteFile(p1->name);
    179d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17a0:	8b 40 14             	mov    0x14(%eax),%eax
    17a3:	83 ec 0c             	sub    $0xc,%esp
    17a6:	50                   	push   %eax
    17a7:	e8 1f fe ff ff       	call   15cb <deleteFile>
    17ac:	83 c4 10             	add    $0x10,%esp
		p1 = p1->next;
    17af:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17b2:	8b 40 2c             	mov    0x2c(%eax),%eax
    17b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
		}
		q = q->next;
	}
	p1 = head;
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
	while (p1 != 0)
    17b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    17bc:	75 df                	jne    179d <h_deleteFile+0xec>
	{
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
    17be:	83 ec 08             	sub    $0x8,%esp
    17c1:	68 1c a6 00 00       	push   $0xa61c
    17c6:	6a 00                	push   $0x0
    17c8:	e8 e8 25 00 00       	call   3db5 <printf>
    17cd:	83 c4 10             	add    $0x10,%esp
	p1 = head;
    17d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
	while (p1 != 0) {
    17d6:	eb 48                	jmp    1820 <h_deleteFile+0x16f>
		p2 = p1;
    17d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17db:	89 45 e8             	mov    %eax,-0x18(%ebp)
		printf(0, "freeing %s\n", p2->name);
    17de:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17e1:	8b 40 14             	mov    0x14(%eax),%eax
    17e4:	83 ec 04             	sub    $0x4,%esp
    17e7:	50                   	push   %eax
    17e8:	68 32 a6 00 00       	push   $0xa632
    17ed:	6a 00                	push   $0x0
    17ef:	e8 c1 25 00 00       	call   3db5 <printf>
    17f4:	83 c4 10             	add    $0x10,%esp
		p1 = p1->next;
    17f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17fa:	8b 40 2c             	mov    0x2c(%eax),%eax
    17fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
		free(p2->name);
    1800:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1803:	8b 40 14             	mov    0x14(%eax),%eax
    1806:	83 ec 0c             	sub    $0xc,%esp
    1809:	50                   	push   %eax
    180a:	e8 36 27 00 00       	call   3f45 <free>
    180f:	83 c4 10             	add    $0x10,%esp
		free(p2);
    1812:	83 ec 0c             	sub    $0xc,%esp
    1815:	ff 75 e8             	pushl  -0x18(%ebp)
    1818:	e8 28 27 00 00       	call   3f45 <free>
    181d:	83 c4 10             	add    $0x10,%esp
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
	p1 = head;
	while (p1 != 0) {
    1820:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1824:	75 b2                	jne    17d8 <h_deleteFile+0x127>
		printf(0, "freeing %s\n", p2->name);
		p1 = p1->next;
		free(p2->name);
		free(p2);
	}
	printf(0, "done freeing!~~~\n");
    1826:	83 ec 08             	sub    $0x8,%esp
    1829:	68 3e a6 00 00       	push   $0xa63e
    182e:	6a 00                	push   $0x0
    1830:	e8 80 25 00 00       	call   3db5 <printf>
    1835:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    1838:	e8 8a e8 ff ff       	call   c7 <freeFileItemList>
	list(".");
    183d:	83 ec 0c             	sub    $0xc,%esp
    1840:	68 0f a5 00 00       	push   $0xa50f
    1845:	e8 67 e9 ff ff       	call   1b1 <list>
    184a:	83 c4 10             	add    $0x10,%esp
	printItemList();
    184d:	e8 e4 f2 ff ff       	call   b36 <printItemList>
	drawFinderContent(context);
    1852:	83 ec 04             	sub    $0x4,%esp
    1855:	ff 35 30 1f 01 00    	pushl  0x11f30
    185b:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    1861:	ff 35 28 1f 01 00    	pushl  0x11f28
    1867:	e8 52 f0 ff ff       	call   8be <drawFinderContent>
    186c:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    186f:	83 ec 04             	sub    $0x4,%esp
    1872:	ff 35 30 1f 01 00    	pushl  0x11f30
    1878:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    187e:	ff 35 28 1f 01 00    	pushl  0x11f28
    1884:	e8 39 ef ff ff       	call   7c2 <drawFinderWnd>
    1889:	83 c4 10             	add    $0x10,%esp
		deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    188c:	8d 45 d8             	lea    -0x28(%ebp),%eax
    188f:	83 ec 0c             	sub    $0xc,%esp
    1892:	68 58 02 00 00       	push   $0x258
    1897:	68 20 03 00 00       	push   $0x320
    189c:	6a 00                	push   $0x0
    189e:	6a 00                	push   $0x0
    18a0:	50                   	push   %eax
    18a1:	e8 82 1b 00 00       	call   3428 <initRect>
    18a6:	83 c4 1c             	add    $0x1c,%esp
    18a9:	83 ec 0c             	sub    $0xc,%esp
    18ac:	ff 75 e4             	pushl  -0x1c(%ebp)
    18af:	ff 75 e0             	pushl  -0x20(%ebp)
    18b2:	ff 75 dc             	pushl  -0x24(%ebp)
    18b5:	ff 75 d8             	pushl  -0x28(%ebp)
    18b8:	68 34 1f 01 00       	push   $0x11f34
    18bd:	e8 2b 1d 00 00       	call   35ed <deleteClickable>
    18c2:	83 c4 20             	add    $0x20,%esp
		addWndEvent(&cm);
    18c5:	83 ec 0c             	sub    $0xc,%esp
    18c8:	68 34 1f 01 00       	push   $0x11f34
    18cd:	e8 5e f4 ff ff       	call   d30 <addWndEvent>
    18d2:	83 c4 10             	add    $0x10,%esp
		addListEvent(&cm);
    18d5:	83 ec 0c             	sub    $0xc,%esp
    18d8:	68 34 1f 01 00       	push   $0x11f34
    18dd:	e8 f3 f3 ff ff       	call   cd5 <addListEvent>
    18e2:	83 c4 10             	add    $0x10,%esp
}
    18e5:	c9                   	leave  
    18e6:	c3                   	ret    

000018e7 <copyFile>:

void copyFile(){
    18e7:	55                   	push   %ebp
    18e8:	89 e5                	mov    %esp,%ebp
    18ea:	83 ec 18             	sub    $0x18,%esp
	int fd;
	struct fileItem *p = fileItemList;
    18ed:	a1 44 ef 00 00       	mov    0xef44,%eax
    18f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0){
    18f5:	e9 f2 00 00 00       	jmp    19ec <copyFile+0x105>
		if (p->chosen == 1){
    18fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18fd:	8b 40 28             	mov    0x28(%eax),%eax
    1900:	83 f8 01             	cmp    $0x1,%eax
    1903:	0f 85 da 00 00 00    	jne    19e3 <copyFile+0xfc>
			if(lenOfWaited >= MAX_COPY_SIZE){
    1909:	a1 48 1f 01 00       	mov    0x11f48,%eax
    190e:	83 f8 09             	cmp    $0x9,%eax
    1911:	7e 1d                	jle    1930 <copyFile+0x49>
				printf(0, "Too Much Files To Copy %d\n", lenOfWaited);
    1913:	a1 48 1f 01 00       	mov    0x11f48,%eax
    1918:	83 ec 04             	sub    $0x4,%esp
    191b:	50                   	push   %eax
    191c:	68 50 a6 00 00       	push   $0xa650
    1921:	6a 00                	push   $0x0
    1923:	e8 8d 24 00 00       	call   3db5 <printf>
    1928:	83 c4 10             	add    $0x10,%esp
    192b:	e9 b3 00 00 00       	jmp    19e3 <copyFile+0xfc>
			}
			else{
				if((fd = open(p->name, O_RDONLY)) >= 0){
    1930:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1933:	8b 40 14             	mov    0x14(%eax),%eax
    1936:	83 ec 08             	sub    $0x8,%esp
    1939:	6a 00                	push   $0x0
    193b:	50                   	push   %eax
    193c:	e8 d7 22 00 00       	call   3c18 <open>
    1941:	83 c4 10             	add    $0x10,%esp
    1944:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1947:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    194b:	78 7d                	js     19ca <copyFile+0xe3>
					filesWaited[lenOfWaited].fd = fd;
    194d:	8b 15 48 1f 01 00    	mov    0x11f48,%edx
    1953:	89 d0                	mov    %edx,%eax
    1955:	c1 e0 03             	shl    $0x3,%eax
    1958:	01 d0                	add    %edx,%eax
    195a:	c1 e0 02             	shl    $0x2,%eax
    195d:	83 c0 20             	add    $0x20,%eax
    1960:	8d 90 c0 1d 01 00    	lea    0x11dc0(%eax),%edx
    1966:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1969:	89 02                	mov    %eax,(%edx)
					strcpy(filesWaited[lenOfWaited].name, p->name);
    196b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    196e:	8b 48 14             	mov    0x14(%eax),%ecx
    1971:	8b 15 48 1f 01 00    	mov    0x11f48,%edx
    1977:	89 d0                	mov    %edx,%eax
    1979:	c1 e0 03             	shl    $0x3,%eax
    197c:	01 d0                	add    %edx,%eax
    197e:	c1 e0 02             	shl    $0x2,%eax
    1981:	05 c0 1d 01 00       	add    $0x11dc0,%eax
    1986:	83 ec 08             	sub    $0x8,%esp
    1989:	51                   	push   %ecx
    198a:	50                   	push   %eax
    198b:	e8 18 20 00 00       	call   39a8 <strcpy>
    1990:	83 c4 10             	add    $0x10,%esp
					printf(0, "Open File %s Succeed\n", filesWaited[lenOfWaited].name);
    1993:	8b 15 48 1f 01 00    	mov    0x11f48,%edx
    1999:	89 d0                	mov    %edx,%eax
    199b:	c1 e0 03             	shl    $0x3,%eax
    199e:	01 d0                	add    %edx,%eax
    19a0:	c1 e0 02             	shl    $0x2,%eax
    19a3:	05 c0 1d 01 00       	add    $0x11dc0,%eax
    19a8:	83 ec 04             	sub    $0x4,%esp
    19ab:	50                   	push   %eax
    19ac:	68 6b a6 00 00       	push   $0xa66b
    19b1:	6a 00                	push   $0x0
    19b3:	e8 fd 23 00 00       	call   3db5 <printf>
    19b8:	83 c4 10             	add    $0x10,%esp
					lenOfWaited++;
    19bb:	a1 48 1f 01 00       	mov    0x11f48,%eax
    19c0:	83 c0 01             	add    $0x1,%eax
    19c3:	a3 48 1f 01 00       	mov    %eax,0x11f48
    19c8:	eb 19                	jmp    19e3 <copyFile+0xfc>
				}
				else{
					printf(0, "Open File %s Failed\n", p->name);
    19ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19cd:	8b 40 14             	mov    0x14(%eax),%eax
    19d0:	83 ec 04             	sub    $0x4,%esp
    19d3:	50                   	push   %eax
    19d4:	68 81 a6 00 00       	push   $0xa681
    19d9:	6a 00                	push   $0x0
    19db:	e8 d5 23 00 00       	call   3db5 <printf>
    19e0:	83 c4 10             	add    $0x10,%esp
				}
			}
		}
		p = p->next;
    19e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19e6:	8b 40 2c             	mov    0x2c(%eax),%eax
    19e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void copyFile(){
	int fd;
	struct fileItem *p = fileItemList;
	while(p != 0){
    19ec:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    19f0:	0f 85 04 ff ff ff    	jne    18fa <copyFile+0x13>
				}
			}
		}
		p = p->next;
	}
}
    19f6:	c9                   	leave  
    19f7:	c3                   	ret    

000019f8 <h_copyFile>:

void h_copyFile(Point p){
    19f8:	55                   	push   %ebp
    19f9:	89 e5                	mov    %esp,%ebp
    19fb:	83 ec 18             	sub    $0x18,%esp
	int i;
	for(i = 0; i < lenOfWaited; i++){
    19fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1a05:	eb 5e                	jmp    1a65 <h_copyFile+0x6d>
		if(filesWaited[i].fd != -1){
    1a07:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a0a:	89 d0                	mov    %edx,%eax
    1a0c:	c1 e0 03             	shl    $0x3,%eax
    1a0f:	01 d0                	add    %edx,%eax
    1a11:	c1 e0 02             	shl    $0x2,%eax
    1a14:	83 c0 20             	add    $0x20,%eax
    1a17:	05 c0 1d 01 00       	add    $0x11dc0,%eax
    1a1c:	8b 00                	mov    (%eax),%eax
    1a1e:	83 f8 ff             	cmp    $0xffffffff,%eax
    1a21:	74 3e                	je     1a61 <h_copyFile+0x69>
			close(filesWaited[i].fd);
    1a23:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a26:	89 d0                	mov    %edx,%eax
    1a28:	c1 e0 03             	shl    $0x3,%eax
    1a2b:	01 d0                	add    %edx,%eax
    1a2d:	c1 e0 02             	shl    $0x2,%eax
    1a30:	83 c0 20             	add    $0x20,%eax
    1a33:	05 c0 1d 01 00       	add    $0x11dc0,%eax
    1a38:	8b 00                	mov    (%eax),%eax
    1a3a:	83 ec 0c             	sub    $0xc,%esp
    1a3d:	50                   	push   %eax
    1a3e:	e8 bd 21 00 00       	call   3c00 <close>
    1a43:	83 c4 10             	add    $0x10,%esp
			filesWaited[i].fd = -1;
    1a46:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a49:	89 d0                	mov    %edx,%eax
    1a4b:	c1 e0 03             	shl    $0x3,%eax
    1a4e:	01 d0                	add    %edx,%eax
    1a50:	c1 e0 02             	shl    $0x2,%eax
    1a53:	83 c0 20             	add    $0x20,%eax
    1a56:	05 c0 1d 01 00       	add    $0x11dc0,%eax
    1a5b:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
	}
}

void h_copyFile(Point p){
	int i;
	for(i = 0; i < lenOfWaited; i++){
    1a61:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1a65:	a1 48 1f 01 00       	mov    0x11f48,%eax
    1a6a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1a6d:	7c 98                	jl     1a07 <h_copyFile+0xf>
		if(filesWaited[i].fd != -1){
			close(filesWaited[i].fd);
			filesWaited[i].fd = -1;
		}
	}
	lenOfWaited = 0;
    1a6f:	c7 05 48 1f 01 00 00 	movl   $0x0,0x11f48
    1a76:	00 00 00 
	copyFile();
    1a79:	e8 69 fe ff ff       	call   18e7 <copyFile>
}
    1a7e:	c9                   	leave  
    1a7f:	c3                   	ret    

00001a80 <h_pasteFile>:

void h_pasteFile(Point p){
    1a80:	55                   	push   %ebp
    1a81:	89 e5                	mov    %esp,%ebp
    1a83:	83 ec 18             	sub    $0x18,%esp
	int i;
	for(i = 0; i < lenOfWaited; i++){
    1a86:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1a8d:	eb 45                	jmp    1ad4 <h_pasteFile+0x54>
		if(filesWaited[i].fd != -1){
    1a8f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a92:	89 d0                	mov    %edx,%eax
    1a94:	c1 e0 03             	shl    $0x3,%eax
    1a97:	01 d0                	add    %edx,%eax
    1a99:	c1 e0 02             	shl    $0x2,%eax
    1a9c:	83 c0 20             	add    $0x20,%eax
    1a9f:	05 c0 1d 01 00       	add    $0x11dc0,%eax
    1aa4:	8b 00                	mov    (%eax),%eax
    1aa6:	83 f8 ff             	cmp    $0xffffffff,%eax
    1aa9:	74 25                	je     1ad0 <h_pasteFile+0x50>
			printf(0, "this is NO %d file names %s\n", i, filesWaited[i].name);
    1aab:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1aae:	89 d0                	mov    %edx,%eax
    1ab0:	c1 e0 03             	shl    $0x3,%eax
    1ab3:	01 d0                	add    %edx,%eax
    1ab5:	c1 e0 02             	shl    $0x2,%eax
    1ab8:	05 c0 1d 01 00       	add    $0x11dc0,%eax
    1abd:	50                   	push   %eax
    1abe:	ff 75 f4             	pushl  -0xc(%ebp)
    1ac1:	68 96 a6 00 00       	push   $0xa696
    1ac6:	6a 00                	push   $0x0
    1ac8:	e8 e8 22 00 00       	call   3db5 <printf>
    1acd:	83 c4 10             	add    $0x10,%esp
	copyFile();
}

void h_pasteFile(Point p){
	int i;
	for(i = 0; i < lenOfWaited; i++){
    1ad0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1ad4:	a1 48 1f 01 00       	mov    0x11f48,%eax
    1ad9:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1adc:	7c b1                	jl     1a8f <h_pasteFile+0xf>
		if(filesWaited[i].fd != -1){
			printf(0, "this is NO %d file names %s\n", i, filesWaited[i].name);
	    }
	}
}
    1ade:	c9                   	leave  
    1adf:	c3                   	ret    

00001ae0 <h_chooseFile>:

void h_chooseFile(Point p) {
    1ae0:	55                   	push   %ebp
    1ae1:	89 e5                	mov    %esp,%ebp
    1ae3:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *temp = getFileItem(p);
    1ae6:	83 ec 08             	sub    $0x8,%esp
    1ae9:	ff 75 0c             	pushl  0xc(%ebp)
    1aec:	ff 75 08             	pushl  0x8(%ebp)
    1aef:	e8 ed f2 ff ff       	call   de1 <getFileItem>
    1af4:	83 c4 10             	add    $0x10,%esp
    1af7:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (temp->chosen != 0)
    1afa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1afd:	8b 40 28             	mov    0x28(%eax),%eax
    1b00:	85 c0                	test   %eax,%eax
    1b02:	74 1e                	je     1b22 <h_chooseFile+0x42>
	{
		printf(0, "chooseFile!\n");
    1b04:	83 ec 08             	sub    $0x8,%esp
    1b07:	68 b3 a6 00 00       	push   $0xa6b3
    1b0c:	6a 00                	push   $0x0
    1b0e:	e8 a2 22 00 00       	call   3db5 <printf>
    1b13:	83 c4 10             	add    $0x10,%esp
		temp->chosen = 0;
    1b16:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b19:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    1b20:	eb 1c                	jmp    1b3e <h_chooseFile+0x5e>
	}
	else
	{
		printf(0, "unchooseFile!\n");
    1b22:	83 ec 08             	sub    $0x8,%esp
    1b25:	68 c0 a6 00 00       	push   $0xa6c0
    1b2a:	6a 00                	push   $0x0
    1b2c:	e8 84 22 00 00       	call   3db5 <printf>
    1b31:	83 c4 10             	add    $0x10,%esp
		temp->chosen = 1;
    1b34:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b37:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    1b3e:	83 ec 04             	sub    $0x4,%esp
    1b41:	ff 35 30 1f 01 00    	pushl  0x11f30
    1b47:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    1b4d:	ff 35 28 1f 01 00    	pushl  0x11f28
    1b53:	e8 66 ed ff ff       	call   8be <drawFinderContent>
    1b58:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1b5b:	83 ec 04             	sub    $0x4,%esp
    1b5e:	ff 35 30 1f 01 00    	pushl  0x11f30
    1b64:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    1b6a:	ff 35 28 1f 01 00    	pushl  0x11f28
    1b70:	e8 4d ec ff ff       	call   7c2 <drawFinderWnd>
    1b75:	83 c4 10             	add    $0x10,%esp
}
    1b78:	c9                   	leave  
    1b79:	c3                   	ret    

00001b7a <h_closeWnd>:

void h_closeWnd(Point p) {
    1b7a:	55                   	push   %ebp
    1b7b:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    1b7d:	c7 05 80 e5 00 00 00 	movl   $0x0,0xe580
    1b84:	00 00 00 
}
    1b87:	5d                   	pop    %ebp
    1b88:	c3                   	ret    

00001b89 <h_chvm1>:

void h_chvm1(Point p) {
    1b89:	55                   	push   %ebp
    1b8a:	89 e5                	mov    %esp,%ebp
    1b8c:	83 ec 18             	sub    $0x18,%esp
	style = ICON_STYLE;
    1b8f:	c7 05 84 e5 00 00 01 	movl   $0x1,0xe584
    1b96:	00 00 00 
	freeFileItemList();
    1b99:	e8 29 e5 ff ff       	call   c7 <freeFileItemList>
		list(".");
    1b9e:	83 ec 0c             	sub    $0xc,%esp
    1ba1:	68 0f a5 00 00       	push   $0xa50f
    1ba6:	e8 06 e6 ff ff       	call   1b1 <list>
    1bab:	83 c4 10             	add    $0x10,%esp
		drawFinderContent(context);
    1bae:	83 ec 04             	sub    $0x4,%esp
    1bb1:	ff 35 30 1f 01 00    	pushl  0x11f30
    1bb7:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    1bbd:	ff 35 28 1f 01 00    	pushl  0x11f28
    1bc3:	e8 f6 ec ff ff       	call   8be <drawFinderContent>
    1bc8:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1bcb:	83 ec 04             	sub    $0x4,%esp
    1bce:	ff 35 30 1f 01 00    	pushl  0x11f30
    1bd4:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    1bda:	ff 35 28 1f 01 00    	pushl  0x11f28
    1be0:	e8 dd eb ff ff       	call   7c2 <drawFinderWnd>
    1be5:	83 c4 10             	add    $0x10,%esp
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1be8:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1beb:	83 ec 0c             	sub    $0xc,%esp
    1bee:	68 58 02 00 00       	push   $0x258
    1bf3:	68 20 03 00 00       	push   $0x320
    1bf8:	6a 00                	push   $0x0
    1bfa:	6a 00                	push   $0x0
    1bfc:	50                   	push   %eax
    1bfd:	e8 26 18 00 00       	call   3428 <initRect>
    1c02:	83 c4 1c             	add    $0x1c,%esp
    1c05:	83 ec 0c             	sub    $0xc,%esp
    1c08:	ff 75 f4             	pushl  -0xc(%ebp)
    1c0b:	ff 75 f0             	pushl  -0x10(%ebp)
    1c0e:	ff 75 ec             	pushl  -0x14(%ebp)
    1c11:	ff 75 e8             	pushl  -0x18(%ebp)
    1c14:	68 34 1f 01 00       	push   $0x11f34
    1c19:	e8 cf 19 00 00       	call   35ed <deleteClickable>
    1c1e:	83 c4 20             	add    $0x20,%esp
			addWndEvent(&cm);
    1c21:	83 ec 0c             	sub    $0xc,%esp
    1c24:	68 34 1f 01 00       	push   $0x11f34
    1c29:	e8 02 f1 ff ff       	call   d30 <addWndEvent>
    1c2e:	83 c4 10             	add    $0x10,%esp
			addListEvent(&cm);
    1c31:	83 ec 0c             	sub    $0xc,%esp
    1c34:	68 34 1f 01 00       	push   $0x11f34
    1c39:	e8 97 f0 ff ff       	call   cd5 <addListEvent>
    1c3e:	83 c4 10             	add    $0x10,%esp
}
    1c41:	c9                   	leave  
    1c42:	c3                   	ret    

00001c43 <h_chvm2>:

void h_chvm2(Point p) {
    1c43:	55                   	push   %ebp
    1c44:	89 e5                	mov    %esp,%ebp
    1c46:	83 ec 18             	sub    $0x18,%esp
	style = LIST_STYLE;
    1c49:	c7 05 84 e5 00 00 02 	movl   $0x2,0xe584
    1c50:	00 00 00 
	freeFileItemList();
    1c53:	e8 6f e4 ff ff       	call   c7 <freeFileItemList>
		list(".");
    1c58:	83 ec 0c             	sub    $0xc,%esp
    1c5b:	68 0f a5 00 00       	push   $0xa50f
    1c60:	e8 4c e5 ff ff       	call   1b1 <list>
    1c65:	83 c4 10             	add    $0x10,%esp
		drawFinderContent(context);
    1c68:	83 ec 04             	sub    $0x4,%esp
    1c6b:	ff 35 30 1f 01 00    	pushl  0x11f30
    1c71:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    1c77:	ff 35 28 1f 01 00    	pushl  0x11f28
    1c7d:	e8 3c ec ff ff       	call   8be <drawFinderContent>
    1c82:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1c85:	83 ec 04             	sub    $0x4,%esp
    1c88:	ff 35 30 1f 01 00    	pushl  0x11f30
    1c8e:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    1c94:	ff 35 28 1f 01 00    	pushl  0x11f28
    1c9a:	e8 23 eb ff ff       	call   7c2 <drawFinderWnd>
    1c9f:	83 c4 10             	add    $0x10,%esp
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1ca2:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1ca5:	83 ec 0c             	sub    $0xc,%esp
    1ca8:	68 58 02 00 00       	push   $0x258
    1cad:	68 20 03 00 00       	push   $0x320
    1cb2:	6a 00                	push   $0x0
    1cb4:	6a 00                	push   $0x0
    1cb6:	50                   	push   %eax
    1cb7:	e8 6c 17 00 00       	call   3428 <initRect>
    1cbc:	83 c4 1c             	add    $0x1c,%esp
    1cbf:	83 ec 0c             	sub    $0xc,%esp
    1cc2:	ff 75 f4             	pushl  -0xc(%ebp)
    1cc5:	ff 75 f0             	pushl  -0x10(%ebp)
    1cc8:	ff 75 ec             	pushl  -0x14(%ebp)
    1ccb:	ff 75 e8             	pushl  -0x18(%ebp)
    1cce:	68 34 1f 01 00       	push   $0x11f34
    1cd3:	e8 15 19 00 00       	call   35ed <deleteClickable>
    1cd8:	83 c4 20             	add    $0x20,%esp
			addWndEvent(&cm);
    1cdb:	83 ec 0c             	sub    $0xc,%esp
    1cde:	68 34 1f 01 00       	push   $0x11f34
    1ce3:	e8 48 f0 ff ff       	call   d30 <addWndEvent>
    1ce8:	83 c4 10             	add    $0x10,%esp
			addListEvent(&cm);
    1ceb:	83 ec 0c             	sub    $0xc,%esp
    1cee:	68 34 1f 01 00       	push   $0x11f34
    1cf3:	e8 dd ef ff ff       	call   cd5 <addListEvent>
    1cf8:	83 c4 10             	add    $0x10,%esp
}
    1cfb:	c9                   	leave  
    1cfc:	c3                   	ret    

00001cfd <h_goUp>:

void h_goUp(Point p) {
    1cfd:	55                   	push   %ebp
    1cfe:	89 e5                	mov    %esp,%ebp
    1d00:	83 ec 18             	sub    $0x18,%esp
	enterDir("..");
    1d03:	83 ec 0c             	sub    $0xc,%esp
    1d06:	68 a4 a5 00 00       	push   $0xa5a4
    1d0b:	e8 09 f4 ff ff       	call   1119 <enterDir>
    1d10:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    1d13:	e8 af e3 ff ff       	call   c7 <freeFileItemList>
	list(".");
    1d18:	83 ec 0c             	sub    $0xc,%esp
    1d1b:	68 0f a5 00 00       	push   $0xa50f
    1d20:	e8 8c e4 ff ff       	call   1b1 <list>
    1d25:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    1d28:	83 ec 04             	sub    $0x4,%esp
    1d2b:	ff 35 30 1f 01 00    	pushl  0x11f30
    1d31:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    1d37:	ff 35 28 1f 01 00    	pushl  0x11f28
    1d3d:	e8 7c eb ff ff       	call   8be <drawFinderContent>
    1d42:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1d45:	83 ec 04             	sub    $0x4,%esp
    1d48:	ff 35 30 1f 01 00    	pushl  0x11f30
    1d4e:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    1d54:	ff 35 28 1f 01 00    	pushl  0x11f28
    1d5a:	e8 63 ea ff ff       	call   7c2 <drawFinderWnd>
    1d5f:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1d62:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1d65:	83 ec 0c             	sub    $0xc,%esp
    1d68:	68 58 02 00 00       	push   $0x258
    1d6d:	68 20 03 00 00       	push   $0x320
    1d72:	6a 00                	push   $0x0
    1d74:	6a 00                	push   $0x0
    1d76:	50                   	push   %eax
    1d77:	e8 ac 16 00 00       	call   3428 <initRect>
    1d7c:	83 c4 1c             	add    $0x1c,%esp
    1d7f:	83 ec 0c             	sub    $0xc,%esp
    1d82:	ff 75 f4             	pushl  -0xc(%ebp)
    1d85:	ff 75 f0             	pushl  -0x10(%ebp)
    1d88:	ff 75 ec             	pushl  -0x14(%ebp)
    1d8b:	ff 75 e8             	pushl  -0x18(%ebp)
    1d8e:	68 34 1f 01 00       	push   $0x11f34
    1d93:	e8 55 18 00 00       	call   35ed <deleteClickable>
    1d98:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1d9b:	83 ec 0c             	sub    $0xc,%esp
    1d9e:	68 34 1f 01 00       	push   $0x11f34
    1da3:	e8 88 ef ff ff       	call   d30 <addWndEvent>
    1da8:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1dab:	83 ec 0c             	sub    $0xc,%esp
    1dae:	68 34 1f 01 00       	push   $0x11f34
    1db3:	e8 1d ef ff ff       	call   cd5 <addListEvent>
    1db8:	83 c4 10             	add    $0x10,%esp
}
    1dbb:	c9                   	leave  
    1dbc:	c3                   	ret    

00001dbd <h_empty>:

void h_empty(Point p) {
    1dbd:	55                   	push   %ebp
    1dbe:	89 e5                	mov    %esp,%ebp

}
    1dc0:	5d                   	pop    %ebp
    1dc1:	c3                   	ret    

00001dc2 <main>:

int main(int argc, char *argv[]) {
    1dc2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1dc6:	83 e4 f0             	and    $0xfffffff0,%esp
    1dc9:	ff 71 fc             	pushl  -0x4(%ecx)
    1dcc:	55                   	push   %ebp
    1dcd:	89 e5                	mov    %esp,%ebp
    1dcf:	56                   	push   %esi
    1dd0:	53                   	push   %ebx
    1dd1:	51                   	push   %ecx
    1dd2:	83 ec 7c             	sub    $0x7c,%esp
	int winid;
	struct Msg msg;

	Point p;

	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    1dd5:	83 ec 04             	sub    $0x4,%esp
    1dd8:	68 c2 01 00 00       	push   $0x1c2
    1ddd:	68 58 02 00 00       	push   $0x258
    1de2:	68 28 1f 01 00       	push   $0x11f28
    1de7:	e8 0d 04 00 00       	call   21f9 <init_context>
    1dec:	83 c4 10             	add    $0x10,%esp
    1def:	89 45 e0             	mov    %eax,-0x20(%ebp)
	cm = initClickManager(context);
    1df2:	8d 45 88             	lea    -0x78(%ebp),%eax
    1df5:	ff 35 30 1f 01 00    	pushl  0x11f30
    1dfb:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    1e01:	ff 35 28 1f 01 00    	pushl  0x11f28
    1e07:	50                   	push   %eax
    1e08:	e8 af 16 00 00       	call   34bc <initClickManager>
    1e0d:	83 c4 0c             	add    $0xc,%esp
    1e10:	8b 45 88             	mov    -0x78(%ebp),%eax
    1e13:	a3 34 1f 01 00       	mov    %eax,0x11f34
    1e18:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1e1b:	a3 38 1f 01 00       	mov    %eax,0x11f38
    1e20:	8b 45 90             	mov    -0x70(%ebp),%eax
    1e23:	a3 3c 1f 01 00       	mov    %eax,0x11f3c
    1e28:	8b 45 94             	mov    -0x6c(%ebp),%eax
    1e2b:	a3 40 1f 01 00       	mov    %eax,0x11f40
    1e30:	8b 45 98             	mov    -0x68(%ebp),%eax
    1e33:	a3 44 1f 01 00       	mov    %eax,0x11f44
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    1e38:	83 ec 08             	sub    $0x8,%esp
    1e3b:	6a 0c                	push   $0xc
    1e3d:	68 c0 e6 00 00       	push   $0xe6c0
    1e42:	e8 dc 0d 00 00       	call   2c23 <load_iconlist>
    1e47:	83 c4 10             	add    $0x10,%esp
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    1e4a:	83 ec 08             	sub    $0x8,%esp
    1e4d:	6a 04                	push   $0x4
    1e4f:	68 c0 e5 00 00       	push   $0xe5c0
    1e54:	e8 ca 0d 00 00       	call   2c23 <load_iconlist>
    1e59:	83 c4 10             	add    $0x10,%esp
	//testHandlers();
	mkdir("userfolder");
    1e5c:	83 ec 0c             	sub    $0xc,%esp
    1e5f:	68 cf a6 00 00       	push   $0xa6cf
    1e64:	e8 d7 1d 00 00       	call   3c40 <mkdir>
    1e69:	83 c4 10             	add    $0x10,%esp
	enterDir("userfolder");
    1e6c:	83 ec 0c             	sub    $0xc,%esp
    1e6f:	68 cf a6 00 00       	push   $0xa6cf
    1e74:	e8 a0 f2 ff ff       	call   1119 <enterDir>
    1e79:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    1e7c:	e8 46 e2 ff ff       	call   c7 <freeFileItemList>
	list(".");
    1e81:	83 ec 0c             	sub    $0xc,%esp
    1e84:	68 0f a5 00 00       	push   $0xa50f
    1e89:	e8 23 e3 ff ff       	call   1b1 <list>
    1e8e:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1e91:	8d 45 d0             	lea    -0x30(%ebp),%eax
    1e94:	83 ec 0c             	sub    $0xc,%esp
    1e97:	68 58 02 00 00       	push   $0x258
    1e9c:	68 20 03 00 00       	push   $0x320
    1ea1:	6a 00                	push   $0x0
    1ea3:	6a 00                	push   $0x0
    1ea5:	50                   	push   %eax
    1ea6:	e8 7d 15 00 00       	call   3428 <initRect>
    1eab:	83 c4 1c             	add    $0x1c,%esp
    1eae:	83 ec 0c             	sub    $0xc,%esp
    1eb1:	ff 75 dc             	pushl  -0x24(%ebp)
    1eb4:	ff 75 d8             	pushl  -0x28(%ebp)
    1eb7:	ff 75 d4             	pushl  -0x2c(%ebp)
    1eba:	ff 75 d0             	pushl  -0x30(%ebp)
    1ebd:	68 34 1f 01 00       	push   $0x11f34
    1ec2:	e8 26 17 00 00       	call   35ed <deleteClickable>
    1ec7:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1eca:	83 ec 0c             	sub    $0xc,%esp
    1ecd:	68 34 1f 01 00       	push   $0x11f34
    1ed2:	e8 59 ee ff ff       	call   d30 <addWndEvent>
    1ed7:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1eda:	83 ec 0c             	sub    $0xc,%esp
    1edd:	68 34 1f 01 00       	push   $0x11f34
    1ee2:	e8 ee ed ff ff       	call   cd5 <addListEvent>
    1ee7:	83 c4 10             	add    $0x10,%esp

	for (i = 0; i < MAX_COPY_SIZE; ++i){
    1eea:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1ef1:	eb 1f                	jmp    1f12 <main+0x150>
		filesWaited[i].fd = -1;
    1ef3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1ef6:	89 d0                	mov    %edx,%eax
    1ef8:	c1 e0 03             	shl    $0x3,%eax
    1efb:	01 d0                	add    %edx,%eax
    1efd:	c1 e0 02             	shl    $0x2,%eax
    1f00:	83 c0 20             	add    $0x20,%eax
    1f03:	05 c0 1d 01 00       	add    $0x11dc0,%eax
    1f08:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
	list(".");
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);

	for (i = 0; i < MAX_COPY_SIZE; ++i){
    1f0e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1f12:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
    1f16:	7e db                	jle    1ef3 <main+0x131>
		filesWaited[i].fd = -1;
	}
	lenOfWaited = 0;
    1f18:	c7 05 48 1f 01 00 00 	movl   $0x0,0x11f48
    1f1f:	00 00 00 
	while (isRun) {
    1f22:	e9 94 01 00 00       	jmp    20bb <main+0x2f9>
		getMsg(&msg);
    1f27:	83 ec 0c             	sub    $0xc,%esp
    1f2a:	8d 45 b8             	lea    -0x48(%ebp),%eax
    1f2d:	50                   	push   %eax
    1f2e:	e8 45 1d 00 00       	call   3c78 <getMsg>
    1f33:	83 c4 10             	add    $0x10,%esp
		switch (msg.msg_type) {
    1f36:	8b 45 b8             	mov    -0x48(%ebp),%eax
    1f39:	83 f8 08             	cmp    $0x8,%eax
    1f3c:	0f 87 78 01 00 00    	ja     20ba <main+0x2f8>
    1f42:	8b 04 85 dc a6 00 00 	mov    0xa6dc(,%eax,4),%eax
    1f49:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    1f4b:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    1f4e:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1f51:	8d 45 b0             	lea    -0x50(%ebp),%eax
    1f54:	83 ec 04             	sub    $0x4,%esp
    1f57:	51                   	push   %ecx
    1f58:	52                   	push   %edx
    1f59:	50                   	push   %eax
    1f5a:	e8 a2 14 00 00       	call   3401 <initPoint>
    1f5f:	83 c4 0c             	add    $0xc,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    1f62:	a1 38 1f 01 00       	mov    0x11f38,%eax
    1f67:	83 ec 04             	sub    $0x4,%esp
    1f6a:	ff 75 b4             	pushl  -0x4c(%ebp)
    1f6d:	ff 75 b0             	pushl  -0x50(%ebp)
    1f70:	50                   	push   %eax
    1f71:	e8 49 17 00 00       	call   36bf <executeHandler>
    1f76:	83 c4 10             	add    $0x10,%esp
    1f79:	85 c0                	test   %eax,%eax
    1f7b:	74 14                	je     1f91 <main+0x1cf>
				updateWindow(winid, context.addr);
    1f7d:	a1 28 1f 01 00       	mov    0x11f28,%eax
    1f82:	83 ec 08             	sub    $0x8,%esp
    1f85:	50                   	push   %eax
    1f86:	ff 75 e0             	pushl  -0x20(%ebp)
    1f89:	e8 02 1d 00 00       	call   3c90 <updateWindow>
    1f8e:	83 c4 10             	add    $0x10,%esp
			}
			break;
    1f91:	e9 25 01 00 00       	jmp    20bb <main+0x2f9>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderContent(context);
    1f96:	83 ec 04             	sub    $0x4,%esp
    1f99:	ff 35 30 1f 01 00    	pushl  0x11f30
    1f9f:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    1fa5:	ff 35 28 1f 01 00    	pushl  0x11f28
    1fab:	e8 0e e9 ff ff       	call   8be <drawFinderContent>
    1fb0:	83 c4 10             	add    $0x10,%esp
			drawFinderWnd(context);
    1fb3:	83 ec 04             	sub    $0x4,%esp
    1fb6:	ff 35 30 1f 01 00    	pushl  0x11f30
    1fbc:	ff 35 2c 1f 01 00    	pushl  0x11f2c
    1fc2:	ff 35 28 1f 01 00    	pushl  0x11f28
    1fc8:	e8 f5 e7 ff ff       	call   7c2 <drawFinderWnd>
    1fcd:	83 c4 10             	add    $0x10,%esp
			updateWindow(winid, context.addr);
    1fd0:	a1 28 1f 01 00       	mov    0x11f28,%eax
    1fd5:	83 ec 08             	sub    $0x8,%esp
    1fd8:	50                   	push   %eax
    1fd9:	ff 75 e0             	pushl  -0x20(%ebp)
    1fdc:	e8 af 1c 00 00       	call   3c90 <updateWindow>
    1fe1:	83 c4 10             	add    $0x10,%esp
			break;
    1fe4:	e9 d2 00 00 00       	jmp    20bb <main+0x2f9>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    1fe9:	8b 75 c8             	mov    -0x38(%ebp),%esi
    1fec:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
    1fef:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    1ff2:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1ff5:	a1 28 1f 01 00       	mov    0x11f28,%eax
    1ffa:	83 ec 08             	sub    $0x8,%esp
    1ffd:	56                   	push   %esi
    1ffe:	53                   	push   %ebx
    1fff:	51                   	push   %ecx
    2000:	52                   	push   %edx
    2001:	50                   	push   %eax
    2002:	ff 75 e0             	pushl  -0x20(%ebp)
    2005:	e8 8e 1c 00 00       	call   3c98 <updatePartialWindow>
    200a:	83 c4 20             	add    $0x20,%esp
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    200d:	e9 a9 00 00 00       	jmp    20bb <main+0x2f9>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2012:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2015:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2018:	8d 45 80             	lea    -0x80(%ebp),%eax
    201b:	83 ec 04             	sub    $0x4,%esp
    201e:	51                   	push   %ecx
    201f:	52                   	push   %edx
    2020:	50                   	push   %eax
    2021:	e8 db 13 00 00       	call   3401 <initPoint>
    2026:	83 c4 0c             	add    $0xc,%esp
    2029:	8b 45 80             	mov    -0x80(%ebp),%eax
    202c:	8b 55 84             	mov    -0x7c(%ebp),%edx
    202f:	89 45 b0             	mov    %eax,-0x50(%ebp)
    2032:	89 55 b4             	mov    %edx,-0x4c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.left_click, p)) {
    2035:	a1 34 1f 01 00       	mov    0x11f34,%eax
    203a:	83 ec 04             	sub    $0x4,%esp
    203d:	ff 75 b4             	pushl  -0x4c(%ebp)
    2040:	ff 75 b0             	pushl  -0x50(%ebp)
    2043:	50                   	push   %eax
    2044:	e8 76 16 00 00       	call   36bf <executeHandler>
    2049:	83 c4 10             	add    $0x10,%esp
    204c:	85 c0                	test   %eax,%eax
    204e:	74 14                	je     2064 <main+0x2a2>

				updateWindow(winid, context.addr);
    2050:	a1 28 1f 01 00       	mov    0x11f28,%eax
    2055:	83 ec 08             	sub    $0x8,%esp
    2058:	50                   	push   %eax
    2059:	ff 75 e0             	pushl  -0x20(%ebp)
    205c:	e8 2f 1c 00 00       	call   3c90 <updateWindow>
    2061:	83 c4 10             	add    $0x10,%esp
			}
			break;
    2064:	eb 55                	jmp    20bb <main+0x2f9>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2066:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    2069:	8b 55 bc             	mov    -0x44(%ebp),%edx
    206c:	8d 45 80             	lea    -0x80(%ebp),%eax
    206f:	83 ec 04             	sub    $0x4,%esp
    2072:	51                   	push   %ecx
    2073:	52                   	push   %edx
    2074:	50                   	push   %eax
    2075:	e8 87 13 00 00       	call   3401 <initPoint>
    207a:	83 c4 0c             	add    $0xc,%esp
    207d:	8b 45 80             	mov    -0x80(%ebp),%eax
    2080:	8b 55 84             	mov    -0x7c(%ebp),%edx
    2083:	89 45 b0             	mov    %eax,-0x50(%ebp)
    2086:	89 55 b4             	mov    %edx,-0x4c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    2089:	a1 3c 1f 01 00       	mov    0x11f3c,%eax
    208e:	83 ec 04             	sub    $0x4,%esp
    2091:	ff 75 b4             	pushl  -0x4c(%ebp)
    2094:	ff 75 b0             	pushl  -0x50(%ebp)
    2097:	50                   	push   %eax
    2098:	e8 22 16 00 00       	call   36bf <executeHandler>
    209d:	83 c4 10             	add    $0x10,%esp
    20a0:	85 c0                	test   %eax,%eax
    20a2:	74 14                	je     20b8 <main+0x2f6>
				updateWindow(winid, context.addr);
    20a4:	a1 28 1f 01 00       	mov    0x11f28,%eax
    20a9:	83 ec 08             	sub    $0x8,%esp
    20ac:	50                   	push   %eax
    20ad:	ff 75 e0             	pushl  -0x20(%ebp)
    20b0:	e8 db 1b 00 00       	call   3c90 <updateWindow>
    20b5:	83 c4 10             	add    $0x10,%esp
			}
			break;
    20b8:	eb 01                	jmp    20bb <main+0x2f9>
		default:
			break;
    20ba:	90                   	nop

	for (i = 0; i < MAX_COPY_SIZE; ++i){
		filesWaited[i].fd = -1;
	}
	lenOfWaited = 0;
	while (isRun) {
    20bb:	a1 80 e5 00 00       	mov    0xe580,%eax
    20c0:	85 c0                	test   %eax,%eax
    20c2:	0f 85 5f fe ff ff    	jne    1f27 <main+0x165>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    20c8:	83 ec 08             	sub    $0x8,%esp
    20cb:	ff 75 e0             	pushl  -0x20(%ebp)
    20ce:	68 28 1f 01 00       	push   $0x11f28
    20d3:	e8 95 01 00 00       	call   226d <free_context>
    20d8:	83 c4 10             	add    $0x10,%esp
	exit();
    20db:	e8 f8 1a 00 00       	call   3bd8 <exit>

000020e0 <testHandlers>:
}

void testHandlers() {
    20e0:	55                   	push   %ebp
    20e1:	89 e5                	mov    %esp,%ebp
    20e3:	83 ec 08             	sub    $0x8,%esp

	list(".");
    20e6:	83 ec 0c             	sub    $0xc,%esp
    20e9:	68 0f a5 00 00       	push   $0xa50f
    20ee:	e8 be e0 ff ff       	call   1b1 <list>
    20f3:	83 c4 10             	add    $0x10,%esp
	printf(0, "original list:\n");
    20f6:	83 ec 08             	sub    $0x8,%esp
    20f9:	68 00 a7 00 00       	push   $0xa700
    20fe:	6a 00                	push   $0x0
    2100:	e8 b0 1c 00 00       	call   3db5 <printf>
    2105:	83 c4 10             	add    $0x10,%esp
	printItemList();
    2108:	e8 29 ea ff ff       	call   b36 <printItemList>
	printf(0, "\n");
    210d:	83 ec 08             	sub    $0x8,%esp
    2110:	68 10 a7 00 00       	push   $0xa710
    2115:	6a 00                	push   $0x0
    2117:	e8 99 1c 00 00       	call   3db5 <printf>
    211c:	83 c4 10             	add    $0x10,%esp
	printf(0, "new a folder:\n");
    211f:	83 ec 08             	sub    $0x8,%esp
    2122:	68 12 a7 00 00       	push   $0xa712
    2127:	6a 00                	push   $0x0
    2129:	e8 87 1c 00 00       	call   3db5 <printf>
    212e:	83 c4 10             	add    $0x10,%esp
	newFolder("newfolder");
    2131:	83 ec 0c             	sub    $0xc,%esp
    2134:	68 21 a7 00 00       	push   $0xa721
    2139:	e8 e9 f2 ff ff       	call   1427 <newFolder>
    213e:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    2141:	e8 81 df ff ff       	call   c7 <freeFileItemList>
	list(".");
    2146:	83 ec 0c             	sub    $0xc,%esp
    2149:	68 0f a5 00 00       	push   $0xa50f
    214e:	e8 5e e0 ff ff       	call   1b1 <list>
    2153:	83 c4 10             	add    $0x10,%esp
	printItemList();
    2156:	e8 db e9 ff ff       	call   b36 <printItemList>
	printf(0, "\n");
    215b:	83 ec 08             	sub    $0x8,%esp
    215e:	68 10 a7 00 00       	push   $0xa710
    2163:	6a 00                	push   $0x0
    2165:	e8 4b 1c 00 00       	call   3db5 <printf>
    216a:	83 c4 10             	add    $0x10,%esp
	printf(0, "enter new folder:\n");
    216d:	83 ec 08             	sub    $0x8,%esp
    2170:	68 2b a7 00 00       	push   $0xa72b
    2175:	6a 00                	push   $0x0
    2177:	e8 39 1c 00 00       	call   3db5 <printf>
    217c:	83 c4 10             	add    $0x10,%esp
	enterDir("newfolder");
    217f:	83 ec 0c             	sub    $0xc,%esp
    2182:	68 21 a7 00 00       	push   $0xa721
    2187:	e8 8d ef ff ff       	call   1119 <enterDir>
    218c:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    218f:	e8 33 df ff ff       	call   c7 <freeFileItemList>
	list(".");
    2194:	83 ec 0c             	sub    $0xc,%esp
    2197:	68 0f a5 00 00       	push   $0xa50f
    219c:	e8 10 e0 ff ff       	call   1b1 <list>
    21a1:	83 c4 10             	add    $0x10,%esp
	printItemList();
    21a4:	e8 8d e9 ff ff       	call   b36 <printItemList>
	printf(0, "\n");
    21a9:	83 ec 08             	sub    $0x8,%esp
    21ac:	68 10 a7 00 00       	push   $0xa710
    21b1:	6a 00                	push   $0x0
    21b3:	e8 fd 1b 00 00       	call   3db5 <printf>
    21b8:	83 c4 10             	add    $0x10,%esp
	printf(0, "new a file:\n");
    21bb:	83 ec 08             	sub    $0x8,%esp
    21be:	68 3e a7 00 00       	push   $0xa73e
    21c3:	6a 00                	push   $0x0
    21c5:	e8 eb 1b 00 00       	call   3db5 <printf>
    21ca:	83 c4 10             	add    $0x10,%esp
	newFile("newfile.txt");
    21cd:	83 ec 0c             	sub    $0xc,%esp
    21d0:	68 4b a7 00 00       	push   $0xa74b
    21d5:	e8 63 f0 ff ff       	call   123d <newFile>
    21da:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    21dd:	e8 e5 de ff ff       	call   c7 <freeFileItemList>
	list(".");
    21e2:	83 ec 0c             	sub    $0xc,%esp
    21e5:	68 0f a5 00 00       	push   $0xa50f
    21ea:	e8 c2 df ff ff       	call   1b1 <list>
    21ef:	83 c4 10             	add    $0x10,%esp
	printItemList();
    21f2:	e8 3f e9 ff ff       	call   b36 <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    21f7:	c9                   	leave  
    21f8:	c3                   	ret    

000021f9 <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    21f9:	55                   	push   %ebp
    21fa:	89 e5                	mov    %esp,%ebp
    21fc:	83 ec 08             	sub    $0x8,%esp
    context_ptr->width = width;
    21ff:	8b 45 08             	mov    0x8(%ebp),%eax
    2202:	8b 55 0c             	mov    0xc(%ebp),%edx
    2205:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    2208:	8b 45 08             	mov    0x8(%ebp),%eax
    220b:	8b 55 10             	mov    0x10(%ebp),%edx
    220e:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    2211:	8b 55 0c             	mov    0xc(%ebp),%edx
    2214:	8b 45 10             	mov    0x10(%ebp),%eax
    2217:	0f af c2             	imul   %edx,%eax
    221a:	01 c0                	add    %eax,%eax
    221c:	83 ec 0c             	sub    $0xc,%esp
    221f:	50                   	push   %eax
    2220:	e8 61 1e 00 00       	call   4086 <malloc>
    2225:	83 c4 10             	add    $0x10,%esp
    2228:	89 c2                	mov    %eax,%edx
    222a:	8b 45 08             	mov    0x8(%ebp),%eax
    222d:	89 10                	mov    %edx,(%eax)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    222f:	8b 55 0c             	mov    0xc(%ebp),%edx
    2232:	8b 45 10             	mov    0x10(%ebp),%eax
    2235:	0f af c2             	imul   %edx,%eax
    2238:	8d 14 00             	lea    (%eax,%eax,1),%edx
    223b:	8b 45 08             	mov    0x8(%ebp),%eax
    223e:	8b 00                	mov    (%eax),%eax
    2240:	83 ec 04             	sub    $0x4,%esp
    2243:	52                   	push   %edx
    2244:	6a 00                	push   $0x0
    2246:	50                   	push   %eax
    2247:	e8 f2 17 00 00       	call   3a3e <memset>
    224c:	83 c4 10             	add    $0x10,%esp
    initializeASCII();
    224f:	e8 73 01 00 00       	call   23c7 <initializeASCII>
    initializeGBK();
    2254:	e8 f4 02 00 00       	call   254d <initializeGBK>
    return createWindow(0, 0, width, height);
    2259:	ff 75 10             	pushl  0x10(%ebp)
    225c:	ff 75 0c             	pushl  0xc(%ebp)
    225f:	6a 00                	push   $0x0
    2261:	6a 00                	push   $0x0
    2263:	e8 18 1a 00 00       	call   3c80 <createWindow>
    2268:	83 c4 10             	add    $0x10,%esp
}
    226b:	c9                   	leave  
    226c:	c3                   	ret    

0000226d <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    226d:	55                   	push   %ebp
    226e:	89 e5                	mov    %esp,%ebp
    2270:	83 ec 08             	sub    $0x8,%esp
    free(context_ptr->addr);
    2273:	8b 45 08             	mov    0x8(%ebp),%eax
    2276:	8b 00                	mov    (%eax),%eax
    2278:	83 ec 0c             	sub    $0xc,%esp
    227b:	50                   	push   %eax
    227c:	e8 c4 1c 00 00       	call   3f45 <free>
    2281:	83 c4 10             	add    $0x10,%esp
    freeASCII();
    2284:	e8 ab 02 00 00       	call   2534 <freeASCII>
    freeGBK();
    2289:	e8 60 03 00 00       	call   25ee <freeGBK>
    destroyWindow(winid);
    228e:	83 ec 0c             	sub    $0xc,%esp
    2291:	ff 75 0c             	pushl  0xc(%ebp)
    2294:	e8 ef 19 00 00       	call   3c88 <destroyWindow>
    2299:	83 c4 10             	add    $0x10,%esp
}
    229c:	c9                   	leave  
    229d:	c3                   	ret    

0000229e <draw_point>:
*             then do nothing!
*/

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    229e:	55                   	push   %ebp
    229f:	89 e5                	mov    %esp,%ebp
    22a1:	83 ec 04             	sub    $0x4,%esp
    22a4:	8b 45 1c             	mov    0x1c(%ebp),%eax
    22a7:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width) 
    22ab:	8b 45 0c             	mov    0xc(%ebp),%eax
    22ae:	3b 45 14             	cmp    0x14(%ebp),%eax
    22b1:	77 02                	ja     22b5 <draw_point+0x17>
    return;
    22b3:	eb 26                	jmp    22db <draw_point+0x3d>
  if(y >= c.height)
    22b5:	8b 45 10             	mov    0x10(%ebp),%eax
    22b8:	3b 45 18             	cmp    0x18(%ebp),%eax
    22bb:	77 02                	ja     22bf <draw_point+0x21>
    return;
    22bd:	eb 1c                	jmp    22db <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    22bf:	8b 45 08             	mov    0x8(%ebp),%eax
    22c2:	8b 55 0c             	mov    0xc(%ebp),%edx
    22c5:	89 d1                	mov    %edx,%ecx
    22c7:	0f af 4d 18          	imul   0x18(%ebp),%ecx
    22cb:	8b 55 14             	mov    0x14(%ebp),%edx
    22ce:	01 ca                	add    %ecx,%edx
    22d0:	01 d2                	add    %edx,%edx
    22d2:	01 c2                	add    %eax,%edx
    22d4:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    22d8:	66 89 02             	mov    %ax,(%edx)
}
    22db:	c9                   	leave  
    22dc:	c3                   	ret    

000022dd <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    22dd:	55                   	push   %ebp
    22de:	89 e5                	mov    %esp,%ebp
    22e0:	83 ec 14             	sub    $0x14,%esp
    22e3:	8b 45 24             	mov    0x24(%ebp),%eax
    22e6:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    22ea:	8b 55 14             	mov    0x14(%ebp),%edx
    22ed:	8b 45 1c             	mov    0x1c(%ebp),%eax
    22f0:	01 d0                	add    %edx,%eax
    22f2:	8b 55 0c             	mov    0xc(%ebp),%edx
    22f5:	39 d0                	cmp    %edx,%eax
    22f7:	0f 47 c2             	cmova  %edx,%eax
    22fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height; 
    22fd:	8b 55 18             	mov    0x18(%ebp),%edx
    2300:	8b 45 20             	mov    0x20(%ebp),%eax
    2303:	01 d0                	add    %edx,%eax
    2305:	8b 55 10             	mov    0x10(%ebp),%edx
    2308:	39 d0                	cmp    %edx,%eax
    230a:	0f 47 c2             	cmova  %edx,%eax
    230d:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    2310:	8b 45 18             	mov    0x18(%ebp),%eax
    2313:	89 45 f8             	mov    %eax,-0x8(%ebp)
    2316:	eb 36                	jmp    234e <fill_rect+0x71>
	{
		for (x = bx; x < mx; x++)
    2318:	8b 45 14             	mov    0x14(%ebp),%eax
    231b:	89 45 fc             	mov    %eax,-0x4(%ebp)
    231e:	eb 22                	jmp    2342 <fill_rect+0x65>
		{
			draw_point(c, x, y, color);
    2320:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    2324:	8b 55 f8             	mov    -0x8(%ebp),%edx
    2327:	8b 45 fc             	mov    -0x4(%ebp),%eax
    232a:	51                   	push   %ecx
    232b:	52                   	push   %edx
    232c:	50                   	push   %eax
    232d:	ff 75 10             	pushl  0x10(%ebp)
    2330:	ff 75 0c             	pushl  0xc(%ebp)
    2333:	ff 75 08             	pushl  0x8(%ebp)
    2336:	e8 63 ff ff ff       	call   229e <draw_point>
    233b:	83 c4 18             	add    $0x18,%esp
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    233e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    2342:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2345:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2348:	7c d6                	jl     2320 <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
    234a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    234e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2351:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    2354:	7c c2                	jl     2318 <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    2356:	c9                   	leave  
    2357:	c3                   	ret    

00002358 <printBinary>:

void printBinary(char c)
{
    2358:	55                   	push   %ebp
    2359:	89 e5                	mov    %esp,%ebp
    235b:	83 ec 28             	sub    $0x28,%esp
    235e:	8b 45 08             	mov    0x8(%ebp),%eax
    2361:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    2364:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    236b:	eb 40                	jmp    23ad <printBinary+0x55>
	{
		if(((c << i) & 0x80) != 0)
    236d:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    2371:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2374:	89 c1                	mov    %eax,%ecx
    2376:	d3 e2                	shl    %cl,%edx
    2378:	89 d0                	mov    %edx,%eax
    237a:	25 80 00 00 00       	and    $0x80,%eax
    237f:	85 c0                	test   %eax,%eax
    2381:	74 14                	je     2397 <printBinary+0x3f>
		{
			printf(0, "1");
    2383:	83 ec 08             	sub    $0x8,%esp
    2386:	68 57 a7 00 00       	push   $0xa757
    238b:	6a 00                	push   $0x0
    238d:	e8 23 1a 00 00       	call   3db5 <printf>
    2392:	83 c4 10             	add    $0x10,%esp
    2395:	eb 12                	jmp    23a9 <printBinary+0x51>
		}
		else
		{
			printf(0, "0");
    2397:	83 ec 08             	sub    $0x8,%esp
    239a:	68 59 a7 00 00       	push   $0xa759
    239f:	6a 00                	push   $0x0
    23a1:	e8 0f 1a 00 00       	call   3db5 <printf>
    23a6:	83 c4 10             	add    $0x10,%esp
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    23a9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    23ad:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    23b1:	7e ba                	jle    236d <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    23b3:	83 ec 08             	sub    $0x8,%esp
    23b6:	68 5b a7 00 00       	push   $0xa75b
    23bb:	6a 00                	push   $0x0
    23bd:	e8 f3 19 00 00       	call   3db5 <printf>
    23c2:	83 c4 10             	add    $0x10,%esp
}
    23c5:	c9                   	leave  
    23c6:	c3                   	ret    

000023c7 <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    23c7:	55                   	push   %ebp
    23c8:	89 e5                	mov    %esp,%ebp
    23ca:	56                   	push   %esi
    23cb:	53                   	push   %ebx
    23cc:	83 ec 20             	sub    $0x20,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    23cf:	83 ec 08             	sub    $0x8,%esp
    23d2:	68 5d a7 00 00       	push   $0xa75d
    23d7:	6a 00                	push   $0x0
    23d9:	e8 d7 19 00 00       	call   3db5 <printf>
    23de:	83 c4 10             	add    $0x10,%esp
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    23e1:	83 ec 08             	sub    $0x8,%esp
    23e4:	6a 00                	push   $0x0
    23e6:	68 70 a7 00 00       	push   $0xa770
    23eb:	e8 28 18 00 00       	call   3c18 <open>
    23f0:	83 c4 10             	add    $0x10,%esp
    23f3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    23f6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    23fa:	79 1c                	jns    2418 <initializeASCII+0x51>
	  printf(0,"cannot open %s\n", HANKAKU);
    23fc:	83 ec 04             	sub    $0x4,%esp
    23ff:	68 70 a7 00 00       	push   $0xa770
    2404:	68 7c a7 00 00       	push   $0xa77c
    2409:	6a 00                	push   $0x0
    240b:	e8 a5 19 00 00       	call   3db5 <printf>
    2410:	83 c4 10             	add    $0x10,%esp
	  return;
    2413:	e9 15 01 00 00       	jmp    252d <initializeASCII+0x166>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    2418:	83 ec 0c             	sub    $0xc,%esp
    241b:	68 00 10 00 00       	push   $0x1000
    2420:	e8 61 1c 00 00       	call   4086 <malloc>
    2425:	83 c4 10             	add    $0x10,%esp
    2428:	a3 80 1f 01 00       	mov    %eax,0x11f80
	for (i = 0; i < ASCII_NUM; i++)
    242d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2434:	eb 12                	jmp    2448 <initializeASCII+0x81>
	{
		hankaku[i] = 0;
    2436:	8b 15 80 1f 01 00    	mov    0x11f80,%edx
    243c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    243f:	01 d0                	add    %edx,%eax
    2441:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    2444:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2448:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    244f:	7e e5                	jle    2436 <initializeASCII+0x6f>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    2451:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    2458:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    245f:	e9 84 00 00 00       	jmp    24e8 <initializeASCII+0x121>
	{
		for (i = 0; i < n; i++){
    2464:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    246b:	eb 73                	jmp    24e0 <initializeASCII+0x119>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    246d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2470:	05 c0 1f 01 00       	add    $0x11fc0,%eax
    2475:	0f b6 00             	movzbl (%eax),%eax
    2478:	3c 2a                	cmp    $0x2a,%al
    247a:	74 0f                	je     248b <initializeASCII+0xc4>
    247c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    247f:	05 c0 1f 01 00       	add    $0x11fc0,%eax
    2484:	0f b6 00             	movzbl (%eax),%eax
    2487:	3c 2e                	cmp    $0x2e,%al
    2489:	75 51                	jne    24dc <initializeASCII+0x115>
			{
				if (buf[i] == '*')
    248b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    248e:	05 c0 1f 01 00       	add    $0x11fc0,%eax
    2493:	0f b6 00             	movzbl (%eax),%eax
    2496:	3c 2a                	cmp    $0x2a,%al
    2498:	75 2d                	jne    24c7 <initializeASCII+0x100>
				{
					hankaku[y] |= (0x80 >> x);
    249a:	8b 15 80 1f 01 00    	mov    0x11f80,%edx
    24a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24a3:	01 c2                	add    %eax,%edx
    24a5:	8b 0d 80 1f 01 00    	mov    0x11f80,%ecx
    24ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24ae:	01 c8                	add    %ecx,%eax
    24b0:	0f b6 00             	movzbl (%eax),%eax
    24b3:	89 c3                	mov    %eax,%ebx
    24b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    24b8:	be 80 00 00 00       	mov    $0x80,%esi
    24bd:	89 c1                	mov    %eax,%ecx
    24bf:	d3 fe                	sar    %cl,%esi
    24c1:	89 f0                	mov    %esi,%eax
    24c3:	09 d8                	or     %ebx,%eax
    24c5:	88 02                	mov    %al,(%edx)
				}
				x ++;
    24c7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    24cb:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    24cf:	7e 0b                	jle    24dc <initializeASCII+0x115>
				{
					x = 0;
    24d1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    24d8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    24dc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    24e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24e3:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    24e6:	7c 85                	jl     246d <initializeASCII+0xa6>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    24e8:	83 ec 04             	sub    $0x4,%esp
    24eb:	68 00 02 00 00       	push   $0x200
    24f0:	68 c0 1f 01 00       	push   $0x11fc0
    24f5:	ff 75 e8             	pushl  -0x18(%ebp)
    24f8:	e8 f3 16 00 00       	call   3bf0 <read>
    24fd:	83 c4 10             	add    $0x10,%esp
    2500:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2503:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2507:	0f 8f 57 ff ff ff    	jg     2464 <initializeASCII+0x9d>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    250d:	83 ec 08             	sub    $0x8,%esp
    2510:	68 8c a7 00 00       	push   $0xa78c
    2515:	6a 00                	push   $0x0
    2517:	e8 99 18 00 00       	call   3db5 <printf>
    251c:	83 c4 10             	add    $0x10,%esp
	close(fd);
    251f:	83 ec 0c             	sub    $0xc,%esp
    2522:	ff 75 e8             	pushl  -0x18(%ebp)
    2525:	e8 d6 16 00 00       	call   3c00 <close>
    252a:	83 c4 10             	add    $0x10,%esp
}
    252d:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2530:	5b                   	pop    %ebx
    2531:	5e                   	pop    %esi
    2532:	5d                   	pop    %ebp
    2533:	c3                   	ret    

00002534 <freeASCII>:

void freeASCII(){
    2534:	55                   	push   %ebp
    2535:	89 e5                	mov    %esp,%ebp
    2537:	83 ec 08             	sub    $0x8,%esp
	free(hankaku);
    253a:	a1 80 1f 01 00       	mov    0x11f80,%eax
    253f:	83 ec 0c             	sub    $0xc,%esp
    2542:	50                   	push   %eax
    2543:	e8 fd 19 00 00       	call   3f45 <free>
    2548:	83 c4 10             	add    $0x10,%esp
}
    254b:	c9                   	leave  
    254c:	c3                   	ret    

0000254d <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    254d:	55                   	push   %ebp
    254e:	89 e5                	mov    %esp,%ebp
    2550:	83 ec 18             	sub    $0x18,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    2553:	83 ec 08             	sub    $0x8,%esp
    2556:	68 a9 a7 00 00       	push   $0xa7a9
    255b:	6a 00                	push   $0x0
    255d:	e8 53 18 00 00       	call   3db5 <printf>
    2562:	83 c4 10             	add    $0x10,%esp
	if((fd = open(HZK16, 0)) < 0){
    2565:	83 ec 08             	sub    $0x8,%esp
    2568:	6a 00                	push   $0x0
    256a:	68 ba a7 00 00       	push   $0xa7ba
    256f:	e8 a4 16 00 00       	call   3c18 <open>
    2574:	83 c4 10             	add    $0x10,%esp
    2577:	89 45 f4             	mov    %eax,-0xc(%ebp)
    257a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    257e:	79 19                	jns    2599 <initializeGBK+0x4c>
		printf(0,"cannot open %s\n", HZK16);
    2580:	83 ec 04             	sub    $0x4,%esp
    2583:	68 ba a7 00 00       	push   $0xa7ba
    2588:	68 7c a7 00 00       	push   $0xa77c
    258d:	6a 00                	push   $0x0
    258f:	e8 21 18 00 00       	call   3db5 <printf>
    2594:	83 c4 10             	add    $0x10,%esp
		return;
    2597:	eb 53                	jmp    25ec <initializeGBK+0x9f>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    2599:	83 ec 0c             	sub    $0xc,%esp
    259c:	68 78 69 00 00       	push   $0x6978
    25a1:	e8 e0 1a 00 00       	call   4086 <malloc>
    25a6:	83 c4 10             	add    $0x10,%esp
    25a9:	a3 84 1f 01 00       	mov    %eax,0x11f84
	fontFile.size = read(fd, fontFile.buf, 27000);
    25ae:	a1 84 1f 01 00       	mov    0x11f84,%eax
    25b3:	83 ec 04             	sub    $0x4,%esp
    25b6:	68 78 69 00 00       	push   $0x6978
    25bb:	50                   	push   %eax
    25bc:	ff 75 f4             	pushl  -0xc(%ebp)
    25bf:	e8 2c 16 00 00       	call   3bf0 <read>
    25c4:	83 c4 10             	add    $0x10,%esp
    25c7:	a3 88 1f 01 00       	mov    %eax,0x11f88
	printf(0,"initialzing gbk complete!\n");
    25cc:	83 ec 08             	sub    $0x8,%esp
    25cf:	68 c4 a7 00 00       	push   $0xa7c4
    25d4:	6a 00                	push   $0x0
    25d6:	e8 da 17 00 00       	call   3db5 <printf>
    25db:	83 c4 10             	add    $0x10,%esp
	close(fd);
    25de:	83 ec 0c             	sub    $0xc,%esp
    25e1:	ff 75 f4             	pushl  -0xc(%ebp)
    25e4:	e8 17 16 00 00       	call   3c00 <close>
    25e9:	83 c4 10             	add    $0x10,%esp
}
    25ec:	c9                   	leave  
    25ed:	c3                   	ret    

000025ee <freeGBK>:

void freeGBK(){
    25ee:	55                   	push   %ebp
    25ef:	89 e5                	mov    %esp,%ebp
    25f1:	83 ec 08             	sub    $0x8,%esp
	free(fontFile.buf);
    25f4:	a1 84 1f 01 00       	mov    0x11f84,%eax
    25f9:	83 ec 0c             	sub    $0xc,%esp
    25fc:	50                   	push   %eax
    25fd:	e8 43 19 00 00       	call   3f45 <free>
    2602:	83 c4 10             	add    $0x10,%esp
}
    2605:	c9                   	leave  
    2606:	c3                   	ret    

00002607 <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    2607:	55                   	push   %ebp
    2608:	89 e5                	mov    %esp,%ebp
    260a:	53                   	push   %ebx
    260b:	83 ec 18             	sub    $0x18,%esp
    260e:	8b 55 14             	mov    0x14(%ebp),%edx
    2611:	8b 45 18             	mov    0x18(%ebp),%eax
    2614:	88 55 e8             	mov    %dl,-0x18(%ebp)
    2617:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    261b:	8b 45 20             	mov    0x20(%ebp),%eax
    261e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2621:	eb 6b                	jmp    268e <put_ascii+0x87>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    2623:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    262a:	eb 58                	jmp    2684 <put_ascii+0x7d>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    262c:	8b 15 80 1f 01 00    	mov    0x11f80,%edx
    2632:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
    2636:	c1 e0 04             	shl    $0x4,%eax
    2639:	89 c1                	mov    %eax,%ecx
    263b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    263e:	2b 45 20             	sub    0x20(%ebp),%eax
    2641:	01 c8                	add    %ecx,%eax
    2643:	01 d0                	add    %edx,%eax
    2645:	0f b6 00             	movzbl (%eax),%eax
    2648:	0f b6 d0             	movzbl %al,%edx
    264b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    264e:	89 c1                	mov    %eax,%ecx
    2650:	d3 e2                	shl    %cl,%edx
    2652:	89 d0                	mov    %edx,%eax
    2654:	25 80 00 00 00       	and    $0x80,%eax
    2659:	85 c0                	test   %eax,%eax
    265b:	74 23                	je     2680 <put_ascii+0x79>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    265d:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2661:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2664:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2667:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    266a:	01 d9                	add    %ebx,%ecx
    266c:	52                   	push   %edx
    266d:	50                   	push   %eax
    266e:	51                   	push   %ecx
    266f:	ff 75 10             	pushl  0x10(%ebp)
    2672:	ff 75 0c             	pushl  0xc(%ebp)
    2675:	ff 75 08             	pushl  0x8(%ebp)
    2678:	e8 21 fc ff ff       	call   229e <draw_point>
    267d:	83 c4 18             	add    $0x18,%esp
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    2680:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2684:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2688:	7e a2                	jle    262c <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    268a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    268e:	8b 45 20             	mov    0x20(%ebp),%eax
    2691:	83 c0 10             	add    $0x10,%eax
    2694:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2697:	7f 8a                	jg     2623 <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    2699:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    269c:	c9                   	leave  
    269d:	c3                   	ret    

0000269e <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    269e:	55                   	push   %ebp
    269f:	89 e5                	mov    %esp,%ebp
    26a1:	53                   	push   %ebx
    26a2:	83 ec 18             	sub    $0x18,%esp
    26a5:	8b 55 14             	mov    0x14(%ebp),%edx
    26a8:	8b 45 18             	mov    0x18(%ebp),%eax
    26ab:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    26af:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    26b3:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    26b7:	0f b6 c0             	movzbl %al,%eax
    26ba:	3d a0 00 00 00       	cmp    $0xa0,%eax
    26bf:	0f 8e 1e 01 00 00    	jle    27e3 <put_gbk+0x145>
    26c5:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    26c9:	66 c1 f8 08          	sar    $0x8,%ax
    26cd:	98                   	cwtl   
    26ce:	0f b6 c0             	movzbl %al,%eax
    26d1:	3d a0 00 00 00       	cmp    $0xa0,%eax
    26d6:	0f 8e 07 01 00 00    	jle    27e3 <put_gbk+0x145>
		hzk16Base = fontFile.buf;
    26dc:	a1 84 1f 01 00       	mov    0x11f84,%eax
    26e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    26e4:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    26e8:	0f b6 c0             	movzbl %al,%eax
    26eb:	2d a1 00 00 00       	sub    $0xa1,%eax
    26f0:	6b c0 5e             	imul   $0x5e,%eax,%eax
    26f3:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    26f7:	66 c1 fa 08          	sar    $0x8,%dx
    26fb:	0f bf d2             	movswl %dx,%edx
    26fe:	0f b6 d2             	movzbl %dl,%edx
    2701:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    2707:	01 d0                	add    %edx,%eax
    2709:	c1 e0 05             	shl    $0x5,%eax
    270c:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    270f:	8b 45 20             	mov    0x20(%ebp),%eax
    2712:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2715:	e9 b8 00 00 00       	jmp    27d2 <put_gbk+0x134>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    271a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2721:	eb 47                	jmp    276a <put_gbk+0xcc>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    2723:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2726:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2729:	01 d0                	add    %edx,%eax
    272b:	0f b6 00             	movzbl (%eax),%eax
    272e:	0f b6 d0             	movzbl %al,%edx
    2731:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2734:	89 c1                	mov    %eax,%ecx
    2736:	d3 e2                	shl    %cl,%edx
    2738:	89 d0                	mov    %edx,%eax
    273a:	25 80 00 00 00       	and    $0x80,%eax
    273f:	85 c0                	test   %eax,%eax
    2741:	74 23                	je     2766 <put_gbk+0xc8>
					draw_point(c, x + tmpX, tmpY, colorNum);
    2743:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2747:	8b 45 f4             	mov    -0xc(%ebp),%eax
    274a:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    274d:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    2750:	01 d9                	add    %ebx,%ecx
    2752:	52                   	push   %edx
    2753:	50                   	push   %eax
    2754:	51                   	push   %ecx
    2755:	ff 75 10             	pushl  0x10(%ebp)
    2758:	ff 75 0c             	pushl  0xc(%ebp)
    275b:	ff 75 08             	pushl  0x8(%ebp)
    275e:	e8 3b fb ff ff       	call   229e <draw_point>
    2763:	83 c4 18             	add    $0x18,%esp
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2766:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    276a:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    276e:	7e b3                	jle    2723 <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    2770:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2774:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    277b:	eb 47                	jmp    27c4 <put_gbk+0x126>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    277d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2780:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2783:	01 d0                	add    %edx,%eax
    2785:	0f b6 00             	movzbl (%eax),%eax
    2788:	0f b6 d0             	movzbl %al,%edx
    278b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    278e:	89 c1                	mov    %eax,%ecx
    2790:	d3 e2                	shl    %cl,%edx
    2792:	89 d0                	mov    %edx,%eax
    2794:	25 80 00 00 00       	and    $0x80,%eax
    2799:	85 c0                	test   %eax,%eax
    279b:	74 23                	je     27c0 <put_gbk+0x122>
					draw_point(c, x + tmpX, tmpY, colorNum);
    279d:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    27a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27a4:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    27a7:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    27aa:	01 d9                	add    %ebx,%ecx
    27ac:	52                   	push   %edx
    27ad:	50                   	push   %eax
    27ae:	51                   	push   %ecx
    27af:	ff 75 10             	pushl  0x10(%ebp)
    27b2:	ff 75 0c             	pushl  0xc(%ebp)
    27b5:	ff 75 08             	pushl  0x8(%ebp)
    27b8:	e8 e1 fa ff ff       	call   229e <draw_point>
    27bd:	83 c4 18             	add    $0x18,%esp
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    27c0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    27c4:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    27c8:	7e b3                	jle    277d <put_gbk+0xdf>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    27ca:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    27ce:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    27d2:	8b 45 20             	mov    0x20(%ebp),%eax
    27d5:	83 c0 10             	add    $0x10,%eax
    27d8:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    27db:	0f 8f 39 ff ff ff    	jg     271a <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    27e1:	eb 50                	jmp    2833 <put_gbk+0x195>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    27e3:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    27e7:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    27eb:	0f b6 c0             	movzbl %al,%eax
    27ee:	ff 75 20             	pushl  0x20(%ebp)
    27f1:	ff 75 1c             	pushl  0x1c(%ebp)
    27f4:	52                   	push   %edx
    27f5:	50                   	push   %eax
    27f6:	ff 75 10             	pushl  0x10(%ebp)
    27f9:	ff 75 0c             	pushl  0xc(%ebp)
    27fc:	ff 75 08             	pushl  0x8(%ebp)
    27ff:	e8 03 fe ff ff       	call   2607 <put_ascii>
    2804:	83 c4 1c             	add    $0x1c,%esp
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    2807:	8b 45 1c             	mov    0x1c(%ebp),%eax
    280a:	8d 48 08             	lea    0x8(%eax),%ecx
    280d:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2811:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2815:	66 c1 f8 08          	sar    $0x8,%ax
    2819:	0f b6 c0             	movzbl %al,%eax
    281c:	ff 75 20             	pushl  0x20(%ebp)
    281f:	51                   	push   %ecx
    2820:	52                   	push   %edx
    2821:	50                   	push   %eax
    2822:	ff 75 10             	pushl  0x10(%ebp)
    2825:	ff 75 0c             	pushl  0xc(%ebp)
    2828:	ff 75 08             	pushl  0x8(%ebp)
    282b:	e8 d7 fd ff ff       	call   2607 <put_ascii>
    2830:	83 c4 1c             	add    $0x1c,%esp
	}
}
    2833:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2836:	c9                   	leave  
    2837:	c3                   	ret    

00002838 <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    2838:	55                   	push   %ebp
    2839:	89 e5                	mov    %esp,%ebp
    283b:	83 ec 28             	sub    $0x28,%esp
    283e:	8b 45 18             	mov    0x18(%ebp),%eax
    2841:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    2845:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    284c:	83 ec 0c             	sub    $0xc,%esp
    284f:	ff 75 14             	pushl  0x14(%ebp)
    2852:	e8 c0 11 00 00       	call   3a17 <strlen>
    2857:	83 c4 10             	add    $0x10,%esp
    285a:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    285d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2864:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2867:	89 45 f0             	mov    %eax,-0x10(%ebp)
    286a:	eb 36                	jmp    28a2 <puts_str+0x6a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    286c:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2870:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2873:	8b 45 14             	mov    0x14(%ebp),%eax
    2876:	01 c8                	add    %ecx,%eax
    2878:	0f b6 00             	movzbl (%eax),%eax
    287b:	0f b6 c0             	movzbl %al,%eax
    287e:	83 ec 04             	sub    $0x4,%esp
    2881:	ff 75 20             	pushl  0x20(%ebp)
    2884:	ff 75 f0             	pushl  -0x10(%ebp)
    2887:	52                   	push   %edx
    2888:	50                   	push   %eax
    2889:	ff 75 10             	pushl  0x10(%ebp)
    288c:	ff 75 0c             	pushl  0xc(%ebp)
    288f:	ff 75 08             	pushl  0x8(%ebp)
    2892:	e8 70 fd ff ff       	call   2607 <put_ascii>
    2897:	83 c4 20             	add    $0x20,%esp
			xTmp += 8;
    289a:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    289e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    28a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28a5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    28a8:	72 c2                	jb     286c <puts_str+0x34>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    28aa:	c9                   	leave  
    28ab:	c3                   	ret    

000028ac <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    28ac:	55                   	push   %ebp
    28ad:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    28af:	8b 45 10             	mov    0x10(%ebp),%eax
    28b2:	8d 50 07             	lea    0x7(%eax),%edx
    28b5:	85 c0                	test   %eax,%eax
    28b7:	0f 48 c2             	cmovs  %edx,%eax
    28ba:	c1 f8 03             	sar    $0x3,%eax
    28bd:	89 c1                	mov    %eax,%ecx
    28bf:	8b 45 0c             	mov    0xc(%ebp),%eax
    28c2:	8d 50 03             	lea    0x3(%eax),%edx
    28c5:	85 c0                	test   %eax,%eax
    28c7:	0f 48 c2             	cmovs  %edx,%eax
    28ca:	c1 f8 02             	sar    $0x2,%eax
    28cd:	c1 e0 05             	shl    $0x5,%eax
    28d0:	01 c1                	add    %eax,%ecx
    28d2:	8b 45 08             	mov    0x8(%ebp),%eax
    28d5:	8d 50 07             	lea    0x7(%eax),%edx
    28d8:	85 c0                	test   %eax,%eax
    28da:	0f 48 c2             	cmovs  %edx,%eax
    28dd:	c1 f8 03             	sar    $0x3,%eax
    28e0:	c1 e0 0b             	shl    $0xb,%eax
    28e3:	01 c8                	add    %ecx,%eax
}
    28e5:	5d                   	pop    %ebp
    28e6:	c3                   	ret    

000028e7 <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    28e7:	55                   	push   %ebp
    28e8:	89 e5                	mov    %esp,%ebp
    28ea:	53                   	push   %ebx
    28eb:	83 ec 10             	sub    $0x10,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    28ee:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    28f5:	e9 98 00 00 00       	jmp    2992 <draw_picture+0xab>
	{
		for (j = 0; j < pic.width; j++)
    28fa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2901:	eb 7f                	jmp    2982 <draw_picture+0x9b>
		{
			rgb = pic.data[i*pic.width+j];
    2903:	8b 55 14             	mov    0x14(%ebp),%edx
    2906:	8b 45 18             	mov    0x18(%ebp),%eax
    2909:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    290d:	89 c1                	mov    %eax,%ecx
    290f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2912:	01 c8                	add    %ecx,%eax
    2914:	c1 e0 02             	shl    $0x2,%eax
    2917:	01 d0                	add    %edx,%eax
    2919:	8b 00                	mov    (%eax),%eax
    291b:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    291e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    2922:	3c 01                	cmp    $0x1,%al
    2924:	75 02                	jne    2928 <draw_picture+0x41>
    2926:	eb 56                	jmp    297e <draw_picture+0x97>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    2928:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    292c:	0f b6 c8             	movzbl %al,%ecx
    292f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    2933:	0f b6 d0             	movzbl %al,%edx
    2936:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    293a:	0f b6 c0             	movzbl %al,%eax
    293d:	51                   	push   %ecx
    293e:	52                   	push   %edx
    293f:	50                   	push   %eax
    2940:	e8 67 ff ff ff       	call   28ac <_RGB16BIT565>
    2945:	83 c4 0c             	add    $0xc,%esp
    2948:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    294c:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
    2950:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2953:	83 ea 01             	sub    $0x1,%edx
    2956:	89 d1                	mov    %edx,%ecx
    2958:	2b 4d f8             	sub    -0x8(%ebp),%ecx
    295b:	8b 55 24             	mov    0x24(%ebp),%edx
    295e:	01 ca                	add    %ecx,%edx
    2960:	89 d3                	mov    %edx,%ebx
    2962:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2965:	8b 55 20             	mov    0x20(%ebp),%edx
    2968:	01 ca                	add    %ecx,%edx
    296a:	50                   	push   %eax
    296b:	53                   	push   %ebx
    296c:	52                   	push   %edx
    296d:	ff 75 10             	pushl  0x10(%ebp)
    2970:	ff 75 0c             	pushl  0xc(%ebp)
    2973:	ff 75 08             	pushl  0x8(%ebp)
    2976:	e8 23 f9 ff ff       	call   229e <draw_point>
    297b:	83 c4 18             	add    $0x18,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    297e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2982:	8b 45 18             	mov    0x18(%ebp),%eax
    2985:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2988:	0f 8f 75 ff ff ff    	jg     2903 <draw_picture+0x1c>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    298e:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2992:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2995:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    2998:	0f 8f 5c ff ff ff    	jg     28fa <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    299e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    29a1:	c9                   	leave  
    29a2:	c3                   	ret    

000029a3 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    29a3:	55                   	push   %ebp
    29a4:	89 e5                	mov    %esp,%ebp
    29a6:	83 ec 24             	sub    $0x24,%esp
    29a9:	8b 45 24             	mov    0x24(%ebp),%eax
    29ac:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    29b0:	8b 45 1c             	mov    0x1c(%ebp),%eax
    29b3:	2b 45 14             	sub    0x14(%ebp),%eax
    29b6:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    29b9:	8b 45 20             	mov    0x20(%ebp),%eax
    29bc:	2b 45 18             	sub    0x18(%ebp),%eax
    29bf:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    29c2:	8b 45 14             	mov    0x14(%ebp),%eax
    29c5:	c1 e0 0a             	shl    $0xa,%eax
    29c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    29cb:	8b 45 18             	mov    0x18(%ebp),%eax
    29ce:	c1 e0 0a             	shl    $0xa,%eax
    29d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    29d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    29d7:	c1 f8 1f             	sar    $0x1f,%eax
    29da:	31 45 fc             	xor    %eax,-0x4(%ebp)
    29dd:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    29e0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    29e3:	c1 f8 1f             	sar    $0x1f,%eax
    29e6:	31 45 f8             	xor    %eax,-0x8(%ebp)
    29e9:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    29ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
    29ef:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    29f2:	7c 4f                	jl     2a43 <draw_line+0xa0>
		len = dx + 1;
    29f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    29f7:	83 c0 01             	add    $0x1,%eax
    29fa:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    29fd:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2a00:	3b 45 14             	cmp    0x14(%ebp),%eax
    2a03:	7e 07                	jle    2a0c <draw_line+0x69>
    2a05:	b8 00 04 00 00       	mov    $0x400,%eax
    2a0a:	eb 05                	jmp    2a11 <draw_line+0x6e>
    2a0c:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    2a11:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    2a14:	8b 45 20             	mov    0x20(%ebp),%eax
    2a17:	3b 45 18             	cmp    0x18(%ebp),%eax
    2a1a:	7c 12                	jl     2a2e <draw_line+0x8b>
    2a1c:	8b 45 20             	mov    0x20(%ebp),%eax
    2a1f:	2b 45 18             	sub    0x18(%ebp),%eax
    2a22:	83 c0 01             	add    $0x1,%eax
    2a25:	c1 e0 0a             	shl    $0xa,%eax
    2a28:	99                   	cltd   
    2a29:	f7 7d ec             	idivl  -0x14(%ebp)
    2a2c:	eb 10                	jmp    2a3e <draw_line+0x9b>
    2a2e:	8b 45 20             	mov    0x20(%ebp),%eax
    2a31:	2b 45 18             	sub    0x18(%ebp),%eax
    2a34:	83 e8 01             	sub    $0x1,%eax
    2a37:	c1 e0 0a             	shl    $0xa,%eax
    2a3a:	99                   	cltd   
    2a3b:	f7 7d ec             	idivl  -0x14(%ebp)
    2a3e:	89 45 f8             	mov    %eax,-0x8(%ebp)
    2a41:	eb 4d                	jmp    2a90 <draw_line+0xed>
	}
	else {
		len = dy + 1;
    2a43:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2a46:	83 c0 01             	add    $0x1,%eax
    2a49:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    2a4c:	8b 45 20             	mov    0x20(%ebp),%eax
    2a4f:	3b 45 18             	cmp    0x18(%ebp),%eax
    2a52:	7e 07                	jle    2a5b <draw_line+0xb8>
    2a54:	b8 00 04 00 00       	mov    $0x400,%eax
    2a59:	eb 05                	jmp    2a60 <draw_line+0xbd>
    2a5b:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    2a60:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    2a63:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2a66:	3b 45 14             	cmp    0x14(%ebp),%eax
    2a69:	7c 12                	jl     2a7d <draw_line+0xda>
    2a6b:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2a6e:	2b 45 14             	sub    0x14(%ebp),%eax
    2a71:	83 c0 01             	add    $0x1,%eax
    2a74:	c1 e0 0a             	shl    $0xa,%eax
    2a77:	99                   	cltd   
    2a78:	f7 7d ec             	idivl  -0x14(%ebp)
    2a7b:	eb 10                	jmp    2a8d <draw_line+0xea>
    2a7d:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2a80:	2b 45 14             	sub    0x14(%ebp),%eax
    2a83:	83 e8 01             	sub    $0x1,%eax
    2a86:	c1 e0 0a             	shl    $0xa,%eax
    2a89:	99                   	cltd   
    2a8a:	f7 7d ec             	idivl  -0x14(%ebp)
    2a8d:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    2a90:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    2a97:	eb 36                	jmp    2acf <draw_line+0x12c>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    2a99:	0f b7 45 dc          	movzwl -0x24(%ebp),%eax
    2a9d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2aa0:	c1 fa 0a             	sar    $0xa,%edx
    2aa3:	89 d1                	mov    %edx,%ecx
    2aa5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2aa8:	c1 fa 0a             	sar    $0xa,%edx
    2aab:	50                   	push   %eax
    2aac:	51                   	push   %ecx
    2aad:	52                   	push   %edx
    2aae:	ff 75 10             	pushl  0x10(%ebp)
    2ab1:	ff 75 0c             	pushl  0xc(%ebp)
    2ab4:	ff 75 08             	pushl  0x8(%ebp)
    2ab7:	e8 e2 f7 ff ff       	call   229e <draw_point>
    2abc:	83 c4 18             	add    $0x18,%esp
		y += dy;
    2abf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2ac2:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    2ac5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2ac8:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    2acb:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    2acf:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ad2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    2ad5:	7c c2                	jl     2a99 <draw_line+0xf6>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    2ad7:	c9                   	leave  
    2ad8:	c3                   	ret    

00002ad9 <draw_window>:

void
draw_window(Context c, char *title)
{
    2ad9:	55                   	push   %ebp
    2ada:	89 e5                	mov    %esp,%ebp
    2adc:	83 ec 18             	sub    $0x18,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    2adf:	8b 45 0c             	mov    0xc(%ebp),%eax
    2ae2:	83 e8 01             	sub    $0x1,%eax
    2ae5:	6a 00                	push   $0x0
    2ae7:	6a 00                	push   $0x0
    2ae9:	50                   	push   %eax
    2aea:	6a 00                	push   $0x0
    2aec:	6a 00                	push   $0x0
    2aee:	ff 75 10             	pushl  0x10(%ebp)
    2af1:	ff 75 0c             	pushl  0xc(%ebp)
    2af4:	ff 75 08             	pushl  0x8(%ebp)
    2af7:	e8 a7 fe ff ff       	call   29a3 <draw_line>
    2afc:	83 c4 20             	add    $0x20,%esp
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    2aff:	8b 45 10             	mov    0x10(%ebp),%eax
    2b02:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2b05:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b08:	8d 50 ff             	lea    -0x1(%eax),%edx
    2b0b:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b0e:	83 e8 01             	sub    $0x1,%eax
    2b11:	6a 00                	push   $0x0
    2b13:	51                   	push   %ecx
    2b14:	52                   	push   %edx
    2b15:	6a 00                	push   $0x0
    2b17:	50                   	push   %eax
    2b18:	ff 75 10             	pushl  0x10(%ebp)
    2b1b:	ff 75 0c             	pushl  0xc(%ebp)
    2b1e:	ff 75 08             	pushl  0x8(%ebp)
    2b21:	e8 7d fe ff ff       	call   29a3 <draw_line>
    2b26:	83 c4 20             	add    $0x20,%esp
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    2b29:	8b 45 10             	mov    0x10(%ebp),%eax
    2b2c:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2b2f:	8b 45 10             	mov    0x10(%ebp),%eax
    2b32:	8d 50 ff             	lea    -0x1(%eax),%edx
    2b35:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b38:	83 e8 01             	sub    $0x1,%eax
    2b3b:	6a 00                	push   $0x0
    2b3d:	51                   	push   %ecx
    2b3e:	6a 00                	push   $0x0
    2b40:	52                   	push   %edx
    2b41:	50                   	push   %eax
    2b42:	ff 75 10             	pushl  0x10(%ebp)
    2b45:	ff 75 0c             	pushl  0xc(%ebp)
    2b48:	ff 75 08             	pushl  0x8(%ebp)
    2b4b:	e8 53 fe ff ff       	call   29a3 <draw_line>
    2b50:	83 c4 20             	add    $0x20,%esp
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    2b53:	8b 45 10             	mov    0x10(%ebp),%eax
    2b56:	83 e8 01             	sub    $0x1,%eax
    2b59:	6a 00                	push   $0x0
    2b5b:	6a 00                	push   $0x0
    2b5d:	6a 00                	push   $0x0
    2b5f:	50                   	push   %eax
    2b60:	6a 00                	push   $0x0
    2b62:	ff 75 10             	pushl  0x10(%ebp)
    2b65:	ff 75 0c             	pushl  0xc(%ebp)
    2b68:	ff 75 08             	pushl  0x8(%ebp)
    2b6b:	e8 33 fe ff ff       	call   29a3 <draw_line>
    2b70:	83 c4 20             	add    $0x20,%esp
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    2b73:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b76:	83 e8 02             	sub    $0x2,%eax
    2b79:	68 cb 5a 00 00       	push   $0x5acb
    2b7e:	6a 14                	push   $0x14
    2b80:	50                   	push   %eax
    2b81:	6a 01                	push   $0x1
    2b83:	6a 01                	push   $0x1
    2b85:	ff 75 10             	pushl  0x10(%ebp)
    2b88:	ff 75 0c             	pushl  0xc(%ebp)
    2b8b:	ff 75 08             	pushl  0x8(%ebp)
    2b8e:	e8 4a f7 ff ff       	call   22dd <fill_rect>
    2b93:	83 c4 20             	add    $0x20,%esp
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    2b96:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b99:	83 e8 02             	sub    $0x2,%eax
    2b9c:	89 c2                	mov    %eax,%edx
    2b9e:	8b 45 10             	mov    0x10(%ebp),%eax
    2ba1:	83 e8 15             	sub    $0x15,%eax
    2ba4:	68 cb 5a 00 00       	push   $0x5acb
    2ba9:	6a 14                	push   $0x14
    2bab:	52                   	push   %edx
    2bac:	50                   	push   %eax
    2bad:	6a 01                	push   $0x1
    2baf:	ff 75 10             	pushl  0x10(%ebp)
    2bb2:	ff 75 0c             	pushl  0xc(%ebp)
    2bb5:	ff 75 08             	pushl  0x8(%ebp)
    2bb8:	e8 20 f7 ff ff       	call   22dd <fill_rect>
    2bbd:	83 c4 20             	add    $0x20,%esp

  loadBitmap(&pic, "close.bmp");
    2bc0:	83 ec 08             	sub    $0x8,%esp
    2bc3:	68 df a7 00 00       	push   $0xa7df
    2bc8:	8d 45 ec             	lea    -0x14(%ebp),%eax
    2bcb:	50                   	push   %eax
    2bcc:	e8 fb 00 00 00       	call   2ccc <loadBitmap>
    2bd1:	83 c4 10             	add    $0x10,%esp
  draw_picture(c, pic, 3, 3);
    2bd4:	6a 03                	push   $0x3
    2bd6:	6a 03                	push   $0x3
    2bd8:	ff 75 f4             	pushl  -0xc(%ebp)
    2bdb:	ff 75 f0             	pushl  -0x10(%ebp)
    2bde:	ff 75 ec             	pushl  -0x14(%ebp)
    2be1:	ff 75 10             	pushl  0x10(%ebp)
    2be4:	ff 75 0c             	pushl  0xc(%ebp)
    2be7:	ff 75 08             	pushl  0x8(%ebp)
    2bea:	e8 f8 fc ff ff       	call   28e7 <draw_picture>
    2bef:	83 c4 20             	add    $0x20,%esp
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    2bf2:	83 ec 04             	sub    $0x4,%esp
    2bf5:	6a 02                	push   $0x2
    2bf7:	6a 19                	push   $0x19
    2bf9:	68 ff ff 00 00       	push   $0xffff
    2bfe:	ff 75 14             	pushl  0x14(%ebp)
    2c01:	ff 75 10             	pushl  0x10(%ebp)
    2c04:	ff 75 0c             	pushl  0xc(%ebp)
    2c07:	ff 75 08             	pushl  0x8(%ebp)
    2c0a:	e8 29 fc ff ff       	call   2838 <puts_str>
    2c0f:	83 c4 20             	add    $0x20,%esp
  freepic(&pic);
    2c12:	83 ec 0c             	sub    $0xc,%esp
    2c15:	8d 45 ec             	lea    -0x14(%ebp),%eax
    2c18:	50                   	push   %eax
    2c19:	e8 cd 05 00 00       	call   31eb <freepic>
    2c1e:	83 c4 10             	add    $0x10,%esp
}
    2c21:	c9                   	leave  
    2c22:	c3                   	ret    

00002c23 <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    2c23:	55                   	push   %ebp
    2c24:	89 e5                	mov    %esp,%ebp
    2c26:	83 ec 18             	sub    $0x18,%esp
	int i;
	for (i = 0; i < len; i++)
    2c29:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2c30:	eb 2c                	jmp    2c5e <load_iconlist+0x3b>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    2c32:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c35:	6b d0 34             	imul   $0x34,%eax,%edx
    2c38:	8b 45 08             	mov    0x8(%ebp),%eax
    2c3b:	01 d0                	add    %edx,%eax
    2c3d:	89 c1                	mov    %eax,%ecx
    2c3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c42:	6b d0 34             	imul   $0x34,%eax,%edx
    2c45:	8b 45 08             	mov    0x8(%ebp),%eax
    2c48:	01 d0                	add    %edx,%eax
    2c4a:	83 c0 28             	add    $0x28,%eax
    2c4d:	83 ec 08             	sub    $0x8,%esp
    2c50:	51                   	push   %ecx
    2c51:	50                   	push   %eax
    2c52:	e8 75 00 00 00       	call   2ccc <loadBitmap>
    2c57:	83 c4 10             	add    $0x10,%esp
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    2c5a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2c5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c61:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2c64:	7c cc                	jl     2c32 <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    2c66:	c9                   	leave  
    2c67:	c3                   	ret    

00002c68 <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    2c68:	55                   	push   %ebp
    2c69:	89 e5                	mov    %esp,%ebp
    2c6b:	53                   	push   %ebx
    2c6c:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; i < len; i++)
    2c6f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2c76:	eb 47                	jmp    2cbf <draw_iconlist+0x57>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    2c78:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2c7b:	6b d0 34             	imul   $0x34,%eax,%edx
    2c7e:	8b 45 14             	mov    0x14(%ebp),%eax
    2c81:	01 d0                	add    %edx,%eax
    2c83:	8b 48 24             	mov    0x24(%eax),%ecx
    2c86:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2c89:	6b d0 34             	imul   $0x34,%eax,%edx
    2c8c:	8b 45 14             	mov    0x14(%ebp),%eax
    2c8f:	01 d0                	add    %edx,%eax
    2c91:	8b 50 20             	mov    0x20(%eax),%edx
    2c94:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2c97:	6b d8 34             	imul   $0x34,%eax,%ebx
    2c9a:	8b 45 14             	mov    0x14(%ebp),%eax
    2c9d:	01 d8                	add    %ebx,%eax
    2c9f:	51                   	push   %ecx
    2ca0:	52                   	push   %edx
    2ca1:	ff 70 30             	pushl  0x30(%eax)
    2ca4:	ff 70 2c             	pushl  0x2c(%eax)
    2ca7:	ff 70 28             	pushl  0x28(%eax)
    2caa:	ff 75 10             	pushl  0x10(%ebp)
    2cad:	ff 75 0c             	pushl  0xc(%ebp)
    2cb0:	ff 75 08             	pushl  0x8(%ebp)
    2cb3:	e8 2f fc ff ff       	call   28e7 <draw_picture>
    2cb8:	83 c4 20             	add    $0x20,%esp
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    2cbb:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2cbf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2cc2:	3b 45 18             	cmp    0x18(%ebp),%eax
    2cc5:	7c b1                	jl     2c78 <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    2cc7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2cca:	c9                   	leave  
    2ccb:	c3                   	ret    

00002ccc <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    2ccc:	55                   	push   %ebp
    2ccd:	89 e5                	mov    %esp,%ebp
    2ccf:	81 ec 88 00 00 00    	sub    $0x88,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    2cd5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    2cdc:	83 ec 08             	sub    $0x8,%esp
    2cdf:	6a 00                	push   $0x0
    2ce1:	ff 75 0c             	pushl  0xc(%ebp)
    2ce4:	e8 2f 0f 00 00       	call   3c18 <open>
    2ce9:	83 c4 10             	add    $0x10,%esp
    2cec:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2cef:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2cf3:	79 1a                	jns    2d0f <loadBitmap+0x43>
		printf(0, "cannot open %s\n", pic_name);
    2cf5:	83 ec 04             	sub    $0x4,%esp
    2cf8:	ff 75 0c             	pushl  0xc(%ebp)
    2cfb:	68 ec a7 00 00       	push   $0xa7ec
    2d00:	6a 00                	push   $0x0
    2d02:	e8 ae 10 00 00       	call   3db5 <printf>
    2d07:	83 c4 10             	add    $0x10,%esp
		return;
    2d0a:	e9 ca 02 00 00       	jmp    2fd9 <loadBitmap+0x30d>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    2d0f:	83 ec 04             	sub    $0x4,%esp
    2d12:	ff 75 0c             	pushl  0xc(%ebp)
    2d15:	68 fc a7 00 00       	push   $0xa7fc
    2d1a:	6a 00                	push   $0x0
    2d1c:	e8 94 10 00 00       	call   3db5 <printf>
    2d21:	83 c4 10             	add    $0x10,%esp
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    2d24:	83 ec 0c             	sub    $0xc,%esp
    2d27:	6a 0e                	push   $0xe
    2d29:	e8 58 13 00 00       	call   4086 <malloc>
    2d2e:	83 c4 10             	add    $0x10,%esp
    2d31:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    2d34:	83 ec 04             	sub    $0x4,%esp
    2d37:	6a 0e                	push   $0xe
    2d39:	ff 75 e4             	pushl  -0x1c(%ebp)
    2d3c:	ff 75 e8             	pushl  -0x18(%ebp)
    2d3f:	e8 ac 0e 00 00       	call   3bf0 <read>
    2d44:	83 c4 10             	add    $0x10,%esp
    2d47:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    2d4a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d4d:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    2d50:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2d53:	0f b7 00             	movzwl (%eax),%eax
    2d56:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    2d5a:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    2d5e:	66 3d 42 4d          	cmp    $0x4d42,%ax
    2d62:	74 17                	je     2d7b <loadBitmap+0xaf>
		printf(0, "file is not .bmp file!");
    2d64:	83 ec 08             	sub    $0x8,%esp
    2d67:	68 10 a8 00 00       	push   $0xa810
    2d6c:	6a 00                	push   $0x0
    2d6e:	e8 42 10 00 00       	call   3db5 <printf>
    2d73:	83 c4 10             	add    $0x10,%esp
		return;
    2d76:	e9 5e 02 00 00       	jmp    2fd9 <loadBitmap+0x30d>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    2d7b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d7e:	83 c0 02             	add    $0x2,%eax
    2d81:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    2d84:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2d87:	8b 00                	mov    (%eax),%eax
    2d89:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    2d8c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d8f:	83 c0 06             	add    $0x6,%eax
    2d92:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    2d95:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2d98:	0f b7 00             	movzwl (%eax),%eax
    2d9b:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    2d9f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2da2:	83 c0 08             	add    $0x8,%eax
    2da5:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    2da8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2dab:	0f b7 00             	movzwl (%eax),%eax
    2dae:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    2db2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2db5:	83 c0 0a             	add    $0xa,%eax
    2db8:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    2dbb:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2dbe:	8b 00                	mov    (%eax),%eax
    2dc0:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    2dc3:	83 ec 04             	sub    $0x4,%esp
    2dc6:	6a 28                	push   $0x28
    2dc8:	8d 45 84             	lea    -0x7c(%ebp),%eax
    2dcb:	50                   	push   %eax
    2dcc:	ff 75 e8             	pushl  -0x18(%ebp)
    2dcf:	e8 1c 0e 00 00       	call   3bf0 <read>
    2dd4:	83 c4 10             	add    $0x10,%esp
	width = bitInfoHead.biWidth;
    2dd7:	8b 45 88             	mov    -0x78(%ebp),%eax
    2dda:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    2ddd:	8b 45 8c             	mov    -0x74(%ebp),%eax
    2de0:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    2de3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2de6:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    2dea:	c1 e0 02             	shl    $0x2,%eax
    2ded:	83 ec 0c             	sub    $0xc,%esp
    2df0:	50                   	push   %eax
    2df1:	ff 75 d0             	pushl  -0x30(%ebp)
    2df4:	ff 75 d4             	pushl  -0x2c(%ebp)
    2df7:	68 28 a8 00 00       	push   $0xa828
    2dfc:	6a 00                	push   $0x0
    2dfe:	e8 b2 0f 00 00       	call   3db5 <printf>
    2e03:	83 c4 20             	add    $0x20,%esp
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    2e06:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    2e0a:	75 12                	jne    2e1e <loadBitmap+0x152>
		printf(0, "0");
    2e0c:	83 ec 08             	sub    $0x8,%esp
    2e0f:	68 4d a8 00 00       	push   $0xa84d
    2e14:	6a 00                	push   $0x0
    2e16:	e8 9a 0f 00 00       	call   3db5 <printf>
    2e1b:	83 c4 10             	add    $0x10,%esp
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    2e1e:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    2e22:	0f b7 c0             	movzwl %ax,%eax
    2e25:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    2e29:	83 c0 1f             	add    $0x1f,%eax
    2e2c:	8d 50 1f             	lea    0x1f(%eax),%edx
    2e2f:	85 c0                	test   %eax,%eax
    2e31:	0f 48 c2             	cmovs  %edx,%eax
    2e34:	c1 f8 05             	sar    $0x5,%eax
    2e37:	c1 e0 02             	shl    $0x2,%eax
    2e3a:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    2e3d:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2e40:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    2e44:	83 ec 0c             	sub    $0xc,%esp
    2e47:	50                   	push   %eax
    2e48:	e8 39 12 00 00       	call   4086 <malloc>
    2e4d:	83 c4 10             	add    $0x10,%esp
    2e50:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    2e53:	8b 55 d0             	mov    -0x30(%ebp),%edx
    2e56:	8b 45 cc             	mov    -0x34(%ebp),%eax
    2e59:	0f af c2             	imul   %edx,%eax
    2e5c:	83 ec 04             	sub    $0x4,%esp
    2e5f:	50                   	push   %eax
    2e60:	6a 00                	push   $0x0
    2e62:	ff 75 c8             	pushl  -0x38(%ebp)
    2e65:	e8 d4 0b 00 00       	call   3a3e <memset>
    2e6a:	83 c4 10             	add    $0x10,%esp
	long nData = height * l_width;
    2e6d:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2e70:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    2e74:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    2e77:	83 ec 04             	sub    $0x4,%esp
    2e7a:	ff 75 c4             	pushl  -0x3c(%ebp)
    2e7d:	ff 75 c8             	pushl  -0x38(%ebp)
    2e80:	ff 75 e8             	pushl  -0x18(%ebp)
    2e83:	e8 68 0d 00 00       	call   3bf0 <read>
    2e88:	83 c4 10             	add    $0x10,%esp

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    2e8b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2e8e:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    2e92:	c1 e0 02             	shl    $0x2,%eax
    2e95:	83 ec 0c             	sub    $0xc,%esp
    2e98:	50                   	push   %eax
    2e99:	e8 e8 11 00 00       	call   4086 <malloc>
    2e9e:	83 c4 10             	add    $0x10,%esp
    2ea1:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    2ea4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    2ea7:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2eaa:	0f af c2             	imul   %edx,%eax
    2ead:	c1 e0 02             	shl    $0x2,%eax
    2eb0:	83 ec 04             	sub    $0x4,%esp
    2eb3:	50                   	push   %eax
    2eb4:	6a 00                	push   $0x0
    2eb6:	ff 75 c0             	pushl  -0x40(%ebp)
    2eb9:	e8 80 0b 00 00       	call   3a3e <memset>
    2ebe:	83 c4 10             	add    $0x10,%esp
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    2ec1:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    2ec5:	66 83 f8 17          	cmp    $0x17,%ax
    2ec9:	77 17                	ja     2ee2 <loadBitmap+0x216>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    2ecb:	83 ec 08             	sub    $0x8,%esp
    2ece:	68 50 a8 00 00       	push   $0xa850
    2ed3:	6a 00                	push   $0x0
    2ed5:	e8 db 0e 00 00       	call   3db5 <printf>
    2eda:	83 c4 10             	add    $0x10,%esp
		return;
    2edd:	e9 f7 00 00 00       	jmp    2fd9 <loadBitmap+0x30d>
	} else	//位图为24位真彩色
	{
		index = 0;
    2ee2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    2ee9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2ef0:	e9 94 00 00 00       	jmp    2f89 <loadBitmap+0x2bd>
			for (j = 0; j < width; j++) {
    2ef5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2efc:	eb 7b                	jmp    2f79 <loadBitmap+0x2ad>
				k = i * l_width + j * 3;
    2efe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f01:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    2f05:	89 c1                	mov    %eax,%ecx
    2f07:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2f0a:	89 d0                	mov    %edx,%eax
    2f0c:	01 c0                	add    %eax,%eax
    2f0e:	01 d0                	add    %edx,%eax
    2f10:	01 c8                	add    %ecx,%eax
    2f12:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    2f15:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2f18:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    2f1f:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2f22:	01 c2                	add    %eax,%edx
    2f24:	8b 45 bc             	mov    -0x44(%ebp),%eax
    2f27:	8d 48 02             	lea    0x2(%eax),%ecx
    2f2a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2f2d:	01 c8                	add    %ecx,%eax
    2f2f:	0f b6 00             	movzbl (%eax),%eax
    2f32:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    2f35:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2f38:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    2f3f:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2f42:	01 c2                	add    %eax,%edx
    2f44:	8b 45 bc             	mov    -0x44(%ebp),%eax
    2f47:	8d 48 01             	lea    0x1(%eax),%ecx
    2f4a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2f4d:	01 c8                	add    %ecx,%eax
    2f4f:	0f b6 00             	movzbl (%eax),%eax
    2f52:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    2f55:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2f58:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    2f5f:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2f62:	01 c2                	add    %eax,%edx
    2f64:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    2f67:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2f6a:	01 c8                	add    %ecx,%eax
    2f6c:	0f b6 00             	movzbl (%eax),%eax
    2f6f:	88 02                	mov    %al,(%edx)
				index++;
    2f71:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    2f75:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2f79:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f7c:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    2f7f:	0f 8c 79 ff ff ff    	jl     2efe <loadBitmap+0x232>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    2f85:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2f89:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f8c:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    2f8f:	0f 8c 60 ff ff ff    	jl     2ef5 <loadBitmap+0x229>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    2f95:	83 ec 0c             	sub    $0xc,%esp
    2f98:	ff 75 e8             	pushl  -0x18(%ebp)
    2f9b:	e8 60 0c 00 00       	call   3c00 <close>
    2fa0:	83 c4 10             	add    $0x10,%esp

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    2fa3:	8b 45 08             	mov    0x8(%ebp),%eax
    2fa6:	8b 55 c0             	mov    -0x40(%ebp),%edx
    2fa9:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    2fab:	8b 45 08             	mov    0x8(%ebp),%eax
    2fae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    2fb1:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    2fb4:	8b 45 08             	mov    0x8(%ebp),%eax
    2fb7:	8b 55 d0             	mov    -0x30(%ebp),%edx
    2fba:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    2fbd:	83 ec 0c             	sub    $0xc,%esp
    2fc0:	ff 75 c8             	pushl  -0x38(%ebp)
    2fc3:	e8 7d 0f 00 00       	call   3f45 <free>
    2fc8:	83 c4 10             	add    $0x10,%esp
	free(BmpFileHeader);
    2fcb:	83 ec 0c             	sub    $0xc,%esp
    2fce:	ff 75 e4             	pushl  -0x1c(%ebp)
    2fd1:	e8 6f 0f 00 00       	call   3f45 <free>
    2fd6:	83 c4 10             	add    $0x10,%esp
	//printf("\n");
}
    2fd9:	c9                   	leave  
    2fda:	c3                   	ret    

00002fdb <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    2fdb:	55                   	push   %ebp
    2fdc:	89 e5                	mov    %esp,%ebp
    2fde:	83 ec 08             	sub    $0x8,%esp
	printf(0, "位图文件头:\n");
    2fe1:	83 ec 08             	sub    $0x8,%esp
    2fe4:	68 70 a8 00 00       	push   $0xa870
    2fe9:	6a 00                	push   $0x0
    2feb:	e8 c5 0d 00 00       	call   3db5 <printf>
    2ff0:	83 c4 10             	add    $0x10,%esp
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    2ff3:	8b 45 08             	mov    0x8(%ebp),%eax
    2ff6:	0f b7 00             	movzwl (%eax),%eax
    2ff9:	0f b7 c0             	movzwl %ax,%eax
    2ffc:	83 ec 04             	sub    $0x4,%esp
    2fff:	50                   	push   %eax
    3000:	68 82 a8 00 00       	push   $0xa882
    3005:	6a 00                	push   $0x0
    3007:	e8 a9 0d 00 00       	call   3db5 <printf>
    300c:	83 c4 10             	add    $0x10,%esp
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    300f:	8b 45 08             	mov    0x8(%ebp),%eax
    3012:	8b 40 04             	mov    0x4(%eax),%eax
    3015:	83 ec 04             	sub    $0x4,%esp
    3018:	50                   	push   %eax
    3019:	68 a0 a8 00 00       	push   $0xa8a0
    301e:	6a 00                	push   $0x0
    3020:	e8 90 0d 00 00       	call   3db5 <printf>
    3025:	83 c4 10             	add    $0x10,%esp
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    3028:	8b 45 08             	mov    0x8(%ebp),%eax
    302b:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    302f:	0f b7 c0             	movzwl %ax,%eax
    3032:	83 ec 04             	sub    $0x4,%esp
    3035:	50                   	push   %eax
    3036:	68 b1 a8 00 00       	push   $0xa8b1
    303b:	6a 00                	push   $0x0
    303d:	e8 73 0d 00 00       	call   3db5 <printf>
    3042:	83 c4 10             	add    $0x10,%esp
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    3045:	8b 45 08             	mov    0x8(%ebp),%eax
    3048:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    304c:	0f b7 c0             	movzwl %ax,%eax
    304f:	83 ec 04             	sub    $0x4,%esp
    3052:	50                   	push   %eax
    3053:	68 b1 a8 00 00       	push   $0xa8b1
    3058:	6a 00                	push   $0x0
    305a:	e8 56 0d 00 00       	call   3db5 <printf>
    305f:	83 c4 10             	add    $0x10,%esp
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    3062:	8b 45 08             	mov    0x8(%ebp),%eax
    3065:	8b 40 0c             	mov    0xc(%eax),%eax
    3068:	83 ec 04             	sub    $0x4,%esp
    306b:	50                   	push   %eax
    306c:	68 c0 a8 00 00       	push   $0xa8c0
    3071:	6a 00                	push   $0x0
    3073:	e8 3d 0d 00 00       	call   3db5 <printf>
    3078:	83 c4 10             	add    $0x10,%esp
}
    307b:	c9                   	leave  
    307c:	c3                   	ret    

0000307d <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    307d:	55                   	push   %ebp
    307e:	89 e5                	mov    %esp,%ebp
    3080:	83 ec 08             	sub    $0x8,%esp
	printf(0, "位图信息头:\n");
    3083:	83 ec 08             	sub    $0x8,%esp
    3086:	68 e9 a8 00 00       	push   $0xa8e9
    308b:	6a 00                	push   $0x0
    308d:	e8 23 0d 00 00       	call   3db5 <printf>
    3092:	83 c4 10             	add    $0x10,%esp
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    3095:	8b 45 08             	mov    0x8(%ebp),%eax
    3098:	8b 00                	mov    (%eax),%eax
    309a:	83 ec 04             	sub    $0x4,%esp
    309d:	50                   	push   %eax
    309e:	68 fb a8 00 00       	push   $0xa8fb
    30a3:	6a 00                	push   $0x0
    30a5:	e8 0b 0d 00 00       	call   3db5 <printf>
    30aa:	83 c4 10             	add    $0x10,%esp
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    30ad:	8b 45 08             	mov    0x8(%ebp),%eax
    30b0:	8b 40 04             	mov    0x4(%eax),%eax
    30b3:	83 ec 04             	sub    $0x4,%esp
    30b6:	50                   	push   %eax
    30b7:	68 12 a9 00 00       	push   $0xa912
    30bc:	6a 00                	push   $0x0
    30be:	e8 f2 0c 00 00       	call   3db5 <printf>
    30c3:	83 c4 10             	add    $0x10,%esp
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    30c6:	8b 45 08             	mov    0x8(%ebp),%eax
    30c9:	8b 40 08             	mov    0x8(%eax),%eax
    30cc:	83 ec 04             	sub    $0x4,%esp
    30cf:	50                   	push   %eax
    30d0:	68 20 a9 00 00       	push   $0xa920
    30d5:	6a 00                	push   $0x0
    30d7:	e8 d9 0c 00 00       	call   3db5 <printf>
    30dc:	83 c4 10             	add    $0x10,%esp
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    30df:	8b 45 08             	mov    0x8(%ebp),%eax
    30e2:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    30e6:	0f b7 c0             	movzwl %ax,%eax
    30e9:	83 ec 04             	sub    $0x4,%esp
    30ec:	50                   	push   %eax
    30ed:	68 2e a9 00 00       	push   $0xa92e
    30f2:	6a 00                	push   $0x0
    30f4:	e8 bc 0c 00 00       	call   3db5 <printf>
    30f9:	83 c4 10             	add    $0x10,%esp
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    30fc:	8b 45 08             	mov    0x8(%ebp),%eax
    30ff:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    3103:	0f b7 c0             	movzwl %ax,%eax
    3106:	83 ec 04             	sub    $0x4,%esp
    3109:	50                   	push   %eax
    310a:	68 44 a9 00 00       	push   $0xa944
    310f:	6a 00                	push   $0x0
    3111:	e8 9f 0c 00 00       	call   3db5 <printf>
    3116:	83 c4 10             	add    $0x10,%esp
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    3119:	8b 45 08             	mov    0x8(%ebp),%eax
    311c:	8b 40 10             	mov    0x10(%eax),%eax
    311f:	83 ec 04             	sub    $0x4,%esp
    3122:	50                   	push   %eax
    3123:	68 65 a9 00 00       	push   $0xa965
    3128:	6a 00                	push   $0x0
    312a:	e8 86 0c 00 00       	call   3db5 <printf>
    312f:	83 c4 10             	add    $0x10,%esp
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    3132:	8b 45 08             	mov    0x8(%ebp),%eax
    3135:	8b 40 14             	mov    0x14(%eax),%eax
    3138:	83 ec 04             	sub    $0x4,%esp
    313b:	50                   	push   %eax
    313c:	68 78 a9 00 00       	push   $0xa978
    3141:	6a 00                	push   $0x0
    3143:	e8 6d 0c 00 00       	call   3db5 <printf>
    3148:	83 c4 10             	add    $0x10,%esp
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    314b:	8b 45 08             	mov    0x8(%ebp),%eax
    314e:	8b 40 18             	mov    0x18(%eax),%eax
    3151:	83 ec 04             	sub    $0x4,%esp
    3154:	50                   	push   %eax
    3155:	68 ac a9 00 00       	push   $0xa9ac
    315a:	6a 00                	push   $0x0
    315c:	e8 54 0c 00 00       	call   3db5 <printf>
    3161:	83 c4 10             	add    $0x10,%esp
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    3164:	8b 45 08             	mov    0x8(%ebp),%eax
    3167:	8b 40 1c             	mov    0x1c(%eax),%eax
    316a:	83 ec 04             	sub    $0x4,%esp
    316d:	50                   	push   %eax
    316e:	68 c1 a9 00 00       	push   $0xa9c1
    3173:	6a 00                	push   $0x0
    3175:	e8 3b 0c 00 00       	call   3db5 <printf>
    317a:	83 c4 10             	add    $0x10,%esp
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    317d:	8b 45 08             	mov    0x8(%ebp),%eax
    3180:	8b 40 20             	mov    0x20(%eax),%eax
    3183:	83 ec 04             	sub    $0x4,%esp
    3186:	50                   	push   %eax
    3187:	68 d6 a9 00 00       	push   $0xa9d6
    318c:	6a 00                	push   $0x0
    318e:	e8 22 0c 00 00       	call   3db5 <printf>
    3193:	83 c4 10             	add    $0x10,%esp
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    3196:	8b 45 08             	mov    0x8(%ebp),%eax
    3199:	8b 40 24             	mov    0x24(%eax),%eax
    319c:	83 ec 04             	sub    $0x4,%esp
    319f:	50                   	push   %eax
    31a0:	68 ed a9 00 00       	push   $0xa9ed
    31a5:	6a 00                	push   $0x0
    31a7:	e8 09 0c 00 00       	call   3db5 <printf>
    31ac:	83 c4 10             	add    $0x10,%esp
}
    31af:	c9                   	leave  
    31b0:	c3                   	ret    

000031b1 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    31b1:	55                   	push   %ebp
    31b2:	89 e5                	mov    %esp,%ebp
    31b4:	83 ec 08             	sub    $0x8,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    31b7:	8b 45 08             	mov    0x8(%ebp),%eax
    31ba:	0f b6 00             	movzbl (%eax),%eax
    31bd:	0f b6 c8             	movzbl %al,%ecx
    31c0:	8b 45 08             	mov    0x8(%ebp),%eax
    31c3:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    31c7:	0f b6 d0             	movzbl %al,%edx
    31ca:	8b 45 08             	mov    0x8(%ebp),%eax
    31cd:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    31d1:	0f b6 c0             	movzbl %al,%eax
    31d4:	83 ec 0c             	sub    $0xc,%esp
    31d7:	51                   	push   %ecx
    31d8:	52                   	push   %edx
    31d9:	50                   	push   %eax
    31da:	68 01 aa 00 00       	push   $0xaa01
    31df:	6a 00                	push   $0x0
    31e1:	e8 cf 0b 00 00       	call   3db5 <printf>
    31e6:	83 c4 20             	add    $0x20,%esp
}
    31e9:	c9                   	leave  
    31ea:	c3                   	ret    

000031eb <freepic>:

void freepic(PICNODE *pic) {
    31eb:	55                   	push   %ebp
    31ec:	89 e5                	mov    %esp,%ebp
    31ee:	83 ec 08             	sub    $0x8,%esp
	free(pic->data);
    31f1:	8b 45 08             	mov    0x8(%ebp),%eax
    31f4:	8b 00                	mov    (%eax),%eax
    31f6:	83 ec 0c             	sub    $0xc,%esp
    31f9:	50                   	push   %eax
    31fa:	e8 46 0d 00 00       	call   3f45 <free>
    31ff:	83 c4 10             	add    $0x10,%esp
}
    3202:	c9                   	leave  
    3203:	c3                   	ret    

00003204 <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    3204:	55                   	push   %ebp
    3205:	89 e5                	mov    %esp,%ebp
    3207:	83 ec 68             	sub    $0x68,%esp
	int W = 15;
    320a:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    3211:	8d 45 dc             	lea    -0x24(%ebp),%eax
    3214:	83 ec 0c             	sub    $0xc,%esp
    3217:	ff 75 ec             	pushl  -0x14(%ebp)
    321a:	ff 75 ec             	pushl  -0x14(%ebp)
    321d:	6a 00                	push   $0x0
    321f:	6a 00                	push   $0x0
    3221:	50                   	push   %eax
    3222:	e8 01 02 00 00       	call   3428 <initRect>
    3227:	83 c4 1c             	add    $0x1c,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    322a:	8b 45 08             	mov    0x8(%ebp),%eax
    322d:	8b 40 04             	mov    0x4(%eax),%eax
    3230:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3233:	89 c2                	mov    %eax,%edx
    3235:	8d 45 cc             	lea    -0x34(%ebp),%eax
    3238:	83 ec 0c             	sub    $0xc,%esp
    323b:	ff 75 ec             	pushl  -0x14(%ebp)
    323e:	ff 75 ec             	pushl  -0x14(%ebp)
    3241:	6a 00                	push   $0x0
    3243:	52                   	push   %edx
    3244:	50                   	push   %eax
    3245:	e8 de 01 00 00       	call   3428 <initRect>
    324a:	83 c4 1c             	add    $0x1c,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    324d:	8b 45 08             	mov    0x8(%ebp),%eax
    3250:	8b 40 08             	mov    0x8(%eax),%eax
    3253:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3256:	89 c1                	mov    %eax,%ecx
    3258:	8b 45 08             	mov    0x8(%ebp),%eax
    325b:	8b 40 04             	mov    0x4(%eax),%eax
    325e:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3261:	89 c2                	mov    %eax,%edx
    3263:	8d 45 bc             	lea    -0x44(%ebp),%eax
    3266:	83 ec 0c             	sub    $0xc,%esp
    3269:	ff 75 ec             	pushl  -0x14(%ebp)
    326c:	ff 75 ec             	pushl  -0x14(%ebp)
    326f:	51                   	push   %ecx
    3270:	52                   	push   %edx
    3271:	50                   	push   %eax
    3272:	e8 b1 01 00 00       	call   3428 <initRect>
    3277:	83 c4 1c             	add    $0x1c,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    327a:	8b 45 08             	mov    0x8(%ebp),%eax
    327d:	8b 40 08             	mov    0x8(%eax),%eax
    3280:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3283:	89 c2                	mov    %eax,%edx
    3285:	8d 45 ac             	lea    -0x54(%ebp),%eax
    3288:	83 ec 0c             	sub    $0xc,%esp
    328b:	ff 75 ec             	pushl  -0x14(%ebp)
    328e:	ff 75 ec             	pushl  -0x14(%ebp)
    3291:	52                   	push   %edx
    3292:	6a 00                	push   $0x0
    3294:	50                   	push   %eax
    3295:	e8 8e 01 00 00       	call   3428 <initRect>
    329a:	83 c4 1c             	add    $0x1c,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    329d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    32a4:	e9 47 01 00 00       	jmp    33f0 <set_icon_alpha+0x1ec>
		for (j = 0; j < pic->height; j++) {
    32a9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    32b0:	e9 28 01 00 00       	jmp    33dd <set_icon_alpha+0x1d9>
			p = initPoint(i, j);
    32b5:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    32b8:	83 ec 04             	sub    $0x4,%esp
    32bb:	ff 75 f0             	pushl  -0x10(%ebp)
    32be:	ff 75 f4             	pushl  -0xc(%ebp)
    32c1:	50                   	push   %eax
    32c2:	e8 3a 01 00 00       	call   3401 <initPoint>
    32c7:	83 c4 0c             	add    $0xc,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    32ca:	83 ec 08             	sub    $0x8,%esp
    32cd:	ff 75 e8             	pushl  -0x18(%ebp)
    32d0:	ff 75 e4             	pushl  -0x1c(%ebp)
    32d3:	ff 75 e0             	pushl  -0x20(%ebp)
    32d6:	ff 75 dc             	pushl  -0x24(%ebp)
    32d9:	ff 75 a8             	pushl  -0x58(%ebp)
    32dc:	ff 75 a4             	pushl  -0x5c(%ebp)
    32df:	e8 95 01 00 00       	call   3479 <isIn>
    32e4:	83 c4 20             	add    $0x20,%esp
    32e7:	85 c0                	test   %eax,%eax
    32e9:	75 67                	jne    3352 <set_icon_alpha+0x14e>
    32eb:	83 ec 08             	sub    $0x8,%esp
    32ee:	ff 75 d8             	pushl  -0x28(%ebp)
    32f1:	ff 75 d4             	pushl  -0x2c(%ebp)
    32f4:	ff 75 d0             	pushl  -0x30(%ebp)
    32f7:	ff 75 cc             	pushl  -0x34(%ebp)
    32fa:	ff 75 a8             	pushl  -0x58(%ebp)
    32fd:	ff 75 a4             	pushl  -0x5c(%ebp)
    3300:	e8 74 01 00 00       	call   3479 <isIn>
    3305:	83 c4 20             	add    $0x20,%esp
    3308:	85 c0                	test   %eax,%eax
    330a:	75 46                	jne    3352 <set_icon_alpha+0x14e>
    330c:	83 ec 08             	sub    $0x8,%esp
    330f:	ff 75 c8             	pushl  -0x38(%ebp)
    3312:	ff 75 c4             	pushl  -0x3c(%ebp)
    3315:	ff 75 c0             	pushl  -0x40(%ebp)
    3318:	ff 75 bc             	pushl  -0x44(%ebp)
    331b:	ff 75 a8             	pushl  -0x58(%ebp)
    331e:	ff 75 a4             	pushl  -0x5c(%ebp)
    3321:	e8 53 01 00 00       	call   3479 <isIn>
    3326:	83 c4 20             	add    $0x20,%esp
    3329:	85 c0                	test   %eax,%eax
    332b:	75 25                	jne    3352 <set_icon_alpha+0x14e>
    332d:	83 ec 08             	sub    $0x8,%esp
    3330:	ff 75 b8             	pushl  -0x48(%ebp)
    3333:	ff 75 b4             	pushl  -0x4c(%ebp)
    3336:	ff 75 b0             	pushl  -0x50(%ebp)
    3339:	ff 75 ac             	pushl  -0x54(%ebp)
    333c:	ff 75 a8             	pushl  -0x58(%ebp)
    333f:	ff 75 a4             	pushl  -0x5c(%ebp)
    3342:	e8 32 01 00 00       	call   3479 <isIn>
    3347:	83 c4 20             	add    $0x20,%esp
    334a:	85 c0                	test   %eax,%eax
    334c:	0f 84 87 00 00 00    	je     33d9 <set_icon_alpha+0x1d5>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    3352:	8b 45 08             	mov    0x8(%ebp),%eax
    3355:	8b 10                	mov    (%eax),%edx
    3357:	8b 45 08             	mov    0x8(%ebp),%eax
    335a:	8b 40 04             	mov    0x4(%eax),%eax
    335d:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3361:	89 c1                	mov    %eax,%ecx
    3363:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3366:	01 c8                	add    %ecx,%eax
    3368:	c1 e0 02             	shl    $0x2,%eax
    336b:	01 d0                	add    %edx,%eax
    336d:	0f b6 00             	movzbl (%eax),%eax
    3370:	3c ff                	cmp    $0xff,%al
    3372:	75 65                	jne    33d9 <set_icon_alpha+0x1d5>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    3374:	8b 45 08             	mov    0x8(%ebp),%eax
    3377:	8b 10                	mov    (%eax),%edx
    3379:	8b 45 08             	mov    0x8(%ebp),%eax
    337c:	8b 40 04             	mov    0x4(%eax),%eax
    337f:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3383:	89 c1                	mov    %eax,%ecx
    3385:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3388:	01 c8                	add    %ecx,%eax
    338a:	c1 e0 02             	shl    $0x2,%eax
    338d:	01 d0                	add    %edx,%eax
    338f:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    3393:	3c ff                	cmp    $0xff,%al
    3395:	75 42                	jne    33d9 <set_icon_alpha+0x1d5>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    3397:	8b 45 08             	mov    0x8(%ebp),%eax
    339a:	8b 10                	mov    (%eax),%edx
    339c:	8b 45 08             	mov    0x8(%ebp),%eax
    339f:	8b 40 04             	mov    0x4(%eax),%eax
    33a2:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    33a6:	89 c1                	mov    %eax,%ecx
    33a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33ab:	01 c8                	add    %ecx,%eax
    33ad:	c1 e0 02             	shl    $0x2,%eax
    33b0:	01 d0                	add    %edx,%eax
    33b2:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    33b6:	3c ff                	cmp    $0xff,%al
    33b8:	75 1f                	jne    33d9 <set_icon_alpha+0x1d5>
					pic->data[j * pic->width + i].rgbReserved = 1;
    33ba:	8b 45 08             	mov    0x8(%ebp),%eax
    33bd:	8b 10                	mov    (%eax),%edx
    33bf:	8b 45 08             	mov    0x8(%ebp),%eax
    33c2:	8b 40 04             	mov    0x4(%eax),%eax
    33c5:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    33c9:	89 c1                	mov    %eax,%ecx
    33cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33ce:	01 c8                	add    %ecx,%eax
    33d0:	c1 e0 02             	shl    $0x2,%eax
    33d3:	01 d0                	add    %edx,%eax
    33d5:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    33d9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    33dd:	8b 45 08             	mov    0x8(%ebp),%eax
    33e0:	8b 40 08             	mov    0x8(%eax),%eax
    33e3:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    33e6:	0f 8f c9 fe ff ff    	jg     32b5 <set_icon_alpha+0xb1>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    33ec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    33f0:	8b 45 08             	mov    0x8(%ebp),%eax
    33f3:	8b 40 04             	mov    0x4(%eax),%eax
    33f6:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    33f9:	0f 8f aa fe ff ff    	jg     32a9 <set_icon_alpha+0xa5>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    33ff:	c9                   	leave  
    3400:	c3                   	ret    

00003401 <initPoint>:
#include "context.h"
#include "message.h"
#include "types.h"
#include "user.h"
Point initPoint(int x, int y)
{
    3401:	55                   	push   %ebp
    3402:	89 e5                	mov    %esp,%ebp
    3404:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    3407:	8b 45 0c             	mov    0xc(%ebp),%eax
    340a:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    340d:	8b 45 10             	mov    0x10(%ebp),%eax
    3410:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    3413:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3416:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3419:	8b 55 fc             	mov    -0x4(%ebp),%edx
    341c:	89 01                	mov    %eax,(%ecx)
    341e:	89 51 04             	mov    %edx,0x4(%ecx)
}
    3421:	8b 45 08             	mov    0x8(%ebp),%eax
    3424:	c9                   	leave  
    3425:	c2 04 00             	ret    $0x4

00003428 <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    3428:	55                   	push   %ebp
    3429:	89 e5                	mov    %esp,%ebp
    342b:	83 ec 18             	sub    $0x18,%esp
	Rect r;
	r.start = initPoint(x, y);
    342e:	8d 45 e8             	lea    -0x18(%ebp),%eax
    3431:	ff 75 10             	pushl  0x10(%ebp)
    3434:	ff 75 0c             	pushl  0xc(%ebp)
    3437:	50                   	push   %eax
    3438:	e8 c4 ff ff ff       	call   3401 <initPoint>
    343d:	83 c4 08             	add    $0x8,%esp
    3440:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3443:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3446:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3449:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    344c:	8b 45 14             	mov    0x14(%ebp),%eax
    344f:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    3452:	8b 45 18             	mov    0x18(%ebp),%eax
    3455:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    3458:	8b 45 08             	mov    0x8(%ebp),%eax
    345b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    345e:	89 10                	mov    %edx,(%eax)
    3460:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3463:	89 50 04             	mov    %edx,0x4(%eax)
    3466:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3469:	89 50 08             	mov    %edx,0x8(%eax)
    346c:	8b 55 fc             	mov    -0x4(%ebp),%edx
    346f:	89 50 0c             	mov    %edx,0xc(%eax)
}
    3472:	8b 45 08             	mov    0x8(%ebp),%eax
    3475:	c9                   	leave  
    3476:	c2 04 00             	ret    $0x4

00003479 <isIn>:

int isIn(Point p, Rect r)
{
    3479:	55                   	push   %ebp
    347a:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    347c:	8b 55 08             	mov    0x8(%ebp),%edx
    347f:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    3482:	39 c2                	cmp    %eax,%edx
    3484:	7c 2f                	jl     34b5 <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    3486:	8b 45 08             	mov    0x8(%ebp),%eax
    3489:	8b 4d 10             	mov    0x10(%ebp),%ecx
    348c:	8b 55 18             	mov    0x18(%ebp),%edx
    348f:	01 ca                	add    %ecx,%edx
    3491:	39 d0                	cmp    %edx,%eax
    3493:	7d 20                	jge    34b5 <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    3495:	8b 55 0c             	mov    0xc(%ebp),%edx
    3498:	8b 45 14             	mov    0x14(%ebp),%eax
    349b:	39 c2                	cmp    %eax,%edx
    349d:	7c 16                	jl     34b5 <isIn+0x3c>
    349f:	8b 45 0c             	mov    0xc(%ebp),%eax
    34a2:	8b 4d 14             	mov    0x14(%ebp),%ecx
    34a5:	8b 55 1c             	mov    0x1c(%ebp),%edx
    34a8:	01 ca                	add    %ecx,%edx
    34aa:	39 d0                	cmp    %edx,%eax
    34ac:	7d 07                	jge    34b5 <isIn+0x3c>
    34ae:	b8 01 00 00 00       	mov    $0x1,%eax
    34b3:	eb 05                	jmp    34ba <isIn+0x41>
    34b5:	b8 00 00 00 00       	mov    $0x0,%eax
}
    34ba:	5d                   	pop    %ebp
    34bb:	c3                   	ret    

000034bc <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    34bc:	55                   	push   %ebp
    34bd:	89 e5                	mov    %esp,%ebp
    34bf:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    34c2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    34c9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    34d0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    34d7:	8b 45 10             	mov    0x10(%ebp),%eax
    34da:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    34dd:	8b 45 14             	mov    0x14(%ebp),%eax
    34e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    34e3:	8b 45 08             	mov    0x8(%ebp),%eax
    34e6:	8b 55 ec             	mov    -0x14(%ebp),%edx
    34e9:	89 10                	mov    %edx,(%eax)
    34eb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    34ee:	89 50 04             	mov    %edx,0x4(%eax)
    34f1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    34f4:	89 50 08             	mov    %edx,0x8(%eax)
    34f7:	8b 55 f8             	mov    -0x8(%ebp),%edx
    34fa:	89 50 0c             	mov    %edx,0xc(%eax)
    34fd:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3500:	89 50 10             	mov    %edx,0x10(%eax)
}
    3503:	8b 45 08             	mov    0x8(%ebp),%eax
    3506:	c9                   	leave  
    3507:	c2 04 00             	ret    $0x4

0000350a <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    350a:	55                   	push   %ebp
    350b:	89 e5                	mov    %esp,%ebp
    350d:	83 ec 08             	sub    $0x8,%esp
	switch (MsgType)
    3510:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3513:	83 f8 03             	cmp    $0x3,%eax
    3516:	74 4f                	je     3567 <createClickable+0x5d>
    3518:	83 f8 04             	cmp    $0x4,%eax
    351b:	74 07                	je     3524 <createClickable+0x1a>
    351d:	83 f8 02             	cmp    $0x2,%eax
    3520:	74 25                	je     3547 <createClickable+0x3d>
    3522:	eb 66                	jmp    358a <createClickable+0x80>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    3524:	8b 45 08             	mov    0x8(%ebp),%eax
    3527:	83 c0 04             	add    $0x4,%eax
    352a:	83 ec 08             	sub    $0x8,%esp
    352d:	ff 75 20             	pushl  0x20(%ebp)
    3530:	ff 75 18             	pushl  0x18(%ebp)
    3533:	ff 75 14             	pushl  0x14(%ebp)
    3536:	ff 75 10             	pushl  0x10(%ebp)
    3539:	ff 75 0c             	pushl  0xc(%ebp)
    353c:	50                   	push   %eax
    353d:	e8 5d 00 00 00       	call   359f <addClickable>
    3542:	83 c4 20             	add    $0x20,%esp
	        break;
    3545:	eb 56                	jmp    359d <createClickable+0x93>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    3547:	8b 45 08             	mov    0x8(%ebp),%eax
    354a:	83 ec 08             	sub    $0x8,%esp
    354d:	ff 75 20             	pushl  0x20(%ebp)
    3550:	ff 75 18             	pushl  0x18(%ebp)
    3553:	ff 75 14             	pushl  0x14(%ebp)
    3556:	ff 75 10             	pushl  0x10(%ebp)
    3559:	ff 75 0c             	pushl  0xc(%ebp)
    355c:	50                   	push   %eax
    355d:	e8 3d 00 00 00       	call   359f <addClickable>
    3562:	83 c4 20             	add    $0x20,%esp
	    	break;
    3565:	eb 36                	jmp    359d <createClickable+0x93>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    3567:	8b 45 08             	mov    0x8(%ebp),%eax
    356a:	83 c0 08             	add    $0x8,%eax
    356d:	83 ec 08             	sub    $0x8,%esp
    3570:	ff 75 20             	pushl  0x20(%ebp)
    3573:	ff 75 18             	pushl  0x18(%ebp)
    3576:	ff 75 14             	pushl  0x14(%ebp)
    3579:	ff 75 10             	pushl  0x10(%ebp)
    357c:	ff 75 0c             	pushl  0xc(%ebp)
    357f:	50                   	push   %eax
    3580:	e8 1a 00 00 00       	call   359f <addClickable>
    3585:	83 c4 20             	add    $0x20,%esp
	    	break;
    3588:	eb 13                	jmp    359d <createClickable+0x93>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    358a:	83 ec 08             	sub    $0x8,%esp
    358d:	68 10 aa 00 00       	push   $0xaa10
    3592:	6a 00                	push   $0x0
    3594:	e8 1c 08 00 00       	call   3db5 <printf>
    3599:	83 c4 10             	add    $0x10,%esp
	    	break;
    359c:	90                   	nop
	}
}
    359d:	c9                   	leave  
    359e:	c3                   	ret    

0000359f <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    359f:	55                   	push   %ebp
    35a0:	89 e5                	mov    %esp,%ebp
    35a2:	83 ec 18             	sub    $0x18,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    35a5:	83 ec 0c             	sub    $0xc,%esp
    35a8:	6a 18                	push   $0x18
    35aa:	e8 d7 0a 00 00       	call   4086 <malloc>
    35af:	83 c4 10             	add    $0x10,%esp
    35b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    35b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35b8:	8b 55 0c             	mov    0xc(%ebp),%edx
    35bb:	89 10                	mov    %edx,(%eax)
    35bd:	8b 55 10             	mov    0x10(%ebp),%edx
    35c0:	89 50 04             	mov    %edx,0x4(%eax)
    35c3:	8b 55 14             	mov    0x14(%ebp),%edx
    35c6:	89 50 08             	mov    %edx,0x8(%eax)
    35c9:	8b 55 18             	mov    0x18(%ebp),%edx
    35cc:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    35cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35d2:	8b 55 1c             	mov    0x1c(%ebp),%edx
    35d5:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    35d8:	8b 45 08             	mov    0x8(%ebp),%eax
    35db:	8b 10                	mov    (%eax),%edx
    35dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35e0:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    35e3:	8b 45 08             	mov    0x8(%ebp),%eax
    35e6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    35e9:	89 10                	mov    %edx,(%eax)
}
    35eb:	c9                   	leave  
    35ec:	c3                   	ret    

000035ed <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    35ed:	55                   	push   %ebp
    35ee:	89 e5                	mov    %esp,%ebp
    35f0:	83 ec 18             	sub    $0x18,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    35f3:	8b 45 08             	mov    0x8(%ebp),%eax
    35f6:	8b 00                	mov    (%eax),%eax
    35f8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    35fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    3601:	e9 ad 00 00 00       	jmp    36b3 <deleteClickable+0xc6>
	{
		if (isIn(cur->area.start, region))
    3606:	ff 75 18             	pushl  0x18(%ebp)
    3609:	ff 75 14             	pushl  0x14(%ebp)
    360c:	ff 75 10             	pushl  0x10(%ebp)
    360f:	ff 75 0c             	pushl  0xc(%ebp)
    3612:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3615:	ff 70 04             	pushl  0x4(%eax)
    3618:	ff 30                	pushl  (%eax)
    361a:	e8 5a fe ff ff       	call   3479 <isIn>
    361f:	83 c4 18             	add    $0x18,%esp
    3622:	85 c0                	test   %eax,%eax
    3624:	74 66                	je     368c <deleteClickable+0x9f>
		{
			//如果当前指针指向头部
			if (cur == *head)
    3626:	8b 45 08             	mov    0x8(%ebp),%eax
    3629:	8b 00                	mov    (%eax),%eax
    362b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    362e:	75 31                	jne    3661 <deleteClickable+0x74>
			{
				//删除头节点
				temp = *head;
    3630:	8b 45 08             	mov    0x8(%ebp),%eax
    3633:	8b 00                	mov    (%eax),%eax
    3635:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    3638:	8b 45 f0             	mov    -0x10(%ebp),%eax
    363b:	8b 50 14             	mov    0x14(%eax),%edx
    363e:	8b 45 08             	mov    0x8(%ebp),%eax
    3641:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    3643:	8b 45 08             	mov    0x8(%ebp),%eax
    3646:	8b 00                	mov    (%eax),%eax
    3648:	89 45 f4             	mov    %eax,-0xc(%ebp)
    364b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    364e:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    3651:	83 ec 0c             	sub    $0xc,%esp
    3654:	ff 75 ec             	pushl  -0x14(%ebp)
    3657:	e8 e9 08 00 00       	call   3f45 <free>
    365c:	83 c4 10             	add    $0x10,%esp
    365f:	eb 52                	jmp    36b3 <deleteClickable+0xc6>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    3661:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3664:	8b 50 14             	mov    0x14(%eax),%edx
    3667:	8b 45 f4             	mov    -0xc(%ebp),%eax
    366a:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    366d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3670:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    3673:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3676:	8b 40 14             	mov    0x14(%eax),%eax
    3679:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    367c:	83 ec 0c             	sub    $0xc,%esp
    367f:	ff 75 ec             	pushl  -0x14(%ebp)
    3682:	e8 be 08 00 00       	call   3f45 <free>
    3687:	83 c4 10             	add    $0x10,%esp
    368a:	eb 27                	jmp    36b3 <deleteClickable+0xc6>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    368c:	8b 45 08             	mov    0x8(%ebp),%eax
    368f:	8b 00                	mov    (%eax),%eax
    3691:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3694:	75 0b                	jne    36a1 <deleteClickable+0xb4>
			{
				cur = cur->next;
    3696:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3699:	8b 40 14             	mov    0x14(%eax),%eax
    369c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    369f:	eb 12                	jmp    36b3 <deleteClickable+0xc6>
			}
			else
			{
				cur = cur->next;
    36a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    36a4:	8b 40 14             	mov    0x14(%eax),%eax
    36a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    36aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36ad:	8b 40 14             	mov    0x14(%eax),%eax
    36b0:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    36b3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    36b7:	0f 85 49 ff ff ff    	jne    3606 <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    36bd:	c9                   	leave  
    36be:	c3                   	ret    

000036bf <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    36bf:	55                   	push   %ebp
    36c0:	89 e5                	mov    %esp,%ebp
    36c2:	83 ec 18             	sub    $0x18,%esp
	Clickable *cur = head;
    36c5:	8b 45 08             	mov    0x8(%ebp),%eax
    36c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    36cb:	eb 44                	jmp    3711 <executeHandler+0x52>
	{
		if (isIn(click, cur->area))
    36cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36d0:	ff 70 0c             	pushl  0xc(%eax)
    36d3:	ff 70 08             	pushl  0x8(%eax)
    36d6:	ff 70 04             	pushl  0x4(%eax)
    36d9:	ff 30                	pushl  (%eax)
    36db:	ff 75 10             	pushl  0x10(%ebp)
    36de:	ff 75 0c             	pushl  0xc(%ebp)
    36e1:	e8 93 fd ff ff       	call   3479 <isIn>
    36e6:	83 c4 18             	add    $0x18,%esp
    36e9:	85 c0                	test   %eax,%eax
    36eb:	74 1b                	je     3708 <executeHandler+0x49>
		{
			cur->handler(click);
    36ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36f0:	8b 40 10             	mov    0x10(%eax),%eax
    36f3:	83 ec 08             	sub    $0x8,%esp
    36f6:	ff 75 10             	pushl  0x10(%ebp)
    36f9:	ff 75 0c             	pushl  0xc(%ebp)
    36fc:	ff d0                	call   *%eax
    36fe:	83 c4 10             	add    $0x10,%esp
			return 1;
    3701:	b8 01 00 00 00       	mov    $0x1,%eax
    3706:	eb 26                	jmp    372e <executeHandler+0x6f>
		}
		cur = cur->next;
    3708:	8b 45 f4             	mov    -0xc(%ebp),%eax
    370b:	8b 40 14             	mov    0x14(%eax),%eax
    370e:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    3711:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3715:	75 b6                	jne    36cd <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	printf(0, "execute: none!\n");
    3717:	83 ec 08             	sub    $0x8,%esp
    371a:	68 3e aa 00 00       	push   $0xaa3e
    371f:	6a 00                	push   $0x0
    3721:	e8 8f 06 00 00       	call   3db5 <printf>
    3726:	83 c4 10             	add    $0x10,%esp
	return 0;
    3729:	b8 00 00 00 00       	mov    $0x0,%eax
}
    372e:	c9                   	leave  
    372f:	c3                   	ret    

00003730 <printClickable>:

void printClickable(Clickable *c)
{
    3730:	55                   	push   %ebp
    3731:	89 e5                	mov    %esp,%ebp
    3733:	53                   	push   %ebx
    3734:	83 ec 04             	sub    $0x4,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    3737:	8b 45 08             	mov    0x8(%ebp),%eax
    373a:	8b 58 0c             	mov    0xc(%eax),%ebx
    373d:	8b 45 08             	mov    0x8(%ebp),%eax
    3740:	8b 48 08             	mov    0x8(%eax),%ecx
    3743:	8b 45 08             	mov    0x8(%ebp),%eax
    3746:	8b 50 04             	mov    0x4(%eax),%edx
    3749:	8b 45 08             	mov    0x8(%ebp),%eax
    374c:	8b 00                	mov    (%eax),%eax
    374e:	83 ec 08             	sub    $0x8,%esp
    3751:	53                   	push   %ebx
    3752:	51                   	push   %ecx
    3753:	52                   	push   %edx
    3754:	50                   	push   %eax
    3755:	68 4e aa 00 00       	push   $0xaa4e
    375a:	6a 00                	push   $0x0
    375c:	e8 54 06 00 00       	call   3db5 <printf>
    3761:	83 c4 20             	add    $0x20,%esp
}
    3764:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3767:	c9                   	leave  
    3768:	c3                   	ret    

00003769 <printClickableList>:

void printClickableList(Clickable *head)
{
    3769:	55                   	push   %ebp
    376a:	89 e5                	mov    %esp,%ebp
    376c:	83 ec 18             	sub    $0x18,%esp
	Clickable *cur = head;
    376f:	8b 45 08             	mov    0x8(%ebp),%eax
    3772:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    3775:	83 ec 08             	sub    $0x8,%esp
    3778:	68 60 aa 00 00       	push   $0xaa60
    377d:	6a 00                	push   $0x0
    377f:	e8 31 06 00 00       	call   3db5 <printf>
    3784:	83 c4 10             	add    $0x10,%esp
	while(cur != 0)
    3787:	eb 17                	jmp    37a0 <printClickableList+0x37>
	{
		printClickable(cur);
    3789:	83 ec 0c             	sub    $0xc,%esp
    378c:	ff 75 f4             	pushl  -0xc(%ebp)
    378f:	e8 9c ff ff ff       	call   3730 <printClickable>
    3794:	83 c4 10             	add    $0x10,%esp
		cur = cur->next;
    3797:	8b 45 f4             	mov    -0xc(%ebp),%eax
    379a:	8b 40 14             	mov    0x14(%eax),%eax
    379d:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    37a0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    37a4:	75 e3                	jne    3789 <printClickableList+0x20>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    37a6:	83 ec 08             	sub    $0x8,%esp
    37a9:	68 71 aa 00 00       	push   $0xaa71
    37ae:	6a 00                	push   $0x0
    37b0:	e8 00 06 00 00       	call   3db5 <printf>
    37b5:	83 c4 10             	add    $0x10,%esp
}
    37b8:	c9                   	leave  
    37b9:	c3                   	ret    

000037ba <testHanler>:

void testHanler(struct Point p)
{
    37ba:	55                   	push   %ebp
    37bb:	89 e5                	mov    %esp,%ebp
    37bd:	83 ec 08             	sub    $0x8,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    37c0:	8b 55 0c             	mov    0xc(%ebp),%edx
    37c3:	8b 45 08             	mov    0x8(%ebp),%eax
    37c6:	52                   	push   %edx
    37c7:	50                   	push   %eax
    37c8:	68 73 aa 00 00       	push   $0xaa73
    37cd:	6a 00                	push   $0x0
    37cf:	e8 e1 05 00 00       	call   3db5 <printf>
    37d4:	83 c4 10             	add    $0x10,%esp
}
    37d7:	c9                   	leave  
    37d8:	c3                   	ret    

000037d9 <testClickable>:
void testClickable(struct Context c)
{
    37d9:	55                   	push   %ebp
    37da:	89 e5                	mov    %esp,%ebp
    37dc:	83 ec 78             	sub    $0x78,%esp
	ClickableManager cm = initClickManager(c);
    37df:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    37e2:	ff 75 10             	pushl  0x10(%ebp)
    37e5:	ff 75 0c             	pushl  0xc(%ebp)
    37e8:	ff 75 08             	pushl  0x8(%ebp)
    37eb:	50                   	push   %eax
    37ec:	e8 cb fc ff ff       	call   34bc <initClickManager>
    37f1:	83 c4 0c             	add    $0xc,%esp

	Rect r1 = initRect(5,5,20,20);
    37f4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    37f7:	83 ec 04             	sub    $0x4,%esp
    37fa:	6a 14                	push   $0x14
    37fc:	6a 14                	push   $0x14
    37fe:	6a 05                	push   $0x5
    3800:	6a 05                	push   $0x5
    3802:	50                   	push   %eax
    3803:	e8 20 fc ff ff       	call   3428 <initRect>
    3808:	83 c4 14             	add    $0x14,%esp
	Rect r2 = initRect(20,20,20,20);
    380b:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    380e:	83 ec 04             	sub    $0x4,%esp
    3811:	6a 14                	push   $0x14
    3813:	6a 14                	push   $0x14
    3815:	6a 14                	push   $0x14
    3817:	6a 14                	push   $0x14
    3819:	50                   	push   %eax
    381a:	e8 09 fc ff ff       	call   3428 <initRect>
    381f:	83 c4 14             	add    $0x14,%esp
	Rect r3 = initRect(50,50,15,15);
    3822:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    3825:	83 ec 04             	sub    $0x4,%esp
    3828:	6a 0f                	push   $0xf
    382a:	6a 0f                	push   $0xf
    382c:	6a 32                	push   $0x32
    382e:	6a 32                	push   $0x32
    3830:	50                   	push   %eax
    3831:	e8 f2 fb ff ff       	call   3428 <initRect>
    3836:	83 c4 14             	add    $0x14,%esp
	Rect r4 = initRect(0,0,30,30);
    3839:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    383c:	83 ec 04             	sub    $0x4,%esp
    383f:	6a 1e                	push   $0x1e
    3841:	6a 1e                	push   $0x1e
    3843:	6a 00                	push   $0x0
    3845:	6a 00                	push   $0x0
    3847:	50                   	push   %eax
    3848:	e8 db fb ff ff       	call   3428 <initRect>
    384d:	83 c4 14             	add    $0x14,%esp
	Point p1 = initPoint(23, 23);
    3850:	8d 45 9c             	lea    -0x64(%ebp),%eax
    3853:	83 ec 04             	sub    $0x4,%esp
    3856:	6a 17                	push   $0x17
    3858:	6a 17                	push   $0x17
    385a:	50                   	push   %eax
    385b:	e8 a1 fb ff ff       	call   3401 <initPoint>
    3860:	83 c4 0c             	add    $0xc,%esp
	Point p2 = initPoint(70, 70);
    3863:	8d 45 94             	lea    -0x6c(%ebp),%eax
    3866:	83 ec 04             	sub    $0x4,%esp
    3869:	6a 46                	push   $0x46
    386b:	6a 46                	push   $0x46
    386d:	50                   	push   %eax
    386e:	e8 8e fb ff ff       	call   3401 <initPoint>
    3873:	83 c4 0c             	add    $0xc,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    3876:	83 ec 04             	sub    $0x4,%esp
    3879:	68 ba 37 00 00       	push   $0x37ba
    387e:	6a 02                	push   $0x2
    3880:	ff 75 e0             	pushl  -0x20(%ebp)
    3883:	ff 75 dc             	pushl  -0x24(%ebp)
    3886:	ff 75 d8             	pushl  -0x28(%ebp)
    3889:	ff 75 d4             	pushl  -0x2c(%ebp)
    388c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    388f:	50                   	push   %eax
    3890:	e8 75 fc ff ff       	call   350a <createClickable>
    3895:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    3898:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    389b:	83 ec 04             	sub    $0x4,%esp
    389e:	50                   	push   %eax
    389f:	68 87 aa 00 00       	push   $0xaa87
    38a4:	6a 00                	push   $0x0
    38a6:	e8 0a 05 00 00       	call   3db5 <printf>
    38ab:	83 c4 10             	add    $0x10,%esp
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    38ae:	83 ec 04             	sub    $0x4,%esp
    38b1:	68 ba 37 00 00       	push   $0x37ba
    38b6:	6a 02                	push   $0x2
    38b8:	ff 75 d0             	pushl  -0x30(%ebp)
    38bb:	ff 75 cc             	pushl  -0x34(%ebp)
    38be:	ff 75 c8             	pushl  -0x38(%ebp)
    38c1:	ff 75 c4             	pushl  -0x3c(%ebp)
    38c4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    38c7:	50                   	push   %eax
    38c8:	e8 3d fc ff ff       	call   350a <createClickable>
    38cd:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    38d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    38d3:	83 ec 04             	sub    $0x4,%esp
    38d6:	50                   	push   %eax
    38d7:	68 87 aa 00 00       	push   $0xaa87
    38dc:	6a 00                	push   $0x0
    38de:	e8 d2 04 00 00       	call   3db5 <printf>
    38e3:	83 c4 10             	add    $0x10,%esp
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    38e6:	83 ec 04             	sub    $0x4,%esp
    38e9:	68 ba 37 00 00       	push   $0x37ba
    38ee:	6a 02                	push   $0x2
    38f0:	ff 75 c0             	pushl  -0x40(%ebp)
    38f3:	ff 75 bc             	pushl  -0x44(%ebp)
    38f6:	ff 75 b8             	pushl  -0x48(%ebp)
    38f9:	ff 75 b4             	pushl  -0x4c(%ebp)
    38fc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    38ff:	50                   	push   %eax
    3900:	e8 05 fc ff ff       	call   350a <createClickable>
    3905:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    3908:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    390b:	83 ec 04             	sub    $0x4,%esp
    390e:	50                   	push   %eax
    390f:	68 87 aa 00 00       	push   $0xaa87
    3914:	6a 00                	push   $0x0
    3916:	e8 9a 04 00 00       	call   3db5 <printf>
    391b:	83 c4 10             	add    $0x10,%esp
	printClickableList(cm.left_click);
    391e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3921:	83 ec 0c             	sub    $0xc,%esp
    3924:	50                   	push   %eax
    3925:	e8 3f fe ff ff       	call   3769 <printClickableList>
    392a:	83 c4 10             	add    $0x10,%esp
	executeHandler(cm.left_click, p1);
    392d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3930:	83 ec 04             	sub    $0x4,%esp
    3933:	ff 75 a0             	pushl  -0x60(%ebp)
    3936:	ff 75 9c             	pushl  -0x64(%ebp)
    3939:	50                   	push   %eax
    393a:	e8 80 fd ff ff       	call   36bf <executeHandler>
    393f:	83 c4 10             	add    $0x10,%esp
	executeHandler(cm.left_click, p2);
    3942:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3945:	83 ec 04             	sub    $0x4,%esp
    3948:	ff 75 98             	pushl  -0x68(%ebp)
    394b:	ff 75 94             	pushl  -0x6c(%ebp)
    394e:	50                   	push   %eax
    394f:	e8 6b fd ff ff       	call   36bf <executeHandler>
    3954:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, r4);
    3957:	83 ec 0c             	sub    $0xc,%esp
    395a:	ff 75 b0             	pushl  -0x50(%ebp)
    395d:	ff 75 ac             	pushl  -0x54(%ebp)
    3960:	ff 75 a8             	pushl  -0x58(%ebp)
    3963:	ff 75 a4             	pushl  -0x5c(%ebp)
    3966:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3969:	50                   	push   %eax
    396a:	e8 7e fc ff ff       	call   35ed <deleteClickable>
    396f:	83 c4 20             	add    $0x20,%esp
	printClickableList(cm.left_click);
    3972:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3975:	83 ec 0c             	sub    $0xc,%esp
    3978:	50                   	push   %eax
    3979:	e8 eb fd ff ff       	call   3769 <printClickableList>
    397e:	83 c4 10             	add    $0x10,%esp
}
    3981:	c9                   	leave  
    3982:	c3                   	ret    

00003983 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    3983:	55                   	push   %ebp
    3984:	89 e5                	mov    %esp,%ebp
    3986:	57                   	push   %edi
    3987:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    3988:	8b 4d 08             	mov    0x8(%ebp),%ecx
    398b:	8b 55 10             	mov    0x10(%ebp),%edx
    398e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3991:	89 cb                	mov    %ecx,%ebx
    3993:	89 df                	mov    %ebx,%edi
    3995:	89 d1                	mov    %edx,%ecx
    3997:	fc                   	cld    
    3998:	f3 aa                	rep stos %al,%es:(%edi)
    399a:	89 ca                	mov    %ecx,%edx
    399c:	89 fb                	mov    %edi,%ebx
    399e:	89 5d 08             	mov    %ebx,0x8(%ebp)
    39a1:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    39a4:	5b                   	pop    %ebx
    39a5:	5f                   	pop    %edi
    39a6:	5d                   	pop    %ebp
    39a7:	c3                   	ret    

000039a8 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    39a8:	55                   	push   %ebp
    39a9:	89 e5                	mov    %esp,%ebp
    39ab:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    39ae:	8b 45 08             	mov    0x8(%ebp),%eax
    39b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    39b4:	90                   	nop
    39b5:	8b 45 08             	mov    0x8(%ebp),%eax
    39b8:	8d 50 01             	lea    0x1(%eax),%edx
    39bb:	89 55 08             	mov    %edx,0x8(%ebp)
    39be:	8b 55 0c             	mov    0xc(%ebp),%edx
    39c1:	8d 4a 01             	lea    0x1(%edx),%ecx
    39c4:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    39c7:	0f b6 12             	movzbl (%edx),%edx
    39ca:	88 10                	mov    %dl,(%eax)
    39cc:	0f b6 00             	movzbl (%eax),%eax
    39cf:	84 c0                	test   %al,%al
    39d1:	75 e2                	jne    39b5 <strcpy+0xd>
    ;
  return os;
    39d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    39d6:	c9                   	leave  
    39d7:	c3                   	ret    

000039d8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    39d8:	55                   	push   %ebp
    39d9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    39db:	eb 08                	jmp    39e5 <strcmp+0xd>
    p++, q++;
    39dd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    39e1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    39e5:	8b 45 08             	mov    0x8(%ebp),%eax
    39e8:	0f b6 00             	movzbl (%eax),%eax
    39eb:	84 c0                	test   %al,%al
    39ed:	74 10                	je     39ff <strcmp+0x27>
    39ef:	8b 45 08             	mov    0x8(%ebp),%eax
    39f2:	0f b6 10             	movzbl (%eax),%edx
    39f5:	8b 45 0c             	mov    0xc(%ebp),%eax
    39f8:	0f b6 00             	movzbl (%eax),%eax
    39fb:	38 c2                	cmp    %al,%dl
    39fd:	74 de                	je     39dd <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    39ff:	8b 45 08             	mov    0x8(%ebp),%eax
    3a02:	0f b6 00             	movzbl (%eax),%eax
    3a05:	0f b6 d0             	movzbl %al,%edx
    3a08:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a0b:	0f b6 00             	movzbl (%eax),%eax
    3a0e:	0f b6 c0             	movzbl %al,%eax
    3a11:	29 c2                	sub    %eax,%edx
    3a13:	89 d0                	mov    %edx,%eax
}
    3a15:	5d                   	pop    %ebp
    3a16:	c3                   	ret    

00003a17 <strlen>:

uint
strlen(char *s)
{
    3a17:	55                   	push   %ebp
    3a18:	89 e5                	mov    %esp,%ebp
    3a1a:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    3a1d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    3a24:	eb 04                	jmp    3a2a <strlen+0x13>
    3a26:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3a2a:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3a2d:	8b 45 08             	mov    0x8(%ebp),%eax
    3a30:	01 d0                	add    %edx,%eax
    3a32:	0f b6 00             	movzbl (%eax),%eax
    3a35:	84 c0                	test   %al,%al
    3a37:	75 ed                	jne    3a26 <strlen+0xf>
    ;
  return n;
    3a39:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3a3c:	c9                   	leave  
    3a3d:	c3                   	ret    

00003a3e <memset>:

void*
memset(void *dst, int c, uint n)
{
    3a3e:	55                   	push   %ebp
    3a3f:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
    3a41:	8b 45 10             	mov    0x10(%ebp),%eax
    3a44:	50                   	push   %eax
    3a45:	ff 75 0c             	pushl  0xc(%ebp)
    3a48:	ff 75 08             	pushl  0x8(%ebp)
    3a4b:	e8 33 ff ff ff       	call   3983 <stosb>
    3a50:	83 c4 0c             	add    $0xc,%esp
  return dst;
    3a53:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3a56:	c9                   	leave  
    3a57:	c3                   	ret    

00003a58 <strchr>:

char*
strchr(const char *s, char c)
{
    3a58:	55                   	push   %ebp
    3a59:	89 e5                	mov    %esp,%ebp
    3a5b:	83 ec 04             	sub    $0x4,%esp
    3a5e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a61:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    3a64:	eb 14                	jmp    3a7a <strchr+0x22>
    if(*s == c)
    3a66:	8b 45 08             	mov    0x8(%ebp),%eax
    3a69:	0f b6 00             	movzbl (%eax),%eax
    3a6c:	3a 45 fc             	cmp    -0x4(%ebp),%al
    3a6f:	75 05                	jne    3a76 <strchr+0x1e>
      return (char*)s;
    3a71:	8b 45 08             	mov    0x8(%ebp),%eax
    3a74:	eb 13                	jmp    3a89 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3a76:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3a7a:	8b 45 08             	mov    0x8(%ebp),%eax
    3a7d:	0f b6 00             	movzbl (%eax),%eax
    3a80:	84 c0                	test   %al,%al
    3a82:	75 e2                	jne    3a66 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    3a84:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3a89:	c9                   	leave  
    3a8a:	c3                   	ret    

00003a8b <gets>:

char*
gets(char *buf, int max)
{
    3a8b:	55                   	push   %ebp
    3a8c:	89 e5                	mov    %esp,%ebp
    3a8e:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3a91:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3a98:	eb 44                	jmp    3ade <gets+0x53>
    cc = read(0, &c, 1);
    3a9a:	83 ec 04             	sub    $0x4,%esp
    3a9d:	6a 01                	push   $0x1
    3a9f:	8d 45 ef             	lea    -0x11(%ebp),%eax
    3aa2:	50                   	push   %eax
    3aa3:	6a 00                	push   $0x0
    3aa5:	e8 46 01 00 00       	call   3bf0 <read>
    3aaa:	83 c4 10             	add    $0x10,%esp
    3aad:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    3ab0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3ab4:	7f 02                	jg     3ab8 <gets+0x2d>
      break;
    3ab6:	eb 31                	jmp    3ae9 <gets+0x5e>
    buf[i++] = c;
    3ab8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3abb:	8d 50 01             	lea    0x1(%eax),%edx
    3abe:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3ac1:	89 c2                	mov    %eax,%edx
    3ac3:	8b 45 08             	mov    0x8(%ebp),%eax
    3ac6:	01 c2                	add    %eax,%edx
    3ac8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3acc:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    3ace:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3ad2:	3c 0a                	cmp    $0xa,%al
    3ad4:	74 13                	je     3ae9 <gets+0x5e>
    3ad6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3ada:	3c 0d                	cmp    $0xd,%al
    3adc:	74 0b                	je     3ae9 <gets+0x5e>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3ade:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ae1:	83 c0 01             	add    $0x1,%eax
    3ae4:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3ae7:	7c b1                	jl     3a9a <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3ae9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3aec:	8b 45 08             	mov    0x8(%ebp),%eax
    3aef:	01 d0                	add    %edx,%eax
    3af1:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    3af4:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3af7:	c9                   	leave  
    3af8:	c3                   	ret    

00003af9 <stat>:

int
stat(char *n, struct stat *st)
{
    3af9:	55                   	push   %ebp
    3afa:	89 e5                	mov    %esp,%ebp
    3afc:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3aff:	83 ec 08             	sub    $0x8,%esp
    3b02:	6a 00                	push   $0x0
    3b04:	ff 75 08             	pushl  0x8(%ebp)
    3b07:	e8 0c 01 00 00       	call   3c18 <open>
    3b0c:	83 c4 10             	add    $0x10,%esp
    3b0f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    3b12:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3b16:	79 07                	jns    3b1f <stat+0x26>
    return -1;
    3b18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3b1d:	eb 25                	jmp    3b44 <stat+0x4b>
  r = fstat(fd, st);
    3b1f:	83 ec 08             	sub    $0x8,%esp
    3b22:	ff 75 0c             	pushl  0xc(%ebp)
    3b25:	ff 75 f4             	pushl  -0xc(%ebp)
    3b28:	e8 03 01 00 00       	call   3c30 <fstat>
    3b2d:	83 c4 10             	add    $0x10,%esp
    3b30:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    3b33:	83 ec 0c             	sub    $0xc,%esp
    3b36:	ff 75 f4             	pushl  -0xc(%ebp)
    3b39:	e8 c2 00 00 00       	call   3c00 <close>
    3b3e:	83 c4 10             	add    $0x10,%esp
  return r;
    3b41:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    3b44:	c9                   	leave  
    3b45:	c3                   	ret    

00003b46 <atoi>:

int
atoi(const char *s)
{
    3b46:	55                   	push   %ebp
    3b47:	89 e5                	mov    %esp,%ebp
    3b49:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    3b4c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    3b53:	eb 25                	jmp    3b7a <atoi+0x34>
    n = n*10 + *s++ - '0';
    3b55:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3b58:	89 d0                	mov    %edx,%eax
    3b5a:	c1 e0 02             	shl    $0x2,%eax
    3b5d:	01 d0                	add    %edx,%eax
    3b5f:	01 c0                	add    %eax,%eax
    3b61:	89 c1                	mov    %eax,%ecx
    3b63:	8b 45 08             	mov    0x8(%ebp),%eax
    3b66:	8d 50 01             	lea    0x1(%eax),%edx
    3b69:	89 55 08             	mov    %edx,0x8(%ebp)
    3b6c:	0f b6 00             	movzbl (%eax),%eax
    3b6f:	0f be c0             	movsbl %al,%eax
    3b72:	01 c8                	add    %ecx,%eax
    3b74:	83 e8 30             	sub    $0x30,%eax
    3b77:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3b7a:	8b 45 08             	mov    0x8(%ebp),%eax
    3b7d:	0f b6 00             	movzbl (%eax),%eax
    3b80:	3c 2f                	cmp    $0x2f,%al
    3b82:	7e 0a                	jle    3b8e <atoi+0x48>
    3b84:	8b 45 08             	mov    0x8(%ebp),%eax
    3b87:	0f b6 00             	movzbl (%eax),%eax
    3b8a:	3c 39                	cmp    $0x39,%al
    3b8c:	7e c7                	jle    3b55 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    3b8e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3b91:	c9                   	leave  
    3b92:	c3                   	ret    

00003b93 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3b93:	55                   	push   %ebp
    3b94:	89 e5                	mov    %esp,%ebp
    3b96:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    3b99:	8b 45 08             	mov    0x8(%ebp),%eax
    3b9c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    3b9f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ba2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    3ba5:	eb 17                	jmp    3bbe <memmove+0x2b>
    *dst++ = *src++;
    3ba7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3baa:	8d 50 01             	lea    0x1(%eax),%edx
    3bad:	89 55 fc             	mov    %edx,-0x4(%ebp)
    3bb0:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3bb3:	8d 4a 01             	lea    0x1(%edx),%ecx
    3bb6:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    3bb9:	0f b6 12             	movzbl (%edx),%edx
    3bbc:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3bbe:	8b 45 10             	mov    0x10(%ebp),%eax
    3bc1:	8d 50 ff             	lea    -0x1(%eax),%edx
    3bc4:	89 55 10             	mov    %edx,0x10(%ebp)
    3bc7:	85 c0                	test   %eax,%eax
    3bc9:	7f dc                	jg     3ba7 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    3bcb:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3bce:	c9                   	leave  
    3bcf:	c3                   	ret    

00003bd0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3bd0:	b8 01 00 00 00       	mov    $0x1,%eax
    3bd5:	cd 40                	int    $0x40
    3bd7:	c3                   	ret    

00003bd8 <exit>:
SYSCALL(exit)
    3bd8:	b8 02 00 00 00       	mov    $0x2,%eax
    3bdd:	cd 40                	int    $0x40
    3bdf:	c3                   	ret    

00003be0 <wait>:
SYSCALL(wait)
    3be0:	b8 03 00 00 00       	mov    $0x3,%eax
    3be5:	cd 40                	int    $0x40
    3be7:	c3                   	ret    

00003be8 <pipe>:
SYSCALL(pipe)
    3be8:	b8 04 00 00 00       	mov    $0x4,%eax
    3bed:	cd 40                	int    $0x40
    3bef:	c3                   	ret    

00003bf0 <read>:
SYSCALL(read)
    3bf0:	b8 05 00 00 00       	mov    $0x5,%eax
    3bf5:	cd 40                	int    $0x40
    3bf7:	c3                   	ret    

00003bf8 <write>:
SYSCALL(write)
    3bf8:	b8 10 00 00 00       	mov    $0x10,%eax
    3bfd:	cd 40                	int    $0x40
    3bff:	c3                   	ret    

00003c00 <close>:
SYSCALL(close)
    3c00:	b8 15 00 00 00       	mov    $0x15,%eax
    3c05:	cd 40                	int    $0x40
    3c07:	c3                   	ret    

00003c08 <kill>:
SYSCALL(kill)
    3c08:	b8 06 00 00 00       	mov    $0x6,%eax
    3c0d:	cd 40                	int    $0x40
    3c0f:	c3                   	ret    

00003c10 <exec>:
SYSCALL(exec)
    3c10:	b8 07 00 00 00       	mov    $0x7,%eax
    3c15:	cd 40                	int    $0x40
    3c17:	c3                   	ret    

00003c18 <open>:
SYSCALL(open)
    3c18:	b8 0f 00 00 00       	mov    $0xf,%eax
    3c1d:	cd 40                	int    $0x40
    3c1f:	c3                   	ret    

00003c20 <mknod>:
SYSCALL(mknod)
    3c20:	b8 11 00 00 00       	mov    $0x11,%eax
    3c25:	cd 40                	int    $0x40
    3c27:	c3                   	ret    

00003c28 <unlink>:
SYSCALL(unlink)
    3c28:	b8 12 00 00 00       	mov    $0x12,%eax
    3c2d:	cd 40                	int    $0x40
    3c2f:	c3                   	ret    

00003c30 <fstat>:
SYSCALL(fstat)
    3c30:	b8 08 00 00 00       	mov    $0x8,%eax
    3c35:	cd 40                	int    $0x40
    3c37:	c3                   	ret    

00003c38 <link>:
SYSCALL(link)
    3c38:	b8 13 00 00 00       	mov    $0x13,%eax
    3c3d:	cd 40                	int    $0x40
    3c3f:	c3                   	ret    

00003c40 <mkdir>:
SYSCALL(mkdir)
    3c40:	b8 14 00 00 00       	mov    $0x14,%eax
    3c45:	cd 40                	int    $0x40
    3c47:	c3                   	ret    

00003c48 <chdir>:
SYSCALL(chdir)
    3c48:	b8 09 00 00 00       	mov    $0x9,%eax
    3c4d:	cd 40                	int    $0x40
    3c4f:	c3                   	ret    

00003c50 <dup>:
SYSCALL(dup)
    3c50:	b8 0a 00 00 00       	mov    $0xa,%eax
    3c55:	cd 40                	int    $0x40
    3c57:	c3                   	ret    

00003c58 <getpid>:
SYSCALL(getpid)
    3c58:	b8 0b 00 00 00       	mov    $0xb,%eax
    3c5d:	cd 40                	int    $0x40
    3c5f:	c3                   	ret    

00003c60 <sbrk>:
SYSCALL(sbrk)
    3c60:	b8 0c 00 00 00       	mov    $0xc,%eax
    3c65:	cd 40                	int    $0x40
    3c67:	c3                   	ret    

00003c68 <sleep>:
SYSCALL(sleep)
    3c68:	b8 0d 00 00 00       	mov    $0xd,%eax
    3c6d:	cd 40                	int    $0x40
    3c6f:	c3                   	ret    

00003c70 <uptime>:
SYSCALL(uptime)
    3c70:	b8 0e 00 00 00       	mov    $0xe,%eax
    3c75:	cd 40                	int    $0x40
    3c77:	c3                   	ret    

00003c78 <getMsg>:
SYSCALL(getMsg)
    3c78:	b8 16 00 00 00       	mov    $0x16,%eax
    3c7d:	cd 40                	int    $0x40
    3c7f:	c3                   	ret    

00003c80 <createWindow>:
SYSCALL(createWindow)
    3c80:	b8 17 00 00 00       	mov    $0x17,%eax
    3c85:	cd 40                	int    $0x40
    3c87:	c3                   	ret    

00003c88 <destroyWindow>:
SYSCALL(destroyWindow)
    3c88:	b8 18 00 00 00       	mov    $0x18,%eax
    3c8d:	cd 40                	int    $0x40
    3c8f:	c3                   	ret    

00003c90 <updateWindow>:
SYSCALL(updateWindow)
    3c90:	b8 19 00 00 00       	mov    $0x19,%eax
    3c95:	cd 40                	int    $0x40
    3c97:	c3                   	ret    

00003c98 <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    3c98:	b8 1a 00 00 00       	mov    $0x1a,%eax
    3c9d:	cd 40                	int    $0x40
    3c9f:	c3                   	ret    

00003ca0 <kwrite>:
SYSCALL(kwrite)
    3ca0:	b8 1c 00 00 00       	mov    $0x1c,%eax
    3ca5:	cd 40                	int    $0x40
    3ca7:	c3                   	ret    

00003ca8 <setSampleRate>:
SYSCALL(setSampleRate)
    3ca8:	b8 1b 00 00 00       	mov    $0x1b,%eax
    3cad:	cd 40                	int    $0x40
    3caf:	c3                   	ret    

00003cb0 <pause>:
SYSCALL(pause)
    3cb0:	b8 1d 00 00 00       	mov    $0x1d,%eax
    3cb5:	cd 40                	int    $0x40
    3cb7:	c3                   	ret    

00003cb8 <wavdecode>:
SYSCALL(wavdecode)
    3cb8:	b8 1e 00 00 00       	mov    $0x1e,%eax
    3cbd:	cd 40                	int    $0x40
    3cbf:	c3                   	ret    

00003cc0 <beginDecode>:
SYSCALL(beginDecode)
    3cc0:	b8 1f 00 00 00       	mov    $0x1f,%eax
    3cc5:	cd 40                	int    $0x40
    3cc7:	c3                   	ret    

00003cc8 <waitForDecode>:
SYSCALL(waitForDecode)
    3cc8:	b8 20 00 00 00       	mov    $0x20,%eax
    3ccd:	cd 40                	int    $0x40
    3ccf:	c3                   	ret    

00003cd0 <endDecode>:
SYSCALL(endDecode)
    3cd0:	b8 21 00 00 00       	mov    $0x21,%eax
    3cd5:	cd 40                	int    $0x40
    3cd7:	c3                   	ret    

00003cd8 <getCoreBuf>:
    3cd8:	b8 22 00 00 00       	mov    $0x22,%eax
    3cdd:	cd 40                	int    $0x40
    3cdf:	c3                   	ret    

00003ce0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    3ce0:	55                   	push   %ebp
    3ce1:	89 e5                	mov    %esp,%ebp
    3ce3:	83 ec 18             	sub    $0x18,%esp
    3ce6:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ce9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    3cec:	83 ec 04             	sub    $0x4,%esp
    3cef:	6a 01                	push   $0x1
    3cf1:	8d 45 f4             	lea    -0xc(%ebp),%eax
    3cf4:	50                   	push   %eax
    3cf5:	ff 75 08             	pushl  0x8(%ebp)
    3cf8:	e8 fb fe ff ff       	call   3bf8 <write>
    3cfd:	83 c4 10             	add    $0x10,%esp
}
    3d00:	c9                   	leave  
    3d01:	c3                   	ret    

00003d02 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    3d02:	55                   	push   %ebp
    3d03:	89 e5                	mov    %esp,%ebp
    3d05:	53                   	push   %ebx
    3d06:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3d09:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    3d10:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    3d14:	74 17                	je     3d2d <printint+0x2b>
    3d16:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3d1a:	79 11                	jns    3d2d <printint+0x2b>
    neg = 1;
    3d1c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    3d23:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d26:	f7 d8                	neg    %eax
    3d28:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3d2b:	eb 06                	jmp    3d33 <printint+0x31>
  } else {
    x = xx;
    3d2d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d30:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    3d33:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    3d3a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3d3d:	8d 41 01             	lea    0x1(%ecx),%eax
    3d40:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3d43:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3d46:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3d49:	ba 00 00 00 00       	mov    $0x0,%edx
    3d4e:	f7 f3                	div    %ebx
    3d50:	89 d0                	mov    %edx,%eax
    3d52:	0f b6 80 70 e9 00 00 	movzbl 0xe970(%eax),%eax
    3d59:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    3d5d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3d60:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3d63:	ba 00 00 00 00       	mov    $0x0,%edx
    3d68:	f7 f3                	div    %ebx
    3d6a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3d6d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3d71:	75 c7                	jne    3d3a <printint+0x38>
  if(neg)
    3d73:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3d77:	74 0e                	je     3d87 <printint+0x85>
    buf[i++] = '-';
    3d79:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d7c:	8d 50 01             	lea    0x1(%eax),%edx
    3d7f:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3d82:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    3d87:	eb 1d                	jmp    3da6 <printint+0xa4>
    putc(fd, buf[i]);
    3d89:	8d 55 dc             	lea    -0x24(%ebp),%edx
    3d8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d8f:	01 d0                	add    %edx,%eax
    3d91:	0f b6 00             	movzbl (%eax),%eax
    3d94:	0f be c0             	movsbl %al,%eax
    3d97:	83 ec 08             	sub    $0x8,%esp
    3d9a:	50                   	push   %eax
    3d9b:	ff 75 08             	pushl  0x8(%ebp)
    3d9e:	e8 3d ff ff ff       	call   3ce0 <putc>
    3da3:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3da6:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    3daa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3dae:	79 d9                	jns    3d89 <printint+0x87>
    putc(fd, buf[i]);
}
    3db0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3db3:	c9                   	leave  
    3db4:	c3                   	ret    

00003db5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3db5:	55                   	push   %ebp
    3db6:	89 e5                	mov    %esp,%ebp
    3db8:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    3dbb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    3dc2:	8d 45 0c             	lea    0xc(%ebp),%eax
    3dc5:	83 c0 04             	add    $0x4,%eax
    3dc8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    3dcb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3dd2:	e9 59 01 00 00       	jmp    3f30 <printf+0x17b>
    c = fmt[i] & 0xff;
    3dd7:	8b 55 0c             	mov    0xc(%ebp),%edx
    3dda:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ddd:	01 d0                	add    %edx,%eax
    3ddf:	0f b6 00             	movzbl (%eax),%eax
    3de2:	0f be c0             	movsbl %al,%eax
    3de5:	25 ff 00 00 00       	and    $0xff,%eax
    3dea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    3ded:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3df1:	75 2c                	jne    3e1f <printf+0x6a>
      if(c == '%'){
    3df3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3df7:	75 0c                	jne    3e05 <printf+0x50>
        state = '%';
    3df9:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    3e00:	e9 27 01 00 00       	jmp    3f2c <printf+0x177>
      } else {
        putc(fd, c);
    3e05:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3e08:	0f be c0             	movsbl %al,%eax
    3e0b:	83 ec 08             	sub    $0x8,%esp
    3e0e:	50                   	push   %eax
    3e0f:	ff 75 08             	pushl  0x8(%ebp)
    3e12:	e8 c9 fe ff ff       	call   3ce0 <putc>
    3e17:	83 c4 10             	add    $0x10,%esp
    3e1a:	e9 0d 01 00 00       	jmp    3f2c <printf+0x177>
      }
    } else if(state == '%'){
    3e1f:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    3e23:	0f 85 03 01 00 00    	jne    3f2c <printf+0x177>
      if(c == 'd'){
    3e29:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    3e2d:	75 1e                	jne    3e4d <printf+0x98>
        printint(fd, *ap, 10, 1);
    3e2f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3e32:	8b 00                	mov    (%eax),%eax
    3e34:	6a 01                	push   $0x1
    3e36:	6a 0a                	push   $0xa
    3e38:	50                   	push   %eax
    3e39:	ff 75 08             	pushl  0x8(%ebp)
    3e3c:	e8 c1 fe ff ff       	call   3d02 <printint>
    3e41:	83 c4 10             	add    $0x10,%esp
        ap++;
    3e44:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3e48:	e9 d8 00 00 00       	jmp    3f25 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
    3e4d:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    3e51:	74 06                	je     3e59 <printf+0xa4>
    3e53:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    3e57:	75 1e                	jne    3e77 <printf+0xc2>
        printint(fd, *ap, 16, 0);
    3e59:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3e5c:	8b 00                	mov    (%eax),%eax
    3e5e:	6a 00                	push   $0x0
    3e60:	6a 10                	push   $0x10
    3e62:	50                   	push   %eax
    3e63:	ff 75 08             	pushl  0x8(%ebp)
    3e66:	e8 97 fe ff ff       	call   3d02 <printint>
    3e6b:	83 c4 10             	add    $0x10,%esp
        ap++;
    3e6e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3e72:	e9 ae 00 00 00       	jmp    3f25 <printf+0x170>
      } else if(c == 's'){
    3e77:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    3e7b:	75 43                	jne    3ec0 <printf+0x10b>
        s = (char*)*ap;
    3e7d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3e80:	8b 00                	mov    (%eax),%eax
    3e82:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    3e85:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    3e89:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3e8d:	75 07                	jne    3e96 <printf+0xe1>
          s = "(null)";
    3e8f:	c7 45 f4 97 aa 00 00 	movl   $0xaa97,-0xc(%ebp)
        while(*s != 0){
    3e96:	eb 1c                	jmp    3eb4 <printf+0xff>
          putc(fd, *s);
    3e98:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e9b:	0f b6 00             	movzbl (%eax),%eax
    3e9e:	0f be c0             	movsbl %al,%eax
    3ea1:	83 ec 08             	sub    $0x8,%esp
    3ea4:	50                   	push   %eax
    3ea5:	ff 75 08             	pushl  0x8(%ebp)
    3ea8:	e8 33 fe ff ff       	call   3ce0 <putc>
    3ead:	83 c4 10             	add    $0x10,%esp
          s++;
    3eb0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3eb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3eb7:	0f b6 00             	movzbl (%eax),%eax
    3eba:	84 c0                	test   %al,%al
    3ebc:	75 da                	jne    3e98 <printf+0xe3>
    3ebe:	eb 65                	jmp    3f25 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3ec0:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    3ec4:	75 1d                	jne    3ee3 <printf+0x12e>
        putc(fd, *ap);
    3ec6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3ec9:	8b 00                	mov    (%eax),%eax
    3ecb:	0f be c0             	movsbl %al,%eax
    3ece:	83 ec 08             	sub    $0x8,%esp
    3ed1:	50                   	push   %eax
    3ed2:	ff 75 08             	pushl  0x8(%ebp)
    3ed5:	e8 06 fe ff ff       	call   3ce0 <putc>
    3eda:	83 c4 10             	add    $0x10,%esp
        ap++;
    3edd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3ee1:	eb 42                	jmp    3f25 <printf+0x170>
      } else if(c == '%'){
    3ee3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3ee7:	75 17                	jne    3f00 <printf+0x14b>
        putc(fd, c);
    3ee9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3eec:	0f be c0             	movsbl %al,%eax
    3eef:	83 ec 08             	sub    $0x8,%esp
    3ef2:	50                   	push   %eax
    3ef3:	ff 75 08             	pushl  0x8(%ebp)
    3ef6:	e8 e5 fd ff ff       	call   3ce0 <putc>
    3efb:	83 c4 10             	add    $0x10,%esp
    3efe:	eb 25                	jmp    3f25 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    3f00:	83 ec 08             	sub    $0x8,%esp
    3f03:	6a 25                	push   $0x25
    3f05:	ff 75 08             	pushl  0x8(%ebp)
    3f08:	e8 d3 fd ff ff       	call   3ce0 <putc>
    3f0d:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
    3f10:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f13:	0f be c0             	movsbl %al,%eax
    3f16:	83 ec 08             	sub    $0x8,%esp
    3f19:	50                   	push   %eax
    3f1a:	ff 75 08             	pushl  0x8(%ebp)
    3f1d:	e8 be fd ff ff       	call   3ce0 <putc>
    3f22:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    3f25:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3f2c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3f30:	8b 55 0c             	mov    0xc(%ebp),%edx
    3f33:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3f36:	01 d0                	add    %edx,%eax
    3f38:	0f b6 00             	movzbl (%eax),%eax
    3f3b:	84 c0                	test   %al,%al
    3f3d:	0f 85 94 fe ff ff    	jne    3dd7 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3f43:	c9                   	leave  
    3f44:	c3                   	ret    

00003f45 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3f45:	55                   	push   %ebp
    3f46:	89 e5                	mov    %esp,%ebp
    3f48:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3f4b:	8b 45 08             	mov    0x8(%ebp),%eax
    3f4e:	83 e8 08             	sub    $0x8,%eax
    3f51:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3f54:	a1 54 ef 00 00       	mov    0xef54,%eax
    3f59:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3f5c:	eb 24                	jmp    3f82 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3f5e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f61:	8b 00                	mov    (%eax),%eax
    3f63:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3f66:	77 12                	ja     3f7a <free+0x35>
    3f68:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f6b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3f6e:	77 24                	ja     3f94 <free+0x4f>
    3f70:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f73:	8b 00                	mov    (%eax),%eax
    3f75:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3f78:	77 1a                	ja     3f94 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3f7a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f7d:	8b 00                	mov    (%eax),%eax
    3f7f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3f82:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f85:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3f88:	76 d4                	jbe    3f5e <free+0x19>
    3f8a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f8d:	8b 00                	mov    (%eax),%eax
    3f8f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3f92:	76 ca                	jbe    3f5e <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    3f94:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f97:	8b 40 04             	mov    0x4(%eax),%eax
    3f9a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    3fa1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fa4:	01 c2                	add    %eax,%edx
    3fa6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fa9:	8b 00                	mov    (%eax),%eax
    3fab:	39 c2                	cmp    %eax,%edx
    3fad:	75 24                	jne    3fd3 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    3faf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fb2:	8b 50 04             	mov    0x4(%eax),%edx
    3fb5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fb8:	8b 00                	mov    (%eax),%eax
    3fba:	8b 40 04             	mov    0x4(%eax),%eax
    3fbd:	01 c2                	add    %eax,%edx
    3fbf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fc2:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    3fc5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fc8:	8b 00                	mov    (%eax),%eax
    3fca:	8b 10                	mov    (%eax),%edx
    3fcc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fcf:	89 10                	mov    %edx,(%eax)
    3fd1:	eb 0a                	jmp    3fdd <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    3fd3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fd6:	8b 10                	mov    (%eax),%edx
    3fd8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fdb:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    3fdd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fe0:	8b 40 04             	mov    0x4(%eax),%eax
    3fe3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    3fea:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fed:	01 d0                	add    %edx,%eax
    3fef:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3ff2:	75 20                	jne    4014 <free+0xcf>
    p->s.size += bp->s.size;
    3ff4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3ff7:	8b 50 04             	mov    0x4(%eax),%edx
    3ffa:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3ffd:	8b 40 04             	mov    0x4(%eax),%eax
    4000:	01 c2                	add    %eax,%edx
    4002:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4005:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    4008:	8b 45 f8             	mov    -0x8(%ebp),%eax
    400b:	8b 10                	mov    (%eax),%edx
    400d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4010:	89 10                	mov    %edx,(%eax)
    4012:	eb 08                	jmp    401c <free+0xd7>
  } else
    p->s.ptr = bp;
    4014:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4017:	8b 55 f8             	mov    -0x8(%ebp),%edx
    401a:	89 10                	mov    %edx,(%eax)
  freep = p;
    401c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    401f:	a3 54 ef 00 00       	mov    %eax,0xef54
}
    4024:	c9                   	leave  
    4025:	c3                   	ret    

00004026 <morecore>:

static Header*
morecore(uint nu)
{
    4026:	55                   	push   %ebp
    4027:	89 e5                	mov    %esp,%ebp
    4029:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    402c:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    4033:	77 07                	ja     403c <morecore+0x16>
    nu = 4096;
    4035:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    403c:	8b 45 08             	mov    0x8(%ebp),%eax
    403f:	c1 e0 03             	shl    $0x3,%eax
    4042:	83 ec 0c             	sub    $0xc,%esp
    4045:	50                   	push   %eax
    4046:	e8 15 fc ff ff       	call   3c60 <sbrk>
    404b:	83 c4 10             	add    $0x10,%esp
    404e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    4051:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4055:	75 07                	jne    405e <morecore+0x38>
    return 0;
    4057:	b8 00 00 00 00       	mov    $0x0,%eax
    405c:	eb 26                	jmp    4084 <morecore+0x5e>
  hp = (Header*)p;
    405e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4061:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    4064:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4067:	8b 55 08             	mov    0x8(%ebp),%edx
    406a:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    406d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4070:	83 c0 08             	add    $0x8,%eax
    4073:	83 ec 0c             	sub    $0xc,%esp
    4076:	50                   	push   %eax
    4077:	e8 c9 fe ff ff       	call   3f45 <free>
    407c:	83 c4 10             	add    $0x10,%esp
  return freep;
    407f:	a1 54 ef 00 00       	mov    0xef54,%eax
}
    4084:	c9                   	leave  
    4085:	c3                   	ret    

00004086 <malloc>:

void*
malloc(uint nbytes)
{
    4086:	55                   	push   %ebp
    4087:	89 e5                	mov    %esp,%ebp
    4089:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    408c:	8b 45 08             	mov    0x8(%ebp),%eax
    408f:	83 c0 07             	add    $0x7,%eax
    4092:	c1 e8 03             	shr    $0x3,%eax
    4095:	83 c0 01             	add    $0x1,%eax
    4098:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    409b:	a1 54 ef 00 00       	mov    0xef54,%eax
    40a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    40a3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    40a7:	75 23                	jne    40cc <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    40a9:	c7 45 f0 4c ef 00 00 	movl   $0xef4c,-0x10(%ebp)
    40b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    40b3:	a3 54 ef 00 00       	mov    %eax,0xef54
    40b8:	a1 54 ef 00 00       	mov    0xef54,%eax
    40bd:	a3 4c ef 00 00       	mov    %eax,0xef4c
    base.s.size = 0;
    40c2:	c7 05 50 ef 00 00 00 	movl   $0x0,0xef50
    40c9:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    40cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    40cf:	8b 00                	mov    (%eax),%eax
    40d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    40d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40d7:	8b 40 04             	mov    0x4(%eax),%eax
    40da:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    40dd:	72 4d                	jb     412c <malloc+0xa6>
      if(p->s.size == nunits)
    40df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40e2:	8b 40 04             	mov    0x4(%eax),%eax
    40e5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    40e8:	75 0c                	jne    40f6 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    40ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40ed:	8b 10                	mov    (%eax),%edx
    40ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
    40f2:	89 10                	mov    %edx,(%eax)
    40f4:	eb 26                	jmp    411c <malloc+0x96>
      else {
        p->s.size -= nunits;
    40f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40f9:	8b 40 04             	mov    0x4(%eax),%eax
    40fc:	2b 45 ec             	sub    -0x14(%ebp),%eax
    40ff:	89 c2                	mov    %eax,%edx
    4101:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4104:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    4107:	8b 45 f4             	mov    -0xc(%ebp),%eax
    410a:	8b 40 04             	mov    0x4(%eax),%eax
    410d:	c1 e0 03             	shl    $0x3,%eax
    4110:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    4113:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4116:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4119:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    411c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    411f:	a3 54 ef 00 00       	mov    %eax,0xef54
      return (void*)(p + 1);
    4124:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4127:	83 c0 08             	add    $0x8,%eax
    412a:	eb 3b                	jmp    4167 <malloc+0xe1>
    }
    if(p == freep)
    412c:	a1 54 ef 00 00       	mov    0xef54,%eax
    4131:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    4134:	75 1e                	jne    4154 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
    4136:	83 ec 0c             	sub    $0xc,%esp
    4139:	ff 75 ec             	pushl  -0x14(%ebp)
    413c:	e8 e5 fe ff ff       	call   4026 <morecore>
    4141:	83 c4 10             	add    $0x10,%esp
    4144:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4147:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    414b:	75 07                	jne    4154 <malloc+0xce>
        return 0;
    414d:	b8 00 00 00 00       	mov    $0x0,%eax
    4152:	eb 13                	jmp    4167 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4154:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4157:	89 45 f0             	mov    %eax,-0x10(%ebp)
    415a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    415d:	8b 00                	mov    (%eax),%eax
    415f:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    4162:	e9 6d ff ff ff       	jmp    40d4 <malloc+0x4e>
}
    4167:	c9                   	leave  
    4168:	c3                   	ret    

00004169 <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    4169:	55                   	push   %ebp
    416a:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    416c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    4170:	79 07                	jns    4179 <abs+0x10>
		return x * -1;
    4172:	8b 45 08             	mov    0x8(%ebp),%eax
    4175:	f7 d8                	neg    %eax
    4177:	eb 03                	jmp    417c <abs+0x13>
	else
		return x;
    4179:	8b 45 08             	mov    0x8(%ebp),%eax
}
    417c:	5d                   	pop    %ebp
    417d:	c3                   	ret    

0000417e <sin>:
double sin(double x)  
{  
    417e:	55                   	push   %ebp
    417f:	89 e5                	mov    %esp,%ebp
    4181:	83 ec 40             	sub    $0x40,%esp
    4184:	8b 45 08             	mov    0x8(%ebp),%eax
    4187:	89 45 c8             	mov    %eax,-0x38(%ebp)
    418a:	8b 45 0c             	mov    0xc(%ebp),%eax
    418d:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    4190:	dd 45 c8             	fldl   -0x38(%ebp)
    4193:	dd 5d f8             	fstpl  -0x8(%ebp)
    4196:	d9 e8                	fld1   
    4198:	dd 5d f0             	fstpl  -0x10(%ebp)
    419b:	dd 45 c8             	fldl   -0x38(%ebp)
    419e:	dd 5d e8             	fstpl  -0x18(%ebp)
    41a1:	dd 45 c8             	fldl   -0x38(%ebp)
    41a4:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    41a7:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    41ae:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    41b5:	eb 50                	jmp    4207 <sin+0x89>
	{  
		n = n+1;  
    41b7:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    41bb:	db 45 dc             	fildl  -0x24(%ebp)
    41be:	dc 4d f0             	fmull  -0x10(%ebp)
    41c1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    41c4:	83 c0 01             	add    $0x1,%eax
    41c7:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    41ca:	db 45 c4             	fildl  -0x3c(%ebp)
    41cd:	de c9                	fmulp  %st,%st(1)
    41cf:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    41d2:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    41d6:	dd 45 c8             	fldl   -0x38(%ebp)
    41d9:	dc 4d c8             	fmull  -0x38(%ebp)
    41dc:	dd 45 e8             	fldl   -0x18(%ebp)
    41df:	de c9                	fmulp  %st,%st(1)
    41e1:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    41e4:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    41e7:	dd 45 e8             	fldl   -0x18(%ebp)
    41ea:	dc 75 f0             	fdivl  -0x10(%ebp)
    41ed:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    41f0:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    41f4:	7e 08                	jle    41fe <sin+0x80>
    41f6:	dd 45 f8             	fldl   -0x8(%ebp)
    41f9:	dc 45 e0             	faddl  -0x20(%ebp)
    41fc:	eb 06                	jmp    4204 <sin+0x86>
    41fe:	dd 45 f8             	fldl   -0x8(%ebp)
    4201:	dc 65 e0             	fsubl  -0x20(%ebp)
    4204:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    4207:	dd 45 e0             	fldl   -0x20(%ebp)
    420a:	dd 05 a0 aa 00 00    	fldl   0xaaa0
    4210:	d9 c9                	fxch   %st(1)
    4212:	df e9                	fucomip %st(1),%st
    4214:	dd d8                	fstp   %st(0)
    4216:	77 9f                	ja     41b7 <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    4218:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    421b:	c9                   	leave  
    421c:	c3                   	ret    

0000421d <cos>:
double cos(double x)  
{  
    421d:	55                   	push   %ebp
    421e:	89 e5                	mov    %esp,%ebp
    4220:	83 ec 08             	sub    $0x8,%esp
    4223:	8b 45 08             	mov    0x8(%ebp),%eax
    4226:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4229:	8b 45 0c             	mov    0xc(%ebp),%eax
    422c:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    422f:	dd 05 a8 aa 00 00    	fldl   0xaaa8
    4235:	dc 65 f8             	fsubl  -0x8(%ebp)
    4238:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    423c:	dd 1c 24             	fstpl  (%esp)
    423f:	e8 3a ff ff ff       	call   417e <sin>
    4244:	83 c4 08             	add    $0x8,%esp
}  
    4247:	c9                   	leave  
    4248:	c3                   	ret    

00004249 <tan>:
double tan(double x)  
{  
    4249:	55                   	push   %ebp
    424a:	89 e5                	mov    %esp,%ebp
    424c:	83 ec 10             	sub    $0x10,%esp
    424f:	8b 45 08             	mov    0x8(%ebp),%eax
    4252:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4255:	8b 45 0c             	mov    0xc(%ebp),%eax
    4258:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    425b:	ff 75 fc             	pushl  -0x4(%ebp)
    425e:	ff 75 f8             	pushl  -0x8(%ebp)
    4261:	e8 18 ff ff ff       	call   417e <sin>
    4266:	83 c4 08             	add    $0x8,%esp
    4269:	dd 5d f0             	fstpl  -0x10(%ebp)
    426c:	ff 75 fc             	pushl  -0x4(%ebp)
    426f:	ff 75 f8             	pushl  -0x8(%ebp)
    4272:	e8 a6 ff ff ff       	call   421d <cos>
    4277:	83 c4 08             	add    $0x8,%esp
    427a:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    427d:	c9                   	leave  
    427e:	c3                   	ret    

0000427f <pow>:

double pow(double x, double y)
{
    427f:	55                   	push   %ebp
    4280:	89 e5                	mov    %esp,%ebp
    4282:	83 ec 38             	sub    $0x38,%esp
    4285:	8b 45 08             	mov    0x8(%ebp),%eax
    4288:	89 45 e0             	mov    %eax,-0x20(%ebp)
    428b:	8b 45 0c             	mov    0xc(%ebp),%eax
    428e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4291:	8b 45 10             	mov    0x10(%ebp),%eax
    4294:	89 45 d8             	mov    %eax,-0x28(%ebp)
    4297:	8b 45 14             	mov    0x14(%ebp),%eax
    429a:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    429d:	dd 45 e0             	fldl   -0x20(%ebp)
    42a0:	d9 ee                	fldz   
    42a2:	df e9                	fucomip %st(1),%st
    42a4:	dd d8                	fstp   %st(0)
    42a6:	7a 28                	jp     42d0 <pow+0x51>
    42a8:	dd 45 e0             	fldl   -0x20(%ebp)
    42ab:	d9 ee                	fldz   
    42ad:	df e9                	fucomip %st(1),%st
    42af:	dd d8                	fstp   %st(0)
    42b1:	75 1d                	jne    42d0 <pow+0x51>
    42b3:	dd 45 d8             	fldl   -0x28(%ebp)
    42b6:	d9 ee                	fldz   
    42b8:	df e9                	fucomip %st(1),%st
    42ba:	dd d8                	fstp   %st(0)
    42bc:	7a 0b                	jp     42c9 <pow+0x4a>
    42be:	dd 45 d8             	fldl   -0x28(%ebp)
    42c1:	d9 ee                	fldz   
    42c3:	df e9                	fucomip %st(1),%st
    42c5:	dd d8                	fstp   %st(0)
    42c7:	74 07                	je     42d0 <pow+0x51>
    42c9:	d9 ee                	fldz   
    42cb:	e9 3a 01 00 00       	jmp    440a <pow+0x18b>
	else if(x==0 && y==0) return 1;
    42d0:	dd 45 e0             	fldl   -0x20(%ebp)
    42d3:	d9 ee                	fldz   
    42d5:	df e9                	fucomip %st(1),%st
    42d7:	dd d8                	fstp   %st(0)
    42d9:	7a 28                	jp     4303 <pow+0x84>
    42db:	dd 45 e0             	fldl   -0x20(%ebp)
    42de:	d9 ee                	fldz   
    42e0:	df e9                	fucomip %st(1),%st
    42e2:	dd d8                	fstp   %st(0)
    42e4:	75 1d                	jne    4303 <pow+0x84>
    42e6:	dd 45 d8             	fldl   -0x28(%ebp)
    42e9:	d9 ee                	fldz   
    42eb:	df e9                	fucomip %st(1),%st
    42ed:	dd d8                	fstp   %st(0)
    42ef:	7a 12                	jp     4303 <pow+0x84>
    42f1:	dd 45 d8             	fldl   -0x28(%ebp)
    42f4:	d9 ee                	fldz   
    42f6:	df e9                	fucomip %st(1),%st
    42f8:	dd d8                	fstp   %st(0)
    42fa:	75 07                	jne    4303 <pow+0x84>
    42fc:	d9 e8                	fld1   
    42fe:	e9 07 01 00 00       	jmp    440a <pow+0x18b>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    4303:	d9 ee                	fldz   
    4305:	dd 45 d8             	fldl   -0x28(%ebp)
    4308:	d9 c9                	fxch   %st(1)
    430a:	df e9                	fucomip %st(1),%st
    430c:	dd d8                	fstp   %st(0)
    430e:	76 23                	jbe    4333 <pow+0xb4>
    4310:	dd 45 d8             	fldl   -0x28(%ebp)
    4313:	d9 e0                	fchs   
    4315:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4319:	dd 1c 24             	fstpl  (%esp)
    431c:	ff 75 e4             	pushl  -0x1c(%ebp)
    431f:	ff 75 e0             	pushl  -0x20(%ebp)
    4322:	e8 58 ff ff ff       	call   427f <pow>
    4327:	83 c4 10             	add    $0x10,%esp
    432a:	d9 e8                	fld1   
    432c:	de f1                	fdivp  %st,%st(1)
    432e:	e9 d7 00 00 00       	jmp    440a <pow+0x18b>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    4333:	d9 ee                	fldz   
    4335:	dd 45 e0             	fldl   -0x20(%ebp)
    4338:	d9 c9                	fxch   %st(1)
    433a:	df e9                	fucomip %st(1),%st
    433c:	dd d8                	fstp   %st(0)
    433e:	76 3a                	jbe    437a <pow+0xfb>
    4340:	dd 45 d8             	fldl   -0x28(%ebp)
    4343:	d9 7d d6             	fnstcw -0x2a(%ebp)
    4346:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    434a:	b4 0c                	mov    $0xc,%ah
    434c:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    4350:	d9 6d d4             	fldcw  -0x2c(%ebp)
    4353:	db 5d cc             	fistpl -0x34(%ebp)
    4356:	d9 6d d6             	fldcw  -0x2a(%ebp)
    4359:	db 45 cc             	fildl  -0x34(%ebp)
    435c:	dd 45 d8             	fldl   -0x28(%ebp)
    435f:	de e1                	fsubp  %st,%st(1)
    4361:	d9 ee                	fldz   
    4363:	df e9                	fucomip %st(1),%st
    4365:	7a 0a                	jp     4371 <pow+0xf2>
    4367:	d9 ee                	fldz   
    4369:	df e9                	fucomip %st(1),%st
    436b:	dd d8                	fstp   %st(0)
    436d:	74 0b                	je     437a <pow+0xfb>
    436f:	eb 02                	jmp    4373 <pow+0xf4>
    4371:	dd d8                	fstp   %st(0)
    4373:	d9 ee                	fldz   
    4375:	e9 90 00 00 00       	jmp    440a <pow+0x18b>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    437a:	d9 ee                	fldz   
    437c:	dd 45 e0             	fldl   -0x20(%ebp)
    437f:	d9 c9                	fxch   %st(1)
    4381:	df e9                	fucomip %st(1),%st
    4383:	dd d8                	fstp   %st(0)
    4385:	76 5d                	jbe    43e4 <pow+0x165>
    4387:	dd 45 d8             	fldl   -0x28(%ebp)
    438a:	d9 7d d6             	fnstcw -0x2a(%ebp)
    438d:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    4391:	b4 0c                	mov    $0xc,%ah
    4393:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    4397:	d9 6d d4             	fldcw  -0x2c(%ebp)
    439a:	db 5d cc             	fistpl -0x34(%ebp)
    439d:	d9 6d d6             	fldcw  -0x2a(%ebp)
    43a0:	db 45 cc             	fildl  -0x34(%ebp)
    43a3:	dd 45 d8             	fldl   -0x28(%ebp)
    43a6:	de e1                	fsubp  %st,%st(1)
    43a8:	d9 ee                	fldz   
    43aa:	df e9                	fucomip %st(1),%st
    43ac:	7a 34                	jp     43e2 <pow+0x163>
    43ae:	d9 ee                	fldz   
    43b0:	df e9                	fucomip %st(1),%st
    43b2:	dd d8                	fstp   %st(0)
    43b4:	75 2e                	jne    43e4 <pow+0x165>
	{
		double powint=1;
    43b6:	d9 e8                	fld1   
    43b8:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    43bb:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    43c2:	eb 0d                	jmp    43d1 <pow+0x152>
    43c4:	dd 45 f0             	fldl   -0x10(%ebp)
    43c7:	dc 4d e0             	fmull  -0x20(%ebp)
    43ca:	dd 5d f0             	fstpl  -0x10(%ebp)
    43cd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    43d1:	db 45 ec             	fildl  -0x14(%ebp)
    43d4:	dd 45 d8             	fldl   -0x28(%ebp)
    43d7:	df e9                	fucomip %st(1),%st
    43d9:	dd d8                	fstp   %st(0)
    43db:	73 e7                	jae    43c4 <pow+0x145>
		return powint;
    43dd:	dd 45 f0             	fldl   -0x10(%ebp)
    43e0:	eb 28                	jmp    440a <pow+0x18b>
    43e2:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    43e4:	83 ec 08             	sub    $0x8,%esp
    43e7:	ff 75 e4             	pushl  -0x1c(%ebp)
    43ea:	ff 75 e0             	pushl  -0x20(%ebp)
    43ed:	e8 49 00 00 00       	call   443b <ln>
    43f2:	83 c4 10             	add    $0x10,%esp
    43f5:	dc 4d d8             	fmull  -0x28(%ebp)
    43f8:	83 ec 08             	sub    $0x8,%esp
    43fb:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    43ff:	dd 1c 24             	fstpl  (%esp)
    4402:	e8 2a 02 00 00       	call   4631 <exp>
    4407:	83 c4 10             	add    $0x10,%esp
}
    440a:	c9                   	leave  
    440b:	c3                   	ret    

0000440c <sqrt>:
// 求根
double sqrt(double x)
{
    440c:	55                   	push   %ebp
    440d:	89 e5                	mov    %esp,%ebp
    440f:	83 ec 18             	sub    $0x18,%esp
    4412:	8b 45 08             	mov    0x8(%ebp),%eax
    4415:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4418:	8b 45 0c             	mov    0xc(%ebp),%eax
    441b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    441e:	dd 05 b0 aa 00 00    	fldl   0xaab0
    4424:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4428:	dd 1c 24             	fstpl  (%esp)
    442b:	ff 75 f4             	pushl  -0xc(%ebp)
    442e:	ff 75 f0             	pushl  -0x10(%ebp)
    4431:	e8 49 fe ff ff       	call   427f <pow>
    4436:	83 c4 10             	add    $0x10,%esp
}
    4439:	c9                   	leave  
    443a:	c3                   	ret    

0000443b <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    443b:	55                   	push   %ebp
    443c:	89 e5                	mov    %esp,%ebp
    443e:	83 ec 78             	sub    $0x78,%esp
    4441:	8b 45 08             	mov    0x8(%ebp),%eax
    4444:	89 45 90             	mov    %eax,-0x70(%ebp)
    4447:	8b 45 0c             	mov    0xc(%ebp),%eax
    444a:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    444d:	dd 45 90             	fldl   -0x70(%ebp)
    4450:	d9 e8                	fld1   
    4452:	de e9                	fsubrp %st,%st(1)
    4454:	dd 5d c0             	fstpl  -0x40(%ebp)
    4457:	d9 ee                	fldz   
    4459:	dd 5d f0             	fstpl  -0x10(%ebp)
    445c:	d9 ee                	fldz   
    445e:	dd 5d b8             	fstpl  -0x48(%ebp)
    4461:	d9 ee                	fldz   
    4463:	dd 5d b0             	fstpl  -0x50(%ebp)
    4466:	d9 ee                	fldz   
    4468:	dd 5d e8             	fstpl  -0x18(%ebp)
    446b:	d9 e8                	fld1   
    446d:	dd 5d e0             	fstpl  -0x20(%ebp)
    4470:	d9 e8                	fld1   
    4472:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    4475:	dd 45 90             	fldl   -0x70(%ebp)
    4478:	d9 e8                	fld1   
    447a:	df e9                	fucomip %st(1),%st
    447c:	dd d8                	fstp   %st(0)
    447e:	7a 12                	jp     4492 <ln+0x57>
    4480:	dd 45 90             	fldl   -0x70(%ebp)
    4483:	d9 e8                	fld1   
    4485:	df e9                	fucomip %st(1),%st
    4487:	dd d8                	fstp   %st(0)
    4489:	75 07                	jne    4492 <ln+0x57>
    448b:	d9 ee                	fldz   
    448d:	e9 9d 01 00 00       	jmp    462f <ln+0x1f4>
	else if(x>2) return -ln(1/x);
    4492:	dd 45 90             	fldl   -0x70(%ebp)
    4495:	dd 05 b8 aa 00 00    	fldl   0xaab8
    449b:	d9 c9                	fxch   %st(1)
    449d:	df e9                	fucomip %st(1),%st
    449f:	dd d8                	fstp   %st(0)
    44a1:	76 1e                	jbe    44c1 <ln+0x86>
    44a3:	d9 e8                	fld1   
    44a5:	dc 75 90             	fdivl  -0x70(%ebp)
    44a8:	83 ec 08             	sub    $0x8,%esp
    44ab:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    44af:	dd 1c 24             	fstpl  (%esp)
    44b2:	e8 84 ff ff ff       	call   443b <ln>
    44b7:	83 c4 10             	add    $0x10,%esp
    44ba:	d9 e0                	fchs   
    44bc:	e9 6e 01 00 00       	jmp    462f <ln+0x1f4>
	else if(x<.1)
    44c1:	dd 05 c0 aa 00 00    	fldl   0xaac0
    44c7:	dd 45 90             	fldl   -0x70(%ebp)
    44ca:	d9 c9                	fxch   %st(1)
    44cc:	df e9                	fucomip %st(1),%st
    44ce:	dd d8                	fstp   %st(0)
    44d0:	76 65                	jbe    4537 <ln+0xfc>
	{
		double n=-1;
    44d2:	d9 e8                	fld1   
    44d4:	d9 e0                	fchs   
    44d6:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    44d9:	dd 45 c8             	fldl   -0x38(%ebp)
    44dc:	dd 05 c8 aa 00 00    	fldl   0xaac8
    44e2:	de e9                	fsubrp %st,%st(1)
    44e4:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    44e7:	83 ec 08             	sub    $0x8,%esp
    44ea:	ff 75 cc             	pushl  -0x34(%ebp)
    44ed:	ff 75 c8             	pushl  -0x38(%ebp)
    44f0:	e8 3c 01 00 00       	call   4631 <exp>
    44f5:	83 c4 10             	add    $0x10,%esp
    44f8:	dd 45 90             	fldl   -0x70(%ebp)
    44fb:	de f1                	fdivp  %st,%st(1)
    44fd:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    4500:	dd 45 a0             	fldl   -0x60(%ebp)
    4503:	dd 05 b8 aa 00 00    	fldl   0xaab8
    4509:	d9 c9                	fxch   %st(1)
    450b:	df e9                	fucomip %st(1),%st
    450d:	dd d8                	fstp   %st(0)
    450f:	77 c8                	ja     44d9 <ln+0x9e>
    4511:	d9 e8                	fld1   
    4513:	dd 45 a0             	fldl   -0x60(%ebp)
    4516:	d9 c9                	fxch   %st(1)
    4518:	df e9                	fucomip %st(1),%st
    451a:	dd d8                	fstp   %st(0)
    451c:	77 bb                	ja     44d9 <ln+0x9e>
		return ln(a)+n;
    451e:	83 ec 08             	sub    $0x8,%esp
    4521:	ff 75 a4             	pushl  -0x5c(%ebp)
    4524:	ff 75 a0             	pushl  -0x60(%ebp)
    4527:	e8 0f ff ff ff       	call   443b <ln>
    452c:	83 c4 10             	add    $0x10,%esp
    452f:	dc 45 c8             	faddl  -0x38(%ebp)
    4532:	e9 f8 00 00 00       	jmp    462f <ln+0x1f4>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    4537:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    453e:	d9 e8                	fld1   
    4540:	dd 5d d8             	fstpl  -0x28(%ebp)
    4543:	e9 b6 00 00 00       	jmp    45fe <ln+0x1c3>
	{
		ln_tmp=ln_px;
    4548:	dd 45 e8             	fldl   -0x18(%ebp)
    454b:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    454e:	dd 45 d8             	fldl   -0x28(%ebp)
    4551:	dc 4d c0             	fmull  -0x40(%ebp)
    4554:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    4557:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    455b:	75 0d                	jne    456a <ln+0x12f>
    455d:	db 45 d4             	fildl  -0x2c(%ebp)
    4560:	dd 45 d8             	fldl   -0x28(%ebp)
    4563:	de f1                	fdivp  %st,%st(1)
    4565:	dd 5d d8             	fstpl  -0x28(%ebp)
    4568:	eb 13                	jmp    457d <ln+0x142>
		else tmp=tmp/-l;
    456a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    456d:	f7 d8                	neg    %eax
    456f:	89 45 8c             	mov    %eax,-0x74(%ebp)
    4572:	db 45 8c             	fildl  -0x74(%ebp)
    4575:	dd 45 d8             	fldl   -0x28(%ebp)
    4578:	de f1                	fdivp  %st,%st(1)
    457a:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    457d:	dd 45 f0             	fldl   -0x10(%ebp)
    4580:	dc 45 d8             	faddl  -0x28(%ebp)
    4583:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    4586:	dd 45 d8             	fldl   -0x28(%ebp)
    4589:	d9 e0                	fchs   
    458b:	dc 4d c0             	fmull  -0x40(%ebp)
    458e:	db 45 d4             	fildl  -0x2c(%ebp)
    4591:	de c9                	fmulp  %st,%st(1)
    4593:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4596:	83 c0 01             	add    $0x1,%eax
    4599:	89 45 8c             	mov    %eax,-0x74(%ebp)
    459c:	db 45 8c             	fildl  -0x74(%ebp)
    459f:	de f9                	fdivrp %st,%st(1)
    45a1:	dc 45 f0             	faddl  -0x10(%ebp)
    45a4:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    45a7:	dd 45 d8             	fldl   -0x28(%ebp)
    45aa:	dc 4d c0             	fmull  -0x40(%ebp)
    45ad:	dc 4d c0             	fmull  -0x40(%ebp)
    45b0:	db 45 d4             	fildl  -0x2c(%ebp)
    45b3:	de c9                	fmulp  %st,%st(1)
    45b5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    45b8:	83 c0 02             	add    $0x2,%eax
    45bb:	89 45 8c             	mov    %eax,-0x74(%ebp)
    45be:	db 45 8c             	fildl  -0x74(%ebp)
    45c1:	de f9                	fdivrp %st,%st(1)
    45c3:	dc 45 b8             	faddl  -0x48(%ebp)
    45c6:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    45c9:	dd 45 b0             	fldl   -0x50(%ebp)
    45cc:	dc 65 b8             	fsubl  -0x48(%ebp)
    45cf:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    45d2:	dd 45 a8             	fldl   -0x58(%ebp)
    45d5:	dc 4d a8             	fmull  -0x58(%ebp)
    45d8:	dd 45 b8             	fldl   -0x48(%ebp)
    45db:	d8 c0                	fadd   %st(0),%st
    45dd:	dd 45 b0             	fldl   -0x50(%ebp)
    45e0:	de e1                	fsubp  %st,%st(1)
    45e2:	dc 45 f0             	faddl  -0x10(%ebp)
    45e5:	de f9                	fdivrp %st,%st(1)
    45e7:	dd 45 b0             	fldl   -0x50(%ebp)
    45ea:	de e1                	fsubp  %st,%st(1)
    45ec:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    45ef:	db 45 d4             	fildl  -0x2c(%ebp)
    45f2:	dd 45 d8             	fldl   -0x28(%ebp)
    45f5:	de c9                	fmulp  %st,%st(1)
    45f7:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    45fa:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    45fe:	dd 45 e8             	fldl   -0x18(%ebp)
    4601:	dc 65 e0             	fsubl  -0x20(%ebp)
    4604:	dd 05 d0 aa 00 00    	fldl   0xaad0
    460a:	d9 c9                	fxch   %st(1)
    460c:	df e9                	fucomip %st(1),%st
    460e:	dd d8                	fstp   %st(0)
    4610:	0f 87 32 ff ff ff    	ja     4548 <ln+0x10d>
    4616:	dd 45 e8             	fldl   -0x18(%ebp)
    4619:	dc 65 e0             	fsubl  -0x20(%ebp)
    461c:	dd 05 d8 aa 00 00    	fldl   0xaad8
    4622:	df e9                	fucomip %st(1),%st
    4624:	dd d8                	fstp   %st(0)
    4626:	0f 87 1c ff ff ff    	ja     4548 <ln+0x10d>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    462c:	dd 45 e8             	fldl   -0x18(%ebp)
}
    462f:	c9                   	leave  
    4630:	c3                   	ret    

00004631 <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    4631:	55                   	push   %ebp
    4632:	89 e5                	mov    %esp,%ebp
    4634:	83 ec 68             	sub    $0x68,%esp
    4637:	8b 45 08             	mov    0x8(%ebp),%eax
    463a:	89 45 a0             	mov    %eax,-0x60(%ebp)
    463d:	8b 45 0c             	mov    0xc(%ebp),%eax
    4640:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    4643:	dd 45 a0             	fldl   -0x60(%ebp)
    4646:	dd 5d c0             	fstpl  -0x40(%ebp)
    4649:	d9 ee                	fldz   
    464b:	dd 5d f0             	fstpl  -0x10(%ebp)
    464e:	d9 ee                	fldz   
    4650:	dd 5d b8             	fstpl  -0x48(%ebp)
    4653:	d9 ee                	fldz   
    4655:	dd 5d b0             	fstpl  -0x50(%ebp)
    4658:	d9 ee                	fldz   
    465a:	dd 5d e8             	fstpl  -0x18(%ebp)
    465d:	d9 e8                	fld1   
    465f:	dd 5d e0             	fstpl  -0x20(%ebp)
    4662:	d9 e8                	fld1   
    4664:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    4667:	dd 45 a0             	fldl   -0x60(%ebp)
    466a:	d9 ee                	fldz   
    466c:	df e9                	fucomip %st(1),%st
    466e:	dd d8                	fstp   %st(0)
    4670:	7a 12                	jp     4684 <exp+0x53>
    4672:	dd 45 a0             	fldl   -0x60(%ebp)
    4675:	d9 ee                	fldz   
    4677:	df e9                	fucomip %st(1),%st
    4679:	dd d8                	fstp   %st(0)
    467b:	75 07                	jne    4684 <exp+0x53>
    467d:	d9 e8                	fld1   
    467f:	e9 12 01 00 00       	jmp    4796 <exp+0x165>
	if(x<0) return 1/exp(-x); 
    4684:	d9 ee                	fldz   
    4686:	dd 45 a0             	fldl   -0x60(%ebp)
    4689:	d9 c9                	fxch   %st(1)
    468b:	df e9                	fucomip %st(1),%st
    468d:	dd d8                	fstp   %st(0)
    468f:	76 20                	jbe    46b1 <exp+0x80>
    4691:	dd 45 a0             	fldl   -0x60(%ebp)
    4694:	d9 e0                	fchs   
    4696:	83 ec 08             	sub    $0x8,%esp
    4699:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    469d:	dd 1c 24             	fstpl  (%esp)
    46a0:	e8 8c ff ff ff       	call   4631 <exp>
    46a5:	83 c4 10             	add    $0x10,%esp
    46a8:	d9 e8                	fld1   
    46aa:	de f1                	fdivp  %st,%st(1)
    46ac:	e9 e5 00 00 00       	jmp    4796 <exp+0x165>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    46b1:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    46b8:	d9 e8                	fld1   
    46ba:	dd 5d d0             	fstpl  -0x30(%ebp)
    46bd:	e9 92 00 00 00       	jmp    4754 <exp+0x123>
	{
		ex_tmp=ex_px;
    46c2:	dd 45 e8             	fldl   -0x18(%ebp)
    46c5:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    46c8:	dd 45 d0             	fldl   -0x30(%ebp)
    46cb:	dc 4d c0             	fmull  -0x40(%ebp)
    46ce:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    46d1:	db 45 cc             	fildl  -0x34(%ebp)
    46d4:	dd 45 d0             	fldl   -0x30(%ebp)
    46d7:	de f1                	fdivp  %st,%st(1)
    46d9:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    46dc:	dd 45 f0             	fldl   -0x10(%ebp)
    46df:	dc 45 d0             	faddl  -0x30(%ebp)
    46e2:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    46e5:	dd 45 d0             	fldl   -0x30(%ebp)
    46e8:	dc 4d c0             	fmull  -0x40(%ebp)
    46eb:	8b 45 cc             	mov    -0x34(%ebp),%eax
    46ee:	83 c0 01             	add    $0x1,%eax
    46f1:	89 45 9c             	mov    %eax,-0x64(%ebp)
    46f4:	db 45 9c             	fildl  -0x64(%ebp)
    46f7:	de f9                	fdivrp %st,%st(1)
    46f9:	dc 45 f0             	faddl  -0x10(%ebp)
    46fc:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    46ff:	dd 45 d0             	fldl   -0x30(%ebp)
    4702:	dc 4d c0             	fmull  -0x40(%ebp)
    4705:	dc 4d c0             	fmull  -0x40(%ebp)
    4708:	8b 45 cc             	mov    -0x34(%ebp),%eax
    470b:	83 c0 01             	add    $0x1,%eax
    470e:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4711:	db 45 9c             	fildl  -0x64(%ebp)
    4714:	de f9                	fdivrp %st,%st(1)
    4716:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4719:	83 c0 02             	add    $0x2,%eax
    471c:	89 45 9c             	mov    %eax,-0x64(%ebp)
    471f:	db 45 9c             	fildl  -0x64(%ebp)
    4722:	de f9                	fdivrp %st,%st(1)
    4724:	dc 45 b8             	faddl  -0x48(%ebp)
    4727:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    472a:	dd 45 b0             	fldl   -0x50(%ebp)
    472d:	dc 65 b8             	fsubl  -0x48(%ebp)
    4730:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    4733:	dd 45 d8             	fldl   -0x28(%ebp)
    4736:	dc 4d d8             	fmull  -0x28(%ebp)
    4739:	dd 45 b8             	fldl   -0x48(%ebp)
    473c:	d8 c0                	fadd   %st(0),%st
    473e:	dd 45 b0             	fldl   -0x50(%ebp)
    4741:	de e1                	fsubp  %st,%st(1)
    4743:	dc 45 f0             	faddl  -0x10(%ebp)
    4746:	de f9                	fdivrp %st,%st(1)
    4748:	dd 45 b0             	fldl   -0x50(%ebp)
    474b:	de e1                	fsubp  %st,%st(1)
    474d:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    4750:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    4754:	dd 45 e8             	fldl   -0x18(%ebp)
    4757:	dc 65 e0             	fsubl  -0x20(%ebp)
    475a:	dd 05 e0 aa 00 00    	fldl   0xaae0
    4760:	d9 c9                	fxch   %st(1)
    4762:	df e9                	fucomip %st(1),%st
    4764:	dd d8                	fstp   %st(0)
    4766:	77 12                	ja     477a <exp+0x149>
    4768:	dd 45 e8             	fldl   -0x18(%ebp)
    476b:	dc 65 e0             	fsubl  -0x20(%ebp)
    476e:	dd 05 e8 aa 00 00    	fldl   0xaae8
    4774:	df e9                	fucomip %st(1),%st
    4776:	dd d8                	fstp   %st(0)
    4778:	76 15                	jbe    478f <exp+0x15e>
    477a:	dd 45 d8             	fldl   -0x28(%ebp)
    477d:	dd 05 e0 aa 00 00    	fldl   0xaae0
    4783:	d9 c9                	fxch   %st(1)
    4785:	df e9                	fucomip %st(1),%st
    4787:	dd d8                	fstp   %st(0)
    4789:	0f 87 33 ff ff ff    	ja     46c2 <exp+0x91>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    478f:	dd 45 e8             	fldl   -0x18(%ebp)
    4792:	d9 e8                	fld1   
    4794:	de c1                	faddp  %st,%st(1)
    4796:	c9                   	leave  
    4797:	c3                   	ret    

00004798 <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    4798:	55                   	push   %ebp
    4799:	89 e5                	mov    %esp,%ebp
    479b:	83 ec 68             	sub    $0x68,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    479e:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    47a2:	83 ec 08             	sub    $0x8,%esp
    47a5:	ff 75 08             	pushl  0x8(%ebp)
    47a8:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    47ab:	50                   	push   %eax
    47ac:	e8 f7 f1 ff ff       	call   39a8 <strcpy>
    47b1:	83 c4 10             	add    $0x10,%esp
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    47b4:	83 ec 08             	sub    $0x8,%esp
    47b7:	6a 02                	push   $0x2
    47b9:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    47bc:	50                   	push   %eax
    47bd:	e8 56 f4 ff ff       	call   3c18 <open>
    47c2:	83 c4 10             	add    $0x10,%esp
    47c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    47c8:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    47cc:	75 16                	jne    47e4 <OpenTableFile+0x4c>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    47ce:	83 ec 04             	sub    $0x4,%esp
    47d1:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    47d4:	50                   	push   %eax
    47d5:	68 1c ab 00 00       	push   $0xab1c
    47da:	6a 00                	push   $0x0
    47dc:	e8 d4 f5 ff ff       	call   3db5 <printf>
    47e1:	83 c4 10             	add    $0x10,%esp
    }
    return f;
    47e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    47e7:	c9                   	leave  
    47e8:	c3                   	ret    

000047e9 <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    47e9:	55                   	push   %ebp
    47ea:	89 e5                	mov    %esp,%ebp
    47ec:	57                   	push   %edi
    47ed:	56                   	push   %esi
    47ee:	53                   	push   %ebx
    47ef:	83 ec 1c             	sub    $0x1c,%esp
	layer *info = fr_ps->header;
    47f2:	8b 45 08             	mov    0x8(%ebp),%eax
    47f5:	8b 00                	mov    (%eax),%eax
    47f7:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    47fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    47fd:	8b 78 14             	mov    0x14(%eax),%edi
    4800:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4803:	8b 70 10             	mov    0x10(%eax),%esi
    4806:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4809:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    480c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    480f:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    4812:	85 c0                	test   %eax,%eax
    4814:	0f 94 c0             	sete   %al
    4817:	0f b6 c8             	movzbl %al,%ecx
    481a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    481d:	8b 50 04             	mov    0x4(%eax),%edx
    4820:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4823:	8b 00                	mov    (%eax),%eax
    4825:	57                   	push   %edi
    4826:	56                   	push   %esi
    4827:	53                   	push   %ebx
    4828:	51                   	push   %ecx
    4829:	52                   	push   %edx
    482a:	50                   	push   %eax
    482b:	68 3c ab 00 00       	push   $0xab3c
    4830:	6a 00                	push   $0x0
    4832:	e8 7e f5 ff ff       	call   3db5 <printf>
    4837:	83 c4 20             	add    $0x20,%esp
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    483a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    483d:	8b 78 2c             	mov    0x2c(%eax),%edi
    4840:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4843:	8b 70 28             	mov    0x28(%eax),%esi
    4846:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4849:	8b 58 24             	mov    0x24(%eax),%ebx
    484c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    484f:	8b 48 20             	mov    0x20(%eax),%ecx
    4852:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4855:	8b 50 1c             	mov    0x1c(%eax),%edx
    4858:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    485b:	8b 40 18             	mov    0x18(%eax),%eax
    485e:	57                   	push   %edi
    485f:	56                   	push   %esi
    4860:	53                   	push   %ebx
    4861:	51                   	push   %ecx
    4862:	52                   	push   %edx
    4863:	50                   	push   %eax
    4864:	68 7c ab 00 00       	push   $0xab7c
    4869:	6a 00                	push   $0x0
    486b:	e8 45 f5 ff ff       	call   3db5 <printf>
    4870:	83 c4 20             	add    $0x20,%esp
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    4873:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4876:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4879:	8b 0c 85 e0 ea 00 00 	mov    0xeae0(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    4880:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4883:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4886:	dd 04 c5 c0 ea 00 00 	fldl   0xeac0(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    488d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4890:	8b 40 04             	mov    0x4(%eax),%eax
    4893:	8d 50 ff             	lea    -0x1(%eax),%edx
    4896:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4899:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    489c:	89 d0                	mov    %edx,%eax
    489e:	c1 e0 04             	shl    $0x4,%eax
    48a1:	29 d0                	sub    %edx,%eax
    48a3:	01 d8                	add    %ebx,%eax
    48a5:	8b 14 85 00 ea 00 00 	mov    0xea00(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    48ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    48af:	8b 40 04             	mov    0x4(%eax),%eax
    48b2:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    48b5:	8b 04 85 c0 e9 00 00 	mov    0xe9c0(,%eax,4),%eax
    48bc:	83 ec 04             	sub    $0x4,%esp
    48bf:	51                   	push   %ecx
    48c0:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    48c4:	dd 1c 24             	fstpl  (%esp)
    48c7:	52                   	push   %edx
    48c8:	50                   	push   %eax
    48c9:	68 a4 ab 00 00       	push   $0xaba4
    48ce:	6a 00                	push   $0x0
    48d0:	e8 e0 f4 ff ff       	call   3db5 <printf>
    48d5:	83 c4 20             	add    $0x20,%esp
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    48d8:	8b 45 08             	mov    0x8(%ebp),%eax
    48db:	8b 48 08             	mov    0x8(%eax),%ecx
    48de:	8b 45 08             	mov    0x8(%ebp),%eax
    48e1:	8b 50 0c             	mov    0xc(%eax),%edx
    48e4:	8b 45 08             	mov    0x8(%ebp),%eax
    48e7:	8b 40 10             	mov    0x10(%eax),%eax
    48ea:	83 ec 0c             	sub    $0xc,%esp
    48ed:	51                   	push   %ecx
    48ee:	52                   	push   %edx
    48ef:	50                   	push   %eax
    48f0:	68 d3 ab 00 00       	push   $0xabd3
    48f5:	6a 00                	push   $0x0
    48f7:	e8 b9 f4 ff ff       	call   3db5 <printf>
    48fc:	83 c4 20             	add    $0x20,%esp
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    48ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
    4902:	5b                   	pop    %ebx
    4903:	5e                   	pop    %esi
    4904:	5f                   	pop    %edi
    4905:	5d                   	pop    %ebp
    4906:	c3                   	ret    

00004907 <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    4907:	55                   	push   %ebp
    4908:	89 e5                	mov    %esp,%ebp
    490a:	83 ec 18             	sub    $0x18,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    490d:	83 ec 0c             	sub    $0xc,%esp
    4910:	ff 75 08             	pushl  0x8(%ebp)
    4913:	e8 6e f7 ff ff       	call   4086 <malloc>
    4918:	83 c4 10             	add    $0x10,%esp
    491b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    491e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4922:	74 15                	je     4939 <mem_alloc+0x32>
		memset(ptr, 0, block);
    4924:	83 ec 04             	sub    $0x4,%esp
    4927:	ff 75 08             	pushl  0x8(%ebp)
    492a:	6a 00                	push   $0x0
    492c:	ff 75 f4             	pushl  -0xc(%ebp)
    492f:	e8 0a f1 ff ff       	call   3a3e <memset>
    4934:	83 c4 10             	add    $0x10,%esp
    4937:	eb 1a                	jmp    4953 <mem_alloc+0x4c>
	else{
		printf(0, "Unable to allocate %s\n", item);
    4939:	83 ec 04             	sub    $0x4,%esp
    493c:	ff 75 0c             	pushl  0xc(%ebp)
    493f:	68 ed ab 00 00       	push   $0xabed
    4944:	6a 00                	push   $0x0
    4946:	e8 6a f4 ff ff       	call   3db5 <printf>
    494b:	83 c4 10             	add    $0x10,%esp
		exit();
    494e:	e8 85 f2 ff ff       	call   3bd8 <exit>
	}
	return ptr;
    4953:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4956:	c9                   	leave  
    4957:	c3                   	ret    

00004958 <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    4958:	55                   	push   %ebp
    4959:	89 e5                	mov    %esp,%ebp
    495b:	83 ec 08             	sub    $0x8,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    495e:	8b 45 0c             	mov    0xc(%ebp),%eax
    4961:	83 ec 08             	sub    $0x8,%esp
    4964:	68 04 ac 00 00       	push   $0xac04
    4969:	50                   	push   %eax
    496a:	e8 98 ff ff ff       	call   4907 <mem_alloc>
    496f:	83 c4 10             	add    $0x10,%esp
    4972:	89 c2                	mov    %eax,%edx
    4974:	8b 45 08             	mov    0x8(%ebp),%eax
    4977:	89 50 04             	mov    %edx,0x4(%eax)
	bs->buf_size = size;
    497a:	8b 45 08             	mov    0x8(%ebp),%eax
    497d:	8b 55 0c             	mov    0xc(%ebp),%edx
    4980:	89 50 08             	mov    %edx,0x8(%eax)
}
    4983:	c9                   	leave  
    4984:	c3                   	ret    

00004985 <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    4985:	55                   	push   %ebp
    4986:	89 e5                	mov    %esp,%ebp
    4988:	83 ec 08             	sub    $0x8,%esp
	free(bs->buf);
    498b:	8b 45 08             	mov    0x8(%ebp),%eax
    498e:	8b 40 04             	mov    0x4(%eax),%eax
    4991:	83 ec 0c             	sub    $0xc,%esp
    4994:	50                   	push   %eax
    4995:	e8 ab f5 ff ff       	call   3f45 <free>
    499a:	83 c4 10             	add    $0x10,%esp
}
    499d:	c9                   	leave  
    499e:	c3                   	ret    

0000499f <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    499f:	55                   	push   %ebp
    49a0:	89 e5                	mov    %esp,%ebp
    49a2:	83 ec 08             	sub    $0x8,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    49a5:	83 ec 08             	sub    $0x8,%esp
    49a8:	6a 02                	push   $0x2
    49aa:	ff 75 0c             	pushl  0xc(%ebp)
    49ad:	e8 66 f2 ff ff       	call   3c18 <open>
    49b2:	83 c4 10             	add    $0x10,%esp
    49b5:	89 c2                	mov    %eax,%edx
    49b7:	8b 45 08             	mov    0x8(%ebp),%eax
    49ba:	89 10                	mov    %edx,(%eax)
    49bc:	8b 45 08             	mov    0x8(%ebp),%eax
    49bf:	8b 00                	mov    (%eax),%eax
    49c1:	83 f8 ff             	cmp    $0xffffffff,%eax
    49c4:	75 1a                	jne    49e0 <open_bit_stream_r+0x41>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    49c6:	83 ec 04             	sub    $0x4,%esp
    49c9:	ff 75 0c             	pushl  0xc(%ebp)
    49cc:	68 0b ac 00 00       	push   $0xac0b
    49d1:	6a 00                	push   $0x0
    49d3:	e8 dd f3 ff ff       	call   3db5 <printf>
    49d8:	83 c4 10             	add    $0x10,%esp
		exit();
    49db:	e8 f8 f1 ff ff       	call   3bd8 <exit>
	}

	bs->format = BINARY;
    49e0:	8b 45 08             	mov    0x8(%ebp),%eax
    49e3:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    49e7:	83 ec 08             	sub    $0x8,%esp
    49ea:	ff 75 10             	pushl  0x10(%ebp)
    49ed:	ff 75 08             	pushl  0x8(%ebp)
    49f0:	e8 63 ff ff ff       	call   4958 <alloc_buffer>
    49f5:	83 c4 10             	add    $0x10,%esp
	bs->buf_byte_idx=0;
    49f8:	8b 45 08             	mov    0x8(%ebp),%eax
    49fb:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    4a02:	8b 45 08             	mov    0x8(%ebp),%eax
    4a05:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    4a0c:	8b 45 08             	mov    0x8(%ebp),%eax
    4a0f:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    4a16:	8b 45 08             	mov    0x8(%ebp),%eax
    4a19:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    4a20:	8b 45 08             	mov    0x8(%ebp),%eax
    4a23:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    4a2a:	8b 45 08             	mov    0x8(%ebp),%eax
    4a2d:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    4a34:	c9                   	leave  
    4a35:	c3                   	ret    

00004a36 <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    4a36:	55                   	push   %ebp
    4a37:	89 e5                	mov    %esp,%ebp
    4a39:	83 ec 08             	sub    $0x8,%esp
	close(bs->pt);
    4a3c:	8b 45 08             	mov    0x8(%ebp),%eax
    4a3f:	8b 00                	mov    (%eax),%eax
    4a41:	83 ec 0c             	sub    $0xc,%esp
    4a44:	50                   	push   %eax
    4a45:	e8 b6 f1 ff ff       	call   3c00 <close>
    4a4a:	83 c4 10             	add    $0x10,%esp
	desalloc_buffer(bs);
    4a4d:	83 ec 0c             	sub    $0xc,%esp
    4a50:	ff 75 08             	pushl  0x8(%ebp)
    4a53:	e8 2d ff ff ff       	call   4985 <desalloc_buffer>
    4a58:	83 c4 10             	add    $0x10,%esp
}
    4a5b:	c9                   	leave  
    4a5c:	c3                   	ret    

00004a5d <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    4a5d:	55                   	push   %ebp
    4a5e:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    4a60:	8b 45 08             	mov    0x8(%ebp),%eax
    4a63:	8b 40 20             	mov    0x20(%eax),%eax
}
    4a66:	5d                   	pop    %ebp
    4a67:	c3                   	ret    

00004a68 <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    4a68:	55                   	push   %ebp
    4a69:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    4a6b:	8b 45 08             	mov    0x8(%ebp),%eax
    4a6e:	8b 40 0c             	mov    0xc(%eax),%eax
}
    4a71:	5d                   	pop    %ebp
    4a72:	c3                   	ret    

00004a73 <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    4a73:	55                   	push   %ebp
    4a74:	89 e5                	mov    %esp,%ebp
    4a76:	56                   	push   %esi
    4a77:	53                   	push   %ebx
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    4a78:	8b 45 08             	mov    0x8(%ebp),%eax
    4a7b:	8b 40 08             	mov    0x8(%eax),%eax
    4a7e:	8d 50 fe             	lea    -0x2(%eax),%edx
    4a81:	8b 45 08             	mov    0x8(%ebp),%eax
    4a84:	8b 40 10             	mov    0x10(%eax),%eax
    4a87:	89 d3                	mov    %edx,%ebx
    4a89:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    4a8b:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    4a90:	eb 30                	jmp    4ac2 <refill_buffer+0x4f>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    4a92:	8b 45 08             	mov    0x8(%ebp),%eax
    4a95:	8b 50 04             	mov    0x4(%eax),%edx
    4a98:	89 d8                	mov    %ebx,%eax
    4a9a:	8d 58 ff             	lea    -0x1(%eax),%ebx
    4a9d:	01 c2                	add    %eax,%edx
    4a9f:	8b 45 08             	mov    0x8(%ebp),%eax
    4aa2:	8b 00                	mov    (%eax),%eax
    4aa4:	83 ec 04             	sub    $0x4,%esp
    4aa7:	6a 01                	push   $0x1
    4aa9:	52                   	push   %edx
    4aaa:	50                   	push   %eax
    4aab:	e8 40 f1 ff ff       	call   3bf0 <read>
    4ab0:	83 c4 10             	add    $0x10,%esp
    4ab3:	89 c6                	mov    %eax,%esi
		if (!n)
    4ab5:	85 f6                	test   %esi,%esi
    4ab7:	75 09                	jne    4ac2 <refill_buffer+0x4f>
		bs->eob= i+1;
    4ab9:	8d 53 01             	lea    0x1(%ebx),%edx
    4abc:	8b 45 08             	mov    0x8(%ebp),%eax
    4abf:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    4ac2:	85 db                	test   %ebx,%ebx
    4ac4:	78 0a                	js     4ad0 <refill_buffer+0x5d>
    4ac6:	8b 45 08             	mov    0x8(%ebp),%eax
    4ac9:	8b 40 1c             	mov    0x1c(%eax),%eax
    4acc:	85 c0                	test   %eax,%eax
    4ace:	74 c2                	je     4a92 <refill_buffer+0x1f>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    4ad0:	8d 65 f8             	lea    -0x8(%ebp),%esp
    4ad3:	5b                   	pop    %ebx
    4ad4:	5e                   	pop    %esi
    4ad5:	5d                   	pop    %ebp
    4ad6:	c3                   	ret    

00004ad7 <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    4ad7:	55                   	push   %ebp
    4ad8:	89 e5                	mov    %esp,%ebp
    4ada:	53                   	push   %ebx
    4adb:	83 ec 14             	sub    $0x14,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    4ade:	8b 45 08             	mov    0x8(%ebp),%eax
    4ae1:	8b 40 0c             	mov    0xc(%eax),%eax
    4ae4:	8d 50 01             	lea    0x1(%eax),%edx
    4ae7:	8b 45 08             	mov    0x8(%ebp),%eax
    4aea:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    4aed:	8b 45 08             	mov    0x8(%ebp),%eax
    4af0:	8b 40 14             	mov    0x14(%eax),%eax
    4af3:	85 c0                	test   %eax,%eax
    4af5:	0f 85 a2 00 00 00    	jne    4b9d <get1bit+0xc6>
        bs->buf_bit_idx = 8;
    4afb:	8b 45 08             	mov    0x8(%ebp),%eax
    4afe:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    4b05:	8b 45 08             	mov    0x8(%ebp),%eax
    4b08:	8b 40 10             	mov    0x10(%eax),%eax
    4b0b:	8d 50 ff             	lea    -0x1(%eax),%edx
    4b0e:	8b 45 08             	mov    0x8(%ebp),%eax
    4b11:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    4b14:	8b 45 08             	mov    0x8(%ebp),%eax
    4b17:	8b 40 10             	mov    0x10(%eax),%eax
    4b1a:	83 f8 03             	cmp    $0x3,%eax
    4b1d:	7e 10                	jle    4b2f <get1bit+0x58>
    4b1f:	8b 45 08             	mov    0x8(%ebp),%eax
    4b22:	8b 50 10             	mov    0x10(%eax),%edx
    4b25:	8b 45 08             	mov    0x8(%ebp),%eax
    4b28:	8b 40 1c             	mov    0x1c(%eax),%eax
    4b2b:	39 c2                	cmp    %eax,%edx
    4b2d:	7d 6e                	jge    4b9d <get1bit+0xc6>
             if (bs->eob)
    4b2f:	8b 45 08             	mov    0x8(%ebp),%eax
    4b32:	8b 40 1c             	mov    0x1c(%eax),%eax
    4b35:	85 c0                	test   %eax,%eax
    4b37:	74 0c                	je     4b45 <get1bit+0x6e>
                bs->eobs = TRUE;
    4b39:	8b 45 08             	mov    0x8(%ebp),%eax
    4b3c:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    4b43:	eb 58                	jmp    4b9d <get1bit+0xc6>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    4b45:	8b 45 08             	mov    0x8(%ebp),%eax
    4b48:	8b 58 10             	mov    0x10(%eax),%ebx
    4b4b:	eb 2f                	jmp    4b7c <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    4b4d:	8b 45 08             	mov    0x8(%ebp),%eax
    4b50:	8b 50 04             	mov    0x4(%eax),%edx
    4b53:	8b 45 08             	mov    0x8(%ebp),%eax
    4b56:	8b 40 08             	mov    0x8(%eax),%eax
    4b59:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4b5c:	8b 45 08             	mov    0x8(%ebp),%eax
    4b5f:	8b 40 10             	mov    0x10(%eax),%eax
    4b62:	29 c1                	sub    %eax,%ecx
    4b64:	89 c8                	mov    %ecx,%eax
    4b66:	01 d8                	add    %ebx,%eax
    4b68:	01 c2                	add    %eax,%edx
    4b6a:	8b 45 08             	mov    0x8(%ebp),%eax
    4b6d:	8b 40 04             	mov    0x4(%eax),%eax
    4b70:	89 d9                	mov    %ebx,%ecx
    4b72:	01 c8                	add    %ecx,%eax
    4b74:	0f b6 00             	movzbl (%eax),%eax
    4b77:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    4b79:	83 eb 01             	sub    $0x1,%ebx
    4b7c:	85 db                	test   %ebx,%ebx
    4b7e:	79 cd                	jns    4b4d <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    4b80:	83 ec 0c             	sub    $0xc,%esp
    4b83:	ff 75 08             	pushl  0x8(%ebp)
    4b86:	e8 e8 fe ff ff       	call   4a73 <refill_buffer>
    4b8b:	83 c4 10             	add    $0x10,%esp
                bs->buf_byte_idx = bs->buf_size-1;
    4b8e:	8b 45 08             	mov    0x8(%ebp),%eax
    4b91:	8b 40 08             	mov    0x8(%eax),%eax
    4b94:	8d 50 ff             	lea    -0x1(%eax),%edx
    4b97:	8b 45 08             	mov    0x8(%ebp),%eax
    4b9a:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    4b9d:	8b 45 08             	mov    0x8(%ebp),%eax
    4ba0:	8b 50 04             	mov    0x4(%eax),%edx
    4ba3:	8b 45 08             	mov    0x8(%ebp),%eax
    4ba6:	8b 40 10             	mov    0x10(%eax),%eax
    4ba9:	01 d0                	add    %edx,%eax
    4bab:	0f b6 00             	movzbl (%eax),%eax
    4bae:	0f b6 d0             	movzbl %al,%edx
    4bb1:	8b 45 08             	mov    0x8(%ebp),%eax
    4bb4:	8b 40 14             	mov    0x14(%eax),%eax
    4bb7:	83 e8 01             	sub    $0x1,%eax
    4bba:	8b 04 85 00 eb 00 00 	mov    0xeb00(,%eax,4),%eax
    4bc1:	21 d0                	and    %edx,%eax
    4bc3:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    4bc6:	8b 45 08             	mov    0x8(%ebp),%eax
    4bc9:	8b 40 14             	mov    0x14(%eax),%eax
    4bcc:	83 e8 01             	sub    $0x1,%eax
    4bcf:	89 c1                	mov    %eax,%ecx
    4bd1:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    4bd4:	8b 45 08             	mov    0x8(%ebp),%eax
    4bd7:	8b 40 14             	mov    0x14(%eax),%eax
    4bda:	8d 50 ff             	lea    -0x1(%eax),%edx
    4bdd:	8b 45 08             	mov    0x8(%ebp),%eax
    4be0:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    4be3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4be6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4be9:	c9                   	leave  
    4bea:	c3                   	ret    

00004beb <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    4beb:	55                   	push   %ebp
    4bec:	89 e5                	mov    %esp,%ebp
    4bee:	57                   	push   %edi
    4bef:	56                   	push   %esi
    4bf0:	53                   	push   %ebx
    4bf1:	83 ec 1c             	sub    $0x1c,%esp
	unsigned long val=0;
    4bf4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    4bfb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    4bfe:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    4c02:	7e 14                	jle    4c18 <getbits+0x2d>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    4c04:	83 ec 04             	sub    $0x4,%esp
    4c07:	6a 20                	push   $0x20
    4c09:	68 24 ac 00 00       	push   $0xac24
    4c0e:	6a 00                	push   $0x0
    4c10:	e8 a0 f1 ff ff       	call   3db5 <printf>
    4c15:	83 c4 10             	add    $0x10,%esp

	bs->totbit += N;
    4c18:	8b 45 08             	mov    0x8(%ebp),%eax
    4c1b:	8b 50 0c             	mov    0xc(%eax),%edx
    4c1e:	8b 45 0c             	mov    0xc(%ebp),%eax
    4c21:	01 c2                	add    %eax,%edx
    4c23:	8b 45 08             	mov    0x8(%ebp),%eax
    4c26:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    4c29:	e9 0d 01 00 00       	jmp    4d3b <getbits+0x150>
		if (!bs->buf_bit_idx) {
    4c2e:	8b 45 08             	mov    0x8(%ebp),%eax
    4c31:	8b 40 14             	mov    0x14(%eax),%eax
    4c34:	85 c0                	test   %eax,%eax
    4c36:	0f 85 a2 00 00 00    	jne    4cde <getbits+0xf3>
			bs->buf_bit_idx = 8;
    4c3c:	8b 45 08             	mov    0x8(%ebp),%eax
    4c3f:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    4c46:	8b 45 08             	mov    0x8(%ebp),%eax
    4c49:	8b 40 10             	mov    0x10(%eax),%eax
    4c4c:	8d 50 ff             	lea    -0x1(%eax),%edx
    4c4f:	8b 45 08             	mov    0x8(%ebp),%eax
    4c52:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    4c55:	8b 45 08             	mov    0x8(%ebp),%eax
    4c58:	8b 40 10             	mov    0x10(%eax),%eax
    4c5b:	83 f8 03             	cmp    $0x3,%eax
    4c5e:	7e 10                	jle    4c70 <getbits+0x85>
    4c60:	8b 45 08             	mov    0x8(%ebp),%eax
    4c63:	8b 50 10             	mov    0x10(%eax),%edx
    4c66:	8b 45 08             	mov    0x8(%ebp),%eax
    4c69:	8b 40 1c             	mov    0x1c(%eax),%eax
    4c6c:	39 c2                	cmp    %eax,%edx
    4c6e:	7d 6e                	jge    4cde <getbits+0xf3>
				if (bs->eob)
    4c70:	8b 45 08             	mov    0x8(%ebp),%eax
    4c73:	8b 40 1c             	mov    0x1c(%eax),%eax
    4c76:	85 c0                	test   %eax,%eax
    4c78:	74 0c                	je     4c86 <getbits+0x9b>
					bs->eobs = TRUE;
    4c7a:	8b 45 08             	mov    0x8(%ebp),%eax
    4c7d:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    4c84:	eb 58                	jmp    4cde <getbits+0xf3>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    4c86:	8b 45 08             	mov    0x8(%ebp),%eax
    4c89:	8b 70 10             	mov    0x10(%eax),%esi
    4c8c:	eb 2f                	jmp    4cbd <getbits+0xd2>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    4c8e:	8b 45 08             	mov    0x8(%ebp),%eax
    4c91:	8b 50 04             	mov    0x4(%eax),%edx
    4c94:	8b 45 08             	mov    0x8(%ebp),%eax
    4c97:	8b 40 08             	mov    0x8(%eax),%eax
    4c9a:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4c9d:	8b 45 08             	mov    0x8(%ebp),%eax
    4ca0:	8b 40 10             	mov    0x10(%eax),%eax
    4ca3:	29 c1                	sub    %eax,%ecx
    4ca5:	89 c8                	mov    %ecx,%eax
    4ca7:	01 f0                	add    %esi,%eax
    4ca9:	01 c2                	add    %eax,%edx
    4cab:	8b 45 08             	mov    0x8(%ebp),%eax
    4cae:	8b 40 04             	mov    0x4(%eax),%eax
    4cb1:	89 f1                	mov    %esi,%ecx
    4cb3:	01 c8                	add    %ecx,%eax
    4cb5:	0f b6 00             	movzbl (%eax),%eax
    4cb8:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    4cba:	83 ee 01             	sub    $0x1,%esi
    4cbd:	85 f6                	test   %esi,%esi
    4cbf:	79 cd                	jns    4c8e <getbits+0xa3>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    4cc1:	83 ec 0c             	sub    $0xc,%esp
    4cc4:	ff 75 08             	pushl  0x8(%ebp)
    4cc7:	e8 a7 fd ff ff       	call   4a73 <refill_buffer>
    4ccc:	83 c4 10             	add    $0x10,%esp
					bs->buf_byte_idx = bs->buf_size-1;
    4ccf:	8b 45 08             	mov    0x8(%ebp),%eax
    4cd2:	8b 40 08             	mov    0x8(%eax),%eax
    4cd5:	8d 50 ff             	lea    -0x1(%eax),%edx
    4cd8:	8b 45 08             	mov    0x8(%ebp),%eax
    4cdb:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    4cde:	8b 45 08             	mov    0x8(%ebp),%eax
    4ce1:	8b 40 14             	mov    0x14(%eax),%eax
    4ce4:	39 d8                	cmp    %ebx,%eax
    4ce6:	0f 4f c3             	cmovg  %ebx,%eax
    4ce9:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    4ceb:	8b 45 08             	mov    0x8(%ebp),%eax
    4cee:	8b 50 04             	mov    0x4(%eax),%edx
    4cf1:	8b 45 08             	mov    0x8(%ebp),%eax
    4cf4:	8b 40 10             	mov    0x10(%eax),%eax
    4cf7:	01 d0                	add    %edx,%eax
    4cf9:	0f b6 00             	movzbl (%eax),%eax
    4cfc:	0f b6 d0             	movzbl %al,%edx
    4cff:	8b 45 08             	mov    0x8(%ebp),%eax
    4d02:	8b 40 14             	mov    0x14(%eax),%eax
    4d05:	8b 04 85 20 eb 00 00 	mov    0xeb20(,%eax,4),%eax
    4d0c:	89 d7                	mov    %edx,%edi
    4d0e:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    4d10:	8b 45 08             	mov    0x8(%ebp),%eax
    4d13:	8b 40 14             	mov    0x14(%eax),%eax
    4d16:	29 f0                	sub    %esi,%eax
    4d18:	89 c1                	mov    %eax,%ecx
    4d1a:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    4d1c:	89 d8                	mov    %ebx,%eax
    4d1e:	29 f0                	sub    %esi,%eax
    4d20:	89 c1                	mov    %eax,%ecx
    4d22:	d3 e7                	shl    %cl,%edi
    4d24:	89 f8                	mov    %edi,%eax
    4d26:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    4d29:	8b 45 08             	mov    0x8(%ebp),%eax
    4d2c:	8b 40 14             	mov    0x14(%eax),%eax
    4d2f:	29 f0                	sub    %esi,%eax
    4d31:	89 c2                	mov    %eax,%edx
    4d33:	8b 45 08             	mov    0x8(%ebp),%eax
    4d36:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    4d39:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    4d3b:	85 db                	test   %ebx,%ebx
    4d3d:	0f 8f eb fe ff ff    	jg     4c2e <getbits+0x43>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    4d43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    4d46:	8d 65 f4             	lea    -0xc(%ebp),%esp
    4d49:	5b                   	pop    %ebx
    4d4a:	5e                   	pop    %esi
    4d4b:	5f                   	pop    %edi
    4d4c:	5d                   	pop    %ebp
    4d4d:	c3                   	ret    

00004d4e <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    4d4e:	55                   	push   %ebp
    4d4f:	89 e5                	mov    %esp,%ebp
    4d51:	83 ec 28             	sub    $0x28,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    4d54:	db 45 10             	fildl  0x10(%ebp)
    4d57:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4d5b:	dd 1c 24             	fstpl  (%esp)
    4d5e:	dd 05 90 ac 00 00    	fldl   0xac90
    4d64:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4d68:	dd 1c 24             	fstpl  (%esp)
    4d6b:	e8 0f f5 ff ff       	call   427f <pow>
    4d70:	83 c4 10             	add    $0x10,%esp
    4d73:	d9 7d e6             	fnstcw -0x1a(%ebp)
    4d76:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    4d7a:	b4 0c                	mov    $0xc,%ah
    4d7c:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    4d80:	d9 6d e4             	fldcw  -0x1c(%ebp)
    4d83:	db 5d e0             	fistpl -0x20(%ebp)
    4d86:	d9 6d e6             	fldcw  -0x1a(%ebp)
    4d89:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4d8c:	83 e8 01             	sub    $0x1,%eax
    4d8f:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    4d92:	83 ec 0c             	sub    $0xc,%esp
    4d95:	ff 75 08             	pushl  0x8(%ebp)
    4d98:	e8 cb fc ff ff       	call   4a68 <sstell>
    4d9d:	83 c4 10             	add    $0x10,%esp
    4da0:	83 e0 07             	and    $0x7,%eax
    4da3:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    4da6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4daa:	74 17                	je     4dc3 <seek_sync+0x75>
		getbits(bs, (int)(ALIGNING-aligning));
    4dac:	b8 08 00 00 00       	mov    $0x8,%eax
    4db1:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4db4:	83 ec 08             	sub    $0x8,%esp
    4db7:	50                   	push   %eax
    4db8:	ff 75 08             	pushl  0x8(%ebp)
    4dbb:	e8 2b fe ff ff       	call   4beb <getbits>
    4dc0:	83 c4 10             	add    $0x10,%esp

	val = getbits(bs, N);
    4dc3:	83 ec 08             	sub    $0x8,%esp
    4dc6:	ff 75 10             	pushl  0x10(%ebp)
    4dc9:	ff 75 08             	pushl  0x8(%ebp)
    4dcc:	e8 1a fe ff ff       	call   4beb <getbits>
    4dd1:	83 c4 10             	add    $0x10,%esp
    4dd4:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    4dd7:	eb 17                	jmp    4df0 <seek_sync+0xa2>
		val <<= ALIGNING;
    4dd9:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    4ddd:	83 ec 08             	sub    $0x8,%esp
    4de0:	6a 08                	push   $0x8
    4de2:	ff 75 08             	pushl  0x8(%ebp)
    4de5:	e8 01 fe ff ff       	call   4beb <getbits>
    4dea:	83 c4 10             	add    $0x10,%esp
    4ded:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    4df0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4df3:	23 45 f4             	and    -0xc(%ebp),%eax
    4df6:	3b 45 0c             	cmp    0xc(%ebp),%eax
    4df9:	74 12                	je     4e0d <seek_sync+0xbf>
    4dfb:	83 ec 0c             	sub    $0xc,%esp
    4dfe:	ff 75 08             	pushl  0x8(%ebp)
    4e01:	e8 57 fc ff ff       	call   4a5d <end_bs>
    4e06:	83 c4 10             	add    $0x10,%esp
    4e09:	85 c0                	test   %eax,%eax
    4e0b:	74 cc                	je     4dd9 <seek_sync+0x8b>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    4e0d:	83 ec 0c             	sub    $0xc,%esp
    4e10:	ff 75 08             	pushl  0x8(%ebp)
    4e13:	e8 45 fc ff ff       	call   4a5d <end_bs>
    4e18:	83 c4 10             	add    $0x10,%esp
    4e1b:	85 c0                	test   %eax,%eax
    4e1d:	74 07                	je     4e26 <seek_sync+0xd8>
		return(0);
    4e1f:	b8 00 00 00 00       	mov    $0x0,%eax
    4e24:	eb 05                	jmp    4e2b <seek_sync+0xdd>
	else
		return(1);
    4e26:	b8 01 00 00 00       	mov    $0x1,%eax
}
    4e2b:	c9                   	leave  
    4e2c:	c3                   	ret    

00004e2d <js_bound>:

int js_bound(int lay, int m_ext)
{
    4e2d:	55                   	push   %ebp
    4e2e:	89 e5                	mov    %esp,%ebp
    4e30:	83 ec 08             	sub    $0x8,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    4e33:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    4e37:	7e 12                	jle    4e4b <js_bound+0x1e>
    4e39:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    4e3d:	7f 0c                	jg     4e4b <js_bound+0x1e>
    4e3f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    4e43:	78 06                	js     4e4b <js_bound+0x1e>
    4e45:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    4e49:	7e 1a                	jle    4e65 <js_bound+0x38>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    4e4b:	ff 75 0c             	pushl  0xc(%ebp)
    4e4e:	ff 75 08             	pushl  0x8(%ebp)
    4e51:	68 58 ac 00 00       	push   $0xac58
    4e56:	6a 00                	push   $0x0
    4e58:	e8 58 ef ff ff       	call   3db5 <printf>
    4e5d:	83 c4 10             	add    $0x10,%esp
        exit();
    4e60:	e8 73 ed ff ff       	call   3bd8 <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    4e65:	8b 45 08             	mov    0x8(%ebp),%eax
    4e68:	83 e8 01             	sub    $0x1,%eax
    4e6b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    4e72:	8b 45 0c             	mov    0xc(%ebp),%eax
    4e75:	01 d0                	add    %edx,%eax
    4e77:	8b 04 85 60 eb 00 00 	mov    0xeb60(,%eax,4),%eax
}
    4e7e:	c9                   	leave  
    4e7f:	c3                   	ret    

00004e80 <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    4e80:	55                   	push   %ebp
    4e81:	89 e5                	mov    %esp,%ebp
    4e83:	83 ec 18             	sub    $0x18,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    4e86:	8b 45 08             	mov    0x8(%ebp),%eax
    4e89:	8b 00                	mov    (%eax),%eax
    4e8b:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    4e8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4e91:	8b 50 1c             	mov    0x1c(%eax),%edx
    4e94:	8b 45 08             	mov    0x8(%ebp),%eax
    4e97:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    4e9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4e9d:	8b 40 1c             	mov    0x1c(%eax),%eax
    4ea0:	83 f8 03             	cmp    $0x3,%eax
    4ea3:	75 07                	jne    4eac <hdr_to_frps+0x2c>
    4ea5:	ba 01 00 00 00       	mov    $0x1,%edx
    4eaa:	eb 05                	jmp    4eb1 <hdr_to_frps+0x31>
    4eac:	ba 02 00 00 00       	mov    $0x2,%edx
    4eb1:	8b 45 08             	mov    0x8(%ebp),%eax
    4eb4:	89 50 08             	mov    %edx,0x8(%eax)
	fr_ps->sblimit = SBLIMIT;
    4eb7:	8b 45 08             	mov    0x8(%ebp),%eax
    4eba:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    4ec1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4ec4:	8b 40 1c             	mov    0x1c(%eax),%eax
    4ec7:	83 f8 01             	cmp    $0x1,%eax
    4eca:	75 23                	jne    4eef <hdr_to_frps+0x6f>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    4ecc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4ecf:	8b 50 20             	mov    0x20(%eax),%edx
    4ed2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4ed5:	8b 40 04             	mov    0x4(%eax),%eax
    4ed8:	83 ec 08             	sub    $0x8,%esp
    4edb:	52                   	push   %edx
    4edc:	50                   	push   %eax
    4edd:	e8 4b ff ff ff       	call   4e2d <js_bound>
    4ee2:	83 c4 10             	add    $0x10,%esp
    4ee5:	89 c2                	mov    %eax,%edx
    4ee7:	8b 45 08             	mov    0x8(%ebp),%eax
    4eea:	89 50 0c             	mov    %edx,0xc(%eax)
    4eed:	eb 0c                	jmp    4efb <hdr_to_frps+0x7b>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    4eef:	8b 45 08             	mov    0x8(%ebp),%eax
    4ef2:	8b 50 10             	mov    0x10(%eax),%edx
    4ef5:	8b 45 08             	mov    0x8(%ebp),%eax
    4ef8:	89 50 0c             	mov    %edx,0xc(%eax)
}
    4efb:	c9                   	leave  
    4efc:	c3                   	ret    

00004efd <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    4efd:	55                   	push   %ebp
    4efe:	89 e5                	mov    %esp,%ebp
    4f00:	83 ec 08             	sub    $0x8,%esp
	if (N != 8) {
    4f03:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    4f07:	74 17                	je     4f20 <hputbuf+0x23>
		printf(0,"Not Supported yet!!\n");
    4f09:	83 ec 08             	sub    $0x8,%esp
    4f0c:	68 7b ac 00 00       	push   $0xac7b
    4f11:	6a 00                	push   $0x0
    4f13:	e8 9d ee ff ff       	call   3db5 <printf>
    4f18:	83 c4 10             	add    $0x10,%esp
		exit();
    4f1b:	e8 b8 ec ff ff       	call   3bd8 <exit>
	}
	getCoreBuf(1, val);
    4f20:	83 ec 08             	sub    $0x8,%esp
    4f23:	ff 75 08             	pushl  0x8(%ebp)
    4f26:	6a 01                	push   $0x1
    4f28:	e8 ab ed ff ff       	call   3cd8 <getCoreBuf>
    4f2d:	83 c4 10             	add    $0x10,%esp
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    4f30:	c9                   	leave  
    4f31:	c3                   	ret    

00004f32 <hsstell>:

unsigned long hsstell()
{
    4f32:	55                   	push   %ebp
    4f33:	89 e5                	mov    %esp,%ebp
    4f35:	83 ec 08             	sub    $0x8,%esp
	return getCoreBuf(2, 0);
    4f38:	83 ec 08             	sub    $0x8,%esp
    4f3b:	6a 00                	push   $0x0
    4f3d:	6a 02                	push   $0x2
    4f3f:	e8 94 ed ff ff       	call   3cd8 <getCoreBuf>
    4f44:	83 c4 10             	add    $0x10,%esp
//	return(totbit);
}
    4f47:	c9                   	leave  
    4f48:	c3                   	ret    

00004f49 <hgetbits>:

unsigned long hgetbits(int N)
{
    4f49:	55                   	push   %ebp
    4f4a:	89 e5                	mov    %esp,%ebp
    4f4c:	83 ec 08             	sub    $0x8,%esp

	return getCoreBuf(3, N);
    4f4f:	83 ec 08             	sub    $0x8,%esp
    4f52:	ff 75 08             	pushl  0x8(%ebp)
    4f55:	6a 03                	push   $0x3
    4f57:	e8 7c ed ff ff       	call   3cd8 <getCoreBuf>
    4f5c:	83 c4 10             	add    $0x10,%esp
}
    4f5f:	c9                   	leave  
    4f60:	c3                   	ret    

00004f61 <hget1bit>:


unsigned int hget1bit()
{
    4f61:	55                   	push   %ebp
    4f62:	89 e5                	mov    %esp,%ebp
    4f64:	83 ec 08             	sub    $0x8,%esp
	return(hgetbits(1));
    4f67:	83 ec 0c             	sub    $0xc,%esp
    4f6a:	6a 01                	push   $0x1
    4f6c:	e8 d8 ff ff ff       	call   4f49 <hgetbits>
    4f71:	83 c4 10             	add    $0x10,%esp
}
    4f74:	c9                   	leave  
    4f75:	c3                   	ret    

00004f76 <rewindNbits>:


void rewindNbits(int N)
{
    4f76:	55                   	push   %ebp
    4f77:	89 e5                	mov    %esp,%ebp
    4f79:	83 ec 08             	sub    $0x8,%esp
	getCoreBuf(4, N);
    4f7c:	83 ec 08             	sub    $0x8,%esp
    4f7f:	ff 75 08             	pushl  0x8(%ebp)
    4f82:	6a 04                	push   $0x4
    4f84:	e8 4f ed ff ff       	call   3cd8 <getCoreBuf>
    4f89:	83 c4 10             	add    $0x10,%esp
}
    4f8c:	c9                   	leave  
    4f8d:	c3                   	ret    

00004f8e <rewindNbytes>:


void rewindNbytes(int N)
{
    4f8e:	55                   	push   %ebp
    4f8f:	89 e5                	mov    %esp,%ebp
    4f91:	83 ec 08             	sub    $0x8,%esp
	getCoreBuf(5, N);
    4f94:	83 ec 08             	sub    $0x8,%esp
    4f97:	ff 75 08             	pushl  0x8(%ebp)
    4f9a:	6a 05                	push   $0x5
    4f9c:	e8 37 ed ff ff       	call   3cd8 <getCoreBuf>
    4fa1:	83 c4 10             	add    $0x10,%esp
}
    4fa4:	c9                   	leave  
    4fa5:	c3                   	ret    

00004fa6 <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    4fa6:	55                   	push   %ebp
    4fa7:	89 e5                	mov    %esp,%ebp
    4fa9:	57                   	push   %edi
    4faa:	56                   	push   %esi
    4fab:	53                   	push   %ebx
    4fac:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    4fb2:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    4fb6:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    4fba:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    4fbe:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    4fc2:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    4fc6:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    4fca:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    4fce:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    4fd2:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    4fd6:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    4fda:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    4fde:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    4fe2:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    4fe6:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    4fea:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    4fee:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    4ff2:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    4ff6:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    4ffa:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    4ffe:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    5002:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    5006:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    500a:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    500e:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    5012:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    5016:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    501a:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    501e:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    5022:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    5026:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    502a:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    502e:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    5032:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    5036:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    503a:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    503e:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    5042:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    5046:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    504a:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    504e:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    5052:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    5056:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    505a:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    505e:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    5062:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    5066:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    506a:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    506e:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    5072:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    5076:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    507a:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    507e:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    5082:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    5086:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    508a:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    508e:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    5092:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    5096:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    509a:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    509e:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    50a2:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    50a6:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    50aa:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    50ae:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    50b2:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    50b6:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    50ba:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    50be:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    50c2:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    50c6:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    50ca:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    50ce:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    50d2:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    50d6:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    50da:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    50de:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    50e2:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    50e6:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    50ea:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    50ee:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    50f2:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    50f6:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    50fa:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    5101:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    5108:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    510f:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    5116:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    511d:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    5124:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    512b:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    5132:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    5139:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    5140:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    5147:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    514e:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    5155:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    515c:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    5163:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    516a:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    5171:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    5178:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    517f:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    5186:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    518d:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    5194:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    519b:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    51a2:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    51a9:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    51b0:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    51b7:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    51be:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    51c2:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    51c6:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    51ca:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    51ce:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    51d2:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    51d6:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    51da:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    51de:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    51e2:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    51e6:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    51ea:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    51ee:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    51f2:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    51f6:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    51fa:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    51fe:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    5202:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    5206:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    520a:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    520e:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    5212:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    5216:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    521a:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    521e:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    5222:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    5226:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    522a:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    522e:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    5232:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    5236:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    523a:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    523e:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    5242:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    5246:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    524d:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    5254:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    525b:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    5262:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    5269:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    5270:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    5277:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    527e:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    5285:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    528c:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    5293:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    529a:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    52a1:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    52a8:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    52af:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    52b6:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    52bd:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    52c4:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    52cb:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    52d2:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    52d9:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    52e0:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    52e7:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    52ee:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    52f5:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    52fc:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    5303:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    530a:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    5311:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    5318:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    531f:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    5326:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    532d:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    5334:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    533b:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    5342:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    5349:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    5350:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    5357:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    535e:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    5365:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    536c:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    5373:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    537a:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    5381:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    5388:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    538f:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    5396:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    539d:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    53a4:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    53ab:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    53b2:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    53b9:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    53c0:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    53c7:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    53ce:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    53d5:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    53dc:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    53e3:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    53ea:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    53f1:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    53f8:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    53fe:	ba c0 ac 00 00       	mov    $0xacc0,%edx
    5403:	b9 23 00 00 00       	mov    $0x23,%ecx
    5408:	89 c7                	mov    %eax,%edi
    540a:	89 d6                	mov    %edx,%esi
    540c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    540e:	89 f2                	mov    %esi,%edx
    5410:	89 f8                	mov    %edi,%eax
    5412:	0f b7 0a             	movzwl (%edx),%ecx
    5415:	66 89 08             	mov    %cx,(%eax)
    5418:	8d 40 02             	lea    0x2(%eax),%eax
    541b:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    541e:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    5424:	bb 80 ad 00 00       	mov    $0xad80,%ebx
    5429:	ba 8e 00 00 00       	mov    $0x8e,%edx
    542e:	8b 0b                	mov    (%ebx),%ecx
    5430:	89 08                	mov    %ecx,(%eax)
    5432:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    5436:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    543a:	8d 78 04             	lea    0x4(%eax),%edi
    543d:	83 e7 fc             	and    $0xfffffffc,%edi
    5440:	29 f8                	sub    %edi,%eax
    5442:	29 c3                	sub    %eax,%ebx
    5444:	01 c2                	add    %eax,%edx
    5446:	83 e2 fc             	and    $0xfffffffc,%edx
    5449:	89 d0                	mov    %edx,%eax
    544b:	c1 e8 02             	shr    $0x2,%eax
    544e:	89 de                	mov    %ebx,%esi
    5450:	89 c1                	mov    %eax,%ecx
    5452:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    5454:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    545a:	ba 40 ae 00 00       	mov    $0xae40,%edx
    545f:	b9 23 00 00 00       	mov    $0x23,%ecx
    5464:	89 c7                	mov    %eax,%edi
    5466:	89 d6                	mov    %edx,%esi
    5468:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    546a:	89 f2                	mov    %esi,%edx
    546c:	89 f8                	mov    %edi,%eax
    546e:	0f b7 0a             	movzwl (%edx),%ecx
    5471:	66 89 08             	mov    %cx,(%eax)
    5474:	8d 40 02             	lea    0x2(%eax),%eax
    5477:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    547a:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    5480:	bb 00 af 00 00       	mov    $0xaf00,%ebx
    5485:	ba fe 00 00 00       	mov    $0xfe,%edx
    548a:	8b 0b                	mov    (%ebx),%ecx
    548c:	89 08                	mov    %ecx,(%eax)
    548e:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    5492:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    5496:	8d 78 04             	lea    0x4(%eax),%edi
    5499:	83 e7 fc             	and    $0xfffffffc,%edi
    549c:	29 f8                	sub    %edi,%eax
    549e:	29 c3                	sub    %eax,%ebx
    54a0:	01 c2                	add    %eax,%edx
    54a2:	83 e2 fc             	and    $0xfffffffc,%edx
    54a5:	89 d0                	mov    %edx,%eax
    54a7:	c1 e8 02             	shr    $0x2,%eax
    54aa:	89 de                	mov    %ebx,%esi
    54ac:	89 c1                	mov    %eax,%ecx
    54ae:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    54b0:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    54b6:	ba 00 b0 00 00       	mov    $0xb000,%edx
    54bb:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    54c0:	89 c7                	mov    %eax,%edi
    54c2:	89 d6                	mov    %edx,%esi
    54c4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    54c6:	89 f2                	mov    %esi,%edx
    54c8:	89 f8                	mov    %edi,%eax
    54ca:	0f b7 0a             	movzwl (%edx),%ecx
    54cd:	66 89 08             	mov    %cx,(%eax)
    54d0:	8d 40 02             	lea    0x2(%eax),%eax
    54d3:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    54d6:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    54dc:	bb 00 b1 00 00       	mov    $0xb100,%ebx
    54e1:	ba fe 00 00 00       	mov    $0xfe,%edx
    54e6:	8b 0b                	mov    (%ebx),%ecx
    54e8:	89 08                	mov    %ecx,(%eax)
    54ea:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    54ee:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    54f2:	8d 78 04             	lea    0x4(%eax),%edi
    54f5:	83 e7 fc             	and    $0xfffffffc,%edi
    54f8:	29 f8                	sub    %edi,%eax
    54fa:	29 c3                	sub    %eax,%ebx
    54fc:	01 c2                	add    %eax,%edx
    54fe:	83 e2 fc             	and    $0xfffffffc,%edx
    5501:	89 d0                	mov    %edx,%eax
    5503:	c1 e8 02             	shr    $0x2,%eax
    5506:	89 de                	mov    %ebx,%esi
    5508:	89 c1                	mov    %eax,%ecx
    550a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    550c:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    5512:	ba 00 b2 00 00       	mov    $0xb200,%edx
    5517:	b9 ff 00 00 00       	mov    $0xff,%ecx
    551c:	89 c7                	mov    %eax,%edi
    551e:	89 d6                	mov    %edx,%esi
    5520:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5522:	89 f2                	mov    %esi,%edx
    5524:	89 f8                	mov    %edi,%eax
    5526:	0f b7 0a             	movzwl (%edx),%ecx
    5529:	66 89 08             	mov    %cx,(%eax)
    552c:	8d 40 02             	lea    0x2(%eax),%eax
    552f:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    5532:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    5538:	bb 00 b6 00 00       	mov    $0xb600,%ebx
    553d:	ba fe 03 00 00       	mov    $0x3fe,%edx
    5542:	8b 0b                	mov    (%ebx),%ecx
    5544:	89 08                	mov    %ecx,(%eax)
    5546:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    554a:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    554e:	8d 78 04             	lea    0x4(%eax),%edi
    5551:	83 e7 fc             	and    $0xfffffffc,%edi
    5554:	29 f8                	sub    %edi,%eax
    5556:	29 c3                	sub    %eax,%ebx
    5558:	01 c2                	add    %eax,%edx
    555a:	83 e2 fc             	and    $0xfffffffc,%edx
    555d:	89 d0                	mov    %edx,%eax
    555f:	c1 e8 02             	shr    $0x2,%eax
    5562:	89 de                	mov    %ebx,%esi
    5564:	89 c1                	mov    %eax,%ecx
    5566:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    5568:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    556e:	ba 00 ba 00 00       	mov    $0xba00,%edx
    5573:	b9 ff 00 00 00       	mov    $0xff,%ecx
    5578:	89 c7                	mov    %eax,%edi
    557a:	89 d6                	mov    %edx,%esi
    557c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    557e:	89 f2                	mov    %esi,%edx
    5580:	89 f8                	mov    %edi,%eax
    5582:	0f b7 0a             	movzwl (%edx),%ecx
    5585:	66 89 08             	mov    %cx,(%eax)
    5588:	8d 40 02             	lea    0x2(%eax),%eax
    558b:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    558e:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    5594:	bb 00 be 00 00       	mov    $0xbe00,%ebx
    5599:	ba 00 01 00 00       	mov    $0x100,%edx
    559e:	89 c7                	mov    %eax,%edi
    55a0:	89 de                	mov    %ebx,%esi
    55a2:	89 d1                	mov    %edx,%ecx
    55a4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    55a6:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    55ad:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    55b4:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    55bb:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    55c2:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    55c9:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    55d0:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    55d7:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    55de:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    55e5:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    55ec:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    55f3:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    55fa:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    5601:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    5608:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    560f:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    5616:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    561d:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    5624:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    562b:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    5632:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    5639:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    5640:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    5647:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    564e:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    5655:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    565c:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    5663:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    566a:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    5671:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    5678:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    567f:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    5686:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    568d:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    5694:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    569b:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    56a2:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    56a9:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    56b0:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    56b7:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    56be:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    56c5:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    56cc:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    56d3:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    56da:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    56e1:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    56e8:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    56ef:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    56f6:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    56fd:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    5704:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    570b:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    5712:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    5719:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    5720:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    5727:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    572e:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    5735:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    573c:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    5743:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    574a:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    5751:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    5758:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    575f:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    5766:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    576d:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    5774:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    577b:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    5782:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    5789:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    5790:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    5797:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    579e:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    57a5:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    57ac:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    57b3:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    57ba:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    57c1:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    57c8:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    57cf:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    57d6:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    57dd:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    57e4:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    57eb:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    57f2:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    57f9:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    5800:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    5807:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    580e:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    5815:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    581c:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    5823:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    582a:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    5831:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    5838:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    583f:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    5846:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    584d:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    5854:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    585b:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    5862:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    5869:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    5870:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    5877:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    587e:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    5885:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    588c:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    5893:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    589a:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    58a1:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    58a8:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    58af:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    58b6:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    58bd:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    58c4:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    58cb:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    58d2:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    58d9:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    58e0:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    58e7:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    58ee:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    58f5:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    58fc:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    5903:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    590a:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    5911:	30 00 
    5913:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    591a:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    5921:	00 00 00 
    5924:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    592b:	00 00 00 
    592e:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    5935:	00 00 00 
    5938:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    593f:	00 00 00 
    5942:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    5949:	ff ff ff 
    594c:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    5953:	00 00 00 
    5956:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    595d:	00 00 00 
    5960:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    5967:	00 00 00 
    596a:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    5971:	00 00 00 
    5974:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    597b:	31 00 
    597d:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    5984:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    598b:	00 00 00 
    598e:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    5995:	00 00 00 
    5998:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    599f:	00 00 00 
    59a2:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    59a9:	00 00 00 
    59ac:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    59b3:	ff ff ff 
    59b6:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    59bd:	00 00 00 
    59c0:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    59c7:	00 00 00 
    59ca:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    59cd:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    59d3:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    59da:	00 00 00 
    59dd:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    59e4:	32 00 
    59e6:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    59ed:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    59f4:	00 00 00 
    59f7:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    59fe:	00 00 00 
    5a01:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    5a08:	00 00 00 
    5a0b:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    5a12:	00 00 00 
    5a15:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    5a1c:	ff ff ff 
    5a1f:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    5a26:	00 00 00 
    5a29:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    5a30:	00 00 00 
    5a33:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    5a36:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    5a3c:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    5a43:	00 00 00 
    5a46:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    5a4d:	33 00 
    5a4f:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    5a56:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    5a5d:	00 00 00 
    5a60:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    5a67:	00 00 00 
    5a6a:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    5a71:	00 00 00 
    5a74:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    5a7b:	00 00 00 
    5a7e:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    5a85:	ff ff ff 
    5a88:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    5a8f:	00 00 00 
    5a92:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    5a99:	00 00 00 
    5a9c:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    5a9f:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    5aa5:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    5aac:	00 00 00 
    5aaf:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    5ab6:	34 00 
    5ab8:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    5abf:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    5ac6:	00 00 00 
    5ac9:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    5ad0:	00 00 00 
    5ad3:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    5ada:	00 00 00 
    5add:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    5ae4:	00 00 00 
    5ae7:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    5aee:	ff ff ff 
    5af1:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    5af8:	00 00 00 
    5afb:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    5b02:	00 00 00 
    5b05:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    5b0c:	00 00 00 
    5b0f:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    5b16:	00 00 00 
    5b19:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    5b20:	35 00 
    5b22:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    5b29:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    5b30:	00 00 00 
    5b33:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    5b3a:	00 00 00 
    5b3d:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    5b44:	00 00 00 
    5b47:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    5b4e:	00 00 00 
    5b51:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    5b58:	ff ff ff 
    5b5b:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    5b62:	00 00 00 
    5b65:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    5b6c:	00 00 00 
    5b6f:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    5b75:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    5b7b:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    5b82:	00 00 00 
    5b85:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    5b8c:	36 00 
    5b8e:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    5b95:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    5b9c:	00 00 00 
    5b9f:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    5ba6:	00 00 00 
    5ba9:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    5bb0:	00 00 00 
    5bb3:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    5bba:	00 00 00 
    5bbd:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    5bc4:	ff ff ff 
    5bc7:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    5bce:	00 00 00 
    5bd1:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    5bd8:	00 00 00 
    5bdb:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    5be1:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    5be7:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    5bee:	00 00 00 
    5bf1:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    5bf8:	37 00 
    5bfa:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    5c01:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    5c08:	00 00 00 
    5c0b:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    5c12:	00 00 00 
    5c15:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    5c1c:	00 00 00 
    5c1f:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    5c26:	00 00 00 
    5c29:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    5c30:	ff ff ff 
    5c33:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    5c3a:	00 00 00 
    5c3d:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    5c44:	00 00 00 
    5c47:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    5c4d:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    5c53:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    5c5a:	00 00 00 
    5c5d:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    5c64:	38 00 
    5c66:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    5c6d:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    5c74:	00 00 00 
    5c77:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    5c7e:	00 00 00 
    5c81:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    5c88:	00 00 00 
    5c8b:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    5c92:	00 00 00 
    5c95:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    5c9c:	ff ff ff 
    5c9f:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    5ca6:	00 00 00 
    5ca9:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    5cb0:	00 00 00 
    5cb3:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    5cb9:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    5cbf:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    5cc6:	00 00 00 
    5cc9:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    5cd0:	39 00 
    5cd2:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    5cd9:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    5ce0:	00 00 00 
    5ce3:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    5cea:	00 00 00 
    5ced:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    5cf4:	00 00 00 
    5cf7:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    5cfe:	00 00 00 
    5d01:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    5d08:	ff ff ff 
    5d0b:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    5d12:	00 00 00 
    5d15:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    5d1c:	00 00 00 
    5d1f:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    5d25:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    5d2b:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    5d32:	00 00 00 
    5d35:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    5d3c:	31 30 
    5d3e:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    5d45:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    5d4c:	00 00 00 
    5d4f:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    5d56:	00 00 00 
    5d59:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    5d60:	00 00 00 
    5d63:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    5d6a:	00 00 00 
    5d6d:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    5d74:	ff ff ff 
    5d77:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    5d7e:	00 00 00 
    5d81:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    5d88:	00 00 00 
    5d8b:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    5d91:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    5d97:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    5d9e:	00 00 00 
    5da1:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    5da8:	31 31 
    5daa:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    5db1:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    5db8:	00 00 00 
    5dbb:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    5dc2:	00 00 00 
    5dc5:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    5dcc:	00 00 00 
    5dcf:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    5dd6:	00 00 00 
    5dd9:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    5de0:	ff ff ff 
    5de3:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    5dea:	00 00 00 
    5ded:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    5df4:	00 00 00 
    5df7:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    5dfd:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    5e03:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    5e0a:	00 00 00 
    5e0d:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    5e14:	31 32 
    5e16:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    5e1d:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    5e24:	00 00 00 
    5e27:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    5e2e:	00 00 00 
    5e31:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    5e38:	00 00 00 
    5e3b:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    5e42:	00 00 00 
    5e45:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    5e4c:	ff ff ff 
    5e4f:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    5e56:	00 00 00 
    5e59:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    5e60:	00 00 00 
    5e63:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    5e69:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    5e6f:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    5e76:	00 00 00 
    5e79:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    5e80:	31 33 
    5e82:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    5e89:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    5e90:	00 00 00 
    5e93:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    5e9a:	00 00 00 
    5e9d:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    5ea4:	00 00 00 
    5ea7:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    5eae:	00 00 00 
    5eb1:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    5eb8:	ff ff ff 
    5ebb:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    5ec2:	00 00 00 
    5ec5:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    5ecc:	00 00 00 
    5ecf:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    5ed5:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    5edb:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    5ee2:	01 00 00 
    5ee5:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    5eec:	31 34 
    5eee:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    5ef5:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    5efc:	00 00 00 
    5eff:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    5f06:	00 00 00 
    5f09:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    5f10:	00 00 00 
    5f13:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    5f1a:	00 00 00 
    5f1d:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    5f24:	ff ff ff 
    5f27:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    5f2e:	00 00 00 
    5f31:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    5f38:	00 00 00 
    5f3b:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    5f42:	00 00 00 
    5f45:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    5f4c:	00 00 00 
    5f4f:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    5f56:	31 35 
    5f58:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    5f5f:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    5f66:	00 00 00 
    5f69:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    5f70:	00 00 00 
    5f73:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    5f7a:	00 00 00 
    5f7d:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    5f84:	00 00 00 
    5f87:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    5f8e:	ff ff ff 
    5f91:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    5f98:	00 00 00 
    5f9b:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    5fa2:	00 00 00 
    5fa5:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    5fab:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    5fb1:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    5fb8:	01 00 00 
    5fbb:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    5fc2:	31 36 
    5fc4:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    5fcb:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    5fd2:	00 00 00 
    5fd5:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    5fdc:	00 00 00 
    5fdf:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    5fe6:	00 00 00 
    5fe9:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    5ff0:	00 00 00 
    5ff3:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    5ffa:	ff ff ff 
    5ffd:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    6004:	00 00 00 
    6007:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    600e:	00 00 00 
    6011:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6017:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    601d:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    6024:	01 00 00 
    6027:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    602e:	31 37 
    6030:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    6037:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    603e:	00 00 00 
    6041:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    6048:	00 00 00 
    604b:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    6052:	00 00 00 
    6055:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    605c:	00 00 00 
    605f:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    6066:	00 00 00 
    6069:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    6070:	00 00 00 
    6073:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    607a:	00 00 00 
    607d:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6083:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    6089:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    6090:	01 00 00 
    6093:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    609a:	31 38 
    609c:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    60a3:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    60aa:	00 00 00 
    60ad:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    60b4:	00 00 00 
    60b7:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    60be:	00 00 00 
    60c1:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    60c8:	00 00 00 
    60cb:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    60d2:	00 00 00 
    60d5:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    60dc:	00 00 00 
    60df:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    60e6:	00 00 00 
    60e9:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    60ef:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    60f5:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    60fc:	01 00 00 
    60ff:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    6106:	31 39 
    6108:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    610f:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    6116:	00 00 00 
    6119:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    6120:	00 00 00 
    6123:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    612a:	00 00 00 
    612d:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    6134:	00 00 00 
    6137:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    613e:	00 00 00 
    6141:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    6148:	00 00 00 
    614b:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    6152:	00 00 00 
    6155:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    615b:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    6161:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    6168:	01 00 00 
    616b:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    6172:	32 30 
    6174:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    617b:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    6182:	00 00 00 
    6185:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    618c:	00 00 00 
    618f:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    6196:	00 00 00 
    6199:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    61a0:	00 00 00 
    61a3:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    61aa:	00 00 00 
    61ad:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    61b4:	00 00 00 
    61b7:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    61be:	00 00 00 
    61c1:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    61c7:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    61cd:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    61d4:	01 00 00 
    61d7:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    61de:	32 31 
    61e0:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    61e7:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    61ee:	00 00 00 
    61f1:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    61f8:	00 00 00 
    61fb:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    6202:	00 00 00 
    6205:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    620c:	00 00 00 
    620f:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    6216:	00 00 00 
    6219:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    6220:	00 00 00 
    6223:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    622a:	00 00 00 
    622d:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6233:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    6239:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    6240:	01 00 00 
    6243:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    624a:	32 32 
    624c:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    6253:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    625a:	00 00 00 
    625d:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    6264:	00 00 00 
    6267:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    626e:	00 00 00 
    6271:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    6278:	03 00 00 
    627b:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    6282:	00 00 00 
    6285:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    628c:	00 00 00 
    628f:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    6296:	00 00 00 
    6299:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    629f:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    62a5:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    62ac:	01 00 00 
    62af:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    62b6:	32 33 
    62b8:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    62bf:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    62c6:	00 00 00 
    62c9:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    62d0:	00 00 00 
    62d3:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    62da:	00 00 00 
    62dd:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    62e4:	1f 00 00 
    62e7:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    62ee:	00 00 00 
    62f1:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    62f8:	00 00 00 
    62fb:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    6302:	00 00 00 
    6305:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    630b:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    6311:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    6318:	01 00 00 
    631b:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    6322:	32 34 
    6324:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    632b:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    6332:	00 00 00 
    6335:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    633c:	00 00 00 
    633f:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    6346:	00 00 00 
    6349:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    6350:	00 00 00 
    6353:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    635a:	ff ff ff 
    635d:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    6364:	00 00 00 
    6367:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    636e:	00 00 00 
    6371:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6377:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    637d:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    6384:	02 00 00 
    6387:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    638e:	32 35 
    6390:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    6397:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    639e:	00 00 00 
    63a1:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    63a8:	00 00 00 
    63ab:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    63b2:	00 00 00 
    63b5:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    63bc:	00 00 00 
    63bf:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    63c6:	00 00 00 
    63c9:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    63d0:	00 00 00 
    63d3:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    63da:	00 00 00 
    63dd:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    63e3:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    63e9:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    63f0:	02 00 00 
    63f3:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    63fa:	32 36 
    63fc:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    6403:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    640a:	00 00 00 
    640d:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    6414:	00 00 00 
    6417:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    641e:	00 00 00 
    6421:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    6428:	00 00 00 
    642b:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    6432:	00 00 00 
    6435:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    643c:	00 00 00 
    643f:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    6446:	00 00 00 
    6449:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    644f:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    6455:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    645c:	02 00 00 
    645f:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    6466:	32 37 
    6468:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    646f:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    6476:	00 00 00 
    6479:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    6480:	00 00 00 
    6483:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    648a:	00 00 00 
    648d:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    6494:	00 00 00 
    6497:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    649e:	00 00 00 
    64a1:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    64a8:	00 00 00 
    64ab:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    64b2:	00 00 00 
    64b5:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    64bb:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    64c1:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    64c8:	02 00 00 
    64cb:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    64d2:	32 38 
    64d4:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    64db:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    64e2:	00 00 00 
    64e5:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    64ec:	00 00 00 
    64ef:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    64f6:	00 00 00 
    64f9:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    6500:	00 00 00 
    6503:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    650a:	00 00 00 
    650d:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    6514:	00 00 00 
    6517:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    651e:	00 00 00 
    6521:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6527:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    652d:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    6534:	02 00 00 
    6537:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    653e:	32 39 
    6540:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    6547:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    654e:	00 00 00 
    6551:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    6558:	00 00 00 
    655b:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    6562:	00 00 00 
    6565:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    656c:	01 00 00 
    656f:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    6576:	00 00 00 
    6579:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    6580:	00 00 00 
    6583:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    658a:	00 00 00 
    658d:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6593:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    6599:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    65a0:	02 00 00 
    65a3:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    65aa:	33 30 
    65ac:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    65b3:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    65ba:	00 00 00 
    65bd:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    65c4:	00 00 00 
    65c7:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    65ce:	00 00 00 
    65d1:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    65d8:	07 00 00 
    65db:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    65e2:	00 00 00 
    65e5:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    65ec:	00 00 00 
    65ef:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    65f6:	00 00 00 
    65f9:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    65ff:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    6605:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    660c:	02 00 00 
    660f:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    6616:	33 31 
    6618:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    661f:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    6626:	00 00 00 
    6629:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    6630:	00 00 00 
    6633:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    663a:	00 00 00 
    663d:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    6644:	1f 00 00 
    6647:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    664e:	00 00 00 
    6651:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    6658:	00 00 00 
    665b:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    6662:	00 00 00 
    6665:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    666b:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    6671:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    6678:	02 00 00 
    667b:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    6682:	33 32 
    6684:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    668b:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    6692:	00 00 00 
    6695:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    669c:	00 00 00 
    669f:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    66a6:	00 00 00 
    66a9:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    66b0:	00 00 00 
    66b3:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    66ba:	ff ff ff 
    66bd:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    66c4:	00 00 00 
    66c7:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    66ce:	00 00 00 
    66d1:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    66d7:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    66dd:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    66e4:	00 00 00 
    66e7:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    66ee:	33 33 
    66f0:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    66f7:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    66fe:	00 00 00 
    6701:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    6708:	00 00 00 
    670b:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    6712:	00 00 00 
    6715:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    671c:	00 00 00 
    671f:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    6726:	ff ff ff 
    6729:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    6730:	00 00 00 
    6733:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    673a:	00 00 00 
    673d:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    6743:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    6749:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    6750:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    6753:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    6759:	5b                   	pop    %ebx
    675a:	5e                   	pop    %esi
    675b:	5f                   	pop    %edi
    675c:	5d                   	pop    %ebp
    675d:	c3                   	ret    

0000675e <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    675e:	55                   	push   %ebp
    675f:	89 e5                	mov    %esp,%ebp
    6761:	83 ec 18             	sub    $0x18,%esp
  HUFFBITS level;
  int point = 0;
    6764:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    676b:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    6772:	a1 90 eb 00 00       	mov    0xeb90,%eax
    6777:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    677a:	8b 45 08             	mov    0x8(%ebp),%eax
    677d:	8b 40 20             	mov    0x20(%eax),%eax
    6780:	85 c0                	test   %eax,%eax
    6782:	75 0a                	jne    678e <huffman_decoder+0x30>
    6784:	b8 02 00 00 00       	mov    $0x2,%eax
    6789:	e9 15 03 00 00       	jmp    6aa3 <huffman_decoder+0x345>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    678e:	8b 45 08             	mov    0x8(%ebp),%eax
    6791:	8b 40 24             	mov    0x24(%eax),%eax
    6794:	85 c0                	test   %eax,%eax
    6796:	75 1d                	jne    67b5 <huffman_decoder+0x57>
  {  *x = *y = 0;
    6798:	8b 45 10             	mov    0x10(%ebp),%eax
    679b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    67a1:	8b 45 10             	mov    0x10(%ebp),%eax
    67a4:	8b 10                	mov    (%eax),%edx
    67a6:	8b 45 0c             	mov    0xc(%ebp),%eax
    67a9:	89 10                	mov    %edx,(%eax)
     return 0;
    67ab:	b8 00 00 00 00       	mov    $0x0,%eax
    67b0:	e9 ee 02 00 00       	jmp    6aa3 <huffman_decoder+0x345>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    67b5:	8b 45 08             	mov    0x8(%ebp),%eax
    67b8:	8b 40 20             	mov    0x20(%eax),%eax
    67bb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    67be:	01 d2                	add    %edx,%edx
    67c0:	01 d0                	add    %edx,%eax
    67c2:	0f b6 00             	movzbl (%eax),%eax
    67c5:	84 c0                	test   %al,%al
    67c7:	75 46                	jne    680f <huffman_decoder+0xb1>
      *x = h->val[point][1] >> 4;
    67c9:	8b 45 08             	mov    0x8(%ebp),%eax
    67cc:	8b 40 20             	mov    0x20(%eax),%eax
    67cf:	8b 55 f0             	mov    -0x10(%ebp),%edx
    67d2:	01 d2                	add    %edx,%edx
    67d4:	01 d0                	add    %edx,%eax
    67d6:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    67da:	c0 e8 04             	shr    $0x4,%al
    67dd:	0f b6 d0             	movzbl %al,%edx
    67e0:	8b 45 0c             	mov    0xc(%ebp),%eax
    67e3:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    67e5:	8b 45 08             	mov    0x8(%ebp),%eax
    67e8:	8b 40 20             	mov    0x20(%eax),%eax
    67eb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    67ee:	01 d2                	add    %edx,%edx
    67f0:	01 d0                	add    %edx,%eax
    67f2:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    67f6:	0f b6 c0             	movzbl %al,%eax
    67f9:	83 e0 0f             	and    $0xf,%eax
    67fc:	89 c2                	mov    %eax,%edx
    67fe:	8b 45 10             	mov    0x10(%ebp),%eax
    6801:	89 10                	mov    %edx,(%eax)

      error = 0;
    6803:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    680a:	e9 af 00 00 00       	jmp    68be <huffman_decoder+0x160>
    } 
    if (hget1bit()) {
    680f:	e8 4d e7 ff ff       	call   4f61 <hget1bit>
    6814:	85 c0                	test   %eax,%eax
    6816:	74 47                	je     685f <huffman_decoder+0x101>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    6818:	eb 17                	jmp    6831 <huffman_decoder+0xd3>
    681a:	8b 45 08             	mov    0x8(%ebp),%eax
    681d:	8b 40 20             	mov    0x20(%eax),%eax
    6820:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6823:	01 d2                	add    %edx,%edx
    6825:	01 d0                	add    %edx,%eax
    6827:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    682b:	0f b6 c0             	movzbl %al,%eax
    682e:	01 45 f0             	add    %eax,-0x10(%ebp)
    6831:	8b 45 08             	mov    0x8(%ebp),%eax
    6834:	8b 40 20             	mov    0x20(%eax),%eax
    6837:	8b 55 f0             	mov    -0x10(%ebp),%edx
    683a:	01 d2                	add    %edx,%edx
    683c:	01 d0                	add    %edx,%eax
    683e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6842:	3c f9                	cmp    $0xf9,%al
    6844:	77 d4                	ja     681a <huffman_decoder+0xbc>
      point += h->val[point][1];
    6846:	8b 45 08             	mov    0x8(%ebp),%eax
    6849:	8b 40 20             	mov    0x20(%eax),%eax
    684c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    684f:	01 d2                	add    %edx,%edx
    6851:	01 d0                	add    %edx,%eax
    6853:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6857:	0f b6 c0             	movzbl %al,%eax
    685a:	01 45 f0             	add    %eax,-0x10(%ebp)
    685d:	eb 42                	jmp    68a1 <huffman_decoder+0x143>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    685f:	eb 16                	jmp    6877 <huffman_decoder+0x119>
    6861:	8b 45 08             	mov    0x8(%ebp),%eax
    6864:	8b 40 20             	mov    0x20(%eax),%eax
    6867:	8b 55 f0             	mov    -0x10(%ebp),%edx
    686a:	01 d2                	add    %edx,%edx
    686c:	01 d0                	add    %edx,%eax
    686e:	0f b6 00             	movzbl (%eax),%eax
    6871:	0f b6 c0             	movzbl %al,%eax
    6874:	01 45 f0             	add    %eax,-0x10(%ebp)
    6877:	8b 45 08             	mov    0x8(%ebp),%eax
    687a:	8b 40 20             	mov    0x20(%eax),%eax
    687d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6880:	01 d2                	add    %edx,%edx
    6882:	01 d0                	add    %edx,%eax
    6884:	0f b6 00             	movzbl (%eax),%eax
    6887:	3c f9                	cmp    $0xf9,%al
    6889:	77 d6                	ja     6861 <huffman_decoder+0x103>
      point += h->val[point][0];
    688b:	8b 45 08             	mov    0x8(%ebp),%eax
    688e:	8b 40 20             	mov    0x20(%eax),%eax
    6891:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6894:	01 d2                	add    %edx,%edx
    6896:	01 d0                	add    %edx,%eax
    6898:	0f b6 00             	movzbl (%eax),%eax
    689b:	0f b6 c0             	movzbl %al,%eax
    689e:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    68a1:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    68a4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    68a8:	0f 85 07 ff ff ff    	jne    67b5 <huffman_decoder+0x57>
    68ae:	8b 55 f0             	mov    -0x10(%ebp),%edx
    68b1:	a1 e4 21 01 00       	mov    0x121e4,%eax
    68b6:	39 c2                	cmp    %eax,%edx
    68b8:	0f 82 f7 fe ff ff    	jb     67b5 <huffman_decoder+0x57>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    68be:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    68c2:	74 24                	je     68e8 <huffman_decoder+0x18a>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    68c4:	8b 45 08             	mov    0x8(%ebp),%eax
    68c7:	8b 40 04             	mov    0x4(%eax),%eax
    68ca:	83 e8 01             	sub    $0x1,%eax
    68cd:	01 c0                	add    %eax,%eax
    68cf:	89 c2                	mov    %eax,%edx
    68d1:	8b 45 0c             	mov    0xc(%ebp),%eax
    68d4:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    68d6:	8b 45 08             	mov    0x8(%ebp),%eax
    68d9:	8b 40 08             	mov    0x8(%eax),%eax
    68dc:	83 e8 01             	sub    $0x1,%eax
    68df:	01 c0                	add    %eax,%eax
    68e1:	89 c2                	mov    %eax,%edx
    68e3:	8b 45 10             	mov    0x10(%ebp),%eax
    68e6:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    68e8:	8b 45 08             	mov    0x8(%ebp),%eax
    68eb:	0f b6 00             	movzbl (%eax),%eax
    68ee:	3c 33                	cmp    $0x33,%al
    68f0:	0f 85 ec 00 00 00    	jne    69e2 <huffman_decoder+0x284>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    68f6:	8b 45 08             	mov    0x8(%ebp),%eax
    68f9:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    68fd:	3c 32                	cmp    $0x32,%al
    68ff:	74 0f                	je     6910 <huffman_decoder+0x1b2>
    6901:	8b 45 08             	mov    0x8(%ebp),%eax
    6904:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6908:	3c 33                	cmp    $0x33,%al
    690a:	0f 85 d2 00 00 00    	jne    69e2 <huffman_decoder+0x284>
     *v = (*y>>3) & 1;
    6910:	8b 45 10             	mov    0x10(%ebp),%eax
    6913:	8b 00                	mov    (%eax),%eax
    6915:	c1 f8 03             	sar    $0x3,%eax
    6918:	83 e0 01             	and    $0x1,%eax
    691b:	89 c2                	mov    %eax,%edx
    691d:	8b 45 14             	mov    0x14(%ebp),%eax
    6920:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    6922:	8b 45 10             	mov    0x10(%ebp),%eax
    6925:	8b 00                	mov    (%eax),%eax
    6927:	c1 f8 02             	sar    $0x2,%eax
    692a:	83 e0 01             	and    $0x1,%eax
    692d:	89 c2                	mov    %eax,%edx
    692f:	8b 45 18             	mov    0x18(%ebp),%eax
    6932:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    6934:	8b 45 10             	mov    0x10(%ebp),%eax
    6937:	8b 00                	mov    (%eax),%eax
    6939:	d1 f8                	sar    %eax
    693b:	83 e0 01             	and    $0x1,%eax
    693e:	89 c2                	mov    %eax,%edx
    6940:	8b 45 0c             	mov    0xc(%ebp),%eax
    6943:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    6945:	8b 45 10             	mov    0x10(%ebp),%eax
    6948:	8b 00                	mov    (%eax),%eax
    694a:	83 e0 01             	and    $0x1,%eax
    694d:	89 c2                	mov    %eax,%edx
    694f:	8b 45 10             	mov    0x10(%ebp),%eax
    6952:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    6954:	8b 45 14             	mov    0x14(%ebp),%eax
    6957:	8b 00                	mov    (%eax),%eax
    6959:	85 c0                	test   %eax,%eax
    695b:	74 18                	je     6975 <huffman_decoder+0x217>
        if (hget1bit() == 1) *v = -*v;
    695d:	e8 ff e5 ff ff       	call   4f61 <hget1bit>
    6962:	83 f8 01             	cmp    $0x1,%eax
    6965:	75 0e                	jne    6975 <huffman_decoder+0x217>
    6967:	8b 45 14             	mov    0x14(%ebp),%eax
    696a:	8b 00                	mov    (%eax),%eax
    696c:	f7 d8                	neg    %eax
    696e:	89 c2                	mov    %eax,%edx
    6970:	8b 45 14             	mov    0x14(%ebp),%eax
    6973:	89 10                	mov    %edx,(%eax)
     if (*w)
    6975:	8b 45 18             	mov    0x18(%ebp),%eax
    6978:	8b 00                	mov    (%eax),%eax
    697a:	85 c0                	test   %eax,%eax
    697c:	74 18                	je     6996 <huffman_decoder+0x238>
        if (hget1bit() == 1) *w = -*w;
    697e:	e8 de e5 ff ff       	call   4f61 <hget1bit>
    6983:	83 f8 01             	cmp    $0x1,%eax
    6986:	75 0e                	jne    6996 <huffman_decoder+0x238>
    6988:	8b 45 18             	mov    0x18(%ebp),%eax
    698b:	8b 00                	mov    (%eax),%eax
    698d:	f7 d8                	neg    %eax
    698f:	89 c2                	mov    %eax,%edx
    6991:	8b 45 18             	mov    0x18(%ebp),%eax
    6994:	89 10                	mov    %edx,(%eax)
     if (*x)
    6996:	8b 45 0c             	mov    0xc(%ebp),%eax
    6999:	8b 00                	mov    (%eax),%eax
    699b:	85 c0                	test   %eax,%eax
    699d:	74 18                	je     69b7 <huffman_decoder+0x259>
        if (hget1bit() == 1) *x = -*x;
    699f:	e8 bd e5 ff ff       	call   4f61 <hget1bit>
    69a4:	83 f8 01             	cmp    $0x1,%eax
    69a7:	75 0e                	jne    69b7 <huffman_decoder+0x259>
    69a9:	8b 45 0c             	mov    0xc(%ebp),%eax
    69ac:	8b 00                	mov    (%eax),%eax
    69ae:	f7 d8                	neg    %eax
    69b0:	89 c2                	mov    %eax,%edx
    69b2:	8b 45 0c             	mov    0xc(%ebp),%eax
    69b5:	89 10                	mov    %edx,(%eax)
     if (*y)
    69b7:	8b 45 10             	mov    0x10(%ebp),%eax
    69ba:	8b 00                	mov    (%eax),%eax
    69bc:	85 c0                	test   %eax,%eax
    69be:	74 1d                	je     69dd <huffman_decoder+0x27f>
        if (hget1bit() == 1) *y = -*y;
    69c0:	e8 9c e5 ff ff       	call   4f61 <hget1bit>
    69c5:	83 f8 01             	cmp    $0x1,%eax
    69c8:	75 13                	jne    69dd <huffman_decoder+0x27f>
    69ca:	8b 45 10             	mov    0x10(%ebp),%eax
    69cd:	8b 00                	mov    (%eax),%eax
    69cf:	f7 d8                	neg    %eax
    69d1:	89 c2                	mov    %eax,%edx
    69d3:	8b 45 10             	mov    0x10(%ebp),%eax
    69d6:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    69d8:	e9 c3 00 00 00       	jmp    6aa0 <huffman_decoder+0x342>
    69dd:	e9 be 00 00 00       	jmp    6aa0 <huffman_decoder+0x342>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    69e2:	8b 45 08             	mov    0x8(%ebp),%eax
    69e5:	8b 40 0c             	mov    0xc(%eax),%eax
    69e8:	85 c0                	test   %eax,%eax
    69ea:	74 34                	je     6a20 <huffman_decoder+0x2c2>
       if ((h->xlen-1) == *x) 
    69ec:	8b 45 08             	mov    0x8(%ebp),%eax
    69ef:	8b 40 04             	mov    0x4(%eax),%eax
    69f2:	8d 50 ff             	lea    -0x1(%eax),%edx
    69f5:	8b 45 0c             	mov    0xc(%ebp),%eax
    69f8:	8b 00                	mov    (%eax),%eax
    69fa:	39 c2                	cmp    %eax,%edx
    69fc:	75 22                	jne    6a20 <huffman_decoder+0x2c2>
         *x += hgetbits(h->linbits);
    69fe:	8b 45 08             	mov    0x8(%ebp),%eax
    6a01:	8b 40 0c             	mov    0xc(%eax),%eax
    6a04:	83 ec 0c             	sub    $0xc,%esp
    6a07:	50                   	push   %eax
    6a08:	e8 3c e5 ff ff       	call   4f49 <hgetbits>
    6a0d:	83 c4 10             	add    $0x10,%esp
    6a10:	89 c2                	mov    %eax,%edx
    6a12:	8b 45 0c             	mov    0xc(%ebp),%eax
    6a15:	8b 00                	mov    (%eax),%eax
    6a17:	01 d0                	add    %edx,%eax
    6a19:	89 c2                	mov    %eax,%edx
    6a1b:	8b 45 0c             	mov    0xc(%ebp),%eax
    6a1e:	89 10                	mov    %edx,(%eax)
     if (*x)
    6a20:	8b 45 0c             	mov    0xc(%ebp),%eax
    6a23:	8b 00                	mov    (%eax),%eax
    6a25:	85 c0                	test   %eax,%eax
    6a27:	74 18                	je     6a41 <huffman_decoder+0x2e3>
        if (hget1bit() == 1) *x = -*x;
    6a29:	e8 33 e5 ff ff       	call   4f61 <hget1bit>
    6a2e:	83 f8 01             	cmp    $0x1,%eax
    6a31:	75 0e                	jne    6a41 <huffman_decoder+0x2e3>
    6a33:	8b 45 0c             	mov    0xc(%ebp),%eax
    6a36:	8b 00                	mov    (%eax),%eax
    6a38:	f7 d8                	neg    %eax
    6a3a:	89 c2                	mov    %eax,%edx
    6a3c:	8b 45 0c             	mov    0xc(%ebp),%eax
    6a3f:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    6a41:	8b 45 08             	mov    0x8(%ebp),%eax
    6a44:	8b 40 0c             	mov    0xc(%eax),%eax
    6a47:	85 c0                	test   %eax,%eax
    6a49:	74 34                	je     6a7f <huffman_decoder+0x321>
       if ((h->ylen-1) == *y)
    6a4b:	8b 45 08             	mov    0x8(%ebp),%eax
    6a4e:	8b 40 08             	mov    0x8(%eax),%eax
    6a51:	8d 50 ff             	lea    -0x1(%eax),%edx
    6a54:	8b 45 10             	mov    0x10(%ebp),%eax
    6a57:	8b 00                	mov    (%eax),%eax
    6a59:	39 c2                	cmp    %eax,%edx
    6a5b:	75 22                	jne    6a7f <huffman_decoder+0x321>
         *y += hgetbits(h->linbits);
    6a5d:	8b 45 08             	mov    0x8(%ebp),%eax
    6a60:	8b 40 0c             	mov    0xc(%eax),%eax
    6a63:	83 ec 0c             	sub    $0xc,%esp
    6a66:	50                   	push   %eax
    6a67:	e8 dd e4 ff ff       	call   4f49 <hgetbits>
    6a6c:	83 c4 10             	add    $0x10,%esp
    6a6f:	89 c2                	mov    %eax,%edx
    6a71:	8b 45 10             	mov    0x10(%ebp),%eax
    6a74:	8b 00                	mov    (%eax),%eax
    6a76:	01 d0                	add    %edx,%eax
    6a78:	89 c2                	mov    %eax,%edx
    6a7a:	8b 45 10             	mov    0x10(%ebp),%eax
    6a7d:	89 10                	mov    %edx,(%eax)
     if (*y)
    6a7f:	8b 45 10             	mov    0x10(%ebp),%eax
    6a82:	8b 00                	mov    (%eax),%eax
    6a84:	85 c0                	test   %eax,%eax
    6a86:	74 18                	je     6aa0 <huffman_decoder+0x342>
        if (hget1bit() == 1) *y = -*y;
    6a88:	e8 d4 e4 ff ff       	call   4f61 <hget1bit>
    6a8d:	83 f8 01             	cmp    $0x1,%eax
    6a90:	75 0e                	jne    6aa0 <huffman_decoder+0x342>
    6a92:	8b 45 10             	mov    0x10(%ebp),%eax
    6a95:	8b 00                	mov    (%eax),%eax
    6a97:	f7 d8                	neg    %eax
    6a99:	89 c2                	mov    %eax,%edx
    6a9b:	8b 45 10             	mov    0x10(%ebp),%eax
    6a9e:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    6aa0:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    6aa3:	c9                   	leave  
    6aa4:	c3                   	ret    

00006aa5 <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    6aa5:	55                   	push   %ebp
    6aa6:	89 e5                	mov    %esp,%ebp
    6aa8:	83 ec 18             	sub    $0x18,%esp
    layer *hdr = fr_ps->header;
    6aab:	8b 45 0c             	mov    0xc(%ebp),%eax
    6aae:	8b 00                	mov    (%eax),%eax
    6ab0:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    6ab3:	83 ec 0c             	sub    $0xc,%esp
    6ab6:	ff 75 08             	pushl  0x8(%ebp)
    6ab9:	e8 19 e0 ff ff       	call   4ad7 <get1bit>
    6abe:	83 c4 10             	add    $0x10,%esp
    6ac1:	89 c2                	mov    %eax,%edx
    6ac3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6ac6:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    6ac8:	83 ec 08             	sub    $0x8,%esp
    6acb:	6a 02                	push   $0x2
    6acd:	ff 75 08             	pushl  0x8(%ebp)
    6ad0:	e8 16 e1 ff ff       	call   4beb <getbits>
    6ad5:	83 c4 10             	add    $0x10,%esp
    6ad8:	ba 04 00 00 00       	mov    $0x4,%edx
    6add:	29 c2                	sub    %eax,%edx
    6adf:	89 d0                	mov    %edx,%eax
    6ae1:	89 c2                	mov    %eax,%edx
    6ae3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6ae6:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    6ae9:	83 ec 0c             	sub    $0xc,%esp
    6aec:	ff 75 08             	pushl  0x8(%ebp)
    6aef:	e8 e3 df ff ff       	call   4ad7 <get1bit>
    6af4:	83 c4 10             	add    $0x10,%esp
    6af7:	85 c0                	test   %eax,%eax
    6af9:	0f 94 c0             	sete   %al
    6afc:	0f b6 d0             	movzbl %al,%edx
    6aff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6b02:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    6b05:	83 ec 08             	sub    $0x8,%esp
    6b08:	6a 04                	push   $0x4
    6b0a:	ff 75 08             	pushl  0x8(%ebp)
    6b0d:	e8 d9 e0 ff ff       	call   4beb <getbits>
    6b12:	83 c4 10             	add    $0x10,%esp
    6b15:	89 c2                	mov    %eax,%edx
    6b17:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6b1a:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    6b1d:	83 ec 08             	sub    $0x8,%esp
    6b20:	6a 02                	push   $0x2
    6b22:	ff 75 08             	pushl  0x8(%ebp)
    6b25:	e8 c1 e0 ff ff       	call   4beb <getbits>
    6b2a:	83 c4 10             	add    $0x10,%esp
    6b2d:	89 c2                	mov    %eax,%edx
    6b2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6b32:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    6b35:	83 ec 0c             	sub    $0xc,%esp
    6b38:	ff 75 08             	pushl  0x8(%ebp)
    6b3b:	e8 97 df ff ff       	call   4ad7 <get1bit>
    6b40:	83 c4 10             	add    $0x10,%esp
    6b43:	89 c2                	mov    %eax,%edx
    6b45:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6b48:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    6b4b:	83 ec 0c             	sub    $0xc,%esp
    6b4e:	ff 75 08             	pushl  0x8(%ebp)
    6b51:	e8 81 df ff ff       	call   4ad7 <get1bit>
    6b56:	83 c4 10             	add    $0x10,%esp
    6b59:	89 c2                	mov    %eax,%edx
    6b5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6b5e:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    6b61:	83 ec 08             	sub    $0x8,%esp
    6b64:	6a 02                	push   $0x2
    6b66:	ff 75 08             	pushl  0x8(%ebp)
    6b69:	e8 7d e0 ff ff       	call   4beb <getbits>
    6b6e:	83 c4 10             	add    $0x10,%esp
    6b71:	89 c2                	mov    %eax,%edx
    6b73:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6b76:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    6b79:	83 ec 08             	sub    $0x8,%esp
    6b7c:	6a 02                	push   $0x2
    6b7e:	ff 75 08             	pushl  0x8(%ebp)
    6b81:	e8 65 e0 ff ff       	call   4beb <getbits>
    6b86:	83 c4 10             	add    $0x10,%esp
    6b89:	89 c2                	mov    %eax,%edx
    6b8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6b8e:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    6b91:	83 ec 0c             	sub    $0xc,%esp
    6b94:	ff 75 08             	pushl  0x8(%ebp)
    6b97:	e8 3b df ff ff       	call   4ad7 <get1bit>
    6b9c:	83 c4 10             	add    $0x10,%esp
    6b9f:	89 c2                	mov    %eax,%edx
    6ba1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6ba4:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    6ba7:	83 ec 0c             	sub    $0xc,%esp
    6baa:	ff 75 08             	pushl  0x8(%ebp)
    6bad:	e8 25 df ff ff       	call   4ad7 <get1bit>
    6bb2:	83 c4 10             	add    $0x10,%esp
    6bb5:	89 c2                	mov    %eax,%edx
    6bb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6bba:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    6bbd:	83 ec 08             	sub    $0x8,%esp
    6bc0:	6a 02                	push   $0x2
    6bc2:	ff 75 08             	pushl  0x8(%ebp)
    6bc5:	e8 21 e0 ff ff       	call   4beb <getbits>
    6bca:	83 c4 10             	add    $0x10,%esp
    6bcd:	89 c2                	mov    %eax,%edx
    6bcf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6bd2:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    6bd5:	c9                   	leave  
    6bd6:	c3                   	ret    

00006bd7 <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    6bd7:	55                   	push   %ebp
    6bd8:	89 e5                	mov    %esp,%ebp
    6bda:	56                   	push   %esi
    6bdb:	53                   	push   %ebx
    6bdc:	83 ec 10             	sub    $0x10,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    6bdf:	8b 45 10             	mov    0x10(%ebp),%eax
    6be2:	8b 40 08             	mov    0x8(%eax),%eax
    6be5:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    6be8:	83 ec 08             	sub    $0x8,%esp
    6beb:	6a 09                	push   $0x9
    6bed:	ff 75 08             	pushl  0x8(%ebp)
    6bf0:	e8 f6 df ff ff       	call   4beb <getbits>
    6bf5:	83 c4 10             	add    $0x10,%esp
    6bf8:	89 c2                	mov    %eax,%edx
    6bfa:	8b 45 0c             	mov    0xc(%ebp),%eax
    6bfd:	89 10                	mov    %edx,(%eax)
	if (stereo == 1)
    6bff:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    6c03:	75 1a                	jne    6c1f <III_get_side_info+0x48>
		si->private_bits = getbits(bs,5);
    6c05:	83 ec 08             	sub    $0x8,%esp
    6c08:	6a 05                	push   $0x5
    6c0a:	ff 75 08             	pushl  0x8(%ebp)
    6c0d:	e8 d9 df ff ff       	call   4beb <getbits>
    6c12:	83 c4 10             	add    $0x10,%esp
    6c15:	89 c2                	mov    %eax,%edx
    6c17:	8b 45 0c             	mov    0xc(%ebp),%eax
    6c1a:	89 50 04             	mov    %edx,0x4(%eax)
    6c1d:	eb 18                	jmp    6c37 <III_get_side_info+0x60>
	else
		si->private_bits = getbits(bs,3);
    6c1f:	83 ec 08             	sub    $0x8,%esp
    6c22:	6a 03                	push   $0x3
    6c24:	ff 75 08             	pushl  0x8(%ebp)
    6c27:	e8 bf df ff ff       	call   4beb <getbits>
    6c2c:	83 c4 10             	add    $0x10,%esp
    6c2f:	89 c2                	mov    %eax,%edx
    6c31:	8b 45 0c             	mov    0xc(%ebp),%eax
    6c34:	89 50 04             	mov    %edx,0x4(%eax)

	for (ch=0; ch<stereo; ch++)
    6c37:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6c3e:	eb 40                	jmp    6c80 <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    6c40:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6c47:	eb 2d                	jmp    6c76 <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    6c49:	83 ec 0c             	sub    $0xc,%esp
    6c4c:	ff 75 08             	pushl  0x8(%ebp)
    6c4f:	e8 83 de ff ff       	call   4ad7 <get1bit>
    6c54:	83 c4 10             	add    $0x10,%esp
    6c57:	89 c3                	mov    %eax,%ebx
    6c59:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    6c5c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6c5f:	89 d0                	mov    %edx,%eax
    6c61:	c1 e0 02             	shl    $0x2,%eax
    6c64:	01 d0                	add    %edx,%eax
    6c66:	c1 e0 03             	shl    $0x3,%eax
    6c69:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6c6c:	01 d0                	add    %edx,%eax
    6c6e:	89 5c 81 08          	mov    %ebx,0x8(%ecx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    6c72:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6c76:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    6c7a:	7e cd                	jle    6c49 <III_get_side_info+0x72>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    6c7c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6c80:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6c83:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    6c86:	7c b8                	jl     6c40 <III_get_side_info+0x69>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    6c88:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    6c8f:	e9 cb 05 00 00       	jmp    725f <III_get_side_info+0x688>
		for (ch=0; ch<stereo; ch++) {
    6c94:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6c9b:	e9 af 05 00 00       	jmp    724f <III_get_side_info+0x678>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    6ca0:	83 ec 08             	sub    $0x8,%esp
    6ca3:	6a 0c                	push   $0xc
    6ca5:	ff 75 08             	pushl  0x8(%ebp)
    6ca8:	e8 3e df ff ff       	call   4beb <getbits>
    6cad:	83 c4 10             	add    $0x10,%esp
    6cb0:	89 c6                	mov    %eax,%esi
    6cb2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6cb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6cb8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6cbb:	89 c2                	mov    %eax,%edx
    6cbd:	c1 e2 03             	shl    $0x3,%edx
    6cc0:	01 c2                	add    %eax,%edx
    6cc2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6cc9:	89 c2                	mov    %eax,%edx
    6ccb:	89 c8                	mov    %ecx,%eax
    6ccd:	c1 e0 02             	shl    $0x2,%eax
    6cd0:	01 c8                	add    %ecx,%eax
    6cd2:	c1 e0 05             	shl    $0x5,%eax
    6cd5:	01 d0                	add    %edx,%eax
    6cd7:	01 d8                	add    %ebx,%eax
    6cd9:	83 c0 10             	add    $0x10,%eax
    6cdc:	89 70 08             	mov    %esi,0x8(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    6cdf:	83 ec 08             	sub    $0x8,%esp
    6ce2:	6a 09                	push   $0x9
    6ce4:	ff 75 08             	pushl  0x8(%ebp)
    6ce7:	e8 ff de ff ff       	call   4beb <getbits>
    6cec:	83 c4 10             	add    $0x10,%esp
    6cef:	89 c6                	mov    %eax,%esi
    6cf1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6cf4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6cf7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6cfa:	89 c2                	mov    %eax,%edx
    6cfc:	c1 e2 03             	shl    $0x3,%edx
    6cff:	01 c2                	add    %eax,%edx
    6d01:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6d08:	89 c2                	mov    %eax,%edx
    6d0a:	89 c8                	mov    %ecx,%eax
    6d0c:	c1 e0 02             	shl    $0x2,%eax
    6d0f:	01 c8                	add    %ecx,%eax
    6d11:	c1 e0 05             	shl    $0x5,%eax
    6d14:	01 d0                	add    %edx,%eax
    6d16:	01 d8                	add    %ebx,%eax
    6d18:	83 c0 10             	add    $0x10,%eax
    6d1b:	89 70 0c             	mov    %esi,0xc(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    6d1e:	83 ec 08             	sub    $0x8,%esp
    6d21:	6a 08                	push   $0x8
    6d23:	ff 75 08             	pushl  0x8(%ebp)
    6d26:	e8 c0 de ff ff       	call   4beb <getbits>
    6d2b:	83 c4 10             	add    $0x10,%esp
    6d2e:	89 c6                	mov    %eax,%esi
    6d30:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6d33:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6d36:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6d39:	89 c2                	mov    %eax,%edx
    6d3b:	c1 e2 03             	shl    $0x3,%edx
    6d3e:	01 c2                	add    %eax,%edx
    6d40:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6d47:	89 c2                	mov    %eax,%edx
    6d49:	89 c8                	mov    %ecx,%eax
    6d4b:	c1 e0 02             	shl    $0x2,%eax
    6d4e:	01 c8                	add    %ecx,%eax
    6d50:	c1 e0 05             	shl    $0x5,%eax
    6d53:	01 d0                	add    %edx,%eax
    6d55:	01 d8                	add    %ebx,%eax
    6d57:	83 c0 10             	add    $0x10,%eax
    6d5a:	89 70 10             	mov    %esi,0x10(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    6d5d:	83 ec 08             	sub    $0x8,%esp
    6d60:	6a 04                	push   $0x4
    6d62:	ff 75 08             	pushl  0x8(%ebp)
    6d65:	e8 81 de ff ff       	call   4beb <getbits>
    6d6a:	83 c4 10             	add    $0x10,%esp
    6d6d:	89 c6                	mov    %eax,%esi
    6d6f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6d72:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6d75:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6d78:	89 c2                	mov    %eax,%edx
    6d7a:	c1 e2 03             	shl    $0x3,%edx
    6d7d:	01 c2                	add    %eax,%edx
    6d7f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6d86:	89 c2                	mov    %eax,%edx
    6d88:	89 c8                	mov    %ecx,%eax
    6d8a:	c1 e0 02             	shl    $0x2,%eax
    6d8d:	01 c8                	add    %ecx,%eax
    6d8f:	c1 e0 05             	shl    $0x5,%eax
    6d92:	01 d0                	add    %edx,%eax
    6d94:	01 d8                	add    %ebx,%eax
    6d96:	83 c0 10             	add    $0x10,%eax
    6d99:	89 70 14             	mov    %esi,0x14(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    6d9c:	83 ec 0c             	sub    $0xc,%esp
    6d9f:	ff 75 08             	pushl  0x8(%ebp)
    6da2:	e8 30 dd ff ff       	call   4ad7 <get1bit>
    6da7:	83 c4 10             	add    $0x10,%esp
    6daa:	89 c6                	mov    %eax,%esi
    6dac:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6daf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6db2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6db5:	89 c2                	mov    %eax,%edx
    6db7:	c1 e2 03             	shl    $0x3,%edx
    6dba:	01 c2                	add    %eax,%edx
    6dbc:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6dc3:	89 c2                	mov    %eax,%edx
    6dc5:	89 c8                	mov    %ecx,%eax
    6dc7:	c1 e0 02             	shl    $0x2,%eax
    6dca:	01 c8                	add    %ecx,%eax
    6dcc:	c1 e0 05             	shl    $0x5,%eax
    6dcf:	01 d0                	add    %edx,%eax
    6dd1:	01 d8                	add    %ebx,%eax
    6dd3:	83 c0 20             	add    $0x20,%eax
    6dd6:	89 70 08             	mov    %esi,0x8(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    6dd9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6ddc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6ddf:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6de2:	89 c2                	mov    %eax,%edx
    6de4:	c1 e2 03             	shl    $0x3,%edx
    6de7:	01 c2                	add    %eax,%edx
    6de9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6df0:	89 c2                	mov    %eax,%edx
    6df2:	89 c8                	mov    %ecx,%eax
    6df4:	c1 e0 02             	shl    $0x2,%eax
    6df7:	01 c8                	add    %ecx,%eax
    6df9:	c1 e0 05             	shl    $0x5,%eax
    6dfc:	01 d0                	add    %edx,%eax
    6dfe:	01 d8                	add    %ebx,%eax
    6e00:	83 c0 20             	add    $0x20,%eax
    6e03:	8b 40 08             	mov    0x8(%eax),%eax
    6e06:	85 c0                	test   %eax,%eax
    6e08:	0f 84 85 02 00 00    	je     7093 <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    6e0e:	83 ec 08             	sub    $0x8,%esp
    6e11:	6a 02                	push   $0x2
    6e13:	ff 75 08             	pushl  0x8(%ebp)
    6e16:	e8 d0 dd ff ff       	call   4beb <getbits>
    6e1b:	83 c4 10             	add    $0x10,%esp
    6e1e:	89 c6                	mov    %eax,%esi
    6e20:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6e23:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6e26:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6e29:	89 c2                	mov    %eax,%edx
    6e2b:	c1 e2 03             	shl    $0x3,%edx
    6e2e:	01 c2                	add    %eax,%edx
    6e30:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6e37:	89 c2                	mov    %eax,%edx
    6e39:	89 c8                	mov    %ecx,%eax
    6e3b:	c1 e0 02             	shl    $0x2,%eax
    6e3e:	01 c8                	add    %ecx,%eax
    6e40:	c1 e0 05             	shl    $0x5,%eax
    6e43:	01 d0                	add    %edx,%eax
    6e45:	01 d8                	add    %ebx,%eax
    6e47:	83 c0 20             	add    $0x20,%eax
    6e4a:	89 70 0c             	mov    %esi,0xc(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    6e4d:	83 ec 0c             	sub    $0xc,%esp
    6e50:	ff 75 08             	pushl  0x8(%ebp)
    6e53:	e8 7f dc ff ff       	call   4ad7 <get1bit>
    6e58:	83 c4 10             	add    $0x10,%esp
    6e5b:	89 c6                	mov    %eax,%esi
    6e5d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6e60:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6e63:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6e66:	89 c2                	mov    %eax,%edx
    6e68:	c1 e2 03             	shl    $0x3,%edx
    6e6b:	01 c2                	add    %eax,%edx
    6e6d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6e74:	89 c2                	mov    %eax,%edx
    6e76:	89 c8                	mov    %ecx,%eax
    6e78:	c1 e0 02             	shl    $0x2,%eax
    6e7b:	01 c8                	add    %ecx,%eax
    6e7d:	c1 e0 05             	shl    $0x5,%eax
    6e80:	01 d0                	add    %edx,%eax
    6e82:	01 d8                	add    %ebx,%eax
    6e84:	83 c0 20             	add    $0x20,%eax
    6e87:	89 70 10             	mov    %esi,0x10(%eax)
				for (i=0; i<2; i++)
    6e8a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6e91:	eb 43                	jmp    6ed6 <III_get_side_info+0x2ff>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    6e93:	83 ec 08             	sub    $0x8,%esp
    6e96:	6a 05                	push   $0x5
    6e98:	ff 75 08             	pushl  0x8(%ebp)
    6e9b:	e8 4b dd ff ff       	call   4beb <getbits>
    6ea0:	83 c4 10             	add    $0x10,%esp
    6ea3:	89 c6                	mov    %eax,%esi
    6ea5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6ea8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6eab:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6eae:	89 c2                	mov    %eax,%edx
    6eb0:	c1 e2 03             	shl    $0x3,%edx
    6eb3:	01 c2                	add    %eax,%edx
    6eb5:	8d 04 12             	lea    (%edx,%edx,1),%eax
    6eb8:	89 c2                	mov    %eax,%edx
    6eba:	89 c8                	mov    %ecx,%eax
    6ebc:	c1 e0 02             	shl    $0x2,%eax
    6ebf:	01 c8                	add    %ecx,%eax
    6ec1:	c1 e0 03             	shl    $0x3,%eax
    6ec4:	01 c2                	add    %eax,%edx
    6ec6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6ec9:	01 d0                	add    %edx,%eax
    6ecb:	83 c0 08             	add    $0x8,%eax
    6ece:	89 74 83 14          	mov    %esi,0x14(%ebx,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    6ed2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6ed6:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    6eda:	7e b7                	jle    6e93 <III_get_side_info+0x2bc>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    6edc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6ee3:	eb 43                	jmp    6f28 <III_get_side_info+0x351>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    6ee5:	83 ec 08             	sub    $0x8,%esp
    6ee8:	6a 03                	push   $0x3
    6eea:	ff 75 08             	pushl  0x8(%ebp)
    6eed:	e8 f9 dc ff ff       	call   4beb <getbits>
    6ef2:	83 c4 10             	add    $0x10,%esp
    6ef5:	89 c6                	mov    %eax,%esi
    6ef7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6efa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6efd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6f00:	89 c2                	mov    %eax,%edx
    6f02:	c1 e2 03             	shl    $0x3,%edx
    6f05:	01 c2                	add    %eax,%edx
    6f07:	8d 04 12             	lea    (%edx,%edx,1),%eax
    6f0a:	89 c2                	mov    %eax,%edx
    6f0c:	89 c8                	mov    %ecx,%eax
    6f0e:	c1 e0 02             	shl    $0x2,%eax
    6f11:	01 c8                	add    %ecx,%eax
    6f13:	c1 e0 03             	shl    $0x3,%eax
    6f16:	01 c2                	add    %eax,%edx
    6f18:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6f1b:	01 d0                	add    %edx,%eax
    6f1d:	83 c0 0c             	add    $0xc,%eax
    6f20:	89 74 83 10          	mov    %esi,0x10(%ebx,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    6f24:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6f28:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    6f2c:	7e b7                	jle    6ee5 <III_get_side_info+0x30e>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    6f2e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6f31:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6f34:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6f37:	89 c2                	mov    %eax,%edx
    6f39:	c1 e2 03             	shl    $0x3,%edx
    6f3c:	01 c2                	add    %eax,%edx
    6f3e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6f45:	89 c2                	mov    %eax,%edx
    6f47:	89 c8                	mov    %ecx,%eax
    6f49:	c1 e0 02             	shl    $0x2,%eax
    6f4c:	01 c8                	add    %ecx,%eax
    6f4e:	c1 e0 05             	shl    $0x5,%eax
    6f51:	01 d0                	add    %edx,%eax
    6f53:	01 d8                	add    %ebx,%eax
    6f55:	83 c0 20             	add    $0x20,%eax
    6f58:	8b 40 0c             	mov    0xc(%eax),%eax
    6f5b:	85 c0                	test   %eax,%eax
    6f5d:	75 05                	jne    6f64 <III_get_side_info+0x38d>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    6f5f:	e8 74 cc ff ff       	call   3bd8 <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    6f64:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6f67:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6f6a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6f6d:	89 c2                	mov    %eax,%edx
    6f6f:	c1 e2 03             	shl    $0x3,%edx
    6f72:	01 c2                	add    %eax,%edx
    6f74:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6f7b:	89 c2                	mov    %eax,%edx
    6f7d:	89 c8                	mov    %ecx,%eax
    6f7f:	c1 e0 02             	shl    $0x2,%eax
    6f82:	01 c8                	add    %ecx,%eax
    6f84:	c1 e0 05             	shl    $0x5,%eax
    6f87:	01 d0                	add    %edx,%eax
    6f89:	01 d8                	add    %ebx,%eax
    6f8b:	83 c0 20             	add    $0x20,%eax
    6f8e:	8b 40 0c             	mov    0xc(%eax),%eax
    6f91:	83 f8 02             	cmp    $0x2,%eax
    6f94:	75 64                	jne    6ffa <III_get_side_info+0x423>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    6f96:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6f99:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6f9c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6f9f:	89 c2                	mov    %eax,%edx
    6fa1:	c1 e2 03             	shl    $0x3,%edx
    6fa4:	01 c2                	add    %eax,%edx
    6fa6:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6fad:	89 c2                	mov    %eax,%edx
    6faf:	89 c8                	mov    %ecx,%eax
    6fb1:	c1 e0 02             	shl    $0x2,%eax
    6fb4:	01 c8                	add    %ecx,%eax
    6fb6:	c1 e0 05             	shl    $0x5,%eax
    6fb9:	01 d0                	add    %edx,%eax
    6fbb:	01 d8                	add    %ebx,%eax
    6fbd:	83 c0 20             	add    $0x20,%eax
    6fc0:	8b 40 10             	mov    0x10(%eax),%eax
    6fc3:	85 c0                	test   %eax,%eax
    6fc5:	75 33                	jne    6ffa <III_get_side_info+0x423>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    6fc7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6fca:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6fcd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6fd0:	89 c2                	mov    %eax,%edx
    6fd2:	c1 e2 03             	shl    $0x3,%edx
    6fd5:	01 c2                	add    %eax,%edx
    6fd7:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6fde:	89 c2                	mov    %eax,%edx
    6fe0:	89 c8                	mov    %ecx,%eax
    6fe2:	c1 e0 02             	shl    $0x2,%eax
    6fe5:	01 c8                	add    %ecx,%eax
    6fe7:	c1 e0 05             	shl    $0x5,%eax
    6fea:	01 d0                	add    %edx,%eax
    6fec:	01 d8                	add    %ebx,%eax
    6fee:	83 c0 40             	add    $0x40,%eax
    6ff1:	c7 40 0c 08 00 00 00 	movl   $0x8,0xc(%eax)
    6ff8:	eb 31                	jmp    702b <III_get_side_info+0x454>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    6ffa:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6ffd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7000:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7003:	89 c2                	mov    %eax,%edx
    7005:	c1 e2 03             	shl    $0x3,%edx
    7008:	01 c2                	add    %eax,%edx
    700a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7011:	89 c2                	mov    %eax,%edx
    7013:	89 c8                	mov    %ecx,%eax
    7015:	c1 e0 02             	shl    $0x2,%eax
    7018:	01 c8                	add    %ecx,%eax
    701a:	c1 e0 05             	shl    $0x5,%eax
    701d:	01 d0                	add    %edx,%eax
    701f:	01 d8                	add    %ebx,%eax
    7021:	83 c0 40             	add    $0x40,%eax
    7024:	c7 40 0c 07 00 00 00 	movl   $0x7,0xc(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    702b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    702e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7031:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7034:	89 c2                	mov    %eax,%edx
    7036:	c1 e2 03             	shl    $0x3,%edx
    7039:	01 c2                	add    %eax,%edx
    703b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7042:	89 c2                	mov    %eax,%edx
    7044:	89 c8                	mov    %ecx,%eax
    7046:	c1 e0 02             	shl    $0x2,%eax
    7049:	01 c8                	add    %ecx,%eax
    704b:	c1 e0 05             	shl    $0x5,%eax
    704e:	01 d0                	add    %edx,%eax
    7050:	01 d8                	add    %ebx,%eax
    7052:	83 c0 40             	add    $0x40,%eax
    7055:	8b 40 0c             	mov    0xc(%eax),%eax
    7058:	ba 14 00 00 00       	mov    $0x14,%edx
    705d:	89 d3                	mov    %edx,%ebx
    705f:	29 c3                	sub    %eax,%ebx
    7061:	8b 75 0c             	mov    0xc(%ebp),%esi
    7064:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7067:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    706a:	89 c2                	mov    %eax,%edx
    706c:	c1 e2 03             	shl    $0x3,%edx
    706f:	01 c2                	add    %eax,%edx
    7071:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7078:	89 c2                	mov    %eax,%edx
    707a:	89 c8                	mov    %ecx,%eax
    707c:	c1 e0 02             	shl    $0x2,%eax
    707f:	01 c8                	add    %ecx,%eax
    7081:	c1 e0 05             	shl    $0x5,%eax
    7084:	01 d0                	add    %edx,%eax
    7086:	01 f0                	add    %esi,%eax
    7088:	83 c0 40             	add    $0x40,%eax
    708b:	89 58 10             	mov    %ebx,0x10(%eax)
    708e:	e9 01 01 00 00       	jmp    7194 <III_get_side_info+0x5bd>
			}
			else {
				for (i=0; i<3; i++)
    7093:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    709a:	eb 43                	jmp    70df <III_get_side_info+0x508>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    709c:	83 ec 08             	sub    $0x8,%esp
    709f:	6a 05                	push   $0x5
    70a1:	ff 75 08             	pushl  0x8(%ebp)
    70a4:	e8 42 db ff ff       	call   4beb <getbits>
    70a9:	83 c4 10             	add    $0x10,%esp
    70ac:	89 c6                	mov    %eax,%esi
    70ae:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    70b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    70b4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    70b7:	89 c2                	mov    %eax,%edx
    70b9:	c1 e2 03             	shl    $0x3,%edx
    70bc:	01 c2                	add    %eax,%edx
    70be:	8d 04 12             	lea    (%edx,%edx,1),%eax
    70c1:	89 c2                	mov    %eax,%edx
    70c3:	89 c8                	mov    %ecx,%eax
    70c5:	c1 e0 02             	shl    $0x2,%eax
    70c8:	01 c8                	add    %ecx,%eax
    70ca:	c1 e0 03             	shl    $0x3,%eax
    70cd:	01 c2                	add    %eax,%edx
    70cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    70d2:	01 d0                	add    %edx,%eax
    70d4:	83 c0 08             	add    $0x8,%eax
    70d7:	89 74 83 14          	mov    %esi,0x14(%ebx,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    70db:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    70df:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    70e3:	7e b7                	jle    709c <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    70e5:	83 ec 08             	sub    $0x8,%esp
    70e8:	6a 04                	push   $0x4
    70ea:	ff 75 08             	pushl  0x8(%ebp)
    70ed:	e8 f9 da ff ff       	call   4beb <getbits>
    70f2:	83 c4 10             	add    $0x10,%esp
    70f5:	89 c6                	mov    %eax,%esi
    70f7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    70fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    70fd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7100:	89 c2                	mov    %eax,%edx
    7102:	c1 e2 03             	shl    $0x3,%edx
    7105:	01 c2                	add    %eax,%edx
    7107:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    710e:	89 c2                	mov    %eax,%edx
    7110:	89 c8                	mov    %ecx,%eax
    7112:	c1 e0 02             	shl    $0x2,%eax
    7115:	01 c8                	add    %ecx,%eax
    7117:	c1 e0 05             	shl    $0x5,%eax
    711a:	01 d0                	add    %edx,%eax
    711c:	01 d8                	add    %ebx,%eax
    711e:	83 c0 40             	add    $0x40,%eax
    7121:	89 70 0c             	mov    %esi,0xc(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    7124:	83 ec 08             	sub    $0x8,%esp
    7127:	6a 03                	push   $0x3
    7129:	ff 75 08             	pushl  0x8(%ebp)
    712c:	e8 ba da ff ff       	call   4beb <getbits>
    7131:	83 c4 10             	add    $0x10,%esp
    7134:	89 c6                	mov    %eax,%esi
    7136:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7139:	8b 45 f0             	mov    -0x10(%ebp),%eax
    713c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    713f:	89 c2                	mov    %eax,%edx
    7141:	c1 e2 03             	shl    $0x3,%edx
    7144:	01 c2                	add    %eax,%edx
    7146:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    714d:	89 c2                	mov    %eax,%edx
    714f:	89 c8                	mov    %ecx,%eax
    7151:	c1 e0 02             	shl    $0x2,%eax
    7154:	01 c8                	add    %ecx,%eax
    7156:	c1 e0 05             	shl    $0x5,%eax
    7159:	01 d0                	add    %edx,%eax
    715b:	01 d8                	add    %ebx,%eax
    715d:	83 c0 40             	add    $0x40,%eax
    7160:	89 70 10             	mov    %esi,0x10(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    7163:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7166:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7169:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    716c:	89 c2                	mov    %eax,%edx
    716e:	c1 e2 03             	shl    $0x3,%edx
    7171:	01 c2                	add    %eax,%edx
    7173:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    717a:	89 c2                	mov    %eax,%edx
    717c:	89 c8                	mov    %ecx,%eax
    717e:	c1 e0 02             	shl    $0x2,%eax
    7181:	01 c8                	add    %ecx,%eax
    7183:	c1 e0 05             	shl    $0x5,%eax
    7186:	01 d0                	add    %edx,%eax
    7188:	01 d8                	add    %ebx,%eax
    718a:	83 c0 20             	add    $0x20,%eax
    718d:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    7194:	83 ec 0c             	sub    $0xc,%esp
    7197:	ff 75 08             	pushl  0x8(%ebp)
    719a:	e8 38 d9 ff ff       	call   4ad7 <get1bit>
    719f:	83 c4 10             	add    $0x10,%esp
    71a2:	89 c6                	mov    %eax,%esi
    71a4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    71a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    71aa:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    71ad:	89 c2                	mov    %eax,%edx
    71af:	c1 e2 03             	shl    $0x3,%edx
    71b2:	01 c2                	add    %eax,%edx
    71b4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    71bb:	89 c2                	mov    %eax,%edx
    71bd:	89 c8                	mov    %ecx,%eax
    71bf:	c1 e0 02             	shl    $0x2,%eax
    71c2:	01 c8                	add    %ecx,%eax
    71c4:	c1 e0 05             	shl    $0x5,%eax
    71c7:	01 d0                	add    %edx,%eax
    71c9:	01 d8                	add    %ebx,%eax
    71cb:	83 c0 40             	add    $0x40,%eax
    71ce:	89 70 14             	mov    %esi,0x14(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    71d1:	83 ec 0c             	sub    $0xc,%esp
    71d4:	ff 75 08             	pushl  0x8(%ebp)
    71d7:	e8 fb d8 ff ff       	call   4ad7 <get1bit>
    71dc:	83 c4 10             	add    $0x10,%esp
    71df:	89 c6                	mov    %eax,%esi
    71e1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    71e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    71e7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    71ea:	89 c2                	mov    %eax,%edx
    71ec:	c1 e2 03             	shl    $0x3,%edx
    71ef:	01 c2                	add    %eax,%edx
    71f1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    71f8:	89 c2                	mov    %eax,%edx
    71fa:	89 c8                	mov    %ecx,%eax
    71fc:	c1 e0 02             	shl    $0x2,%eax
    71ff:	01 c8                	add    %ecx,%eax
    7201:	c1 e0 05             	shl    $0x5,%eax
    7204:	01 d0                	add    %edx,%eax
    7206:	01 d8                	add    %ebx,%eax
    7208:	83 c0 50             	add    $0x50,%eax
    720b:	89 70 08             	mov    %esi,0x8(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    720e:	83 ec 0c             	sub    $0xc,%esp
    7211:	ff 75 08             	pushl  0x8(%ebp)
    7214:	e8 be d8 ff ff       	call   4ad7 <get1bit>
    7219:	83 c4 10             	add    $0x10,%esp
    721c:	89 c6                	mov    %eax,%esi
    721e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7221:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7224:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7227:	89 c2                	mov    %eax,%edx
    7229:	c1 e2 03             	shl    $0x3,%edx
    722c:	01 c2                	add    %eax,%edx
    722e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7235:	89 c2                	mov    %eax,%edx
    7237:	89 c8                	mov    %ecx,%eax
    7239:	c1 e0 02             	shl    $0x2,%eax
    723c:	01 c8                	add    %ecx,%eax
    723e:	c1 e0 05             	shl    $0x5,%eax
    7241:	01 d0                	add    %edx,%eax
    7243:	01 d8                	add    %ebx,%eax
    7245:	83 c0 50             	add    $0x50,%eax
    7248:	89 70 0c             	mov    %esi,0xc(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    724b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    724f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7252:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    7255:	0f 8c 45 fa ff ff    	jl     6ca0 <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    725b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    725f:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7263:	0f 8e 2b fa ff ff    	jle    6c94 <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    7269:	8d 65 f8             	lea    -0x8(%ebp),%esp
    726c:	5b                   	pop    %ebx
    726d:	5e                   	pop    %esi
    726e:	5d                   	pop    %ebp
    726f:	c3                   	ret    

00007270 <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    7270:	55                   	push   %ebp
    7271:	89 e5                	mov    %esp,%ebp
    7273:	56                   	push   %esi
    7274:	53                   	push   %ebx
    7275:	83 ec 10             	sub    $0x10,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    7278:	8b 45 10             	mov    0x10(%ebp),%eax
    727b:	89 c2                	mov    %eax,%edx
    727d:	c1 e2 03             	shl    $0x3,%edx
    7280:	01 c2                	add    %eax,%edx
    7282:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7289:	89 c2                	mov    %eax,%edx
    728b:	8b 4d 14             	mov    0x14(%ebp),%ecx
    728e:	89 c8                	mov    %ecx,%eax
    7290:	c1 e0 02             	shl    $0x2,%eax
    7293:	01 c8                	add    %ecx,%eax
    7295:	c1 e0 05             	shl    $0x5,%eax
    7298:	01 d0                	add    %edx,%eax
    729a:	8d 50 10             	lea    0x10(%eax),%edx
    729d:	8b 45 0c             	mov    0xc(%ebp),%eax
    72a0:	01 d0                	add    %edx,%eax
    72a2:	83 c0 08             	add    $0x8,%eax
    72a5:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    72a8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    72ab:	8b 40 10             	mov    0x10(%eax),%eax
    72ae:	85 c0                	test   %eax,%eax
    72b0:	0f 84 93 02 00 00    	je     7549 <III_get_scale_factors+0x2d9>
    72b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    72b9:	8b 40 14             	mov    0x14(%eax),%eax
    72bc:	83 f8 02             	cmp    $0x2,%eax
    72bf:	0f 85 84 02 00 00    	jne    7549 <III_get_scale_factors+0x2d9>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    72c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    72c8:	8b 40 18             	mov    0x18(%eax),%eax
    72cb:	85 c0                	test   %eax,%eax
    72cd:	0f 84 7c 01 00 00    	je     744f <III_get_scale_factors+0x1df>
			for (sfb = 0; sfb < 8; sfb++)
    72d3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    72da:	eb 3b                	jmp    7317 <III_get_scale_factors+0xa7>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    72dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    72df:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    72e2:	8b 04 85 00 ec 00 00 	mov    0xec00(,%eax,4),%eax
    72e9:	83 ec 0c             	sub    $0xc,%esp
    72ec:	50                   	push   %eax
    72ed:	e8 57 dc ff ff       	call   4f49 <hgetbits>
    72f2:	83 c4 10             	add    $0x10,%esp
    72f5:	89 c3                	mov    %eax,%ebx
    72f7:	8b 4d 08             	mov    0x8(%ebp),%ecx
    72fa:	8b 45 14             	mov    0x14(%ebp),%eax
    72fd:	89 c2                	mov    %eax,%edx
    72ff:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7302:	89 c2                	mov    %eax,%edx
    7304:	89 d0                	mov    %edx,%eax
    7306:	c1 e0 05             	shl    $0x5,%eax
    7309:	29 d0                	sub    %edx,%eax
    730b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    730e:	01 d0                	add    %edx,%eax
    7310:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    7313:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7317:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    731b:	7e bf                	jle    72dc <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    731d:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    7324:	eb 60                	jmp    7386 <III_get_scale_factors+0x116>
				for (window=0; window<3; window++)
    7326:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    732d:	eb 4d                	jmp    737c <III_get_scale_factors+0x10c>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    732f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7332:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    7335:	8b 04 85 00 ec 00 00 	mov    0xec00(,%eax,4),%eax
    733c:	83 ec 0c             	sub    $0xc,%esp
    733f:	50                   	push   %eax
    7340:	e8 04 dc ff ff       	call   4f49 <hgetbits>
    7345:	83 c4 10             	add    $0x10,%esp
    7348:	89 c6                	mov    %eax,%esi
    734a:	8b 5d 08             	mov    0x8(%ebp),%ebx
    734d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7350:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7353:	89 d0                	mov    %edx,%eax
    7355:	01 c0                	add    %eax,%eax
    7357:	01 d0                	add    %edx,%eax
    7359:	c1 e0 02             	shl    $0x2,%eax
    735c:	01 d0                	add    %edx,%eax
    735e:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    7361:	89 d1                	mov    %edx,%ecx
    7363:	89 ca                	mov    %ecx,%edx
    7365:	c1 e2 05             	shl    $0x5,%edx
    7368:	29 ca                	sub    %ecx,%edx
    736a:	01 c2                	add    %eax,%edx
    736c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    736f:	01 d0                	add    %edx,%eax
    7371:	83 c0 14             	add    $0x14,%eax
    7374:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    7378:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    737c:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7380:	7e ad                	jle    732f <III_get_scale_factors+0xbf>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    7382:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7386:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    738a:	7e 9a                	jle    7326 <III_get_scale_factors+0xb6>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    738c:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    7393:	eb 63                	jmp    73f8 <III_get_scale_factors+0x188>
				for (window=0; window<3; window++)
    7395:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    739c:	eb 50                	jmp    73ee <III_get_scale_factors+0x17e>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    739e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    73a1:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    73a4:	83 c0 10             	add    $0x10,%eax
    73a7:	8b 04 85 00 ec 00 00 	mov    0xec00(,%eax,4),%eax
    73ae:	83 ec 0c             	sub    $0xc,%esp
    73b1:	50                   	push   %eax
    73b2:	e8 92 db ff ff       	call   4f49 <hgetbits>
    73b7:	83 c4 10             	add    $0x10,%esp
    73ba:	89 c6                	mov    %eax,%esi
    73bc:	8b 5d 08             	mov    0x8(%ebp),%ebx
    73bf:	8b 55 ec             	mov    -0x14(%ebp),%edx
    73c2:	8b 4d 14             	mov    0x14(%ebp),%ecx
    73c5:	89 d0                	mov    %edx,%eax
    73c7:	01 c0                	add    %eax,%eax
    73c9:	01 d0                	add    %edx,%eax
    73cb:	c1 e0 02             	shl    $0x2,%eax
    73ce:	01 d0                	add    %edx,%eax
    73d0:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    73d3:	89 d1                	mov    %edx,%ecx
    73d5:	89 ca                	mov    %ecx,%edx
    73d7:	c1 e2 05             	shl    $0x5,%edx
    73da:	29 ca                	sub    %ecx,%edx
    73dc:	01 c2                	add    %eax,%edx
    73de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    73e1:	01 d0                	add    %edx,%eax
    73e3:	83 c0 14             	add    $0x14,%eax
    73e6:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    73ea:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    73ee:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    73f2:	7e aa                	jle    739e <III_get_scale_factors+0x12e>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    73f4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    73f8:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    73fc:	7e 97                	jle    7395 <III_get_scale_factors+0x125>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    73fe:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7405:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    740c:	eb 36                	jmp    7444 <III_get_scale_factors+0x1d4>
				(*scalefac)[ch].s[window][sfb] = 0;
    740e:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7411:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7414:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7417:	89 d0                	mov    %edx,%eax
    7419:	01 c0                	add    %eax,%eax
    741b:	01 d0                	add    %edx,%eax
    741d:	c1 e0 02             	shl    $0x2,%eax
    7420:	01 d0                	add    %edx,%eax
    7422:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    7425:	89 d1                	mov    %edx,%ecx
    7427:	89 ca                	mov    %ecx,%edx
    7429:	c1 e2 05             	shl    $0x5,%edx
    742c:	29 ca                	sub    %ecx,%edx
    742e:	01 c2                	add    %eax,%edx
    7430:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7433:	01 d0                	add    %edx,%eax
    7435:	83 c0 14             	add    $0x14,%eax
    7438:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    743f:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    7440:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7444:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7448:	7e c4                	jle    740e <III_get_scale_factors+0x19e>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    744a:	e9 bf 01 00 00       	jmp    760e <III_get_scale_factors+0x39e>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    744f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7456:	e9 93 00 00 00       	jmp    74ee <III_get_scale_factors+0x27e>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    745b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    745e:	83 c0 04             	add    $0x4,%eax
    7461:	8b 04 85 c4 eb 00 00 	mov    0xebc4(,%eax,4),%eax
    7468:	89 45 f4             	mov    %eax,-0xc(%ebp)
    746b:	eb 68                	jmp    74d5 <III_get_scale_factors+0x265>
					for (window=0; window<3; window++)
    746d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7474:	eb 55                	jmp    74cb <III_get_scale_factors+0x25b>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    7476:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7479:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    747c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    747f:	c1 e2 04             	shl    $0x4,%edx
    7482:	01 d0                	add    %edx,%eax
    7484:	8b 04 85 00 ec 00 00 	mov    0xec00(,%eax,4),%eax
    748b:	83 ec 0c             	sub    $0xc,%esp
    748e:	50                   	push   %eax
    748f:	e8 b5 da ff ff       	call   4f49 <hgetbits>
    7494:	83 c4 10             	add    $0x10,%esp
    7497:	89 c6                	mov    %eax,%esi
    7499:	8b 5d 08             	mov    0x8(%ebp),%ebx
    749c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    749f:	8b 4d 14             	mov    0x14(%ebp),%ecx
    74a2:	89 d0                	mov    %edx,%eax
    74a4:	01 c0                	add    %eax,%eax
    74a6:	01 d0                	add    %edx,%eax
    74a8:	c1 e0 02             	shl    $0x2,%eax
    74ab:	01 d0                	add    %edx,%eax
    74ad:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    74b0:	89 d1                	mov    %edx,%ecx
    74b2:	89 ca                	mov    %ecx,%edx
    74b4:	c1 e2 05             	shl    $0x5,%edx
    74b7:	29 ca                	sub    %ecx,%edx
    74b9:	01 c2                	add    %eax,%edx
    74bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    74be:	01 d0                	add    %edx,%eax
    74c0:	83 c0 14             	add    $0x14,%eax
    74c3:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    74c7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    74cb:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    74cf:	7e a5                	jle    7476 <III_get_scale_factors+0x206>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    74d1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    74d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    74d8:	83 c0 01             	add    $0x1,%eax
    74db:	83 c0 04             	add    $0x4,%eax
    74de:	8b 04 85 c4 eb 00 00 	mov    0xebc4(,%eax,4),%eax
    74e5:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    74e8:	7f 83                	jg     746d <III_get_scale_factors+0x1fd>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    74ea:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    74ee:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    74f2:	0f 8e 63 ff ff ff    	jle    745b <III_get_scale_factors+0x1eb>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    74f8:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    74ff:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7506:	eb 36                	jmp    753e <III_get_scale_factors+0x2ce>
					(*scalefac)[ch].s[window][sfb] = 0;
    7508:	8b 5d 08             	mov    0x8(%ebp),%ebx
    750b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    750e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7511:	89 d0                	mov    %edx,%eax
    7513:	01 c0                	add    %eax,%eax
    7515:	01 d0                	add    %edx,%eax
    7517:	c1 e0 02             	shl    $0x2,%eax
    751a:	01 d0                	add    %edx,%eax
    751c:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    751f:	89 d1                	mov    %edx,%ecx
    7521:	89 ca                	mov    %ecx,%edx
    7523:	c1 e2 05             	shl    $0x5,%edx
    7526:	29 ca                	sub    %ecx,%edx
    7528:	01 c2                	add    %eax,%edx
    752a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    752d:	01 d0                	add    %edx,%eax
    752f:	83 c0 14             	add    $0x14,%eax
    7532:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    7539:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    753a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    753e:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7542:	7e c4                	jle    7508 <III_get_scale_factors+0x298>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    7544:	e9 c5 00 00 00       	jmp    760e <III_get_scale_factors+0x39e>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    7549:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7550:	e9 92 00 00 00       	jmp    75e7 <III_get_scale_factors+0x377>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    7555:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7558:	8b 55 14             	mov    0x14(%ebp),%edx
    755b:	89 d0                	mov    %edx,%eax
    755d:	c1 e0 02             	shl    $0x2,%eax
    7560:	01 d0                	add    %edx,%eax
    7562:	c1 e0 03             	shl    $0x3,%eax
    7565:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7568:	01 d0                	add    %edx,%eax
    756a:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    756e:	85 c0                	test   %eax,%eax
    7570:	74 06                	je     7578 <III_get_scale_factors+0x308>
    7572:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    7576:	75 6b                	jne    75e3 <III_get_scale_factors+0x373>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    7578:	8b 45 f0             	mov    -0x10(%ebp),%eax
    757b:	8b 04 85 c0 eb 00 00 	mov    0xebc0(,%eax,4),%eax
    7582:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7585:	eb 4a                	jmp    75d1 <III_get_scale_factors+0x361>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    7587:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    758b:	0f 9f c0             	setg   %al
    758e:	0f b6 d0             	movzbl %al,%edx
    7591:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7594:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    7597:	c1 e2 04             	shl    $0x4,%edx
    759a:	01 d0                	add    %edx,%eax
    759c:	8b 04 85 00 ec 00 00 	mov    0xec00(,%eax,4),%eax
    75a3:	83 ec 0c             	sub    $0xc,%esp
    75a6:	50                   	push   %eax
    75a7:	e8 9d d9 ff ff       	call   4f49 <hgetbits>
    75ac:	83 c4 10             	add    $0x10,%esp
    75af:	89 c3                	mov    %eax,%ebx
    75b1:	8b 4d 08             	mov    0x8(%ebp),%ecx
    75b4:	8b 45 14             	mov    0x14(%ebp),%eax
    75b7:	89 c2                	mov    %eax,%edx
    75b9:	8d 04 12             	lea    (%edx,%edx,1),%eax
    75bc:	89 c2                	mov    %eax,%edx
    75be:	89 d0                	mov    %edx,%eax
    75c0:	c1 e0 05             	shl    $0x5,%eax
    75c3:	29 d0                	sub    %edx,%eax
    75c5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    75c8:	01 d0                	add    %edx,%eax
    75ca:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    75cd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    75d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    75d4:	83 c0 01             	add    $0x1,%eax
    75d7:	8b 04 85 c0 eb 00 00 	mov    0xebc0(,%eax,4),%eax
    75de:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    75e1:	7f a4                	jg     7587 <III_get_scale_factors+0x317>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    75e3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    75e7:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    75eb:	0f 8e 64 ff ff ff    	jle    7555 <III_get_scale_factors+0x2e5>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    75f1:	8b 55 08             	mov    0x8(%ebp),%edx
    75f4:	8b 45 14             	mov    0x14(%ebp),%eax
    75f7:	c1 e0 03             	shl    $0x3,%eax
    75fa:	89 c1                	mov    %eax,%ecx
    75fc:	c1 e1 05             	shl    $0x5,%ecx
    75ff:	29 c1                	sub    %eax,%ecx
    7601:	89 c8                	mov    %ecx,%eax
    7603:	83 c0 58             	add    $0x58,%eax
    7606:	01 d0                	add    %edx,%eax
    7608:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    760e:	8d 65 f8             	lea    -0x8(%ebp),%esp
    7611:	5b                   	pop    %ebx
    7612:	5e                   	pop    %esi
    7613:	5d                   	pop    %ebp
    7614:	c3                   	ret    

00007615 <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    7615:	55                   	push   %ebp
    7616:	89 e5                	mov    %esp,%ebp
    7618:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    761b:	a1 80 ef 00 00       	mov    0xef80,%eax
    7620:	85 c0                	test   %eax,%eax
    7622:	74 02                	je     7626 <initialize_huffman+0x11>
    7624:	eb 0f                	jmp    7635 <initialize_huffman+0x20>
	read_decoder_table();
    7626:	e8 7b d9 ff ff       	call   4fa6 <read_decoder_table>
	huffman_initialized = TRUE;
    762b:	c7 05 80 ef 00 00 01 	movl   $0x1,0xef80
    7632:	00 00 00 
}
    7635:	c9                   	leave  
    7636:	c3                   	ret    

00007637 <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    7637:	55                   	push   %ebp
    7638:	89 e5                	mov    %esp,%ebp
    763a:	57                   	push   %edi
    763b:	56                   	push   %esi
    763c:	53                   	push   %ebx
    763d:	83 ec 2c             	sub    $0x2c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    7640:	e8 d0 ff ff ff       	call   7615 <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    7645:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7648:	8b 45 14             	mov    0x14(%ebp),%eax
    764b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    764e:	89 c2                	mov    %eax,%edx
    7650:	c1 e2 03             	shl    $0x3,%edx
    7653:	01 c2                	add    %eax,%edx
    7655:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    765c:	89 c2                	mov    %eax,%edx
    765e:	89 c8                	mov    %ecx,%eax
    7660:	c1 e0 02             	shl    $0x2,%eax
    7663:	01 c8                	add    %ecx,%eax
    7665:	c1 e0 05             	shl    $0x5,%eax
    7668:	01 d0                	add    %edx,%eax
    766a:	01 d8                	add    %ebx,%eax
    766c:	83 c0 20             	add    $0x20,%eax
    766f:	8b 40 08             	mov    0x8(%eax),%eax
    7672:	85 c0                	test   %eax,%eax
    7674:	74 45                	je     76bb <III_hufman_decode+0x84>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    7676:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7679:	8b 45 14             	mov    0x14(%ebp),%eax
    767c:	8b 4d 10             	mov    0x10(%ebp),%ecx
    767f:	89 c2                	mov    %eax,%edx
    7681:	c1 e2 03             	shl    $0x3,%edx
    7684:	01 c2                	add    %eax,%edx
    7686:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    768d:	89 c2                	mov    %eax,%edx
    768f:	89 c8                	mov    %ecx,%eax
    7691:	c1 e0 02             	shl    $0x2,%eax
    7694:	01 c8                	add    %ecx,%eax
    7696:	c1 e0 05             	shl    $0x5,%eax
    7699:	01 d0                	add    %edx,%eax
    769b:	01 d8                	add    %ebx,%eax
    769d:	83 c0 20             	add    $0x20,%eax
    76a0:	8b 40 0c             	mov    0xc(%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    76a3:	83 f8 02             	cmp    $0x2,%eax
    76a6:	75 13                	jne    76bb <III_hufman_decode+0x84>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    76a8:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    76af:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    76b6:	e9 cf 00 00 00       	jmp    778a <III_hufman_decode+0x153>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    76bb:	8b 45 1c             	mov    0x1c(%ebp),%eax
    76be:	8b 00                	mov    (%eax),%eax
    76c0:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    76c3:	8b 75 0c             	mov    0xc(%ebp),%esi
    76c6:	8b 45 14             	mov    0x14(%ebp),%eax
    76c9:	8b 5d 10             	mov    0x10(%ebp),%ebx
    76cc:	89 c2                	mov    %eax,%edx
    76ce:	c1 e2 03             	shl    $0x3,%edx
    76d1:	01 c2                	add    %eax,%edx
    76d3:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    76da:	89 c2                	mov    %eax,%edx
    76dc:	89 d8                	mov    %ebx,%eax
    76de:	c1 e0 02             	shl    $0x2,%eax
    76e1:	01 d8                	add    %ebx,%eax
    76e3:	c1 e0 05             	shl    $0x5,%eax
    76e6:	01 d0                	add    %edx,%eax
    76e8:	01 f0                	add    %esi,%eax
    76ea:	83 c0 40             	add    $0x40,%eax
    76ed:	8b 40 0c             	mov    0xc(%eax),%eax
    76f0:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    76f3:	89 c8                	mov    %ecx,%eax
    76f5:	c1 e0 03             	shl    $0x3,%eax
    76f8:	01 c8                	add    %ecx,%eax
    76fa:	c1 e0 02             	shl    $0x2,%eax
    76fd:	01 c8                	add    %ecx,%eax
    76ff:	01 d0                	add    %edx,%eax
    7701:	8b 04 85 80 ec 00 00 	mov    0xec80(,%eax,4),%eax
    7708:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    770b:	8b 45 1c             	mov    0x1c(%ebp),%eax
    770e:	8b 00                	mov    (%eax),%eax
    7710:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    7713:	8b 75 0c             	mov    0xc(%ebp),%esi
    7716:	8b 45 14             	mov    0x14(%ebp),%eax
    7719:	8b 5d 10             	mov    0x10(%ebp),%ebx
    771c:	89 c2                	mov    %eax,%edx
    771e:	c1 e2 03             	shl    $0x3,%edx
    7721:	01 c2                	add    %eax,%edx
    7723:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    772a:	89 c2                	mov    %eax,%edx
    772c:	89 d8                	mov    %ebx,%eax
    772e:	c1 e0 02             	shl    $0x2,%eax
    7731:	01 d8                	add    %ebx,%eax
    7733:	c1 e0 05             	shl    $0x5,%eax
    7736:	01 d0                	add    %edx,%eax
    7738:	01 f0                	add    %esi,%eax
    773a:	83 c0 40             	add    $0x40,%eax
    773d:	8b 70 0c             	mov    0xc(%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    7740:	8b 7d 0c             	mov    0xc(%ebp),%edi
    7743:	8b 45 14             	mov    0x14(%ebp),%eax
    7746:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7749:	89 c2                	mov    %eax,%edx
    774b:	c1 e2 03             	shl    $0x3,%edx
    774e:	01 c2                	add    %eax,%edx
    7750:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7757:	89 c2                	mov    %eax,%edx
    7759:	89 d8                	mov    %ebx,%eax
    775b:	c1 e0 02             	shl    $0x2,%eax
    775e:	01 d8                	add    %ebx,%eax
    7760:	c1 e0 05             	shl    $0x5,%eax
    7763:	01 d0                	add    %edx,%eax
    7765:	01 f8                	add    %edi,%eax
    7767:	83 c0 40             	add    $0x40,%eax
    776a:	8b 40 10             	mov    0x10(%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    776d:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    776f:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7772:	89 c8                	mov    %ecx,%eax
    7774:	c1 e0 03             	shl    $0x3,%eax
    7777:	01 c8                	add    %ecx,%eax
    7779:	c1 e0 02             	shl    $0x2,%eax
    777c:	01 c8                	add    %ecx,%eax
    777e:	01 d0                	add    %edx,%eax
    7780:	8b 04 85 80 ec 00 00 	mov    0xec80(,%eax,4),%eax
    7787:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    778a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    7791:	e9 a6 01 00 00       	jmp    793c <III_hufman_decode+0x305>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    7796:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7799:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    779c:	7d 44                	jge    77e2 <III_hufman_decode+0x1ab>
    779e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    77a1:	8b 45 14             	mov    0x14(%ebp),%eax
    77a4:	8b 4d 10             	mov    0x10(%ebp),%ecx
    77a7:	89 c2                	mov    %eax,%edx
    77a9:	c1 e2 03             	shl    $0x3,%edx
    77ac:	01 c2                	add    %eax,%edx
    77ae:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    77b5:	89 c2                	mov    %eax,%edx
    77b7:	89 c8                	mov    %ecx,%eax
    77b9:	c1 e0 02             	shl    $0x2,%eax
    77bc:	01 c8                	add    %ecx,%eax
    77be:	c1 e0 05             	shl    $0x5,%eax
    77c1:	01 d0                	add    %edx,%eax
    77c3:	01 d8                	add    %ebx,%eax
    77c5:	83 c0 20             	add    $0x20,%eax
    77c8:	8b 50 14             	mov    0x14(%eax),%edx
    77cb:	89 d0                	mov    %edx,%eax
    77cd:	c1 e0 02             	shl    $0x2,%eax
    77d0:	01 d0                	add    %edx,%eax
    77d2:	c1 e0 03             	shl    $0x3,%eax
    77d5:	05 c0 21 01 00       	add    $0x121c0,%eax
    77da:	89 45 e0             	mov    %eax,-0x20(%ebp)
    77dd:	e9 88 00 00 00       	jmp    786a <III_hufman_decode+0x233>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    77e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    77e5:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    77e8:	7d 41                	jge    782b <III_hufman_decode+0x1f4>
    77ea:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    77ed:	8b 45 14             	mov    0x14(%ebp),%eax
    77f0:	8b 4d 10             	mov    0x10(%ebp),%ecx
    77f3:	89 c2                	mov    %eax,%edx
    77f5:	c1 e2 03             	shl    $0x3,%edx
    77f8:	01 c2                	add    %eax,%edx
    77fa:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7801:	89 c2                	mov    %eax,%edx
    7803:	89 c8                	mov    %ecx,%eax
    7805:	c1 e0 02             	shl    $0x2,%eax
    7808:	01 c8                	add    %ecx,%eax
    780a:	c1 e0 05             	shl    $0x5,%eax
    780d:	01 d0                	add    %edx,%eax
    780f:	01 d8                	add    %ebx,%eax
    7811:	83 c0 24             	add    $0x24,%eax
    7814:	8b 50 14             	mov    0x14(%eax),%edx
    7817:	89 d0                	mov    %edx,%eax
    7819:	c1 e0 02             	shl    $0x2,%eax
    781c:	01 d0                	add    %edx,%eax
    781e:	c1 e0 03             	shl    $0x3,%eax
    7821:	05 c0 21 01 00       	add    $0x121c0,%eax
    7826:	89 45 e0             	mov    %eax,-0x20(%ebp)
    7829:	eb 3f                	jmp    786a <III_hufman_decode+0x233>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    782b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    782e:	8b 45 14             	mov    0x14(%ebp),%eax
    7831:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7834:	89 c2                	mov    %eax,%edx
    7836:	c1 e2 03             	shl    $0x3,%edx
    7839:	01 c2                	add    %eax,%edx
    783b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7842:	89 c2                	mov    %eax,%edx
    7844:	89 c8                	mov    %ecx,%eax
    7846:	c1 e0 02             	shl    $0x2,%eax
    7849:	01 c8                	add    %ecx,%eax
    784b:	c1 e0 05             	shl    $0x5,%eax
    784e:	01 d0                	add    %edx,%eax
    7850:	01 d8                	add    %ebx,%eax
    7852:	83 c0 28             	add    $0x28,%eax
    7855:	8b 50 14             	mov    0x14(%eax),%edx
    7858:	89 d0                	mov    %edx,%eax
    785a:	c1 e0 02             	shl    $0x2,%eax
    785d:	01 d0                	add    %edx,%eax
    785f:	c1 e0 03             	shl    $0x3,%eax
    7862:	05 c0 21 01 00       	add    $0x121c0,%eax
    7867:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    786a:	83 ec 0c             	sub    $0xc,%esp
    786d:	8d 45 c8             	lea    -0x38(%ebp),%eax
    7870:	50                   	push   %eax
    7871:	8d 45 cc             	lea    -0x34(%ebp),%eax
    7874:	50                   	push   %eax
    7875:	8d 45 d0             	lea    -0x30(%ebp),%eax
    7878:	50                   	push   %eax
    7879:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    787c:	50                   	push   %eax
    787d:	ff 75 e0             	pushl  -0x20(%ebp)
    7880:	e8 d9 ee ff ff       	call   675e <huffman_decoder>
    7885:	83 c4 20             	add    $0x20,%esp
      is[i/SSLIMIT][i%SSLIMIT] = x;
    7888:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    788b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7890:	89 c8                	mov    %ecx,%eax
    7892:	f7 ea                	imul   %edx
    7894:	c1 fa 02             	sar    $0x2,%edx
    7897:	89 c8                	mov    %ecx,%eax
    7899:	c1 f8 1f             	sar    $0x1f,%eax
    789c:	29 c2                	sub    %eax,%edx
    789e:	89 d0                	mov    %edx,%eax
    78a0:	89 c2                	mov    %eax,%edx
    78a2:	89 d0                	mov    %edx,%eax
    78a4:	c1 e0 03             	shl    $0x3,%eax
    78a7:	01 d0                	add    %edx,%eax
    78a9:	c1 e0 03             	shl    $0x3,%eax
    78ac:	89 c2                	mov    %eax,%edx
    78ae:	8b 45 08             	mov    0x8(%ebp),%eax
    78b1:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    78b4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    78b7:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    78bc:	89 c8                	mov    %ecx,%eax
    78be:	f7 ea                	imul   %edx
    78c0:	c1 fa 02             	sar    $0x2,%edx
    78c3:	89 c8                	mov    %ecx,%eax
    78c5:	c1 f8 1f             	sar    $0x1f,%eax
    78c8:	29 c2                	sub    %eax,%edx
    78ca:	89 d0                	mov    %edx,%eax
    78cc:	c1 e0 03             	shl    $0x3,%eax
    78cf:	01 d0                	add    %edx,%eax
    78d1:	01 c0                	add    %eax,%eax
    78d3:	29 c1                	sub    %eax,%ecx
    78d5:	89 ca                	mov    %ecx,%edx
    78d7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    78da:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    78dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    78e0:	8d 48 01             	lea    0x1(%eax),%ecx
    78e3:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    78e8:	89 c8                	mov    %ecx,%eax
    78ea:	f7 ea                	imul   %edx
    78ec:	c1 fa 02             	sar    $0x2,%edx
    78ef:	89 c8                	mov    %ecx,%eax
    78f1:	c1 f8 1f             	sar    $0x1f,%eax
    78f4:	29 c2                	sub    %eax,%edx
    78f6:	89 d0                	mov    %edx,%eax
    78f8:	89 c2                	mov    %eax,%edx
    78fa:	89 d0                	mov    %edx,%eax
    78fc:	c1 e0 03             	shl    $0x3,%eax
    78ff:	01 d0                	add    %edx,%eax
    7901:	c1 e0 03             	shl    $0x3,%eax
    7904:	89 c2                	mov    %eax,%edx
    7906:	8b 45 08             	mov    0x8(%ebp),%eax
    7909:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    790c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    790f:	8d 48 01             	lea    0x1(%eax),%ecx
    7912:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7917:	89 c8                	mov    %ecx,%eax
    7919:	f7 ea                	imul   %edx
    791b:	c1 fa 02             	sar    $0x2,%edx
    791e:	89 c8                	mov    %ecx,%eax
    7920:	c1 f8 1f             	sar    $0x1f,%eax
    7923:	29 c2                	sub    %eax,%edx
    7925:	89 d0                	mov    %edx,%eax
    7927:	c1 e0 03             	shl    $0x3,%eax
    792a:	01 d0                	add    %edx,%eax
    792c:	01 c0                	add    %eax,%eax
    792e:	29 c1                	sub    %eax,%ecx
    7930:	89 ca                	mov    %ecx,%edx
    7932:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7935:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    7938:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    793c:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    793f:	8b 75 0c             	mov    0xc(%ebp),%esi
    7942:	8b 45 14             	mov    0x14(%ebp),%eax
    7945:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7948:	89 c2                	mov    %eax,%edx
    794a:	c1 e2 03             	shl    $0x3,%edx
    794d:	01 c2                	add    %eax,%edx
    794f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7956:	89 c2                	mov    %eax,%edx
    7958:	89 c8                	mov    %ecx,%eax
    795a:	c1 e0 02             	shl    $0x2,%eax
    795d:	01 c8                	add    %ecx,%eax
    795f:	c1 e0 05             	shl    $0x5,%eax
    7962:	01 d0                	add    %edx,%eax
    7964:	01 f0                	add    %esi,%eax
    7966:	83 c0 10             	add    $0x10,%eax
    7969:	8b 40 0c             	mov    0xc(%eax),%eax
    796c:	01 c0                	add    %eax,%eax
    796e:	39 c3                	cmp    %eax,%ebx
    7970:	0f 82 20 fe ff ff    	jb     7796 <III_hufman_decode+0x15f>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    7976:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7979:	8b 45 14             	mov    0x14(%ebp),%eax
    797c:	8b 4d 10             	mov    0x10(%ebp),%ecx
    797f:	89 c2                	mov    %eax,%edx
    7981:	c1 e2 03             	shl    $0x3,%edx
    7984:	01 c2                	add    %eax,%edx
    7986:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    798d:	89 c2                	mov    %eax,%edx
    798f:	89 c8                	mov    %ecx,%eax
    7991:	c1 e0 02             	shl    $0x2,%eax
    7994:	01 c8                	add    %ecx,%eax
    7996:	c1 e0 05             	shl    $0x5,%eax
    7999:	01 d0                	add    %edx,%eax
    799b:	01 d8                	add    %ebx,%eax
    799d:	83 c0 50             	add    $0x50,%eax
    79a0:	8b 40 0c             	mov    0xc(%eax),%eax
    79a3:	8d 50 20             	lea    0x20(%eax),%edx
    79a6:	89 d0                	mov    %edx,%eax
    79a8:	c1 e0 02             	shl    $0x2,%eax
    79ab:	01 d0                	add    %edx,%eax
    79ad:	c1 e0 03             	shl    $0x3,%eax
    79b0:	05 c0 21 01 00       	add    $0x121c0,%eax
    79b5:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    79b8:	e9 88 01 00 00       	jmp    7b45 <III_hufman_decode+0x50e>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    79bd:	83 ec 0c             	sub    $0xc,%esp
    79c0:	8d 45 c8             	lea    -0x38(%ebp),%eax
    79c3:	50                   	push   %eax
    79c4:	8d 45 cc             	lea    -0x34(%ebp),%eax
    79c7:	50                   	push   %eax
    79c8:	8d 45 d0             	lea    -0x30(%ebp),%eax
    79cb:	50                   	push   %eax
    79cc:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    79cf:	50                   	push   %eax
    79d0:	ff 75 e0             	pushl  -0x20(%ebp)
    79d3:	e8 86 ed ff ff       	call   675e <huffman_decoder>
    79d8:	83 c4 20             	add    $0x20,%esp
      is[i/SSLIMIT][i%SSLIMIT] = v;
    79db:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    79de:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    79e3:	89 c8                	mov    %ecx,%eax
    79e5:	f7 ea                	imul   %edx
    79e7:	c1 fa 02             	sar    $0x2,%edx
    79ea:	89 c8                	mov    %ecx,%eax
    79ec:	c1 f8 1f             	sar    $0x1f,%eax
    79ef:	29 c2                	sub    %eax,%edx
    79f1:	89 d0                	mov    %edx,%eax
    79f3:	89 c2                	mov    %eax,%edx
    79f5:	89 d0                	mov    %edx,%eax
    79f7:	c1 e0 03             	shl    $0x3,%eax
    79fa:	01 d0                	add    %edx,%eax
    79fc:	c1 e0 03             	shl    $0x3,%eax
    79ff:	89 c2                	mov    %eax,%edx
    7a01:	8b 45 08             	mov    0x8(%ebp),%eax
    7a04:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7a07:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7a0a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7a0f:	89 c8                	mov    %ecx,%eax
    7a11:	f7 ea                	imul   %edx
    7a13:	c1 fa 02             	sar    $0x2,%edx
    7a16:	89 c8                	mov    %ecx,%eax
    7a18:	c1 f8 1f             	sar    $0x1f,%eax
    7a1b:	29 c2                	sub    %eax,%edx
    7a1d:	89 d0                	mov    %edx,%eax
    7a1f:	c1 e0 03             	shl    $0x3,%eax
    7a22:	01 d0                	add    %edx,%eax
    7a24:	01 c0                	add    %eax,%eax
    7a26:	29 c1                	sub    %eax,%ecx
    7a28:	89 ca                	mov    %ecx,%edx
    7a2a:	8b 45 cc             	mov    -0x34(%ebp),%eax
    7a2d:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    7a30:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7a33:	8d 48 01             	lea    0x1(%eax),%ecx
    7a36:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7a3b:	89 c8                	mov    %ecx,%eax
    7a3d:	f7 ea                	imul   %edx
    7a3f:	c1 fa 02             	sar    $0x2,%edx
    7a42:	89 c8                	mov    %ecx,%eax
    7a44:	c1 f8 1f             	sar    $0x1f,%eax
    7a47:	29 c2                	sub    %eax,%edx
    7a49:	89 d0                	mov    %edx,%eax
    7a4b:	89 c2                	mov    %eax,%edx
    7a4d:	89 d0                	mov    %edx,%eax
    7a4f:	c1 e0 03             	shl    $0x3,%eax
    7a52:	01 d0                	add    %edx,%eax
    7a54:	c1 e0 03             	shl    $0x3,%eax
    7a57:	89 c2                	mov    %eax,%edx
    7a59:	8b 45 08             	mov    0x8(%ebp),%eax
    7a5c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7a5f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7a62:	8d 48 01             	lea    0x1(%eax),%ecx
    7a65:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7a6a:	89 c8                	mov    %ecx,%eax
    7a6c:	f7 ea                	imul   %edx
    7a6e:	c1 fa 02             	sar    $0x2,%edx
    7a71:	89 c8                	mov    %ecx,%eax
    7a73:	c1 f8 1f             	sar    $0x1f,%eax
    7a76:	29 c2                	sub    %eax,%edx
    7a78:	89 d0                	mov    %edx,%eax
    7a7a:	c1 e0 03             	shl    $0x3,%eax
    7a7d:	01 d0                	add    %edx,%eax
    7a7f:	01 c0                	add    %eax,%eax
    7a81:	29 c1                	sub    %eax,%ecx
    7a83:	89 ca                	mov    %ecx,%edx
    7a85:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7a88:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    7a8b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7a8e:	8d 48 02             	lea    0x2(%eax),%ecx
    7a91:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7a96:	89 c8                	mov    %ecx,%eax
    7a98:	f7 ea                	imul   %edx
    7a9a:	c1 fa 02             	sar    $0x2,%edx
    7a9d:	89 c8                	mov    %ecx,%eax
    7a9f:	c1 f8 1f             	sar    $0x1f,%eax
    7aa2:	29 c2                	sub    %eax,%edx
    7aa4:	89 d0                	mov    %edx,%eax
    7aa6:	89 c2                	mov    %eax,%edx
    7aa8:	89 d0                	mov    %edx,%eax
    7aaa:	c1 e0 03             	shl    $0x3,%eax
    7aad:	01 d0                	add    %edx,%eax
    7aaf:	c1 e0 03             	shl    $0x3,%eax
    7ab2:	89 c2                	mov    %eax,%edx
    7ab4:	8b 45 08             	mov    0x8(%ebp),%eax
    7ab7:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7aba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7abd:	8d 48 02             	lea    0x2(%eax),%ecx
    7ac0:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7ac5:	89 c8                	mov    %ecx,%eax
    7ac7:	f7 ea                	imul   %edx
    7ac9:	c1 fa 02             	sar    $0x2,%edx
    7acc:	89 c8                	mov    %ecx,%eax
    7ace:	c1 f8 1f             	sar    $0x1f,%eax
    7ad1:	29 c2                	sub    %eax,%edx
    7ad3:	89 d0                	mov    %edx,%eax
    7ad5:	c1 e0 03             	shl    $0x3,%eax
    7ad8:	01 d0                	add    %edx,%eax
    7ada:	01 c0                	add    %eax,%eax
    7adc:	29 c1                	sub    %eax,%ecx
    7ade:	89 ca                	mov    %ecx,%edx
    7ae0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7ae3:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    7ae6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7ae9:	8d 48 03             	lea    0x3(%eax),%ecx
    7aec:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7af1:	89 c8                	mov    %ecx,%eax
    7af3:	f7 ea                	imul   %edx
    7af5:	c1 fa 02             	sar    $0x2,%edx
    7af8:	89 c8                	mov    %ecx,%eax
    7afa:	c1 f8 1f             	sar    $0x1f,%eax
    7afd:	29 c2                	sub    %eax,%edx
    7aff:	89 d0                	mov    %edx,%eax
    7b01:	89 c2                	mov    %eax,%edx
    7b03:	89 d0                	mov    %edx,%eax
    7b05:	c1 e0 03             	shl    $0x3,%eax
    7b08:	01 d0                	add    %edx,%eax
    7b0a:	c1 e0 03             	shl    $0x3,%eax
    7b0d:	89 c2                	mov    %eax,%edx
    7b0f:	8b 45 08             	mov    0x8(%ebp),%eax
    7b12:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7b15:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7b18:	8d 48 03             	lea    0x3(%eax),%ecx
    7b1b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7b20:	89 c8                	mov    %ecx,%eax
    7b22:	f7 ea                	imul   %edx
    7b24:	c1 fa 02             	sar    $0x2,%edx
    7b27:	89 c8                	mov    %ecx,%eax
    7b29:	c1 f8 1f             	sar    $0x1f,%eax
    7b2c:	29 c2                	sub    %eax,%edx
    7b2e:	89 d0                	mov    %edx,%eax
    7b30:	c1 e0 03             	shl    $0x3,%eax
    7b33:	01 d0                	add    %edx,%eax
    7b35:	01 c0                	add    %eax,%eax
    7b37:	29 c1                	sub    %eax,%ecx
    7b39:	89 ca                	mov    %ecx,%edx
    7b3b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7b3e:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    7b41:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    7b45:	e8 e8 d3 ff ff       	call   4f32 <hsstell>
    7b4a:	89 c6                	mov    %eax,%esi
    7b4c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7b4f:	8b 45 14             	mov    0x14(%ebp),%eax
    7b52:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7b55:	89 c2                	mov    %eax,%edx
    7b57:	c1 e2 03             	shl    $0x3,%edx
    7b5a:	01 c2                	add    %eax,%edx
    7b5c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7b63:	89 c2                	mov    %eax,%edx
    7b65:	89 c8                	mov    %ecx,%eax
    7b67:	c1 e0 02             	shl    $0x2,%eax
    7b6a:	01 c8                	add    %ecx,%eax
    7b6c:	c1 e0 05             	shl    $0x5,%eax
    7b6f:	01 d0                	add    %edx,%eax
    7b71:	01 d8                	add    %ebx,%eax
    7b73:	83 c0 10             	add    $0x10,%eax
    7b76:	8b 50 08             	mov    0x8(%eax),%edx
    7b79:	8b 45 18             	mov    0x18(%ebp),%eax
    7b7c:	01 d0                	add    %edx,%eax
    7b7e:	39 c6                	cmp    %eax,%esi
    7b80:	73 0d                	jae    7b8f <III_hufman_decode+0x558>
    7b82:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    7b89:	0f 8e 2e fe ff ff    	jle    79bd <III_hufman_decode+0x386>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    7b8f:	e8 9e d3 ff ff       	call   4f32 <hsstell>
    7b94:	89 c6                	mov    %eax,%esi
    7b96:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7b99:	8b 45 14             	mov    0x14(%ebp),%eax
    7b9c:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7b9f:	89 c2                	mov    %eax,%edx
    7ba1:	c1 e2 03             	shl    $0x3,%edx
    7ba4:	01 c2                	add    %eax,%edx
    7ba6:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7bad:	89 c2                	mov    %eax,%edx
    7baf:	89 c8                	mov    %ecx,%eax
    7bb1:	c1 e0 02             	shl    $0x2,%eax
    7bb4:	01 c8                	add    %ecx,%eax
    7bb6:	c1 e0 05             	shl    $0x5,%eax
    7bb9:	01 d0                	add    %edx,%eax
    7bbb:	01 d8                	add    %ebx,%eax
    7bbd:	83 c0 10             	add    $0x10,%eax
    7bc0:	8b 50 08             	mov    0x8(%eax),%edx
    7bc3:	8b 45 18             	mov    0x18(%ebp),%eax
    7bc6:	01 d0                	add    %edx,%eax
    7bc8:	39 c6                	cmp    %eax,%esi
    7bca:	76 4f                	jbe    7c1b <III_hufman_decode+0x5e4>
   {  i -=4;
    7bcc:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    7bd0:	e8 5d d3 ff ff       	call   4f32 <hsstell>
    7bd5:	89 c2                	mov    %eax,%edx
    7bd7:	8b 45 18             	mov    0x18(%ebp),%eax
    7bda:	89 d6                	mov    %edx,%esi
    7bdc:	29 c6                	sub    %eax,%esi
    7bde:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7be1:	8b 45 14             	mov    0x14(%ebp),%eax
    7be4:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7be7:	89 c2                	mov    %eax,%edx
    7be9:	c1 e2 03             	shl    $0x3,%edx
    7bec:	01 c2                	add    %eax,%edx
    7bee:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7bf5:	89 c2                	mov    %eax,%edx
    7bf7:	89 c8                	mov    %ecx,%eax
    7bf9:	c1 e0 02             	shl    $0x2,%eax
    7bfc:	01 c8                	add    %ecx,%eax
    7bfe:	c1 e0 05             	shl    $0x5,%eax
    7c01:	01 d0                	add    %edx,%eax
    7c03:	01 d8                	add    %ebx,%eax
    7c05:	83 c0 10             	add    $0x10,%eax
    7c08:	8b 40 08             	mov    0x8(%eax),%eax
    7c0b:	29 c6                	sub    %eax,%esi
    7c0d:	89 f0                	mov    %esi,%eax
    7c0f:	83 ec 0c             	sub    $0xc,%esp
    7c12:	50                   	push   %eax
    7c13:	e8 5e d3 ff ff       	call   4f76 <rewindNbits>
    7c18:	83 c4 10             	add    $0x10,%esp
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    7c1b:	e8 12 d3 ff ff       	call   4f32 <hsstell>
    7c20:	89 c6                	mov    %eax,%esi
    7c22:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7c25:	8b 45 14             	mov    0x14(%ebp),%eax
    7c28:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7c2b:	89 c2                	mov    %eax,%edx
    7c2d:	c1 e2 03             	shl    $0x3,%edx
    7c30:	01 c2                	add    %eax,%edx
    7c32:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7c39:	89 c2                	mov    %eax,%edx
    7c3b:	89 c8                	mov    %ecx,%eax
    7c3d:	c1 e0 02             	shl    $0x2,%eax
    7c40:	01 c8                	add    %ecx,%eax
    7c42:	c1 e0 05             	shl    $0x5,%eax
    7c45:	01 d0                	add    %edx,%eax
    7c47:	01 d8                	add    %ebx,%eax
    7c49:	83 c0 10             	add    $0x10,%eax
    7c4c:	8b 50 08             	mov    0x8(%eax),%edx
    7c4f:	8b 45 18             	mov    0x18(%ebp),%eax
    7c52:	01 d0                	add    %edx,%eax
    7c54:	39 c6                	cmp    %eax,%esi
    7c56:	73 48                	jae    7ca0 <III_hufman_decode+0x669>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    7c58:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7c5b:	8b 45 14             	mov    0x14(%ebp),%eax
    7c5e:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7c61:	89 c2                	mov    %eax,%edx
    7c63:	c1 e2 03             	shl    $0x3,%edx
    7c66:	01 c2                	add    %eax,%edx
    7c68:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7c6f:	89 c2                	mov    %eax,%edx
    7c71:	89 c8                	mov    %ecx,%eax
    7c73:	c1 e0 02             	shl    $0x2,%eax
    7c76:	01 c8                	add    %ecx,%eax
    7c78:	c1 e0 05             	shl    $0x5,%eax
    7c7b:	01 d0                	add    %edx,%eax
    7c7d:	01 d8                	add    %ebx,%eax
    7c7f:	83 c0 10             	add    $0x10,%eax
    7c82:	8b 50 08             	mov    0x8(%eax),%edx
    7c85:	8b 45 18             	mov    0x18(%ebp),%eax
    7c88:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7c8b:	e8 a2 d2 ff ff       	call   4f32 <hsstell>
    7c90:	29 c3                	sub    %eax,%ebx
    7c92:	89 d8                	mov    %ebx,%eax
    7c94:	83 ec 0c             	sub    $0xc,%esp
    7c97:	50                   	push   %eax
    7c98:	e8 ac d2 ff ff       	call   4f49 <hgetbits>
    7c9d:	83 c4 10             	add    $0x10,%esp

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    7ca0:	eb 5a                	jmp    7cfc <III_hufman_decode+0x6c5>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    7ca2:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7ca5:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7caa:	89 c8                	mov    %ecx,%eax
    7cac:	f7 ea                	imul   %edx
    7cae:	c1 fa 02             	sar    $0x2,%edx
    7cb1:	89 c8                	mov    %ecx,%eax
    7cb3:	c1 f8 1f             	sar    $0x1f,%eax
    7cb6:	29 c2                	sub    %eax,%edx
    7cb8:	89 d0                	mov    %edx,%eax
    7cba:	89 c2                	mov    %eax,%edx
    7cbc:	89 d0                	mov    %edx,%eax
    7cbe:	c1 e0 03             	shl    $0x3,%eax
    7cc1:	01 d0                	add    %edx,%eax
    7cc3:	c1 e0 03             	shl    $0x3,%eax
    7cc6:	89 c2                	mov    %eax,%edx
    7cc8:	8b 45 08             	mov    0x8(%ebp),%eax
    7ccb:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7cce:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7cd1:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7cd6:	89 c8                	mov    %ecx,%eax
    7cd8:	f7 ea                	imul   %edx
    7cda:	c1 fa 02             	sar    $0x2,%edx
    7cdd:	89 c8                	mov    %ecx,%eax
    7cdf:	c1 f8 1f             	sar    $0x1f,%eax
    7ce2:	29 c2                	sub    %eax,%edx
    7ce4:	89 d0                	mov    %edx,%eax
    7ce6:	c1 e0 03             	shl    $0x3,%eax
    7ce9:	01 d0                	add    %edx,%eax
    7ceb:	01 c0                	add    %eax,%eax
    7ced:	29 c1                	sub    %eax,%ecx
    7cef:	89 ca                	mov    %ecx,%edx
    7cf1:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    7cf8:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    7cfc:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    7d03:	7e 9d                	jle    7ca2 <III_hufman_decode+0x66b>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    7d05:	8d 65 f4             	lea    -0xc(%ebp),%esp
    7d08:	5b                   	pop    %ebx
    7d09:	5e                   	pop    %esi
    7d0a:	5f                   	pop    %edi
    7d0b:	5d                   	pop    %ebp
    7d0c:	c3                   	ret    

00007d0d <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    7d0d:	55                   	push   %ebp
    7d0e:	89 e5                	mov    %esp,%ebp
    7d10:	53                   	push   %ebx
    7d11:	83 ec 34             	sub    $0x34,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    7d14:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7d1b:	8b 45 1c             	mov    0x1c(%ebp),%eax
    7d1e:	8b 00                	mov    (%eax),%eax
    7d20:	8b 40 10             	mov    0x10(%eax),%eax
    7d23:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    7d26:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    7d2d:	8b 45 14             	mov    0x14(%ebp),%eax
    7d30:	8b 40 10             	mov    0x10(%eax),%eax
    7d33:	85 c0                	test   %eax,%eax
    7d35:	74 6a                	je     7da1 <III_dequantize_sample+0x94>
    7d37:	8b 45 14             	mov    0x14(%ebp),%eax
    7d3a:	8b 40 14             	mov    0x14(%eax),%eax
    7d3d:	83 f8 02             	cmp    $0x2,%eax
    7d40:	75 5f                	jne    7da1 <III_dequantize_sample+0x94>
		if (gr_info->mixed_block_flag)
    7d42:	8b 45 14             	mov    0x14(%ebp),%eax
    7d45:	8b 40 18             	mov    0x18(%eax),%eax
    7d48:	85 c0                	test   %eax,%eax
    7d4a:	74 18                	je     7d64 <III_dequantize_sample+0x57>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    7d4c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7d4f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7d55:	83 c0 04             	add    $0x4,%eax
    7d58:	05 80 ec 00 00       	add    $0xec80,%eax
    7d5d:	8b 00                	mov    (%eax),%eax
    7d5f:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    7d62:	eb 53                	jmp    7db7 <III_dequantize_sample+0xaa>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    7d64:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7d67:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7d6d:	83 c0 54             	add    $0x54,%eax
    7d70:	05 80 ec 00 00       	add    $0xec80,%eax
    7d75:	8b 50 0c             	mov    0xc(%eax),%edx
    7d78:	89 d0                	mov    %edx,%eax
    7d7a:	01 c0                	add    %eax,%eax
    7d7c:	01 d0                	add    %edx,%eax
    7d7e:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    7d81:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7d84:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7d8a:	83 c0 54             	add    $0x54,%eax
    7d8d:	05 80 ec 00 00       	add    $0xec80,%eax
    7d92:	8b 40 0c             	mov    0xc(%eax),%eax
    7d95:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    7d98:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    7d9f:	eb 16                	jmp    7db7 <III_dequantize_sample+0xaa>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    7da1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7da4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7daa:	83 c0 04             	add    $0x4,%eax
    7dad:	05 80 ec 00 00       	add    $0xec80,%eax
    7db2:	8b 00                	mov    (%eax),%eax
    7db4:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    7db7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7dbe:	e9 8a 06 00 00       	jmp    844d <III_dequantize_sample+0x740>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    7dc3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7dca:	e9 70 06 00 00       	jmp    843f <III_dequantize_sample+0x732>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    7dcf:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7dd2:	89 d0                	mov    %edx,%eax
    7dd4:	c1 e0 03             	shl    $0x3,%eax
    7dd7:	01 d0                	add    %edx,%eax
    7dd9:	01 c0                	add    %eax,%eax
    7ddb:	89 c2                	mov    %eax,%edx
    7ddd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7de0:	01 d0                	add    %edx,%eax
    7de2:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    7de5:	0f 85 a7 02 00 00    	jne    8092 <III_dequantize_sample+0x385>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    7deb:	8b 45 14             	mov    0x14(%ebp),%eax
    7dee:	8b 40 10             	mov    0x10(%eax),%eax
    7df1:	85 c0                	test   %eax,%eax
    7df3:	0f 84 74 02 00 00    	je     806d <III_dequantize_sample+0x360>
    7df9:	8b 45 14             	mov    0x14(%ebp),%eax
    7dfc:	8b 40 14             	mov    0x14(%eax),%eax
    7dff:	83 f8 02             	cmp    $0x2,%eax
    7e02:	0f 85 65 02 00 00    	jne    806d <III_dequantize_sample+0x360>
					if (gr_info->mixed_block_flag) {
    7e08:	8b 45 14             	mov    0x14(%ebp),%eax
    7e0b:	8b 40 18             	mov    0x18(%eax),%eax
    7e0e:	85 c0                	test   %eax,%eax
    7e10:	0f 84 b8 01 00 00    	je     7fce <III_dequantize_sample+0x2c1>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    7e16:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7e19:	89 d0                	mov    %edx,%eax
    7e1b:	c1 e0 03             	shl    $0x3,%eax
    7e1e:	01 d0                	add    %edx,%eax
    7e20:	01 c0                	add    %eax,%eax
    7e22:	89 c2                	mov    %eax,%edx
    7e24:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e27:	01 c2                	add    %eax,%edx
    7e29:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7e2c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7e32:	83 c0 20             	add    $0x20,%eax
    7e35:	05 80 ec 00 00       	add    $0xec80,%eax
    7e3a:	8b 00                	mov    (%eax),%eax
    7e3c:	39 c2                	cmp    %eax,%edx
    7e3e:	0f 85 96 00 00 00    	jne    7eda <III_dequantize_sample+0x1cd>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    7e44:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7e47:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7e4d:	83 c0 60             	add    $0x60,%eax
    7e50:	05 80 ec 00 00       	add    $0xec80,%eax
    7e55:	8b 50 0c             	mov    0xc(%eax),%edx
    7e58:	89 d0                	mov    %edx,%eax
    7e5a:	01 c0                	add    %eax,%eax
    7e5c:	01 d0                	add    %edx,%eax
    7e5e:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    7e61:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    7e68:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7e6b:	8d 48 01             	lea    0x1(%eax),%ecx
    7e6e:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7e71:	89 d0                	mov    %edx,%eax
    7e73:	c1 e0 03             	shl    $0x3,%eax
    7e76:	01 d0                	add    %edx,%eax
    7e78:	c1 e0 02             	shl    $0x2,%eax
    7e7b:	01 d0                	add    %edx,%eax
    7e7d:	01 c8                	add    %ecx,%eax
    7e7f:	83 c0 14             	add    $0x14,%eax
    7e82:	8b 0c 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    7e89:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7e8c:	89 d0                	mov    %edx,%eax
    7e8e:	c1 e0 03             	shl    $0x3,%eax
    7e91:	01 d0                	add    %edx,%eax
    7e93:	c1 e0 02             	shl    $0x2,%eax
    7e96:	01 d0                	add    %edx,%eax
    7e98:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7e9b:	01 d0                	add    %edx,%eax
    7e9d:	83 c0 14             	add    $0x14,%eax
    7ea0:	8b 04 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    7ea7:	29 c1                	sub    %eax,%ecx
    7ea9:	89 c8                	mov    %ecx,%eax
    7eab:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    7eae:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7eb1:	89 d0                	mov    %edx,%eax
    7eb3:	c1 e0 03             	shl    $0x3,%eax
    7eb6:	01 d0                	add    %edx,%eax
    7eb8:	c1 e0 02             	shl    $0x2,%eax
    7ebb:	01 d0                	add    %edx,%eax
    7ebd:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7ec0:	01 d0                	add    %edx,%eax
    7ec2:	83 c0 14             	add    $0x14,%eax
    7ec5:	8b 14 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%edx
    7ecc:	89 d0                	mov    %edx,%eax
    7ece:	01 c0                	add    %eax,%eax
    7ed0:	01 d0                	add    %edx,%eax
    7ed2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    7ed5:	e9 91 01 00 00       	jmp    806b <III_dequantize_sample+0x35e>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    7eda:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7edd:	89 d0                	mov    %edx,%eax
    7edf:	c1 e0 03             	shl    $0x3,%eax
    7ee2:	01 d0                	add    %edx,%eax
    7ee4:	01 c0                	add    %eax,%eax
    7ee6:	89 c2                	mov    %eax,%edx
    7ee8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7eeb:	01 c2                	add    %eax,%edx
    7eed:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7ef0:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7ef6:	83 c0 20             	add    $0x20,%eax
    7ef9:	05 80 ec 00 00       	add    $0xec80,%eax
    7efe:	8b 00                	mov    (%eax),%eax
    7f00:	39 c2                	cmp    %eax,%edx
    7f02:	7d 2a                	jge    7f2e <III_dequantize_sample+0x221>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    7f04:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7f08:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7f0b:	8d 48 01             	lea    0x1(%eax),%ecx
    7f0e:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7f11:	89 d0                	mov    %edx,%eax
    7f13:	c1 e0 03             	shl    $0x3,%eax
    7f16:	01 d0                	add    %edx,%eax
    7f18:	c1 e0 02             	shl    $0x2,%eax
    7f1b:	01 d0                	add    %edx,%eax
    7f1d:	01 c8                	add    %ecx,%eax
    7f1f:	8b 04 85 80 ec 00 00 	mov    0xec80(,%eax,4),%eax
    7f26:	89 45 e8             	mov    %eax,-0x18(%ebp)
    7f29:	e9 3d 01 00 00       	jmp    806b <III_dequantize_sample+0x35e>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    7f2e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7f32:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7f35:	8d 48 01             	lea    0x1(%eax),%ecx
    7f38:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7f3b:	89 d0                	mov    %edx,%eax
    7f3d:	c1 e0 03             	shl    $0x3,%eax
    7f40:	01 d0                	add    %edx,%eax
    7f42:	c1 e0 02             	shl    $0x2,%eax
    7f45:	01 d0                	add    %edx,%eax
    7f47:	01 c8                	add    %ecx,%eax
    7f49:	83 c0 14             	add    $0x14,%eax
    7f4c:	8b 14 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%edx
    7f53:	89 d0                	mov    %edx,%eax
    7f55:	01 c0                	add    %eax,%eax
    7f57:	01 d0                	add    %edx,%eax
    7f59:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    7f5c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7f5f:	8d 48 01             	lea    0x1(%eax),%ecx
    7f62:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7f65:	89 d0                	mov    %edx,%eax
    7f67:	c1 e0 03             	shl    $0x3,%eax
    7f6a:	01 d0                	add    %edx,%eax
    7f6c:	c1 e0 02             	shl    $0x2,%eax
    7f6f:	01 d0                	add    %edx,%eax
    7f71:	01 c8                	add    %ecx,%eax
    7f73:	83 c0 14             	add    $0x14,%eax
    7f76:	8b 0c 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    7f7d:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7f80:	89 d0                	mov    %edx,%eax
    7f82:	c1 e0 03             	shl    $0x3,%eax
    7f85:	01 d0                	add    %edx,%eax
    7f87:	c1 e0 02             	shl    $0x2,%eax
    7f8a:	01 d0                	add    %edx,%eax
    7f8c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7f8f:	01 d0                	add    %edx,%eax
    7f91:	83 c0 14             	add    $0x14,%eax
    7f94:	8b 04 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    7f9b:	29 c1                	sub    %eax,%ecx
    7f9d:	89 c8                	mov    %ecx,%eax
    7f9f:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    7fa2:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7fa5:	89 d0                	mov    %edx,%eax
    7fa7:	c1 e0 03             	shl    $0x3,%eax
    7faa:	01 d0                	add    %edx,%eax
    7fac:	c1 e0 02             	shl    $0x2,%eax
    7faf:	01 d0                	add    %edx,%eax
    7fb1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7fb4:	01 d0                	add    %edx,%eax
    7fb6:	83 c0 14             	add    $0x14,%eax
    7fb9:	8b 14 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%edx
    7fc0:	89 d0                	mov    %edx,%eax
    7fc2:	01 c0                	add    %eax,%eax
    7fc4:	01 d0                	add    %edx,%eax
    7fc6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    7fc9:	e9 c4 00 00 00       	jmp    8092 <III_dequantize_sample+0x385>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    7fce:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7fd2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7fd5:	8d 48 01             	lea    0x1(%eax),%ecx
    7fd8:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7fdb:	89 d0                	mov    %edx,%eax
    7fdd:	c1 e0 03             	shl    $0x3,%eax
    7fe0:	01 d0                	add    %edx,%eax
    7fe2:	c1 e0 02             	shl    $0x2,%eax
    7fe5:	01 d0                	add    %edx,%eax
    7fe7:	01 c8                	add    %ecx,%eax
    7fe9:	83 c0 14             	add    $0x14,%eax
    7fec:	8b 14 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%edx
    7ff3:	89 d0                	mov    %edx,%eax
    7ff5:	01 c0                	add    %eax,%eax
    7ff7:	01 d0                	add    %edx,%eax
    7ff9:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    7ffc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7fff:	8d 48 01             	lea    0x1(%eax),%ecx
    8002:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8005:	89 d0                	mov    %edx,%eax
    8007:	c1 e0 03             	shl    $0x3,%eax
    800a:	01 d0                	add    %edx,%eax
    800c:	c1 e0 02             	shl    $0x2,%eax
    800f:	01 d0                	add    %edx,%eax
    8011:	01 c8                	add    %ecx,%eax
    8013:	83 c0 14             	add    $0x14,%eax
    8016:	8b 0c 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    801d:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8020:	89 d0                	mov    %edx,%eax
    8022:	c1 e0 03             	shl    $0x3,%eax
    8025:	01 d0                	add    %edx,%eax
    8027:	c1 e0 02             	shl    $0x2,%eax
    802a:	01 d0                	add    %edx,%eax
    802c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    802f:	01 d0                	add    %edx,%eax
    8031:	83 c0 14             	add    $0x14,%eax
    8034:	8b 04 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    803b:	29 c1                	sub    %eax,%ecx
    803d:	89 c8                	mov    %ecx,%eax
    803f:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    8042:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8045:	89 d0                	mov    %edx,%eax
    8047:	c1 e0 03             	shl    $0x3,%eax
    804a:	01 d0                	add    %edx,%eax
    804c:	c1 e0 02             	shl    $0x2,%eax
    804f:	01 d0                	add    %edx,%eax
    8051:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8054:	01 d0                	add    %edx,%eax
    8056:	83 c0 14             	add    $0x14,%eax
    8059:	8b 14 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%edx
    8060:	89 d0                	mov    %edx,%eax
    8062:	01 c0                	add    %eax,%eax
    8064:	01 d0                	add    %edx,%eax
    8066:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    8069:	eb 27                	jmp    8092 <III_dequantize_sample+0x385>
    806b:	eb 25                	jmp    8092 <III_dequantize_sample+0x385>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    806d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8071:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8074:	8d 48 01             	lea    0x1(%eax),%ecx
    8077:	8b 55 dc             	mov    -0x24(%ebp),%edx
    807a:	89 d0                	mov    %edx,%eax
    807c:	c1 e0 03             	shl    $0x3,%eax
    807f:	01 d0                	add    %edx,%eax
    8081:	c1 e0 02             	shl    $0x2,%eax
    8084:	01 d0                	add    %edx,%eax
    8086:	01 c8                	add    %ecx,%eax
    8088:	8b 04 85 80 ec 00 00 	mov    0xec80(,%eax,4),%eax
    808f:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    8092:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8095:	89 d0                	mov    %edx,%eax
    8097:	c1 e0 03             	shl    $0x3,%eax
    809a:	01 d0                	add    %edx,%eax
    809c:	c1 e0 04             	shl    $0x4,%eax
    809f:	89 c2                	mov    %eax,%edx
    80a1:	8b 45 0c             	mov    0xc(%ebp),%eax
    80a4:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    80a7:	8b 45 14             	mov    0x14(%ebp),%eax
    80aa:	8b 40 08             	mov    0x8(%eax),%eax
    80ad:	89 45 c8             	mov    %eax,-0x38(%ebp)
    80b0:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    80b7:	df 6d c8             	fildll -0x38(%ebp)
    80ba:	dd 5d d0             	fstpl  -0x30(%ebp)
    80bd:	dd 45 d0             	fldl   -0x30(%ebp)
    80c0:	dd 05 50 d2 00 00    	fldl   0xd250
    80c6:	de e9                	fsubrp %st,%st(1)
    80c8:	dd 05 58 d2 00 00    	fldl   0xd258
    80ce:	de c9                	fmulp  %st,%st(1)
    80d0:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    80d4:	dd 1c 24             	fstpl  (%esp)
    80d7:	dd 05 60 d2 00 00    	fldl   0xd260
    80dd:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    80e1:	dd 1c 24             	fstpl  (%esp)
    80e4:	e8 96 c1 ff ff       	call   427f <pow>
    80e9:	83 c4 10             	add    $0x10,%esp
    80ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    80ef:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    80f2:	8b 45 14             	mov    0x14(%ebp),%eax
    80f5:	8b 40 10             	mov    0x10(%eax),%eax
    80f8:	85 c0                	test   %eax,%eax
    80fa:	0f 84 9c 01 00 00    	je     829c <III_dequantize_sample+0x58f>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    8100:	8b 45 14             	mov    0x14(%ebp),%eax
    8103:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    8106:	83 f8 02             	cmp    $0x2,%eax
    8109:	75 0a                	jne    8115 <III_dequantize_sample+0x408>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    810b:	8b 45 14             	mov    0x14(%ebp),%eax
    810e:	8b 40 18             	mov    0x18(%eax),%eax
    8111:	85 c0                	test   %eax,%eax
    8113:	74 27                	je     813c <III_dequantize_sample+0x42f>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    8115:	8b 45 14             	mov    0x14(%ebp),%eax
    8118:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    811b:	83 f8 02             	cmp    $0x2,%eax
    811e:	0f 85 78 01 00 00    	jne    829c <III_dequantize_sample+0x58f>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    8124:	8b 45 14             	mov    0x14(%ebp),%eax
    8127:	8b 40 18             	mov    0x18(%eax),%eax
    812a:	85 c0                	test   %eax,%eax
    812c:	0f 84 6a 01 00 00    	je     829c <III_dequantize_sample+0x58f>
    8132:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    8136:	0f 8e 60 01 00 00    	jle    829c <III_dequantize_sample+0x58f>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    813c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    813f:	89 d0                	mov    %edx,%eax
    8141:	c1 e0 03             	shl    $0x3,%eax
    8144:	01 d0                	add    %edx,%eax
    8146:	01 c0                	add    %eax,%eax
    8148:	89 c2                	mov    %eax,%edx
    814a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    814d:	01 d0                	add    %edx,%eax
    814f:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    8152:	99                   	cltd   
    8153:	f7 7d e0             	idivl  -0x20(%ebp)
    8156:	89 c2                	mov    %eax,%edx
    8158:	8b 45 14             	mov    0x14(%ebp),%eax
    815b:	83 c2 08             	add    $0x8,%edx
    815e:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    8162:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8165:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    816c:	df 6d c8             	fildll -0x38(%ebp)
    816f:	dd 5d d0             	fstpl  -0x30(%ebp)
    8172:	dd 45 d0             	fldl   -0x30(%ebp)
    8175:	dd 05 68 d2 00 00    	fldl   0xd268
    817b:	de c9                	fmulp  %st,%st(1)
    817d:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8181:	dd 1c 24             	fstpl  (%esp)
    8184:	dd 05 60 d2 00 00    	fldl   0xd260
    818a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    818e:	dd 1c 24             	fstpl  (%esp)
    8191:	e8 e9 c0 ff ff       	call   427f <pow>
    8196:	83 c4 10             	add    $0x10,%esp
    8199:	8b 55 f0             	mov    -0x10(%ebp),%edx
    819c:	89 d0                	mov    %edx,%eax
    819e:	c1 e0 03             	shl    $0x3,%eax
    81a1:	01 d0                	add    %edx,%eax
    81a3:	c1 e0 04             	shl    $0x4,%eax
    81a6:	89 c2                	mov    %eax,%edx
    81a8:	8b 45 0c             	mov    0xc(%ebp),%eax
    81ab:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    81ae:	8b 55 f0             	mov    -0x10(%ebp),%edx
    81b1:	89 d0                	mov    %edx,%eax
    81b3:	c1 e0 03             	shl    $0x3,%eax
    81b6:	01 d0                	add    %edx,%eax
    81b8:	c1 e0 04             	shl    $0x4,%eax
    81bb:	89 c2                	mov    %eax,%edx
    81bd:	8b 45 0c             	mov    0xc(%ebp),%eax
    81c0:	01 c2                	add    %eax,%edx
    81c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    81c5:	dd 04 c2             	fldl   (%edx,%eax,8)
    81c8:	de c9                	fmulp  %st,%st(1)
    81ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    81cd:	dd 1c c1             	fstpl  (%ecx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    81d0:	8b 45 14             	mov    0x14(%ebp),%eax
    81d3:	8b 40 40             	mov    0x40(%eax),%eax
    81d6:	89 45 c8             	mov    %eax,-0x38(%ebp)
    81d9:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    81e0:	df 6d c8             	fildll -0x38(%ebp)
    81e3:	dd 5d d0             	fstpl  -0x30(%ebp)
    81e6:	dd 45 d0             	fldl   -0x30(%ebp)
    81e9:	d9 e8                	fld1   
    81eb:	de c1                	faddp  %st,%st(1)
    81ed:	dd 05 70 d2 00 00    	fldl   0xd270
    81f3:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    81f5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    81f8:	89 d0                	mov    %edx,%eax
    81fa:	c1 e0 03             	shl    $0x3,%eax
    81fd:	01 d0                	add    %edx,%eax
    81ff:	01 c0                	add    %eax,%eax
    8201:	89 c2                	mov    %eax,%edx
    8203:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8206:	01 d0                	add    %edx,%eax
    8208:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    820b:	99                   	cltd   
    820c:	f7 7d e0             	idivl  -0x20(%ebp)
    820f:	89 c2                	mov    %eax,%edx
    8211:	8b 5d 10             	mov    0x10(%ebp),%ebx
    8214:	8b 4d 18             	mov    0x18(%ebp),%ecx
    8217:	89 d0                	mov    %edx,%eax
    8219:	01 c0                	add    %eax,%eax
    821b:	01 d0                	add    %edx,%eax
    821d:	c1 e0 02             	shl    $0x2,%eax
    8220:	01 d0                	add    %edx,%eax
    8222:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    8225:	89 d1                	mov    %edx,%ecx
    8227:	89 ca                	mov    %ecx,%edx
    8229:	c1 e2 05             	shl    $0x5,%edx
    822c:	29 ca                	sub    %ecx,%edx
    822e:	01 c2                	add    %eax,%edx
    8230:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8233:	01 d0                	add    %edx,%eax
    8235:	83 c0 14             	add    $0x14,%eax
    8238:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    823c:	89 45 c8             	mov    %eax,-0x38(%ebp)
    823f:	db 45 c8             	fildl  -0x38(%ebp)
    8242:	de c9                	fmulp  %st,%st(1)
    8244:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8248:	dd 1c 24             	fstpl  (%esp)
    824b:	dd 05 60 d2 00 00    	fldl   0xd260
    8251:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8255:	dd 1c 24             	fstpl  (%esp)
    8258:	e8 22 c0 ff ff       	call   427f <pow>
    825d:	83 c4 10             	add    $0x10,%esp
    8260:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8263:	89 d0                	mov    %edx,%eax
    8265:	c1 e0 03             	shl    $0x3,%eax
    8268:	01 d0                	add    %edx,%eax
    826a:	c1 e0 04             	shl    $0x4,%eax
    826d:	89 c2                	mov    %eax,%edx
    826f:	8b 45 0c             	mov    0xc(%ebp),%eax
    8272:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8275:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8278:	89 d0                	mov    %edx,%eax
    827a:	c1 e0 03             	shl    $0x3,%eax
    827d:	01 d0                	add    %edx,%eax
    827f:	c1 e0 04             	shl    $0x4,%eax
    8282:	89 c2                	mov    %eax,%edx
    8284:	8b 45 0c             	mov    0xc(%ebp),%eax
    8287:	01 c2                	add    %eax,%edx
    8289:	8b 45 f4             	mov    -0xc(%ebp),%eax
    828c:	dd 04 c2             	fldl   (%edx,%eax,8)
    828f:	de c9                	fmulp  %st,%st(1)
    8291:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8294:	dd 1c c1             	fstpl  (%ecx,%eax,8)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    8297:	e9 c0 00 00 00       	jmp    835c <III_dequantize_sample+0x64f>
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    829c:	8b 45 14             	mov    0x14(%ebp),%eax
    829f:	8b 40 40             	mov    0x40(%eax),%eax
    82a2:	89 45 c8             	mov    %eax,-0x38(%ebp)
    82a5:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    82ac:	df 6d c8             	fildll -0x38(%ebp)
    82af:	dd 5d d0             	fstpl  -0x30(%ebp)
    82b2:	dd 45 d0             	fldl   -0x30(%ebp)
    82b5:	d9 e8                	fld1   
    82b7:	de c1                	faddp  %st,%st(1)
    82b9:	dd 05 70 d2 00 00    	fldl   0xd270
    82bf:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    82c1:	8b 4d 10             	mov    0x10(%ebp),%ecx
    82c4:	8b 45 18             	mov    0x18(%ebp),%eax
    82c7:	89 c2                	mov    %eax,%edx
    82c9:	8d 04 12             	lea    (%edx,%edx,1),%eax
    82cc:	89 c2                	mov    %eax,%edx
    82ce:	89 d0                	mov    %edx,%eax
    82d0:	c1 e0 05             	shl    $0x5,%eax
    82d3:	29 d0                	sub    %edx,%eax
    82d5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    82d8:	01 d0                	add    %edx,%eax
    82da:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    82dd:	89 c1                	mov    %eax,%ecx
    82df:	8b 45 14             	mov    0x14(%ebp),%eax
    82e2:	8b 50 3c             	mov    0x3c(%eax),%edx
    82e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    82e8:	8b 04 85 40 ee 00 00 	mov    0xee40(,%eax,4),%eax
    82ef:	0f af c2             	imul   %edx,%eax
    82f2:	01 c8                	add    %ecx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    82f4:	89 45 c8             	mov    %eax,-0x38(%ebp)
    82f7:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    82fe:	df 6d c8             	fildll -0x38(%ebp)
    8301:	dd 5d d0             	fstpl  -0x30(%ebp)
    8304:	dd 45 d0             	fldl   -0x30(%ebp)
    8307:	de c9                	fmulp  %st,%st(1)
    8309:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    830d:	dd 1c 24             	fstpl  (%esp)
    8310:	dd 05 60 d2 00 00    	fldl   0xd260
    8316:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    831a:	dd 1c 24             	fstpl  (%esp)
    831d:	e8 5d bf ff ff       	call   427f <pow>
    8322:	83 c4 10             	add    $0x10,%esp
    8325:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8328:	89 d0                	mov    %edx,%eax
    832a:	c1 e0 03             	shl    $0x3,%eax
    832d:	01 d0                	add    %edx,%eax
    832f:	c1 e0 04             	shl    $0x4,%eax
    8332:	89 c2                	mov    %eax,%edx
    8334:	8b 45 0c             	mov    0xc(%ebp),%eax
    8337:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    833a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    833d:	89 d0                	mov    %edx,%eax
    833f:	c1 e0 03             	shl    $0x3,%eax
    8342:	01 d0                	add    %edx,%eax
    8344:	c1 e0 04             	shl    $0x4,%eax
    8347:	89 c2                	mov    %eax,%edx
    8349:	8b 45 0c             	mov    0xc(%ebp),%eax
    834c:	01 c2                	add    %eax,%edx
    834e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8351:	dd 04 c2             	fldl   (%edx,%eax,8)
    8354:	de c9                	fmulp  %st,%st(1)
    8356:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8359:	dd 1c c1             	fstpl  (%ecx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    835c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    835f:	89 d0                	mov    %edx,%eax
    8361:	c1 e0 03             	shl    $0x3,%eax
    8364:	01 d0                	add    %edx,%eax
    8366:	c1 e0 03             	shl    $0x3,%eax
    8369:	89 c2                	mov    %eax,%edx
    836b:	8b 45 08             	mov    0x8(%ebp),%eax
    836e:	01 c2                	add    %eax,%edx
    8370:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8373:	8b 04 82             	mov    (%edx,%eax,4),%eax
    8376:	c1 e8 1f             	shr    $0x1f,%eax
    8379:	0f b6 c0             	movzbl %al,%eax
    837c:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    837f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8382:	89 d0                	mov    %edx,%eax
    8384:	c1 e0 03             	shl    $0x3,%eax
    8387:	01 d0                	add    %edx,%eax
    8389:	c1 e0 03             	shl    $0x3,%eax
    838c:	89 c2                	mov    %eax,%edx
    838e:	8b 45 08             	mov    0x8(%ebp),%eax
    8391:	01 c2                	add    %eax,%edx
    8393:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8396:	8b 04 82             	mov    (%edx,%eax,4),%eax
    8399:	83 ec 0c             	sub    $0xc,%esp
    839c:	50                   	push   %eax
    839d:	e8 c7 bd ff ff       	call   4169 <abs>
    83a2:	83 c4 10             	add    $0x10,%esp
    83a5:	89 45 c8             	mov    %eax,-0x38(%ebp)
    83a8:	db 45 c8             	fildl  -0x38(%ebp)
    83ab:	dd 05 78 d2 00 00    	fldl   0xd278
    83b1:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    83b5:	dd 1c 24             	fstpl  (%esp)
    83b8:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    83bc:	dd 1c 24             	fstpl  (%esp)
    83bf:	e8 bb be ff ff       	call   427f <pow>
    83c4:	83 c4 10             	add    $0x10,%esp
    83c7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    83ca:	89 d0                	mov    %edx,%eax
    83cc:	c1 e0 03             	shl    $0x3,%eax
    83cf:	01 d0                	add    %edx,%eax
    83d1:	c1 e0 04             	shl    $0x4,%eax
    83d4:	89 c2                	mov    %eax,%edx
    83d6:	8b 45 0c             	mov    0xc(%ebp),%eax
    83d9:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    83dc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    83df:	89 d0                	mov    %edx,%eax
    83e1:	c1 e0 03             	shl    $0x3,%eax
    83e4:	01 d0                	add    %edx,%eax
    83e6:	c1 e0 04             	shl    $0x4,%eax
    83e9:	89 c2                	mov    %eax,%edx
    83eb:	8b 45 0c             	mov    0xc(%ebp),%eax
    83ee:	01 c2                	add    %eax,%edx
    83f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    83f3:	dd 04 c2             	fldl   (%edx,%eax,8)
    83f6:	de c9                	fmulp  %st,%st(1)
    83f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    83fb:	dd 1c c1             	fstpl  (%ecx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    83fe:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    8402:	74 37                	je     843b <III_dequantize_sample+0x72e>
    8404:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8407:	89 d0                	mov    %edx,%eax
    8409:	c1 e0 03             	shl    $0x3,%eax
    840c:	01 d0                	add    %edx,%eax
    840e:	c1 e0 04             	shl    $0x4,%eax
    8411:	89 c2                	mov    %eax,%edx
    8413:	8b 45 0c             	mov    0xc(%ebp),%eax
    8416:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8419:	8b 55 f0             	mov    -0x10(%ebp),%edx
    841c:	89 d0                	mov    %edx,%eax
    841e:	c1 e0 03             	shl    $0x3,%eax
    8421:	01 d0                	add    %edx,%eax
    8423:	c1 e0 04             	shl    $0x4,%eax
    8426:	89 c2                	mov    %eax,%edx
    8428:	8b 45 0c             	mov    0xc(%ebp),%eax
    842b:	01 c2                	add    %eax,%edx
    842d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8430:	dd 04 c2             	fldl   (%edx,%eax,8)
    8433:	d9 e0                	fchs   
    8435:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8438:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    843b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    843f:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    8443:	0f 8e 86 f9 ff ff    	jle    7dcf <III_dequantize_sample+0xc2>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    8449:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    844d:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    8451:	0f 8e 6c f9 ff ff    	jle    7dc3 <III_dequantize_sample+0xb6>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    8457:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    845a:	c9                   	leave  
    845b:	c3                   	ret    

0000845c <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    845c:	55                   	push   %ebp
    845d:	89 e5                	mov    %esp,%ebp
    845f:	57                   	push   %edi
    8460:	56                   	push   %esi
    8461:	53                   	push   %ebx
    8462:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    8465:	8b 45 14             	mov    0x14(%ebp),%eax
    8468:	8b 00                	mov    (%eax),%eax
    846a:	8b 40 10             	mov    0x10(%eax),%eax
    846d:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    8470:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    8477:	eb 33                	jmp    84ac <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    8479:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    8480:	eb 20                	jmp    84a2 <III_reorder+0x46>
         ro[sb][ss] = 0;
    8482:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8485:	89 d0                	mov    %edx,%eax
    8487:	c1 e0 03             	shl    $0x3,%eax
    848a:	01 d0                	add    %edx,%eax
    848c:	c1 e0 04             	shl    $0x4,%eax
    848f:	89 c2                	mov    %eax,%edx
    8491:	8b 45 0c             	mov    0xc(%ebp),%eax
    8494:	01 c2                	add    %eax,%edx
    8496:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8499:	d9 ee                	fldz   
    849b:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    849e:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    84a2:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    84a6:	7e da                	jle    8482 <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    84a8:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    84ac:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    84b0:	7e c7                	jle    8479 <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    84b2:	8b 45 10             	mov    0x10(%ebp),%eax
    84b5:	8b 40 10             	mov    0x10(%eax),%eax
    84b8:	85 c0                	test   %eax,%eax
    84ba:	0f 84 b8 03 00 00    	je     8878 <III_reorder+0x41c>
    84c0:	8b 45 10             	mov    0x10(%ebp),%eax
    84c3:	8b 40 14             	mov    0x14(%eax),%eax
    84c6:	83 f8 02             	cmp    $0x2,%eax
    84c9:	0f 85 a9 03 00 00    	jne    8878 <III_reorder+0x41c>
      if (gr_info->mixed_block_flag) {
    84cf:	8b 45 10             	mov    0x10(%ebp),%eax
    84d2:	8b 40 18             	mov    0x18(%eax),%eax
    84d5:	85 c0                	test   %eax,%eax
    84d7:	0f 84 06 02 00 00    	je     86e3 <III_reorder+0x287>
         for (sb=0 ; sb < 2 ; sb++)
    84dd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    84e4:	eb 4c                	jmp    8532 <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    84e6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    84ed:	eb 39                	jmp    8528 <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    84ef:	8b 55 e0             	mov    -0x20(%ebp),%edx
    84f2:	89 d0                	mov    %edx,%eax
    84f4:	c1 e0 03             	shl    $0x3,%eax
    84f7:	01 d0                	add    %edx,%eax
    84f9:	c1 e0 04             	shl    $0x4,%eax
    84fc:	89 c2                	mov    %eax,%edx
    84fe:	8b 45 0c             	mov    0xc(%ebp),%eax
    8501:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8504:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8507:	89 d0                	mov    %edx,%eax
    8509:	c1 e0 03             	shl    $0x3,%eax
    850c:	01 d0                	add    %edx,%eax
    850e:	c1 e0 04             	shl    $0x4,%eax
    8511:	89 c2                	mov    %eax,%edx
    8513:	8b 45 08             	mov    0x8(%ebp),%eax
    8516:	01 c2                	add    %eax,%edx
    8518:	8b 45 dc             	mov    -0x24(%ebp),%eax
    851b:	dd 04 c2             	fldl   (%edx,%eax,8)
    851e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8521:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    8524:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8528:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    852c:	7e c1                	jle    84ef <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    852e:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8532:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    8536:	7e ae                	jle    84e6 <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    8538:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    853f:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8542:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8548:	83 c0 5c             	add    $0x5c,%eax
    854b:	05 80 ec 00 00       	add    $0xec80,%eax
    8550:	8b 40 0c             	mov    0xc(%eax),%eax
    8553:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    8556:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8559:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    855f:	83 c0 60             	add    $0x60,%eax
    8562:	05 80 ec 00 00       	add    $0xec80,%eax
    8567:	8b 40 0c             	mov    0xc(%eax),%eax
    856a:	2b 45 e8             	sub    -0x18(%ebp),%eax
    856d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    8570:	e9 5f 01 00 00       	jmp    86d4 <III_reorder+0x278>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8575:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    857c:	e9 fd 00 00 00       	jmp    867e <III_reorder+0x222>
                  for(freq=0;freq<sfb_lines;freq++) {
    8581:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    8588:	e9 e1 00 00 00       	jmp    866e <III_reorder+0x212>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    858d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8590:	89 d0                	mov    %edx,%eax
    8592:	01 c0                	add    %eax,%eax
    8594:	01 c2                	add    %eax,%edx
    8596:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8599:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    859d:	01 c2                	add    %eax,%edx
    859f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    85a2:	01 d0                	add    %edx,%eax
    85a4:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    85a7:	8b 55 e8             	mov    -0x18(%ebp),%edx
    85aa:	89 d0                	mov    %edx,%eax
    85ac:	01 c0                	add    %eax,%eax
    85ae:	01 c2                	add    %eax,%edx
    85b0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    85b3:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    85b6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    85b9:	89 d0                	mov    %edx,%eax
    85bb:	01 c0                	add    %eax,%eax
    85bd:	01 d0                	add    %edx,%eax
    85bf:	01 c8                	add    %ecx,%eax
    85c1:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    85c4:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    85c7:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    85cc:	89 c8                	mov    %ecx,%eax
    85ce:	f7 ea                	imul   %edx
    85d0:	c1 fa 02             	sar    $0x2,%edx
    85d3:	89 c8                	mov    %ecx,%eax
    85d5:	c1 f8 1f             	sar    $0x1f,%eax
    85d8:	29 c2                	sub    %eax,%edx
    85da:	89 d0                	mov    %edx,%eax
    85dc:	89 c2                	mov    %eax,%edx
    85de:	89 d0                	mov    %edx,%eax
    85e0:	c1 e0 03             	shl    $0x3,%eax
    85e3:	01 d0                	add    %edx,%eax
    85e5:	c1 e0 04             	shl    $0x4,%eax
    85e8:	89 c2                	mov    %eax,%edx
    85ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    85ed:	8d 34 02             	lea    (%edx,%eax,1),%esi
    85f0:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    85f3:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    85f8:	89 d8                	mov    %ebx,%eax
    85fa:	f7 ea                	imul   %edx
    85fc:	c1 fa 02             	sar    $0x2,%edx
    85ff:	89 d8                	mov    %ebx,%eax
    8601:	c1 f8 1f             	sar    $0x1f,%eax
    8604:	89 d1                	mov    %edx,%ecx
    8606:	29 c1                	sub    %eax,%ecx
    8608:	89 c8                	mov    %ecx,%eax
    860a:	c1 e0 03             	shl    $0x3,%eax
    860d:	01 c8                	add    %ecx,%eax
    860f:	01 c0                	add    %eax,%eax
    8611:	29 c3                	sub    %eax,%ebx
    8613:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    8615:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8618:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    861d:	89 d8                	mov    %ebx,%eax
    861f:	f7 ea                	imul   %edx
    8621:	c1 fa 02             	sar    $0x2,%edx
    8624:	89 d8                	mov    %ebx,%eax
    8626:	c1 f8 1f             	sar    $0x1f,%eax
    8629:	29 c2                	sub    %eax,%edx
    862b:	89 d0                	mov    %edx,%eax
    862d:	89 c2                	mov    %eax,%edx
    862f:	89 d0                	mov    %edx,%eax
    8631:	c1 e0 03             	shl    $0x3,%eax
    8634:	01 d0                	add    %edx,%eax
    8636:	c1 e0 04             	shl    $0x4,%eax
    8639:	89 c2                	mov    %eax,%edx
    863b:	8b 45 08             	mov    0x8(%ebp),%eax
    863e:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    8641:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8644:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8649:	89 d8                	mov    %ebx,%eax
    864b:	f7 ea                	imul   %edx
    864d:	c1 fa 02             	sar    $0x2,%edx
    8650:	89 d8                	mov    %ebx,%eax
    8652:	c1 f8 1f             	sar    $0x1f,%eax
    8655:	29 c2                	sub    %eax,%edx
    8657:	89 d0                	mov    %edx,%eax
    8659:	c1 e0 03             	shl    $0x3,%eax
    865c:	01 d0                	add    %edx,%eax
    865e:	01 c0                	add    %eax,%eax
    8660:	29 c3                	sub    %eax,%ebx
    8662:	89 da                	mov    %ebx,%edx
    8664:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8667:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    866a:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    866e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8671:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    8674:	0f 8c 13 ff ff ff    	jl     858d <III_reorder+0x131>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    867a:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    867e:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    8682:	0f 8e f9 fe ff ff    	jle    8581 <III_reorder+0x125>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    8688:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    868c:	8b 55 d0             	mov    -0x30(%ebp),%edx
    868f:	89 d0                	mov    %edx,%eax
    8691:	c1 e0 03             	shl    $0x3,%eax
    8694:	01 d0                	add    %edx,%eax
    8696:	c1 e0 02             	shl    $0x2,%eax
    8699:	01 d0                	add    %edx,%eax
    869b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    869e:	01 d0                	add    %edx,%eax
    86a0:	83 c0 14             	add    $0x14,%eax
    86a3:	8b 04 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%eax
    86aa:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    86ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
    86b0:	8d 48 01             	lea    0x1(%eax),%ecx
    86b3:	8b 55 d0             	mov    -0x30(%ebp),%edx
    86b6:	89 d0                	mov    %edx,%eax
    86b8:	c1 e0 03             	shl    $0x3,%eax
    86bb:	01 d0                	add    %edx,%eax
    86bd:	c1 e0 02             	shl    $0x2,%eax
    86c0:	01 d0                	add    %edx,%eax
    86c2:	01 c8                	add    %ecx,%eax
    86c4:	83 c0 14             	add    $0x14,%eax
    86c7:	8b 04 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%eax
    86ce:	2b 45 e8             	sub    -0x18(%ebp),%eax
    86d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    86d4:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    86d8:	0f 8e 97 fe ff ff    	jle    8575 <III_reorder+0x119>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    86de:	e9 f0 01 00 00       	jmp    88d3 <III_reorder+0x477>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    86e3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    86ea:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    86f1:	8b 45 d0             	mov    -0x30(%ebp),%eax
    86f4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    86fa:	83 c0 54             	add    $0x54,%eax
    86fd:	05 80 ec 00 00       	add    $0xec80,%eax
    8702:	8b 40 0c             	mov    0xc(%eax),%eax
    8705:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    8708:	e9 5f 01 00 00       	jmp    886c <III_reorder+0x410>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    870d:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    8714:	e9 fd 00 00 00       	jmp    8816 <III_reorder+0x3ba>
                  for(freq=0;freq<sfb_lines;freq++) {
    8719:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    8720:	e9 e1 00 00 00       	jmp    8806 <III_reorder+0x3aa>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    8725:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8728:	89 d0                	mov    %edx,%eax
    872a:	01 c0                	add    %eax,%eax
    872c:	01 c2                	add    %eax,%edx
    872e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8731:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    8735:	01 c2                	add    %eax,%edx
    8737:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    873a:	01 d0                	add    %edx,%eax
    873c:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    873f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8742:	89 d0                	mov    %edx,%eax
    8744:	01 c0                	add    %eax,%eax
    8746:	01 c2                	add    %eax,%edx
    8748:	8b 45 d8             	mov    -0x28(%ebp),%eax
    874b:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    874e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    8751:	89 d0                	mov    %edx,%eax
    8753:	01 c0                	add    %eax,%eax
    8755:	01 d0                	add    %edx,%eax
    8757:	01 c8                	add    %ecx,%eax
    8759:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    875c:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    875f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8764:	89 c8                	mov    %ecx,%eax
    8766:	f7 ea                	imul   %edx
    8768:	c1 fa 02             	sar    $0x2,%edx
    876b:	89 c8                	mov    %ecx,%eax
    876d:	c1 f8 1f             	sar    $0x1f,%eax
    8770:	29 c2                	sub    %eax,%edx
    8772:	89 d0                	mov    %edx,%eax
    8774:	89 c2                	mov    %eax,%edx
    8776:	89 d0                	mov    %edx,%eax
    8778:	c1 e0 03             	shl    $0x3,%eax
    877b:	01 d0                	add    %edx,%eax
    877d:	c1 e0 04             	shl    $0x4,%eax
    8780:	89 c2                	mov    %eax,%edx
    8782:	8b 45 0c             	mov    0xc(%ebp),%eax
    8785:	8d 34 02             	lea    (%edx,%eax,1),%esi
    8788:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    878b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8790:	89 d8                	mov    %ebx,%eax
    8792:	f7 ea                	imul   %edx
    8794:	c1 fa 02             	sar    $0x2,%edx
    8797:	89 d8                	mov    %ebx,%eax
    8799:	c1 f8 1f             	sar    $0x1f,%eax
    879c:	89 d1                	mov    %edx,%ecx
    879e:	29 c1                	sub    %eax,%ecx
    87a0:	89 c8                	mov    %ecx,%eax
    87a2:	c1 e0 03             	shl    $0x3,%eax
    87a5:	01 c8                	add    %ecx,%eax
    87a7:	01 c0                	add    %eax,%eax
    87a9:	29 c3                	sub    %eax,%ebx
    87ab:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    87ad:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    87b0:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    87b5:	89 d8                	mov    %ebx,%eax
    87b7:	f7 ea                	imul   %edx
    87b9:	c1 fa 02             	sar    $0x2,%edx
    87bc:	89 d8                	mov    %ebx,%eax
    87be:	c1 f8 1f             	sar    $0x1f,%eax
    87c1:	29 c2                	sub    %eax,%edx
    87c3:	89 d0                	mov    %edx,%eax
    87c5:	89 c2                	mov    %eax,%edx
    87c7:	89 d0                	mov    %edx,%eax
    87c9:	c1 e0 03             	shl    $0x3,%eax
    87cc:	01 d0                	add    %edx,%eax
    87ce:	c1 e0 04             	shl    $0x4,%eax
    87d1:	89 c2                	mov    %eax,%edx
    87d3:	8b 45 08             	mov    0x8(%ebp),%eax
    87d6:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    87d9:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    87dc:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    87e1:	89 d8                	mov    %ebx,%eax
    87e3:	f7 ea                	imul   %edx
    87e5:	c1 fa 02             	sar    $0x2,%edx
    87e8:	89 d8                	mov    %ebx,%eax
    87ea:	c1 f8 1f             	sar    $0x1f,%eax
    87ed:	29 c2                	sub    %eax,%edx
    87ef:	89 d0                	mov    %edx,%eax
    87f1:	c1 e0 03             	shl    $0x3,%eax
    87f4:	01 d0                	add    %edx,%eax
    87f6:	01 c0                	add    %eax,%eax
    87f8:	29 c3                	sub    %eax,%ebx
    87fa:	89 da                	mov    %ebx,%edx
    87fc:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    87ff:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    8802:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    8806:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8809:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    880c:	0f 8c 13 ff ff ff    	jl     8725 <III_reorder+0x2c9>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8812:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    8816:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    881a:	0f 8e f9 fe ff ff    	jle    8719 <III_reorder+0x2bd>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    8820:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8824:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8827:	89 d0                	mov    %edx,%eax
    8829:	c1 e0 03             	shl    $0x3,%eax
    882c:	01 d0                	add    %edx,%eax
    882e:	c1 e0 02             	shl    $0x2,%eax
    8831:	01 d0                	add    %edx,%eax
    8833:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8836:	01 d0                	add    %edx,%eax
    8838:	83 c0 14             	add    $0x14,%eax
    883b:	8b 04 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%eax
    8842:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    8845:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8848:	8d 48 01             	lea    0x1(%eax),%ecx
    884b:	8b 55 d0             	mov    -0x30(%ebp),%edx
    884e:	89 d0                	mov    %edx,%eax
    8850:	c1 e0 03             	shl    $0x3,%eax
    8853:	01 d0                	add    %edx,%eax
    8855:	c1 e0 02             	shl    $0x2,%eax
    8858:	01 d0                	add    %edx,%eax
    885a:	01 c8                	add    %ecx,%eax
    885c:	83 c0 14             	add    $0x14,%eax
    885f:	8b 04 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%eax
    8866:	2b 45 e8             	sub    -0x18(%ebp),%eax
    8869:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    886c:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    8870:	0f 8e 97 fe ff ff    	jle    870d <III_reorder+0x2b1>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    8876:	eb 5b                	jmp    88d3 <III_reorder+0x477>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    8878:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    887f:	eb 4c                	jmp    88cd <III_reorder+0x471>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    8881:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    8888:	eb 39                	jmp    88c3 <III_reorder+0x467>
            ro[sb][ss] = xr[sb][ss];
    888a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    888d:	89 d0                	mov    %edx,%eax
    888f:	c1 e0 03             	shl    $0x3,%eax
    8892:	01 d0                	add    %edx,%eax
    8894:	c1 e0 04             	shl    $0x4,%eax
    8897:	89 c2                	mov    %eax,%edx
    8899:	8b 45 0c             	mov    0xc(%ebp),%eax
    889c:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    889f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    88a2:	89 d0                	mov    %edx,%eax
    88a4:	c1 e0 03             	shl    $0x3,%eax
    88a7:	01 d0                	add    %edx,%eax
    88a9:	c1 e0 04             	shl    $0x4,%eax
    88ac:	89 c2                	mov    %eax,%edx
    88ae:	8b 45 08             	mov    0x8(%ebp),%eax
    88b1:	01 c2                	add    %eax,%edx
    88b3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    88b6:	dd 04 c2             	fldl   (%edx,%eax,8)
    88b9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    88bc:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    88bf:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    88c3:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    88c7:	7e c1                	jle    888a <III_reorder+0x42e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    88c9:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    88cd:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    88d1:	7e ae                	jle    8881 <III_reorder+0x425>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    88d3:	83 c4 34             	add    $0x34,%esp
    88d6:	5b                   	pop    %ebx
    88d7:	5e                   	pop    %esi
    88d8:	5f                   	pop    %edi
    88d9:	5d                   	pop    %ebp
    88da:	c3                   	ret    

000088db <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    88db:	55                   	push   %ebp
    88dc:	89 e5                	mov    %esp,%ebp
    88de:	56                   	push   %esi
    88df:	53                   	push   %ebx
    88e0:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    88e6:	8b 45 18             	mov    0x18(%ebp),%eax
    88e9:	8b 00                	mov    (%eax),%eax
    88eb:	8b 40 10             	mov    0x10(%eax),%eax
    88ee:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    88f1:	8b 45 18             	mov    0x18(%ebp),%eax
    88f4:	8b 40 08             	mov    0x8(%eax),%eax
    88f7:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    88fa:	8b 45 18             	mov    0x18(%ebp),%eax
    88fd:	8b 00                	mov    (%eax),%eax
    88ff:	8b 40 1c             	mov    0x1c(%eax),%eax
    8902:	83 f8 01             	cmp    $0x1,%eax
    8905:	75 16                	jne    891d <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    8907:	8b 45 18             	mov    0x18(%ebp),%eax
    890a:	8b 00                	mov    (%eax),%eax
    890c:	8b 40 20             	mov    0x20(%eax),%eax
    890f:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8912:	85 c0                	test   %eax,%eax
    8914:	74 07                	je     891d <III_stereo+0x42>
    8916:	b8 01 00 00 00       	mov    $0x1,%eax
    891b:	eb 05                	jmp    8922 <III_stereo+0x47>
    891d:	b8 00 00 00 00       	mov    $0x0,%eax
    8922:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8925:	8b 45 18             	mov    0x18(%ebp),%eax
    8928:	8b 00                	mov    (%eax),%eax
    892a:	8b 40 1c             	mov    0x1c(%eax),%eax
    892d:	83 f8 01             	cmp    $0x1,%eax
    8930:	75 16                	jne    8948 <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    8932:	8b 45 18             	mov    0x18(%ebp),%eax
    8935:	8b 00                	mov    (%eax),%eax
    8937:	8b 40 20             	mov    0x20(%eax),%eax
    893a:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    893d:	85 c0                	test   %eax,%eax
    893f:	74 07                	je     8948 <III_stereo+0x6d>
    8941:	b8 01 00 00 00       	mov    $0x1,%eax
    8946:	eb 05                	jmp    894d <III_stereo+0x72>
    8948:	b8 00 00 00 00       	mov    $0x0,%eax
    894d:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    8950:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8957:	eb 12                	jmp    896b <III_stereo+0x90>
      is_pos[i] = 7;
    8959:	8b 45 f0             	mov    -0x10(%ebp),%eax
    895c:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    8963:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    8967:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    896b:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    8972:	7e e5                	jle    8959 <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    8974:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    8978:	0f 85 65 0a 00 00    	jne    93e3 <III_stereo+0xb08>
    897e:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    8982:	0f 84 5b 0a 00 00    	je     93e3 <III_stereo+0xb08>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    8988:	8b 45 14             	mov    0x14(%ebp),%eax
    898b:	8b 40 10             	mov    0x10(%eax),%eax
    898e:	85 c0                	test   %eax,%eax
    8990:	0f 84 4d 08 00 00    	je     91e3 <III_stereo+0x908>
    8996:	8b 45 14             	mov    0x14(%ebp),%eax
    8999:	8b 40 14             	mov    0x14(%eax),%eax
    899c:	83 f8 02             	cmp    $0x2,%eax
    899f:	0f 85 3e 08 00 00    	jne    91e3 <III_stereo+0x908>
      {  if( gr_info->mixed_block_flag )
    89a5:	8b 45 14             	mov    0x14(%ebp),%eax
    89a8:	8b 40 18             	mov    0x18(%eax),%eax
    89ab:	85 c0                	test   %eax,%eax
    89ad:	0f 84 f1 04 00 00    	je     8ea4 <III_stereo+0x5c9>
         {  int max_sfb = 0;
    89b3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    89ba:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    89c1:	e9 32 03 00 00       	jmp    8cf8 <III_stereo+0x41d>
            {  int sfbcnt;
               sfbcnt = 2;
    89c6:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    89cd:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    89d4:	e9 0f 01 00 00       	jmp    8ae8 <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    89d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    89dc:	8d 48 01             	lea    0x1(%eax),%ecx
    89df:	8b 55 c8             	mov    -0x38(%ebp),%edx
    89e2:	89 d0                	mov    %edx,%eax
    89e4:	c1 e0 03             	shl    $0x3,%eax
    89e7:	01 d0                	add    %edx,%eax
    89e9:	c1 e0 02             	shl    $0x2,%eax
    89ec:	01 d0                	add    %edx,%eax
    89ee:	01 c8                	add    %ecx,%eax
    89f0:	83 c0 14             	add    $0x14,%eax
    89f3:	8b 0c 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%ecx
    89fa:	8b 55 c8             	mov    -0x38(%ebp),%edx
    89fd:	89 d0                	mov    %edx,%eax
    89ff:	c1 e0 03             	shl    $0x3,%eax
    8a02:	01 d0                	add    %edx,%eax
    8a04:	c1 e0 02             	shl    $0x2,%eax
    8a07:	01 d0                	add    %edx,%eax
    8a09:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8a0c:	01 d0                	add    %edx,%eax
    8a0e:	83 c0 14             	add    $0x14,%eax
    8a11:	8b 04 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%eax
    8a18:	29 c1                	sub    %eax,%ecx
    8a1a:	89 c8                	mov    %ecx,%eax
    8a1c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    8a1f:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8a22:	89 d0                	mov    %edx,%eax
    8a24:	c1 e0 03             	shl    $0x3,%eax
    8a27:	01 d0                	add    %edx,%eax
    8a29:	c1 e0 02             	shl    $0x2,%eax
    8a2c:	01 d0                	add    %edx,%eax
    8a2e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8a31:	01 d0                	add    %edx,%eax
    8a33:	83 c0 14             	add    $0x14,%eax
    8a36:	8b 14 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%edx
    8a3d:	89 d0                	mov    %edx,%eax
    8a3f:	01 c0                	add    %eax,%eax
    8a41:	01 c2                	add    %eax,%edx
    8a43:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8a46:	83 c0 01             	add    $0x1,%eax
    8a49:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    8a4d:	01 d0                	add    %edx,%eax
    8a4f:	83 e8 01             	sub    $0x1,%eax
    8a52:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    8a55:	e9 80 00 00 00       	jmp    8ada <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    8a5a:	8b 45 08             	mov    0x8(%ebp),%eax
    8a5d:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    8a63:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    8a66:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8a6b:	89 c8                	mov    %ecx,%eax
    8a6d:	f7 ea                	imul   %edx
    8a6f:	c1 fa 02             	sar    $0x2,%edx
    8a72:	89 c8                	mov    %ecx,%eax
    8a74:	c1 f8 1f             	sar    $0x1f,%eax
    8a77:	89 d3                	mov    %edx,%ebx
    8a79:	29 c3                	sub    %eax,%ebx
    8a7b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    8a7e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8a83:	89 c8                	mov    %ecx,%eax
    8a85:	f7 ea                	imul   %edx
    8a87:	c1 fa 02             	sar    $0x2,%edx
    8a8a:	89 c8                	mov    %ecx,%eax
    8a8c:	c1 f8 1f             	sar    $0x1f,%eax
    8a8f:	29 c2                	sub    %eax,%edx
    8a91:	89 d0                	mov    %edx,%eax
    8a93:	c1 e0 03             	shl    $0x3,%eax
    8a96:	01 d0                	add    %edx,%eax
    8a98:	01 c0                	add    %eax,%eax
    8a9a:	29 c1                	sub    %eax,%ecx
    8a9c:	89 ca                	mov    %ecx,%edx
    8a9e:	89 d8                	mov    %ebx,%eax
    8aa0:	c1 e0 03             	shl    $0x3,%eax
    8aa3:	01 d8                	add    %ebx,%eax
    8aa5:	01 c0                	add    %eax,%eax
    8aa7:	01 d0                	add    %edx,%eax
    8aa9:	dd 04 c6             	fldl   (%esi,%eax,8)
    8aac:	d9 ee                	fldz   
    8aae:	df e9                	fucomip %st(1),%st
    8ab0:	7a 0a                	jp     8abc <III_stereo+0x1e1>
    8ab2:	d9 ee                	fldz   
    8ab4:	df e9                	fucomip %st(1),%st
    8ab6:	dd d8                	fstp   %st(0)
    8ab8:	74 18                	je     8ad2 <III_stereo+0x1f7>
    8aba:	eb 02                	jmp    8abe <III_stereo+0x1e3>
    8abc:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    8abe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8ac1:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    8ac4:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    8acb:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    8ad2:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    8ad6:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    8ada:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    8ade:	0f 8f 76 ff ff ff    	jg     8a5a <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    8ae4:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    8ae8:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    8aec:	0f 8f e7 fe ff ff    	jg     89d9 <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    8af2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8af5:	83 c0 01             	add    $0x1,%eax
    8af8:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    8afb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8afe:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    8b01:	7e 06                	jle    8b09 <III_stereo+0x22e>
                  max_sfb = sfb;
    8b03:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8b06:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    8b09:	e9 fa 00 00 00       	jmp    8c08 <III_stereo+0x32d>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    8b0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8b11:	8d 48 01             	lea    0x1(%eax),%ecx
    8b14:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8b17:	89 d0                	mov    %edx,%eax
    8b19:	c1 e0 03             	shl    $0x3,%eax
    8b1c:	01 d0                	add    %edx,%eax
    8b1e:	c1 e0 02             	shl    $0x2,%eax
    8b21:	01 d0                	add    %edx,%eax
    8b23:	01 c8                	add    %ecx,%eax
    8b25:	83 c0 14             	add    $0x14,%eax
    8b28:	8b 0c 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%ecx
    8b2f:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8b32:	89 d0                	mov    %edx,%eax
    8b34:	c1 e0 03             	shl    $0x3,%eax
    8b37:	01 d0                	add    %edx,%eax
    8b39:	c1 e0 02             	shl    $0x2,%eax
    8b3c:	01 d0                	add    %edx,%eax
    8b3e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8b41:	01 d0                	add    %edx,%eax
    8b43:	83 c0 14             	add    $0x14,%eax
    8b46:	8b 04 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%eax
    8b4d:	29 c1                	sub    %eax,%ecx
    8b4f:	89 c8                	mov    %ecx,%eax
    8b51:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    8b54:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8b57:	89 d0                	mov    %edx,%eax
    8b59:	c1 e0 03             	shl    $0x3,%eax
    8b5c:	01 d0                	add    %edx,%eax
    8b5e:	c1 e0 02             	shl    $0x2,%eax
    8b61:	01 d0                	add    %edx,%eax
    8b63:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8b66:	01 d0                	add    %edx,%eax
    8b68:	83 c0 14             	add    $0x14,%eax
    8b6b:	8b 14 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%edx
    8b72:	89 d0                	mov    %edx,%eax
    8b74:	01 c0                	add    %eax,%eax
    8b76:	01 c2                	add    %eax,%edx
    8b78:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8b7b:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8b7f:	01 d0                	add    %edx,%eax
    8b81:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    8b84:	eb 78                	jmp    8bfe <III_stereo+0x323>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    8b86:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8b89:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8b8c:	89 d0                	mov    %edx,%eax
    8b8e:	01 c0                	add    %eax,%eax
    8b90:	01 d0                	add    %edx,%eax
    8b92:	c1 e0 02             	shl    $0x2,%eax
    8b95:	01 d0                	add    %edx,%eax
    8b97:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8b9a:	01 d0                	add    %edx,%eax
    8b9c:	83 c0 52             	add    $0x52,%eax
    8b9f:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    8ba3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8ba6:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    8bad:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8bb0:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8bb7:	83 f8 07             	cmp    $0x7,%eax
    8bba:	74 3a                	je     8bf6 <III_stereo+0x31b>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    8bbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8bbf:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8bc6:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    8bcc:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    8bd2:	dd 05 80 d2 00 00    	fldl   0xd280
    8bd8:	de c9                	fmulp  %st,%st(1)
    8bda:	83 ec 08             	sub    $0x8,%esp
    8bdd:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8be1:	dd 1c 24             	fstpl  (%esp)
    8be4:	e8 60 b6 ff ff       	call   4249 <tan>
    8be9:	83 c4 10             	add    $0x10,%esp
    8bec:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8bef:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    8bf6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    8bfa:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    8bfe:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    8c02:	7f 82                	jg     8b86 <III_stereo+0x2ab>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    8c04:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    8c08:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    8c0c:	0f 8e fc fe ff ff    	jle    8b0e <III_stereo+0x233>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    8c12:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8c15:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8c1b:	83 c0 7c             	add    $0x7c,%eax
    8c1e:	05 80 ec 00 00       	add    $0xec80,%eax
    8c23:	8b 50 0c             	mov    0xc(%eax),%edx
    8c26:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8c29:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8c2f:	83 c0 78             	add    $0x78,%eax
    8c32:	05 80 ec 00 00       	add    $0xec80,%eax
    8c37:	8b 40 0c             	mov    0xc(%eax),%eax
    8c3a:	29 c2                	sub    %eax,%edx
    8c3c:	89 d0                	mov    %edx,%eax
    8c3e:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    8c41:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8c44:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8c4a:	83 c0 78             	add    $0x78,%eax
    8c4d:	05 80 ec 00 00       	add    $0xec80,%eax
    8c52:	8b 50 0c             	mov    0xc(%eax),%edx
    8c55:	89 d0                	mov    %edx,%eax
    8c57:	01 c0                	add    %eax,%eax
    8c59:	01 c2                	add    %eax,%edx
    8c5b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8c5e:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8c62:	01 d0                	add    %edx,%eax
    8c64:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    8c67:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8c6a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8c70:	83 e8 80             	sub    $0xffffff80,%eax
    8c73:	05 80 ec 00 00       	add    $0xec80,%eax
    8c78:	8b 50 0c             	mov    0xc(%eax),%edx
    8c7b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8c7e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8c84:	83 c0 7c             	add    $0x7c,%eax
    8c87:	05 80 ec 00 00       	add    $0xec80,%eax
    8c8c:	8b 40 0c             	mov    0xc(%eax),%eax
    8c8f:	29 c2                	sub    %eax,%edx
    8c91:	89 d0                	mov    %edx,%eax
    8c93:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    8c96:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8c99:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8c9f:	83 c0 7c             	add    $0x7c,%eax
    8ca2:	05 80 ec 00 00       	add    $0xec80,%eax
    8ca7:	8b 50 0c             	mov    0xc(%eax),%edx
    8caa:	89 d0                	mov    %edx,%eax
    8cac:	01 c0                	add    %eax,%eax
    8cae:	01 c2                	add    %eax,%edx
    8cb0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8cb3:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8cb7:	01 d0                	add    %edx,%eax
    8cb9:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    8cbc:	eb 30                	jmp    8cee <III_stereo+0x413>
               {  is_pos[i] = is_pos[sfb];
    8cbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8cc1:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    8cc8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8ccb:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    8cd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8cd5:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    8cdc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8cdf:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    8ce6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    8cea:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    8cee:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    8cf2:	7f ca                	jg     8cbe <III_stereo+0x3e3>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    8cf4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8cf8:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8cfc:	0f 8e c4 fc ff ff    	jle    89c6 <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    8d02:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    8d06:	0f 8f 93 01 00 00    	jg     8e9f <III_stereo+0x5c4>
             {  i = 2;
    8d0c:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    8d13:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    8d1a:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    8d21:	eb 63                	jmp    8d86 <III_stereo+0x4ab>
                {  if ( xr[1][i][ss] != 0.0 )
    8d23:	8b 45 08             	mov    0x8(%ebp),%eax
    8d26:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    8d2c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8d2f:	89 d0                	mov    %edx,%eax
    8d31:	c1 e0 03             	shl    $0x3,%eax
    8d34:	01 d0                	add    %edx,%eax
    8d36:	01 c0                	add    %eax,%eax
    8d38:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8d3b:	01 d0                	add    %edx,%eax
    8d3d:	dd 04 c1             	fldl   (%ecx,%eax,8)
    8d40:	d9 ee                	fldz   
    8d42:	df e9                	fucomip %st(1),%st
    8d44:	7a 0a                	jp     8d50 <III_stereo+0x475>
    8d46:	d9 ee                	fldz   
    8d48:	df e9                	fucomip %st(1),%st
    8d4a:	dd d8                	fstp   %st(0)
    8d4c:	74 23                	je     8d71 <III_stereo+0x496>
    8d4e:	eb 02                	jmp    8d52 <III_stereo+0x477>
    8d50:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    8d52:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8d55:	89 d0                	mov    %edx,%eax
    8d57:	c1 e0 03             	shl    $0x3,%eax
    8d5a:	01 d0                	add    %edx,%eax
    8d5c:	01 c0                	add    %eax,%eax
    8d5e:	89 c2                	mov    %eax,%edx
    8d60:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8d63:	01 d0                	add    %edx,%eax
    8d65:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    8d68:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    8d6f:	eb 15                	jmp    8d86 <III_stereo+0x4ab>
                   } else
                   {  ss--;
    8d71:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    8d75:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    8d79:	79 0b                	jns    8d86 <III_stereo+0x4ab>
                      {  i--;
    8d7b:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    8d7f:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    8d86:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    8d8a:	79 97                	jns    8d23 <III_stereo+0x448>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    8d8c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    8d93:	eb 04                	jmp    8d99 <III_stereo+0x4be>
                   i++;
    8d95:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    8d99:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8d9c:	89 d0                	mov    %edx,%eax
    8d9e:	c1 e0 03             	shl    $0x3,%eax
    8da1:	01 d0                	add    %edx,%eax
    8da3:	c1 e0 02             	shl    $0x2,%eax
    8da6:	01 d0                	add    %edx,%eax
    8da8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8dab:	01 d0                	add    %edx,%eax
    8dad:	8b 04 85 80 ec 00 00 	mov    0xec80(,%eax,4),%eax
    8db4:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    8db7:	7e dc                	jle    8d95 <III_stereo+0x4ba>
                   i++;
                sfb = i;
    8db9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8dbc:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    8dbf:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8dc2:	89 d0                	mov    %edx,%eax
    8dc4:	c1 e0 03             	shl    $0x3,%eax
    8dc7:	01 d0                	add    %edx,%eax
    8dc9:	c1 e0 02             	shl    $0x2,%eax
    8dcc:	01 d0                	add    %edx,%eax
    8dce:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8dd1:	01 d0                	add    %edx,%eax
    8dd3:	8b 04 85 80 ec 00 00 	mov    0xec80(,%eax,4),%eax
    8dda:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    8ddd:	e9 b3 00 00 00       	jmp    8e95 <III_stereo+0x5ba>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    8de2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8de5:	8d 48 01             	lea    0x1(%eax),%ecx
    8de8:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8deb:	89 d0                	mov    %edx,%eax
    8ded:	c1 e0 03             	shl    $0x3,%eax
    8df0:	01 d0                	add    %edx,%eax
    8df2:	c1 e0 02             	shl    $0x2,%eax
    8df5:	01 d0                	add    %edx,%eax
    8df7:	01 c8                	add    %ecx,%eax
    8df9:	8b 0c 85 80 ec 00 00 	mov    0xec80(,%eax,4),%ecx
    8e00:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8e03:	89 d0                	mov    %edx,%eax
    8e05:	c1 e0 03             	shl    $0x3,%eax
    8e08:	01 d0                	add    %edx,%eax
    8e0a:	c1 e0 02             	shl    $0x2,%eax
    8e0d:	01 d0                	add    %edx,%eax
    8e0f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8e12:	01 d0                	add    %edx,%eax
    8e14:	8b 04 85 80 ec 00 00 	mov    0xec80(,%eax,4),%eax
    8e1b:	29 c1                	sub    %eax,%ecx
    8e1d:	89 c8                	mov    %ecx,%eax
    8e1f:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    8e22:	eb 67                	jmp    8e8b <III_stereo+0x5b0>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    8e24:	8b 45 10             	mov    0x10(%ebp),%eax
    8e27:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8e2a:	83 c2 3e             	add    $0x3e,%edx
    8e2d:	8b 14 90             	mov    (%eax,%edx,4),%edx
    8e30:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8e33:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    8e3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8e3d:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8e44:	83 f8 07             	cmp    $0x7,%eax
    8e47:	74 3a                	je     8e83 <III_stereo+0x5a8>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    8e49:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8e4c:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8e53:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    8e59:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    8e5f:	dd 05 80 d2 00 00    	fldl   0xd280
    8e65:	de c9                	fmulp  %st,%st(1)
    8e67:	83 ec 08             	sub    $0x8,%esp
    8e6a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8e6e:	dd 1c 24             	fstpl  (%esp)
    8e71:	e8 d3 b3 ff ff       	call   4249 <tan>
    8e76:	83 c4 10             	add    $0x10,%esp
    8e79:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8e7c:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    8e83:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    8e87:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    8e8b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    8e8f:	7f 93                	jg     8e24 <III_stereo+0x549>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    8e91:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8e95:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    8e99:	0f 8e 43 ff ff ff    	jle    8de2 <III_stereo+0x507>
    8e9f:	e9 3a 03 00 00       	jmp    91de <III_stereo+0x903>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    8ea4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8eab:	e9 24 03 00 00       	jmp    91d4 <III_stereo+0x8f9>
            {  int sfbcnt;
               sfbcnt = -1;
    8eb0:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    8eb7:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    8ebe:	e9 0f 01 00 00       	jmp    8fd2 <III_stereo+0x6f7>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    8ec3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8ec6:	8d 48 01             	lea    0x1(%eax),%ecx
    8ec9:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8ecc:	89 d0                	mov    %edx,%eax
    8ece:	c1 e0 03             	shl    $0x3,%eax
    8ed1:	01 d0                	add    %edx,%eax
    8ed3:	c1 e0 02             	shl    $0x2,%eax
    8ed6:	01 d0                	add    %edx,%eax
    8ed8:	01 c8                	add    %ecx,%eax
    8eda:	83 c0 14             	add    $0x14,%eax
    8edd:	8b 0c 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%ecx
    8ee4:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8ee7:	89 d0                	mov    %edx,%eax
    8ee9:	c1 e0 03             	shl    $0x3,%eax
    8eec:	01 d0                	add    %edx,%eax
    8eee:	c1 e0 02             	shl    $0x2,%eax
    8ef1:	01 d0                	add    %edx,%eax
    8ef3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8ef6:	01 d0                	add    %edx,%eax
    8ef8:	83 c0 14             	add    $0x14,%eax
    8efb:	8b 04 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%eax
    8f02:	29 c1                	sub    %eax,%ecx
    8f04:	89 c8                	mov    %ecx,%eax
    8f06:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    8f09:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8f0c:	89 d0                	mov    %edx,%eax
    8f0e:	c1 e0 03             	shl    $0x3,%eax
    8f11:	01 d0                	add    %edx,%eax
    8f13:	c1 e0 02             	shl    $0x2,%eax
    8f16:	01 d0                	add    %edx,%eax
    8f18:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8f1b:	01 d0                	add    %edx,%eax
    8f1d:	83 c0 14             	add    $0x14,%eax
    8f20:	8b 14 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%edx
    8f27:	89 d0                	mov    %edx,%eax
    8f29:	01 c0                	add    %eax,%eax
    8f2b:	01 c2                	add    %eax,%edx
    8f2d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8f30:	83 c0 01             	add    $0x1,%eax
    8f33:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    8f37:	01 d0                	add    %edx,%eax
    8f39:	83 e8 01             	sub    $0x1,%eax
    8f3c:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    8f3f:	e9 80 00 00 00       	jmp    8fc4 <III_stereo+0x6e9>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    8f44:	8b 45 08             	mov    0x8(%ebp),%eax
    8f47:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    8f4d:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    8f50:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8f55:	89 c8                	mov    %ecx,%eax
    8f57:	f7 ea                	imul   %edx
    8f59:	c1 fa 02             	sar    $0x2,%edx
    8f5c:	89 c8                	mov    %ecx,%eax
    8f5e:	c1 f8 1f             	sar    $0x1f,%eax
    8f61:	89 d3                	mov    %edx,%ebx
    8f63:	29 c3                	sub    %eax,%ebx
    8f65:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    8f68:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8f6d:	89 c8                	mov    %ecx,%eax
    8f6f:	f7 ea                	imul   %edx
    8f71:	c1 fa 02             	sar    $0x2,%edx
    8f74:	89 c8                	mov    %ecx,%eax
    8f76:	c1 f8 1f             	sar    $0x1f,%eax
    8f79:	29 c2                	sub    %eax,%edx
    8f7b:	89 d0                	mov    %edx,%eax
    8f7d:	c1 e0 03             	shl    $0x3,%eax
    8f80:	01 d0                	add    %edx,%eax
    8f82:	01 c0                	add    %eax,%eax
    8f84:	29 c1                	sub    %eax,%ecx
    8f86:	89 ca                	mov    %ecx,%edx
    8f88:	89 d8                	mov    %ebx,%eax
    8f8a:	c1 e0 03             	shl    $0x3,%eax
    8f8d:	01 d8                	add    %ebx,%eax
    8f8f:	01 c0                	add    %eax,%eax
    8f91:	01 d0                	add    %edx,%eax
    8f93:	dd 04 c6             	fldl   (%esi,%eax,8)
    8f96:	d9 ee                	fldz   
    8f98:	df e9                	fucomip %st(1),%st
    8f9a:	7a 0a                	jp     8fa6 <III_stereo+0x6cb>
    8f9c:	d9 ee                	fldz   
    8f9e:	df e9                	fucomip %st(1),%st
    8fa0:	dd d8                	fstp   %st(0)
    8fa2:	74 18                	je     8fbc <III_stereo+0x6e1>
    8fa4:	eb 02                	jmp    8fa8 <III_stereo+0x6cd>
    8fa6:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    8fa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8fab:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    8fae:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    8fb5:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    8fbc:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    8fc0:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    8fc4:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    8fc8:	0f 8f 76 ff ff ff    	jg     8f44 <III_stereo+0x669>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    8fce:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    8fd2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    8fd6:	0f 89 e7 fe ff ff    	jns    8ec3 <III_stereo+0x5e8>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    8fdc:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8fdf:	83 c0 01             	add    $0x1,%eax
    8fe2:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    8fe5:	e9 fa 00 00 00       	jmp    90e4 <III_stereo+0x809>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    8fea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8fed:	8d 48 01             	lea    0x1(%eax),%ecx
    8ff0:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8ff3:	89 d0                	mov    %edx,%eax
    8ff5:	c1 e0 03             	shl    $0x3,%eax
    8ff8:	01 d0                	add    %edx,%eax
    8ffa:	c1 e0 02             	shl    $0x2,%eax
    8ffd:	01 d0                	add    %edx,%eax
    8fff:	01 c8                	add    %ecx,%eax
    9001:	83 c0 14             	add    $0x14,%eax
    9004:	8b 0c 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%ecx
    900b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    900e:	89 d0                	mov    %edx,%eax
    9010:	c1 e0 03             	shl    $0x3,%eax
    9013:	01 d0                	add    %edx,%eax
    9015:	c1 e0 02             	shl    $0x2,%eax
    9018:	01 d0                	add    %edx,%eax
    901a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    901d:	01 d0                	add    %edx,%eax
    901f:	83 c0 14             	add    $0x14,%eax
    9022:	8b 04 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%eax
    9029:	29 c1                	sub    %eax,%ecx
    902b:	89 c8                	mov    %ecx,%eax
    902d:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    9030:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9033:	89 d0                	mov    %edx,%eax
    9035:	c1 e0 03             	shl    $0x3,%eax
    9038:	01 d0                	add    %edx,%eax
    903a:	c1 e0 02             	shl    $0x2,%eax
    903d:	01 d0                	add    %edx,%eax
    903f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9042:	01 d0                	add    %edx,%eax
    9044:	83 c0 14             	add    $0x14,%eax
    9047:	8b 14 85 8c ec 00 00 	mov    0xec8c(,%eax,4),%edx
    904e:	89 d0                	mov    %edx,%eax
    9050:	01 c0                	add    %eax,%eax
    9052:	01 c2                	add    %eax,%edx
    9054:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9057:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    905b:	01 d0                	add    %edx,%eax
    905d:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    9060:	eb 78                	jmp    90da <III_stereo+0x7ff>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    9062:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9065:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9068:	89 d0                	mov    %edx,%eax
    906a:	01 c0                	add    %eax,%eax
    906c:	01 d0                	add    %edx,%eax
    906e:	c1 e0 02             	shl    $0x2,%eax
    9071:	01 d0                	add    %edx,%eax
    9073:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9076:	01 d0                	add    %edx,%eax
    9078:	83 c0 52             	add    $0x52,%eax
    907b:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    907f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9082:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    9089:	8b 45 f0             	mov    -0x10(%ebp),%eax
    908c:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9093:	83 f8 07             	cmp    $0x7,%eax
    9096:	74 3a                	je     90d2 <III_stereo+0x7f7>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    9098:	8b 45 f0             	mov    -0x10(%ebp),%eax
    909b:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    90a2:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    90a8:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    90ae:	dd 05 80 d2 00 00    	fldl   0xd280
    90b4:	de c9                	fmulp  %st,%st(1)
    90b6:	83 ec 08             	sub    $0x8,%esp
    90b9:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    90bd:	dd 1c 24             	fstpl  (%esp)
    90c0:	e8 84 b1 ff ff       	call   4249 <tan>
    90c5:	83 c4 10             	add    $0x10,%esp
    90c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    90cb:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    90d2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    90d6:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    90da:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    90de:	7f 82                	jg     9062 <III_stereo+0x787>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    90e0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    90e4:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    90e8:	0f 8e fc fe ff ff    	jle    8fea <III_stereo+0x70f>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    90ee:	8b 45 c8             	mov    -0x38(%ebp),%eax
    90f1:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    90f7:	83 c0 7c             	add    $0x7c,%eax
    90fa:	05 80 ec 00 00       	add    $0xec80,%eax
    90ff:	8b 50 0c             	mov    0xc(%eax),%edx
    9102:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9105:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    910b:	83 c0 78             	add    $0x78,%eax
    910e:	05 80 ec 00 00       	add    $0xec80,%eax
    9113:	8b 40 0c             	mov    0xc(%eax),%eax
    9116:	29 c2                	sub    %eax,%edx
    9118:	89 d0                	mov    %edx,%eax
    911a:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    911d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9120:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9126:	83 c0 78             	add    $0x78,%eax
    9129:	05 80 ec 00 00       	add    $0xec80,%eax
    912e:	8b 50 0c             	mov    0xc(%eax),%edx
    9131:	89 d0                	mov    %edx,%eax
    9133:	01 c0                	add    %eax,%eax
    9135:	01 c2                	add    %eax,%edx
    9137:	8b 45 ec             	mov    -0x14(%ebp),%eax
    913a:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    913e:	01 d0                	add    %edx,%eax
    9140:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    9143:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9146:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    914c:	83 e8 80             	sub    $0xffffff80,%eax
    914f:	05 80 ec 00 00       	add    $0xec80,%eax
    9154:	8b 50 0c             	mov    0xc(%eax),%edx
    9157:	8b 45 c8             	mov    -0x38(%ebp),%eax
    915a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9160:	83 c0 7c             	add    $0x7c,%eax
    9163:	05 80 ec 00 00       	add    $0xec80,%eax
    9168:	8b 40 0c             	mov    0xc(%eax),%eax
    916b:	29 c2                	sub    %eax,%edx
    916d:	89 d0                	mov    %edx,%eax
    916f:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    9172:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9175:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    917b:	83 c0 7c             	add    $0x7c,%eax
    917e:	05 80 ec 00 00       	add    $0xec80,%eax
    9183:	8b 50 0c             	mov    0xc(%eax),%edx
    9186:	89 d0                	mov    %edx,%eax
    9188:	01 c0                	add    %eax,%eax
    918a:	01 c2                	add    %eax,%edx
    918c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    918f:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9193:	01 d0                	add    %edx,%eax
    9195:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    9198:	eb 30                	jmp    91ca <III_stereo+0x8ef>
               {  is_pos[i] = is_pos[sfb];
    919a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    919d:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    91a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91a7:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    91ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    91b1:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    91b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91bb:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    91c2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    91c6:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    91ca:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    91ce:	7f ca                	jg     919a <III_stereo+0x8bf>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    91d0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    91d4:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    91d8:	0f 8e d2 fc ff ff    	jle    8eb0 <III_stereo+0x5d5>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    91de:	e9 00 02 00 00       	jmp    93e3 <III_stereo+0xb08>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    91e3:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    91ea:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    91f1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    91f8:	eb 63                	jmp    925d <III_stereo+0x982>
         {  if ( xr[1][i][ss] != 0.0 )
    91fa:	8b 45 08             	mov    0x8(%ebp),%eax
    91fd:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9203:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9206:	89 d0                	mov    %edx,%eax
    9208:	c1 e0 03             	shl    $0x3,%eax
    920b:	01 d0                	add    %edx,%eax
    920d:	01 c0                	add    %eax,%eax
    920f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9212:	01 d0                	add    %edx,%eax
    9214:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9217:	d9 ee                	fldz   
    9219:	df e9                	fucomip %st(1),%st
    921b:	7a 0a                	jp     9227 <III_stereo+0x94c>
    921d:	d9 ee                	fldz   
    921f:	df e9                	fucomip %st(1),%st
    9221:	dd d8                	fstp   %st(0)
    9223:	74 23                	je     9248 <III_stereo+0x96d>
    9225:	eb 02                	jmp    9229 <III_stereo+0x94e>
    9227:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    9229:	8b 55 f0             	mov    -0x10(%ebp),%edx
    922c:	89 d0                	mov    %edx,%eax
    922e:	c1 e0 03             	shl    $0x3,%eax
    9231:	01 d0                	add    %edx,%eax
    9233:	01 c0                	add    %eax,%eax
    9235:	89 c2                	mov    %eax,%edx
    9237:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    923a:	01 d0                	add    %edx,%eax
    923c:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    923f:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    9246:	eb 15                	jmp    925d <III_stereo+0x982>
            } else
            {  ss--;
    9248:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    924c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    9250:	79 0b                	jns    925d <III_stereo+0x982>
               {  i--;
    9252:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    9256:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    925d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    9261:	79 97                	jns    91fa <III_stereo+0x91f>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    9263:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    926a:	eb 04                	jmp    9270 <III_stereo+0x995>
            i++;
    926c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    9270:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9273:	89 d0                	mov    %edx,%eax
    9275:	c1 e0 03             	shl    $0x3,%eax
    9278:	01 d0                	add    %edx,%eax
    927a:	c1 e0 02             	shl    $0x2,%eax
    927d:	01 d0                	add    %edx,%eax
    927f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9282:	01 d0                	add    %edx,%eax
    9284:	8b 04 85 80 ec 00 00 	mov    0xec80(,%eax,4),%eax
    928b:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    928e:	7e dc                	jle    926c <III_stereo+0x991>
            i++;
         sfb = i;
    9290:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9293:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    9296:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9299:	89 d0                	mov    %edx,%eax
    929b:	c1 e0 03             	shl    $0x3,%eax
    929e:	01 d0                	add    %edx,%eax
    92a0:	c1 e0 02             	shl    $0x2,%eax
    92a3:	01 d0                	add    %edx,%eax
    92a5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    92a8:	01 d0                	add    %edx,%eax
    92aa:	8b 04 85 80 ec 00 00 	mov    0xec80(,%eax,4),%eax
    92b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    92b4:	e9 b3 00 00 00       	jmp    936c <III_stereo+0xa91>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    92b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    92bc:	8d 48 01             	lea    0x1(%eax),%ecx
    92bf:	8b 55 c8             	mov    -0x38(%ebp),%edx
    92c2:	89 d0                	mov    %edx,%eax
    92c4:	c1 e0 03             	shl    $0x3,%eax
    92c7:	01 d0                	add    %edx,%eax
    92c9:	c1 e0 02             	shl    $0x2,%eax
    92cc:	01 d0                	add    %edx,%eax
    92ce:	01 c8                	add    %ecx,%eax
    92d0:	8b 0c 85 80 ec 00 00 	mov    0xec80(,%eax,4),%ecx
    92d7:	8b 55 c8             	mov    -0x38(%ebp),%edx
    92da:	89 d0                	mov    %edx,%eax
    92dc:	c1 e0 03             	shl    $0x3,%eax
    92df:	01 d0                	add    %edx,%eax
    92e1:	c1 e0 02             	shl    $0x2,%eax
    92e4:	01 d0                	add    %edx,%eax
    92e6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    92e9:	01 d0                	add    %edx,%eax
    92eb:	8b 04 85 80 ec 00 00 	mov    0xec80(,%eax,4),%eax
    92f2:	29 c1                	sub    %eax,%ecx
    92f4:	89 c8                	mov    %ecx,%eax
    92f6:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    92f9:	eb 67                	jmp    9362 <III_stereo+0xa87>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    92fb:	8b 45 10             	mov    0x10(%ebp),%eax
    92fe:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9301:	83 c2 3e             	add    $0x3e,%edx
    9304:	8b 14 90             	mov    (%eax,%edx,4),%edx
    9307:	8b 45 f0             	mov    -0x10(%ebp),%eax
    930a:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    9311:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9314:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    931b:	83 f8 07             	cmp    $0x7,%eax
    931e:	74 3a                	je     935a <III_stereo+0xa7f>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    9320:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9323:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    932a:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    9330:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9336:	dd 05 80 d2 00 00    	fldl   0xd280
    933c:	de c9                	fmulp  %st,%st(1)
    933e:	83 ec 08             	sub    $0x8,%esp
    9341:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9345:	dd 1c 24             	fstpl  (%esp)
    9348:	e8 fc ae ff ff       	call   4249 <tan>
    934d:	83 c4 10             	add    $0x10,%esp
    9350:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9353:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    935a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    935e:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9362:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9366:	7f 93                	jg     92fb <III_stereo+0xa20>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    9368:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    936c:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    9370:	0f 8e 43 ff ff ff    	jle    92b9 <III_stereo+0x9de>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    9376:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9379:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    937f:	83 c0 50             	add    $0x50,%eax
    9382:	05 80 ec 00 00       	add    $0xec80,%eax
    9387:	8b 00                	mov    (%eax),%eax
    9389:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    938c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    938f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9395:	83 c0 54             	add    $0x54,%eax
    9398:	05 80 ec 00 00       	add    $0xec80,%eax
    939d:	8b 00                	mov    (%eax),%eax
    939f:	ba 40 02 00 00       	mov    $0x240,%edx
    93a4:	29 c2                	sub    %eax,%edx
    93a6:	89 d0                	mov    %edx,%eax
    93a8:	89 45 e8             	mov    %eax,-0x18(%ebp)
    93ab:	eb 30                	jmp    93dd <III_stereo+0xb02>
         {  is_pos[i] = is_pos[sfb];
    93ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    93b0:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    93b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    93ba:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    93c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    93c4:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    93cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    93ce:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    93d5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    93d9:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    93dd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    93e1:	7f ca                	jg     93ad <III_stereo+0xad2>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    93e3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    93ea:	eb 55                	jmp    9441 <III_stereo+0xb66>
      for(sb=0;sb<SBLIMIT;sb++)
    93ec:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    93f3:	eb 42                	jmp    9437 <III_stereo+0xb5c>
         for(ss=0;ss<SSLIMIT;ss++)
    93f5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    93fc:	eb 2f                	jmp    942d <III_stereo+0xb52>
            lr[ch][sb][ss] = 0;
    93fe:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9401:	89 d0                	mov    %edx,%eax
    9403:	c1 e0 03             	shl    $0x3,%eax
    9406:	01 d0                	add    %edx,%eax
    9408:	c1 e0 09             	shl    $0x9,%eax
    940b:	89 c2                	mov    %eax,%edx
    940d:	8b 45 0c             	mov    0xc(%ebp),%eax
    9410:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9413:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9416:	89 d0                	mov    %edx,%eax
    9418:	c1 e0 03             	shl    $0x3,%eax
    941b:	01 d0                	add    %edx,%eax
    941d:	01 c0                	add    %eax,%eax
    941f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9422:	01 d0                	add    %edx,%eax
    9424:	d9 ee                	fldz   
    9426:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    9429:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    942d:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    9431:	7e cb                	jle    93fe <III_stereo+0xb23>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    9433:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9437:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    943b:	7e b8                	jle    93f5 <III_stereo+0xb1a>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    943d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    9441:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    9445:	7e a5                	jle    93ec <III_stereo+0xb11>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    9447:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    944b:	0f 85 3b 02 00 00    	jne    968c <III_stereo+0xdb1>
      for(sb=0;sb<SBLIMIT;sb++)
    9451:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9458:	e9 23 02 00 00       	jmp    9680 <III_stereo+0xda5>
         for(ss=0;ss<SSLIMIT;ss++) {
    945d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    9464:	e9 09 02 00 00       	jmp    9672 <III_stereo+0xd97>
            i = (sb*18)+ss;
    9469:	8b 55 e8             	mov    -0x18(%ebp),%edx
    946c:	89 d0                	mov    %edx,%eax
    946e:	c1 e0 03             	shl    $0x3,%eax
    9471:	01 d0                	add    %edx,%eax
    9473:	01 c0                	add    %eax,%eax
    9475:	89 c2                	mov    %eax,%edx
    9477:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    947a:	01 d0                	add    %edx,%eax
    947c:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    947f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9482:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9489:	83 f8 07             	cmp    $0x7,%eax
    948c:	0f 85 2c 01 00 00    	jne    95be <III_stereo+0xce3>
               if ( ms_stereo ) {
    9492:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    9496:	0f 84 b5 00 00 00    	je     9551 <III_stereo+0xc76>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    949c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    949f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    94a2:	89 d0                	mov    %edx,%eax
    94a4:	c1 e0 03             	shl    $0x3,%eax
    94a7:	01 d0                	add    %edx,%eax
    94a9:	01 c0                	add    %eax,%eax
    94ab:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    94ae:	01 d0                	add    %edx,%eax
    94b0:	dd 04 c1             	fldl   (%ecx,%eax,8)
    94b3:	8b 45 08             	mov    0x8(%ebp),%eax
    94b6:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    94bc:	8b 55 e8             	mov    -0x18(%ebp),%edx
    94bf:	89 d0                	mov    %edx,%eax
    94c1:	c1 e0 03             	shl    $0x3,%eax
    94c4:	01 d0                	add    %edx,%eax
    94c6:	01 c0                	add    %eax,%eax
    94c8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    94cb:	01 d0                	add    %edx,%eax
    94cd:	dd 04 c1             	fldl   (%ecx,%eax,8)
    94d0:	de c1                	faddp  %st,%st(1)
    94d2:	dd 05 88 d2 00 00    	fldl   0xd288
    94d8:	de f9                	fdivrp %st,%st(1)
    94da:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    94dd:	8b 55 e8             	mov    -0x18(%ebp),%edx
    94e0:	89 d0                	mov    %edx,%eax
    94e2:	c1 e0 03             	shl    $0x3,%eax
    94e5:	01 d0                	add    %edx,%eax
    94e7:	01 c0                	add    %eax,%eax
    94e9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    94ec:	01 d0                	add    %edx,%eax
    94ee:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    94f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    94f4:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    94fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
    94fd:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9500:	89 d0                	mov    %edx,%eax
    9502:	c1 e0 03             	shl    $0x3,%eax
    9505:	01 d0                	add    %edx,%eax
    9507:	01 c0                	add    %eax,%eax
    9509:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    950c:	01 d0                	add    %edx,%eax
    950e:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9511:	8b 45 08             	mov    0x8(%ebp),%eax
    9514:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    951a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    951d:	89 d0                	mov    %edx,%eax
    951f:	c1 e0 03             	shl    $0x3,%eax
    9522:	01 d0                	add    %edx,%eax
    9524:	01 c0                	add    %eax,%eax
    9526:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9529:	01 d0                	add    %edx,%eax
    952b:	dd 04 c1             	fldl   (%ecx,%eax,8)
    952e:	de e9                	fsubrp %st,%st(1)
    9530:	dd 05 88 d2 00 00    	fldl   0xd288
    9536:	de f9                	fdivrp %st,%st(1)
    9538:	8b 55 e8             	mov    -0x18(%ebp),%edx
    953b:	89 d0                	mov    %edx,%eax
    953d:	c1 e0 03             	shl    $0x3,%eax
    9540:	01 d0                	add    %edx,%eax
    9542:	01 c0                	add    %eax,%eax
    9544:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9547:	01 d0                	add    %edx,%eax
    9549:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    954c:	e9 1d 01 00 00       	jmp    966e <III_stereo+0xd93>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    9551:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9554:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9557:	89 d0                	mov    %edx,%eax
    9559:	c1 e0 03             	shl    $0x3,%eax
    955c:	01 d0                	add    %edx,%eax
    955e:	01 c0                	add    %eax,%eax
    9560:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9563:	01 d0                	add    %edx,%eax
    9565:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9568:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    956b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    956e:	89 d0                	mov    %edx,%eax
    9570:	c1 e0 03             	shl    $0x3,%eax
    9573:	01 d0                	add    %edx,%eax
    9575:	01 c0                	add    %eax,%eax
    9577:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    957a:	01 d0                	add    %edx,%eax
    957c:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    957f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9582:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9588:	8b 45 08             	mov    0x8(%ebp),%eax
    958b:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    9591:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9594:	89 d0                	mov    %edx,%eax
    9596:	c1 e0 03             	shl    $0x3,%eax
    9599:	01 d0                	add    %edx,%eax
    959b:	01 c0                	add    %eax,%eax
    959d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    95a0:	01 d0                	add    %edx,%eax
    95a2:	dd 04 c3             	fldl   (%ebx,%eax,8)
    95a5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    95a8:	89 d0                	mov    %edx,%eax
    95aa:	c1 e0 03             	shl    $0x3,%eax
    95ad:	01 d0                	add    %edx,%eax
    95af:	01 c0                	add    %eax,%eax
    95b1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    95b4:	01 d0                	add    %edx,%eax
    95b6:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    95b9:	e9 b0 00 00 00       	jmp    966e <III_stereo+0xd93>
               }
            }
            else if (i_stereo ) {
    95be:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    95c2:	0f 84 94 00 00 00    	je     965c <III_stereo+0xd81>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    95c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
    95cb:	8b 55 e8             	mov    -0x18(%ebp),%edx
    95ce:	89 d0                	mov    %edx,%eax
    95d0:	c1 e0 03             	shl    $0x3,%eax
    95d3:	01 d0                	add    %edx,%eax
    95d5:	01 c0                	add    %eax,%eax
    95d7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    95da:	01 d0                	add    %edx,%eax
    95dc:	dd 04 c1             	fldl   (%ecx,%eax,8)
    95df:	8b 45 f0             	mov    -0x10(%ebp),%eax
    95e2:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    95e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    95ec:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    95f3:	d9 e8                	fld1   
    95f5:	de c1                	faddp  %st,%st(1)
    95f7:	de f9                	fdivrp %st,%st(1)
    95f9:	de c9                	fmulp  %st,%st(1)
    95fb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    95fe:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9601:	89 d0                	mov    %edx,%eax
    9603:	c1 e0 03             	shl    $0x3,%eax
    9606:	01 d0                	add    %edx,%eax
    9608:	01 c0                	add    %eax,%eax
    960a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    960d:	01 d0                	add    %edx,%eax
    960f:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    9612:	8b 45 0c             	mov    0xc(%ebp),%eax
    9615:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    961b:	8b 4d 08             	mov    0x8(%ebp),%ecx
    961e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9621:	89 d0                	mov    %edx,%eax
    9623:	c1 e0 03             	shl    $0x3,%eax
    9626:	01 d0                	add    %edx,%eax
    9628:	01 c0                	add    %eax,%eax
    962a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    962d:	01 d0                	add    %edx,%eax
    962f:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9632:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9635:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    963c:	d9 e8                	fld1   
    963e:	de c1                	faddp  %st,%st(1)
    9640:	d9 e8                	fld1   
    9642:	de f1                	fdivp  %st,%st(1)
    9644:	de c9                	fmulp  %st,%st(1)
    9646:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9649:	89 d0                	mov    %edx,%eax
    964b:	c1 e0 03             	shl    $0x3,%eax
    964e:	01 d0                	add    %edx,%eax
    9650:	01 c0                	add    %eax,%eax
    9652:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9655:	01 d0                	add    %edx,%eax
    9657:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    965a:	eb 12                	jmp    966e <III_stereo+0xd93>
            }
            else {
               printf(0,"Error in streo processing\n");
    965c:	83 ec 08             	sub    $0x8,%esp
    965f:	68 00 c2 00 00       	push   $0xc200
    9664:	6a 00                	push   $0x0
    9666:	e8 4a a7 ff ff       	call   3db5 <printf>
    966b:	83 c4 10             	add    $0x10,%esp
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    966e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9672:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    9676:	0f 8e ed fd ff ff    	jle    9469 <III_stereo+0xb8e>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    967c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9680:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    9684:	0f 8e d3 fd ff ff    	jle    945d <III_stereo+0xb82>
    968a:	eb 54                	jmp    96e0 <III_stereo+0xe05>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    968c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9693:	eb 45                	jmp    96da <III_stereo+0xdff>
         for(ss=0;ss<SSLIMIT;ss++)
    9695:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    969c:	eb 32                	jmp    96d0 <III_stereo+0xdf5>
            lr[0][sb][ss] = xr[0][sb][ss];
    969e:	8b 4d 08             	mov    0x8(%ebp),%ecx
    96a1:	8b 55 e8             	mov    -0x18(%ebp),%edx
    96a4:	89 d0                	mov    %edx,%eax
    96a6:	c1 e0 03             	shl    $0x3,%eax
    96a9:	01 d0                	add    %edx,%eax
    96ab:	01 c0                	add    %eax,%eax
    96ad:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    96b0:	01 d0                	add    %edx,%eax
    96b2:	dd 04 c1             	fldl   (%ecx,%eax,8)
    96b5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    96b8:	8b 55 e8             	mov    -0x18(%ebp),%edx
    96bb:	89 d0                	mov    %edx,%eax
    96bd:	c1 e0 03             	shl    $0x3,%eax
    96c0:	01 d0                	add    %edx,%eax
    96c2:	01 c0                	add    %eax,%eax
    96c4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    96c7:	01 d0                	add    %edx,%eax
    96c9:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    96cc:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    96d0:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    96d4:	7e c8                	jle    969e <III_stereo+0xdc3>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    96d6:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    96da:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    96de:	7e b5                	jle    9695 <III_stereo+0xdba>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    96e0:	8d 65 f8             	lea    -0x8(%ebp),%esp
    96e3:	5b                   	pop    %ebx
    96e4:	5e                   	pop    %esi
    96e5:	5d                   	pop    %ebp
    96e6:	c3                   	ret    

000096e7 <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    96e7:	55                   	push   %ebp
    96e8:	89 e5                	mov    %esp,%ebp
    96ea:	83 ec 38             	sub    $0x38,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    96ed:	a1 00 ef 00 00       	mov    0xef00,%eax
    96f2:	85 c0                	test   %eax,%eax
    96f4:	74 72                	je     9768 <III_antialias+0x81>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    96f6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    96fd:	eb 59                	jmp    9758 <III_antialias+0x71>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    96ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9702:	dd 04 c5 c0 ee 00 00 	fldl   0xeec0(,%eax,8)
    9709:	8b 45 e8             	mov    -0x18(%ebp),%eax
    970c:	dd 04 c5 c0 ee 00 00 	fldl   0xeec0(,%eax,8)
    9713:	de c9                	fmulp  %st,%st(1)
    9715:	d9 e8                	fld1   
    9717:	de c1                	faddp  %st,%st(1)
    9719:	83 ec 08             	sub    $0x8,%esp
    971c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9720:	dd 1c 24             	fstpl  (%esp)
    9723:	e8 e4 ac ff ff       	call   440c <sqrt>
    9728:	83 c4 10             	add    $0x10,%esp
    972b:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    972e:	d9 e8                	fld1   
    9730:	dc 75 e0             	fdivl  -0x20(%ebp)
    9733:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9736:	dd 1c c5 c0 ef 00 00 	fstpl  0xefc0(,%eax,8)
         ca[i] = Ci[i]/sq;
    973d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9740:	dd 04 c5 c0 ee 00 00 	fldl   0xeec0(,%eax,8)
    9747:	dc 75 e0             	fdivl  -0x20(%ebp)
    974a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    974d:	dd 1c c5 00 f0 00 00 	fstpl  0xf000(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    9754:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9758:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    975c:	7e a1                	jle    96ff <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    975e:	c7 05 00 ef 00 00 00 	movl   $0x0,0xef00
    9765:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    9768:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    976f:	eb 4c                	jmp    97bd <III_antialias+0xd6>
       for(ss=0;ss<SSLIMIT;ss++)
    9771:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9778:	eb 39                	jmp    97b3 <III_antialias+0xcc>
          hybridIn[sb][ss] = xr[sb][ss];
    977a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    977d:	89 d0                	mov    %edx,%eax
    977f:	c1 e0 03             	shl    $0x3,%eax
    9782:	01 d0                	add    %edx,%eax
    9784:	c1 e0 04             	shl    $0x4,%eax
    9787:	89 c2                	mov    %eax,%edx
    9789:	8b 45 0c             	mov    0xc(%ebp),%eax
    978c:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    978f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9792:	89 d0                	mov    %edx,%eax
    9794:	c1 e0 03             	shl    $0x3,%eax
    9797:	01 d0                	add    %edx,%eax
    9799:	c1 e0 04             	shl    $0x4,%eax
    979c:	89 c2                	mov    %eax,%edx
    979e:	8b 45 08             	mov    0x8(%ebp),%eax
    97a1:	01 c2                	add    %eax,%edx
    97a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97a6:	dd 04 c2             	fldl   (%edx,%eax,8)
    97a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97ac:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    97af:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    97b3:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    97b7:	7e c1                	jle    977a <III_antialias+0x93>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    97b9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    97bd:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    97c1:	7e ae                	jle    9771 <III_antialias+0x8a>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    97c3:	8b 45 10             	mov    0x10(%ebp),%eax
    97c6:	8b 40 10             	mov    0x10(%eax),%eax
    97c9:	85 c0                	test   %eax,%eax
    97cb:	74 1a                	je     97e7 <III_antialias+0x100>
    97cd:	8b 45 10             	mov    0x10(%ebp),%eax
    97d0:	8b 40 14             	mov    0x14(%eax),%eax
    97d3:	83 f8 02             	cmp    $0x2,%eax
    97d6:	75 0f                	jne    97e7 <III_antialias+0x100>
       !gr_info->mixed_block_flag ) return;
    97d8:	8b 45 10             	mov    0x10(%ebp),%eax
    97db:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    97de:	85 c0                	test   %eax,%eax
    97e0:	75 05                	jne    97e7 <III_antialias+0x100>
       !gr_info->mixed_block_flag ) return;
    97e2:	e9 1c 01 00 00       	jmp    9903 <III_antialias+0x21c>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    97e7:	8b 45 10             	mov    0x10(%ebp),%eax
    97ea:	8b 40 10             	mov    0x10(%eax),%eax
    97ed:	85 c0                	test   %eax,%eax
    97ef:	74 1e                	je     980f <III_antialias+0x128>
    97f1:	8b 45 10             	mov    0x10(%ebp),%eax
    97f4:	8b 40 18             	mov    0x18(%eax),%eax
    97f7:	85 c0                	test   %eax,%eax
    97f9:	74 14                	je     980f <III_antialias+0x128>
     (gr_info->block_type == 2))
    97fb:	8b 45 10             	mov    0x10(%ebp),%eax
    97fe:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9801:	83 f8 02             	cmp    $0x2,%eax
    9804:	75 09                	jne    980f <III_antialias+0x128>
     (gr_info->block_type == 2))
      sblim = 1;
    9806:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    980d:	eb 07                	jmp    9816 <III_antialias+0x12f>
   else
      sblim = SBLIMIT-1;
    980f:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    9816:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    981d:	e9 d5 00 00 00       	jmp    98f7 <III_antialias+0x210>
      for(ss=0;ss<8;ss++) {
    9822:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9829:	e9 bb 00 00 00       	jmp    98e9 <III_antialias+0x202>
         bu = xr[sb][17-ss];
    982e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9831:	89 d0                	mov    %edx,%eax
    9833:	c1 e0 03             	shl    $0x3,%eax
    9836:	01 d0                	add    %edx,%eax
    9838:	c1 e0 04             	shl    $0x4,%eax
    983b:	89 c2                	mov    %eax,%edx
    983d:	8b 45 08             	mov    0x8(%ebp),%eax
    9840:	01 c2                	add    %eax,%edx
    9842:	b8 11 00 00 00       	mov    $0x11,%eax
    9847:	2b 45 f4             	sub    -0xc(%ebp),%eax
    984a:	dd 04 c2             	fldl   (%edx,%eax,8)
    984d:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    9850:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9853:	8d 50 01             	lea    0x1(%eax),%edx
    9856:	89 d0                	mov    %edx,%eax
    9858:	c1 e0 03             	shl    $0x3,%eax
    985b:	01 d0                	add    %edx,%eax
    985d:	c1 e0 04             	shl    $0x4,%eax
    9860:	89 c2                	mov    %eax,%edx
    9862:	8b 45 08             	mov    0x8(%ebp),%eax
    9865:	01 c2                	add    %eax,%edx
    9867:	8b 45 f4             	mov    -0xc(%ebp),%eax
    986a:	dd 04 c2             	fldl   (%edx,%eax,8)
    986d:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    9870:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9873:	89 d0                	mov    %edx,%eax
    9875:	c1 e0 03             	shl    $0x3,%eax
    9878:	01 d0                	add    %edx,%eax
    987a:	c1 e0 04             	shl    $0x4,%eax
    987d:	89 c2                	mov    %eax,%edx
    987f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9882:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9885:	b8 11 00 00 00       	mov    $0x11,%eax
    988a:	2b 45 f4             	sub    -0xc(%ebp),%eax
    988d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9890:	dd 04 d5 c0 ef 00 00 	fldl   0xefc0(,%edx,8)
    9897:	dc 4d d8             	fmull  -0x28(%ebp)
    989a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    989d:	dd 04 d5 00 f0 00 00 	fldl   0xf000(,%edx,8)
    98a4:	dc 4d d0             	fmull  -0x30(%ebp)
    98a7:	de e9                	fsubrp %st,%st(1)
    98a9:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    98ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
    98af:	8d 50 01             	lea    0x1(%eax),%edx
    98b2:	89 d0                	mov    %edx,%eax
    98b4:	c1 e0 03             	shl    $0x3,%eax
    98b7:	01 d0                	add    %edx,%eax
    98b9:	c1 e0 04             	shl    $0x4,%eax
    98bc:	89 c2                	mov    %eax,%edx
    98be:	8b 45 0c             	mov    0xc(%ebp),%eax
    98c1:	01 c2                	add    %eax,%edx
    98c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    98c6:	dd 04 c5 c0 ef 00 00 	fldl   0xefc0(,%eax,8)
    98cd:	dc 4d d0             	fmull  -0x30(%ebp)
    98d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    98d3:	dd 04 c5 00 f0 00 00 	fldl   0xf000(,%eax,8)
    98da:	dc 4d d8             	fmull  -0x28(%ebp)
    98dd:	de c1                	faddp  %st,%st(1)
    98df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    98e2:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    98e5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    98e9:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    98ed:	0f 8e 3b ff ff ff    	jle    982e <III_antialias+0x147>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    98f3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    98f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    98fa:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    98fd:	0f 8c 1f ff ff ff    	jl     9822 <III_antialias+0x13b>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    9903:	c9                   	leave  
    9904:	c3                   	ret    

00009905 <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    9905:	55                   	push   %ebp
    9906:	89 e5                	mov    %esp,%ebp
    9908:	81 ec 98 00 00 00    	sub    $0x98,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    990e:	a1 40 f0 00 00       	mov    0xf040,%eax
    9913:	85 c0                	test   %eax,%eax
    9915:	0f 85 9f 02 00 00    	jne    9bba <inv_mdct+0x2b5>

    /* type 0 */
      for(i=0;i<36;i++)
    991b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9922:	eb 33                	jmp    9957 <inv_mdct+0x52>
         win[0][i] = sin( PI/36 *(i+0.5) );
    9924:	db 45 f4             	fildl  -0xc(%ebp)
    9927:	dd 05 90 d2 00 00    	fldl   0xd290
    992d:	de c1                	faddp  %st,%st(1)
    992f:	dd 05 98 d2 00 00    	fldl   0xd298
    9935:	de c9                	fmulp  %st,%st(1)
    9937:	83 ec 08             	sub    $0x8,%esp
    993a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    993e:	dd 1c 24             	fstpl  (%esp)
    9941:	e8 38 a8 ff ff       	call   417e <sin>
    9946:	83 c4 10             	add    $0x10,%esp
    9949:	8b 45 f4             	mov    -0xc(%ebp),%eax
    994c:	dd 1c c5 80 f0 00 00 	fstpl  0xf080(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    9953:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9957:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    995b:	7e c7                	jle    9924 <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    995d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9964:	eb 36                	jmp    999c <inv_mdct+0x97>
         win[1][i] = sin( PI/36 *(i+0.5) );
    9966:	db 45 f4             	fildl  -0xc(%ebp)
    9969:	dd 05 90 d2 00 00    	fldl   0xd290
    996f:	de c1                	faddp  %st,%st(1)
    9971:	dd 05 98 d2 00 00    	fldl   0xd298
    9977:	de c9                	fmulp  %st,%st(1)
    9979:	83 ec 08             	sub    $0x8,%esp
    997c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9980:	dd 1c 24             	fstpl  (%esp)
    9983:	e8 f6 a7 ff ff       	call   417e <sin>
    9988:	83 c4 10             	add    $0x10,%esp
    998b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    998e:	83 c0 24             	add    $0x24,%eax
    9991:	dd 1c c5 80 f0 00 00 	fstpl  0xf080(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    9998:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    999c:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    99a0:	7e c4                	jle    9966 <inv_mdct+0x61>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    99a2:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    99a9:	eb 13                	jmp    99be <inv_mdct+0xb9>
         win[1][i] = 1.0;
    99ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    99ae:	83 c0 24             	add    $0x24,%eax
    99b1:	d9 e8                	fld1   
    99b3:	dd 1c c5 80 f0 00 00 	fstpl  0xf080(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    99ba:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    99be:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    99c2:	7e e7                	jle    99ab <inv_mdct+0xa6>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    99c4:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    99cb:	eb 3e                	jmp    9a0b <inv_mdct+0x106>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    99cd:	db 45 f4             	fildl  -0xc(%ebp)
    99d0:	dd 05 90 d2 00 00    	fldl   0xd290
    99d6:	de c1                	faddp  %st,%st(1)
    99d8:	dd 05 a0 d2 00 00    	fldl   0xd2a0
    99de:	de e9                	fsubrp %st,%st(1)
    99e0:	dd 05 80 d2 00 00    	fldl   0xd280
    99e6:	de c9                	fmulp  %st,%st(1)
    99e8:	83 ec 08             	sub    $0x8,%esp
    99eb:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    99ef:	dd 1c 24             	fstpl  (%esp)
    99f2:	e8 87 a7 ff ff       	call   417e <sin>
    99f7:	83 c4 10             	add    $0x10,%esp
    99fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    99fd:	83 c0 24             	add    $0x24,%eax
    9a00:	dd 1c c5 80 f0 00 00 	fstpl  0xf080(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    9a07:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9a0b:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    9a0f:	7e bc                	jle    99cd <inv_mdct+0xc8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    9a11:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    9a18:	eb 13                	jmp    9a2d <inv_mdct+0x128>
         win[1][i] = 0.0;
    9a1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9a1d:	83 c0 24             	add    $0x24,%eax
    9a20:	d9 ee                	fldz   
    9a22:	dd 1c c5 80 f0 00 00 	fstpl  0xf080(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    9a29:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9a2d:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9a31:	7e e7                	jle    9a1a <inv_mdct+0x115>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    9a33:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9a3a:	eb 13                	jmp    9a4f <inv_mdct+0x14a>
         win[3][i] = 0.0;
    9a3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9a3f:	83 c0 6c             	add    $0x6c,%eax
    9a42:	d9 ee                	fldz   
    9a44:	dd 1c c5 80 f0 00 00 	fstpl  0xf080(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    9a4b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9a4f:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    9a53:	7e e7                	jle    9a3c <inv_mdct+0x137>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    9a55:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    9a5c:	eb 3e                	jmp    9a9c <inv_mdct+0x197>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    9a5e:	db 45 f4             	fildl  -0xc(%ebp)
    9a61:	dd 05 90 d2 00 00    	fldl   0xd290
    9a67:	de c1                	faddp  %st,%st(1)
    9a69:	dd 05 a8 d2 00 00    	fldl   0xd2a8
    9a6f:	de e9                	fsubrp %st,%st(1)
    9a71:	dd 05 80 d2 00 00    	fldl   0xd280
    9a77:	de c9                	fmulp  %st,%st(1)
    9a79:	83 ec 08             	sub    $0x8,%esp
    9a7c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9a80:	dd 1c 24             	fstpl  (%esp)
    9a83:	e8 f6 a6 ff ff       	call   417e <sin>
    9a88:	83 c4 10             	add    $0x10,%esp
    9a8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9a8e:	83 c0 6c             	add    $0x6c,%eax
    9a91:	dd 1c c5 80 f0 00 00 	fstpl  0xf080(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    9a98:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9a9c:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    9aa0:	7e bc                	jle    9a5e <inv_mdct+0x159>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    9aa2:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    9aa9:	eb 13                	jmp    9abe <inv_mdct+0x1b9>
         win[3][i] =1.0;
    9aab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9aae:	83 c0 6c             	add    $0x6c,%eax
    9ab1:	d9 e8                	fld1   
    9ab3:	dd 1c c5 80 f0 00 00 	fstpl  0xf080(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    9aba:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9abe:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9ac2:	7e e7                	jle    9aab <inv_mdct+0x1a6>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    9ac4:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    9acb:	eb 36                	jmp    9b03 <inv_mdct+0x1fe>
         win[3][i] = sin( PI/36*(i+0.5) );
    9acd:	db 45 f4             	fildl  -0xc(%ebp)
    9ad0:	dd 05 90 d2 00 00    	fldl   0xd290
    9ad6:	de c1                	faddp  %st,%st(1)
    9ad8:	dd 05 98 d2 00 00    	fldl   0xd298
    9ade:	de c9                	fmulp  %st,%st(1)
    9ae0:	83 ec 08             	sub    $0x8,%esp
    9ae3:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9ae7:	dd 1c 24             	fstpl  (%esp)
    9aea:	e8 8f a6 ff ff       	call   417e <sin>
    9aef:	83 c4 10             	add    $0x10,%esp
    9af2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9af5:	83 c0 6c             	add    $0x6c,%eax
    9af8:	dd 1c c5 80 f0 00 00 	fstpl  0xf080(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    9aff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9b03:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9b07:	7e c4                	jle    9acd <inv_mdct+0x1c8>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    9b09:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9b10:	eb 36                	jmp    9b48 <inv_mdct+0x243>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    9b12:	db 45 f4             	fildl  -0xc(%ebp)
    9b15:	dd 05 90 d2 00 00    	fldl   0xd290
    9b1b:	de c1                	faddp  %st,%st(1)
    9b1d:	dd 05 80 d2 00 00    	fldl   0xd280
    9b23:	de c9                	fmulp  %st,%st(1)
    9b25:	83 ec 08             	sub    $0x8,%esp
    9b28:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9b2c:	dd 1c 24             	fstpl  (%esp)
    9b2f:	e8 4a a6 ff ff       	call   417e <sin>
    9b34:	83 c4 10             	add    $0x10,%esp
    9b37:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9b3a:	83 c0 48             	add    $0x48,%eax
    9b3d:	dd 1c c5 80 f0 00 00 	fstpl  0xf080(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    9b44:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9b48:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    9b4c:	7e c4                	jle    9b12 <inv_mdct+0x20d>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    9b4e:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    9b55:	eb 13                	jmp    9b6a <inv_mdct+0x265>
         win[2][i] = 0.0 ;
    9b57:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9b5a:	83 c0 48             	add    $0x48,%eax
    9b5d:	d9 ee                	fldz   
    9b5f:	dd 1c c5 80 f0 00 00 	fstpl  0xf080(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    9b66:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9b6a:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9b6e:	7e e7                	jle    9b57 <inv_mdct+0x252>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    9b70:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9b77:	eb 2b                	jmp    9ba4 <inv_mdct+0x29f>
         COS[i] = cos(PI/(2*36) * i);
    9b79:	db 45 f4             	fildl  -0xc(%ebp)
    9b7c:	dd 05 b0 d2 00 00    	fldl   0xd2b0
    9b82:	de c9                	fmulp  %st,%st(1)
    9b84:	83 ec 08             	sub    $0x8,%esp
    9b87:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9b8b:	dd 1c 24             	fstpl  (%esp)
    9b8e:	e8 8a a6 ff ff       	call   421d <cos>
    9b93:	83 c4 10             	add    $0x10,%esp
    9b96:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9b99:	dd 1c c5 00 f5 00 00 	fstpl  0xf500(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    9ba0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9ba4:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    9bab:	7e cc                	jle    9b79 <inv_mdct+0x274>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    9bad:	a1 40 f0 00 00       	mov    0xf040,%eax
    9bb2:	83 c0 01             	add    $0x1,%eax
    9bb5:	a3 40 f0 00 00       	mov    %eax,0xf040
    }

    for(i=0;i<36;i++)
    9bba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9bc1:	eb 17                	jmp    9bda <inv_mdct+0x2d5>
       out[i]=0;
    9bc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9bc6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9bcd:	8b 45 0c             	mov    0xc(%ebp),%eax
    9bd0:	01 d0                	add    %edx,%eax
    9bd2:	d9 ee                	fldz   
    9bd4:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    9bd6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9bda:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9bde:	7e e3                	jle    9bc3 <inv_mdct+0x2be>
       out[i]=0;

    if(block_type == 2){
    9be0:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    9be4:	0f 85 8f 01 00 00    	jne    9d79 <inv_mdct+0x474>
       N=12;
    9bea:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    9bf1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9bf8:	e9 6d 01 00 00       	jmp    9d6a <inv_mdct+0x465>
          for(p= 0;p<N;p++){
    9bfd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9c04:	e9 e9 00 00 00       	jmp    9cf2 <inv_mdct+0x3ed>
             sum = 0.0;
    9c09:	d9 ee                	fldz   
    9c0b:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    9c0e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9c15:	e9 99 00 00 00       	jmp    9cb3 <inv_mdct+0x3ae>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    9c1a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9c1d:	89 d0                	mov    %edx,%eax
    9c1f:	01 c0                	add    %eax,%eax
    9c21:	01 c2                	add    %eax,%edx
    9c23:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9c26:	01 d0                	add    %edx,%eax
    9c28:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9c2f:	8b 45 08             	mov    0x8(%ebp),%eax
    9c32:	01 d0                	add    %edx,%eax
    9c34:	dd 00                	fldl   (%eax)
    9c36:	dd 9d 70 ff ff ff    	fstpl  -0x90(%ebp)
    9c3c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9c3f:	01 c0                	add    %eax,%eax
    9c41:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    9c47:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    9c4d:	dd 05 b8 d2 00 00    	fldl   0xd2b8
    9c53:	de f1                	fdivp  %st,%st(1)
    9c55:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9c58:	01 c0                	add    %eax,%eax
    9c5a:	8d 50 01             	lea    0x1(%eax),%edx
    9c5d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9c60:	89 c1                	mov    %eax,%ecx
    9c62:	c1 e9 1f             	shr    $0x1f,%ecx
    9c65:	01 c8                	add    %ecx,%eax
    9c67:	d1 f8                	sar    %eax
    9c69:	01 d0                	add    %edx,%eax
    9c6b:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    9c71:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    9c77:	de c9                	fmulp  %st,%st(1)
    9c79:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9c7c:	01 c0                	add    %eax,%eax
    9c7e:	83 c0 01             	add    $0x1,%eax
    9c81:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    9c87:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    9c8d:	de c9                	fmulp  %st,%st(1)
    9c8f:	83 ec 08             	sub    $0x8,%esp
    9c92:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9c96:	dd 1c 24             	fstpl  (%esp)
    9c99:	e8 7f a5 ff ff       	call   421d <cos>
    9c9e:	83 c4 10             	add    $0x10,%esp
    9ca1:	dc 8d 70 ff ff ff    	fmull  -0x90(%ebp)
    9ca7:	dd 45 e0             	fldl   -0x20(%ebp)
    9caa:	de c1                	faddp  %st,%st(1)
    9cac:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    9caf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9cb3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9cb6:	89 c2                	mov    %eax,%edx
    9cb8:	c1 ea 1f             	shr    $0x1f,%edx
    9cbb:	01 d0                	add    %edx,%eax
    9cbd:	d1 f8                	sar    %eax
    9cbf:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    9cc2:	0f 8f 52 ff ff ff    	jg     9c1a <inv_mdct+0x315>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    9cc8:	8b 55 10             	mov    0x10(%ebp),%edx
    9ccb:	89 d0                	mov    %edx,%eax
    9ccd:	c1 e0 03             	shl    $0x3,%eax
    9cd0:	01 d0                	add    %edx,%eax
    9cd2:	c1 e0 02             	shl    $0x2,%eax
    9cd5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9cd8:	01 d0                	add    %edx,%eax
    9cda:	dd 04 c5 80 f0 00 00 	fldl   0xf080(,%eax,8)
    9ce1:	dc 4d e0             	fmull  -0x20(%ebp)
    9ce4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9ce7:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    9cee:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9cf2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9cf5:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9cf8:	0f 8c 0b ff ff ff    	jl     9c09 <inv_mdct+0x304>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    9cfe:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9d05:	eb 57                	jmp    9d5e <inv_mdct+0x459>
             out[6*i+p+6] += tmp[p];
    9d07:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9d0a:	89 d0                	mov    %edx,%eax
    9d0c:	01 c0                	add    %eax,%eax
    9d0e:	01 d0                	add    %edx,%eax
    9d10:	01 c0                	add    %eax,%eax
    9d12:	89 c2                	mov    %eax,%edx
    9d14:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9d17:	01 d0                	add    %edx,%eax
    9d19:	83 c0 06             	add    $0x6,%eax
    9d1c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9d23:	8b 45 0c             	mov    0xc(%ebp),%eax
    9d26:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9d29:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9d2c:	89 d0                	mov    %edx,%eax
    9d2e:	01 c0                	add    %eax,%eax
    9d30:	01 d0                	add    %edx,%eax
    9d32:	01 c0                	add    %eax,%eax
    9d34:	89 c2                	mov    %eax,%edx
    9d36:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9d39:	01 d0                	add    %edx,%eax
    9d3b:	83 c0 06             	add    $0x6,%eax
    9d3e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9d45:	8b 45 0c             	mov    0xc(%ebp),%eax
    9d48:	01 d0                	add    %edx,%eax
    9d4a:	dd 00                	fldl   (%eax)
    9d4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9d4f:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    9d56:	de c1                	faddp  %st,%st(1)
    9d58:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    9d5a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9d5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9d61:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9d64:	7c a1                	jl     9d07 <inv_mdct+0x402>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    9d66:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9d6a:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    9d6e:	0f 8e 89 fe ff ff    	jle    9bfd <inv_mdct+0x2f8>
    9d74:	e9 da 00 00 00       	jmp    9e53 <inv_mdct+0x54e>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    9d79:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    9d80:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9d87:	e9 bb 00 00 00       	jmp    9e47 <inv_mdct+0x542>
         sum = 0.0;
    9d8c:	d9 ee                	fldz   
    9d8e:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    9d91:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9d98:	eb 6a                	jmp    9e04 <inv_mdct+0x4ff>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    9d9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d9d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9da4:	8b 45 08             	mov    0x8(%ebp),%eax
    9da7:	01 d0                	add    %edx,%eax
    9da9:	dd 00                	fldl   (%eax)
    9dab:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9dae:	01 c0                	add    %eax,%eax
    9db0:	8d 50 01             	lea    0x1(%eax),%edx
    9db3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9db6:	89 c1                	mov    %eax,%ecx
    9db8:	c1 e9 1f             	shr    $0x1f,%ecx
    9dbb:	01 c8                	add    %ecx,%eax
    9dbd:	d1 f8                	sar    %eax
    9dbf:	01 c2                	add    %eax,%edx
    9dc1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9dc4:	01 c0                	add    %eax,%eax
    9dc6:	83 c0 01             	add    $0x1,%eax
    9dc9:	89 d1                	mov    %edx,%ecx
    9dcb:	0f af c8             	imul   %eax,%ecx
    9dce:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9dd3:	89 c8                	mov    %ecx,%eax
    9dd5:	f7 ea                	imul   %edx
    9dd7:	c1 fa 05             	sar    $0x5,%edx
    9dda:	89 c8                	mov    %ecx,%eax
    9ddc:	c1 f8 1f             	sar    $0x1f,%eax
    9ddf:	29 c2                	sub    %eax,%edx
    9de1:	89 d0                	mov    %edx,%eax
    9de3:	c1 e0 03             	shl    $0x3,%eax
    9de6:	01 d0                	add    %edx,%eax
    9de8:	c1 e0 04             	shl    $0x4,%eax
    9deb:	29 c1                	sub    %eax,%ecx
    9ded:	89 ca                	mov    %ecx,%edx
    9def:	dd 04 d5 00 f5 00 00 	fldl   0xf500(,%edx,8)
    9df6:	de c9                	fmulp  %st,%st(1)
    9df8:	dd 45 e0             	fldl   -0x20(%ebp)
    9dfb:	de c1                	faddp  %st,%st(1)
    9dfd:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    9e00:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9e04:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9e07:	89 c2                	mov    %eax,%edx
    9e09:	c1 ea 1f             	shr    $0x1f,%edx
    9e0c:	01 d0                	add    %edx,%eax
    9e0e:	d1 f8                	sar    %eax
    9e10:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    9e13:	7f 85                	jg     9d9a <inv_mdct+0x495>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    9e15:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9e18:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9e1f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9e22:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9e25:	8b 55 10             	mov    0x10(%ebp),%edx
    9e28:	89 d0                	mov    %edx,%eax
    9e2a:	c1 e0 03             	shl    $0x3,%eax
    9e2d:	01 d0                	add    %edx,%eax
    9e2f:	c1 e0 02             	shl    $0x2,%eax
    9e32:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9e35:	01 d0                	add    %edx,%eax
    9e37:	dd 04 c5 80 f0 00 00 	fldl   0xf080(,%eax,8)
    9e3e:	dc 4d e0             	fmull  -0x20(%ebp)
    9e41:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    9e43:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9e47:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9e4a:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9e4d:	0f 8c 39 ff ff ff    	jl     9d8c <inv_mdct+0x487>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    9e53:	c9                   	leave  
    9e54:	c3                   	ret    

00009e55 <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    9e55:	55                   	push   %ebp
    9e56:	89 e5                	mov    %esp,%ebp
    9e58:	53                   	push   %ebx
    9e59:	81 ec 44 01 00 00    	sub    $0x144,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    9e5f:	a1 04 ef 00 00       	mov    0xef04,%eax
    9e64:	85 c0                	test   %eax,%eax
    9e66:	74 6f                	je     9ed7 <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    9e68:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9e6f:	eb 56                	jmp    9ec7 <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    9e71:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9e78:	eb 43                	jmp    9ebd <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    9e7a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9e81:	eb 30                	jmp    9eb3 <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    9e83:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9e86:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9e89:	89 c2                	mov    %eax,%edx
    9e8b:	c1 e2 03             	shl    $0x3,%edx
    9e8e:	01 c2                	add    %eax,%edx
    9e90:	8d 04 12             	lea    (%edx,%edx,1),%eax
    9e93:	89 c2                	mov    %eax,%edx
    9e95:	89 c8                	mov    %ecx,%eax
    9e97:	c1 e0 03             	shl    $0x3,%eax
    9e9a:	01 c8                	add    %ecx,%eax
    9e9c:	c1 e0 06             	shl    $0x6,%eax
    9e9f:	01 c2                	add    %eax,%edx
    9ea1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9ea4:	01 d0                	add    %edx,%eax
    9ea6:	d9 ee                	fldz   
    9ea8:	dd 1c c5 80 f9 00 00 	fstpl  0xf980(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    9eaf:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9eb3:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    9eb7:	7e ca                	jle    9e83 <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    9eb9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9ebd:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    9ec1:	7e b7                	jle    9e7a <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    9ec3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9ec7:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    9ecb:	7e a4                	jle    9e71 <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    9ecd:	c7 05 04 ef 00 00 00 	movl   $0x0,0xef04
    9ed4:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9ed7:	8b 45 18             	mov    0x18(%ebp),%eax
    9eda:	8b 40 10             	mov    0x10(%eax),%eax
    9edd:	85 c0                	test   %eax,%eax
    9edf:	74 10                	je     9ef1 <III_hybrid+0x9c>
    9ee1:	8b 45 18             	mov    0x18(%ebp),%eax
    9ee4:	8b 40 18             	mov    0x18(%eax),%eax
    9ee7:	85 c0                	test   %eax,%eax
    9ee9:	74 06                	je     9ef1 <III_hybrid+0x9c>
    9eeb:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    9eef:	7e 08                	jle    9ef9 <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    9ef1:	8b 45 18             	mov    0x18(%ebp),%eax
    9ef4:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9ef7:	eb 05                	jmp    9efe <III_hybrid+0xa9>
    9ef9:	b8 00 00 00 00       	mov    $0x0,%eax
    9efe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    9f01:	83 ec 04             	sub    $0x4,%esp
    9f04:	ff 75 e4             	pushl  -0x1c(%ebp)
    9f07:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    9f0d:	50                   	push   %eax
    9f0e:	ff 75 08             	pushl  0x8(%ebp)
    9f11:	e8 ef f9 ff ff       	call   9905 <inv_mdct>
    9f16:	83 c4 10             	add    $0x10,%esp

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    9f19:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9f20:	e9 83 00 00 00       	jmp    9fa8 <III_hybrid+0x153>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    9f25:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f28:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9f2f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9f32:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9f35:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f38:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    9f3f:	8b 45 10             	mov    0x10(%ebp),%eax
    9f42:	8b 4d 14             	mov    0x14(%ebp),%ecx
    9f45:	89 c2                	mov    %eax,%edx
    9f47:	c1 e2 03             	shl    $0x3,%edx
    9f4a:	01 c2                	add    %eax,%edx
    9f4c:	8d 04 12             	lea    (%edx,%edx,1),%eax
    9f4f:	89 c2                	mov    %eax,%edx
    9f51:	89 c8                	mov    %ecx,%eax
    9f53:	c1 e0 03             	shl    $0x3,%eax
    9f56:	01 c8                	add    %ecx,%eax
    9f58:	c1 e0 06             	shl    $0x6,%eax
    9f5b:	01 c2                	add    %eax,%edx
    9f5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f60:	01 d0                	add    %edx,%eax
    9f62:	dd 04 c5 80 f9 00 00 	fldl   0xf980(,%eax,8)
    9f69:	de c1                	faddp  %st,%st(1)
    9f6b:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    9f6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f70:	83 c0 12             	add    $0x12,%eax
    9f73:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    9f7a:	8b 45 10             	mov    0x10(%ebp),%eax
    9f7d:	8b 4d 14             	mov    0x14(%ebp),%ecx
    9f80:	89 c2                	mov    %eax,%edx
    9f82:	c1 e2 03             	shl    $0x3,%edx
    9f85:	01 c2                	add    %eax,%edx
    9f87:	8d 04 12             	lea    (%edx,%edx,1),%eax
    9f8a:	89 c2                	mov    %eax,%edx
    9f8c:	89 c8                	mov    %ecx,%eax
    9f8e:	c1 e0 03             	shl    $0x3,%eax
    9f91:	01 c8                	add    %ecx,%eax
    9f93:	c1 e0 06             	shl    $0x6,%eax
    9f96:	01 c2                	add    %eax,%edx
    9f98:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f9b:	01 d0                	add    %edx,%eax
    9f9d:	dd 1c c5 80 f9 00 00 	fstpl  0xf980(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    9fa4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9fa8:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9fac:	0f 8e 73 ff ff ff    	jle    9f25 <III_hybrid+0xd0>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    9fb2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    9fb5:	c9                   	leave  
    9fb6:	c3                   	ret    

00009fb7 <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    9fb7:	55                   	push   %ebp
    9fb8:	89 e5                	mov    %esp,%ebp
    9fba:	57                   	push   %edi
    9fbb:	56                   	push   %esi
    9fbc:	53                   	push   %ebx
    9fbd:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    9fc0:	be 00 00 00 00       	mov    $0x0,%esi
    9fc5:	e9 1a 01 00 00       	jmp    a0e4 <create_syn_filter+0x12d>
		for (k=0; k<32; k++) {
    9fca:	bb 00 00 00 00       	mov    $0x0,%ebx
    9fcf:	e9 04 01 00 00       	jmp    a0d8 <create_syn_filter+0x121>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    9fd4:	89 f0                	mov    %esi,%eax
    9fd6:	c1 e0 08             	shl    $0x8,%eax
    9fd9:	89 c2                	mov    %eax,%edx
    9fdb:	8b 45 08             	mov    0x8(%ebp),%eax
    9fde:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    9fe1:	89 75 dc             	mov    %esi,-0x24(%ebp)
    9fe4:	db 45 dc             	fildl  -0x24(%ebp)
    9fe7:	dd 05 c0 d2 00 00    	fldl   0xd2c0
    9fed:	de c9                	fmulp  %st,%st(1)
    9fef:	dd 05 c8 d2 00 00    	fldl   0xd2c8
    9ff5:	de c1                	faddp  %st,%st(1)
    9ff7:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    9ffa:	83 c0 01             	add    $0x1,%eax
    9ffd:	89 45 dc             	mov    %eax,-0x24(%ebp)
    a000:	db 45 dc             	fildl  -0x24(%ebp)
    a003:	de c9                	fmulp  %st,%st(1)
    a005:	83 ec 08             	sub    $0x8,%esp
    a008:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a00c:	dd 1c 24             	fstpl  (%esp)
    a00f:	e8 09 a2 ff ff       	call   421d <cos>
    a014:	83 c4 10             	add    $0x10,%esp
    a017:	dd 05 d0 d2 00 00    	fldl   0xd2d0
    a01d:	de c9                	fmulp  %st,%st(1)
    a01f:	dd 1c df             	fstpl  (%edi,%ebx,8)
    a022:	dd 04 df             	fldl   (%edi,%ebx,8)
    a025:	d9 ee                	fldz   
    a027:	d9 c9                	fxch   %st(1)
    a029:	df e9                	fucomip %st(1),%st
    a02b:	dd d8                	fstp   %st(0)
    a02d:	72 41                	jb     a070 <create_syn_filter+0xb9>
				filter[i][k] = (int)(filter[i][k]+0.5);
    a02f:	89 f0                	mov    %esi,%eax
    a031:	c1 e0 08             	shl    $0x8,%eax
    a034:	89 c2                	mov    %eax,%edx
    a036:	8b 45 08             	mov    0x8(%ebp),%eax
    a039:	01 c2                	add    %eax,%edx
    a03b:	89 f0                	mov    %esi,%eax
    a03d:	c1 e0 08             	shl    $0x8,%eax
    a040:	89 c1                	mov    %eax,%ecx
    a042:	8b 45 08             	mov    0x8(%ebp),%eax
    a045:	01 c8                	add    %ecx,%eax
    a047:	dd 04 d8             	fldl   (%eax,%ebx,8)
    a04a:	dd 05 90 d2 00 00    	fldl   0xd290
    a050:	de c1                	faddp  %st,%st(1)
    a052:	d9 7d e6             	fnstcw -0x1a(%ebp)
    a055:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    a059:	b4 0c                	mov    $0xc,%ah
    a05b:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    a05f:	d9 6d e4             	fldcw  -0x1c(%ebp)
    a062:	db 5d dc             	fistpl -0x24(%ebp)
    a065:	d9 6d e6             	fldcw  -0x1a(%ebp)
    a068:	db 45 dc             	fildl  -0x24(%ebp)
    a06b:	dd 1c da             	fstpl  (%edx,%ebx,8)
    a06e:	eb 3f                	jmp    a0af <create_syn_filter+0xf8>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    a070:	89 f0                	mov    %esi,%eax
    a072:	c1 e0 08             	shl    $0x8,%eax
    a075:	89 c2                	mov    %eax,%edx
    a077:	8b 45 08             	mov    0x8(%ebp),%eax
    a07a:	01 c2                	add    %eax,%edx
    a07c:	89 f0                	mov    %esi,%eax
    a07e:	c1 e0 08             	shl    $0x8,%eax
    a081:	89 c1                	mov    %eax,%ecx
    a083:	8b 45 08             	mov    0x8(%ebp),%eax
    a086:	01 c8                	add    %ecx,%eax
    a088:	dd 04 d8             	fldl   (%eax,%ebx,8)
    a08b:	dd 05 90 d2 00 00    	fldl   0xd290
    a091:	de e9                	fsubrp %st,%st(1)
    a093:	d9 7d e6             	fnstcw -0x1a(%ebp)
    a096:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    a09a:	b4 0c                	mov    $0xc,%ah
    a09c:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    a0a0:	d9 6d e4             	fldcw  -0x1c(%ebp)
    a0a3:	db 5d dc             	fistpl -0x24(%ebp)
    a0a6:	d9 6d e6             	fldcw  -0x1a(%ebp)
    a0a9:	db 45 dc             	fildl  -0x24(%ebp)
    a0ac:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    a0af:	89 f0                	mov    %esi,%eax
    a0b1:	c1 e0 08             	shl    $0x8,%eax
    a0b4:	89 c2                	mov    %eax,%edx
    a0b6:	8b 45 08             	mov    0x8(%ebp),%eax
    a0b9:	01 d0                	add    %edx,%eax
    a0bb:	89 f2                	mov    %esi,%edx
    a0bd:	89 d1                	mov    %edx,%ecx
    a0bf:	c1 e1 08             	shl    $0x8,%ecx
    a0c2:	8b 55 08             	mov    0x8(%ebp),%edx
    a0c5:	01 ca                	add    %ecx,%edx
    a0c7:	dd 04 da             	fldl   (%edx,%ebx,8)
    a0ca:	dd 05 d8 d2 00 00    	fldl   0xd2d8
    a0d0:	de c9                	fmulp  %st,%st(1)
    a0d2:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    a0d5:	83 c3 01             	add    $0x1,%ebx
    a0d8:	83 fb 1f             	cmp    $0x1f,%ebx
    a0db:	0f 8e f3 fe ff ff    	jle    9fd4 <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    a0e1:	83 c6 01             	add    $0x1,%esi
    a0e4:	83 fe 3f             	cmp    $0x3f,%esi
    a0e7:	0f 8e dd fe ff ff    	jle    9fca <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    a0ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a0f0:	5b                   	pop    %ebx
    a0f1:	5e                   	pop    %esi
    a0f2:	5f                   	pop    %edi
    a0f3:	5d                   	pop    %ebp
    a0f4:	c3                   	ret    

0000a0f5 <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    a0f5:	55                   	push   %ebp
    a0f6:	89 e5                	mov    %esp,%ebp
    a0f8:	57                   	push   %edi
    a0f9:	56                   	push   %esi
    a0fa:	53                   	push   %ebx
    a0fb:	81 ec 04 10 00 00    	sub    $0x1004,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    a101:	8d 85 f0 ef ff ff    	lea    -0x1010(%ebp),%eax
    a107:	bb 40 c2 00 00       	mov    $0xc240,%ebx
    a10c:	ba 00 04 00 00       	mov    $0x400,%edx
    a111:	89 c7                	mov    %eax,%edi
    a113:	89 de                	mov    %ebx,%esi
    a115:	89 d1                	mov    %edx,%ecx
    a117:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    a119:	8d 85 f0 ef ff ff    	lea    -0x1010(%ebp),%eax
    a11f:	89 45 08             	mov    %eax,0x8(%ebp)
}
    a122:	81 c4 04 10 00 00    	add    $0x1004,%esp
    a128:	5b                   	pop    %ebx
    a129:	5e                   	pop    %esi
    a12a:	5f                   	pop    %edi
    a12b:	5d                   	pop    %ebp
    a12c:	c3                   	ret    

0000a12d <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    a12d:	55                   	push   %ebp
    a12e:	89 e5                	mov    %esp,%ebp
    a130:	57                   	push   %edi
    a131:	56                   	push   %esi
    a132:	53                   	push   %ebx
    a133:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    a136:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    a13d:	a1 08 ef 00 00       	mov    0xef08,%eax
    a142:	85 c0                	test   %eax,%eax
    a144:	74 7a                	je     a1c0 <SubBandSynthesis+0x93>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    a146:	83 ec 08             	sub    $0x8,%esp
    a149:	68 40 d2 00 00       	push   $0xd240
    a14e:	68 00 40 00 00       	push   $0x4000
    a153:	e8 af a7 ff ff       	call   4907 <mem_alloc>
    a158:	83 c4 10             	add    $0x10,%esp
    a15b:	a3 80 1d 01 00       	mov    %eax,0x11d80
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    a160:	83 ec 08             	sub    $0x8,%esp
    a163:	68 43 d2 00 00       	push   $0xd243
    a168:	68 00 40 00 00       	push   $0x4000
    a16d:	e8 95 a7 ff ff       	call   4907 <mem_alloc>
    a172:	83 c4 10             	add    $0x10,%esp
    a175:	a3 84 1d 01 00       	mov    %eax,0x11d84
		create_syn_filter(*filter);
    a17a:	a1 84 1d 01 00       	mov    0x11d84,%eax
    a17f:	83 ec 0c             	sub    $0xc,%esp
    a182:	50                   	push   %eax
    a183:	e8 2f fe ff ff       	call   9fb7 <create_syn_filter>
    a188:	83 c4 10             	add    $0x10,%esp
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    a18b:	83 ec 08             	sub    $0x8,%esp
    a18e:	68 46 d2 00 00       	push   $0xd246
    a193:	68 00 10 00 00       	push   $0x1000
    a198:	e8 6a a7 ff ff       	call   4907 <mem_alloc>
    a19d:	83 c4 10             	add    $0x10,%esp
    a1a0:	a3 88 1d 01 00       	mov    %eax,0x11d88
		read_syn_window(window);
    a1a5:	a1 88 1d 01 00       	mov    0x11d88,%eax
    a1aa:	83 ec 0c             	sub    $0xc,%esp
    a1ad:	50                   	push   %eax
    a1ae:	e8 42 ff ff ff       	call   a0f5 <read_syn_window>
    a1b3:	83 c4 10             	add    $0x10,%esp
		init = 0;
    a1b6:	c7 05 08 ef 00 00 00 	movl   $0x0,0xef08
    a1bd:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    a1c0:	8b 45 0c             	mov    0xc(%ebp),%eax
    a1c3:	8b 04 85 0c ef 00 00 	mov    0xef0c(,%eax,4),%eax
    a1ca:	83 e8 40             	sub    $0x40,%eax
    a1cd:	25 ff 03 00 00       	and    $0x3ff,%eax
    a1d2:	89 c2                	mov    %eax,%edx
    a1d4:	8b 45 0c             	mov    0xc(%ebp),%eax
    a1d7:	89 14 85 0c ef 00 00 	mov    %edx,0xef0c(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    a1de:	8b 15 80 1d 01 00    	mov    0x11d80,%edx
    a1e4:	8b 45 0c             	mov    0xc(%ebp),%eax
    a1e7:	8b 04 85 0c ef 00 00 	mov    0xef0c(,%eax,4),%eax
    a1ee:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a1f1:	c1 e1 0a             	shl    $0xa,%ecx
    a1f4:	01 c8                	add    %ecx,%eax
    a1f6:	c1 e0 03             	shl    $0x3,%eax
    a1f9:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    a1fc:	bb 00 00 00 00       	mov    $0x0,%ebx
    a201:	eb 40                	jmp    a243 <SubBandSynthesis+0x116>
		sum = 0;
    a203:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    a205:	be 00 00 00 00       	mov    $0x0,%esi
    a20a:	eb 26                	jmp    a232 <SubBandSynthesis+0x105>
			sum += bandPtr[k] * (*filter)[i][k];
    a20c:	89 f0                	mov    %esi,%eax
    a20e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a215:	8b 45 08             	mov    0x8(%ebp),%eax
    a218:	01 d0                	add    %edx,%eax
    a21a:	dd 00                	fldl   (%eax)
    a21c:	a1 84 1d 01 00       	mov    0x11d84,%eax
    a221:	89 da                	mov    %ebx,%edx
    a223:	c1 e2 05             	shl    $0x5,%edx
    a226:	01 f2                	add    %esi,%edx
    a228:	dd 04 d0             	fldl   (%eax,%edx,8)
    a22b:	de c9                	fmulp  %st,%st(1)
    a22d:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    a22f:	83 c6 01             	add    $0x1,%esi
    a232:	83 fe 1f             	cmp    $0x1f,%esi
    a235:	7e d5                	jle    a20c <SubBandSynthesis+0xdf>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    a237:	89 d8                	mov    %ebx,%eax
    a239:	c1 e0 03             	shl    $0x3,%eax
    a23c:	01 f8                	add    %edi,%eax
    a23e:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    a240:	83 c3 01             	add    $0x1,%ebx
    a243:	83 fb 3f             	cmp    $0x3f,%ebx
    a246:	7e bb                	jle    a203 <SubBandSynthesis+0xd6>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    a248:	bf 00 00 00 00       	mov    $0x0,%edi
    a24d:	e9 c7 00 00 00       	jmp    a319 <SubBandSynthesis+0x1ec>
		sum = 0;
    a252:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    a254:	bb 00 00 00 00       	mov    $0x0,%ebx
    a259:	eb 4c                	jmp    a2a7 <SubBandSynthesis+0x17a>
			k = j + (i<<5);
    a25b:	89 d8                	mov    %ebx,%eax
    a25d:	c1 e0 05             	shl    $0x5,%eax
    a260:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a263:	a1 88 1d 01 00       	mov    0x11d88,%eax
    a268:	89 f2                	mov    %esi,%edx
    a26a:	c1 e2 03             	shl    $0x3,%edx
    a26d:	01 d0                	add    %edx,%eax
    a26f:	dd 00                	fldl   (%eax)
    a271:	a1 80 1d 01 00       	mov    0x11d80,%eax
    a276:	8d 53 01             	lea    0x1(%ebx),%edx
    a279:	d1 fa                	sar    %edx
    a27b:	c1 e2 06             	shl    $0x6,%edx
    a27e:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    a281:	8b 55 0c             	mov    0xc(%ebp),%edx
    a284:	8b 14 95 0c ef 00 00 	mov    0xef0c(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a28b:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    a28d:	89 d1                	mov    %edx,%ecx
    a28f:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a295:	8b 55 0c             	mov    0xc(%ebp),%edx
    a298:	c1 e2 0a             	shl    $0xa,%edx
    a29b:	01 ca                	add    %ecx,%edx
    a29d:	dd 04 d0             	fldl   (%eax,%edx,8)
    a2a0:	de c9                	fmulp  %st,%st(1)
    a2a2:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    a2a4:	83 c3 01             	add    $0x1,%ebx
    a2a7:	83 fb 0f             	cmp    $0xf,%ebx
    a2aa:	7e af                	jle    a25b <SubBandSynthesis+0x12e>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    a2ac:	dd 05 e0 d2 00 00    	fldl   0xd2e0
    a2b2:	de c9                	fmulp  %st,%st(1)
    a2b4:	d9 7d d6             	fnstcw -0x2a(%ebp)
    a2b7:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    a2bb:	b4 0c                	mov    $0xc,%ah
    a2bd:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    a2c1:	d9 6d d4             	fldcw  -0x2c(%ebp)
    a2c4:	db 5d e0             	fistpl -0x20(%ebp)
    a2c7:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    a2ca:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    a2d1:	7e 15                	jle    a2e8 <SubBandSynthesis+0x1bb>
    a2d3:	89 f8                	mov    %edi,%eax
    a2d5:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a2d8:	8b 45 10             	mov    0x10(%ebp),%eax
    a2db:	01 d0                	add    %edx,%eax
    a2dd:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    a2e2:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a2e6:	eb 2e                	jmp    a316 <SubBandSynthesis+0x1e9>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    a2e8:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    a2ef:	7d 15                	jge    a306 <SubBandSynthesis+0x1d9>
    a2f1:	89 f8                	mov    %edi,%eax
    a2f3:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a2f6:	8b 45 10             	mov    0x10(%ebp),%eax
    a2f9:	01 d0                	add    %edx,%eax
    a2fb:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    a300:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a304:	eb 10                	jmp    a316 <SubBandSynthesis+0x1e9>
			else                           samples[j] = foo;
    a306:	89 f8                	mov    %edi,%eax
    a308:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a30b:	8b 45 10             	mov    0x10(%ebp),%eax
    a30e:	01 d0                	add    %edx,%eax
    a310:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a313:	66 89 10             	mov    %dx,(%eax)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    a316:	83 c7 01             	add    $0x1,%edi
    a319:	83 ff 1f             	cmp    $0x1f,%edi
    a31c:	0f 8e 30 ff ff ff    	jle    a252 <SubBandSynthesis+0x125>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    a322:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    a325:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a328:	5b                   	pop    %ebx
    a329:	5e                   	pop    %esi
    a32a:	5f                   	pop    %edi
    a32b:	5d                   	pop    %ebp
    a32c:	c3                   	ret    

0000a32d <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    a32d:	55                   	push   %ebp
    a32e:	89 e5                	mov    %esp,%ebp
    a330:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    a333:	8b 45 10             	mov    0x10(%ebp),%eax
    a336:	8b 40 08             	mov    0x8(%eax),%eax
    a339:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    a33c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    a343:	eb 75                	jmp    a3ba <out_fifo+0x8d>
    a345:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    a34c:	eb 62                	jmp    a3b0 <out_fifo+0x83>
            (*psampFrames)++;
    a34e:	8b 45 14             	mov    0x14(%ebp),%eax
    a351:	8b 00                	mov    (%eax),%eax
    a353:	8d 50 01             	lea    0x1(%eax),%edx
    a356:	8b 45 14             	mov    0x14(%ebp),%eax
    a359:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    a35b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a362:	eb 40                	jmp    a3a4 <out_fifo+0x77>
                if (!(k%1600) && k) {
    a364:	8b 0d 8c 1d 01 00    	mov    0x11d8c,%ecx
    a36a:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    a36f:	89 c8                	mov    %ecx,%eax
    a371:	f7 ea                	imul   %edx
    a373:	c1 fa 09             	sar    $0x9,%edx
    a376:	89 c8                	mov    %ecx,%eax
    a378:	c1 f8 1f             	sar    $0x1f,%eax
    a37b:	29 c2                	sub    %eax,%edx
    a37d:	89 d0                	mov    %edx,%eax
    a37f:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    a385:	29 c1                	sub    %eax,%ecx
    a387:	89 c8                	mov    %ecx,%eax
    a389:	85 c0                	test   %eax,%eax
    a38b:	75 13                	jne    a3a0 <out_fifo+0x73>
    a38d:	a1 8c 1d 01 00       	mov    0x11d8c,%eax
    a392:	85 c0                	test   %eax,%eax
    a394:	74 0a                	je     a3a0 <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    a396:	c7 05 8c 1d 01 00 00 	movl   $0x0,0x11d8c
    a39d:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    a3a0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a3a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a3a7:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a3aa:	7c b8                	jl     a364 <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    a3ac:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    a3b0:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    a3b4:	7e 98                	jle    a34e <out_fifo+0x21>
    a3b6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    a3ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
    a3bd:	3b 45 0c             	cmp    0xc(%ebp),%eax
    a3c0:	7c 83                	jl     a345 <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    a3c2:	c9                   	leave  
    a3c3:	c3                   	ret    

0000a3c4 <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    a3c4:	55                   	push   %ebp
    a3c5:	89 e5                	mov    %esp,%ebp
    a3c7:	83 ec 08             	sub    $0x8,%esp
    *old_crc = getbits(bs, 16);
    a3ca:	83 ec 08             	sub    $0x8,%esp
    a3cd:	6a 10                	push   $0x10
    a3cf:	ff 75 08             	pushl  0x8(%ebp)
    a3d2:	e8 14 a8 ff ff       	call   4beb <getbits>
    a3d7:	83 c4 10             	add    $0x10,%esp
    a3da:	89 c2                	mov    %eax,%edx
    a3dc:	8b 45 0c             	mov    0xc(%ebp),%eax
    a3df:	89 10                	mov    %edx,(%eax)
}
    a3e1:	c9                   	leave  
    a3e2:	c3                   	ret    

0000a3e3 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    a3e3:	55                   	push   %ebp
    a3e4:	89 e5                	mov    %esp,%ebp
    a3e6:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    a3e9:	8b 45 08             	mov    0x8(%ebp),%eax
    a3ec:	8b 40 0c             	mov    0xc(%eax),%eax
    a3ef:	83 c0 1e             	add    $0x1e,%eax
    a3f2:	8b 14 85 00 ea 00 00 	mov    0xea00(,%eax,4),%edx
    a3f9:	89 d0                	mov    %edx,%eax
    a3fb:	c1 e0 03             	shl    $0x3,%eax
    a3fe:	01 d0                	add    %edx,%eax
    a400:	c1 e0 04             	shl    $0x4,%eax
    a403:	89 45 e8             	mov    %eax,-0x18(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
    a406:	db 45 e8             	fildl  -0x18(%ebp)
    a409:	8b 45 08             	mov    0x8(%ebp),%eax
    a40c:	8b 40 10             	mov    0x10(%eax),%eax
    a40f:	dd 04 c5 c0 ea 00 00 	fldl   0xeac0(,%eax,8)
    a416:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    a418:	d9 7d ee             	fnstcw -0x12(%ebp)
    a41b:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
    a41f:	b4 0c                	mov    $0xc,%ah
    a421:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    a425:	d9 6d ec             	fldcw  -0x14(%ebp)
    a428:	db 5d fc             	fistpl -0x4(%ebp)
    a42b:	d9 6d ee             	fldcw  -0x12(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    a42e:	8b 45 08             	mov    0x8(%ebp),%eax
    a431:	8b 40 14             	mov    0x14(%eax),%eax
    a434:	85 c0                	test   %eax,%eax
    a436:	74 04                	je     a43c <main_data_slots+0x59>
    a438:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    a43c:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    a440:	8b 45 08             	mov    0x8(%ebp),%eax
    a443:	8b 40 08             	mov    0x8(%eax),%eax
    a446:	85 c0                	test   %eax,%eax
    a448:	74 04                	je     a44e <main_data_slots+0x6b>
		nSlots -= 2;
    a44a:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    a44e:	8b 45 10             	mov    0x10(%ebp),%eax
    a451:	83 f8 01             	cmp    $0x1,%eax
    a454:	75 06                	jne    a45c <main_data_slots+0x79>
		nSlots -= 17;
    a456:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    a45a:	eb 04                	jmp    a460 <main_data_slots+0x7d>
	else
		nSlots -=32;
    a45c:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    a460:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    a463:	c9                   	leave  
    a464:	c3                   	ret    
