
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
       c:	e8 d3 43 00 00       	call   43e4 <malloc>
      11:	83 c4 10             	add    $0x10,%esp
      14:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
      17:	83 ec 0c             	sub    $0xc,%esp
      1a:	6a 20                	push   $0x20
      1c:	e8 c3 43 00 00       	call   43e4 <malloc>
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
      39:	e8 c8 3c 00 00       	call   3d06 <strcpy>
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
      61:	8b 15 0c f4 00 00    	mov    0xf40c,%edx
      67:	8b 5d f4             	mov    -0xc(%ebp),%ebx
      6a:	8d 45 d8             	lea    -0x28(%ebp),%eax
      6d:	83 ec 0c             	sub    $0xc,%esp
      70:	52                   	push   %edx
      71:	ff 35 88 2a 01 00    	pushl  0x12a88
      77:	ff 35 84 2a 01 00    	pushl  0x12a84
      7d:	ff 35 80 2a 01 00    	pushl  0x12a80
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
      a4:	8b 15 08 f4 00 00    	mov    0xf408,%edx
      aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
      ad:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
      b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
      b3:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
      ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
      bd:	a3 08 f4 00 00       	mov    %eax,0xf408
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
      cd:	a1 08 f4 00 00       	mov    0xf408,%eax
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
      f0:	e8 ae 41 00 00       	call   42a3 <free>
      f5:	83 c4 10             	add    $0x10,%esp
		free(temp);
      f8:	83 ec 0c             	sub    $0xc,%esp
      fb:	ff 75 f0             	pushl  -0x10(%ebp)
      fe:	e8 a0 41 00 00       	call   42a3 <free>
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
     10c:	c7 05 08 f4 00 00 00 	movl   $0x0,0xf408
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
     124:	e8 4c 3c 00 00       	call   3d75 <strlen>
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
     1bd:	c7 05 0c f4 00 00 00 	movl   $0x0,0xf40c
     1c4:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     1c7:	83 ec 08             	sub    $0x8,%esp
     1ca:	6a 00                	push   $0x0
     1cc:	ff 75 08             	pushl  0x8(%ebp)
     1cf:	e8 a2 3d 00 00       	call   3f76 <open>
     1d4:	83 c4 10             	add    $0x10,%esp
     1d7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     1da:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     1de:	79 1a                	jns    1fa <list+0x49>
		printf(2, "ls: cannot open %s\n", path);
     1e0:	83 ec 04             	sub    $0x4,%esp
     1e3:	ff 75 08             	pushl  0x8(%ebp)
     1e6:	68 00 a8 00 00       	push   $0xa800
     1eb:	6a 02                	push   $0x2
     1ed:	e8 21 3f 00 00       	call   4113 <printf>
     1f2:	83 c4 10             	add    $0x10,%esp
		return;
     1f5:	e9 52 02 00 00       	jmp    44c <list+0x29b>
	}

	if (fstat(fd, &st) < 0) {
     1fa:	83 ec 08             	sub    $0x8,%esp
     1fd:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     203:	50                   	push   %eax
     204:	ff 75 e4             	pushl  -0x1c(%ebp)
     207:	e8 82 3d 00 00       	call   3f8e <fstat>
     20c:	83 c4 10             	add    $0x10,%esp
     20f:	85 c0                	test   %eax,%eax
     211:	79 28                	jns    23b <list+0x8a>
		printf(2, "ls: cannot stat %s\n", path);
     213:	83 ec 04             	sub    $0x4,%esp
     216:	ff 75 08             	pushl  0x8(%ebp)
     219:	68 14 a8 00 00       	push   $0xa814
     21e:	6a 02                	push   $0x2
     220:	e8 ee 3e 00 00       	call   4113 <printf>
     225:	83 c4 10             	add    $0x10,%esp
		close(fd);
     228:	83 ec 0c             	sub    $0xc,%esp
     22b:	ff 75 e4             	pushl  -0x1c(%ebp)
     22e:	e8 2b 3d 00 00       	call   3f5e <close>
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
     27c:	68 28 a8 00 00       	push   $0xa828
     281:	6a 01                	push   $0x1
     283:	e8 8b 3e 00 00       	call   4113 <printf>
     288:	83 c4 20             	add    $0x20,%esp
		break;
     28b:	e9 ae 01 00 00       	jmp    43e <list+0x28d>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     290:	83 ec 0c             	sub    $0xc,%esp
     293:	ff 75 08             	pushl  0x8(%ebp)
     296:	e8 da 3a 00 00       	call   3d75 <strlen>
     29b:	83 c4 10             	add    $0x10,%esp
     29e:	83 c0 10             	add    $0x10,%eax
     2a1:	3d 00 02 00 00       	cmp    $0x200,%eax
     2a6:	76 17                	jbe    2bf <list+0x10e>
			printf(1, "ls: path too long\n");
     2a8:	83 ec 08             	sub    $0x8,%esp
     2ab:	68 35 a8 00 00       	push   $0xa835
     2b0:	6a 01                	push   $0x1
     2b2:	e8 5c 3e 00 00       	call   4113 <printf>
     2b7:	83 c4 10             	add    $0x10,%esp
			break;
     2ba:	e9 7f 01 00 00       	jmp    43e <list+0x28d>
		}
		strcpy(buf, path);
     2bf:	83 ec 08             	sub    $0x8,%esp
     2c2:	ff 75 08             	pushl  0x8(%ebp)
     2c5:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2cb:	50                   	push   %eax
     2cc:	e8 35 3a 00 00       	call   3d06 <strcpy>
     2d1:	83 c4 10             	add    $0x10,%esp
		p = buf + strlen(buf);
     2d4:	83 ec 0c             	sub    $0xc,%esp
     2d7:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2dd:	50                   	push   %eax
     2de:	e8 92 3a 00 00       	call   3d75 <strlen>
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
     327:	e8 c5 3b 00 00       	call   3ef1 <memmove>
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
     349:	e8 09 3b 00 00       	call   3e57 <stat>
     34e:	83 c4 10             	add    $0x10,%esp
     351:	85 c0                	test   %eax,%eax
     353:	79 1e                	jns    373 <list+0x1c2>
				printf(1, "ls: cannot stat %s\n", buf);
     355:	83 ec 04             	sub    $0x4,%esp
     358:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     35e:	50                   	push   %eax
     35f:	68 14 a8 00 00       	push   $0xa814
     364:	6a 01                	push   $0x1
     366:	e8 a8 3d 00 00       	call   4113 <printf>
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
     3a0:	8b 15 0c f4 00 00    	mov    0xf40c,%edx
     3a6:	8d 45 d0             	lea    -0x30(%ebp),%eax
     3a9:	83 ec 0c             	sub    $0xc,%esp
     3ac:	52                   	push   %edx
     3ad:	ff 35 88 2a 01 00    	pushl  0x12a88
     3b3:	ff 35 84 2a 01 00    	pushl  0x12a84
     3b9:	ff 35 80 2a 01 00    	pushl  0x12a80
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
     410:	a1 0c f4 00 00       	mov    0xf40c,%eax
     415:	83 c0 01             	add    $0x1,%eax
     418:	a3 0c f4 00 00       	mov    %eax,0xf40c
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
     42c:	e8 1d 3b 00 00       	call   3f4e <read>
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
     444:	e8 15 3b 00 00       	call   3f5e <close>
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
     493:	e8 a3 21 00 00       	call   263b <fill_rect>
     498:	83 c4 20             	add    $0x20,%esp
	}
	if (style == ICON_STYLE) {
     49b:	a1 04 ea 00 00       	mov    0xea04,%eax
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
     4c6:	ff 35 70 ea 00 00    	pushl  0xea70
     4cc:	ff 35 6c ea 00 00    	pushl  0xea6c
     4d2:	ff 35 68 ea 00 00    	pushl  0xea68
     4d8:	ff 75 10             	pushl  0x10(%ebp)
     4db:	ff 75 0c             	pushl  0xc(%ebp)
     4de:	ff 75 08             	pushl  0x8(%ebp)
     4e1:	e8 5f 27 00 00       	call   2c45 <draw_picture>
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
     4f9:	ff 35 d8 ea 00 00    	pushl  0xead8
     4ff:	ff 35 d4 ea 00 00    	pushl  0xead4
     505:	ff 35 d0 ea 00 00    	pushl  0xead0
     50b:	ff 75 10             	pushl  0x10(%ebp)
     50e:	ff 75 0c             	pushl  0xc(%ebp)
     511:	ff 75 08             	pushl  0x8(%ebp)
     514:	e8 2c 27 00 00       	call   2c45 <draw_picture>
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
     523:	e8 4d 38 00 00       	call   3d75 <strlen>
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
     56e:	e8 23 26 00 00       	call   2b96 <puts_str>
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
     59c:	ff 35 a4 ea 00 00    	pushl  0xeaa4
     5a2:	ff 35 a0 ea 00 00    	pushl  0xeaa0
     5a8:	ff 35 9c ea 00 00    	pushl  0xea9c
     5ae:	ff 75 10             	pushl  0x10(%ebp)
     5b1:	ff 75 0c             	pushl  0xc(%ebp)
     5b4:	ff 75 08             	pushl  0x8(%ebp)
     5b7:	e8 89 26 00 00       	call   2c45 <draw_picture>
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
     5f6:	e8 9b 25 00 00       	call   2b96 <puts_str>
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
     60e:	ff 35 0c eb 00 00    	pushl  0xeb0c
     614:	ff 35 08 eb 00 00    	pushl  0xeb08
     61a:	ff 35 04 eb 00 00    	pushl  0xeb04
     620:	ff 75 10             	pushl  0x10(%ebp)
     623:	ff 75 0c             	pushl  0xc(%ebp)
     626:	ff 75 08             	pushl  0x8(%ebp)
     629:	e8 17 26 00 00       	call   2c45 <draw_picture>
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
     654:	e8 3d 25 00 00       	call   2b96 <puts_str>
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
     66d:	e8 72 3d 00 00       	call   43e4 <malloc>
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
		8 * BUTTON_WIDTH + 200, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "paste.bmp",
		9 * BUTTON_WIDTH + 200, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
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
     7e0:	e8 1c 25 00 00       	call   2d01 <draw_line>
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
     80a:	e8 f2 24 00 00       	call   2d01 <draw_line>
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
     834:	e8 c8 24 00 00       	call   2d01 <draw_line>
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
     854:	e8 a8 24 00 00       	call   2d01 <draw_line>
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
     877:	e8 bf 1d 00 00       	call   263b <fill_rect>
     87c:	83 c4 20             	add    $0x20,%esp
			TOOLSBAR_COLOR);
	puts_str(context, "Finder", 0, WINDOW_WIDTH / 2, 3);
     87f:	83 ec 04             	sub    $0x4,%esp
     882:	6a 03                	push   $0x3
     884:	68 2c 01 00 00       	push   $0x12c
     889:	6a 00                	push   $0x0
     88b:	68 48 a8 00 00       	push   $0xa848
     890:	ff 75 10             	pushl  0x10(%ebp)
     893:	ff 75 0c             	pushl  0xc(%ebp)
     896:	ff 75 08             	pushl  0x8(%ebp)
     899:	e8 f8 22 00 00       	call   2b96 <puts_str>
     89e:	83 c4 20             	add    $0x20,%esp
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     8a1:	83 ec 0c             	sub    $0xc,%esp
     8a4:	6a 0d                	push   $0xd
     8a6:	68 40 eb 00 00       	push   $0xeb40
     8ab:	ff 75 10             	pushl  0x10(%ebp)
     8ae:	ff 75 0c             	pushl  0xc(%ebp)
     8b1:	ff 75 08             	pushl  0x8(%ebp)
     8b4:	e8 0d 27 00 00       	call   2fc6 <draw_iconlist>
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
     8cb:	a1 04 ea 00 00       	mov    0xea04,%eax
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
     8ff:	e8 37 1d 00 00       	call   263b <fill_rect>
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
     929:	e8 d3 23 00 00       	call   2d01 <draw_line>
     92e:	83 c4 20             	add    $0x20,%esp
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);

	//printf(0, "listing complete!\n");
	//printItemList();
	p = fileItemList;
     931:	a1 08 f4 00 00       	mov    0xf408,%eax
     936:	89 45 f4             	mov    %eax,-0xc(%ebp)
	itemCounter = 0;
     939:	c7 05 0c f4 00 00 00 	movl   $0x0,0xf40c
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
     996:	a1 04 ea 00 00       	mov    0xea04,%eax
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
     9ba:	e8 7c 1c 00 00       	call   263b <fill_rect>
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
     9db:	e8 5b 1c 00 00       	call   263b <fill_rect>
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
     a03:	e8 33 1c 00 00       	call   263b <fill_rect>
     a08:	83 c4 20             	add    $0x20,%esp
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     a0b:	83 ec 04             	sub    $0x4,%esp
     a0e:	6a 50                	push   $0x50
     a10:	6a 2b                	push   $0x2b
     a12:	6a 00                	push   $0x0
     a14:	68 4f a8 00 00       	push   $0xa84f
     a19:	ff 75 10             	pushl  0x10(%ebp)
     a1c:	ff 75 0c             	pushl  0xc(%ebp)
     a1f:	ff 75 08             	pushl  0x8(%ebp)
     a22:	e8 6f 21 00 00       	call   2b96 <puts_str>
     a27:	83 c4 20             	add    $0x20,%esp
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     a2a:	83 ec 04             	sub    $0x4,%esp
     a2d:	6a 50                	push   $0x50
     a2f:	68 cb 00 00 00       	push   $0xcb
     a34:	6a 00                	push   $0x0
     a36:	68 54 a8 00 00       	push   $0xa854
     a3b:	ff 75 10             	pushl  0x10(%ebp)
     a3e:	ff 75 0c             	pushl  0xc(%ebp)
     a41:	ff 75 08             	pushl  0x8(%ebp)
     a44:	e8 4d 21 00 00       	call   2b96 <puts_str>
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
     a61:	e8 7e 39 00 00       	call   43e4 <malloc>
     a66:	83 c4 10             	add    $0x10,%esp
     a69:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
     a6c:	83 ec 0c             	sub    $0xc,%esp
     a6f:	6a 04                	push   $0x4
     a71:	e8 6e 39 00 00       	call   43e4 <malloc>
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
     b26:	e8 78 37 00 00       	call   42a3 <free>
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
     b3c:	a1 08 f4 00 00       	mov    0xf408,%eax
     b41:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     b44:	eb 22                	jmp    b68 <printItemList+0x32>
		printf(0, "%s\n", p->name);
     b46:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b49:	8b 40 14             	mov    0x14(%eax),%eax
     b4c:	83 ec 04             	sub    $0x4,%esp
     b4f:	50                   	push   %eax
     b50:	68 59 a8 00 00       	push   $0xa859
     b55:	6a 00                	push   $0x0
     b57:	e8 b7 35 00 00       	call   4113 <printf>
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
     b76:	a1 04 ea 00 00       	mov    0xea04,%eax
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
     bca:	8b 15 00 f4 00 00    	mov    0xf400,%edx
     bd0:	8b 45 e8             	mov    -0x18(%ebp),%eax
     bd3:	01 c2                	add    %eax,%edx
     bd5:	8b 45 08             	mov    0x8(%ebp),%eax
     bd8:	83 ec 0c             	sub    $0xc,%esp
     bdb:	6a 5f                	push   $0x5f
     bdd:	6a 64                	push   $0x64
     bdf:	52                   	push   %edx
     be0:	ff 75 e4             	pushl  -0x1c(%ebp)
     be3:	50                   	push   %eax
     be4:	e8 9d 2b 00 00       	call   3786 <initRect>
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
     bfe:	a1 00 f4 00 00       	mov    0xf400,%eax
     c03:	01 c2                	add    %eax,%edx
     c05:	8b 45 08             	mov    0x8(%ebp),%eax
     c08:	83 ec 0c             	sub    $0xc,%esp
     c0b:	6a 1e                	push   $0x1e
     c0d:	51                   	push   %ecx
     c0e:	52                   	push   %edx
     c0f:	6a 00                	push   $0x0
     c11:	50                   	push   %eax
     c12:	e8 6f 2b 00 00       	call   3786 <initRect>
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
     c27:	a1 04 ea 00 00       	mov    0xea04,%eax
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
     c5d:	68 57 1e 00 00       	push   $0x1e57
     c62:	6a 02                	push   $0x2
     c64:	ff 75 30             	pushl  0x30(%ebp)
     c67:	ff 75 2c             	pushl  0x2c(%ebp)
     c6a:	ff 75 28             	pushl  0x28(%ebp)
     c6d:	ff 75 24             	pushl  0x24(%ebp)
     c70:	ff 75 08             	pushl  0x8(%ebp)
     c73:	e8 f0 2b 00 00       	call   3868 <createClickable>
     c78:	83 c4 20             	add    $0x20,%esp
		break;
     c7b:	eb 56                	jmp    cd3 <addItemEvent+0xb2>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     c7d:	83 ec 04             	sub    $0x4,%esp
     c80:	68 57 1e 00 00       	push   $0x1e57
     c85:	6a 02                	push   $0x2
     c87:	ff 75 30             	pushl  0x30(%ebp)
     c8a:	ff 75 2c             	pushl  0x2c(%ebp)
     c8d:	ff 75 28             	pushl  0x28(%ebp)
     c90:	ff 75 24             	pushl  0x24(%ebp)
     c93:	ff 75 08             	pushl  0x8(%ebp)
     c96:	e8 cd 2b 00 00       	call   3868 <createClickable>
     c9b:	83 c4 20             	add    $0x20,%esp
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_enterDir);
     c9e:	83 ec 04             	sub    $0x4,%esp
     ca1:	68 96 12 00 00       	push   $0x1296
     ca6:	6a 04                	push   $0x4
     ca8:	ff 75 30             	pushl  0x30(%ebp)
     cab:	ff 75 2c             	pushl  0x2c(%ebp)
     cae:	ff 75 28             	pushl  0x28(%ebp)
     cb1:	ff 75 24             	pushl  0x24(%ebp)
     cb4:	ff 75 08             	pushl  0x8(%ebp)
     cb7:	e8 ac 2b 00 00       	call   3868 <createClickable>
     cbc:	83 c4 20             	add    $0x20,%esp
		break;
     cbf:	eb 12                	jmp    cd3 <addItemEvent+0xb2>
	default:
		printf(0, "unknown file type!");
     cc1:	83 ec 08             	sub    $0x8,%esp
     cc4:	68 5d a8 00 00       	push   $0xa85d
     cc9:	6a 00                	push   $0x0
     ccb:	e8 43 34 00 00       	call   4113 <printf>
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
     cdb:	a1 08 f4 00 00       	mov    0xf408,%eax
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
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile };

void addWndEvent(ClickableManager *cm) {
     d30:	55                   	push   %ebp
     d31:	89 e5                	mov    %esp,%ebp
     d33:	57                   	push   %edi
     d34:	56                   	push   %esi
     d35:	53                   	push   %ebx
     d36:	83 ec 2c             	sub    $0x2c,%esp
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
     d39:	c7 45 e0 0d 00 00 00 	movl   $0xd,-0x20(%ebp)
	for (i = 0; i < n; i++) {
     d40:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     d47:	e9 81 00 00 00       	jmp    dcd <addWndEvent+0x9d>
		createClickable(cm,
     d4c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d4f:	8b 1c 85 00 ee 00 00 	mov    0xee00(,%eax,4),%ebx
     d56:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d59:	6b c0 34             	imul   $0x34,%eax,%eax
     d5c:	83 c0 20             	add    $0x20,%eax
     d5f:	05 40 eb 00 00       	add    $0xeb40,%eax
     d64:	8b 78 10             	mov    0x10(%eax),%edi
     d67:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d6a:	6b c0 34             	imul   $0x34,%eax,%eax
     d6d:	83 c0 20             	add    $0x20,%eax
     d70:	05 40 eb 00 00       	add    $0xeb40,%eax
     d75:	8b 70 0c             	mov    0xc(%eax),%esi
     d78:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d7b:	6b c0 34             	imul   $0x34,%eax,%eax
     d7e:	83 c0 20             	add    $0x20,%eax
     d81:	05 40 eb 00 00       	add    $0xeb40,%eax
     d86:	8b 48 04             	mov    0x4(%eax),%ecx
     d89:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d8c:	6b c0 34             	imul   $0x34,%eax,%eax
     d8f:	83 c0 20             	add    $0x20,%eax
     d92:	05 40 eb 00 00       	add    $0xeb40,%eax
     d97:	8b 10                	mov    (%eax),%edx
     d99:	8d 45 d0             	lea    -0x30(%ebp),%eax
     d9c:	83 ec 0c             	sub    $0xc,%esp
     d9f:	57                   	push   %edi
     da0:	56                   	push   %esi
     da1:	51                   	push   %ecx
     da2:	52                   	push   %edx
     da3:	50                   	push   %eax
     da4:	e8 dd 29 00 00       	call   3786 <initRect>
     da9:	83 c4 1c             	add    $0x1c,%esp
     dac:	83 ec 04             	sub    $0x4,%esp
     daf:	53                   	push   %ebx
     db0:	6a 02                	push   $0x2
     db2:	ff 75 dc             	pushl  -0x24(%ebp)
     db5:	ff 75 d8             	pushl  -0x28(%ebp)
     db8:	ff 75 d4             	pushl  -0x2c(%ebp)
     dbb:	ff 75 d0             	pushl  -0x30(%ebp)
     dbe:	ff 75 08             	pushl  0x8(%ebp)
     dc1:	e8 a2 2a 00 00       	call   3868 <createClickable>
     dc6:	83 c4 20             	add    $0x20,%esp
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile };

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
     de7:	a1 08 f4 00 00       	mov    0xf408,%eax
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
     e09:	e8 c9 29 00 00       	call   37d7 <isIn>
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
     e36:	a1 08 f4 00 00       	mov    0xf408,%eax
     e3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// while (q != 0)
	// {
	// 	p = q;
	// 	q = q->next;
	// }
	if (style == ICON_STYLE){
     e3e:	a1 04 ea 00 00       	mov    0xea04,%eax
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
     e62:	a1 00 f4 00 00       	mov    0xf400,%eax
     e67:	83 e8 1e             	sub    $0x1e,%eax
     e6a:	a3 00 f4 00 00       	mov    %eax,0xf400
     e6f:	eb 5d                	jmp    ece <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - ICON_ITEM_HEIGHT));
     e71:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e74:	8b 40 1c             	mov    0x1c(%eax),%eax
     e77:	ba 63 01 00 00       	mov    $0x163,%edx
     e7c:	29 c2                	sub    %eax,%edx
     e7e:	a1 00 f4 00 00       	mov    0xf400,%eax
     e83:	01 d0                	add    %edx,%eax
     e85:	a3 00 f4 00 00       	mov    %eax,0xf400
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
     ea6:	a1 00 f4 00 00       	mov    0xf400,%eax
     eab:	83 e8 1e             	sub    $0x1e,%eax
     eae:	a3 00 f4 00 00       	mov    %eax,0xf400
     eb3:	eb 19                	jmp    ece <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - LIST_ITEM_HEIGHT));
     eb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     eb8:	8b 40 1c             	mov    0x1c(%eax),%eax
     ebb:	ba a4 01 00 00       	mov    $0x1a4,%edx
     ec0:	29 c2                	sub    %eax,%edx
     ec2:	a1 00 f4 00 00       	mov    0xf400,%eax
     ec7:	01 d0                	add    %edx,%eax
     ec9:	a3 00 f4 00 00       	mov    %eax,0xf400
			}
		}
	}
	//printf(0, "tryingToScrollDown, current Offset %d\n", scrollOffset);
	printf(0, "scrollDown, current Offset %d\n", scrollOffset);
     ece:	a1 00 f4 00 00       	mov    0xf400,%eax
     ed3:	83 ec 04             	sub    $0x4,%esp
     ed6:	50                   	push   %eax
     ed7:	68 70 a8 00 00       	push   $0xa870
     edc:	6a 00                	push   $0x0
     ede:	e8 30 32 00 00       	call   4113 <printf>
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
     efb:	68 8f a8 00 00       	push   $0xa88f
     f00:	e8 ac f2 ff ff       	call   1b1 <list>
     f05:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
     f08:	83 ec 04             	sub    $0x4,%esp
     f0b:	ff 35 88 2a 01 00    	pushl  0x12a88
     f11:	ff 35 84 2a 01 00    	pushl  0x12a84
     f17:	ff 35 80 2a 01 00    	pushl  0x12a80
     f1d:	e8 9c f9 ff ff       	call   8be <drawFinderContent>
     f22:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
     f25:	83 ec 04             	sub    $0x4,%esp
     f28:	ff 35 88 2a 01 00    	pushl  0x12a88
     f2e:	ff 35 84 2a 01 00    	pushl  0x12a84
     f34:	ff 35 80 2a 01 00    	pushl  0x12a80
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
     f57:	e8 2a 28 00 00       	call   3786 <initRect>
     f5c:	83 c4 1c             	add    $0x1c,%esp
     f5f:	83 ec 0c             	sub    $0xc,%esp
     f62:	ff 75 f4             	pushl  -0xc(%ebp)
     f65:	ff 75 f0             	pushl  -0x10(%ebp)
     f68:	ff 75 ec             	pushl  -0x14(%ebp)
     f6b:	ff 75 e8             	pushl  -0x18(%ebp)
     f6e:	68 c0 2b 01 00       	push   $0x12bc0
     f73:	e8 d3 29 00 00       	call   394b <deleteClickable>
     f78:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
     f7b:	83 ec 0c             	sub    $0xc,%esp
     f7e:	68 c0 2b 01 00       	push   $0x12bc0
     f83:	e8 a8 fd ff ff       	call   d30 <addWndEvent>
     f88:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
     f8b:	83 ec 0c             	sub    $0xc,%esp
     f8e:	68 c0 2b 01 00       	push   $0x12bc0
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
     fa3:	a1 08 f4 00 00       	mov    0xf408,%eax
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
     fc2:	a1 04 ea 00 00       	mov    0xea04,%eax
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
     fe2:	a1 00 f4 00 00       	mov    0xf400,%eax
     fe7:	83 c0 1e             	add    $0x1e,%eax
     fea:	a3 00 f4 00 00       	mov    %eax,0xf400
     fef:	eb 59                	jmp    104a <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT));
     ff1:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ff4:	8b 40 1c             	mov    0x1c(%eax),%eax
     ff7:	ba 46 00 00 00       	mov    $0x46,%edx
     ffc:	29 c2                	sub    %eax,%edx
     ffe:	a1 00 f4 00 00       	mov    0xf400,%eax
    1003:	01 d0                	add    %edx,%eax
    1005:	a3 00 f4 00 00       	mov    %eax,0xf400
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
    1022:	a1 00 f4 00 00       	mov    0xf400,%eax
    1027:	83 c0 1e             	add    $0x1e,%eax
    102a:	a3 00 f4 00 00       	mov    %eax,0xf400
    102f:	eb 19                	jmp    104a <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT));
    1031:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1034:	8b 40 1c             	mov    0x1c(%eax),%eax
    1037:	ba 62 00 00 00       	mov    $0x62,%edx
    103c:	29 c2                	sub    %eax,%edx
    103e:	a1 00 f4 00 00       	mov    0xf400,%eax
    1043:	01 d0                	add    %edx,%eax
    1045:	a3 00 f4 00 00       	mov    %eax,0xf400
			}
		}
	}
	//printf(0, "tryingToScrollUp, current Offset %d\n", scrollOffset);
	printf(0, "scrollUp, current Offset %d\n", scrollOffset);
    104a:	a1 00 f4 00 00       	mov    0xf400,%eax
    104f:	83 ec 04             	sub    $0x4,%esp
    1052:	50                   	push   %eax
    1053:	68 91 a8 00 00       	push   $0xa891
    1058:	6a 00                	push   $0x0
    105a:	e8 b4 30 00 00       	call   4113 <printf>
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
    1077:	68 8f a8 00 00       	push   $0xa88f
    107c:	e8 30 f1 ff ff       	call   1b1 <list>
    1081:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    1084:	83 ec 04             	sub    $0x4,%esp
    1087:	ff 35 88 2a 01 00    	pushl  0x12a88
    108d:	ff 35 84 2a 01 00    	pushl  0x12a84
    1093:	ff 35 80 2a 01 00    	pushl  0x12a80
    1099:	e8 20 f8 ff ff       	call   8be <drawFinderContent>
    109e:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    10a1:	83 ec 04             	sub    $0x4,%esp
    10a4:	ff 35 88 2a 01 00    	pushl  0x12a88
    10aa:	ff 35 84 2a 01 00    	pushl  0x12a84
    10b0:	ff 35 80 2a 01 00    	pushl  0x12a80
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
    10d3:	e8 ae 26 00 00       	call   3786 <initRect>
    10d8:	83 c4 1c             	add    $0x1c,%esp
    10db:	83 ec 0c             	sub    $0xc,%esp
    10de:	ff 75 f4             	pushl  -0xc(%ebp)
    10e1:	ff 75 f0             	pushl  -0x10(%ebp)
    10e4:	ff 75 ec             	pushl  -0x14(%ebp)
    10e7:	ff 75 e8             	pushl  -0x18(%ebp)
    10ea:	68 c0 2b 01 00       	push   $0x12bc0
    10ef:	e8 57 28 00 00       	call   394b <deleteClickable>
    10f4:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    10f7:	83 ec 0c             	sub    $0xc,%esp
    10fa:	68 c0 2b 01 00       	push   $0x12bc0
    10ff:	e8 2c fc ff ff       	call   d30 <addWndEvent>
    1104:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1107:	83 ec 0c             	sub    $0xc,%esp
    110a:	68 c0 2b 01 00       	push   $0x12bc0
    110f:	e8 c1 fb ff ff       	call   cd5 <addListEvent>
    1114:	83 c4 10             	add    $0x10,%esp
}
    1117:	c9                   	leave  
    1118:	c3                   	ret    

00001119 <updatePath>:

void updatePath(char *name) {
    1119:	55                   	push   %ebp
    111a:	89 e5                	mov    %esp,%ebp
    111c:	83 ec 18             	sub    $0x18,%esp
    //printf(2, "cd success\r\n");
    int n = strlen(name);
    111f:	83 ec 0c             	sub    $0xc,%esp
    1122:	ff 75 08             	pushl  0x8(%ebp)
    1125:	e8 4b 2c 00 00       	call   3d75 <strlen>
    112a:	83 c4 10             	add    $0x10,%esp
    112d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    int i;
    if (n == 2 && name[0] == '.' && name[1] == '.')
    1130:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    1134:	0f 85 90 00 00 00    	jne    11ca <updatePath+0xb1>
    113a:	8b 45 08             	mov    0x8(%ebp),%eax
    113d:	0f b6 00             	movzbl (%eax),%eax
    1140:	3c 2e                	cmp    $0x2e,%al
    1142:	0f 85 82 00 00 00    	jne    11ca <updatePath+0xb1>
    1148:	8b 45 08             	mov    0x8(%ebp),%eax
    114b:	83 c0 01             	add    $0x1,%eax
    114e:	0f b6 00             	movzbl (%eax),%eax
    1151:	3c 2e                	cmp    $0x2e,%al
    1153:	75 75                	jne    11ca <updatePath+0xb1>
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    1155:	83 ec 0c             	sub    $0xc,%esp
    1158:	68 c0 2a 01 00       	push   $0x12ac0
    115d:	e8 13 2c 00 00       	call   3d75 <strlen>
    1162:	83 c4 10             	add    $0x10,%esp
    1165:	83 f8 01             	cmp    $0x1,%eax
    1168:	75 0b                	jne    1175 <updatePath+0x5c>
    116a:	0f b6 05 c0 2a 01 00 	movzbl 0x12ac0,%eax
    1171:	3c 2f                	cmp    $0x2f,%al
    1173:	74 53                	je     11c8 <updatePath+0xaf>
        {
            int tmpn = strlen(currentPath);
    1175:	83 ec 0c             	sub    $0xc,%esp
    1178:	68 c0 2a 01 00       	push   $0x12ac0
    117d:	e8 f3 2b 00 00       	call   3d75 <strlen>
    1182:	83 c4 10             	add    $0x10,%esp
    1185:	89 45 ec             	mov    %eax,-0x14(%ebp)
            currentPath[tmpn - 1] = '\0';
    1188:	8b 45 ec             	mov    -0x14(%ebp),%eax
    118b:	83 e8 01             	sub    $0x1,%eax
    118e:	c6 80 c0 2a 01 00 00 	movb   $0x0,0x12ac0(%eax)
            for (i = tmpn - 2; i > 0; i--)
    1195:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1198:	83 e8 02             	sub    $0x2,%eax
    119b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    119e:	eb 22                	jmp    11c2 <updatePath+0xa9>
            {
                if (currentPath[i] != '/')
    11a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11a3:	05 c0 2a 01 00       	add    $0x12ac0,%eax
    11a8:	0f b6 00             	movzbl (%eax),%eax
    11ab:	3c 2f                	cmp    $0x2f,%al
    11ad:	74 0d                	je     11bc <updatePath+0xa3>
                    currentPath[i] = '\0';
    11af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11b2:	05 c0 2a 01 00       	add    $0x12ac0,%eax
    11b7:	c6 00 00             	movb   $0x0,(%eax)
    11ba:	eb 02                	jmp    11be <updatePath+0xa5>
                else
                    break;
    11bc:	eb 0a                	jmp    11c8 <updatePath+0xaf>
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
        {
            int tmpn = strlen(currentPath);
            currentPath[tmpn - 1] = '\0';
            for (i = tmpn - 2; i > 0; i--)
    11be:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    11c2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    11c6:	7f d8                	jg     11a0 <updatePath+0x87>
    //printf(2, "cd success\r\n");
    int n = strlen(name);
    int i;
    if (n == 2 && name[0] == '.' && name[1] == '.')
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    11c8:	eb 55                	jmp    121f <updatePath+0x106>
            }
        }
    }
    else
    {
        int tmpn = strlen(currentPath);
    11ca:	83 ec 0c             	sub    $0xc,%esp
    11cd:	68 c0 2a 01 00       	push   $0x12ac0
    11d2:	e8 9e 2b 00 00       	call   3d75 <strlen>
    11d7:	83 c4 10             	add    $0x10,%esp
    11da:	89 45 e8             	mov    %eax,-0x18(%ebp)
        strcpy(currentPath + tmpn, name);
    11dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    11e0:	05 c0 2a 01 00       	add    $0x12ac0,%eax
    11e5:	83 ec 08             	sub    $0x8,%esp
    11e8:	ff 75 08             	pushl  0x8(%ebp)
    11eb:	50                   	push   %eax
    11ec:	e8 15 2b 00 00       	call   3d06 <strcpy>
    11f1:	83 c4 10             	add    $0x10,%esp
        tmpn = strlen(currentPath);
    11f4:	83 ec 0c             	sub    $0xc,%esp
    11f7:	68 c0 2a 01 00       	push   $0x12ac0
    11fc:	e8 74 2b 00 00       	call   3d75 <strlen>
    1201:	83 c4 10             	add    $0x10,%esp
    1204:	89 45 e8             	mov    %eax,-0x18(%ebp)
        currentPath[tmpn] = '/';
    1207:	8b 45 e8             	mov    -0x18(%ebp),%eax
    120a:	05 c0 2a 01 00       	add    $0x12ac0,%eax
    120f:	c6 00 2f             	movb   $0x2f,(%eax)
        currentPath[tmpn + 1] = '\0';
    1212:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1215:	83 c0 01             	add    $0x1,%eax
    1218:	c6 80 c0 2a 01 00 00 	movb   $0x0,0x12ac0(%eax)
    }
}
    121f:	c9                   	leave  
    1220:	c3                   	ret    

00001221 <enterDir>:

// Handlers
void enterDir(char *name) {
    1221:	55                   	push   %ebp
    1222:	89 e5                	mov    %esp,%ebp
    1224:	83 ec 08             	sub    $0x8,%esp
	scrollOffset = 0;
    1227:	c7 05 00 f4 00 00 00 	movl   $0x0,0xf400
    122e:	00 00 00 
	printf(0, "entering : %s\n", name);
    1231:	83 ec 04             	sub    $0x4,%esp
    1234:	ff 75 08             	pushl  0x8(%ebp)
    1237:	68 ae a8 00 00       	push   $0xa8ae
    123c:	6a 00                	push   $0x0
    123e:	e8 d0 2e 00 00       	call   4113 <printf>
    1243:	83 c4 10             	add    $0x10,%esp
	if (chdir(name) < 0)
    1246:	83 ec 0c             	sub    $0xc,%esp
    1249:	ff 75 08             	pushl  0x8(%ebp)
    124c:	e8 55 2d 00 00       	call   3fa6 <chdir>
    1251:	83 c4 10             	add    $0x10,%esp
    1254:	85 c0                	test   %eax,%eax
    1256:	79 17                	jns    126f <enterDir+0x4e>
		printf(2, "cannot cd %s\n", name);
    1258:	83 ec 04             	sub    $0x4,%esp
    125b:	ff 75 08             	pushl  0x8(%ebp)
    125e:	68 bd a8 00 00       	push   $0xa8bd
    1263:	6a 02                	push   $0x2
    1265:	e8 a9 2e 00 00       	call   4113 <printf>
    126a:	83 c4 10             	add    $0x10,%esp
    126d:	eb 0e                	jmp    127d <enterDir+0x5c>
	else
		updatePath(name);
    126f:	83 ec 0c             	sub    $0xc,%esp
    1272:	ff 75 08             	pushl  0x8(%ebp)
    1275:	e8 9f fe ff ff       	call   1119 <updatePath>
    127a:	83 c4 10             	add    $0x10,%esp
	printf(0, "currentPath: %s\n", currentPath);
    127d:	83 ec 04             	sub    $0x4,%esp
    1280:	68 c0 2a 01 00       	push   $0x12ac0
    1285:	68 cb a8 00 00       	push   $0xa8cb
    128a:	6a 00                	push   $0x0
    128c:	e8 82 2e 00 00       	call   4113 <printf>
    1291:	83 c4 10             	add    $0x10,%esp
}
    1294:	c9                   	leave  
    1295:	c3                   	ret    

00001296 <h_enterDir>:

void h_enterDir(Point p) {
    1296:	55                   	push   %ebp
    1297:	89 e5                	mov    %esp,%ebp
    1299:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = getFileItem(p);
    129c:	83 ec 08             	sub    $0x8,%esp
    129f:	ff 75 0c             	pushl  0xc(%ebp)
    12a2:	ff 75 08             	pushl  0x8(%ebp)
    12a5:	e8 37 fb ff ff       	call   de1 <getFileItem>
    12aa:	83 c4 10             	add    $0x10,%esp
    12ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
	enterDir(temp->name);
    12b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12b3:	8b 40 14             	mov    0x14(%eax),%eax
    12b6:	83 ec 0c             	sub    $0xc,%esp
    12b9:	50                   	push   %eax
    12ba:	e8 62 ff ff ff       	call   1221 <enterDir>
    12bf:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    12c2:	e8 00 ee ff ff       	call   c7 <freeFileItemList>
	list(".");
    12c7:	83 ec 0c             	sub    $0xc,%esp
    12ca:	68 8f a8 00 00       	push   $0xa88f
    12cf:	e8 dd ee ff ff       	call   1b1 <list>
    12d4:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    12d7:	83 ec 04             	sub    $0x4,%esp
    12da:	ff 35 88 2a 01 00    	pushl  0x12a88
    12e0:	ff 35 84 2a 01 00    	pushl  0x12a84
    12e6:	ff 35 80 2a 01 00    	pushl  0x12a80
    12ec:	e8 cd f5 ff ff       	call   8be <drawFinderContent>
    12f1:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    12f4:	83 ec 04             	sub    $0x4,%esp
    12f7:	ff 35 88 2a 01 00    	pushl  0x12a88
    12fd:	ff 35 84 2a 01 00    	pushl  0x12a84
    1303:	ff 35 80 2a 01 00    	pushl  0x12a80
    1309:	e8 b4 f4 ff ff       	call   7c2 <drawFinderWnd>
    130e:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1311:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1314:	83 ec 0c             	sub    $0xc,%esp
    1317:	68 58 02 00 00       	push   $0x258
    131c:	68 20 03 00 00       	push   $0x320
    1321:	6a 00                	push   $0x0
    1323:	6a 00                	push   $0x0
    1325:	50                   	push   %eax
    1326:	e8 5b 24 00 00       	call   3786 <initRect>
    132b:	83 c4 1c             	add    $0x1c,%esp
    132e:	83 ec 0c             	sub    $0xc,%esp
    1331:	ff 75 f0             	pushl  -0x10(%ebp)
    1334:	ff 75 ec             	pushl  -0x14(%ebp)
    1337:	ff 75 e8             	pushl  -0x18(%ebp)
    133a:	ff 75 e4             	pushl  -0x1c(%ebp)
    133d:	68 c0 2b 01 00       	push   $0x12bc0
    1342:	e8 04 26 00 00       	call   394b <deleteClickable>
    1347:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    134a:	83 ec 0c             	sub    $0xc,%esp
    134d:	68 c0 2b 01 00       	push   $0x12bc0
    1352:	e8 d9 f9 ff ff       	call   d30 <addWndEvent>
    1357:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    135a:	83 ec 0c             	sub    $0xc,%esp
    135d:	68 c0 2b 01 00       	push   $0x12bc0
    1362:	e8 6e f9 ff ff       	call   cd5 <addListEvent>
    1367:	83 c4 10             	add    $0x10,%esp
}
    136a:	c9                   	leave  
    136b:	c3                   	ret    

0000136c <newFile>:

void newFile(char *name) {
    136c:	55                   	push   %ebp
    136d:	89 e5                	mov    %esp,%ebp
    136f:	83 ec 18             	sub    $0x18,%esp
	int fd;
	int n = strlen(name);
    1372:	83 ec 0c             	sub    $0xc,%esp
    1375:	ff 75 08             	pushl  0x8(%ebp)
    1378:	e8 f8 29 00 00       	call   3d75 <strlen>
    137d:	83 c4 10             	add    $0x10,%esp
    1380:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 8;
    1383:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
	int counter;
	while ((fd = open(name, 0)) > 0)
    138a:	eb 70                	jmp    13fc <newFile+0x90>
	{
		n = strlen(name);
    138c:	83 ec 0c             	sub    $0xc,%esp
    138f:	ff 75 08             	pushl  0x8(%ebp)
    1392:	e8 de 29 00 00       	call   3d75 <strlen>
    1397:	83 c4 10             	add    $0x10,%esp
    139a:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    139d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    13a0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    13a3:	75 09                	jne    13ae <newFile+0x42>
		{
			counter = 1;
    13a5:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    13ac:	eb 1b                	jmp    13c9 <newFile+0x5d>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    13ae:	8b 55 ec             	mov    -0x14(%ebp),%edx
    13b1:	8b 45 08             	mov    0x8(%ebp),%eax
    13b4:	01 d0                	add    %edx,%eax
    13b6:	83 ec 0c             	sub    $0xc,%esp
    13b9:	50                   	push   %eax
    13ba:	e8 e5 2a 00 00       	call   3ea4 <atoi>
    13bf:	83 c4 10             	add    $0x10,%esp
    13c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    13c5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    13c9:	83 ec 0c             	sub    $0xc,%esp
    13cc:	ff 75 f4             	pushl  -0xc(%ebp)
    13cf:	e8 7a f6 ff ff       	call   a4e <int2str>
    13d4:	83 c4 10             	add    $0x10,%esp
    13d7:	89 c1                	mov    %eax,%ecx
    13d9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    13dc:	8b 45 08             	mov    0x8(%ebp),%eax
    13df:	01 d0                	add    %edx,%eax
    13e1:	83 ec 08             	sub    $0x8,%esp
    13e4:	51                   	push   %ecx
    13e5:	50                   	push   %eax
    13e6:	e8 1b 29 00 00       	call   3d06 <strcpy>
    13eb:	83 c4 10             	add    $0x10,%esp
		close(fd);
    13ee:	83 ec 0c             	sub    $0xc,%esp
    13f1:	ff 75 e8             	pushl  -0x18(%ebp)
    13f4:	e8 65 2b 00 00       	call   3f5e <close>
    13f9:	83 c4 10             	add    $0x10,%esp
void newFile(char *name) {
	int fd;
	int n = strlen(name);
	int baseLen = 8;
	int counter;
	while ((fd = open(name, 0)) > 0)
    13fc:	83 ec 08             	sub    $0x8,%esp
    13ff:	6a 00                	push   $0x0
    1401:	ff 75 08             	pushl  0x8(%ebp)
    1404:	e8 6d 2b 00 00       	call   3f76 <open>
    1409:	83 c4 10             	add    $0x10,%esp
    140c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    140f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1413:	0f 8f 73 ff ff ff    	jg     138c <newFile+0x20>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		close(fd);
	}
	if ((fd = open(name, O_CREATE)) < 0) {
    1419:	83 ec 08             	sub    $0x8,%esp
    141c:	68 00 02 00 00       	push   $0x200
    1421:	ff 75 08             	pushl  0x8(%ebp)
    1424:	e8 4d 2b 00 00       	call   3f76 <open>
    1429:	83 c4 10             	add    $0x10,%esp
    142c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    142f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1433:	79 1a                	jns    144f <newFile+0xe3>
		printf(0, "cat: cannot open %s\n", name);
    1435:	83 ec 04             	sub    $0x4,%esp
    1438:	ff 75 08             	pushl  0x8(%ebp)
    143b:	68 dc a8 00 00       	push   $0xa8dc
    1440:	6a 00                	push   $0x0
    1442:	e8 cc 2c 00 00       	call   4113 <printf>
    1447:	83 c4 10             	add    $0x10,%esp
		exit();
    144a:	e8 e7 2a 00 00       	call   3f36 <exit>
	}
	close(fd);
    144f:	83 ec 0c             	sub    $0xc,%esp
    1452:	ff 75 e8             	pushl  -0x18(%ebp)
    1455:	e8 04 2b 00 00       	call   3f5e <close>
    145a:	83 c4 10             	add    $0x10,%esp
}
    145d:	c9                   	leave  
    145e:	c3                   	ret    

0000145f <h_newFile>:

void h_newFile(Point p) {
    145f:	55                   	push   %ebp
    1460:	89 e5                	mov    %esp,%ebp
    1462:	83 ec 38             	sub    $0x38,%esp
	char nf[32] = "file.txt";
    1465:	c7 45 c8 66 69 6c 65 	movl   $0x656c6966,-0x38(%ebp)
    146c:	c7 45 cc 2e 74 78 74 	movl   $0x7478742e,-0x34(%ebp)
    1473:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    147a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    1481:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1488:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    148f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1496:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFile(nf);
    149d:	83 ec 0c             	sub    $0xc,%esp
    14a0:	8d 45 c8             	lea    -0x38(%ebp),%eax
    14a3:	50                   	push   %eax
    14a4:	e8 c3 fe ff ff       	call   136c <newFile>
    14a9:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    14ac:	e8 16 ec ff ff       	call   c7 <freeFileItemList>
	list(".");
    14b1:	83 ec 0c             	sub    $0xc,%esp
    14b4:	68 8f a8 00 00       	push   $0xa88f
    14b9:	e8 f3 ec ff ff       	call   1b1 <list>
    14be:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    14c1:	83 ec 04             	sub    $0x4,%esp
    14c4:	ff 35 88 2a 01 00    	pushl  0x12a88
    14ca:	ff 35 84 2a 01 00    	pushl  0x12a84
    14d0:	ff 35 80 2a 01 00    	pushl  0x12a80
    14d6:	e8 e3 f3 ff ff       	call   8be <drawFinderContent>
    14db:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    14de:	83 ec 04             	sub    $0x4,%esp
    14e1:	ff 35 88 2a 01 00    	pushl  0x12a88
    14e7:	ff 35 84 2a 01 00    	pushl  0x12a84
    14ed:	ff 35 80 2a 01 00    	pushl  0x12a80
    14f3:	e8 ca f2 ff ff       	call   7c2 <drawFinderWnd>
    14f8:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    14fb:	8d 45 e8             	lea    -0x18(%ebp),%eax
    14fe:	83 ec 0c             	sub    $0xc,%esp
    1501:	68 58 02 00 00       	push   $0x258
    1506:	68 20 03 00 00       	push   $0x320
    150b:	6a 00                	push   $0x0
    150d:	6a 00                	push   $0x0
    150f:	50                   	push   %eax
    1510:	e8 71 22 00 00       	call   3786 <initRect>
    1515:	83 c4 1c             	add    $0x1c,%esp
    1518:	83 ec 0c             	sub    $0xc,%esp
    151b:	ff 75 f4             	pushl  -0xc(%ebp)
    151e:	ff 75 f0             	pushl  -0x10(%ebp)
    1521:	ff 75 ec             	pushl  -0x14(%ebp)
    1524:	ff 75 e8             	pushl  -0x18(%ebp)
    1527:	68 c0 2b 01 00       	push   $0x12bc0
    152c:	e8 1a 24 00 00       	call   394b <deleteClickable>
    1531:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1534:	83 ec 0c             	sub    $0xc,%esp
    1537:	68 c0 2b 01 00       	push   $0x12bc0
    153c:	e8 ef f7 ff ff       	call   d30 <addWndEvent>
    1541:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1544:	83 ec 0c             	sub    $0xc,%esp
    1547:	68 c0 2b 01 00       	push   $0x12bc0
    154c:	e8 84 f7 ff ff       	call   cd5 <addListEvent>
    1551:	83 c4 10             	add    $0x10,%esp
}
    1554:	c9                   	leave  
    1555:	c3                   	ret    

00001556 <newFolder>:

void newFolder(char *name) {
    1556:	55                   	push   %ebp
    1557:	89 e5                	mov    %esp,%ebp
    1559:	83 ec 18             	sub    $0x18,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
    155c:	83 ec 0c             	sub    $0xc,%esp
    155f:	ff 75 08             	pushl  0x8(%ebp)
    1562:	e8 0e 28 00 00       	call   3d75 <strlen>
    1567:	83 c4 10             	add    $0x10,%esp
    156a:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 9;
    156d:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%ebp)
	int counter;
	while (mkdir(name) < 0) {
    1574:	eb 62                	jmp    15d8 <newFolder+0x82>
		n = strlen(name);
    1576:	83 ec 0c             	sub    $0xc,%esp
    1579:	ff 75 08             	pushl  0x8(%ebp)
    157c:	e8 f4 27 00 00       	call   3d75 <strlen>
    1581:	83 c4 10             	add    $0x10,%esp
    1584:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    1587:	8b 45 f0             	mov    -0x10(%ebp),%eax
    158a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    158d:	75 09                	jne    1598 <newFolder+0x42>
		{
			counter = 1;
    158f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1596:	eb 1b                	jmp    15b3 <newFolder+0x5d>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    1598:	8b 55 ec             	mov    -0x14(%ebp),%edx
    159b:	8b 45 08             	mov    0x8(%ebp),%eax
    159e:	01 d0                	add    %edx,%eax
    15a0:	83 ec 0c             	sub    $0xc,%esp
    15a3:	50                   	push   %eax
    15a4:	e8 fb 28 00 00       	call   3ea4 <atoi>
    15a9:	83 c4 10             	add    $0x10,%esp
    15ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    15af:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    15b3:	83 ec 0c             	sub    $0xc,%esp
    15b6:	ff 75 f4             	pushl  -0xc(%ebp)
    15b9:	e8 90 f4 ff ff       	call   a4e <int2str>
    15be:	83 c4 10             	add    $0x10,%esp
    15c1:	89 c1                	mov    %eax,%ecx
    15c3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    15c6:	8b 45 08             	mov    0x8(%ebp),%eax
    15c9:	01 d0                	add    %edx,%eax
    15cb:	83 ec 08             	sub    $0x8,%esp
    15ce:	51                   	push   %ecx
    15cf:	50                   	push   %eax
    15d0:	e8 31 27 00 00       	call   3d06 <strcpy>
    15d5:	83 c4 10             	add    $0x10,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    15d8:	83 ec 0c             	sub    $0xc,%esp
    15db:	ff 75 08             	pushl  0x8(%ebp)
    15de:	e8 bb 29 00 00       	call   3f9e <mkdir>
    15e3:	83 c4 10             	add    $0x10,%esp
    15e6:	85 c0                	test   %eax,%eax
    15e8:	78 8c                	js     1576 <newFolder+0x20>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		//printf(0, "mkdir: %s failed to create\n", newfolder);
	}
}
    15ea:	c9                   	leave  
    15eb:	c3                   	ret    

000015ec <h_newFolder>:

void h_newFolder(Point p) {
    15ec:	55                   	push   %ebp
    15ed:	89 e5                	mov    %esp,%ebp
    15ef:	83 ec 38             	sub    $0x38,%esp
	char nf[32] = "newFolder";
    15f2:	c7 45 c8 6e 65 77 46 	movl   $0x4677656e,-0x38(%ebp)
    15f9:	c7 45 cc 6f 6c 64 65 	movl   $0x65646c6f,-0x34(%ebp)
    1600:	c7 45 d0 72 00 00 00 	movl   $0x72,-0x30(%ebp)
    1607:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    160e:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1615:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    161c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1623:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFolder(nf);
    162a:	83 ec 0c             	sub    $0xc,%esp
    162d:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1630:	50                   	push   %eax
    1631:	e8 20 ff ff ff       	call   1556 <newFolder>
    1636:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    1639:	e8 89 ea ff ff       	call   c7 <freeFileItemList>
	printf(0, "new folder!\n");
    163e:	83 ec 08             	sub    $0x8,%esp
    1641:	68 f1 a8 00 00       	push   $0xa8f1
    1646:	6a 00                	push   $0x0
    1648:	e8 c6 2a 00 00       	call   4113 <printf>
    164d:	83 c4 10             	add    $0x10,%esp
	list(".");
    1650:	83 ec 0c             	sub    $0xc,%esp
    1653:	68 8f a8 00 00       	push   $0xa88f
    1658:	e8 54 eb ff ff       	call   1b1 <list>
    165d:	83 c4 10             	add    $0x10,%esp
	printItemList();
    1660:	e8 d1 f4 ff ff       	call   b36 <printItemList>
	drawFinderContent(context);
    1665:	83 ec 04             	sub    $0x4,%esp
    1668:	ff 35 88 2a 01 00    	pushl  0x12a88
    166e:	ff 35 84 2a 01 00    	pushl  0x12a84
    1674:	ff 35 80 2a 01 00    	pushl  0x12a80
    167a:	e8 3f f2 ff ff       	call   8be <drawFinderContent>
    167f:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1682:	83 ec 04             	sub    $0x4,%esp
    1685:	ff 35 88 2a 01 00    	pushl  0x12a88
    168b:	ff 35 84 2a 01 00    	pushl  0x12a84
    1691:	ff 35 80 2a 01 00    	pushl  0x12a80
    1697:	e8 26 f1 ff ff       	call   7c2 <drawFinderWnd>
    169c:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    169f:	8d 45 e8             	lea    -0x18(%ebp),%eax
    16a2:	83 ec 0c             	sub    $0xc,%esp
    16a5:	68 58 02 00 00       	push   $0x258
    16aa:	68 20 03 00 00       	push   $0x320
    16af:	6a 00                	push   $0x0
    16b1:	6a 00                	push   $0x0
    16b3:	50                   	push   %eax
    16b4:	e8 cd 20 00 00       	call   3786 <initRect>
    16b9:	83 c4 1c             	add    $0x1c,%esp
    16bc:	83 ec 0c             	sub    $0xc,%esp
    16bf:	ff 75 f4             	pushl  -0xc(%ebp)
    16c2:	ff 75 f0             	pushl  -0x10(%ebp)
    16c5:	ff 75 ec             	pushl  -0x14(%ebp)
    16c8:	ff 75 e8             	pushl  -0x18(%ebp)
    16cb:	68 c0 2b 01 00       	push   $0x12bc0
    16d0:	e8 76 22 00 00       	call   394b <deleteClickable>
    16d5:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    16d8:	83 ec 0c             	sub    $0xc,%esp
    16db:	68 c0 2b 01 00       	push   $0x12bc0
    16e0:	e8 4b f6 ff ff       	call   d30 <addWndEvent>
    16e5:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    16e8:	83 ec 0c             	sub    $0xc,%esp
    16eb:	68 c0 2b 01 00       	push   $0x12bc0
    16f0:	e8 e0 f5 ff ff       	call   cd5 <addListEvent>
    16f5:	83 c4 10             	add    $0x10,%esp
}
    16f8:	c9                   	leave  
    16f9:	c3                   	ret    

000016fa <deleteFile>:

void deleteFile(char *name)
{
    16fa:	55                   	push   %ebp
    16fb:	89 e5                	mov    %esp,%ebp
    16fd:	83 ec 18             	sub    $0x18,%esp
	printf(0, "currently having sex with %s\n", name);
    1700:	83 ec 04             	sub    $0x4,%esp
    1703:	ff 75 08             	pushl  0x8(%ebp)
    1706:	68 fe a8 00 00       	push   $0xa8fe
    170b:	6a 00                	push   $0x0
    170d:	e8 01 2a 00 00       	call   4113 <printf>
    1712:	83 c4 10             	add    $0x10,%esp
	if(unlink(name) < 0){
    1715:	83 ec 0c             	sub    $0xc,%esp
    1718:	ff 75 08             	pushl  0x8(%ebp)
    171b:	e8 66 28 00 00       	call   3f86 <unlink>
    1720:	83 c4 10             	add    $0x10,%esp
    1723:	85 c0                	test   %eax,%eax
    1725:	0f 89 b3 00 00 00    	jns    17de <deleteFile+0xe4>
		if (chdir(name) < 0){
    172b:	83 ec 0c             	sub    $0xc,%esp
    172e:	ff 75 08             	pushl  0x8(%ebp)
    1731:	e8 70 28 00 00       	call   3fa6 <chdir>
    1736:	83 c4 10             	add    $0x10,%esp
    1739:	85 c0                	test   %eax,%eax
    173b:	79 1a                	jns    1757 <deleteFile+0x5d>
			printf(2, "rm: %s failed to delete\n", name);
    173d:	83 ec 04             	sub    $0x4,%esp
    1740:	ff 75 08             	pushl  0x8(%ebp)
    1743:	68 1c a9 00 00       	push   $0xa91c
    1748:	6a 02                	push   $0x2
    174a:	e8 c4 29 00 00       	call   4113 <printf>
    174f:	83 c4 10             	add    $0x10,%esp
    1752:	e9 87 00 00 00       	jmp    17de <deleteFile+0xe4>
		}
		else{
			freeFileItemList();
    1757:	e8 6b e9 ff ff       	call   c7 <freeFileItemList>
			list(".");
    175c:	83 ec 0c             	sub    $0xc,%esp
    175f:	68 8f a8 00 00       	push   $0xa88f
    1764:	e8 48 ea ff ff       	call   1b1 <list>
    1769:	83 c4 10             	add    $0x10,%esp
			struct fileItem *p;
			p = fileItemList;
    176c:	a1 08 f4 00 00       	mov    0xf408,%eax
    1771:	89 45 f4             	mov    %eax,-0xc(%ebp)
			while (p != 0) {
    1774:	eb 2f                	jmp    17a5 <deleteFile+0xab>
				deleteFile(p->name);
    1776:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1779:	8b 40 14             	mov    0x14(%eax),%eax
    177c:	83 ec 0c             	sub    $0xc,%esp
    177f:	50                   	push   %eax
    1780:	e8 75 ff ff ff       	call   16fa <deleteFile>
    1785:	83 c4 10             	add    $0x10,%esp
				freeFileItemList();
    1788:	e8 3a e9 ff ff       	call   c7 <freeFileItemList>
				list(".");
    178d:	83 ec 0c             	sub    $0xc,%esp
    1790:	68 8f a8 00 00       	push   $0xa88f
    1795:	e8 17 ea ff ff       	call   1b1 <list>
    179a:	83 c4 10             	add    $0x10,%esp
				p = fileItemList;
    179d:	a1 08 f4 00 00       	mov    0xf408,%eax
    17a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else{
			freeFileItemList();
			list(".");
			struct fileItem *p;
			p = fileItemList;
			while (p != 0) {
    17a5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    17a9:	75 cb                	jne    1776 <deleteFile+0x7c>
				deleteFile(p->name);
				freeFileItemList();
				list(".");
				p = fileItemList;
			}
			chdir("..");
    17ab:	83 ec 0c             	sub    $0xc,%esp
    17ae:	68 35 a9 00 00       	push   $0xa935
    17b3:	e8 ee 27 00 00       	call   3fa6 <chdir>
    17b8:	83 c4 10             	add    $0x10,%esp
			freeFileItemList();
    17bb:	e8 07 e9 ff ff       	call   c7 <freeFileItemList>
			list(".");
    17c0:	83 ec 0c             	sub    $0xc,%esp
    17c3:	68 8f a8 00 00       	push   $0xa88f
    17c8:	e8 e4 e9 ff ff       	call   1b1 <list>
    17cd:	83 c4 10             	add    $0x10,%esp
			unlink(name);
    17d0:	83 ec 0c             	sub    $0xc,%esp
    17d3:	ff 75 08             	pushl  0x8(%ebp)
    17d6:	e8 ab 27 00 00       	call   3f86 <unlink>
    17db:	83 c4 10             	add    $0x10,%esp
		}
	}
}
    17de:	c9                   	leave  
    17df:	c3                   	ret    

000017e0 <h_deleteFile>:
void h_deleteFile(Point p) {
    17e0:	55                   	push   %ebp
    17e1:	89 e5                	mov    %esp,%ebp
    17e3:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    17e6:	a1 08 f4 00 00       	mov    0xf408,%eax
    17eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
    17ee:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    17f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17f8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    17fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
	printf(0, "hi1\n");
    1801:	83 ec 08             	sub    $0x8,%esp
    1804:	68 38 a9 00 00       	push   $0xa938
    1809:	6a 00                	push   $0x0
    180b:	e8 03 29 00 00       	call   4113 <printf>
    1810:	83 c4 10             	add    $0x10,%esp
	while (q != 0)
    1813:	e9 90 00 00 00       	jmp    18a8 <h_deleteFile+0xc8>
	{
		printf(0, "hi2\n");
    1818:	83 ec 08             	sub    $0x8,%esp
    181b:	68 3d a9 00 00       	push   $0xa93d
    1820:	6a 00                	push   $0x0
    1822:	e8 ec 28 00 00       	call   4113 <printf>
    1827:	83 c4 10             	add    $0x10,%esp
		if (q->chosen)
    182a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    182d:	8b 40 28             	mov    0x28(%eax),%eax
    1830:	85 c0                	test   %eax,%eax
    1832:	74 6b                	je     189f <h_deleteFile+0xbf>
		{
			p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
    1834:	83 ec 0c             	sub    $0xc,%esp
    1837:	6a 30                	push   $0x30
    1839:	e8 a6 2b 00 00       	call   43e4 <malloc>
    183e:	83 c4 10             	add    $0x10,%esp
    1841:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    1844:	83 ec 0c             	sub    $0xc,%esp
    1847:	6a 20                	push   $0x20
    1849:	e8 96 2b 00 00       	call   43e4 <malloc>
    184e:	83 c4 10             	add    $0x10,%esp
    1851:	89 c2                	mov    %eax,%edx
    1853:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1856:	89 50 14             	mov    %edx,0x14(%eax)
			strcpy(p1->name, q->name);
    1859:	8b 45 f4             	mov    -0xc(%ebp),%eax
    185c:	8b 50 14             	mov    0x14(%eax),%edx
    185f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1862:	8b 40 14             	mov    0x14(%eax),%eax
    1865:	83 ec 08             	sub    $0x8,%esp
    1868:	52                   	push   %edx
    1869:	50                   	push   %eax
    186a:	e8 97 24 00 00       	call   3d06 <strcpy>
    186f:	83 c4 10             	add    $0x10,%esp
			if(head == 0)
    1872:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1876:	75 0e                	jne    1886 <h_deleteFile+0xa6>
			{
				head = p1;
    1878:	8b 45 f0             	mov    -0x10(%ebp),%eax
    187b:	89 45 ec             	mov    %eax,-0x14(%ebp)
				p2 = p1;
    187e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1881:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1884:	eb 0f                	jmp    1895 <h_deleteFile+0xb5>
			} else {
				p2->next = p1;
    1886:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1889:	8b 55 f0             	mov    -0x10(%ebp),%edx
    188c:	89 50 2c             	mov    %edx,0x2c(%eax)
				p2 = p1;
    188f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1892:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}
			p1->next = 0;
    1895:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1898:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
		}
		q = q->next;
    189f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18a2:	8b 40 2c             	mov    0x2c(%eax),%eax
    18a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
void h_deleteFile(Point p) {
	struct fileItem *q = fileItemList;
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
	printf(0, "hi1\n");
	while (q != 0)
    18a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    18ac:	0f 85 66 ff ff ff    	jne    1818 <h_deleteFile+0x38>
			}
			p1->next = 0;
		}
		q = q->next;
	}
	p1 = head;
    18b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
    18b8:	83 ec 08             	sub    $0x8,%esp
    18bb:	68 44 a9 00 00       	push   $0xa944
    18c0:	6a 00                	push   $0x0
    18c2:	e8 4c 28 00 00       	call   4113 <printf>
    18c7:	83 c4 10             	add    $0x10,%esp
	while (p1 != 0)
    18ca:	eb 1b                	jmp    18e7 <h_deleteFile+0x107>
	{
		deleteFile(p1->name);
    18cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18cf:	8b 40 14             	mov    0x14(%eax),%eax
    18d2:	83 ec 0c             	sub    $0xc,%esp
    18d5:	50                   	push   %eax
    18d6:	e8 1f fe ff ff       	call   16fa <deleteFile>
    18db:	83 c4 10             	add    $0x10,%esp
		p1 = p1->next;
    18de:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18e1:	8b 40 2c             	mov    0x2c(%eax),%eax
    18e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
		}
		q = q->next;
	}
	p1 = head;
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
	while (p1 != 0)
    18e7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    18eb:	75 df                	jne    18cc <h_deleteFile+0xec>
	{
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
    18ed:	83 ec 08             	sub    $0x8,%esp
    18f0:	68 ac a9 00 00       	push   $0xa9ac
    18f5:	6a 00                	push   $0x0
    18f7:	e8 17 28 00 00       	call   4113 <printf>
    18fc:	83 c4 10             	add    $0x10,%esp
	p1 = head;
    18ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1902:	89 45 f0             	mov    %eax,-0x10(%ebp)
	while (p1 != 0) {
    1905:	eb 48                	jmp    194f <h_deleteFile+0x16f>
		p2 = p1;
    1907:	8b 45 f0             	mov    -0x10(%ebp),%eax
    190a:	89 45 e8             	mov    %eax,-0x18(%ebp)
		printf(0, "freeing %s\n", p2->name);
    190d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1910:	8b 40 14             	mov    0x14(%eax),%eax
    1913:	83 ec 04             	sub    $0x4,%esp
    1916:	50                   	push   %eax
    1917:	68 c2 a9 00 00       	push   $0xa9c2
    191c:	6a 00                	push   $0x0
    191e:	e8 f0 27 00 00       	call   4113 <printf>
    1923:	83 c4 10             	add    $0x10,%esp
		p1 = p1->next;
    1926:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1929:	8b 40 2c             	mov    0x2c(%eax),%eax
    192c:	89 45 f0             	mov    %eax,-0x10(%ebp)
		free(p2->name);
    192f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1932:	8b 40 14             	mov    0x14(%eax),%eax
    1935:	83 ec 0c             	sub    $0xc,%esp
    1938:	50                   	push   %eax
    1939:	e8 65 29 00 00       	call   42a3 <free>
    193e:	83 c4 10             	add    $0x10,%esp
		free(p2);
    1941:	83 ec 0c             	sub    $0xc,%esp
    1944:	ff 75 e8             	pushl  -0x18(%ebp)
    1947:	e8 57 29 00 00       	call   42a3 <free>
    194c:	83 c4 10             	add    $0x10,%esp
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
	p1 = head;
	while (p1 != 0) {
    194f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1953:	75 b2                	jne    1907 <h_deleteFile+0x127>
		printf(0, "freeing %s\n", p2->name);
		p1 = p1->next;
		free(p2->name);
		free(p2);
	}
	printf(0, "done freeing!~~~\n");
    1955:	83 ec 08             	sub    $0x8,%esp
    1958:	68 ce a9 00 00       	push   $0xa9ce
    195d:	6a 00                	push   $0x0
    195f:	e8 af 27 00 00       	call   4113 <printf>
    1964:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    1967:	e8 5b e7 ff ff       	call   c7 <freeFileItemList>
	list(".");
    196c:	83 ec 0c             	sub    $0xc,%esp
    196f:	68 8f a8 00 00       	push   $0xa88f
    1974:	e8 38 e8 ff ff       	call   1b1 <list>
    1979:	83 c4 10             	add    $0x10,%esp
	printItemList();
    197c:	e8 b5 f1 ff ff       	call   b36 <printItemList>
	drawFinderContent(context);
    1981:	83 ec 04             	sub    $0x4,%esp
    1984:	ff 35 88 2a 01 00    	pushl  0x12a88
    198a:	ff 35 84 2a 01 00    	pushl  0x12a84
    1990:	ff 35 80 2a 01 00    	pushl  0x12a80
    1996:	e8 23 ef ff ff       	call   8be <drawFinderContent>
    199b:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    199e:	83 ec 04             	sub    $0x4,%esp
    19a1:	ff 35 88 2a 01 00    	pushl  0x12a88
    19a7:	ff 35 84 2a 01 00    	pushl  0x12a84
    19ad:	ff 35 80 2a 01 00    	pushl  0x12a80
    19b3:	e8 0a ee ff ff       	call   7c2 <drawFinderWnd>
    19b8:	83 c4 10             	add    $0x10,%esp
		deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    19bb:	8d 45 d8             	lea    -0x28(%ebp),%eax
    19be:	83 ec 0c             	sub    $0xc,%esp
    19c1:	68 58 02 00 00       	push   $0x258
    19c6:	68 20 03 00 00       	push   $0x320
    19cb:	6a 00                	push   $0x0
    19cd:	6a 00                	push   $0x0
    19cf:	50                   	push   %eax
    19d0:	e8 b1 1d 00 00       	call   3786 <initRect>
    19d5:	83 c4 1c             	add    $0x1c,%esp
    19d8:	83 ec 0c             	sub    $0xc,%esp
    19db:	ff 75 e4             	pushl  -0x1c(%ebp)
    19de:	ff 75 e0             	pushl  -0x20(%ebp)
    19e1:	ff 75 dc             	pushl  -0x24(%ebp)
    19e4:	ff 75 d8             	pushl  -0x28(%ebp)
    19e7:	68 c0 2b 01 00       	push   $0x12bc0
    19ec:	e8 5a 1f 00 00       	call   394b <deleteClickable>
    19f1:	83 c4 20             	add    $0x20,%esp
		addWndEvent(&cm);
    19f4:	83 ec 0c             	sub    $0xc,%esp
    19f7:	68 c0 2b 01 00       	push   $0x12bc0
    19fc:	e8 2f f3 ff ff       	call   d30 <addWndEvent>
    1a01:	83 c4 10             	add    $0x10,%esp
		addListEvent(&cm);
    1a04:	83 ec 0c             	sub    $0xc,%esp
    1a07:	68 c0 2b 01 00       	push   $0x12bc0
    1a0c:	e8 c4 f2 ff ff       	call   cd5 <addListEvent>
    1a11:	83 c4 10             	add    $0x10,%esp
}
    1a14:	c9                   	leave  
    1a15:	c3                   	ret    

00001a16 <copyFile>:

void copyFile(){
    1a16:	55                   	push   %ebp
    1a17:	89 e5                	mov    %esp,%ebp
    1a19:	56                   	push   %esi
    1a1a:	53                   	push   %ebx
    1a1b:	83 ec 10             	sub    $0x10,%esp
	int fd;
	struct fileItem *p = fileItemList;
    1a1e:	a1 08 f4 00 00       	mov    0xf408,%eax
    1a23:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0){
    1a26:	e9 07 01 00 00       	jmp    1b32 <copyFile+0x11c>
		if (p->chosen == 1){
    1a2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a2e:	8b 40 28             	mov    0x28(%eax),%eax
    1a31:	83 f8 01             	cmp    $0x1,%eax
    1a34:	0f 85 ef 00 00 00    	jne    1b29 <copyFile+0x113>
			if(lenOfWaited >= MAX_COPY_SIZE){
    1a3a:	a1 d4 2b 01 00       	mov    0x12bd4,%eax
    1a3f:	83 f8 07             	cmp    $0x7,%eax
    1a42:	7e 1d                	jle    1a61 <copyFile+0x4b>
				printf(0, "Too Much Files To Copy %d\n", lenOfWaited);
    1a44:	a1 d4 2b 01 00       	mov    0x12bd4,%eax
    1a49:	83 ec 04             	sub    $0x4,%esp
    1a4c:	50                   	push   %eax
    1a4d:	68 e0 a9 00 00       	push   $0xa9e0
    1a52:	6a 00                	push   $0x0
    1a54:	e8 ba 26 00 00       	call   4113 <printf>
    1a59:	83 c4 10             	add    $0x10,%esp
    1a5c:	e9 c8 00 00 00       	jmp    1b29 <copyFile+0x113>
			}
			else{
				if((fd = open(p->name, O_RDONLY)) >= 0){
    1a61:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a64:	8b 40 14             	mov    0x14(%eax),%eax
    1a67:	83 ec 08             	sub    $0x8,%esp
    1a6a:	6a 00                	push   $0x0
    1a6c:	50                   	push   %eax
    1a6d:	e8 04 25 00 00       	call   3f76 <open>
    1a72:	83 c4 10             	add    $0x10,%esp
    1a75:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1a78:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1a7c:	0f 88 8e 00 00 00    	js     1b10 <copyFile+0xfa>
					strcpy(filesWaited[lenOfWaited], currentPath);
    1a82:	a1 d4 2b 01 00       	mov    0x12bd4,%eax
    1a87:	c1 e0 08             	shl    $0x8,%eax
    1a8a:	05 80 22 01 00       	add    $0x12280,%eax
    1a8f:	83 ec 08             	sub    $0x8,%esp
    1a92:	68 c0 2a 01 00       	push   $0x12ac0
    1a97:	50                   	push   %eax
    1a98:	e8 69 22 00 00       	call   3d06 <strcpy>
    1a9d:	83 c4 10             	add    $0x10,%esp
					strcpy(filesWaited[lenOfWaited] + strlen(currentPath), p->name);
    1aa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aa3:	8b 58 14             	mov    0x14(%eax),%ebx
    1aa6:	a1 d4 2b 01 00       	mov    0x12bd4,%eax
    1aab:	c1 e0 08             	shl    $0x8,%eax
    1aae:	8d b0 80 22 01 00    	lea    0x12280(%eax),%esi
    1ab4:	83 ec 0c             	sub    $0xc,%esp
    1ab7:	68 c0 2a 01 00       	push   $0x12ac0
    1abc:	e8 b4 22 00 00       	call   3d75 <strlen>
    1ac1:	83 c4 10             	add    $0x10,%esp
    1ac4:	01 f0                	add    %esi,%eax
    1ac6:	83 ec 08             	sub    $0x8,%esp
    1ac9:	53                   	push   %ebx
    1aca:	50                   	push   %eax
    1acb:	e8 36 22 00 00       	call   3d06 <strcpy>
    1ad0:	83 c4 10             	add    $0x10,%esp
					printf(0, "Open File %s Succeed\n", filesWaited[lenOfWaited]);
    1ad3:	a1 d4 2b 01 00       	mov    0x12bd4,%eax
    1ad8:	c1 e0 08             	shl    $0x8,%eax
    1adb:	05 80 22 01 00       	add    $0x12280,%eax
    1ae0:	83 ec 04             	sub    $0x4,%esp
    1ae3:	50                   	push   %eax
    1ae4:	68 fb a9 00 00       	push   $0xa9fb
    1ae9:	6a 00                	push   $0x0
    1aeb:	e8 23 26 00 00       	call   4113 <printf>
    1af0:	83 c4 10             	add    $0x10,%esp
					lenOfWaited++;
    1af3:	a1 d4 2b 01 00       	mov    0x12bd4,%eax
    1af8:	83 c0 01             	add    $0x1,%eax
    1afb:	a3 d4 2b 01 00       	mov    %eax,0x12bd4
					close(fd);
    1b00:	83 ec 0c             	sub    $0xc,%esp
    1b03:	ff 75 f0             	pushl  -0x10(%ebp)
    1b06:	e8 53 24 00 00       	call   3f5e <close>
    1b0b:	83 c4 10             	add    $0x10,%esp
    1b0e:	eb 19                	jmp    1b29 <copyFile+0x113>
				}
				else{
					printf(0, "Open File %s Failed\n", p->name);
    1b10:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b13:	8b 40 14             	mov    0x14(%eax),%eax
    1b16:	83 ec 04             	sub    $0x4,%esp
    1b19:	50                   	push   %eax
    1b1a:	68 11 aa 00 00       	push   $0xaa11
    1b1f:	6a 00                	push   $0x0
    1b21:	e8 ed 25 00 00       	call   4113 <printf>
    1b26:	83 c4 10             	add    $0x10,%esp
				}
			}
		}
		p = p->next;
    1b29:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b2c:	8b 40 2c             	mov    0x2c(%eax),%eax
    1b2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void copyFile(){
	int fd;
	struct fileItem *p = fileItemList;
	while(p != 0){
    1b32:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1b36:	0f 85 ef fe ff ff    	jne    1a2b <copyFile+0x15>
				}
			}
		}
		p = p->next;
	}
}
    1b3c:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1b3f:	5b                   	pop    %ebx
    1b40:	5e                   	pop    %esi
    1b41:	5d                   	pop    %ebp
    1b42:	c3                   	ret    

00001b43 <h_copyFile>:

void h_copyFile(Point p){
    1b43:	55                   	push   %ebp
    1b44:	89 e5                	mov    %esp,%ebp
    1b46:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 0;
    1b49:	c7 05 04 f4 00 00 00 	movl   $0x0,0xf404
    1b50:	00 00 00 
	lenOfWaited = 0;
    1b53:	c7 05 d4 2b 01 00 00 	movl   $0x0,0x12bd4
    1b5a:	00 00 00 
	copyFile();
    1b5d:	e8 b4 fe ff ff       	call   1a16 <copyFile>
}
    1b62:	c9                   	leave  
    1b63:	c3                   	ret    

00001b64 <moveFile>:

void moveFile(){
    1b64:	55                   	push   %ebp
    1b65:	89 e5                	mov    %esp,%ebp
    1b67:	83 ec 18             	sub    $0x18,%esp
	int i;
	for (i = 0; i < lenOfWaited; i++)
    1b6a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1b71:	eb 1b                	jmp    1b8e <moveFile+0x2a>
		deleteFile(filesWaited[i]);
    1b73:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b76:	c1 e0 08             	shl    $0x8,%eax
    1b79:	05 80 22 01 00       	add    $0x12280,%eax
    1b7e:	83 ec 0c             	sub    $0xc,%esp
    1b81:	50                   	push   %eax
    1b82:	e8 73 fb ff ff       	call   16fa <deleteFile>
    1b87:	83 c4 10             	add    $0x10,%esp
	copyFile();
}

void moveFile(){
	int i;
	for (i = 0; i < lenOfWaited; i++)
    1b8a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1b8e:	a1 d4 2b 01 00       	mov    0x12bd4,%eax
    1b93:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1b96:	7c db                	jl     1b73 <moveFile+0xf>
		deleteFile(filesWaited[i]);
	lenOfWaited = 0;
    1b98:	c7 05 d4 2b 01 00 00 	movl   $0x0,0x12bd4
    1b9f:	00 00 00 
}
    1ba2:	c9                   	leave  
    1ba3:	c3                   	ret    

00001ba4 <h_cutFile>:

void h_cutFile(Point p){
    1ba4:	55                   	push   %ebp
    1ba5:	89 e5                	mov    %esp,%ebp
    1ba7:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 1;
    1baa:	c7 05 04 f4 00 00 01 	movl   $0x1,0xf404
    1bb1:	00 00 00 
	lenOfWaited = 0;
    1bb4:	c7 05 d4 2b 01 00 00 	movl   $0x0,0x12bd4
    1bbb:	00 00 00 
	copyFile();
    1bbe:	e8 53 fe ff ff       	call   1a16 <copyFile>
}
    1bc3:	c9                   	leave  
    1bc4:	c3                   	ret    

00001bc5 <pasteFile>:

void pasteFile(){
    1bc5:	55                   	push   %ebp
    1bc6:	89 e5                	mov    %esp,%ebp
    1bc8:	83 ec 28             	sub    $0x28,%esp
	int file_src, file_dest;
	int i,j;
	char *filename;
	char* buff = (char*)malloc(4096 * sizeof(char));
    1bcb:	83 ec 0c             	sub    $0xc,%esp
    1bce:	68 00 10 00 00       	push   $0x1000
    1bd3:	e8 0c 28 00 00       	call   43e4 <malloc>
    1bd8:	83 c4 10             	add    $0x10,%esp
    1bdb:	89 45 e8             	mov    %eax,-0x18(%ebp)
	memset(buff, 0, 4096);
    1bde:	83 ec 04             	sub    $0x4,%esp
    1be1:	68 00 10 00 00       	push   $0x1000
    1be6:	6a 00                	push   $0x0
    1be8:	ff 75 e8             	pushl  -0x18(%ebp)
    1beb:	e8 ac 21 00 00       	call   3d9c <memset>
    1bf0:	83 c4 10             	add    $0x10,%esp
    int size = 0;
    1bf3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i = 0; i < lenOfWaited; i++){
    1bfa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1c01:	e9 6f 01 00 00       	jmp    1d75 <pasteFile+0x1b0>
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
    1c06:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c09:	c1 e0 08             	shl    $0x8,%eax
    1c0c:	05 80 22 01 00       	add    $0x12280,%eax
    1c11:	50                   	push   %eax
    1c12:	ff 75 f4             	pushl  -0xc(%ebp)
    1c15:	68 26 aa 00 00       	push   $0xaa26
    1c1a:	6a 00                	push   $0x0
    1c1c:	e8 f2 24 00 00       	call   4113 <printf>
    1c21:	83 c4 10             	add    $0x10,%esp
        for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    1c24:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c27:	c1 e0 08             	shl    $0x8,%eax
    1c2a:	05 80 22 01 00       	add    $0x12280,%eax
    1c2f:	83 ec 0c             	sub    $0xc,%esp
    1c32:	50                   	push   %eax
    1c33:	e8 3d 21 00 00       	call   3d75 <strlen>
    1c38:	83 c4 10             	add    $0x10,%esp
    1c3b:	83 e8 01             	sub    $0x1,%eax
    1c3e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1c41:	eb 35                	jmp    1c78 <pasteFile+0xb3>
        	if (*(filesWaited[i]+j) == '/'){
    1c43:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c46:	c1 e0 08             	shl    $0x8,%eax
    1c49:	8d 90 80 22 01 00    	lea    0x12280(%eax),%edx
    1c4f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c52:	01 d0                	add    %edx,%eax
    1c54:	0f b6 00             	movzbl (%eax),%eax
    1c57:	3c 2f                	cmp    $0x2f,%al
    1c59:	75 19                	jne    1c74 <pasteFile+0xaf>
        		filename = filesWaited[i] + j + 1;
    1c5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c5e:	c1 e0 08             	shl    $0x8,%eax
    1c61:	8d 90 80 22 01 00    	lea    0x12280(%eax),%edx
    1c67:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c6a:	83 c0 01             	add    $0x1,%eax
    1c6d:	01 d0                	add    %edx,%eax
    1c6f:	89 45 ec             	mov    %eax,-0x14(%ebp)
        		break;
    1c72:	eb 0a                	jmp    1c7e <pasteFile+0xb9>
	char* buff = (char*)malloc(4096 * sizeof(char));
	memset(buff, 0, 4096);
    int size = 0;
    for(i = 0; i < lenOfWaited; i++){
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
        for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    1c74:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    1c78:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1c7c:	79 c5                	jns    1c43 <pasteFile+0x7e>
        	if (*(filesWaited[i]+j) == '/'){
        		filename = filesWaited[i] + j + 1;
        		break;
        	}
        }
        printf(0, "NO.%d file %s name get\n", i, filename);
    1c7e:	ff 75 ec             	pushl  -0x14(%ebp)
    1c81:	ff 75 f4             	pushl  -0xc(%ebp)
    1c84:	68 43 aa 00 00       	push   $0xaa43
    1c89:	6a 00                	push   $0x0
    1c8b:	e8 83 24 00 00       	call   4113 <printf>
    1c90:	83 c4 10             	add    $0x10,%esp
        file_src = open(filesWaited[i], O_RDONLY);
    1c93:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c96:	c1 e0 08             	shl    $0x8,%eax
    1c99:	05 80 22 01 00       	add    $0x12280,%eax
    1c9e:	83 ec 08             	sub    $0x8,%esp
    1ca1:	6a 00                	push   $0x0
    1ca3:	50                   	push   %eax
    1ca4:	e8 cd 22 00 00       	call   3f76 <open>
    1ca9:	83 c4 10             	add    $0x10,%esp
    1cac:	89 45 e0             	mov    %eax,-0x20(%ebp)
		if((file_dest = open(filename, O_RDONLY)) >= 0){
    1caf:	83 ec 08             	sub    $0x8,%esp
    1cb2:	6a 00                	push   $0x0
    1cb4:	ff 75 ec             	pushl  -0x14(%ebp)
    1cb7:	e8 ba 22 00 00       	call   3f76 <open>
    1cbc:	83 c4 10             	add    $0x10,%esp
    1cbf:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1cc2:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    1cc6:	78 25                	js     1ced <pasteFile+0x128>
			printf(0, "NO.%d file %s already exist\n", i, filename);
    1cc8:	ff 75 ec             	pushl  -0x14(%ebp)
    1ccb:	ff 75 f4             	pushl  -0xc(%ebp)
    1cce:	68 5b aa 00 00       	push   $0xaa5b
    1cd3:	6a 00                	push   $0x0
    1cd5:	e8 39 24 00 00       	call   4113 <printf>
    1cda:	83 c4 10             	add    $0x10,%esp
			close(file_dest);
    1cdd:	83 ec 0c             	sub    $0xc,%esp
    1ce0:	ff 75 dc             	pushl  -0x24(%ebp)
    1ce3:	e8 76 22 00 00       	call   3f5e <close>
    1ce8:	83 c4 10             	add    $0x10,%esp
    1ceb:	eb 76                	jmp    1d63 <pasteFile+0x19e>
		}
		else{
			file_dest = open(filename, O_CREATE);
    1ced:	83 ec 08             	sub    $0x8,%esp
    1cf0:	68 00 02 00 00       	push   $0x200
    1cf5:	ff 75 ec             	pushl  -0x14(%ebp)
    1cf8:	e8 79 22 00 00       	call   3f76 <open>
    1cfd:	83 c4 10             	add    $0x10,%esp
    1d00:	89 45 dc             	mov    %eax,-0x24(%ebp)
			while((size = read(file_src, buff, 4096)) > 0)
    1d03:	eb 14                	jmp    1d19 <pasteFile+0x154>
                write(file_dest, buff, size);
    1d05:	83 ec 04             	sub    $0x4,%esp
    1d08:	ff 75 e4             	pushl  -0x1c(%ebp)
    1d0b:	ff 75 e8             	pushl  -0x18(%ebp)
    1d0e:	ff 75 dc             	pushl  -0x24(%ebp)
    1d11:	e8 40 22 00 00       	call   3f56 <write>
    1d16:	83 c4 10             	add    $0x10,%esp
			printf(0, "NO.%d file %s already exist\n", i, filename);
			close(file_dest);
		}
		else{
			file_dest = open(filename, O_CREATE);
			while((size = read(file_src, buff, 4096)) > 0)
    1d19:	83 ec 04             	sub    $0x4,%esp
    1d1c:	68 00 10 00 00       	push   $0x1000
    1d21:	ff 75 e8             	pushl  -0x18(%ebp)
    1d24:	ff 75 e0             	pushl  -0x20(%ebp)
    1d27:	e8 22 22 00 00       	call   3f4e <read>
    1d2c:	83 c4 10             	add    $0x10,%esp
    1d2f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1d32:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1d36:	7f cd                	jg     1d05 <pasteFile+0x140>
                write(file_dest, buff, size);
	        if(size < 0)
    1d38:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1d3c:	79 17                	jns    1d55 <pasteFile+0x190>
	        {
	            //printf(2, "copy file error!!!\r\n");
	            printf(0, "NO.%d file %s error\n", i, filename);
    1d3e:	ff 75 ec             	pushl  -0x14(%ebp)
    1d41:	ff 75 f4             	pushl  -0xc(%ebp)
    1d44:	68 78 aa 00 00       	push   $0xaa78
    1d49:	6a 00                	push   $0x0
    1d4b:	e8 c3 23 00 00       	call   4113 <printf>
    1d50:	83 c4 10             	add    $0x10,%esp
	            return;
    1d53:	eb 3c                	jmp    1d91 <pasteFile+0x1cc>
	        }
	        close(file_dest);
    1d55:	83 ec 0c             	sub    $0xc,%esp
    1d58:	ff 75 dc             	pushl  -0x24(%ebp)
    1d5b:	e8 fe 21 00 00       	call   3f5e <close>
    1d60:	83 c4 10             	add    $0x10,%esp
		}
		close(file_src);
    1d63:	83 ec 0c             	sub    $0xc,%esp
    1d66:	ff 75 e0             	pushl  -0x20(%ebp)
    1d69:	e8 f0 21 00 00       	call   3f5e <close>
    1d6e:	83 c4 10             	add    $0x10,%esp
	int i,j;
	char *filename;
	char* buff = (char*)malloc(4096 * sizeof(char));
	memset(buff, 0, 4096);
    int size = 0;
    for(i = 0; i < lenOfWaited; i++){
    1d71:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1d75:	a1 d4 2b 01 00       	mov    0x12bd4,%eax
    1d7a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1d7d:	0f 8c 83 fe ff ff    	jl     1c06 <pasteFile+0x41>
	        }
	        close(file_dest);
		}
		close(file_src);
	}
    free(buff);
    1d83:	83 ec 0c             	sub    $0xc,%esp
    1d86:	ff 75 e8             	pushl  -0x18(%ebp)
    1d89:	e8 15 25 00 00       	call   42a3 <free>
    1d8e:	83 c4 10             	add    $0x10,%esp
}
    1d91:	c9                   	leave  
    1d92:	c3                   	ret    

00001d93 <h_pasteFile>:

void h_pasteFile(Point p){
    1d93:	55                   	push   %ebp
    1d94:	89 e5                	mov    %esp,%ebp
    1d96:	83 ec 18             	sub    $0x18,%esp
	pasteFile();
    1d99:	e8 27 fe ff ff       	call   1bc5 <pasteFile>
	if(copyOrCut == 1)
    1d9e:	a1 04 f4 00 00       	mov    0xf404,%eax
    1da3:	83 f8 01             	cmp    $0x1,%eax
    1da6:	75 05                	jne    1dad <h_pasteFile+0x1a>
		moveFile();
    1da8:	e8 b7 fd ff ff       	call   1b64 <moveFile>
    freeFileItemList();
    1dad:	e8 15 e3 ff ff       	call   c7 <freeFileItemList>
	list(".");
    1db2:	83 ec 0c             	sub    $0xc,%esp
    1db5:	68 8f a8 00 00       	push   $0xa88f
    1dba:	e8 f2 e3 ff ff       	call   1b1 <list>
    1dbf:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    1dc2:	83 ec 04             	sub    $0x4,%esp
    1dc5:	ff 35 88 2a 01 00    	pushl  0x12a88
    1dcb:	ff 35 84 2a 01 00    	pushl  0x12a84
    1dd1:	ff 35 80 2a 01 00    	pushl  0x12a80
    1dd7:	e8 e2 ea ff ff       	call   8be <drawFinderContent>
    1ddc:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1ddf:	83 ec 04             	sub    $0x4,%esp
    1de2:	ff 35 88 2a 01 00    	pushl  0x12a88
    1de8:	ff 35 84 2a 01 00    	pushl  0x12a84
    1dee:	ff 35 80 2a 01 00    	pushl  0x12a80
    1df4:	e8 c9 e9 ff ff       	call   7c2 <drawFinderWnd>
    1df9:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1dfc:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1dff:	83 ec 0c             	sub    $0xc,%esp
    1e02:	68 58 02 00 00       	push   $0x258
    1e07:	68 20 03 00 00       	push   $0x320
    1e0c:	6a 00                	push   $0x0
    1e0e:	6a 00                	push   $0x0
    1e10:	50                   	push   %eax
    1e11:	e8 70 19 00 00       	call   3786 <initRect>
    1e16:	83 c4 1c             	add    $0x1c,%esp
    1e19:	83 ec 0c             	sub    $0xc,%esp
    1e1c:	ff 75 f4             	pushl  -0xc(%ebp)
    1e1f:	ff 75 f0             	pushl  -0x10(%ebp)
    1e22:	ff 75 ec             	pushl  -0x14(%ebp)
    1e25:	ff 75 e8             	pushl  -0x18(%ebp)
    1e28:	68 c0 2b 01 00       	push   $0x12bc0
    1e2d:	e8 19 1b 00 00       	call   394b <deleteClickable>
    1e32:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1e35:	83 ec 0c             	sub    $0xc,%esp
    1e38:	68 c0 2b 01 00       	push   $0x12bc0
    1e3d:	e8 ee ee ff ff       	call   d30 <addWndEvent>
    1e42:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1e45:	83 ec 0c             	sub    $0xc,%esp
    1e48:	68 c0 2b 01 00       	push   $0x12bc0
    1e4d:	e8 83 ee ff ff       	call   cd5 <addListEvent>
    1e52:	83 c4 10             	add    $0x10,%esp
}
    1e55:	c9                   	leave  
    1e56:	c3                   	ret    

00001e57 <h_chooseFile>:

void h_chooseFile(Point p) {
    1e57:	55                   	push   %ebp
    1e58:	89 e5                	mov    %esp,%ebp
    1e5a:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *temp = getFileItem(p);
    1e5d:	83 ec 08             	sub    $0x8,%esp
    1e60:	ff 75 0c             	pushl  0xc(%ebp)
    1e63:	ff 75 08             	pushl  0x8(%ebp)
    1e66:	e8 76 ef ff ff       	call   de1 <getFileItem>
    1e6b:	83 c4 10             	add    $0x10,%esp
    1e6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (temp->chosen != 0)
    1e71:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e74:	8b 40 28             	mov    0x28(%eax),%eax
    1e77:	85 c0                	test   %eax,%eax
    1e79:	74 1e                	je     1e99 <h_chooseFile+0x42>
	{
		printf(0, "chooseFile!\n");
    1e7b:	83 ec 08             	sub    $0x8,%esp
    1e7e:	68 8d aa 00 00       	push   $0xaa8d
    1e83:	6a 00                	push   $0x0
    1e85:	e8 89 22 00 00       	call   4113 <printf>
    1e8a:	83 c4 10             	add    $0x10,%esp
		temp->chosen = 0;
    1e8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e90:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    1e97:	eb 1c                	jmp    1eb5 <h_chooseFile+0x5e>
	}
	else
	{
		printf(0, "unchooseFile!\n");
    1e99:	83 ec 08             	sub    $0x8,%esp
    1e9c:	68 9a aa 00 00       	push   $0xaa9a
    1ea1:	6a 00                	push   $0x0
    1ea3:	e8 6b 22 00 00       	call   4113 <printf>
    1ea8:	83 c4 10             	add    $0x10,%esp
		temp->chosen = 1;
    1eab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1eae:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    1eb5:	83 ec 04             	sub    $0x4,%esp
    1eb8:	ff 35 88 2a 01 00    	pushl  0x12a88
    1ebe:	ff 35 84 2a 01 00    	pushl  0x12a84
    1ec4:	ff 35 80 2a 01 00    	pushl  0x12a80
    1eca:	e8 ef e9 ff ff       	call   8be <drawFinderContent>
    1ecf:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1ed2:	83 ec 04             	sub    $0x4,%esp
    1ed5:	ff 35 88 2a 01 00    	pushl  0x12a88
    1edb:	ff 35 84 2a 01 00    	pushl  0x12a84
    1ee1:	ff 35 80 2a 01 00    	pushl  0x12a80
    1ee7:	e8 d6 e8 ff ff       	call   7c2 <drawFinderWnd>
    1eec:	83 c4 10             	add    $0x10,%esp
}
    1eef:	c9                   	leave  
    1ef0:	c3                   	ret    

00001ef1 <h_closeWnd>:

void h_closeWnd(Point p) {
    1ef1:	55                   	push   %ebp
    1ef2:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    1ef4:	c7 05 00 ea 00 00 00 	movl   $0x0,0xea00
    1efb:	00 00 00 
}
    1efe:	5d                   	pop    %ebp
    1eff:	c3                   	ret    

00001f00 <h_chvm1>:

void h_chvm1(Point p) {
    1f00:	55                   	push   %ebp
    1f01:	89 e5                	mov    %esp,%ebp
    1f03:	83 ec 18             	sub    $0x18,%esp
	style = ICON_STYLE;
    1f06:	c7 05 04 ea 00 00 01 	movl   $0x1,0xea04
    1f0d:	00 00 00 
	freeFileItemList();
    1f10:	e8 b2 e1 ff ff       	call   c7 <freeFileItemList>
		list(".");
    1f15:	83 ec 0c             	sub    $0xc,%esp
    1f18:	68 8f a8 00 00       	push   $0xa88f
    1f1d:	e8 8f e2 ff ff       	call   1b1 <list>
    1f22:	83 c4 10             	add    $0x10,%esp
		drawFinderContent(context);
    1f25:	83 ec 04             	sub    $0x4,%esp
    1f28:	ff 35 88 2a 01 00    	pushl  0x12a88
    1f2e:	ff 35 84 2a 01 00    	pushl  0x12a84
    1f34:	ff 35 80 2a 01 00    	pushl  0x12a80
    1f3a:	e8 7f e9 ff ff       	call   8be <drawFinderContent>
    1f3f:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1f42:	83 ec 04             	sub    $0x4,%esp
    1f45:	ff 35 88 2a 01 00    	pushl  0x12a88
    1f4b:	ff 35 84 2a 01 00    	pushl  0x12a84
    1f51:	ff 35 80 2a 01 00    	pushl  0x12a80
    1f57:	e8 66 e8 ff ff       	call   7c2 <drawFinderWnd>
    1f5c:	83 c4 10             	add    $0x10,%esp
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1f5f:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1f62:	83 ec 0c             	sub    $0xc,%esp
    1f65:	68 58 02 00 00       	push   $0x258
    1f6a:	68 20 03 00 00       	push   $0x320
    1f6f:	6a 00                	push   $0x0
    1f71:	6a 00                	push   $0x0
    1f73:	50                   	push   %eax
    1f74:	e8 0d 18 00 00       	call   3786 <initRect>
    1f79:	83 c4 1c             	add    $0x1c,%esp
    1f7c:	83 ec 0c             	sub    $0xc,%esp
    1f7f:	ff 75 f4             	pushl  -0xc(%ebp)
    1f82:	ff 75 f0             	pushl  -0x10(%ebp)
    1f85:	ff 75 ec             	pushl  -0x14(%ebp)
    1f88:	ff 75 e8             	pushl  -0x18(%ebp)
    1f8b:	68 c0 2b 01 00       	push   $0x12bc0
    1f90:	e8 b6 19 00 00       	call   394b <deleteClickable>
    1f95:	83 c4 20             	add    $0x20,%esp
			addWndEvent(&cm);
    1f98:	83 ec 0c             	sub    $0xc,%esp
    1f9b:	68 c0 2b 01 00       	push   $0x12bc0
    1fa0:	e8 8b ed ff ff       	call   d30 <addWndEvent>
    1fa5:	83 c4 10             	add    $0x10,%esp
			addListEvent(&cm);
    1fa8:	83 ec 0c             	sub    $0xc,%esp
    1fab:	68 c0 2b 01 00       	push   $0x12bc0
    1fb0:	e8 20 ed ff ff       	call   cd5 <addListEvent>
    1fb5:	83 c4 10             	add    $0x10,%esp
}
    1fb8:	c9                   	leave  
    1fb9:	c3                   	ret    

00001fba <h_chvm2>:

void h_chvm2(Point p) {
    1fba:	55                   	push   %ebp
    1fbb:	89 e5                	mov    %esp,%ebp
    1fbd:	83 ec 18             	sub    $0x18,%esp
	style = LIST_STYLE;
    1fc0:	c7 05 04 ea 00 00 02 	movl   $0x2,0xea04
    1fc7:	00 00 00 
	freeFileItemList();
    1fca:	e8 f8 e0 ff ff       	call   c7 <freeFileItemList>
		list(".");
    1fcf:	83 ec 0c             	sub    $0xc,%esp
    1fd2:	68 8f a8 00 00       	push   $0xa88f
    1fd7:	e8 d5 e1 ff ff       	call   1b1 <list>
    1fdc:	83 c4 10             	add    $0x10,%esp
		drawFinderContent(context);
    1fdf:	83 ec 04             	sub    $0x4,%esp
    1fe2:	ff 35 88 2a 01 00    	pushl  0x12a88
    1fe8:	ff 35 84 2a 01 00    	pushl  0x12a84
    1fee:	ff 35 80 2a 01 00    	pushl  0x12a80
    1ff4:	e8 c5 e8 ff ff       	call   8be <drawFinderContent>
    1ff9:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1ffc:	83 ec 04             	sub    $0x4,%esp
    1fff:	ff 35 88 2a 01 00    	pushl  0x12a88
    2005:	ff 35 84 2a 01 00    	pushl  0x12a84
    200b:	ff 35 80 2a 01 00    	pushl  0x12a80
    2011:	e8 ac e7 ff ff       	call   7c2 <drawFinderWnd>
    2016:	83 c4 10             	add    $0x10,%esp
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2019:	8d 45 e8             	lea    -0x18(%ebp),%eax
    201c:	83 ec 0c             	sub    $0xc,%esp
    201f:	68 58 02 00 00       	push   $0x258
    2024:	68 20 03 00 00       	push   $0x320
    2029:	6a 00                	push   $0x0
    202b:	6a 00                	push   $0x0
    202d:	50                   	push   %eax
    202e:	e8 53 17 00 00       	call   3786 <initRect>
    2033:	83 c4 1c             	add    $0x1c,%esp
    2036:	83 ec 0c             	sub    $0xc,%esp
    2039:	ff 75 f4             	pushl  -0xc(%ebp)
    203c:	ff 75 f0             	pushl  -0x10(%ebp)
    203f:	ff 75 ec             	pushl  -0x14(%ebp)
    2042:	ff 75 e8             	pushl  -0x18(%ebp)
    2045:	68 c0 2b 01 00       	push   $0x12bc0
    204a:	e8 fc 18 00 00       	call   394b <deleteClickable>
    204f:	83 c4 20             	add    $0x20,%esp
			addWndEvent(&cm);
    2052:	83 ec 0c             	sub    $0xc,%esp
    2055:	68 c0 2b 01 00       	push   $0x12bc0
    205a:	e8 d1 ec ff ff       	call   d30 <addWndEvent>
    205f:	83 c4 10             	add    $0x10,%esp
			addListEvent(&cm);
    2062:	83 ec 0c             	sub    $0xc,%esp
    2065:	68 c0 2b 01 00       	push   $0x12bc0
    206a:	e8 66 ec ff ff       	call   cd5 <addListEvent>
    206f:	83 c4 10             	add    $0x10,%esp
}
    2072:	c9                   	leave  
    2073:	c3                   	ret    

00002074 <h_goUp>:

void h_goUp(Point p) {
    2074:	55                   	push   %ebp
    2075:	89 e5                	mov    %esp,%ebp
    2077:	83 ec 18             	sub    $0x18,%esp
	enterDir("..");
    207a:	83 ec 0c             	sub    $0xc,%esp
    207d:	68 35 a9 00 00       	push   $0xa935
    2082:	e8 9a f1 ff ff       	call   1221 <enterDir>
    2087:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    208a:	e8 38 e0 ff ff       	call   c7 <freeFileItemList>
	list(".");
    208f:	83 ec 0c             	sub    $0xc,%esp
    2092:	68 8f a8 00 00       	push   $0xa88f
    2097:	e8 15 e1 ff ff       	call   1b1 <list>
    209c:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    209f:	83 ec 04             	sub    $0x4,%esp
    20a2:	ff 35 88 2a 01 00    	pushl  0x12a88
    20a8:	ff 35 84 2a 01 00    	pushl  0x12a84
    20ae:	ff 35 80 2a 01 00    	pushl  0x12a80
    20b4:	e8 05 e8 ff ff       	call   8be <drawFinderContent>
    20b9:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    20bc:	83 ec 04             	sub    $0x4,%esp
    20bf:	ff 35 88 2a 01 00    	pushl  0x12a88
    20c5:	ff 35 84 2a 01 00    	pushl  0x12a84
    20cb:	ff 35 80 2a 01 00    	pushl  0x12a80
    20d1:	e8 ec e6 ff ff       	call   7c2 <drawFinderWnd>
    20d6:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    20d9:	8d 45 e8             	lea    -0x18(%ebp),%eax
    20dc:	83 ec 0c             	sub    $0xc,%esp
    20df:	68 58 02 00 00       	push   $0x258
    20e4:	68 20 03 00 00       	push   $0x320
    20e9:	6a 00                	push   $0x0
    20eb:	6a 00                	push   $0x0
    20ed:	50                   	push   %eax
    20ee:	e8 93 16 00 00       	call   3786 <initRect>
    20f3:	83 c4 1c             	add    $0x1c,%esp
    20f6:	83 ec 0c             	sub    $0xc,%esp
    20f9:	ff 75 f4             	pushl  -0xc(%ebp)
    20fc:	ff 75 f0             	pushl  -0x10(%ebp)
    20ff:	ff 75 ec             	pushl  -0x14(%ebp)
    2102:	ff 75 e8             	pushl  -0x18(%ebp)
    2105:	68 c0 2b 01 00       	push   $0x12bc0
    210a:	e8 3c 18 00 00       	call   394b <deleteClickable>
    210f:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    2112:	83 ec 0c             	sub    $0xc,%esp
    2115:	68 c0 2b 01 00       	push   $0x12bc0
    211a:	e8 11 ec ff ff       	call   d30 <addWndEvent>
    211f:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    2122:	83 ec 0c             	sub    $0xc,%esp
    2125:	68 c0 2b 01 00       	push   $0x12bc0
    212a:	e8 a6 eb ff ff       	call   cd5 <addListEvent>
    212f:	83 c4 10             	add    $0x10,%esp
}
    2132:	c9                   	leave  
    2133:	c3                   	ret    

00002134 <h_empty>:

void h_empty(Point p) {
    2134:	55                   	push   %ebp
    2135:	89 e5                	mov    %esp,%ebp

}
    2137:	5d                   	pop    %ebp
    2138:	c3                   	ret    

00002139 <main>:

int main(int argc, char *argv[]) {
    2139:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    213d:	83 e4 f0             	and    $0xfffffff0,%esp
    2140:	ff 71 fc             	pushl  -0x4(%ecx)
    2143:	55                   	push   %ebp
    2144:	89 e5                	mov    %esp,%ebp
    2146:	56                   	push   %esi
    2147:	53                   	push   %ebx
    2148:	51                   	push   %ecx
    2149:	83 ec 7c             	sub    $0x7c,%esp
	int winid;
	struct Msg msg;

	Point p;

	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    214c:	83 ec 04             	sub    $0x4,%esp
    214f:	68 c2 01 00 00       	push   $0x1c2
    2154:	68 58 02 00 00       	push   $0x258
    2159:	68 80 2a 01 00       	push   $0x12a80
    215e:	e8 f4 03 00 00       	call   2557 <init_context>
    2163:	83 c4 10             	add    $0x10,%esp
    2166:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    2169:	8d 45 88             	lea    -0x78(%ebp),%eax
    216c:	ff 35 88 2a 01 00    	pushl  0x12a88
    2172:	ff 35 84 2a 01 00    	pushl  0x12a84
    2178:	ff 35 80 2a 01 00    	pushl  0x12a80
    217e:	50                   	push   %eax
    217f:	e8 96 16 00 00       	call   381a <initClickManager>
    2184:	83 c4 0c             	add    $0xc,%esp
    2187:	8b 45 88             	mov    -0x78(%ebp),%eax
    218a:	a3 c0 2b 01 00       	mov    %eax,0x12bc0
    218f:	8b 45 8c             	mov    -0x74(%ebp),%eax
    2192:	a3 c4 2b 01 00       	mov    %eax,0x12bc4
    2197:	8b 45 90             	mov    -0x70(%ebp),%eax
    219a:	a3 c8 2b 01 00       	mov    %eax,0x12bc8
    219f:	8b 45 94             	mov    -0x6c(%ebp),%eax
    21a2:	a3 cc 2b 01 00       	mov    %eax,0x12bcc
    21a7:	8b 45 98             	mov    -0x68(%ebp),%eax
    21aa:	a3 d0 2b 01 00       	mov    %eax,0x12bd0
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    21af:	83 ec 08             	sub    $0x8,%esp
    21b2:	6a 0d                	push   $0xd
    21b4:	68 40 eb 00 00       	push   $0xeb40
    21b9:	e8 c3 0d 00 00       	call   2f81 <load_iconlist>
    21be:	83 c4 10             	add    $0x10,%esp
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    21c1:	83 ec 08             	sub    $0x8,%esp
    21c4:	6a 04                	push   $0x4
    21c6:	68 40 ea 00 00       	push   $0xea40
    21cb:	e8 b1 0d 00 00       	call   2f81 <load_iconlist>
    21d0:	83 c4 10             	add    $0x10,%esp
	//testHandlers();
	strcpy(currentPath, "/");
    21d3:	83 ec 08             	sub    $0x8,%esp
    21d6:	68 a9 aa 00 00       	push   $0xaaa9
    21db:	68 c0 2a 01 00       	push   $0x12ac0
    21e0:	e8 21 1b 00 00       	call   3d06 <strcpy>
    21e5:	83 c4 10             	add    $0x10,%esp
	mkdir("userfolder");
    21e8:	83 ec 0c             	sub    $0xc,%esp
    21eb:	68 ab aa 00 00       	push   $0xaaab
    21f0:	e8 a9 1d 00 00       	call   3f9e <mkdir>
    21f5:	83 c4 10             	add    $0x10,%esp
	enterDir("userfolder");
    21f8:	83 ec 0c             	sub    $0xc,%esp
    21fb:	68 ab aa 00 00       	push   $0xaaab
    2200:	e8 1c f0 ff ff       	call   1221 <enterDir>
    2205:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    2208:	e8 ba de ff ff       	call   c7 <freeFileItemList>
	list(".");
    220d:	83 ec 0c             	sub    $0xc,%esp
    2210:	68 8f a8 00 00       	push   $0xa88f
    2215:	e8 97 df ff ff       	call   1b1 <list>
    221a:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    221d:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    2220:	83 ec 0c             	sub    $0xc,%esp
    2223:	68 58 02 00 00       	push   $0x258
    2228:	68 20 03 00 00       	push   $0x320
    222d:	6a 00                	push   $0x0
    222f:	6a 00                	push   $0x0
    2231:	50                   	push   %eax
    2232:	e8 4f 15 00 00       	call   3786 <initRect>
    2237:	83 c4 1c             	add    $0x1c,%esp
    223a:	83 ec 0c             	sub    $0xc,%esp
    223d:	ff 75 e0             	pushl  -0x20(%ebp)
    2240:	ff 75 dc             	pushl  -0x24(%ebp)
    2243:	ff 75 d8             	pushl  -0x28(%ebp)
    2246:	ff 75 d4             	pushl  -0x2c(%ebp)
    2249:	68 c0 2b 01 00       	push   $0x12bc0
    224e:	e8 f8 16 00 00       	call   394b <deleteClickable>
    2253:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    2256:	83 ec 0c             	sub    $0xc,%esp
    2259:	68 c0 2b 01 00       	push   $0x12bc0
    225e:	e8 cd ea ff ff       	call   d30 <addWndEvent>
    2263:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    2266:	83 ec 0c             	sub    $0xc,%esp
    2269:	68 c0 2b 01 00       	push   $0x12bc0
    226e:	e8 62 ea ff ff       	call   cd5 <addListEvent>
    2273:	83 c4 10             	add    $0x10,%esp
	lenOfWaited = 0;
    2276:	c7 05 d4 2b 01 00 00 	movl   $0x0,0x12bd4
    227d:	00 00 00 
	while (isRun) {
    2280:	e9 94 01 00 00       	jmp    2419 <main+0x2e0>
		getMsg(&msg);
    2285:	83 ec 0c             	sub    $0xc,%esp
    2288:	8d 45 bc             	lea    -0x44(%ebp),%eax
    228b:	50                   	push   %eax
    228c:	e8 45 1d 00 00       	call   3fd6 <getMsg>
    2291:	83 c4 10             	add    $0x10,%esp
		switch (msg.msg_type) {
    2294:	8b 45 bc             	mov    -0x44(%ebp),%eax
    2297:	83 f8 08             	cmp    $0x8,%eax
    229a:	0f 87 78 01 00 00    	ja     2418 <main+0x2df>
    22a0:	8b 04 85 b8 aa 00 00 	mov    0xaab8(,%eax,4),%eax
    22a7:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    22a9:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    22ac:	8b 55 c0             	mov    -0x40(%ebp),%edx
    22af:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    22b2:	83 ec 04             	sub    $0x4,%esp
    22b5:	51                   	push   %ecx
    22b6:	52                   	push   %edx
    22b7:	50                   	push   %eax
    22b8:	e8 a2 14 00 00       	call   375f <initPoint>
    22bd:	83 c4 0c             	add    $0xc,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    22c0:	a1 c4 2b 01 00       	mov    0x12bc4,%eax
    22c5:	83 ec 04             	sub    $0x4,%esp
    22c8:	ff 75 b8             	pushl  -0x48(%ebp)
    22cb:	ff 75 b4             	pushl  -0x4c(%ebp)
    22ce:	50                   	push   %eax
    22cf:	e8 49 17 00 00       	call   3a1d <executeHandler>
    22d4:	83 c4 10             	add    $0x10,%esp
    22d7:	85 c0                	test   %eax,%eax
    22d9:	74 14                	je     22ef <main+0x1b6>
				updateWindow(winid, context.addr);
    22db:	a1 80 2a 01 00       	mov    0x12a80,%eax
    22e0:	83 ec 08             	sub    $0x8,%esp
    22e3:	50                   	push   %eax
    22e4:	ff 75 e4             	pushl  -0x1c(%ebp)
    22e7:	e8 02 1d 00 00       	call   3fee <updateWindow>
    22ec:	83 c4 10             	add    $0x10,%esp
			}
			break;
    22ef:	e9 25 01 00 00       	jmp    2419 <main+0x2e0>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderContent(context);
    22f4:	83 ec 04             	sub    $0x4,%esp
    22f7:	ff 35 88 2a 01 00    	pushl  0x12a88
    22fd:	ff 35 84 2a 01 00    	pushl  0x12a84
    2303:	ff 35 80 2a 01 00    	pushl  0x12a80
    2309:	e8 b0 e5 ff ff       	call   8be <drawFinderContent>
    230e:	83 c4 10             	add    $0x10,%esp
			drawFinderWnd(context);
    2311:	83 ec 04             	sub    $0x4,%esp
    2314:	ff 35 88 2a 01 00    	pushl  0x12a88
    231a:	ff 35 84 2a 01 00    	pushl  0x12a84
    2320:	ff 35 80 2a 01 00    	pushl  0x12a80
    2326:	e8 97 e4 ff ff       	call   7c2 <drawFinderWnd>
    232b:	83 c4 10             	add    $0x10,%esp
			updateWindow(winid, context.addr);
    232e:	a1 80 2a 01 00       	mov    0x12a80,%eax
    2333:	83 ec 08             	sub    $0x8,%esp
    2336:	50                   	push   %eax
    2337:	ff 75 e4             	pushl  -0x1c(%ebp)
    233a:	e8 af 1c 00 00       	call   3fee <updateWindow>
    233f:	83 c4 10             	add    $0x10,%esp
			break;
    2342:	e9 d2 00 00 00       	jmp    2419 <main+0x2e0>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    2347:	8b 75 cc             	mov    -0x34(%ebp),%esi
    234a:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    234d:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    2350:	8b 55 c0             	mov    -0x40(%ebp),%edx
    2353:	a1 80 2a 01 00       	mov    0x12a80,%eax
    2358:	83 ec 08             	sub    $0x8,%esp
    235b:	56                   	push   %esi
    235c:	53                   	push   %ebx
    235d:	51                   	push   %ecx
    235e:	52                   	push   %edx
    235f:	50                   	push   %eax
    2360:	ff 75 e4             	pushl  -0x1c(%ebp)
    2363:	e8 8e 1c 00 00       	call   3ff6 <updatePartialWindow>
    2368:	83 c4 20             	add    $0x20,%esp
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    236b:	e9 a9 00 00 00       	jmp    2419 <main+0x2e0>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2370:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    2373:	8b 55 c0             	mov    -0x40(%ebp),%edx
    2376:	8d 45 80             	lea    -0x80(%ebp),%eax
    2379:	83 ec 04             	sub    $0x4,%esp
    237c:	51                   	push   %ecx
    237d:	52                   	push   %edx
    237e:	50                   	push   %eax
    237f:	e8 db 13 00 00       	call   375f <initPoint>
    2384:	83 c4 0c             	add    $0xc,%esp
    2387:	8b 45 80             	mov    -0x80(%ebp),%eax
    238a:	8b 55 84             	mov    -0x7c(%ebp),%edx
    238d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    2390:	89 55 b8             	mov    %edx,-0x48(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.left_click, p)) {
    2393:	a1 c0 2b 01 00       	mov    0x12bc0,%eax
    2398:	83 ec 04             	sub    $0x4,%esp
    239b:	ff 75 b8             	pushl  -0x48(%ebp)
    239e:	ff 75 b4             	pushl  -0x4c(%ebp)
    23a1:	50                   	push   %eax
    23a2:	e8 76 16 00 00       	call   3a1d <executeHandler>
    23a7:	83 c4 10             	add    $0x10,%esp
    23aa:	85 c0                	test   %eax,%eax
    23ac:	74 14                	je     23c2 <main+0x289>

				updateWindow(winid, context.addr);
    23ae:	a1 80 2a 01 00       	mov    0x12a80,%eax
    23b3:	83 ec 08             	sub    $0x8,%esp
    23b6:	50                   	push   %eax
    23b7:	ff 75 e4             	pushl  -0x1c(%ebp)
    23ba:	e8 2f 1c 00 00       	call   3fee <updateWindow>
    23bf:	83 c4 10             	add    $0x10,%esp
			}
			break;
    23c2:	eb 55                	jmp    2419 <main+0x2e0>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    23c4:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    23c7:	8b 55 c0             	mov    -0x40(%ebp),%edx
    23ca:	8d 45 80             	lea    -0x80(%ebp),%eax
    23cd:	83 ec 04             	sub    $0x4,%esp
    23d0:	51                   	push   %ecx
    23d1:	52                   	push   %edx
    23d2:	50                   	push   %eax
    23d3:	e8 87 13 00 00       	call   375f <initPoint>
    23d8:	83 c4 0c             	add    $0xc,%esp
    23db:	8b 45 80             	mov    -0x80(%ebp),%eax
    23de:	8b 55 84             	mov    -0x7c(%ebp),%edx
    23e1:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    23e4:	89 55 b8             	mov    %edx,-0x48(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    23e7:	a1 c8 2b 01 00       	mov    0x12bc8,%eax
    23ec:	83 ec 04             	sub    $0x4,%esp
    23ef:	ff 75 b8             	pushl  -0x48(%ebp)
    23f2:	ff 75 b4             	pushl  -0x4c(%ebp)
    23f5:	50                   	push   %eax
    23f6:	e8 22 16 00 00       	call   3a1d <executeHandler>
    23fb:	83 c4 10             	add    $0x10,%esp
    23fe:	85 c0                	test   %eax,%eax
    2400:	74 14                	je     2416 <main+0x2dd>
				updateWindow(winid, context.addr);
    2402:	a1 80 2a 01 00       	mov    0x12a80,%eax
    2407:	83 ec 08             	sub    $0x8,%esp
    240a:	50                   	push   %eax
    240b:	ff 75 e4             	pushl  -0x1c(%ebp)
    240e:	e8 db 1b 00 00       	call   3fee <updateWindow>
    2413:	83 c4 10             	add    $0x10,%esp
			}
			break;
    2416:	eb 01                	jmp    2419 <main+0x2e0>
		default:
			break;
    2418:	90                   	nop
	list(".");
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	lenOfWaited = 0;
	while (isRun) {
    2419:	a1 00 ea 00 00       	mov    0xea00,%eax
    241e:	85 c0                	test   %eax,%eax
    2420:	0f 85 5f fe ff ff    	jne    2285 <main+0x14c>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    2426:	83 ec 08             	sub    $0x8,%esp
    2429:	ff 75 e4             	pushl  -0x1c(%ebp)
    242c:	68 80 2a 01 00       	push   $0x12a80
    2431:	e8 95 01 00 00       	call   25cb <free_context>
    2436:	83 c4 10             	add    $0x10,%esp
	exit();
    2439:	e8 f8 1a 00 00       	call   3f36 <exit>

0000243e <testHandlers>:
}

void testHandlers() {
    243e:	55                   	push   %ebp
    243f:	89 e5                	mov    %esp,%ebp
    2441:	83 ec 08             	sub    $0x8,%esp

	list(".");
    2444:	83 ec 0c             	sub    $0xc,%esp
    2447:	68 8f a8 00 00       	push   $0xa88f
    244c:	e8 60 dd ff ff       	call   1b1 <list>
    2451:	83 c4 10             	add    $0x10,%esp
	printf(0, "original list:\n");
    2454:	83 ec 08             	sub    $0x8,%esp
    2457:	68 dc aa 00 00       	push   $0xaadc
    245c:	6a 00                	push   $0x0
    245e:	e8 b0 1c 00 00       	call   4113 <printf>
    2463:	83 c4 10             	add    $0x10,%esp
	printItemList();
    2466:	e8 cb e6 ff ff       	call   b36 <printItemList>
	printf(0, "\n");
    246b:	83 ec 08             	sub    $0x8,%esp
    246e:	68 ec aa 00 00       	push   $0xaaec
    2473:	6a 00                	push   $0x0
    2475:	e8 99 1c 00 00       	call   4113 <printf>
    247a:	83 c4 10             	add    $0x10,%esp
	printf(0, "new a folder:\n");
    247d:	83 ec 08             	sub    $0x8,%esp
    2480:	68 ee aa 00 00       	push   $0xaaee
    2485:	6a 00                	push   $0x0
    2487:	e8 87 1c 00 00       	call   4113 <printf>
    248c:	83 c4 10             	add    $0x10,%esp
	newFolder("newfolder");
    248f:	83 ec 0c             	sub    $0xc,%esp
    2492:	68 fd aa 00 00       	push   $0xaafd
    2497:	e8 ba f0 ff ff       	call   1556 <newFolder>
    249c:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    249f:	e8 23 dc ff ff       	call   c7 <freeFileItemList>
	list(".");
    24a4:	83 ec 0c             	sub    $0xc,%esp
    24a7:	68 8f a8 00 00       	push   $0xa88f
    24ac:	e8 00 dd ff ff       	call   1b1 <list>
    24b1:	83 c4 10             	add    $0x10,%esp
	printItemList();
    24b4:	e8 7d e6 ff ff       	call   b36 <printItemList>
	printf(0, "\n");
    24b9:	83 ec 08             	sub    $0x8,%esp
    24bc:	68 ec aa 00 00       	push   $0xaaec
    24c1:	6a 00                	push   $0x0
    24c3:	e8 4b 1c 00 00       	call   4113 <printf>
    24c8:	83 c4 10             	add    $0x10,%esp
	printf(0, "enter new folder:\n");
    24cb:	83 ec 08             	sub    $0x8,%esp
    24ce:	68 07 ab 00 00       	push   $0xab07
    24d3:	6a 00                	push   $0x0
    24d5:	e8 39 1c 00 00       	call   4113 <printf>
    24da:	83 c4 10             	add    $0x10,%esp
	enterDir("newfolder");
    24dd:	83 ec 0c             	sub    $0xc,%esp
    24e0:	68 fd aa 00 00       	push   $0xaafd
    24e5:	e8 37 ed ff ff       	call   1221 <enterDir>
    24ea:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    24ed:	e8 d5 db ff ff       	call   c7 <freeFileItemList>
	list(".");
    24f2:	83 ec 0c             	sub    $0xc,%esp
    24f5:	68 8f a8 00 00       	push   $0xa88f
    24fa:	e8 b2 dc ff ff       	call   1b1 <list>
    24ff:	83 c4 10             	add    $0x10,%esp
	printItemList();
    2502:	e8 2f e6 ff ff       	call   b36 <printItemList>
	printf(0, "\n");
    2507:	83 ec 08             	sub    $0x8,%esp
    250a:	68 ec aa 00 00       	push   $0xaaec
    250f:	6a 00                	push   $0x0
    2511:	e8 fd 1b 00 00       	call   4113 <printf>
    2516:	83 c4 10             	add    $0x10,%esp
	printf(0, "new a file:\n");
    2519:	83 ec 08             	sub    $0x8,%esp
    251c:	68 1a ab 00 00       	push   $0xab1a
    2521:	6a 00                	push   $0x0
    2523:	e8 eb 1b 00 00       	call   4113 <printf>
    2528:	83 c4 10             	add    $0x10,%esp
	newFile("newfile.txt");
    252b:	83 ec 0c             	sub    $0xc,%esp
    252e:	68 27 ab 00 00       	push   $0xab27
    2533:	e8 34 ee ff ff       	call   136c <newFile>
    2538:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    253b:	e8 87 db ff ff       	call   c7 <freeFileItemList>
	list(".");
    2540:	83 ec 0c             	sub    $0xc,%esp
    2543:	68 8f a8 00 00       	push   $0xa88f
    2548:	e8 64 dc ff ff       	call   1b1 <list>
    254d:	83 c4 10             	add    $0x10,%esp
	printItemList();
    2550:	e8 e1 e5 ff ff       	call   b36 <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    2555:	c9                   	leave  
    2556:	c3                   	ret    

00002557 <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    2557:	55                   	push   %ebp
    2558:	89 e5                	mov    %esp,%ebp
    255a:	83 ec 08             	sub    $0x8,%esp
    context_ptr->width = width;
    255d:	8b 45 08             	mov    0x8(%ebp),%eax
    2560:	8b 55 0c             	mov    0xc(%ebp),%edx
    2563:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    2566:	8b 45 08             	mov    0x8(%ebp),%eax
    2569:	8b 55 10             	mov    0x10(%ebp),%edx
    256c:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    256f:	8b 55 0c             	mov    0xc(%ebp),%edx
    2572:	8b 45 10             	mov    0x10(%ebp),%eax
    2575:	0f af c2             	imul   %edx,%eax
    2578:	01 c0                	add    %eax,%eax
    257a:	83 ec 0c             	sub    $0xc,%esp
    257d:	50                   	push   %eax
    257e:	e8 61 1e 00 00       	call   43e4 <malloc>
    2583:	83 c4 10             	add    $0x10,%esp
    2586:	89 c2                	mov    %eax,%edx
    2588:	8b 45 08             	mov    0x8(%ebp),%eax
    258b:	89 10                	mov    %edx,(%eax)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    258d:	8b 55 0c             	mov    0xc(%ebp),%edx
    2590:	8b 45 10             	mov    0x10(%ebp),%eax
    2593:	0f af c2             	imul   %edx,%eax
    2596:	8d 14 00             	lea    (%eax,%eax,1),%edx
    2599:	8b 45 08             	mov    0x8(%ebp),%eax
    259c:	8b 00                	mov    (%eax),%eax
    259e:	83 ec 04             	sub    $0x4,%esp
    25a1:	52                   	push   %edx
    25a2:	6a 00                	push   $0x0
    25a4:	50                   	push   %eax
    25a5:	e8 f2 17 00 00       	call   3d9c <memset>
    25aa:	83 c4 10             	add    $0x10,%esp
    initializeASCII();
    25ad:	e8 73 01 00 00       	call   2725 <initializeASCII>
    initializeGBK();
    25b2:	e8 f4 02 00 00       	call   28ab <initializeGBK>
    return createWindow(0, 0, width, height);
    25b7:	ff 75 10             	pushl  0x10(%ebp)
    25ba:	ff 75 0c             	pushl  0xc(%ebp)
    25bd:	6a 00                	push   $0x0
    25bf:	6a 00                	push   $0x0
    25c1:	e8 18 1a 00 00       	call   3fde <createWindow>
    25c6:	83 c4 10             	add    $0x10,%esp
}
    25c9:	c9                   	leave  
    25ca:	c3                   	ret    

000025cb <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    25cb:	55                   	push   %ebp
    25cc:	89 e5                	mov    %esp,%ebp
    25ce:	83 ec 08             	sub    $0x8,%esp
    free(context_ptr->addr);
    25d1:	8b 45 08             	mov    0x8(%ebp),%eax
    25d4:	8b 00                	mov    (%eax),%eax
    25d6:	83 ec 0c             	sub    $0xc,%esp
    25d9:	50                   	push   %eax
    25da:	e8 c4 1c 00 00       	call   42a3 <free>
    25df:	83 c4 10             	add    $0x10,%esp
    freeASCII();
    25e2:	e8 ab 02 00 00       	call   2892 <freeASCII>
    freeGBK();
    25e7:	e8 60 03 00 00       	call   294c <freeGBK>
    destroyWindow(winid);
    25ec:	83 ec 0c             	sub    $0xc,%esp
    25ef:	ff 75 0c             	pushl  0xc(%ebp)
    25f2:	e8 ef 19 00 00       	call   3fe6 <destroyWindow>
    25f7:	83 c4 10             	add    $0x10,%esp
}
    25fa:	c9                   	leave  
    25fb:	c3                   	ret    

000025fc <draw_point>:
*             then do nothing!
*/

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    25fc:	55                   	push   %ebp
    25fd:	89 e5                	mov    %esp,%ebp
    25ff:	83 ec 04             	sub    $0x4,%esp
    2602:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2605:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width) 
    2609:	8b 45 0c             	mov    0xc(%ebp),%eax
    260c:	3b 45 14             	cmp    0x14(%ebp),%eax
    260f:	77 02                	ja     2613 <draw_point+0x17>
    return;
    2611:	eb 26                	jmp    2639 <draw_point+0x3d>
  if(y >= c.height)
    2613:	8b 45 10             	mov    0x10(%ebp),%eax
    2616:	3b 45 18             	cmp    0x18(%ebp),%eax
    2619:	77 02                	ja     261d <draw_point+0x21>
    return;
    261b:	eb 1c                	jmp    2639 <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    261d:	8b 45 08             	mov    0x8(%ebp),%eax
    2620:	8b 55 0c             	mov    0xc(%ebp),%edx
    2623:	89 d1                	mov    %edx,%ecx
    2625:	0f af 4d 18          	imul   0x18(%ebp),%ecx
    2629:	8b 55 14             	mov    0x14(%ebp),%edx
    262c:	01 ca                	add    %ecx,%edx
    262e:	01 d2                	add    %edx,%edx
    2630:	01 c2                	add    %eax,%edx
    2632:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    2636:	66 89 02             	mov    %ax,(%edx)
}
    2639:	c9                   	leave  
    263a:	c3                   	ret    

0000263b <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    263b:	55                   	push   %ebp
    263c:	89 e5                	mov    %esp,%ebp
    263e:	83 ec 14             	sub    $0x14,%esp
    2641:	8b 45 24             	mov    0x24(%ebp),%eax
    2644:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    2648:	8b 55 14             	mov    0x14(%ebp),%edx
    264b:	8b 45 1c             	mov    0x1c(%ebp),%eax
    264e:	01 d0                	add    %edx,%eax
    2650:	8b 55 0c             	mov    0xc(%ebp),%edx
    2653:	39 d0                	cmp    %edx,%eax
    2655:	0f 47 c2             	cmova  %edx,%eax
    2658:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height; 
    265b:	8b 55 18             	mov    0x18(%ebp),%edx
    265e:	8b 45 20             	mov    0x20(%ebp),%eax
    2661:	01 d0                	add    %edx,%eax
    2663:	8b 55 10             	mov    0x10(%ebp),%edx
    2666:	39 d0                	cmp    %edx,%eax
    2668:	0f 47 c2             	cmova  %edx,%eax
    266b:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    266e:	8b 45 18             	mov    0x18(%ebp),%eax
    2671:	89 45 f8             	mov    %eax,-0x8(%ebp)
    2674:	eb 36                	jmp    26ac <fill_rect+0x71>
	{
		for (x = bx; x < mx; x++)
    2676:	8b 45 14             	mov    0x14(%ebp),%eax
    2679:	89 45 fc             	mov    %eax,-0x4(%ebp)
    267c:	eb 22                	jmp    26a0 <fill_rect+0x65>
		{
			draw_point(c, x, y, color);
    267e:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    2682:	8b 55 f8             	mov    -0x8(%ebp),%edx
    2685:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2688:	51                   	push   %ecx
    2689:	52                   	push   %edx
    268a:	50                   	push   %eax
    268b:	ff 75 10             	pushl  0x10(%ebp)
    268e:	ff 75 0c             	pushl  0xc(%ebp)
    2691:	ff 75 08             	pushl  0x8(%ebp)
    2694:	e8 63 ff ff ff       	call   25fc <draw_point>
    2699:	83 c4 18             	add    $0x18,%esp
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    269c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    26a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    26a3:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    26a6:	7c d6                	jl     267e <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
    26a8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    26ac:	8b 45 f8             	mov    -0x8(%ebp),%eax
    26af:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    26b2:	7c c2                	jl     2676 <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    26b4:	c9                   	leave  
    26b5:	c3                   	ret    

000026b6 <printBinary>:

void printBinary(char c)
{
    26b6:	55                   	push   %ebp
    26b7:	89 e5                	mov    %esp,%ebp
    26b9:	83 ec 28             	sub    $0x28,%esp
    26bc:	8b 45 08             	mov    0x8(%ebp),%eax
    26bf:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    26c2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    26c9:	eb 40                	jmp    270b <printBinary+0x55>
	{
		if(((c << i) & 0x80) != 0)
    26cb:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    26cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26d2:	89 c1                	mov    %eax,%ecx
    26d4:	d3 e2                	shl    %cl,%edx
    26d6:	89 d0                	mov    %edx,%eax
    26d8:	25 80 00 00 00       	and    $0x80,%eax
    26dd:	85 c0                	test   %eax,%eax
    26df:	74 14                	je     26f5 <printBinary+0x3f>
		{
			printf(0, "1");
    26e1:	83 ec 08             	sub    $0x8,%esp
    26e4:	68 33 ab 00 00       	push   $0xab33
    26e9:	6a 00                	push   $0x0
    26eb:	e8 23 1a 00 00       	call   4113 <printf>
    26f0:	83 c4 10             	add    $0x10,%esp
    26f3:	eb 12                	jmp    2707 <printBinary+0x51>
		}
		else
		{
			printf(0, "0");
    26f5:	83 ec 08             	sub    $0x8,%esp
    26f8:	68 35 ab 00 00       	push   $0xab35
    26fd:	6a 00                	push   $0x0
    26ff:	e8 0f 1a 00 00       	call   4113 <printf>
    2704:	83 c4 10             	add    $0x10,%esp
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    2707:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    270b:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    270f:	7e ba                	jle    26cb <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    2711:	83 ec 08             	sub    $0x8,%esp
    2714:	68 37 ab 00 00       	push   $0xab37
    2719:	6a 00                	push   $0x0
    271b:	e8 f3 19 00 00       	call   4113 <printf>
    2720:	83 c4 10             	add    $0x10,%esp
}
    2723:	c9                   	leave  
    2724:	c3                   	ret    

00002725 <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    2725:	55                   	push   %ebp
    2726:	89 e5                	mov    %esp,%ebp
    2728:	56                   	push   %esi
    2729:	53                   	push   %ebx
    272a:	83 ec 20             	sub    $0x20,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    272d:	83 ec 08             	sub    $0x8,%esp
    2730:	68 39 ab 00 00       	push   $0xab39
    2735:	6a 00                	push   $0x0
    2737:	e8 d7 19 00 00       	call   4113 <printf>
    273c:	83 c4 10             	add    $0x10,%esp
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    273f:	83 ec 08             	sub    $0x8,%esp
    2742:	6a 00                	push   $0x0
    2744:	68 4c ab 00 00       	push   $0xab4c
    2749:	e8 28 18 00 00       	call   3f76 <open>
    274e:	83 c4 10             	add    $0x10,%esp
    2751:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2754:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2758:	79 1c                	jns    2776 <initializeASCII+0x51>
	  printf(0,"cannot open %s\n", HANKAKU);
    275a:	83 ec 04             	sub    $0x4,%esp
    275d:	68 4c ab 00 00       	push   $0xab4c
    2762:	68 58 ab 00 00       	push   $0xab58
    2767:	6a 00                	push   $0x0
    2769:	e8 a5 19 00 00       	call   4113 <printf>
    276e:	83 c4 10             	add    $0x10,%esp
	  return;
    2771:	e9 15 01 00 00       	jmp    288b <initializeASCII+0x166>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    2776:	83 ec 0c             	sub    $0xc,%esp
    2779:	68 00 10 00 00       	push   $0x1000
    277e:	e8 61 1c 00 00       	call   43e4 <malloc>
    2783:	83 c4 10             	add    $0x10,%esp
    2786:	a3 00 2c 01 00       	mov    %eax,0x12c00
	for (i = 0; i < ASCII_NUM; i++)
    278b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2792:	eb 12                	jmp    27a6 <initializeASCII+0x81>
	{
		hankaku[i] = 0;
    2794:	8b 15 00 2c 01 00    	mov    0x12c00,%edx
    279a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    279d:	01 d0                	add    %edx,%eax
    279f:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    27a2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    27a6:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    27ad:	7e e5                	jle    2794 <initializeASCII+0x6f>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    27af:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    27b6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    27bd:	e9 84 00 00 00       	jmp    2846 <initializeASCII+0x121>
	{
		for (i = 0; i < n; i++){
    27c2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    27c9:	eb 73                	jmp    283e <initializeASCII+0x119>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    27cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27ce:	05 40 2c 01 00       	add    $0x12c40,%eax
    27d3:	0f b6 00             	movzbl (%eax),%eax
    27d6:	3c 2a                	cmp    $0x2a,%al
    27d8:	74 0f                	je     27e9 <initializeASCII+0xc4>
    27da:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27dd:	05 40 2c 01 00       	add    $0x12c40,%eax
    27e2:	0f b6 00             	movzbl (%eax),%eax
    27e5:	3c 2e                	cmp    $0x2e,%al
    27e7:	75 51                	jne    283a <initializeASCII+0x115>
			{
				if (buf[i] == '*')
    27e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27ec:	05 40 2c 01 00       	add    $0x12c40,%eax
    27f1:	0f b6 00             	movzbl (%eax),%eax
    27f4:	3c 2a                	cmp    $0x2a,%al
    27f6:	75 2d                	jne    2825 <initializeASCII+0x100>
				{
					hankaku[y] |= (0x80 >> x);
    27f8:	8b 15 00 2c 01 00    	mov    0x12c00,%edx
    27fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2801:	01 c2                	add    %eax,%edx
    2803:	8b 0d 00 2c 01 00    	mov    0x12c00,%ecx
    2809:	8b 45 ec             	mov    -0x14(%ebp),%eax
    280c:	01 c8                	add    %ecx,%eax
    280e:	0f b6 00             	movzbl (%eax),%eax
    2811:	89 c3                	mov    %eax,%ebx
    2813:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2816:	be 80 00 00 00       	mov    $0x80,%esi
    281b:	89 c1                	mov    %eax,%ecx
    281d:	d3 fe                	sar    %cl,%esi
    281f:	89 f0                	mov    %esi,%eax
    2821:	09 d8                	or     %ebx,%eax
    2823:	88 02                	mov    %al,(%edx)
				}
				x ++;
    2825:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    2829:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    282d:	7e 0b                	jle    283a <initializeASCII+0x115>
				{
					x = 0;
    282f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    2836:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    283a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    283e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2841:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    2844:	7c 85                	jl     27cb <initializeASCII+0xa6>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    2846:	83 ec 04             	sub    $0x4,%esp
    2849:	68 00 02 00 00       	push   $0x200
    284e:	68 40 2c 01 00       	push   $0x12c40
    2853:	ff 75 e8             	pushl  -0x18(%ebp)
    2856:	e8 f3 16 00 00       	call   3f4e <read>
    285b:	83 c4 10             	add    $0x10,%esp
    285e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2861:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2865:	0f 8f 57 ff ff ff    	jg     27c2 <initializeASCII+0x9d>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    286b:	83 ec 08             	sub    $0x8,%esp
    286e:	68 68 ab 00 00       	push   $0xab68
    2873:	6a 00                	push   $0x0
    2875:	e8 99 18 00 00       	call   4113 <printf>
    287a:	83 c4 10             	add    $0x10,%esp
	close(fd);
    287d:	83 ec 0c             	sub    $0xc,%esp
    2880:	ff 75 e8             	pushl  -0x18(%ebp)
    2883:	e8 d6 16 00 00       	call   3f5e <close>
    2888:	83 c4 10             	add    $0x10,%esp
}
    288b:	8d 65 f8             	lea    -0x8(%ebp),%esp
    288e:	5b                   	pop    %ebx
    288f:	5e                   	pop    %esi
    2890:	5d                   	pop    %ebp
    2891:	c3                   	ret    

00002892 <freeASCII>:

void freeASCII(){
    2892:	55                   	push   %ebp
    2893:	89 e5                	mov    %esp,%ebp
    2895:	83 ec 08             	sub    $0x8,%esp
	free(hankaku);
    2898:	a1 00 2c 01 00       	mov    0x12c00,%eax
    289d:	83 ec 0c             	sub    $0xc,%esp
    28a0:	50                   	push   %eax
    28a1:	e8 fd 19 00 00       	call   42a3 <free>
    28a6:	83 c4 10             	add    $0x10,%esp
}
    28a9:	c9                   	leave  
    28aa:	c3                   	ret    

000028ab <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    28ab:	55                   	push   %ebp
    28ac:	89 e5                	mov    %esp,%ebp
    28ae:	83 ec 18             	sub    $0x18,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    28b1:	83 ec 08             	sub    $0x8,%esp
    28b4:	68 85 ab 00 00       	push   $0xab85
    28b9:	6a 00                	push   $0x0
    28bb:	e8 53 18 00 00       	call   4113 <printf>
    28c0:	83 c4 10             	add    $0x10,%esp
	if((fd = open(HZK16, 0)) < 0){
    28c3:	83 ec 08             	sub    $0x8,%esp
    28c6:	6a 00                	push   $0x0
    28c8:	68 96 ab 00 00       	push   $0xab96
    28cd:	e8 a4 16 00 00       	call   3f76 <open>
    28d2:	83 c4 10             	add    $0x10,%esp
    28d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    28d8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    28dc:	79 19                	jns    28f7 <initializeGBK+0x4c>
		printf(0,"cannot open %s\n", HZK16);
    28de:	83 ec 04             	sub    $0x4,%esp
    28e1:	68 96 ab 00 00       	push   $0xab96
    28e6:	68 58 ab 00 00       	push   $0xab58
    28eb:	6a 00                	push   $0x0
    28ed:	e8 21 18 00 00       	call   4113 <printf>
    28f2:	83 c4 10             	add    $0x10,%esp
		return;
    28f5:	eb 53                	jmp    294a <initializeGBK+0x9f>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    28f7:	83 ec 0c             	sub    $0xc,%esp
    28fa:	68 78 69 00 00       	push   $0x6978
    28ff:	e8 e0 1a 00 00       	call   43e4 <malloc>
    2904:	83 c4 10             	add    $0x10,%esp
    2907:	a3 04 2c 01 00       	mov    %eax,0x12c04
	fontFile.size = read(fd, fontFile.buf, 27000);
    290c:	a1 04 2c 01 00       	mov    0x12c04,%eax
    2911:	83 ec 04             	sub    $0x4,%esp
    2914:	68 78 69 00 00       	push   $0x6978
    2919:	50                   	push   %eax
    291a:	ff 75 f4             	pushl  -0xc(%ebp)
    291d:	e8 2c 16 00 00       	call   3f4e <read>
    2922:	83 c4 10             	add    $0x10,%esp
    2925:	a3 08 2c 01 00       	mov    %eax,0x12c08
	printf(0,"initialzing gbk complete!\n");
    292a:	83 ec 08             	sub    $0x8,%esp
    292d:	68 a0 ab 00 00       	push   $0xaba0
    2932:	6a 00                	push   $0x0
    2934:	e8 da 17 00 00       	call   4113 <printf>
    2939:	83 c4 10             	add    $0x10,%esp
	close(fd);
    293c:	83 ec 0c             	sub    $0xc,%esp
    293f:	ff 75 f4             	pushl  -0xc(%ebp)
    2942:	e8 17 16 00 00       	call   3f5e <close>
    2947:	83 c4 10             	add    $0x10,%esp
}
    294a:	c9                   	leave  
    294b:	c3                   	ret    

0000294c <freeGBK>:

void freeGBK(){
    294c:	55                   	push   %ebp
    294d:	89 e5                	mov    %esp,%ebp
    294f:	83 ec 08             	sub    $0x8,%esp
	free(fontFile.buf);
    2952:	a1 04 2c 01 00       	mov    0x12c04,%eax
    2957:	83 ec 0c             	sub    $0xc,%esp
    295a:	50                   	push   %eax
    295b:	e8 43 19 00 00       	call   42a3 <free>
    2960:	83 c4 10             	add    $0x10,%esp
}
    2963:	c9                   	leave  
    2964:	c3                   	ret    

00002965 <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    2965:	55                   	push   %ebp
    2966:	89 e5                	mov    %esp,%ebp
    2968:	53                   	push   %ebx
    2969:	83 ec 18             	sub    $0x18,%esp
    296c:	8b 55 14             	mov    0x14(%ebp),%edx
    296f:	8b 45 18             	mov    0x18(%ebp),%eax
    2972:	88 55 e8             	mov    %dl,-0x18(%ebp)
    2975:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    2979:	8b 45 20             	mov    0x20(%ebp),%eax
    297c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    297f:	eb 6b                	jmp    29ec <put_ascii+0x87>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    2981:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2988:	eb 58                	jmp    29e2 <put_ascii+0x7d>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    298a:	8b 15 00 2c 01 00    	mov    0x12c00,%edx
    2990:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
    2994:	c1 e0 04             	shl    $0x4,%eax
    2997:	89 c1                	mov    %eax,%ecx
    2999:	8b 45 f4             	mov    -0xc(%ebp),%eax
    299c:	2b 45 20             	sub    0x20(%ebp),%eax
    299f:	01 c8                	add    %ecx,%eax
    29a1:	01 d0                	add    %edx,%eax
    29a3:	0f b6 00             	movzbl (%eax),%eax
    29a6:	0f b6 d0             	movzbl %al,%edx
    29a9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    29ac:	89 c1                	mov    %eax,%ecx
    29ae:	d3 e2                	shl    %cl,%edx
    29b0:	89 d0                	mov    %edx,%eax
    29b2:	25 80 00 00 00       	and    $0x80,%eax
    29b7:	85 c0                	test   %eax,%eax
    29b9:	74 23                	je     29de <put_ascii+0x79>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    29bb:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    29bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29c2:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    29c5:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    29c8:	01 d9                	add    %ebx,%ecx
    29ca:	52                   	push   %edx
    29cb:	50                   	push   %eax
    29cc:	51                   	push   %ecx
    29cd:	ff 75 10             	pushl  0x10(%ebp)
    29d0:	ff 75 0c             	pushl  0xc(%ebp)
    29d3:	ff 75 08             	pushl  0x8(%ebp)
    29d6:	e8 21 fc ff ff       	call   25fc <draw_point>
    29db:	83 c4 18             	add    $0x18,%esp
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    29de:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    29e2:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    29e6:	7e a2                	jle    298a <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    29e8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    29ec:	8b 45 20             	mov    0x20(%ebp),%eax
    29ef:	83 c0 10             	add    $0x10,%eax
    29f2:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    29f5:	7f 8a                	jg     2981 <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    29f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    29fa:	c9                   	leave  
    29fb:	c3                   	ret    

000029fc <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    29fc:	55                   	push   %ebp
    29fd:	89 e5                	mov    %esp,%ebp
    29ff:	53                   	push   %ebx
    2a00:	83 ec 18             	sub    $0x18,%esp
    2a03:	8b 55 14             	mov    0x14(%ebp),%edx
    2a06:	8b 45 18             	mov    0x18(%ebp),%eax
    2a09:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    2a0d:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    2a11:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    2a15:	0f b6 c0             	movzbl %al,%eax
    2a18:	3d a0 00 00 00       	cmp    $0xa0,%eax
    2a1d:	0f 8e 1e 01 00 00    	jle    2b41 <put_gbk+0x145>
    2a23:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2a27:	66 c1 f8 08          	sar    $0x8,%ax
    2a2b:	98                   	cwtl   
    2a2c:	0f b6 c0             	movzbl %al,%eax
    2a2f:	3d a0 00 00 00       	cmp    $0xa0,%eax
    2a34:	0f 8e 07 01 00 00    	jle    2b41 <put_gbk+0x145>
		hzk16Base = fontFile.buf;
    2a3a:	a1 04 2c 01 00       	mov    0x12c04,%eax
    2a3f:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    2a42:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    2a46:	0f b6 c0             	movzbl %al,%eax
    2a49:	2d a1 00 00 00       	sub    $0xa1,%eax
    2a4e:	6b c0 5e             	imul   $0x5e,%eax,%eax
    2a51:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    2a55:	66 c1 fa 08          	sar    $0x8,%dx
    2a59:	0f bf d2             	movswl %dx,%edx
    2a5c:	0f b6 d2             	movzbl %dl,%edx
    2a5f:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    2a65:	01 d0                	add    %edx,%eax
    2a67:	c1 e0 05             	shl    $0x5,%eax
    2a6a:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    2a6d:	8b 45 20             	mov    0x20(%ebp),%eax
    2a70:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2a73:	e9 b8 00 00 00       	jmp    2b30 <put_gbk+0x134>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2a78:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2a7f:	eb 47                	jmp    2ac8 <put_gbk+0xcc>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    2a81:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2a84:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a87:	01 d0                	add    %edx,%eax
    2a89:	0f b6 00             	movzbl (%eax),%eax
    2a8c:	0f b6 d0             	movzbl %al,%edx
    2a8f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2a92:	89 c1                	mov    %eax,%ecx
    2a94:	d3 e2                	shl    %cl,%edx
    2a96:	89 d0                	mov    %edx,%eax
    2a98:	25 80 00 00 00       	and    $0x80,%eax
    2a9d:	85 c0                	test   %eax,%eax
    2a9f:	74 23                	je     2ac4 <put_gbk+0xc8>
					draw_point(c, x + tmpX, tmpY, colorNum);
    2aa1:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2aa5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2aa8:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2aab:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    2aae:	01 d9                	add    %ebx,%ecx
    2ab0:	52                   	push   %edx
    2ab1:	50                   	push   %eax
    2ab2:	51                   	push   %ecx
    2ab3:	ff 75 10             	pushl  0x10(%ebp)
    2ab6:	ff 75 0c             	pushl  0xc(%ebp)
    2ab9:	ff 75 08             	pushl  0x8(%ebp)
    2abc:	e8 3b fb ff ff       	call   25fc <draw_point>
    2ac1:	83 c4 18             	add    $0x18,%esp
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2ac4:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2ac8:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2acc:	7e b3                	jle    2a81 <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    2ace:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2ad2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2ad9:	eb 47                	jmp    2b22 <put_gbk+0x126>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    2adb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2ade:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2ae1:	01 d0                	add    %edx,%eax
    2ae3:	0f b6 00             	movzbl (%eax),%eax
    2ae6:	0f b6 d0             	movzbl %al,%edx
    2ae9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2aec:	89 c1                	mov    %eax,%ecx
    2aee:	d3 e2                	shl    %cl,%edx
    2af0:	89 d0                	mov    %edx,%eax
    2af2:	25 80 00 00 00       	and    $0x80,%eax
    2af7:	85 c0                	test   %eax,%eax
    2af9:	74 23                	je     2b1e <put_gbk+0x122>
					draw_point(c, x + tmpX, tmpY, colorNum);
    2afb:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2aff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b02:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2b05:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    2b08:	01 d9                	add    %ebx,%ecx
    2b0a:	52                   	push   %edx
    2b0b:	50                   	push   %eax
    2b0c:	51                   	push   %ecx
    2b0d:	ff 75 10             	pushl  0x10(%ebp)
    2b10:	ff 75 0c             	pushl  0xc(%ebp)
    2b13:	ff 75 08             	pushl  0x8(%ebp)
    2b16:	e8 e1 fa ff ff       	call   25fc <draw_point>
    2b1b:	83 c4 18             	add    $0x18,%esp
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2b1e:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2b22:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2b26:	7e b3                	jle    2adb <put_gbk+0xdf>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    2b28:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    2b2c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2b30:	8b 45 20             	mov    0x20(%ebp),%eax
    2b33:	83 c0 10             	add    $0x10,%eax
    2b36:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2b39:	0f 8f 39 ff ff ff    	jg     2a78 <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    2b3f:	eb 50                	jmp    2b91 <put_gbk+0x195>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    2b41:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2b45:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2b49:	0f b6 c0             	movzbl %al,%eax
    2b4c:	ff 75 20             	pushl  0x20(%ebp)
    2b4f:	ff 75 1c             	pushl  0x1c(%ebp)
    2b52:	52                   	push   %edx
    2b53:	50                   	push   %eax
    2b54:	ff 75 10             	pushl  0x10(%ebp)
    2b57:	ff 75 0c             	pushl  0xc(%ebp)
    2b5a:	ff 75 08             	pushl  0x8(%ebp)
    2b5d:	e8 03 fe ff ff       	call   2965 <put_ascii>
    2b62:	83 c4 1c             	add    $0x1c,%esp
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    2b65:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2b68:	8d 48 08             	lea    0x8(%eax),%ecx
    2b6b:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2b6f:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2b73:	66 c1 f8 08          	sar    $0x8,%ax
    2b77:	0f b6 c0             	movzbl %al,%eax
    2b7a:	ff 75 20             	pushl  0x20(%ebp)
    2b7d:	51                   	push   %ecx
    2b7e:	52                   	push   %edx
    2b7f:	50                   	push   %eax
    2b80:	ff 75 10             	pushl  0x10(%ebp)
    2b83:	ff 75 0c             	pushl  0xc(%ebp)
    2b86:	ff 75 08             	pushl  0x8(%ebp)
    2b89:	e8 d7 fd ff ff       	call   2965 <put_ascii>
    2b8e:	83 c4 1c             	add    $0x1c,%esp
	}
}
    2b91:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2b94:	c9                   	leave  
    2b95:	c3                   	ret    

00002b96 <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    2b96:	55                   	push   %ebp
    2b97:	89 e5                	mov    %esp,%ebp
    2b99:	83 ec 28             	sub    $0x28,%esp
    2b9c:	8b 45 18             	mov    0x18(%ebp),%eax
    2b9f:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    2ba3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    2baa:	83 ec 0c             	sub    $0xc,%esp
    2bad:	ff 75 14             	pushl  0x14(%ebp)
    2bb0:	e8 c0 11 00 00       	call   3d75 <strlen>
    2bb5:	83 c4 10             	add    $0x10,%esp
    2bb8:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    2bbb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2bc2:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2bc5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2bc8:	eb 36                	jmp    2c00 <puts_str+0x6a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    2bca:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2bce:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2bd1:	8b 45 14             	mov    0x14(%ebp),%eax
    2bd4:	01 c8                	add    %ecx,%eax
    2bd6:	0f b6 00             	movzbl (%eax),%eax
    2bd9:	0f b6 c0             	movzbl %al,%eax
    2bdc:	83 ec 04             	sub    $0x4,%esp
    2bdf:	ff 75 20             	pushl  0x20(%ebp)
    2be2:	ff 75 f0             	pushl  -0x10(%ebp)
    2be5:	52                   	push   %edx
    2be6:	50                   	push   %eax
    2be7:	ff 75 10             	pushl  0x10(%ebp)
    2bea:	ff 75 0c             	pushl  0xc(%ebp)
    2bed:	ff 75 08             	pushl  0x8(%ebp)
    2bf0:	e8 70 fd ff ff       	call   2965 <put_ascii>
    2bf5:	83 c4 20             	add    $0x20,%esp
			xTmp += 8;
    2bf8:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    2bfc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    2c00:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c03:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    2c06:	72 c2                	jb     2bca <puts_str+0x34>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    2c08:	c9                   	leave  
    2c09:	c3                   	ret    

00002c0a <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    2c0a:	55                   	push   %ebp
    2c0b:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    2c0d:	8b 45 10             	mov    0x10(%ebp),%eax
    2c10:	8d 50 07             	lea    0x7(%eax),%edx
    2c13:	85 c0                	test   %eax,%eax
    2c15:	0f 48 c2             	cmovs  %edx,%eax
    2c18:	c1 f8 03             	sar    $0x3,%eax
    2c1b:	89 c1                	mov    %eax,%ecx
    2c1d:	8b 45 0c             	mov    0xc(%ebp),%eax
    2c20:	8d 50 03             	lea    0x3(%eax),%edx
    2c23:	85 c0                	test   %eax,%eax
    2c25:	0f 48 c2             	cmovs  %edx,%eax
    2c28:	c1 f8 02             	sar    $0x2,%eax
    2c2b:	c1 e0 05             	shl    $0x5,%eax
    2c2e:	01 c1                	add    %eax,%ecx
    2c30:	8b 45 08             	mov    0x8(%ebp),%eax
    2c33:	8d 50 07             	lea    0x7(%eax),%edx
    2c36:	85 c0                	test   %eax,%eax
    2c38:	0f 48 c2             	cmovs  %edx,%eax
    2c3b:	c1 f8 03             	sar    $0x3,%eax
    2c3e:	c1 e0 0b             	shl    $0xb,%eax
    2c41:	01 c8                	add    %ecx,%eax
}
    2c43:	5d                   	pop    %ebp
    2c44:	c3                   	ret    

00002c45 <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    2c45:	55                   	push   %ebp
    2c46:	89 e5                	mov    %esp,%ebp
    2c48:	53                   	push   %ebx
    2c49:	83 ec 10             	sub    $0x10,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    2c4c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2c53:	e9 98 00 00 00       	jmp    2cf0 <draw_picture+0xab>
	{
		for (j = 0; j < pic.width; j++)
    2c58:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2c5f:	eb 7f                	jmp    2ce0 <draw_picture+0x9b>
		{
			rgb = pic.data[i*pic.width+j];
    2c61:	8b 55 14             	mov    0x14(%ebp),%edx
    2c64:	8b 45 18             	mov    0x18(%ebp),%eax
    2c67:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    2c6b:	89 c1                	mov    %eax,%ecx
    2c6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c70:	01 c8                	add    %ecx,%eax
    2c72:	c1 e0 02             	shl    $0x2,%eax
    2c75:	01 d0                	add    %edx,%eax
    2c77:	8b 00                	mov    (%eax),%eax
    2c79:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    2c7c:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    2c80:	3c 01                	cmp    $0x1,%al
    2c82:	75 02                	jne    2c86 <draw_picture+0x41>
    2c84:	eb 56                	jmp    2cdc <draw_picture+0x97>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    2c86:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    2c8a:	0f b6 c8             	movzbl %al,%ecx
    2c8d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    2c91:	0f b6 d0             	movzbl %al,%edx
    2c94:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    2c98:	0f b6 c0             	movzbl %al,%eax
    2c9b:	51                   	push   %ecx
    2c9c:	52                   	push   %edx
    2c9d:	50                   	push   %eax
    2c9e:	e8 67 ff ff ff       	call   2c0a <_RGB16BIT565>
    2ca3:	83 c4 0c             	add    $0xc,%esp
    2ca6:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    2caa:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
    2cae:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2cb1:	83 ea 01             	sub    $0x1,%edx
    2cb4:	89 d1                	mov    %edx,%ecx
    2cb6:	2b 4d f8             	sub    -0x8(%ebp),%ecx
    2cb9:	8b 55 24             	mov    0x24(%ebp),%edx
    2cbc:	01 ca                	add    %ecx,%edx
    2cbe:	89 d3                	mov    %edx,%ebx
    2cc0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2cc3:	8b 55 20             	mov    0x20(%ebp),%edx
    2cc6:	01 ca                	add    %ecx,%edx
    2cc8:	50                   	push   %eax
    2cc9:	53                   	push   %ebx
    2cca:	52                   	push   %edx
    2ccb:	ff 75 10             	pushl  0x10(%ebp)
    2cce:	ff 75 0c             	pushl  0xc(%ebp)
    2cd1:	ff 75 08             	pushl  0x8(%ebp)
    2cd4:	e8 23 f9 ff ff       	call   25fc <draw_point>
    2cd9:	83 c4 18             	add    $0x18,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    2cdc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2ce0:	8b 45 18             	mov    0x18(%ebp),%eax
    2ce3:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2ce6:	0f 8f 75 ff ff ff    	jg     2c61 <draw_picture+0x1c>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    2cec:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2cf0:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2cf3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    2cf6:	0f 8f 5c ff ff ff    	jg     2c58 <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    2cfc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2cff:	c9                   	leave  
    2d00:	c3                   	ret    

00002d01 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    2d01:	55                   	push   %ebp
    2d02:	89 e5                	mov    %esp,%ebp
    2d04:	83 ec 24             	sub    $0x24,%esp
    2d07:	8b 45 24             	mov    0x24(%ebp),%eax
    2d0a:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    2d0e:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2d11:	2b 45 14             	sub    0x14(%ebp),%eax
    2d14:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    2d17:	8b 45 20             	mov    0x20(%ebp),%eax
    2d1a:	2b 45 18             	sub    0x18(%ebp),%eax
    2d1d:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    2d20:	8b 45 14             	mov    0x14(%ebp),%eax
    2d23:	c1 e0 0a             	shl    $0xa,%eax
    2d26:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    2d29:	8b 45 18             	mov    0x18(%ebp),%eax
    2d2c:	c1 e0 0a             	shl    $0xa,%eax
    2d2f:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    2d32:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2d35:	c1 f8 1f             	sar    $0x1f,%eax
    2d38:	31 45 fc             	xor    %eax,-0x4(%ebp)
    2d3b:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    2d3e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2d41:	c1 f8 1f             	sar    $0x1f,%eax
    2d44:	31 45 f8             	xor    %eax,-0x8(%ebp)
    2d47:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    2d4a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2d4d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    2d50:	7c 4f                	jl     2da1 <draw_line+0xa0>
		len = dx + 1;
    2d52:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2d55:	83 c0 01             	add    $0x1,%eax
    2d58:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    2d5b:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2d5e:	3b 45 14             	cmp    0x14(%ebp),%eax
    2d61:	7e 07                	jle    2d6a <draw_line+0x69>
    2d63:	b8 00 04 00 00       	mov    $0x400,%eax
    2d68:	eb 05                	jmp    2d6f <draw_line+0x6e>
    2d6a:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    2d6f:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    2d72:	8b 45 20             	mov    0x20(%ebp),%eax
    2d75:	3b 45 18             	cmp    0x18(%ebp),%eax
    2d78:	7c 12                	jl     2d8c <draw_line+0x8b>
    2d7a:	8b 45 20             	mov    0x20(%ebp),%eax
    2d7d:	2b 45 18             	sub    0x18(%ebp),%eax
    2d80:	83 c0 01             	add    $0x1,%eax
    2d83:	c1 e0 0a             	shl    $0xa,%eax
    2d86:	99                   	cltd   
    2d87:	f7 7d ec             	idivl  -0x14(%ebp)
    2d8a:	eb 10                	jmp    2d9c <draw_line+0x9b>
    2d8c:	8b 45 20             	mov    0x20(%ebp),%eax
    2d8f:	2b 45 18             	sub    0x18(%ebp),%eax
    2d92:	83 e8 01             	sub    $0x1,%eax
    2d95:	c1 e0 0a             	shl    $0xa,%eax
    2d98:	99                   	cltd   
    2d99:	f7 7d ec             	idivl  -0x14(%ebp)
    2d9c:	89 45 f8             	mov    %eax,-0x8(%ebp)
    2d9f:	eb 4d                	jmp    2dee <draw_line+0xed>
	}
	else {
		len = dy + 1;
    2da1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2da4:	83 c0 01             	add    $0x1,%eax
    2da7:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    2daa:	8b 45 20             	mov    0x20(%ebp),%eax
    2dad:	3b 45 18             	cmp    0x18(%ebp),%eax
    2db0:	7e 07                	jle    2db9 <draw_line+0xb8>
    2db2:	b8 00 04 00 00       	mov    $0x400,%eax
    2db7:	eb 05                	jmp    2dbe <draw_line+0xbd>
    2db9:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    2dbe:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    2dc1:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2dc4:	3b 45 14             	cmp    0x14(%ebp),%eax
    2dc7:	7c 12                	jl     2ddb <draw_line+0xda>
    2dc9:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2dcc:	2b 45 14             	sub    0x14(%ebp),%eax
    2dcf:	83 c0 01             	add    $0x1,%eax
    2dd2:	c1 e0 0a             	shl    $0xa,%eax
    2dd5:	99                   	cltd   
    2dd6:	f7 7d ec             	idivl  -0x14(%ebp)
    2dd9:	eb 10                	jmp    2deb <draw_line+0xea>
    2ddb:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2dde:	2b 45 14             	sub    0x14(%ebp),%eax
    2de1:	83 e8 01             	sub    $0x1,%eax
    2de4:	c1 e0 0a             	shl    $0xa,%eax
    2de7:	99                   	cltd   
    2de8:	f7 7d ec             	idivl  -0x14(%ebp)
    2deb:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    2dee:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    2df5:	eb 36                	jmp    2e2d <draw_line+0x12c>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    2df7:	0f b7 45 dc          	movzwl -0x24(%ebp),%eax
    2dfb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2dfe:	c1 fa 0a             	sar    $0xa,%edx
    2e01:	89 d1                	mov    %edx,%ecx
    2e03:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2e06:	c1 fa 0a             	sar    $0xa,%edx
    2e09:	50                   	push   %eax
    2e0a:	51                   	push   %ecx
    2e0b:	52                   	push   %edx
    2e0c:	ff 75 10             	pushl  0x10(%ebp)
    2e0f:	ff 75 0c             	pushl  0xc(%ebp)
    2e12:	ff 75 08             	pushl  0x8(%ebp)
    2e15:	e8 e2 f7 ff ff       	call   25fc <draw_point>
    2e1a:	83 c4 18             	add    $0x18,%esp
		y += dy;
    2e1d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2e20:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    2e23:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2e26:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    2e29:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    2e2d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e30:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    2e33:	7c c2                	jl     2df7 <draw_line+0xf6>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    2e35:	c9                   	leave  
    2e36:	c3                   	ret    

00002e37 <draw_window>:

void
draw_window(Context c, char *title)
{
    2e37:	55                   	push   %ebp
    2e38:	89 e5                	mov    %esp,%ebp
    2e3a:	83 ec 18             	sub    $0x18,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    2e3d:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e40:	83 e8 01             	sub    $0x1,%eax
    2e43:	6a 00                	push   $0x0
    2e45:	6a 00                	push   $0x0
    2e47:	50                   	push   %eax
    2e48:	6a 00                	push   $0x0
    2e4a:	6a 00                	push   $0x0
    2e4c:	ff 75 10             	pushl  0x10(%ebp)
    2e4f:	ff 75 0c             	pushl  0xc(%ebp)
    2e52:	ff 75 08             	pushl  0x8(%ebp)
    2e55:	e8 a7 fe ff ff       	call   2d01 <draw_line>
    2e5a:	83 c4 20             	add    $0x20,%esp
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    2e5d:	8b 45 10             	mov    0x10(%ebp),%eax
    2e60:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2e63:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e66:	8d 50 ff             	lea    -0x1(%eax),%edx
    2e69:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e6c:	83 e8 01             	sub    $0x1,%eax
    2e6f:	6a 00                	push   $0x0
    2e71:	51                   	push   %ecx
    2e72:	52                   	push   %edx
    2e73:	6a 00                	push   $0x0
    2e75:	50                   	push   %eax
    2e76:	ff 75 10             	pushl  0x10(%ebp)
    2e79:	ff 75 0c             	pushl  0xc(%ebp)
    2e7c:	ff 75 08             	pushl  0x8(%ebp)
    2e7f:	e8 7d fe ff ff       	call   2d01 <draw_line>
    2e84:	83 c4 20             	add    $0x20,%esp
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    2e87:	8b 45 10             	mov    0x10(%ebp),%eax
    2e8a:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2e8d:	8b 45 10             	mov    0x10(%ebp),%eax
    2e90:	8d 50 ff             	lea    -0x1(%eax),%edx
    2e93:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e96:	83 e8 01             	sub    $0x1,%eax
    2e99:	6a 00                	push   $0x0
    2e9b:	51                   	push   %ecx
    2e9c:	6a 00                	push   $0x0
    2e9e:	52                   	push   %edx
    2e9f:	50                   	push   %eax
    2ea0:	ff 75 10             	pushl  0x10(%ebp)
    2ea3:	ff 75 0c             	pushl  0xc(%ebp)
    2ea6:	ff 75 08             	pushl  0x8(%ebp)
    2ea9:	e8 53 fe ff ff       	call   2d01 <draw_line>
    2eae:	83 c4 20             	add    $0x20,%esp
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    2eb1:	8b 45 10             	mov    0x10(%ebp),%eax
    2eb4:	83 e8 01             	sub    $0x1,%eax
    2eb7:	6a 00                	push   $0x0
    2eb9:	6a 00                	push   $0x0
    2ebb:	6a 00                	push   $0x0
    2ebd:	50                   	push   %eax
    2ebe:	6a 00                	push   $0x0
    2ec0:	ff 75 10             	pushl  0x10(%ebp)
    2ec3:	ff 75 0c             	pushl  0xc(%ebp)
    2ec6:	ff 75 08             	pushl  0x8(%ebp)
    2ec9:	e8 33 fe ff ff       	call   2d01 <draw_line>
    2ece:	83 c4 20             	add    $0x20,%esp
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    2ed1:	8b 45 0c             	mov    0xc(%ebp),%eax
    2ed4:	83 e8 02             	sub    $0x2,%eax
    2ed7:	68 cb 5a 00 00       	push   $0x5acb
    2edc:	6a 14                	push   $0x14
    2ede:	50                   	push   %eax
    2edf:	6a 01                	push   $0x1
    2ee1:	6a 01                	push   $0x1
    2ee3:	ff 75 10             	pushl  0x10(%ebp)
    2ee6:	ff 75 0c             	pushl  0xc(%ebp)
    2ee9:	ff 75 08             	pushl  0x8(%ebp)
    2eec:	e8 4a f7 ff ff       	call   263b <fill_rect>
    2ef1:	83 c4 20             	add    $0x20,%esp
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    2ef4:	8b 45 0c             	mov    0xc(%ebp),%eax
    2ef7:	83 e8 02             	sub    $0x2,%eax
    2efa:	89 c2                	mov    %eax,%edx
    2efc:	8b 45 10             	mov    0x10(%ebp),%eax
    2eff:	83 e8 15             	sub    $0x15,%eax
    2f02:	68 cb 5a 00 00       	push   $0x5acb
    2f07:	6a 14                	push   $0x14
    2f09:	52                   	push   %edx
    2f0a:	50                   	push   %eax
    2f0b:	6a 01                	push   $0x1
    2f0d:	ff 75 10             	pushl  0x10(%ebp)
    2f10:	ff 75 0c             	pushl  0xc(%ebp)
    2f13:	ff 75 08             	pushl  0x8(%ebp)
    2f16:	e8 20 f7 ff ff       	call   263b <fill_rect>
    2f1b:	83 c4 20             	add    $0x20,%esp

  loadBitmap(&pic, "close.bmp");
    2f1e:	83 ec 08             	sub    $0x8,%esp
    2f21:	68 bb ab 00 00       	push   $0xabbb
    2f26:	8d 45 ec             	lea    -0x14(%ebp),%eax
    2f29:	50                   	push   %eax
    2f2a:	e8 fb 00 00 00       	call   302a <loadBitmap>
    2f2f:	83 c4 10             	add    $0x10,%esp
  draw_picture(c, pic, 3, 3);
    2f32:	6a 03                	push   $0x3
    2f34:	6a 03                	push   $0x3
    2f36:	ff 75 f4             	pushl  -0xc(%ebp)
    2f39:	ff 75 f0             	pushl  -0x10(%ebp)
    2f3c:	ff 75 ec             	pushl  -0x14(%ebp)
    2f3f:	ff 75 10             	pushl  0x10(%ebp)
    2f42:	ff 75 0c             	pushl  0xc(%ebp)
    2f45:	ff 75 08             	pushl  0x8(%ebp)
    2f48:	e8 f8 fc ff ff       	call   2c45 <draw_picture>
    2f4d:	83 c4 20             	add    $0x20,%esp
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    2f50:	83 ec 04             	sub    $0x4,%esp
    2f53:	6a 02                	push   $0x2
    2f55:	6a 19                	push   $0x19
    2f57:	68 ff ff 00 00       	push   $0xffff
    2f5c:	ff 75 14             	pushl  0x14(%ebp)
    2f5f:	ff 75 10             	pushl  0x10(%ebp)
    2f62:	ff 75 0c             	pushl  0xc(%ebp)
    2f65:	ff 75 08             	pushl  0x8(%ebp)
    2f68:	e8 29 fc ff ff       	call   2b96 <puts_str>
    2f6d:	83 c4 20             	add    $0x20,%esp
  freepic(&pic);
    2f70:	83 ec 0c             	sub    $0xc,%esp
    2f73:	8d 45 ec             	lea    -0x14(%ebp),%eax
    2f76:	50                   	push   %eax
    2f77:	e8 cd 05 00 00       	call   3549 <freepic>
    2f7c:	83 c4 10             	add    $0x10,%esp
}
    2f7f:	c9                   	leave  
    2f80:	c3                   	ret    

00002f81 <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    2f81:	55                   	push   %ebp
    2f82:	89 e5                	mov    %esp,%ebp
    2f84:	83 ec 18             	sub    $0x18,%esp
	int i;
	for (i = 0; i < len; i++)
    2f87:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2f8e:	eb 2c                	jmp    2fbc <load_iconlist+0x3b>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    2f90:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f93:	6b d0 34             	imul   $0x34,%eax,%edx
    2f96:	8b 45 08             	mov    0x8(%ebp),%eax
    2f99:	01 d0                	add    %edx,%eax
    2f9b:	89 c1                	mov    %eax,%ecx
    2f9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2fa0:	6b d0 34             	imul   $0x34,%eax,%edx
    2fa3:	8b 45 08             	mov    0x8(%ebp),%eax
    2fa6:	01 d0                	add    %edx,%eax
    2fa8:	83 c0 28             	add    $0x28,%eax
    2fab:	83 ec 08             	sub    $0x8,%esp
    2fae:	51                   	push   %ecx
    2faf:	50                   	push   %eax
    2fb0:	e8 75 00 00 00       	call   302a <loadBitmap>
    2fb5:	83 c4 10             	add    $0x10,%esp
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    2fb8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2fbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2fbf:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2fc2:	7c cc                	jl     2f90 <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    2fc4:	c9                   	leave  
    2fc5:	c3                   	ret    

00002fc6 <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    2fc6:	55                   	push   %ebp
    2fc7:	89 e5                	mov    %esp,%ebp
    2fc9:	53                   	push   %ebx
    2fca:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; i < len; i++)
    2fcd:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2fd4:	eb 47                	jmp    301d <draw_iconlist+0x57>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    2fd6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2fd9:	6b d0 34             	imul   $0x34,%eax,%edx
    2fdc:	8b 45 14             	mov    0x14(%ebp),%eax
    2fdf:	01 d0                	add    %edx,%eax
    2fe1:	8b 48 24             	mov    0x24(%eax),%ecx
    2fe4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2fe7:	6b d0 34             	imul   $0x34,%eax,%edx
    2fea:	8b 45 14             	mov    0x14(%ebp),%eax
    2fed:	01 d0                	add    %edx,%eax
    2fef:	8b 50 20             	mov    0x20(%eax),%edx
    2ff2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2ff5:	6b d8 34             	imul   $0x34,%eax,%ebx
    2ff8:	8b 45 14             	mov    0x14(%ebp),%eax
    2ffb:	01 d8                	add    %ebx,%eax
    2ffd:	51                   	push   %ecx
    2ffe:	52                   	push   %edx
    2fff:	ff 70 30             	pushl  0x30(%eax)
    3002:	ff 70 2c             	pushl  0x2c(%eax)
    3005:	ff 70 28             	pushl  0x28(%eax)
    3008:	ff 75 10             	pushl  0x10(%ebp)
    300b:	ff 75 0c             	pushl  0xc(%ebp)
    300e:	ff 75 08             	pushl  0x8(%ebp)
    3011:	e8 2f fc ff ff       	call   2c45 <draw_picture>
    3016:	83 c4 20             	add    $0x20,%esp
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    3019:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    301d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3020:	3b 45 18             	cmp    0x18(%ebp),%eax
    3023:	7c b1                	jl     2fd6 <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    3025:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3028:	c9                   	leave  
    3029:	c3                   	ret    

0000302a <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    302a:	55                   	push   %ebp
    302b:	89 e5                	mov    %esp,%ebp
    302d:	81 ec 88 00 00 00    	sub    $0x88,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    3033:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    303a:	83 ec 08             	sub    $0x8,%esp
    303d:	6a 00                	push   $0x0
    303f:	ff 75 0c             	pushl  0xc(%ebp)
    3042:	e8 2f 0f 00 00       	call   3f76 <open>
    3047:	83 c4 10             	add    $0x10,%esp
    304a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    304d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3051:	79 1a                	jns    306d <loadBitmap+0x43>
		printf(0, "cannot open %s\n", pic_name);
    3053:	83 ec 04             	sub    $0x4,%esp
    3056:	ff 75 0c             	pushl  0xc(%ebp)
    3059:	68 c8 ab 00 00       	push   $0xabc8
    305e:	6a 00                	push   $0x0
    3060:	e8 ae 10 00 00       	call   4113 <printf>
    3065:	83 c4 10             	add    $0x10,%esp
		return;
    3068:	e9 ca 02 00 00       	jmp    3337 <loadBitmap+0x30d>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    306d:	83 ec 04             	sub    $0x4,%esp
    3070:	ff 75 0c             	pushl  0xc(%ebp)
    3073:	68 d8 ab 00 00       	push   $0xabd8
    3078:	6a 00                	push   $0x0
    307a:	e8 94 10 00 00       	call   4113 <printf>
    307f:	83 c4 10             	add    $0x10,%esp
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    3082:	83 ec 0c             	sub    $0xc,%esp
    3085:	6a 0e                	push   $0xe
    3087:	e8 58 13 00 00       	call   43e4 <malloc>
    308c:	83 c4 10             	add    $0x10,%esp
    308f:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    3092:	83 ec 04             	sub    $0x4,%esp
    3095:	6a 0e                	push   $0xe
    3097:	ff 75 e4             	pushl  -0x1c(%ebp)
    309a:	ff 75 e8             	pushl  -0x18(%ebp)
    309d:	e8 ac 0e 00 00       	call   3f4e <read>
    30a2:	83 c4 10             	add    $0x10,%esp
    30a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    30a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    30ab:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    30ae:	8b 45 dc             	mov    -0x24(%ebp),%eax
    30b1:	0f b7 00             	movzwl (%eax),%eax
    30b4:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    30b8:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    30bc:	66 3d 42 4d          	cmp    $0x4d42,%ax
    30c0:	74 17                	je     30d9 <loadBitmap+0xaf>
		printf(0, "file is not .bmp file!");
    30c2:	83 ec 08             	sub    $0x8,%esp
    30c5:	68 ec ab 00 00       	push   $0xabec
    30ca:	6a 00                	push   $0x0
    30cc:	e8 42 10 00 00       	call   4113 <printf>
    30d1:	83 c4 10             	add    $0x10,%esp
		return;
    30d4:	e9 5e 02 00 00       	jmp    3337 <loadBitmap+0x30d>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    30d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    30dc:	83 c0 02             	add    $0x2,%eax
    30df:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    30e2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    30e5:	8b 00                	mov    (%eax),%eax
    30e7:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    30ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    30ed:	83 c0 06             	add    $0x6,%eax
    30f0:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    30f3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    30f6:	0f b7 00             	movzwl (%eax),%eax
    30f9:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    30fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3100:	83 c0 08             	add    $0x8,%eax
    3103:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    3106:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3109:	0f b7 00             	movzwl (%eax),%eax
    310c:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    3110:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3113:	83 c0 0a             	add    $0xa,%eax
    3116:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    3119:	8b 45 d8             	mov    -0x28(%ebp),%eax
    311c:	8b 00                	mov    (%eax),%eax
    311e:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    3121:	83 ec 04             	sub    $0x4,%esp
    3124:	6a 28                	push   $0x28
    3126:	8d 45 84             	lea    -0x7c(%ebp),%eax
    3129:	50                   	push   %eax
    312a:	ff 75 e8             	pushl  -0x18(%ebp)
    312d:	e8 1c 0e 00 00       	call   3f4e <read>
    3132:	83 c4 10             	add    $0x10,%esp
	width = bitInfoHead.biWidth;
    3135:	8b 45 88             	mov    -0x78(%ebp),%eax
    3138:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    313b:	8b 45 8c             	mov    -0x74(%ebp),%eax
    313e:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    3141:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3144:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    3148:	c1 e0 02             	shl    $0x2,%eax
    314b:	83 ec 0c             	sub    $0xc,%esp
    314e:	50                   	push   %eax
    314f:	ff 75 d0             	pushl  -0x30(%ebp)
    3152:	ff 75 d4             	pushl  -0x2c(%ebp)
    3155:	68 04 ac 00 00       	push   $0xac04
    315a:	6a 00                	push   $0x0
    315c:	e8 b2 0f 00 00       	call   4113 <printf>
    3161:	83 c4 20             	add    $0x20,%esp
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    3164:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    3168:	75 12                	jne    317c <loadBitmap+0x152>
		printf(0, "0");
    316a:	83 ec 08             	sub    $0x8,%esp
    316d:	68 29 ac 00 00       	push   $0xac29
    3172:	6a 00                	push   $0x0
    3174:	e8 9a 0f 00 00       	call   4113 <printf>
    3179:	83 c4 10             	add    $0x10,%esp
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    317c:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    3180:	0f b7 c0             	movzwl %ax,%eax
    3183:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    3187:	83 c0 1f             	add    $0x1f,%eax
    318a:	8d 50 1f             	lea    0x1f(%eax),%edx
    318d:	85 c0                	test   %eax,%eax
    318f:	0f 48 c2             	cmovs  %edx,%eax
    3192:	c1 f8 05             	sar    $0x5,%eax
    3195:	c1 e0 02             	shl    $0x2,%eax
    3198:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    319b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    319e:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    31a2:	83 ec 0c             	sub    $0xc,%esp
    31a5:	50                   	push   %eax
    31a6:	e8 39 12 00 00       	call   43e4 <malloc>
    31ab:	83 c4 10             	add    $0x10,%esp
    31ae:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    31b1:	8b 55 d0             	mov    -0x30(%ebp),%edx
    31b4:	8b 45 cc             	mov    -0x34(%ebp),%eax
    31b7:	0f af c2             	imul   %edx,%eax
    31ba:	83 ec 04             	sub    $0x4,%esp
    31bd:	50                   	push   %eax
    31be:	6a 00                	push   $0x0
    31c0:	ff 75 c8             	pushl  -0x38(%ebp)
    31c3:	e8 d4 0b 00 00       	call   3d9c <memset>
    31c8:	83 c4 10             	add    $0x10,%esp
	long nData = height * l_width;
    31cb:	8b 45 d0             	mov    -0x30(%ebp),%eax
    31ce:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    31d2:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    31d5:	83 ec 04             	sub    $0x4,%esp
    31d8:	ff 75 c4             	pushl  -0x3c(%ebp)
    31db:	ff 75 c8             	pushl  -0x38(%ebp)
    31de:	ff 75 e8             	pushl  -0x18(%ebp)
    31e1:	e8 68 0d 00 00       	call   3f4e <read>
    31e6:	83 c4 10             	add    $0x10,%esp

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    31e9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    31ec:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    31f0:	c1 e0 02             	shl    $0x2,%eax
    31f3:	83 ec 0c             	sub    $0xc,%esp
    31f6:	50                   	push   %eax
    31f7:	e8 e8 11 00 00       	call   43e4 <malloc>
    31fc:	83 c4 10             	add    $0x10,%esp
    31ff:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    3202:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3205:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3208:	0f af c2             	imul   %edx,%eax
    320b:	c1 e0 02             	shl    $0x2,%eax
    320e:	83 ec 04             	sub    $0x4,%esp
    3211:	50                   	push   %eax
    3212:	6a 00                	push   $0x0
    3214:	ff 75 c0             	pushl  -0x40(%ebp)
    3217:	e8 80 0b 00 00       	call   3d9c <memset>
    321c:	83 c4 10             	add    $0x10,%esp
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    321f:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    3223:	66 83 f8 17          	cmp    $0x17,%ax
    3227:	77 17                	ja     3240 <loadBitmap+0x216>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    3229:	83 ec 08             	sub    $0x8,%esp
    322c:	68 2c ac 00 00       	push   $0xac2c
    3231:	6a 00                	push   $0x0
    3233:	e8 db 0e 00 00       	call   4113 <printf>
    3238:	83 c4 10             	add    $0x10,%esp
		return;
    323b:	e9 f7 00 00 00       	jmp    3337 <loadBitmap+0x30d>
	} else	//位图为24位真彩色
	{
		index = 0;
    3240:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    3247:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    324e:	e9 94 00 00 00       	jmp    32e7 <loadBitmap+0x2bd>
			for (j = 0; j < width; j++) {
    3253:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    325a:	eb 7b                	jmp    32d7 <loadBitmap+0x2ad>
				k = i * l_width + j * 3;
    325c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    325f:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3263:	89 c1                	mov    %eax,%ecx
    3265:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3268:	89 d0                	mov    %edx,%eax
    326a:	01 c0                	add    %eax,%eax
    326c:	01 d0                	add    %edx,%eax
    326e:	01 c8                	add    %ecx,%eax
    3270:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    3273:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3276:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    327d:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3280:	01 c2                	add    %eax,%edx
    3282:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3285:	8d 48 02             	lea    0x2(%eax),%ecx
    3288:	8b 45 c8             	mov    -0x38(%ebp),%eax
    328b:	01 c8                	add    %ecx,%eax
    328d:	0f b6 00             	movzbl (%eax),%eax
    3290:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    3293:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3296:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    329d:	8b 45 c0             	mov    -0x40(%ebp),%eax
    32a0:	01 c2                	add    %eax,%edx
    32a2:	8b 45 bc             	mov    -0x44(%ebp),%eax
    32a5:	8d 48 01             	lea    0x1(%eax),%ecx
    32a8:	8b 45 c8             	mov    -0x38(%ebp),%eax
    32ab:	01 c8                	add    %ecx,%eax
    32ad:	0f b6 00             	movzbl (%eax),%eax
    32b0:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    32b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    32b6:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    32bd:	8b 45 c0             	mov    -0x40(%ebp),%eax
    32c0:	01 c2                	add    %eax,%edx
    32c2:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    32c5:	8b 45 c8             	mov    -0x38(%ebp),%eax
    32c8:	01 c8                	add    %ecx,%eax
    32ca:	0f b6 00             	movzbl (%eax),%eax
    32cd:	88 02                	mov    %al,(%edx)
				index++;
    32cf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    32d3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    32d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32da:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    32dd:	0f 8c 79 ff ff ff    	jl     325c <loadBitmap+0x232>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    32e3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    32e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32ea:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    32ed:	0f 8c 60 ff ff ff    	jl     3253 <loadBitmap+0x229>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    32f3:	83 ec 0c             	sub    $0xc,%esp
    32f6:	ff 75 e8             	pushl  -0x18(%ebp)
    32f9:	e8 60 0c 00 00       	call   3f5e <close>
    32fe:	83 c4 10             	add    $0x10,%esp

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    3301:	8b 45 08             	mov    0x8(%ebp),%eax
    3304:	8b 55 c0             	mov    -0x40(%ebp),%edx
    3307:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    3309:	8b 45 08             	mov    0x8(%ebp),%eax
    330c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    330f:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    3312:	8b 45 08             	mov    0x8(%ebp),%eax
    3315:	8b 55 d0             	mov    -0x30(%ebp),%edx
    3318:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    331b:	83 ec 0c             	sub    $0xc,%esp
    331e:	ff 75 c8             	pushl  -0x38(%ebp)
    3321:	e8 7d 0f 00 00       	call   42a3 <free>
    3326:	83 c4 10             	add    $0x10,%esp
	free(BmpFileHeader);
    3329:	83 ec 0c             	sub    $0xc,%esp
    332c:	ff 75 e4             	pushl  -0x1c(%ebp)
    332f:	e8 6f 0f 00 00       	call   42a3 <free>
    3334:	83 c4 10             	add    $0x10,%esp
	//printf("\n");
}
    3337:	c9                   	leave  
    3338:	c3                   	ret    

00003339 <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    3339:	55                   	push   %ebp
    333a:	89 e5                	mov    %esp,%ebp
    333c:	83 ec 08             	sub    $0x8,%esp
	printf(0, "位图文件头:\n");
    333f:	83 ec 08             	sub    $0x8,%esp
    3342:	68 4c ac 00 00       	push   $0xac4c
    3347:	6a 00                	push   $0x0
    3349:	e8 c5 0d 00 00       	call   4113 <printf>
    334e:	83 c4 10             	add    $0x10,%esp
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    3351:	8b 45 08             	mov    0x8(%ebp),%eax
    3354:	0f b7 00             	movzwl (%eax),%eax
    3357:	0f b7 c0             	movzwl %ax,%eax
    335a:	83 ec 04             	sub    $0x4,%esp
    335d:	50                   	push   %eax
    335e:	68 5e ac 00 00       	push   $0xac5e
    3363:	6a 00                	push   $0x0
    3365:	e8 a9 0d 00 00       	call   4113 <printf>
    336a:	83 c4 10             	add    $0x10,%esp
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    336d:	8b 45 08             	mov    0x8(%ebp),%eax
    3370:	8b 40 04             	mov    0x4(%eax),%eax
    3373:	83 ec 04             	sub    $0x4,%esp
    3376:	50                   	push   %eax
    3377:	68 7c ac 00 00       	push   $0xac7c
    337c:	6a 00                	push   $0x0
    337e:	e8 90 0d 00 00       	call   4113 <printf>
    3383:	83 c4 10             	add    $0x10,%esp
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    3386:	8b 45 08             	mov    0x8(%ebp),%eax
    3389:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    338d:	0f b7 c0             	movzwl %ax,%eax
    3390:	83 ec 04             	sub    $0x4,%esp
    3393:	50                   	push   %eax
    3394:	68 8d ac 00 00       	push   $0xac8d
    3399:	6a 00                	push   $0x0
    339b:	e8 73 0d 00 00       	call   4113 <printf>
    33a0:	83 c4 10             	add    $0x10,%esp
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    33a3:	8b 45 08             	mov    0x8(%ebp),%eax
    33a6:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    33aa:	0f b7 c0             	movzwl %ax,%eax
    33ad:	83 ec 04             	sub    $0x4,%esp
    33b0:	50                   	push   %eax
    33b1:	68 8d ac 00 00       	push   $0xac8d
    33b6:	6a 00                	push   $0x0
    33b8:	e8 56 0d 00 00       	call   4113 <printf>
    33bd:	83 c4 10             	add    $0x10,%esp
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    33c0:	8b 45 08             	mov    0x8(%ebp),%eax
    33c3:	8b 40 0c             	mov    0xc(%eax),%eax
    33c6:	83 ec 04             	sub    $0x4,%esp
    33c9:	50                   	push   %eax
    33ca:	68 9c ac 00 00       	push   $0xac9c
    33cf:	6a 00                	push   $0x0
    33d1:	e8 3d 0d 00 00       	call   4113 <printf>
    33d6:	83 c4 10             	add    $0x10,%esp
}
    33d9:	c9                   	leave  
    33da:	c3                   	ret    

000033db <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    33db:	55                   	push   %ebp
    33dc:	89 e5                	mov    %esp,%ebp
    33de:	83 ec 08             	sub    $0x8,%esp
	printf(0, "位图信息头:\n");
    33e1:	83 ec 08             	sub    $0x8,%esp
    33e4:	68 c5 ac 00 00       	push   $0xacc5
    33e9:	6a 00                	push   $0x0
    33eb:	e8 23 0d 00 00       	call   4113 <printf>
    33f0:	83 c4 10             	add    $0x10,%esp
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    33f3:	8b 45 08             	mov    0x8(%ebp),%eax
    33f6:	8b 00                	mov    (%eax),%eax
    33f8:	83 ec 04             	sub    $0x4,%esp
    33fb:	50                   	push   %eax
    33fc:	68 d7 ac 00 00       	push   $0xacd7
    3401:	6a 00                	push   $0x0
    3403:	e8 0b 0d 00 00       	call   4113 <printf>
    3408:	83 c4 10             	add    $0x10,%esp
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    340b:	8b 45 08             	mov    0x8(%ebp),%eax
    340e:	8b 40 04             	mov    0x4(%eax),%eax
    3411:	83 ec 04             	sub    $0x4,%esp
    3414:	50                   	push   %eax
    3415:	68 ee ac 00 00       	push   $0xacee
    341a:	6a 00                	push   $0x0
    341c:	e8 f2 0c 00 00       	call   4113 <printf>
    3421:	83 c4 10             	add    $0x10,%esp
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    3424:	8b 45 08             	mov    0x8(%ebp),%eax
    3427:	8b 40 08             	mov    0x8(%eax),%eax
    342a:	83 ec 04             	sub    $0x4,%esp
    342d:	50                   	push   %eax
    342e:	68 fc ac 00 00       	push   $0xacfc
    3433:	6a 00                	push   $0x0
    3435:	e8 d9 0c 00 00       	call   4113 <printf>
    343a:	83 c4 10             	add    $0x10,%esp
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    343d:	8b 45 08             	mov    0x8(%ebp),%eax
    3440:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    3444:	0f b7 c0             	movzwl %ax,%eax
    3447:	83 ec 04             	sub    $0x4,%esp
    344a:	50                   	push   %eax
    344b:	68 0a ad 00 00       	push   $0xad0a
    3450:	6a 00                	push   $0x0
    3452:	e8 bc 0c 00 00       	call   4113 <printf>
    3457:	83 c4 10             	add    $0x10,%esp
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    345a:	8b 45 08             	mov    0x8(%ebp),%eax
    345d:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    3461:	0f b7 c0             	movzwl %ax,%eax
    3464:	83 ec 04             	sub    $0x4,%esp
    3467:	50                   	push   %eax
    3468:	68 20 ad 00 00       	push   $0xad20
    346d:	6a 00                	push   $0x0
    346f:	e8 9f 0c 00 00       	call   4113 <printf>
    3474:	83 c4 10             	add    $0x10,%esp
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    3477:	8b 45 08             	mov    0x8(%ebp),%eax
    347a:	8b 40 10             	mov    0x10(%eax),%eax
    347d:	83 ec 04             	sub    $0x4,%esp
    3480:	50                   	push   %eax
    3481:	68 41 ad 00 00       	push   $0xad41
    3486:	6a 00                	push   $0x0
    3488:	e8 86 0c 00 00       	call   4113 <printf>
    348d:	83 c4 10             	add    $0x10,%esp
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    3490:	8b 45 08             	mov    0x8(%ebp),%eax
    3493:	8b 40 14             	mov    0x14(%eax),%eax
    3496:	83 ec 04             	sub    $0x4,%esp
    3499:	50                   	push   %eax
    349a:	68 54 ad 00 00       	push   $0xad54
    349f:	6a 00                	push   $0x0
    34a1:	e8 6d 0c 00 00       	call   4113 <printf>
    34a6:	83 c4 10             	add    $0x10,%esp
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    34a9:	8b 45 08             	mov    0x8(%ebp),%eax
    34ac:	8b 40 18             	mov    0x18(%eax),%eax
    34af:	83 ec 04             	sub    $0x4,%esp
    34b2:	50                   	push   %eax
    34b3:	68 88 ad 00 00       	push   $0xad88
    34b8:	6a 00                	push   $0x0
    34ba:	e8 54 0c 00 00       	call   4113 <printf>
    34bf:	83 c4 10             	add    $0x10,%esp
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    34c2:	8b 45 08             	mov    0x8(%ebp),%eax
    34c5:	8b 40 1c             	mov    0x1c(%eax),%eax
    34c8:	83 ec 04             	sub    $0x4,%esp
    34cb:	50                   	push   %eax
    34cc:	68 9d ad 00 00       	push   $0xad9d
    34d1:	6a 00                	push   $0x0
    34d3:	e8 3b 0c 00 00       	call   4113 <printf>
    34d8:	83 c4 10             	add    $0x10,%esp
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    34db:	8b 45 08             	mov    0x8(%ebp),%eax
    34de:	8b 40 20             	mov    0x20(%eax),%eax
    34e1:	83 ec 04             	sub    $0x4,%esp
    34e4:	50                   	push   %eax
    34e5:	68 b2 ad 00 00       	push   $0xadb2
    34ea:	6a 00                	push   $0x0
    34ec:	e8 22 0c 00 00       	call   4113 <printf>
    34f1:	83 c4 10             	add    $0x10,%esp
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    34f4:	8b 45 08             	mov    0x8(%ebp),%eax
    34f7:	8b 40 24             	mov    0x24(%eax),%eax
    34fa:	83 ec 04             	sub    $0x4,%esp
    34fd:	50                   	push   %eax
    34fe:	68 c9 ad 00 00       	push   $0xadc9
    3503:	6a 00                	push   $0x0
    3505:	e8 09 0c 00 00       	call   4113 <printf>
    350a:	83 c4 10             	add    $0x10,%esp
}
    350d:	c9                   	leave  
    350e:	c3                   	ret    

0000350f <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    350f:	55                   	push   %ebp
    3510:	89 e5                	mov    %esp,%ebp
    3512:	83 ec 08             	sub    $0x8,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    3515:	8b 45 08             	mov    0x8(%ebp),%eax
    3518:	0f b6 00             	movzbl (%eax),%eax
    351b:	0f b6 c8             	movzbl %al,%ecx
    351e:	8b 45 08             	mov    0x8(%ebp),%eax
    3521:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    3525:	0f b6 d0             	movzbl %al,%edx
    3528:	8b 45 08             	mov    0x8(%ebp),%eax
    352b:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    352f:	0f b6 c0             	movzbl %al,%eax
    3532:	83 ec 0c             	sub    $0xc,%esp
    3535:	51                   	push   %ecx
    3536:	52                   	push   %edx
    3537:	50                   	push   %eax
    3538:	68 dd ad 00 00       	push   $0xaddd
    353d:	6a 00                	push   $0x0
    353f:	e8 cf 0b 00 00       	call   4113 <printf>
    3544:	83 c4 20             	add    $0x20,%esp
}
    3547:	c9                   	leave  
    3548:	c3                   	ret    

00003549 <freepic>:

void freepic(PICNODE *pic) {
    3549:	55                   	push   %ebp
    354a:	89 e5                	mov    %esp,%ebp
    354c:	83 ec 08             	sub    $0x8,%esp
	free(pic->data);
    354f:	8b 45 08             	mov    0x8(%ebp),%eax
    3552:	8b 00                	mov    (%eax),%eax
    3554:	83 ec 0c             	sub    $0xc,%esp
    3557:	50                   	push   %eax
    3558:	e8 46 0d 00 00       	call   42a3 <free>
    355d:	83 c4 10             	add    $0x10,%esp
}
    3560:	c9                   	leave  
    3561:	c3                   	ret    

00003562 <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    3562:	55                   	push   %ebp
    3563:	89 e5                	mov    %esp,%ebp
    3565:	83 ec 68             	sub    $0x68,%esp
	int W = 15;
    3568:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    356f:	8d 45 dc             	lea    -0x24(%ebp),%eax
    3572:	83 ec 0c             	sub    $0xc,%esp
    3575:	ff 75 ec             	pushl  -0x14(%ebp)
    3578:	ff 75 ec             	pushl  -0x14(%ebp)
    357b:	6a 00                	push   $0x0
    357d:	6a 00                	push   $0x0
    357f:	50                   	push   %eax
    3580:	e8 01 02 00 00       	call   3786 <initRect>
    3585:	83 c4 1c             	add    $0x1c,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    3588:	8b 45 08             	mov    0x8(%ebp),%eax
    358b:	8b 40 04             	mov    0x4(%eax),%eax
    358e:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3591:	89 c2                	mov    %eax,%edx
    3593:	8d 45 cc             	lea    -0x34(%ebp),%eax
    3596:	83 ec 0c             	sub    $0xc,%esp
    3599:	ff 75 ec             	pushl  -0x14(%ebp)
    359c:	ff 75 ec             	pushl  -0x14(%ebp)
    359f:	6a 00                	push   $0x0
    35a1:	52                   	push   %edx
    35a2:	50                   	push   %eax
    35a3:	e8 de 01 00 00       	call   3786 <initRect>
    35a8:	83 c4 1c             	add    $0x1c,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    35ab:	8b 45 08             	mov    0x8(%ebp),%eax
    35ae:	8b 40 08             	mov    0x8(%eax),%eax
    35b1:	2b 45 ec             	sub    -0x14(%ebp),%eax
    35b4:	89 c1                	mov    %eax,%ecx
    35b6:	8b 45 08             	mov    0x8(%ebp),%eax
    35b9:	8b 40 04             	mov    0x4(%eax),%eax
    35bc:	2b 45 ec             	sub    -0x14(%ebp),%eax
    35bf:	89 c2                	mov    %eax,%edx
    35c1:	8d 45 bc             	lea    -0x44(%ebp),%eax
    35c4:	83 ec 0c             	sub    $0xc,%esp
    35c7:	ff 75 ec             	pushl  -0x14(%ebp)
    35ca:	ff 75 ec             	pushl  -0x14(%ebp)
    35cd:	51                   	push   %ecx
    35ce:	52                   	push   %edx
    35cf:	50                   	push   %eax
    35d0:	e8 b1 01 00 00       	call   3786 <initRect>
    35d5:	83 c4 1c             	add    $0x1c,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    35d8:	8b 45 08             	mov    0x8(%ebp),%eax
    35db:	8b 40 08             	mov    0x8(%eax),%eax
    35de:	2b 45 ec             	sub    -0x14(%ebp),%eax
    35e1:	89 c2                	mov    %eax,%edx
    35e3:	8d 45 ac             	lea    -0x54(%ebp),%eax
    35e6:	83 ec 0c             	sub    $0xc,%esp
    35e9:	ff 75 ec             	pushl  -0x14(%ebp)
    35ec:	ff 75 ec             	pushl  -0x14(%ebp)
    35ef:	52                   	push   %edx
    35f0:	6a 00                	push   $0x0
    35f2:	50                   	push   %eax
    35f3:	e8 8e 01 00 00       	call   3786 <initRect>
    35f8:	83 c4 1c             	add    $0x1c,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    35fb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3602:	e9 47 01 00 00       	jmp    374e <set_icon_alpha+0x1ec>
		for (j = 0; j < pic->height; j++) {
    3607:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    360e:	e9 28 01 00 00       	jmp    373b <set_icon_alpha+0x1d9>
			p = initPoint(i, j);
    3613:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3616:	83 ec 04             	sub    $0x4,%esp
    3619:	ff 75 f0             	pushl  -0x10(%ebp)
    361c:	ff 75 f4             	pushl  -0xc(%ebp)
    361f:	50                   	push   %eax
    3620:	e8 3a 01 00 00       	call   375f <initPoint>
    3625:	83 c4 0c             	add    $0xc,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    3628:	83 ec 08             	sub    $0x8,%esp
    362b:	ff 75 e8             	pushl  -0x18(%ebp)
    362e:	ff 75 e4             	pushl  -0x1c(%ebp)
    3631:	ff 75 e0             	pushl  -0x20(%ebp)
    3634:	ff 75 dc             	pushl  -0x24(%ebp)
    3637:	ff 75 a8             	pushl  -0x58(%ebp)
    363a:	ff 75 a4             	pushl  -0x5c(%ebp)
    363d:	e8 95 01 00 00       	call   37d7 <isIn>
    3642:	83 c4 20             	add    $0x20,%esp
    3645:	85 c0                	test   %eax,%eax
    3647:	75 67                	jne    36b0 <set_icon_alpha+0x14e>
    3649:	83 ec 08             	sub    $0x8,%esp
    364c:	ff 75 d8             	pushl  -0x28(%ebp)
    364f:	ff 75 d4             	pushl  -0x2c(%ebp)
    3652:	ff 75 d0             	pushl  -0x30(%ebp)
    3655:	ff 75 cc             	pushl  -0x34(%ebp)
    3658:	ff 75 a8             	pushl  -0x58(%ebp)
    365b:	ff 75 a4             	pushl  -0x5c(%ebp)
    365e:	e8 74 01 00 00       	call   37d7 <isIn>
    3663:	83 c4 20             	add    $0x20,%esp
    3666:	85 c0                	test   %eax,%eax
    3668:	75 46                	jne    36b0 <set_icon_alpha+0x14e>
    366a:	83 ec 08             	sub    $0x8,%esp
    366d:	ff 75 c8             	pushl  -0x38(%ebp)
    3670:	ff 75 c4             	pushl  -0x3c(%ebp)
    3673:	ff 75 c0             	pushl  -0x40(%ebp)
    3676:	ff 75 bc             	pushl  -0x44(%ebp)
    3679:	ff 75 a8             	pushl  -0x58(%ebp)
    367c:	ff 75 a4             	pushl  -0x5c(%ebp)
    367f:	e8 53 01 00 00       	call   37d7 <isIn>
    3684:	83 c4 20             	add    $0x20,%esp
    3687:	85 c0                	test   %eax,%eax
    3689:	75 25                	jne    36b0 <set_icon_alpha+0x14e>
    368b:	83 ec 08             	sub    $0x8,%esp
    368e:	ff 75 b8             	pushl  -0x48(%ebp)
    3691:	ff 75 b4             	pushl  -0x4c(%ebp)
    3694:	ff 75 b0             	pushl  -0x50(%ebp)
    3697:	ff 75 ac             	pushl  -0x54(%ebp)
    369a:	ff 75 a8             	pushl  -0x58(%ebp)
    369d:	ff 75 a4             	pushl  -0x5c(%ebp)
    36a0:	e8 32 01 00 00       	call   37d7 <isIn>
    36a5:	83 c4 20             	add    $0x20,%esp
    36a8:	85 c0                	test   %eax,%eax
    36aa:	0f 84 87 00 00 00    	je     3737 <set_icon_alpha+0x1d5>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    36b0:	8b 45 08             	mov    0x8(%ebp),%eax
    36b3:	8b 10                	mov    (%eax),%edx
    36b5:	8b 45 08             	mov    0x8(%ebp),%eax
    36b8:	8b 40 04             	mov    0x4(%eax),%eax
    36bb:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    36bf:	89 c1                	mov    %eax,%ecx
    36c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36c4:	01 c8                	add    %ecx,%eax
    36c6:	c1 e0 02             	shl    $0x2,%eax
    36c9:	01 d0                	add    %edx,%eax
    36cb:	0f b6 00             	movzbl (%eax),%eax
    36ce:	3c ff                	cmp    $0xff,%al
    36d0:	75 65                	jne    3737 <set_icon_alpha+0x1d5>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    36d2:	8b 45 08             	mov    0x8(%ebp),%eax
    36d5:	8b 10                	mov    (%eax),%edx
    36d7:	8b 45 08             	mov    0x8(%ebp),%eax
    36da:	8b 40 04             	mov    0x4(%eax),%eax
    36dd:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    36e1:	89 c1                	mov    %eax,%ecx
    36e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36e6:	01 c8                	add    %ecx,%eax
    36e8:	c1 e0 02             	shl    $0x2,%eax
    36eb:	01 d0                	add    %edx,%eax
    36ed:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    36f1:	3c ff                	cmp    $0xff,%al
    36f3:	75 42                	jne    3737 <set_icon_alpha+0x1d5>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    36f5:	8b 45 08             	mov    0x8(%ebp),%eax
    36f8:	8b 10                	mov    (%eax),%edx
    36fa:	8b 45 08             	mov    0x8(%ebp),%eax
    36fd:	8b 40 04             	mov    0x4(%eax),%eax
    3700:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3704:	89 c1                	mov    %eax,%ecx
    3706:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3709:	01 c8                	add    %ecx,%eax
    370b:	c1 e0 02             	shl    $0x2,%eax
    370e:	01 d0                	add    %edx,%eax
    3710:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    3714:	3c ff                	cmp    $0xff,%al
    3716:	75 1f                	jne    3737 <set_icon_alpha+0x1d5>
					pic->data[j * pic->width + i].rgbReserved = 1;
    3718:	8b 45 08             	mov    0x8(%ebp),%eax
    371b:	8b 10                	mov    (%eax),%edx
    371d:	8b 45 08             	mov    0x8(%ebp),%eax
    3720:	8b 40 04             	mov    0x4(%eax),%eax
    3723:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3727:	89 c1                	mov    %eax,%ecx
    3729:	8b 45 f4             	mov    -0xc(%ebp),%eax
    372c:	01 c8                	add    %ecx,%eax
    372e:	c1 e0 02             	shl    $0x2,%eax
    3731:	01 d0                	add    %edx,%eax
    3733:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    3737:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    373b:	8b 45 08             	mov    0x8(%ebp),%eax
    373e:	8b 40 08             	mov    0x8(%eax),%eax
    3741:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3744:	0f 8f c9 fe ff ff    	jg     3613 <set_icon_alpha+0xb1>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    374a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    374e:	8b 45 08             	mov    0x8(%ebp),%eax
    3751:	8b 40 04             	mov    0x4(%eax),%eax
    3754:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3757:	0f 8f aa fe ff ff    	jg     3607 <set_icon_alpha+0xa5>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    375d:	c9                   	leave  
    375e:	c3                   	ret    

0000375f <initPoint>:
#include "context.h"
#include "message.h"
#include "types.h"
#include "user.h"
Point initPoint(int x, int y)
{
    375f:	55                   	push   %ebp
    3760:	89 e5                	mov    %esp,%ebp
    3762:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    3765:	8b 45 0c             	mov    0xc(%ebp),%eax
    3768:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    376b:	8b 45 10             	mov    0x10(%ebp),%eax
    376e:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    3771:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3774:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3777:	8b 55 fc             	mov    -0x4(%ebp),%edx
    377a:	89 01                	mov    %eax,(%ecx)
    377c:	89 51 04             	mov    %edx,0x4(%ecx)
}
    377f:	8b 45 08             	mov    0x8(%ebp),%eax
    3782:	c9                   	leave  
    3783:	c2 04 00             	ret    $0x4

00003786 <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    3786:	55                   	push   %ebp
    3787:	89 e5                	mov    %esp,%ebp
    3789:	83 ec 18             	sub    $0x18,%esp
	Rect r;
	r.start = initPoint(x, y);
    378c:	8d 45 e8             	lea    -0x18(%ebp),%eax
    378f:	ff 75 10             	pushl  0x10(%ebp)
    3792:	ff 75 0c             	pushl  0xc(%ebp)
    3795:	50                   	push   %eax
    3796:	e8 c4 ff ff ff       	call   375f <initPoint>
    379b:	83 c4 08             	add    $0x8,%esp
    379e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    37a1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    37a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    37a7:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    37aa:	8b 45 14             	mov    0x14(%ebp),%eax
    37ad:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    37b0:	8b 45 18             	mov    0x18(%ebp),%eax
    37b3:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    37b6:	8b 45 08             	mov    0x8(%ebp),%eax
    37b9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    37bc:	89 10                	mov    %edx,(%eax)
    37be:	8b 55 f4             	mov    -0xc(%ebp),%edx
    37c1:	89 50 04             	mov    %edx,0x4(%eax)
    37c4:	8b 55 f8             	mov    -0x8(%ebp),%edx
    37c7:	89 50 08             	mov    %edx,0x8(%eax)
    37ca:	8b 55 fc             	mov    -0x4(%ebp),%edx
    37cd:	89 50 0c             	mov    %edx,0xc(%eax)
}
    37d0:	8b 45 08             	mov    0x8(%ebp),%eax
    37d3:	c9                   	leave  
    37d4:	c2 04 00             	ret    $0x4

000037d7 <isIn>:

int isIn(Point p, Rect r)
{
    37d7:	55                   	push   %ebp
    37d8:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    37da:	8b 55 08             	mov    0x8(%ebp),%edx
    37dd:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    37e0:	39 c2                	cmp    %eax,%edx
    37e2:	7c 2f                	jl     3813 <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    37e4:	8b 45 08             	mov    0x8(%ebp),%eax
    37e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    37ea:	8b 55 18             	mov    0x18(%ebp),%edx
    37ed:	01 ca                	add    %ecx,%edx
    37ef:	39 d0                	cmp    %edx,%eax
    37f1:	7d 20                	jge    3813 <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    37f3:	8b 55 0c             	mov    0xc(%ebp),%edx
    37f6:	8b 45 14             	mov    0x14(%ebp),%eax
    37f9:	39 c2                	cmp    %eax,%edx
    37fb:	7c 16                	jl     3813 <isIn+0x3c>
    37fd:	8b 45 0c             	mov    0xc(%ebp),%eax
    3800:	8b 4d 14             	mov    0x14(%ebp),%ecx
    3803:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3806:	01 ca                	add    %ecx,%edx
    3808:	39 d0                	cmp    %edx,%eax
    380a:	7d 07                	jge    3813 <isIn+0x3c>
    380c:	b8 01 00 00 00       	mov    $0x1,%eax
    3811:	eb 05                	jmp    3818 <isIn+0x41>
    3813:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3818:	5d                   	pop    %ebp
    3819:	c3                   	ret    

0000381a <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    381a:	55                   	push   %ebp
    381b:	89 e5                	mov    %esp,%ebp
    381d:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    3820:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    3827:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    382e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    3835:	8b 45 10             	mov    0x10(%ebp),%eax
    3838:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    383b:	8b 45 14             	mov    0x14(%ebp),%eax
    383e:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    3841:	8b 45 08             	mov    0x8(%ebp),%eax
    3844:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3847:	89 10                	mov    %edx,(%eax)
    3849:	8b 55 f0             	mov    -0x10(%ebp),%edx
    384c:	89 50 04             	mov    %edx,0x4(%eax)
    384f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3852:	89 50 08             	mov    %edx,0x8(%eax)
    3855:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3858:	89 50 0c             	mov    %edx,0xc(%eax)
    385b:	8b 55 fc             	mov    -0x4(%ebp),%edx
    385e:	89 50 10             	mov    %edx,0x10(%eax)
}
    3861:	8b 45 08             	mov    0x8(%ebp),%eax
    3864:	c9                   	leave  
    3865:	c2 04 00             	ret    $0x4

00003868 <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    3868:	55                   	push   %ebp
    3869:	89 e5                	mov    %esp,%ebp
    386b:	83 ec 08             	sub    $0x8,%esp
	switch (MsgType)
    386e:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3871:	83 f8 03             	cmp    $0x3,%eax
    3874:	74 4f                	je     38c5 <createClickable+0x5d>
    3876:	83 f8 04             	cmp    $0x4,%eax
    3879:	74 07                	je     3882 <createClickable+0x1a>
    387b:	83 f8 02             	cmp    $0x2,%eax
    387e:	74 25                	je     38a5 <createClickable+0x3d>
    3880:	eb 66                	jmp    38e8 <createClickable+0x80>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    3882:	8b 45 08             	mov    0x8(%ebp),%eax
    3885:	83 c0 04             	add    $0x4,%eax
    3888:	83 ec 08             	sub    $0x8,%esp
    388b:	ff 75 20             	pushl  0x20(%ebp)
    388e:	ff 75 18             	pushl  0x18(%ebp)
    3891:	ff 75 14             	pushl  0x14(%ebp)
    3894:	ff 75 10             	pushl  0x10(%ebp)
    3897:	ff 75 0c             	pushl  0xc(%ebp)
    389a:	50                   	push   %eax
    389b:	e8 5d 00 00 00       	call   38fd <addClickable>
    38a0:	83 c4 20             	add    $0x20,%esp
	        break;
    38a3:	eb 56                	jmp    38fb <createClickable+0x93>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    38a5:	8b 45 08             	mov    0x8(%ebp),%eax
    38a8:	83 ec 08             	sub    $0x8,%esp
    38ab:	ff 75 20             	pushl  0x20(%ebp)
    38ae:	ff 75 18             	pushl  0x18(%ebp)
    38b1:	ff 75 14             	pushl  0x14(%ebp)
    38b4:	ff 75 10             	pushl  0x10(%ebp)
    38b7:	ff 75 0c             	pushl  0xc(%ebp)
    38ba:	50                   	push   %eax
    38bb:	e8 3d 00 00 00       	call   38fd <addClickable>
    38c0:	83 c4 20             	add    $0x20,%esp
	    	break;
    38c3:	eb 36                	jmp    38fb <createClickable+0x93>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    38c5:	8b 45 08             	mov    0x8(%ebp),%eax
    38c8:	83 c0 08             	add    $0x8,%eax
    38cb:	83 ec 08             	sub    $0x8,%esp
    38ce:	ff 75 20             	pushl  0x20(%ebp)
    38d1:	ff 75 18             	pushl  0x18(%ebp)
    38d4:	ff 75 14             	pushl  0x14(%ebp)
    38d7:	ff 75 10             	pushl  0x10(%ebp)
    38da:	ff 75 0c             	pushl  0xc(%ebp)
    38dd:	50                   	push   %eax
    38de:	e8 1a 00 00 00       	call   38fd <addClickable>
    38e3:	83 c4 20             	add    $0x20,%esp
	    	break;
    38e6:	eb 13                	jmp    38fb <createClickable+0x93>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    38e8:	83 ec 08             	sub    $0x8,%esp
    38eb:	68 ec ad 00 00       	push   $0xadec
    38f0:	6a 00                	push   $0x0
    38f2:	e8 1c 08 00 00       	call   4113 <printf>
    38f7:	83 c4 10             	add    $0x10,%esp
	    	break;
    38fa:	90                   	nop
	}
}
    38fb:	c9                   	leave  
    38fc:	c3                   	ret    

000038fd <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    38fd:	55                   	push   %ebp
    38fe:	89 e5                	mov    %esp,%ebp
    3900:	83 ec 18             	sub    $0x18,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    3903:	83 ec 0c             	sub    $0xc,%esp
    3906:	6a 18                	push   $0x18
    3908:	e8 d7 0a 00 00       	call   43e4 <malloc>
    390d:	83 c4 10             	add    $0x10,%esp
    3910:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    3913:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3916:	8b 55 0c             	mov    0xc(%ebp),%edx
    3919:	89 10                	mov    %edx,(%eax)
    391b:	8b 55 10             	mov    0x10(%ebp),%edx
    391e:	89 50 04             	mov    %edx,0x4(%eax)
    3921:	8b 55 14             	mov    0x14(%ebp),%edx
    3924:	89 50 08             	mov    %edx,0x8(%eax)
    3927:	8b 55 18             	mov    0x18(%ebp),%edx
    392a:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    392d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3930:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3933:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    3936:	8b 45 08             	mov    0x8(%ebp),%eax
    3939:	8b 10                	mov    (%eax),%edx
    393b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    393e:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    3941:	8b 45 08             	mov    0x8(%ebp),%eax
    3944:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3947:	89 10                	mov    %edx,(%eax)
}
    3949:	c9                   	leave  
    394a:	c3                   	ret    

0000394b <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    394b:	55                   	push   %ebp
    394c:	89 e5                	mov    %esp,%ebp
    394e:	83 ec 18             	sub    $0x18,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    3951:	8b 45 08             	mov    0x8(%ebp),%eax
    3954:	8b 00                	mov    (%eax),%eax
    3956:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3959:	8b 45 f0             	mov    -0x10(%ebp),%eax
    395c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    395f:	e9 ad 00 00 00       	jmp    3a11 <deleteClickable+0xc6>
	{
		if (isIn(cur->area.start, region))
    3964:	ff 75 18             	pushl  0x18(%ebp)
    3967:	ff 75 14             	pushl  0x14(%ebp)
    396a:	ff 75 10             	pushl  0x10(%ebp)
    396d:	ff 75 0c             	pushl  0xc(%ebp)
    3970:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3973:	ff 70 04             	pushl  0x4(%eax)
    3976:	ff 30                	pushl  (%eax)
    3978:	e8 5a fe ff ff       	call   37d7 <isIn>
    397d:	83 c4 18             	add    $0x18,%esp
    3980:	85 c0                	test   %eax,%eax
    3982:	74 66                	je     39ea <deleteClickable+0x9f>
		{
			//如果当前指针指向头部
			if (cur == *head)
    3984:	8b 45 08             	mov    0x8(%ebp),%eax
    3987:	8b 00                	mov    (%eax),%eax
    3989:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    398c:	75 31                	jne    39bf <deleteClickable+0x74>
			{
				//删除头节点
				temp = *head;
    398e:	8b 45 08             	mov    0x8(%ebp),%eax
    3991:	8b 00                	mov    (%eax),%eax
    3993:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    3996:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3999:	8b 50 14             	mov    0x14(%eax),%edx
    399c:	8b 45 08             	mov    0x8(%ebp),%eax
    399f:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    39a1:	8b 45 08             	mov    0x8(%ebp),%eax
    39a4:	8b 00                	mov    (%eax),%eax
    39a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    39a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    39ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    39af:	83 ec 0c             	sub    $0xc,%esp
    39b2:	ff 75 ec             	pushl  -0x14(%ebp)
    39b5:	e8 e9 08 00 00       	call   42a3 <free>
    39ba:	83 c4 10             	add    $0x10,%esp
    39bd:	eb 52                	jmp    3a11 <deleteClickable+0xc6>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    39bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    39c2:	8b 50 14             	mov    0x14(%eax),%edx
    39c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    39c8:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    39cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    39ce:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    39d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    39d4:	8b 40 14             	mov    0x14(%eax),%eax
    39d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    39da:	83 ec 0c             	sub    $0xc,%esp
    39dd:	ff 75 ec             	pushl  -0x14(%ebp)
    39e0:	e8 be 08 00 00       	call   42a3 <free>
    39e5:	83 c4 10             	add    $0x10,%esp
    39e8:	eb 27                	jmp    3a11 <deleteClickable+0xc6>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    39ea:	8b 45 08             	mov    0x8(%ebp),%eax
    39ed:	8b 00                	mov    (%eax),%eax
    39ef:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    39f2:	75 0b                	jne    39ff <deleteClickable+0xb4>
			{
				cur = cur->next;
    39f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    39f7:	8b 40 14             	mov    0x14(%eax),%eax
    39fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
    39fd:	eb 12                	jmp    3a11 <deleteClickable+0xc6>
			}
			else
			{
				cur = cur->next;
    39ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3a02:	8b 40 14             	mov    0x14(%eax),%eax
    3a05:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    3a08:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a0b:	8b 40 14             	mov    0x14(%eax),%eax
    3a0e:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    3a11:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3a15:	0f 85 49 ff ff ff    	jne    3964 <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    3a1b:	c9                   	leave  
    3a1c:	c3                   	ret    

00003a1d <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    3a1d:	55                   	push   %ebp
    3a1e:	89 e5                	mov    %esp,%ebp
    3a20:	83 ec 18             	sub    $0x18,%esp
	Clickable *cur = head;
    3a23:	8b 45 08             	mov    0x8(%ebp),%eax
    3a26:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    3a29:	eb 44                	jmp    3a6f <executeHandler+0x52>
	{
		if (isIn(click, cur->area))
    3a2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a2e:	ff 70 0c             	pushl  0xc(%eax)
    3a31:	ff 70 08             	pushl  0x8(%eax)
    3a34:	ff 70 04             	pushl  0x4(%eax)
    3a37:	ff 30                	pushl  (%eax)
    3a39:	ff 75 10             	pushl  0x10(%ebp)
    3a3c:	ff 75 0c             	pushl  0xc(%ebp)
    3a3f:	e8 93 fd ff ff       	call   37d7 <isIn>
    3a44:	83 c4 18             	add    $0x18,%esp
    3a47:	85 c0                	test   %eax,%eax
    3a49:	74 1b                	je     3a66 <executeHandler+0x49>
		{
			cur->handler(click);
    3a4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a4e:	8b 40 10             	mov    0x10(%eax),%eax
    3a51:	83 ec 08             	sub    $0x8,%esp
    3a54:	ff 75 10             	pushl  0x10(%ebp)
    3a57:	ff 75 0c             	pushl  0xc(%ebp)
    3a5a:	ff d0                	call   *%eax
    3a5c:	83 c4 10             	add    $0x10,%esp
			return 1;
    3a5f:	b8 01 00 00 00       	mov    $0x1,%eax
    3a64:	eb 26                	jmp    3a8c <executeHandler+0x6f>
		}
		cur = cur->next;
    3a66:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a69:	8b 40 14             	mov    0x14(%eax),%eax
    3a6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    3a6f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3a73:	75 b6                	jne    3a2b <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	printf(0, "execute: none!\n");
    3a75:	83 ec 08             	sub    $0x8,%esp
    3a78:	68 1a ae 00 00       	push   $0xae1a
    3a7d:	6a 00                	push   $0x0
    3a7f:	e8 8f 06 00 00       	call   4113 <printf>
    3a84:	83 c4 10             	add    $0x10,%esp
	return 0;
    3a87:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3a8c:	c9                   	leave  
    3a8d:	c3                   	ret    

00003a8e <printClickable>:

void printClickable(Clickable *c)
{
    3a8e:	55                   	push   %ebp
    3a8f:	89 e5                	mov    %esp,%ebp
    3a91:	53                   	push   %ebx
    3a92:	83 ec 04             	sub    $0x4,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    3a95:	8b 45 08             	mov    0x8(%ebp),%eax
    3a98:	8b 58 0c             	mov    0xc(%eax),%ebx
    3a9b:	8b 45 08             	mov    0x8(%ebp),%eax
    3a9e:	8b 48 08             	mov    0x8(%eax),%ecx
    3aa1:	8b 45 08             	mov    0x8(%ebp),%eax
    3aa4:	8b 50 04             	mov    0x4(%eax),%edx
    3aa7:	8b 45 08             	mov    0x8(%ebp),%eax
    3aaa:	8b 00                	mov    (%eax),%eax
    3aac:	83 ec 08             	sub    $0x8,%esp
    3aaf:	53                   	push   %ebx
    3ab0:	51                   	push   %ecx
    3ab1:	52                   	push   %edx
    3ab2:	50                   	push   %eax
    3ab3:	68 2a ae 00 00       	push   $0xae2a
    3ab8:	6a 00                	push   $0x0
    3aba:	e8 54 06 00 00       	call   4113 <printf>
    3abf:	83 c4 20             	add    $0x20,%esp
}
    3ac2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3ac5:	c9                   	leave  
    3ac6:	c3                   	ret    

00003ac7 <printClickableList>:

void printClickableList(Clickable *head)
{
    3ac7:	55                   	push   %ebp
    3ac8:	89 e5                	mov    %esp,%ebp
    3aca:	83 ec 18             	sub    $0x18,%esp
	Clickable *cur = head;
    3acd:	8b 45 08             	mov    0x8(%ebp),%eax
    3ad0:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    3ad3:	83 ec 08             	sub    $0x8,%esp
    3ad6:	68 3c ae 00 00       	push   $0xae3c
    3adb:	6a 00                	push   $0x0
    3add:	e8 31 06 00 00       	call   4113 <printf>
    3ae2:	83 c4 10             	add    $0x10,%esp
	while(cur != 0)
    3ae5:	eb 17                	jmp    3afe <printClickableList+0x37>
	{
		printClickable(cur);
    3ae7:	83 ec 0c             	sub    $0xc,%esp
    3aea:	ff 75 f4             	pushl  -0xc(%ebp)
    3aed:	e8 9c ff ff ff       	call   3a8e <printClickable>
    3af2:	83 c4 10             	add    $0x10,%esp
		cur = cur->next;
    3af5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3af8:	8b 40 14             	mov    0x14(%eax),%eax
    3afb:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    3afe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3b02:	75 e3                	jne    3ae7 <printClickableList+0x20>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    3b04:	83 ec 08             	sub    $0x8,%esp
    3b07:	68 4d ae 00 00       	push   $0xae4d
    3b0c:	6a 00                	push   $0x0
    3b0e:	e8 00 06 00 00       	call   4113 <printf>
    3b13:	83 c4 10             	add    $0x10,%esp
}
    3b16:	c9                   	leave  
    3b17:	c3                   	ret    

00003b18 <testHanler>:

void testHanler(struct Point p)
{
    3b18:	55                   	push   %ebp
    3b19:	89 e5                	mov    %esp,%ebp
    3b1b:	83 ec 08             	sub    $0x8,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    3b1e:	8b 55 0c             	mov    0xc(%ebp),%edx
    3b21:	8b 45 08             	mov    0x8(%ebp),%eax
    3b24:	52                   	push   %edx
    3b25:	50                   	push   %eax
    3b26:	68 4f ae 00 00       	push   $0xae4f
    3b2b:	6a 00                	push   $0x0
    3b2d:	e8 e1 05 00 00       	call   4113 <printf>
    3b32:	83 c4 10             	add    $0x10,%esp
}
    3b35:	c9                   	leave  
    3b36:	c3                   	ret    

00003b37 <testClickable>:
void testClickable(struct Context c)
{
    3b37:	55                   	push   %ebp
    3b38:	89 e5                	mov    %esp,%ebp
    3b3a:	83 ec 78             	sub    $0x78,%esp
	ClickableManager cm = initClickManager(c);
    3b3d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3b40:	ff 75 10             	pushl  0x10(%ebp)
    3b43:	ff 75 0c             	pushl  0xc(%ebp)
    3b46:	ff 75 08             	pushl  0x8(%ebp)
    3b49:	50                   	push   %eax
    3b4a:	e8 cb fc ff ff       	call   381a <initClickManager>
    3b4f:	83 c4 0c             	add    $0xc,%esp

	Rect r1 = initRect(5,5,20,20);
    3b52:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    3b55:	83 ec 04             	sub    $0x4,%esp
    3b58:	6a 14                	push   $0x14
    3b5a:	6a 14                	push   $0x14
    3b5c:	6a 05                	push   $0x5
    3b5e:	6a 05                	push   $0x5
    3b60:	50                   	push   %eax
    3b61:	e8 20 fc ff ff       	call   3786 <initRect>
    3b66:	83 c4 14             	add    $0x14,%esp
	Rect r2 = initRect(20,20,20,20);
    3b69:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    3b6c:	83 ec 04             	sub    $0x4,%esp
    3b6f:	6a 14                	push   $0x14
    3b71:	6a 14                	push   $0x14
    3b73:	6a 14                	push   $0x14
    3b75:	6a 14                	push   $0x14
    3b77:	50                   	push   %eax
    3b78:	e8 09 fc ff ff       	call   3786 <initRect>
    3b7d:	83 c4 14             	add    $0x14,%esp
	Rect r3 = initRect(50,50,15,15);
    3b80:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    3b83:	83 ec 04             	sub    $0x4,%esp
    3b86:	6a 0f                	push   $0xf
    3b88:	6a 0f                	push   $0xf
    3b8a:	6a 32                	push   $0x32
    3b8c:	6a 32                	push   $0x32
    3b8e:	50                   	push   %eax
    3b8f:	e8 f2 fb ff ff       	call   3786 <initRect>
    3b94:	83 c4 14             	add    $0x14,%esp
	Rect r4 = initRect(0,0,30,30);
    3b97:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3b9a:	83 ec 04             	sub    $0x4,%esp
    3b9d:	6a 1e                	push   $0x1e
    3b9f:	6a 1e                	push   $0x1e
    3ba1:	6a 00                	push   $0x0
    3ba3:	6a 00                	push   $0x0
    3ba5:	50                   	push   %eax
    3ba6:	e8 db fb ff ff       	call   3786 <initRect>
    3bab:	83 c4 14             	add    $0x14,%esp
	Point p1 = initPoint(23, 23);
    3bae:	8d 45 9c             	lea    -0x64(%ebp),%eax
    3bb1:	83 ec 04             	sub    $0x4,%esp
    3bb4:	6a 17                	push   $0x17
    3bb6:	6a 17                	push   $0x17
    3bb8:	50                   	push   %eax
    3bb9:	e8 a1 fb ff ff       	call   375f <initPoint>
    3bbe:	83 c4 0c             	add    $0xc,%esp
	Point p2 = initPoint(70, 70);
    3bc1:	8d 45 94             	lea    -0x6c(%ebp),%eax
    3bc4:	83 ec 04             	sub    $0x4,%esp
    3bc7:	6a 46                	push   $0x46
    3bc9:	6a 46                	push   $0x46
    3bcb:	50                   	push   %eax
    3bcc:	e8 8e fb ff ff       	call   375f <initPoint>
    3bd1:	83 c4 0c             	add    $0xc,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    3bd4:	83 ec 04             	sub    $0x4,%esp
    3bd7:	68 18 3b 00 00       	push   $0x3b18
    3bdc:	6a 02                	push   $0x2
    3bde:	ff 75 e0             	pushl  -0x20(%ebp)
    3be1:	ff 75 dc             	pushl  -0x24(%ebp)
    3be4:	ff 75 d8             	pushl  -0x28(%ebp)
    3be7:	ff 75 d4             	pushl  -0x2c(%ebp)
    3bea:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3bed:	50                   	push   %eax
    3bee:	e8 75 fc ff ff       	call   3868 <createClickable>
    3bf3:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    3bf6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3bf9:	83 ec 04             	sub    $0x4,%esp
    3bfc:	50                   	push   %eax
    3bfd:	68 63 ae 00 00       	push   $0xae63
    3c02:	6a 00                	push   $0x0
    3c04:	e8 0a 05 00 00       	call   4113 <printf>
    3c09:	83 c4 10             	add    $0x10,%esp
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    3c0c:	83 ec 04             	sub    $0x4,%esp
    3c0f:	68 18 3b 00 00       	push   $0x3b18
    3c14:	6a 02                	push   $0x2
    3c16:	ff 75 d0             	pushl  -0x30(%ebp)
    3c19:	ff 75 cc             	pushl  -0x34(%ebp)
    3c1c:	ff 75 c8             	pushl  -0x38(%ebp)
    3c1f:	ff 75 c4             	pushl  -0x3c(%ebp)
    3c22:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3c25:	50                   	push   %eax
    3c26:	e8 3d fc ff ff       	call   3868 <createClickable>
    3c2b:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    3c2e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3c31:	83 ec 04             	sub    $0x4,%esp
    3c34:	50                   	push   %eax
    3c35:	68 63 ae 00 00       	push   $0xae63
    3c3a:	6a 00                	push   $0x0
    3c3c:	e8 d2 04 00 00       	call   4113 <printf>
    3c41:	83 c4 10             	add    $0x10,%esp
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    3c44:	83 ec 04             	sub    $0x4,%esp
    3c47:	68 18 3b 00 00       	push   $0x3b18
    3c4c:	6a 02                	push   $0x2
    3c4e:	ff 75 c0             	pushl  -0x40(%ebp)
    3c51:	ff 75 bc             	pushl  -0x44(%ebp)
    3c54:	ff 75 b8             	pushl  -0x48(%ebp)
    3c57:	ff 75 b4             	pushl  -0x4c(%ebp)
    3c5a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3c5d:	50                   	push   %eax
    3c5e:	e8 05 fc ff ff       	call   3868 <createClickable>
    3c63:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    3c66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3c69:	83 ec 04             	sub    $0x4,%esp
    3c6c:	50                   	push   %eax
    3c6d:	68 63 ae 00 00       	push   $0xae63
    3c72:	6a 00                	push   $0x0
    3c74:	e8 9a 04 00 00       	call   4113 <printf>
    3c79:	83 c4 10             	add    $0x10,%esp
	printClickableList(cm.left_click);
    3c7c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3c7f:	83 ec 0c             	sub    $0xc,%esp
    3c82:	50                   	push   %eax
    3c83:	e8 3f fe ff ff       	call   3ac7 <printClickableList>
    3c88:	83 c4 10             	add    $0x10,%esp
	executeHandler(cm.left_click, p1);
    3c8b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3c8e:	83 ec 04             	sub    $0x4,%esp
    3c91:	ff 75 a0             	pushl  -0x60(%ebp)
    3c94:	ff 75 9c             	pushl  -0x64(%ebp)
    3c97:	50                   	push   %eax
    3c98:	e8 80 fd ff ff       	call   3a1d <executeHandler>
    3c9d:	83 c4 10             	add    $0x10,%esp
	executeHandler(cm.left_click, p2);
    3ca0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3ca3:	83 ec 04             	sub    $0x4,%esp
    3ca6:	ff 75 98             	pushl  -0x68(%ebp)
    3ca9:	ff 75 94             	pushl  -0x6c(%ebp)
    3cac:	50                   	push   %eax
    3cad:	e8 6b fd ff ff       	call   3a1d <executeHandler>
    3cb2:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, r4);
    3cb5:	83 ec 0c             	sub    $0xc,%esp
    3cb8:	ff 75 b0             	pushl  -0x50(%ebp)
    3cbb:	ff 75 ac             	pushl  -0x54(%ebp)
    3cbe:	ff 75 a8             	pushl  -0x58(%ebp)
    3cc1:	ff 75 a4             	pushl  -0x5c(%ebp)
    3cc4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3cc7:	50                   	push   %eax
    3cc8:	e8 7e fc ff ff       	call   394b <deleteClickable>
    3ccd:	83 c4 20             	add    $0x20,%esp
	printClickableList(cm.left_click);
    3cd0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3cd3:	83 ec 0c             	sub    $0xc,%esp
    3cd6:	50                   	push   %eax
    3cd7:	e8 eb fd ff ff       	call   3ac7 <printClickableList>
    3cdc:	83 c4 10             	add    $0x10,%esp
}
    3cdf:	c9                   	leave  
    3ce0:	c3                   	ret    

00003ce1 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    3ce1:	55                   	push   %ebp
    3ce2:	89 e5                	mov    %esp,%ebp
    3ce4:	57                   	push   %edi
    3ce5:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    3ce6:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3ce9:	8b 55 10             	mov    0x10(%ebp),%edx
    3cec:	8b 45 0c             	mov    0xc(%ebp),%eax
    3cef:	89 cb                	mov    %ecx,%ebx
    3cf1:	89 df                	mov    %ebx,%edi
    3cf3:	89 d1                	mov    %edx,%ecx
    3cf5:	fc                   	cld    
    3cf6:	f3 aa                	rep stos %al,%es:(%edi)
    3cf8:	89 ca                	mov    %ecx,%edx
    3cfa:	89 fb                	mov    %edi,%ebx
    3cfc:	89 5d 08             	mov    %ebx,0x8(%ebp)
    3cff:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    3d02:	5b                   	pop    %ebx
    3d03:	5f                   	pop    %edi
    3d04:	5d                   	pop    %ebp
    3d05:	c3                   	ret    

00003d06 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3d06:	55                   	push   %ebp
    3d07:	89 e5                	mov    %esp,%ebp
    3d09:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    3d0c:	8b 45 08             	mov    0x8(%ebp),%eax
    3d0f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    3d12:	90                   	nop
    3d13:	8b 45 08             	mov    0x8(%ebp),%eax
    3d16:	8d 50 01             	lea    0x1(%eax),%edx
    3d19:	89 55 08             	mov    %edx,0x8(%ebp)
    3d1c:	8b 55 0c             	mov    0xc(%ebp),%edx
    3d1f:	8d 4a 01             	lea    0x1(%edx),%ecx
    3d22:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    3d25:	0f b6 12             	movzbl (%edx),%edx
    3d28:	88 10                	mov    %dl,(%eax)
    3d2a:	0f b6 00             	movzbl (%eax),%eax
    3d2d:	84 c0                	test   %al,%al
    3d2f:	75 e2                	jne    3d13 <strcpy+0xd>
    ;
  return os;
    3d31:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3d34:	c9                   	leave  
    3d35:	c3                   	ret    

00003d36 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3d36:	55                   	push   %ebp
    3d37:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    3d39:	eb 08                	jmp    3d43 <strcmp+0xd>
    p++, q++;
    3d3b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3d3f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3d43:	8b 45 08             	mov    0x8(%ebp),%eax
    3d46:	0f b6 00             	movzbl (%eax),%eax
    3d49:	84 c0                	test   %al,%al
    3d4b:	74 10                	je     3d5d <strcmp+0x27>
    3d4d:	8b 45 08             	mov    0x8(%ebp),%eax
    3d50:	0f b6 10             	movzbl (%eax),%edx
    3d53:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d56:	0f b6 00             	movzbl (%eax),%eax
    3d59:	38 c2                	cmp    %al,%dl
    3d5b:	74 de                	je     3d3b <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3d5d:	8b 45 08             	mov    0x8(%ebp),%eax
    3d60:	0f b6 00             	movzbl (%eax),%eax
    3d63:	0f b6 d0             	movzbl %al,%edx
    3d66:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d69:	0f b6 00             	movzbl (%eax),%eax
    3d6c:	0f b6 c0             	movzbl %al,%eax
    3d6f:	29 c2                	sub    %eax,%edx
    3d71:	89 d0                	mov    %edx,%eax
}
    3d73:	5d                   	pop    %ebp
    3d74:	c3                   	ret    

00003d75 <strlen>:

uint
strlen(char *s)
{
    3d75:	55                   	push   %ebp
    3d76:	89 e5                	mov    %esp,%ebp
    3d78:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    3d7b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    3d82:	eb 04                	jmp    3d88 <strlen+0x13>
    3d84:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3d88:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3d8b:	8b 45 08             	mov    0x8(%ebp),%eax
    3d8e:	01 d0                	add    %edx,%eax
    3d90:	0f b6 00             	movzbl (%eax),%eax
    3d93:	84 c0                	test   %al,%al
    3d95:	75 ed                	jne    3d84 <strlen+0xf>
    ;
  return n;
    3d97:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3d9a:	c9                   	leave  
    3d9b:	c3                   	ret    

00003d9c <memset>:

void*
memset(void *dst, int c, uint n)
{
    3d9c:	55                   	push   %ebp
    3d9d:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
    3d9f:	8b 45 10             	mov    0x10(%ebp),%eax
    3da2:	50                   	push   %eax
    3da3:	ff 75 0c             	pushl  0xc(%ebp)
    3da6:	ff 75 08             	pushl  0x8(%ebp)
    3da9:	e8 33 ff ff ff       	call   3ce1 <stosb>
    3dae:	83 c4 0c             	add    $0xc,%esp
  return dst;
    3db1:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3db4:	c9                   	leave  
    3db5:	c3                   	ret    

00003db6 <strchr>:

char*
strchr(const char *s, char c)
{
    3db6:	55                   	push   %ebp
    3db7:	89 e5                	mov    %esp,%ebp
    3db9:	83 ec 04             	sub    $0x4,%esp
    3dbc:	8b 45 0c             	mov    0xc(%ebp),%eax
    3dbf:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    3dc2:	eb 14                	jmp    3dd8 <strchr+0x22>
    if(*s == c)
    3dc4:	8b 45 08             	mov    0x8(%ebp),%eax
    3dc7:	0f b6 00             	movzbl (%eax),%eax
    3dca:	3a 45 fc             	cmp    -0x4(%ebp),%al
    3dcd:	75 05                	jne    3dd4 <strchr+0x1e>
      return (char*)s;
    3dcf:	8b 45 08             	mov    0x8(%ebp),%eax
    3dd2:	eb 13                	jmp    3de7 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3dd4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3dd8:	8b 45 08             	mov    0x8(%ebp),%eax
    3ddb:	0f b6 00             	movzbl (%eax),%eax
    3dde:	84 c0                	test   %al,%al
    3de0:	75 e2                	jne    3dc4 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    3de2:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3de7:	c9                   	leave  
    3de8:	c3                   	ret    

00003de9 <gets>:

char*
gets(char *buf, int max)
{
    3de9:	55                   	push   %ebp
    3dea:	89 e5                	mov    %esp,%ebp
    3dec:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3def:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3df6:	eb 44                	jmp    3e3c <gets+0x53>
    cc = read(0, &c, 1);
    3df8:	83 ec 04             	sub    $0x4,%esp
    3dfb:	6a 01                	push   $0x1
    3dfd:	8d 45 ef             	lea    -0x11(%ebp),%eax
    3e00:	50                   	push   %eax
    3e01:	6a 00                	push   $0x0
    3e03:	e8 46 01 00 00       	call   3f4e <read>
    3e08:	83 c4 10             	add    $0x10,%esp
    3e0b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    3e0e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3e12:	7f 02                	jg     3e16 <gets+0x2d>
      break;
    3e14:	eb 31                	jmp    3e47 <gets+0x5e>
    buf[i++] = c;
    3e16:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e19:	8d 50 01             	lea    0x1(%eax),%edx
    3e1c:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3e1f:	89 c2                	mov    %eax,%edx
    3e21:	8b 45 08             	mov    0x8(%ebp),%eax
    3e24:	01 c2                	add    %eax,%edx
    3e26:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3e2a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    3e2c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3e30:	3c 0a                	cmp    $0xa,%al
    3e32:	74 13                	je     3e47 <gets+0x5e>
    3e34:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3e38:	3c 0d                	cmp    $0xd,%al
    3e3a:	74 0b                	je     3e47 <gets+0x5e>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3e3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e3f:	83 c0 01             	add    $0x1,%eax
    3e42:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3e45:	7c b1                	jl     3df8 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3e47:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3e4a:	8b 45 08             	mov    0x8(%ebp),%eax
    3e4d:	01 d0                	add    %edx,%eax
    3e4f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    3e52:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3e55:	c9                   	leave  
    3e56:	c3                   	ret    

00003e57 <stat>:

int
stat(char *n, struct stat *st)
{
    3e57:	55                   	push   %ebp
    3e58:	89 e5                	mov    %esp,%ebp
    3e5a:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3e5d:	83 ec 08             	sub    $0x8,%esp
    3e60:	6a 00                	push   $0x0
    3e62:	ff 75 08             	pushl  0x8(%ebp)
    3e65:	e8 0c 01 00 00       	call   3f76 <open>
    3e6a:	83 c4 10             	add    $0x10,%esp
    3e6d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    3e70:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3e74:	79 07                	jns    3e7d <stat+0x26>
    return -1;
    3e76:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3e7b:	eb 25                	jmp    3ea2 <stat+0x4b>
  r = fstat(fd, st);
    3e7d:	83 ec 08             	sub    $0x8,%esp
    3e80:	ff 75 0c             	pushl  0xc(%ebp)
    3e83:	ff 75 f4             	pushl  -0xc(%ebp)
    3e86:	e8 03 01 00 00       	call   3f8e <fstat>
    3e8b:	83 c4 10             	add    $0x10,%esp
    3e8e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    3e91:	83 ec 0c             	sub    $0xc,%esp
    3e94:	ff 75 f4             	pushl  -0xc(%ebp)
    3e97:	e8 c2 00 00 00       	call   3f5e <close>
    3e9c:	83 c4 10             	add    $0x10,%esp
  return r;
    3e9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    3ea2:	c9                   	leave  
    3ea3:	c3                   	ret    

00003ea4 <atoi>:

int
atoi(const char *s)
{
    3ea4:	55                   	push   %ebp
    3ea5:	89 e5                	mov    %esp,%ebp
    3ea7:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    3eaa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    3eb1:	eb 25                	jmp    3ed8 <atoi+0x34>
    n = n*10 + *s++ - '0';
    3eb3:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3eb6:	89 d0                	mov    %edx,%eax
    3eb8:	c1 e0 02             	shl    $0x2,%eax
    3ebb:	01 d0                	add    %edx,%eax
    3ebd:	01 c0                	add    %eax,%eax
    3ebf:	89 c1                	mov    %eax,%ecx
    3ec1:	8b 45 08             	mov    0x8(%ebp),%eax
    3ec4:	8d 50 01             	lea    0x1(%eax),%edx
    3ec7:	89 55 08             	mov    %edx,0x8(%ebp)
    3eca:	0f b6 00             	movzbl (%eax),%eax
    3ecd:	0f be c0             	movsbl %al,%eax
    3ed0:	01 c8                	add    %ecx,%eax
    3ed2:	83 e8 30             	sub    $0x30,%eax
    3ed5:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3ed8:	8b 45 08             	mov    0x8(%ebp),%eax
    3edb:	0f b6 00             	movzbl (%eax),%eax
    3ede:	3c 2f                	cmp    $0x2f,%al
    3ee0:	7e 0a                	jle    3eec <atoi+0x48>
    3ee2:	8b 45 08             	mov    0x8(%ebp),%eax
    3ee5:	0f b6 00             	movzbl (%eax),%eax
    3ee8:	3c 39                	cmp    $0x39,%al
    3eea:	7e c7                	jle    3eb3 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    3eec:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3eef:	c9                   	leave  
    3ef0:	c3                   	ret    

00003ef1 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3ef1:	55                   	push   %ebp
    3ef2:	89 e5                	mov    %esp,%ebp
    3ef4:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    3ef7:	8b 45 08             	mov    0x8(%ebp),%eax
    3efa:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    3efd:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f00:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    3f03:	eb 17                	jmp    3f1c <memmove+0x2b>
    *dst++ = *src++;
    3f05:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f08:	8d 50 01             	lea    0x1(%eax),%edx
    3f0b:	89 55 fc             	mov    %edx,-0x4(%ebp)
    3f0e:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3f11:	8d 4a 01             	lea    0x1(%edx),%ecx
    3f14:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    3f17:	0f b6 12             	movzbl (%edx),%edx
    3f1a:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3f1c:	8b 45 10             	mov    0x10(%ebp),%eax
    3f1f:	8d 50 ff             	lea    -0x1(%eax),%edx
    3f22:	89 55 10             	mov    %edx,0x10(%ebp)
    3f25:	85 c0                	test   %eax,%eax
    3f27:	7f dc                	jg     3f05 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    3f29:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3f2c:	c9                   	leave  
    3f2d:	c3                   	ret    

00003f2e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3f2e:	b8 01 00 00 00       	mov    $0x1,%eax
    3f33:	cd 40                	int    $0x40
    3f35:	c3                   	ret    

00003f36 <exit>:
SYSCALL(exit)
    3f36:	b8 02 00 00 00       	mov    $0x2,%eax
    3f3b:	cd 40                	int    $0x40
    3f3d:	c3                   	ret    

00003f3e <wait>:
SYSCALL(wait)
    3f3e:	b8 03 00 00 00       	mov    $0x3,%eax
    3f43:	cd 40                	int    $0x40
    3f45:	c3                   	ret    

00003f46 <pipe>:
SYSCALL(pipe)
    3f46:	b8 04 00 00 00       	mov    $0x4,%eax
    3f4b:	cd 40                	int    $0x40
    3f4d:	c3                   	ret    

00003f4e <read>:
SYSCALL(read)
    3f4e:	b8 05 00 00 00       	mov    $0x5,%eax
    3f53:	cd 40                	int    $0x40
    3f55:	c3                   	ret    

00003f56 <write>:
SYSCALL(write)
    3f56:	b8 10 00 00 00       	mov    $0x10,%eax
    3f5b:	cd 40                	int    $0x40
    3f5d:	c3                   	ret    

00003f5e <close>:
SYSCALL(close)
    3f5e:	b8 15 00 00 00       	mov    $0x15,%eax
    3f63:	cd 40                	int    $0x40
    3f65:	c3                   	ret    

00003f66 <kill>:
SYSCALL(kill)
    3f66:	b8 06 00 00 00       	mov    $0x6,%eax
    3f6b:	cd 40                	int    $0x40
    3f6d:	c3                   	ret    

00003f6e <exec>:
SYSCALL(exec)
    3f6e:	b8 07 00 00 00       	mov    $0x7,%eax
    3f73:	cd 40                	int    $0x40
    3f75:	c3                   	ret    

00003f76 <open>:
SYSCALL(open)
    3f76:	b8 0f 00 00 00       	mov    $0xf,%eax
    3f7b:	cd 40                	int    $0x40
    3f7d:	c3                   	ret    

00003f7e <mknod>:
SYSCALL(mknod)
    3f7e:	b8 11 00 00 00       	mov    $0x11,%eax
    3f83:	cd 40                	int    $0x40
    3f85:	c3                   	ret    

00003f86 <unlink>:
SYSCALL(unlink)
    3f86:	b8 12 00 00 00       	mov    $0x12,%eax
    3f8b:	cd 40                	int    $0x40
    3f8d:	c3                   	ret    

00003f8e <fstat>:
SYSCALL(fstat)
    3f8e:	b8 08 00 00 00       	mov    $0x8,%eax
    3f93:	cd 40                	int    $0x40
    3f95:	c3                   	ret    

00003f96 <link>:
SYSCALL(link)
    3f96:	b8 13 00 00 00       	mov    $0x13,%eax
    3f9b:	cd 40                	int    $0x40
    3f9d:	c3                   	ret    

00003f9e <mkdir>:
SYSCALL(mkdir)
    3f9e:	b8 14 00 00 00       	mov    $0x14,%eax
    3fa3:	cd 40                	int    $0x40
    3fa5:	c3                   	ret    

00003fa6 <chdir>:
SYSCALL(chdir)
    3fa6:	b8 09 00 00 00       	mov    $0x9,%eax
    3fab:	cd 40                	int    $0x40
    3fad:	c3                   	ret    

00003fae <dup>:
SYSCALL(dup)
    3fae:	b8 0a 00 00 00       	mov    $0xa,%eax
    3fb3:	cd 40                	int    $0x40
    3fb5:	c3                   	ret    

00003fb6 <getpid>:
SYSCALL(getpid)
    3fb6:	b8 0b 00 00 00       	mov    $0xb,%eax
    3fbb:	cd 40                	int    $0x40
    3fbd:	c3                   	ret    

00003fbe <sbrk>:
SYSCALL(sbrk)
    3fbe:	b8 0c 00 00 00       	mov    $0xc,%eax
    3fc3:	cd 40                	int    $0x40
    3fc5:	c3                   	ret    

00003fc6 <sleep>:
SYSCALL(sleep)
    3fc6:	b8 0d 00 00 00       	mov    $0xd,%eax
    3fcb:	cd 40                	int    $0x40
    3fcd:	c3                   	ret    

00003fce <uptime>:
SYSCALL(uptime)
    3fce:	b8 0e 00 00 00       	mov    $0xe,%eax
    3fd3:	cd 40                	int    $0x40
    3fd5:	c3                   	ret    

00003fd6 <getMsg>:
SYSCALL(getMsg)
    3fd6:	b8 16 00 00 00       	mov    $0x16,%eax
    3fdb:	cd 40                	int    $0x40
    3fdd:	c3                   	ret    

00003fde <createWindow>:
SYSCALL(createWindow)
    3fde:	b8 17 00 00 00       	mov    $0x17,%eax
    3fe3:	cd 40                	int    $0x40
    3fe5:	c3                   	ret    

00003fe6 <destroyWindow>:
SYSCALL(destroyWindow)
    3fe6:	b8 18 00 00 00       	mov    $0x18,%eax
    3feb:	cd 40                	int    $0x40
    3fed:	c3                   	ret    

00003fee <updateWindow>:
SYSCALL(updateWindow)
    3fee:	b8 19 00 00 00       	mov    $0x19,%eax
    3ff3:	cd 40                	int    $0x40
    3ff5:	c3                   	ret    

00003ff6 <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    3ff6:	b8 1a 00 00 00       	mov    $0x1a,%eax
    3ffb:	cd 40                	int    $0x40
    3ffd:	c3                   	ret    

00003ffe <kwrite>:
SYSCALL(kwrite)
    3ffe:	b8 1c 00 00 00       	mov    $0x1c,%eax
    4003:	cd 40                	int    $0x40
    4005:	c3                   	ret    

00004006 <setSampleRate>:
SYSCALL(setSampleRate)
    4006:	b8 1b 00 00 00       	mov    $0x1b,%eax
    400b:	cd 40                	int    $0x40
    400d:	c3                   	ret    

0000400e <pause>:
SYSCALL(pause)
    400e:	b8 1d 00 00 00       	mov    $0x1d,%eax
    4013:	cd 40                	int    $0x40
    4015:	c3                   	ret    

00004016 <wavdecode>:
SYSCALL(wavdecode)
    4016:	b8 1e 00 00 00       	mov    $0x1e,%eax
    401b:	cd 40                	int    $0x40
    401d:	c3                   	ret    

0000401e <beginDecode>:
SYSCALL(beginDecode)
    401e:	b8 1f 00 00 00       	mov    $0x1f,%eax
    4023:	cd 40                	int    $0x40
    4025:	c3                   	ret    

00004026 <waitForDecode>:
SYSCALL(waitForDecode)
    4026:	b8 20 00 00 00       	mov    $0x20,%eax
    402b:	cd 40                	int    $0x40
    402d:	c3                   	ret    

0000402e <endDecode>:
SYSCALL(endDecode)
    402e:	b8 21 00 00 00       	mov    $0x21,%eax
    4033:	cd 40                	int    $0x40
    4035:	c3                   	ret    

00004036 <getCoreBuf>:
    4036:	b8 22 00 00 00       	mov    $0x22,%eax
    403b:	cd 40                	int    $0x40
    403d:	c3                   	ret    

0000403e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    403e:	55                   	push   %ebp
    403f:	89 e5                	mov    %esp,%ebp
    4041:	83 ec 18             	sub    $0x18,%esp
    4044:	8b 45 0c             	mov    0xc(%ebp),%eax
    4047:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    404a:	83 ec 04             	sub    $0x4,%esp
    404d:	6a 01                	push   $0x1
    404f:	8d 45 f4             	lea    -0xc(%ebp),%eax
    4052:	50                   	push   %eax
    4053:	ff 75 08             	pushl  0x8(%ebp)
    4056:	e8 fb fe ff ff       	call   3f56 <write>
    405b:	83 c4 10             	add    $0x10,%esp
}
    405e:	c9                   	leave  
    405f:	c3                   	ret    

00004060 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    4060:	55                   	push   %ebp
    4061:	89 e5                	mov    %esp,%ebp
    4063:	53                   	push   %ebx
    4064:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    4067:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    406e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    4072:	74 17                	je     408b <printint+0x2b>
    4074:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    4078:	79 11                	jns    408b <printint+0x2b>
    neg = 1;
    407a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    4081:	8b 45 0c             	mov    0xc(%ebp),%eax
    4084:	f7 d8                	neg    %eax
    4086:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4089:	eb 06                	jmp    4091 <printint+0x31>
  } else {
    x = xx;
    408b:	8b 45 0c             	mov    0xc(%ebp),%eax
    408e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    4091:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    4098:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    409b:	8d 41 01             	lea    0x1(%ecx),%eax
    409e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    40a1:	8b 5d 10             	mov    0x10(%ebp),%ebx
    40a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    40a7:	ba 00 00 00 00       	mov    $0x0,%edx
    40ac:	f7 f3                	div    %ebx
    40ae:	89 d0                	mov    %edx,%eax
    40b0:	0f b6 80 34 ee 00 00 	movzbl 0xee34(%eax),%eax
    40b7:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    40bb:	8b 5d 10             	mov    0x10(%ebp),%ebx
    40be:	8b 45 ec             	mov    -0x14(%ebp),%eax
    40c1:	ba 00 00 00 00       	mov    $0x0,%edx
    40c6:	f7 f3                	div    %ebx
    40c8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    40cb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    40cf:	75 c7                	jne    4098 <printint+0x38>
  if(neg)
    40d1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    40d5:	74 0e                	je     40e5 <printint+0x85>
    buf[i++] = '-';
    40d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40da:	8d 50 01             	lea    0x1(%eax),%edx
    40dd:	89 55 f4             	mov    %edx,-0xc(%ebp)
    40e0:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    40e5:	eb 1d                	jmp    4104 <printint+0xa4>
    putc(fd, buf[i]);
    40e7:	8d 55 dc             	lea    -0x24(%ebp),%edx
    40ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40ed:	01 d0                	add    %edx,%eax
    40ef:	0f b6 00             	movzbl (%eax),%eax
    40f2:	0f be c0             	movsbl %al,%eax
    40f5:	83 ec 08             	sub    $0x8,%esp
    40f8:	50                   	push   %eax
    40f9:	ff 75 08             	pushl  0x8(%ebp)
    40fc:	e8 3d ff ff ff       	call   403e <putc>
    4101:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    4104:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    4108:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    410c:	79 d9                	jns    40e7 <printint+0x87>
    putc(fd, buf[i]);
}
    410e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4111:	c9                   	leave  
    4112:	c3                   	ret    

00004113 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    4113:	55                   	push   %ebp
    4114:	89 e5                	mov    %esp,%ebp
    4116:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    4119:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    4120:	8d 45 0c             	lea    0xc(%ebp),%eax
    4123:	83 c0 04             	add    $0x4,%eax
    4126:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    4129:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4130:	e9 59 01 00 00       	jmp    428e <printf+0x17b>
    c = fmt[i] & 0xff;
    4135:	8b 55 0c             	mov    0xc(%ebp),%edx
    4138:	8b 45 f0             	mov    -0x10(%ebp),%eax
    413b:	01 d0                	add    %edx,%eax
    413d:	0f b6 00             	movzbl (%eax),%eax
    4140:	0f be c0             	movsbl %al,%eax
    4143:	25 ff 00 00 00       	and    $0xff,%eax
    4148:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    414b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    414f:	75 2c                	jne    417d <printf+0x6a>
      if(c == '%'){
    4151:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    4155:	75 0c                	jne    4163 <printf+0x50>
        state = '%';
    4157:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    415e:	e9 27 01 00 00       	jmp    428a <printf+0x177>
      } else {
        putc(fd, c);
    4163:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4166:	0f be c0             	movsbl %al,%eax
    4169:	83 ec 08             	sub    $0x8,%esp
    416c:	50                   	push   %eax
    416d:	ff 75 08             	pushl  0x8(%ebp)
    4170:	e8 c9 fe ff ff       	call   403e <putc>
    4175:	83 c4 10             	add    $0x10,%esp
    4178:	e9 0d 01 00 00       	jmp    428a <printf+0x177>
      }
    } else if(state == '%'){
    417d:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    4181:	0f 85 03 01 00 00    	jne    428a <printf+0x177>
      if(c == 'd'){
    4187:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    418b:	75 1e                	jne    41ab <printf+0x98>
        printint(fd, *ap, 10, 1);
    418d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4190:	8b 00                	mov    (%eax),%eax
    4192:	6a 01                	push   $0x1
    4194:	6a 0a                	push   $0xa
    4196:	50                   	push   %eax
    4197:	ff 75 08             	pushl  0x8(%ebp)
    419a:	e8 c1 fe ff ff       	call   4060 <printint>
    419f:	83 c4 10             	add    $0x10,%esp
        ap++;
    41a2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    41a6:	e9 d8 00 00 00       	jmp    4283 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
    41ab:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    41af:	74 06                	je     41b7 <printf+0xa4>
    41b1:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    41b5:	75 1e                	jne    41d5 <printf+0xc2>
        printint(fd, *ap, 16, 0);
    41b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    41ba:	8b 00                	mov    (%eax),%eax
    41bc:	6a 00                	push   $0x0
    41be:	6a 10                	push   $0x10
    41c0:	50                   	push   %eax
    41c1:	ff 75 08             	pushl  0x8(%ebp)
    41c4:	e8 97 fe ff ff       	call   4060 <printint>
    41c9:	83 c4 10             	add    $0x10,%esp
        ap++;
    41cc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    41d0:	e9 ae 00 00 00       	jmp    4283 <printf+0x170>
      } else if(c == 's'){
    41d5:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    41d9:	75 43                	jne    421e <printf+0x10b>
        s = (char*)*ap;
    41db:	8b 45 e8             	mov    -0x18(%ebp),%eax
    41de:	8b 00                	mov    (%eax),%eax
    41e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    41e3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    41e7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    41eb:	75 07                	jne    41f4 <printf+0xe1>
          s = "(null)";
    41ed:	c7 45 f4 73 ae 00 00 	movl   $0xae73,-0xc(%ebp)
        while(*s != 0){
    41f4:	eb 1c                	jmp    4212 <printf+0xff>
          putc(fd, *s);
    41f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41f9:	0f b6 00             	movzbl (%eax),%eax
    41fc:	0f be c0             	movsbl %al,%eax
    41ff:	83 ec 08             	sub    $0x8,%esp
    4202:	50                   	push   %eax
    4203:	ff 75 08             	pushl  0x8(%ebp)
    4206:	e8 33 fe ff ff       	call   403e <putc>
    420b:	83 c4 10             	add    $0x10,%esp
          s++;
    420e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    4212:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4215:	0f b6 00             	movzbl (%eax),%eax
    4218:	84 c0                	test   %al,%al
    421a:	75 da                	jne    41f6 <printf+0xe3>
    421c:	eb 65                	jmp    4283 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    421e:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    4222:	75 1d                	jne    4241 <printf+0x12e>
        putc(fd, *ap);
    4224:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4227:	8b 00                	mov    (%eax),%eax
    4229:	0f be c0             	movsbl %al,%eax
    422c:	83 ec 08             	sub    $0x8,%esp
    422f:	50                   	push   %eax
    4230:	ff 75 08             	pushl  0x8(%ebp)
    4233:	e8 06 fe ff ff       	call   403e <putc>
    4238:	83 c4 10             	add    $0x10,%esp
        ap++;
    423b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    423f:	eb 42                	jmp    4283 <printf+0x170>
      } else if(c == '%'){
    4241:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    4245:	75 17                	jne    425e <printf+0x14b>
        putc(fd, c);
    4247:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    424a:	0f be c0             	movsbl %al,%eax
    424d:	83 ec 08             	sub    $0x8,%esp
    4250:	50                   	push   %eax
    4251:	ff 75 08             	pushl  0x8(%ebp)
    4254:	e8 e5 fd ff ff       	call   403e <putc>
    4259:	83 c4 10             	add    $0x10,%esp
    425c:	eb 25                	jmp    4283 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    425e:	83 ec 08             	sub    $0x8,%esp
    4261:	6a 25                	push   $0x25
    4263:	ff 75 08             	pushl  0x8(%ebp)
    4266:	e8 d3 fd ff ff       	call   403e <putc>
    426b:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
    426e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4271:	0f be c0             	movsbl %al,%eax
    4274:	83 ec 08             	sub    $0x8,%esp
    4277:	50                   	push   %eax
    4278:	ff 75 08             	pushl  0x8(%ebp)
    427b:	e8 be fd ff ff       	call   403e <putc>
    4280:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    4283:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    428a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    428e:	8b 55 0c             	mov    0xc(%ebp),%edx
    4291:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4294:	01 d0                	add    %edx,%eax
    4296:	0f b6 00             	movzbl (%eax),%eax
    4299:	84 c0                	test   %al,%al
    429b:	0f 85 94 fe ff ff    	jne    4135 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    42a1:	c9                   	leave  
    42a2:	c3                   	ret    

000042a3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    42a3:	55                   	push   %ebp
    42a4:	89 e5                	mov    %esp,%ebp
    42a6:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    42a9:	8b 45 08             	mov    0x8(%ebp),%eax
    42ac:	83 e8 08             	sub    $0x8,%eax
    42af:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    42b2:	a1 18 f4 00 00       	mov    0xf418,%eax
    42b7:	89 45 fc             	mov    %eax,-0x4(%ebp)
    42ba:	eb 24                	jmp    42e0 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    42bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42bf:	8b 00                	mov    (%eax),%eax
    42c1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    42c4:	77 12                	ja     42d8 <free+0x35>
    42c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    42c9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    42cc:	77 24                	ja     42f2 <free+0x4f>
    42ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42d1:	8b 00                	mov    (%eax),%eax
    42d3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    42d6:	77 1a                	ja     42f2 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    42d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42db:	8b 00                	mov    (%eax),%eax
    42dd:	89 45 fc             	mov    %eax,-0x4(%ebp)
    42e0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    42e3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    42e6:	76 d4                	jbe    42bc <free+0x19>
    42e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42eb:	8b 00                	mov    (%eax),%eax
    42ed:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    42f0:	76 ca                	jbe    42bc <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    42f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    42f5:	8b 40 04             	mov    0x4(%eax),%eax
    42f8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    42ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4302:	01 c2                	add    %eax,%edx
    4304:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4307:	8b 00                	mov    (%eax),%eax
    4309:	39 c2                	cmp    %eax,%edx
    430b:	75 24                	jne    4331 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    430d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4310:	8b 50 04             	mov    0x4(%eax),%edx
    4313:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4316:	8b 00                	mov    (%eax),%eax
    4318:	8b 40 04             	mov    0x4(%eax),%eax
    431b:	01 c2                	add    %eax,%edx
    431d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4320:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    4323:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4326:	8b 00                	mov    (%eax),%eax
    4328:	8b 10                	mov    (%eax),%edx
    432a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    432d:	89 10                	mov    %edx,(%eax)
    432f:	eb 0a                	jmp    433b <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    4331:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4334:	8b 10                	mov    (%eax),%edx
    4336:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4339:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    433b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    433e:	8b 40 04             	mov    0x4(%eax),%eax
    4341:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4348:	8b 45 fc             	mov    -0x4(%ebp),%eax
    434b:	01 d0                	add    %edx,%eax
    434d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4350:	75 20                	jne    4372 <free+0xcf>
    p->s.size += bp->s.size;
    4352:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4355:	8b 50 04             	mov    0x4(%eax),%edx
    4358:	8b 45 f8             	mov    -0x8(%ebp),%eax
    435b:	8b 40 04             	mov    0x4(%eax),%eax
    435e:	01 c2                	add    %eax,%edx
    4360:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4363:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    4366:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4369:	8b 10                	mov    (%eax),%edx
    436b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    436e:	89 10                	mov    %edx,(%eax)
    4370:	eb 08                	jmp    437a <free+0xd7>
  } else
    p->s.ptr = bp;
    4372:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4375:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4378:	89 10                	mov    %edx,(%eax)
  freep = p;
    437a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    437d:	a3 18 f4 00 00       	mov    %eax,0xf418
}
    4382:	c9                   	leave  
    4383:	c3                   	ret    

00004384 <morecore>:

static Header*
morecore(uint nu)
{
    4384:	55                   	push   %ebp
    4385:	89 e5                	mov    %esp,%ebp
    4387:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    438a:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    4391:	77 07                	ja     439a <morecore+0x16>
    nu = 4096;
    4393:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    439a:	8b 45 08             	mov    0x8(%ebp),%eax
    439d:	c1 e0 03             	shl    $0x3,%eax
    43a0:	83 ec 0c             	sub    $0xc,%esp
    43a3:	50                   	push   %eax
    43a4:	e8 15 fc ff ff       	call   3fbe <sbrk>
    43a9:	83 c4 10             	add    $0x10,%esp
    43ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    43af:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    43b3:	75 07                	jne    43bc <morecore+0x38>
    return 0;
    43b5:	b8 00 00 00 00       	mov    $0x0,%eax
    43ba:	eb 26                	jmp    43e2 <morecore+0x5e>
  hp = (Header*)p;
    43bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    43c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    43c5:	8b 55 08             	mov    0x8(%ebp),%edx
    43c8:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    43cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    43ce:	83 c0 08             	add    $0x8,%eax
    43d1:	83 ec 0c             	sub    $0xc,%esp
    43d4:	50                   	push   %eax
    43d5:	e8 c9 fe ff ff       	call   42a3 <free>
    43da:	83 c4 10             	add    $0x10,%esp
  return freep;
    43dd:	a1 18 f4 00 00       	mov    0xf418,%eax
}
    43e2:	c9                   	leave  
    43e3:	c3                   	ret    

000043e4 <malloc>:

void*
malloc(uint nbytes)
{
    43e4:	55                   	push   %ebp
    43e5:	89 e5                	mov    %esp,%ebp
    43e7:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    43ea:	8b 45 08             	mov    0x8(%ebp),%eax
    43ed:	83 c0 07             	add    $0x7,%eax
    43f0:	c1 e8 03             	shr    $0x3,%eax
    43f3:	83 c0 01             	add    $0x1,%eax
    43f6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    43f9:	a1 18 f4 00 00       	mov    0xf418,%eax
    43fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4401:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4405:	75 23                	jne    442a <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    4407:	c7 45 f0 10 f4 00 00 	movl   $0xf410,-0x10(%ebp)
    440e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4411:	a3 18 f4 00 00       	mov    %eax,0xf418
    4416:	a1 18 f4 00 00       	mov    0xf418,%eax
    441b:	a3 10 f4 00 00       	mov    %eax,0xf410
    base.s.size = 0;
    4420:	c7 05 14 f4 00 00 00 	movl   $0x0,0xf414
    4427:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    442a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    442d:	8b 00                	mov    (%eax),%eax
    442f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    4432:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4435:	8b 40 04             	mov    0x4(%eax),%eax
    4438:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    443b:	72 4d                	jb     448a <malloc+0xa6>
      if(p->s.size == nunits)
    443d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4440:	8b 40 04             	mov    0x4(%eax),%eax
    4443:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4446:	75 0c                	jne    4454 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    4448:	8b 45 f4             	mov    -0xc(%ebp),%eax
    444b:	8b 10                	mov    (%eax),%edx
    444d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4450:	89 10                	mov    %edx,(%eax)
    4452:	eb 26                	jmp    447a <malloc+0x96>
      else {
        p->s.size -= nunits;
    4454:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4457:	8b 40 04             	mov    0x4(%eax),%eax
    445a:	2b 45 ec             	sub    -0x14(%ebp),%eax
    445d:	89 c2                	mov    %eax,%edx
    445f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4462:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    4465:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4468:	8b 40 04             	mov    0x4(%eax),%eax
    446b:	c1 e0 03             	shl    $0x3,%eax
    446e:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    4471:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4474:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4477:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    447a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    447d:	a3 18 f4 00 00       	mov    %eax,0xf418
      return (void*)(p + 1);
    4482:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4485:	83 c0 08             	add    $0x8,%eax
    4488:	eb 3b                	jmp    44c5 <malloc+0xe1>
    }
    if(p == freep)
    448a:	a1 18 f4 00 00       	mov    0xf418,%eax
    448f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    4492:	75 1e                	jne    44b2 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
    4494:	83 ec 0c             	sub    $0xc,%esp
    4497:	ff 75 ec             	pushl  -0x14(%ebp)
    449a:	e8 e5 fe ff ff       	call   4384 <morecore>
    449f:	83 c4 10             	add    $0x10,%esp
    44a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    44a5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    44a9:	75 07                	jne    44b2 <malloc+0xce>
        return 0;
    44ab:	b8 00 00 00 00       	mov    $0x0,%eax
    44b0:	eb 13                	jmp    44c5 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    44b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    44b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44bb:	8b 00                	mov    (%eax),%eax
    44bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    44c0:	e9 6d ff ff ff       	jmp    4432 <malloc+0x4e>
}
    44c5:	c9                   	leave  
    44c6:	c3                   	ret    

000044c7 <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    44c7:	55                   	push   %ebp
    44c8:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    44ca:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    44ce:	79 07                	jns    44d7 <abs+0x10>
		return x * -1;
    44d0:	8b 45 08             	mov    0x8(%ebp),%eax
    44d3:	f7 d8                	neg    %eax
    44d5:	eb 03                	jmp    44da <abs+0x13>
	else
		return x;
    44d7:	8b 45 08             	mov    0x8(%ebp),%eax
}
    44da:	5d                   	pop    %ebp
    44db:	c3                   	ret    

000044dc <sin>:
double sin(double x)  
{  
    44dc:	55                   	push   %ebp
    44dd:	89 e5                	mov    %esp,%ebp
    44df:	83 ec 40             	sub    $0x40,%esp
    44e2:	8b 45 08             	mov    0x8(%ebp),%eax
    44e5:	89 45 c8             	mov    %eax,-0x38(%ebp)
    44e8:	8b 45 0c             	mov    0xc(%ebp),%eax
    44eb:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    44ee:	dd 45 c8             	fldl   -0x38(%ebp)
    44f1:	dd 5d f8             	fstpl  -0x8(%ebp)
    44f4:	d9 e8                	fld1   
    44f6:	dd 5d f0             	fstpl  -0x10(%ebp)
    44f9:	dd 45 c8             	fldl   -0x38(%ebp)
    44fc:	dd 5d e8             	fstpl  -0x18(%ebp)
    44ff:	dd 45 c8             	fldl   -0x38(%ebp)
    4502:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    4505:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    450c:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    4513:	eb 50                	jmp    4565 <sin+0x89>
	{  
		n = n+1;  
    4515:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    4519:	db 45 dc             	fildl  -0x24(%ebp)
    451c:	dc 4d f0             	fmull  -0x10(%ebp)
    451f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4522:	83 c0 01             	add    $0x1,%eax
    4525:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    4528:	db 45 c4             	fildl  -0x3c(%ebp)
    452b:	de c9                	fmulp  %st,%st(1)
    452d:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    4530:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    4534:	dd 45 c8             	fldl   -0x38(%ebp)
    4537:	dc 4d c8             	fmull  -0x38(%ebp)
    453a:	dd 45 e8             	fldl   -0x18(%ebp)
    453d:	de c9                	fmulp  %st,%st(1)
    453f:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    4542:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    4545:	dd 45 e8             	fldl   -0x18(%ebp)
    4548:	dc 75 f0             	fdivl  -0x10(%ebp)
    454b:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    454e:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    4552:	7e 08                	jle    455c <sin+0x80>
    4554:	dd 45 f8             	fldl   -0x8(%ebp)
    4557:	dc 45 e0             	faddl  -0x20(%ebp)
    455a:	eb 06                	jmp    4562 <sin+0x86>
    455c:	dd 45 f8             	fldl   -0x8(%ebp)
    455f:	dc 65 e0             	fsubl  -0x20(%ebp)
    4562:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    4565:	dd 45 e0             	fldl   -0x20(%ebp)
    4568:	dd 05 80 ae 00 00    	fldl   0xae80
    456e:	d9 c9                	fxch   %st(1)
    4570:	df e9                	fucomip %st(1),%st
    4572:	dd d8                	fstp   %st(0)
    4574:	77 9f                	ja     4515 <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    4576:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    4579:	c9                   	leave  
    457a:	c3                   	ret    

0000457b <cos>:
double cos(double x)  
{  
    457b:	55                   	push   %ebp
    457c:	89 e5                	mov    %esp,%ebp
    457e:	83 ec 08             	sub    $0x8,%esp
    4581:	8b 45 08             	mov    0x8(%ebp),%eax
    4584:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4587:	8b 45 0c             	mov    0xc(%ebp),%eax
    458a:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    458d:	dd 05 88 ae 00 00    	fldl   0xae88
    4593:	dc 65 f8             	fsubl  -0x8(%ebp)
    4596:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    459a:	dd 1c 24             	fstpl  (%esp)
    459d:	e8 3a ff ff ff       	call   44dc <sin>
    45a2:	83 c4 08             	add    $0x8,%esp
}  
    45a5:	c9                   	leave  
    45a6:	c3                   	ret    

000045a7 <tan>:
double tan(double x)  
{  
    45a7:	55                   	push   %ebp
    45a8:	89 e5                	mov    %esp,%ebp
    45aa:	83 ec 10             	sub    $0x10,%esp
    45ad:	8b 45 08             	mov    0x8(%ebp),%eax
    45b0:	89 45 f8             	mov    %eax,-0x8(%ebp)
    45b3:	8b 45 0c             	mov    0xc(%ebp),%eax
    45b6:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    45b9:	ff 75 fc             	pushl  -0x4(%ebp)
    45bc:	ff 75 f8             	pushl  -0x8(%ebp)
    45bf:	e8 18 ff ff ff       	call   44dc <sin>
    45c4:	83 c4 08             	add    $0x8,%esp
    45c7:	dd 5d f0             	fstpl  -0x10(%ebp)
    45ca:	ff 75 fc             	pushl  -0x4(%ebp)
    45cd:	ff 75 f8             	pushl  -0x8(%ebp)
    45d0:	e8 a6 ff ff ff       	call   457b <cos>
    45d5:	83 c4 08             	add    $0x8,%esp
    45d8:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    45db:	c9                   	leave  
    45dc:	c3                   	ret    

000045dd <pow>:

double pow(double x, double y)
{
    45dd:	55                   	push   %ebp
    45de:	89 e5                	mov    %esp,%ebp
    45e0:	83 ec 38             	sub    $0x38,%esp
    45e3:	8b 45 08             	mov    0x8(%ebp),%eax
    45e6:	89 45 e0             	mov    %eax,-0x20(%ebp)
    45e9:	8b 45 0c             	mov    0xc(%ebp),%eax
    45ec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    45ef:	8b 45 10             	mov    0x10(%ebp),%eax
    45f2:	89 45 d8             	mov    %eax,-0x28(%ebp)
    45f5:	8b 45 14             	mov    0x14(%ebp),%eax
    45f8:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    45fb:	dd 45 e0             	fldl   -0x20(%ebp)
    45fe:	d9 ee                	fldz   
    4600:	df e9                	fucomip %st(1),%st
    4602:	dd d8                	fstp   %st(0)
    4604:	7a 28                	jp     462e <pow+0x51>
    4606:	dd 45 e0             	fldl   -0x20(%ebp)
    4609:	d9 ee                	fldz   
    460b:	df e9                	fucomip %st(1),%st
    460d:	dd d8                	fstp   %st(0)
    460f:	75 1d                	jne    462e <pow+0x51>
    4611:	dd 45 d8             	fldl   -0x28(%ebp)
    4614:	d9 ee                	fldz   
    4616:	df e9                	fucomip %st(1),%st
    4618:	dd d8                	fstp   %st(0)
    461a:	7a 0b                	jp     4627 <pow+0x4a>
    461c:	dd 45 d8             	fldl   -0x28(%ebp)
    461f:	d9 ee                	fldz   
    4621:	df e9                	fucomip %st(1),%st
    4623:	dd d8                	fstp   %st(0)
    4625:	74 07                	je     462e <pow+0x51>
    4627:	d9 ee                	fldz   
    4629:	e9 3a 01 00 00       	jmp    4768 <pow+0x18b>
	else if(x==0 && y==0) return 1;
    462e:	dd 45 e0             	fldl   -0x20(%ebp)
    4631:	d9 ee                	fldz   
    4633:	df e9                	fucomip %st(1),%st
    4635:	dd d8                	fstp   %st(0)
    4637:	7a 28                	jp     4661 <pow+0x84>
    4639:	dd 45 e0             	fldl   -0x20(%ebp)
    463c:	d9 ee                	fldz   
    463e:	df e9                	fucomip %st(1),%st
    4640:	dd d8                	fstp   %st(0)
    4642:	75 1d                	jne    4661 <pow+0x84>
    4644:	dd 45 d8             	fldl   -0x28(%ebp)
    4647:	d9 ee                	fldz   
    4649:	df e9                	fucomip %st(1),%st
    464b:	dd d8                	fstp   %st(0)
    464d:	7a 12                	jp     4661 <pow+0x84>
    464f:	dd 45 d8             	fldl   -0x28(%ebp)
    4652:	d9 ee                	fldz   
    4654:	df e9                	fucomip %st(1),%st
    4656:	dd d8                	fstp   %st(0)
    4658:	75 07                	jne    4661 <pow+0x84>
    465a:	d9 e8                	fld1   
    465c:	e9 07 01 00 00       	jmp    4768 <pow+0x18b>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    4661:	d9 ee                	fldz   
    4663:	dd 45 d8             	fldl   -0x28(%ebp)
    4666:	d9 c9                	fxch   %st(1)
    4668:	df e9                	fucomip %st(1),%st
    466a:	dd d8                	fstp   %st(0)
    466c:	76 23                	jbe    4691 <pow+0xb4>
    466e:	dd 45 d8             	fldl   -0x28(%ebp)
    4671:	d9 e0                	fchs   
    4673:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4677:	dd 1c 24             	fstpl  (%esp)
    467a:	ff 75 e4             	pushl  -0x1c(%ebp)
    467d:	ff 75 e0             	pushl  -0x20(%ebp)
    4680:	e8 58 ff ff ff       	call   45dd <pow>
    4685:	83 c4 10             	add    $0x10,%esp
    4688:	d9 e8                	fld1   
    468a:	de f1                	fdivp  %st,%st(1)
    468c:	e9 d7 00 00 00       	jmp    4768 <pow+0x18b>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    4691:	d9 ee                	fldz   
    4693:	dd 45 e0             	fldl   -0x20(%ebp)
    4696:	d9 c9                	fxch   %st(1)
    4698:	df e9                	fucomip %st(1),%st
    469a:	dd d8                	fstp   %st(0)
    469c:	76 3a                	jbe    46d8 <pow+0xfb>
    469e:	dd 45 d8             	fldl   -0x28(%ebp)
    46a1:	d9 7d d6             	fnstcw -0x2a(%ebp)
    46a4:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    46a8:	b4 0c                	mov    $0xc,%ah
    46aa:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    46ae:	d9 6d d4             	fldcw  -0x2c(%ebp)
    46b1:	db 5d cc             	fistpl -0x34(%ebp)
    46b4:	d9 6d d6             	fldcw  -0x2a(%ebp)
    46b7:	db 45 cc             	fildl  -0x34(%ebp)
    46ba:	dd 45 d8             	fldl   -0x28(%ebp)
    46bd:	de e1                	fsubp  %st,%st(1)
    46bf:	d9 ee                	fldz   
    46c1:	df e9                	fucomip %st(1),%st
    46c3:	7a 0a                	jp     46cf <pow+0xf2>
    46c5:	d9 ee                	fldz   
    46c7:	df e9                	fucomip %st(1),%st
    46c9:	dd d8                	fstp   %st(0)
    46cb:	74 0b                	je     46d8 <pow+0xfb>
    46cd:	eb 02                	jmp    46d1 <pow+0xf4>
    46cf:	dd d8                	fstp   %st(0)
    46d1:	d9 ee                	fldz   
    46d3:	e9 90 00 00 00       	jmp    4768 <pow+0x18b>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    46d8:	d9 ee                	fldz   
    46da:	dd 45 e0             	fldl   -0x20(%ebp)
    46dd:	d9 c9                	fxch   %st(1)
    46df:	df e9                	fucomip %st(1),%st
    46e1:	dd d8                	fstp   %st(0)
    46e3:	76 5d                	jbe    4742 <pow+0x165>
    46e5:	dd 45 d8             	fldl   -0x28(%ebp)
    46e8:	d9 7d d6             	fnstcw -0x2a(%ebp)
    46eb:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    46ef:	b4 0c                	mov    $0xc,%ah
    46f1:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    46f5:	d9 6d d4             	fldcw  -0x2c(%ebp)
    46f8:	db 5d cc             	fistpl -0x34(%ebp)
    46fb:	d9 6d d6             	fldcw  -0x2a(%ebp)
    46fe:	db 45 cc             	fildl  -0x34(%ebp)
    4701:	dd 45 d8             	fldl   -0x28(%ebp)
    4704:	de e1                	fsubp  %st,%st(1)
    4706:	d9 ee                	fldz   
    4708:	df e9                	fucomip %st(1),%st
    470a:	7a 34                	jp     4740 <pow+0x163>
    470c:	d9 ee                	fldz   
    470e:	df e9                	fucomip %st(1),%st
    4710:	dd d8                	fstp   %st(0)
    4712:	75 2e                	jne    4742 <pow+0x165>
	{
		double powint=1;
    4714:	d9 e8                	fld1   
    4716:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    4719:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    4720:	eb 0d                	jmp    472f <pow+0x152>
    4722:	dd 45 f0             	fldl   -0x10(%ebp)
    4725:	dc 4d e0             	fmull  -0x20(%ebp)
    4728:	dd 5d f0             	fstpl  -0x10(%ebp)
    472b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    472f:	db 45 ec             	fildl  -0x14(%ebp)
    4732:	dd 45 d8             	fldl   -0x28(%ebp)
    4735:	df e9                	fucomip %st(1),%st
    4737:	dd d8                	fstp   %st(0)
    4739:	73 e7                	jae    4722 <pow+0x145>
		return powint;
    473b:	dd 45 f0             	fldl   -0x10(%ebp)
    473e:	eb 28                	jmp    4768 <pow+0x18b>
    4740:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    4742:	83 ec 08             	sub    $0x8,%esp
    4745:	ff 75 e4             	pushl  -0x1c(%ebp)
    4748:	ff 75 e0             	pushl  -0x20(%ebp)
    474b:	e8 49 00 00 00       	call   4799 <ln>
    4750:	83 c4 10             	add    $0x10,%esp
    4753:	dc 4d d8             	fmull  -0x28(%ebp)
    4756:	83 ec 08             	sub    $0x8,%esp
    4759:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    475d:	dd 1c 24             	fstpl  (%esp)
    4760:	e8 2a 02 00 00       	call   498f <exp>
    4765:	83 c4 10             	add    $0x10,%esp
}
    4768:	c9                   	leave  
    4769:	c3                   	ret    

0000476a <sqrt>:
// 求根
double sqrt(double x)
{
    476a:	55                   	push   %ebp
    476b:	89 e5                	mov    %esp,%ebp
    476d:	83 ec 18             	sub    $0x18,%esp
    4770:	8b 45 08             	mov    0x8(%ebp),%eax
    4773:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4776:	8b 45 0c             	mov    0xc(%ebp),%eax
    4779:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    477c:	dd 05 90 ae 00 00    	fldl   0xae90
    4782:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4786:	dd 1c 24             	fstpl  (%esp)
    4789:	ff 75 f4             	pushl  -0xc(%ebp)
    478c:	ff 75 f0             	pushl  -0x10(%ebp)
    478f:	e8 49 fe ff ff       	call   45dd <pow>
    4794:	83 c4 10             	add    $0x10,%esp
}
    4797:	c9                   	leave  
    4798:	c3                   	ret    

00004799 <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    4799:	55                   	push   %ebp
    479a:	89 e5                	mov    %esp,%ebp
    479c:	83 ec 78             	sub    $0x78,%esp
    479f:	8b 45 08             	mov    0x8(%ebp),%eax
    47a2:	89 45 90             	mov    %eax,-0x70(%ebp)
    47a5:	8b 45 0c             	mov    0xc(%ebp),%eax
    47a8:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    47ab:	dd 45 90             	fldl   -0x70(%ebp)
    47ae:	d9 e8                	fld1   
    47b0:	de e9                	fsubrp %st,%st(1)
    47b2:	dd 5d c0             	fstpl  -0x40(%ebp)
    47b5:	d9 ee                	fldz   
    47b7:	dd 5d f0             	fstpl  -0x10(%ebp)
    47ba:	d9 ee                	fldz   
    47bc:	dd 5d b8             	fstpl  -0x48(%ebp)
    47bf:	d9 ee                	fldz   
    47c1:	dd 5d b0             	fstpl  -0x50(%ebp)
    47c4:	d9 ee                	fldz   
    47c6:	dd 5d e8             	fstpl  -0x18(%ebp)
    47c9:	d9 e8                	fld1   
    47cb:	dd 5d e0             	fstpl  -0x20(%ebp)
    47ce:	d9 e8                	fld1   
    47d0:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    47d3:	dd 45 90             	fldl   -0x70(%ebp)
    47d6:	d9 e8                	fld1   
    47d8:	df e9                	fucomip %st(1),%st
    47da:	dd d8                	fstp   %st(0)
    47dc:	7a 12                	jp     47f0 <ln+0x57>
    47de:	dd 45 90             	fldl   -0x70(%ebp)
    47e1:	d9 e8                	fld1   
    47e3:	df e9                	fucomip %st(1),%st
    47e5:	dd d8                	fstp   %st(0)
    47e7:	75 07                	jne    47f0 <ln+0x57>
    47e9:	d9 ee                	fldz   
    47eb:	e9 9d 01 00 00       	jmp    498d <ln+0x1f4>
	else if(x>2) return -ln(1/x);
    47f0:	dd 45 90             	fldl   -0x70(%ebp)
    47f3:	dd 05 98 ae 00 00    	fldl   0xae98
    47f9:	d9 c9                	fxch   %st(1)
    47fb:	df e9                	fucomip %st(1),%st
    47fd:	dd d8                	fstp   %st(0)
    47ff:	76 1e                	jbe    481f <ln+0x86>
    4801:	d9 e8                	fld1   
    4803:	dc 75 90             	fdivl  -0x70(%ebp)
    4806:	83 ec 08             	sub    $0x8,%esp
    4809:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    480d:	dd 1c 24             	fstpl  (%esp)
    4810:	e8 84 ff ff ff       	call   4799 <ln>
    4815:	83 c4 10             	add    $0x10,%esp
    4818:	d9 e0                	fchs   
    481a:	e9 6e 01 00 00       	jmp    498d <ln+0x1f4>
	else if(x<.1)
    481f:	dd 05 a0 ae 00 00    	fldl   0xaea0
    4825:	dd 45 90             	fldl   -0x70(%ebp)
    4828:	d9 c9                	fxch   %st(1)
    482a:	df e9                	fucomip %st(1),%st
    482c:	dd d8                	fstp   %st(0)
    482e:	76 65                	jbe    4895 <ln+0xfc>
	{
		double n=-1;
    4830:	d9 e8                	fld1   
    4832:	d9 e0                	fchs   
    4834:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    4837:	dd 45 c8             	fldl   -0x38(%ebp)
    483a:	dd 05 a8 ae 00 00    	fldl   0xaea8
    4840:	de e9                	fsubrp %st,%st(1)
    4842:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    4845:	83 ec 08             	sub    $0x8,%esp
    4848:	ff 75 cc             	pushl  -0x34(%ebp)
    484b:	ff 75 c8             	pushl  -0x38(%ebp)
    484e:	e8 3c 01 00 00       	call   498f <exp>
    4853:	83 c4 10             	add    $0x10,%esp
    4856:	dd 45 90             	fldl   -0x70(%ebp)
    4859:	de f1                	fdivp  %st,%st(1)
    485b:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    485e:	dd 45 a0             	fldl   -0x60(%ebp)
    4861:	dd 05 98 ae 00 00    	fldl   0xae98
    4867:	d9 c9                	fxch   %st(1)
    4869:	df e9                	fucomip %st(1),%st
    486b:	dd d8                	fstp   %st(0)
    486d:	77 c8                	ja     4837 <ln+0x9e>
    486f:	d9 e8                	fld1   
    4871:	dd 45 a0             	fldl   -0x60(%ebp)
    4874:	d9 c9                	fxch   %st(1)
    4876:	df e9                	fucomip %st(1),%st
    4878:	dd d8                	fstp   %st(0)
    487a:	77 bb                	ja     4837 <ln+0x9e>
		return ln(a)+n;
    487c:	83 ec 08             	sub    $0x8,%esp
    487f:	ff 75 a4             	pushl  -0x5c(%ebp)
    4882:	ff 75 a0             	pushl  -0x60(%ebp)
    4885:	e8 0f ff ff ff       	call   4799 <ln>
    488a:	83 c4 10             	add    $0x10,%esp
    488d:	dc 45 c8             	faddl  -0x38(%ebp)
    4890:	e9 f8 00 00 00       	jmp    498d <ln+0x1f4>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    4895:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    489c:	d9 e8                	fld1   
    489e:	dd 5d d8             	fstpl  -0x28(%ebp)
    48a1:	e9 b6 00 00 00       	jmp    495c <ln+0x1c3>
	{
		ln_tmp=ln_px;
    48a6:	dd 45 e8             	fldl   -0x18(%ebp)
    48a9:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    48ac:	dd 45 d8             	fldl   -0x28(%ebp)
    48af:	dc 4d c0             	fmull  -0x40(%ebp)
    48b2:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    48b5:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    48b9:	75 0d                	jne    48c8 <ln+0x12f>
    48bb:	db 45 d4             	fildl  -0x2c(%ebp)
    48be:	dd 45 d8             	fldl   -0x28(%ebp)
    48c1:	de f1                	fdivp  %st,%st(1)
    48c3:	dd 5d d8             	fstpl  -0x28(%ebp)
    48c6:	eb 13                	jmp    48db <ln+0x142>
		else tmp=tmp/-l;
    48c8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    48cb:	f7 d8                	neg    %eax
    48cd:	89 45 8c             	mov    %eax,-0x74(%ebp)
    48d0:	db 45 8c             	fildl  -0x74(%ebp)
    48d3:	dd 45 d8             	fldl   -0x28(%ebp)
    48d6:	de f1                	fdivp  %st,%st(1)
    48d8:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    48db:	dd 45 f0             	fldl   -0x10(%ebp)
    48de:	dc 45 d8             	faddl  -0x28(%ebp)
    48e1:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    48e4:	dd 45 d8             	fldl   -0x28(%ebp)
    48e7:	d9 e0                	fchs   
    48e9:	dc 4d c0             	fmull  -0x40(%ebp)
    48ec:	db 45 d4             	fildl  -0x2c(%ebp)
    48ef:	de c9                	fmulp  %st,%st(1)
    48f1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    48f4:	83 c0 01             	add    $0x1,%eax
    48f7:	89 45 8c             	mov    %eax,-0x74(%ebp)
    48fa:	db 45 8c             	fildl  -0x74(%ebp)
    48fd:	de f9                	fdivrp %st,%st(1)
    48ff:	dc 45 f0             	faddl  -0x10(%ebp)
    4902:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    4905:	dd 45 d8             	fldl   -0x28(%ebp)
    4908:	dc 4d c0             	fmull  -0x40(%ebp)
    490b:	dc 4d c0             	fmull  -0x40(%ebp)
    490e:	db 45 d4             	fildl  -0x2c(%ebp)
    4911:	de c9                	fmulp  %st,%st(1)
    4913:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4916:	83 c0 02             	add    $0x2,%eax
    4919:	89 45 8c             	mov    %eax,-0x74(%ebp)
    491c:	db 45 8c             	fildl  -0x74(%ebp)
    491f:	de f9                	fdivrp %st,%st(1)
    4921:	dc 45 b8             	faddl  -0x48(%ebp)
    4924:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    4927:	dd 45 b0             	fldl   -0x50(%ebp)
    492a:	dc 65 b8             	fsubl  -0x48(%ebp)
    492d:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    4930:	dd 45 a8             	fldl   -0x58(%ebp)
    4933:	dc 4d a8             	fmull  -0x58(%ebp)
    4936:	dd 45 b8             	fldl   -0x48(%ebp)
    4939:	d8 c0                	fadd   %st(0),%st
    493b:	dd 45 b0             	fldl   -0x50(%ebp)
    493e:	de e1                	fsubp  %st,%st(1)
    4940:	dc 45 f0             	faddl  -0x10(%ebp)
    4943:	de f9                	fdivrp %st,%st(1)
    4945:	dd 45 b0             	fldl   -0x50(%ebp)
    4948:	de e1                	fsubp  %st,%st(1)
    494a:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    494d:	db 45 d4             	fildl  -0x2c(%ebp)
    4950:	dd 45 d8             	fldl   -0x28(%ebp)
    4953:	de c9                	fmulp  %st,%st(1)
    4955:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    4958:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    495c:	dd 45 e8             	fldl   -0x18(%ebp)
    495f:	dc 65 e0             	fsubl  -0x20(%ebp)
    4962:	dd 05 b0 ae 00 00    	fldl   0xaeb0
    4968:	d9 c9                	fxch   %st(1)
    496a:	df e9                	fucomip %st(1),%st
    496c:	dd d8                	fstp   %st(0)
    496e:	0f 87 32 ff ff ff    	ja     48a6 <ln+0x10d>
    4974:	dd 45 e8             	fldl   -0x18(%ebp)
    4977:	dc 65 e0             	fsubl  -0x20(%ebp)
    497a:	dd 05 b8 ae 00 00    	fldl   0xaeb8
    4980:	df e9                	fucomip %st(1),%st
    4982:	dd d8                	fstp   %st(0)
    4984:	0f 87 1c ff ff ff    	ja     48a6 <ln+0x10d>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    498a:	dd 45 e8             	fldl   -0x18(%ebp)
}
    498d:	c9                   	leave  
    498e:	c3                   	ret    

0000498f <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    498f:	55                   	push   %ebp
    4990:	89 e5                	mov    %esp,%ebp
    4992:	83 ec 68             	sub    $0x68,%esp
    4995:	8b 45 08             	mov    0x8(%ebp),%eax
    4998:	89 45 a0             	mov    %eax,-0x60(%ebp)
    499b:	8b 45 0c             	mov    0xc(%ebp),%eax
    499e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    49a1:	dd 45 a0             	fldl   -0x60(%ebp)
    49a4:	dd 5d c0             	fstpl  -0x40(%ebp)
    49a7:	d9 ee                	fldz   
    49a9:	dd 5d f0             	fstpl  -0x10(%ebp)
    49ac:	d9 ee                	fldz   
    49ae:	dd 5d b8             	fstpl  -0x48(%ebp)
    49b1:	d9 ee                	fldz   
    49b3:	dd 5d b0             	fstpl  -0x50(%ebp)
    49b6:	d9 ee                	fldz   
    49b8:	dd 5d e8             	fstpl  -0x18(%ebp)
    49bb:	d9 e8                	fld1   
    49bd:	dd 5d e0             	fstpl  -0x20(%ebp)
    49c0:	d9 e8                	fld1   
    49c2:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    49c5:	dd 45 a0             	fldl   -0x60(%ebp)
    49c8:	d9 ee                	fldz   
    49ca:	df e9                	fucomip %st(1),%st
    49cc:	dd d8                	fstp   %st(0)
    49ce:	7a 12                	jp     49e2 <exp+0x53>
    49d0:	dd 45 a0             	fldl   -0x60(%ebp)
    49d3:	d9 ee                	fldz   
    49d5:	df e9                	fucomip %st(1),%st
    49d7:	dd d8                	fstp   %st(0)
    49d9:	75 07                	jne    49e2 <exp+0x53>
    49db:	d9 e8                	fld1   
    49dd:	e9 12 01 00 00       	jmp    4af4 <exp+0x165>
	if(x<0) return 1/exp(-x); 
    49e2:	d9 ee                	fldz   
    49e4:	dd 45 a0             	fldl   -0x60(%ebp)
    49e7:	d9 c9                	fxch   %st(1)
    49e9:	df e9                	fucomip %st(1),%st
    49eb:	dd d8                	fstp   %st(0)
    49ed:	76 20                	jbe    4a0f <exp+0x80>
    49ef:	dd 45 a0             	fldl   -0x60(%ebp)
    49f2:	d9 e0                	fchs   
    49f4:	83 ec 08             	sub    $0x8,%esp
    49f7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    49fb:	dd 1c 24             	fstpl  (%esp)
    49fe:	e8 8c ff ff ff       	call   498f <exp>
    4a03:	83 c4 10             	add    $0x10,%esp
    4a06:	d9 e8                	fld1   
    4a08:	de f1                	fdivp  %st,%st(1)
    4a0a:	e9 e5 00 00 00       	jmp    4af4 <exp+0x165>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    4a0f:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    4a16:	d9 e8                	fld1   
    4a18:	dd 5d d0             	fstpl  -0x30(%ebp)
    4a1b:	e9 92 00 00 00       	jmp    4ab2 <exp+0x123>
	{
		ex_tmp=ex_px;
    4a20:	dd 45 e8             	fldl   -0x18(%ebp)
    4a23:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    4a26:	dd 45 d0             	fldl   -0x30(%ebp)
    4a29:	dc 4d c0             	fmull  -0x40(%ebp)
    4a2c:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    4a2f:	db 45 cc             	fildl  -0x34(%ebp)
    4a32:	dd 45 d0             	fldl   -0x30(%ebp)
    4a35:	de f1                	fdivp  %st,%st(1)
    4a37:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    4a3a:	dd 45 f0             	fldl   -0x10(%ebp)
    4a3d:	dc 45 d0             	faddl  -0x30(%ebp)
    4a40:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    4a43:	dd 45 d0             	fldl   -0x30(%ebp)
    4a46:	dc 4d c0             	fmull  -0x40(%ebp)
    4a49:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4a4c:	83 c0 01             	add    $0x1,%eax
    4a4f:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4a52:	db 45 9c             	fildl  -0x64(%ebp)
    4a55:	de f9                	fdivrp %st,%st(1)
    4a57:	dc 45 f0             	faddl  -0x10(%ebp)
    4a5a:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    4a5d:	dd 45 d0             	fldl   -0x30(%ebp)
    4a60:	dc 4d c0             	fmull  -0x40(%ebp)
    4a63:	dc 4d c0             	fmull  -0x40(%ebp)
    4a66:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4a69:	83 c0 01             	add    $0x1,%eax
    4a6c:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4a6f:	db 45 9c             	fildl  -0x64(%ebp)
    4a72:	de f9                	fdivrp %st,%st(1)
    4a74:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4a77:	83 c0 02             	add    $0x2,%eax
    4a7a:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4a7d:	db 45 9c             	fildl  -0x64(%ebp)
    4a80:	de f9                	fdivrp %st,%st(1)
    4a82:	dc 45 b8             	faddl  -0x48(%ebp)
    4a85:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    4a88:	dd 45 b0             	fldl   -0x50(%ebp)
    4a8b:	dc 65 b8             	fsubl  -0x48(%ebp)
    4a8e:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    4a91:	dd 45 d8             	fldl   -0x28(%ebp)
    4a94:	dc 4d d8             	fmull  -0x28(%ebp)
    4a97:	dd 45 b8             	fldl   -0x48(%ebp)
    4a9a:	d8 c0                	fadd   %st(0),%st
    4a9c:	dd 45 b0             	fldl   -0x50(%ebp)
    4a9f:	de e1                	fsubp  %st,%st(1)
    4aa1:	dc 45 f0             	faddl  -0x10(%ebp)
    4aa4:	de f9                	fdivrp %st,%st(1)
    4aa6:	dd 45 b0             	fldl   -0x50(%ebp)
    4aa9:	de e1                	fsubp  %st,%st(1)
    4aab:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    4aae:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    4ab2:	dd 45 e8             	fldl   -0x18(%ebp)
    4ab5:	dc 65 e0             	fsubl  -0x20(%ebp)
    4ab8:	dd 05 c0 ae 00 00    	fldl   0xaec0
    4abe:	d9 c9                	fxch   %st(1)
    4ac0:	df e9                	fucomip %st(1),%st
    4ac2:	dd d8                	fstp   %st(0)
    4ac4:	77 12                	ja     4ad8 <exp+0x149>
    4ac6:	dd 45 e8             	fldl   -0x18(%ebp)
    4ac9:	dc 65 e0             	fsubl  -0x20(%ebp)
    4acc:	dd 05 c8 ae 00 00    	fldl   0xaec8
    4ad2:	df e9                	fucomip %st(1),%st
    4ad4:	dd d8                	fstp   %st(0)
    4ad6:	76 15                	jbe    4aed <exp+0x15e>
    4ad8:	dd 45 d8             	fldl   -0x28(%ebp)
    4adb:	dd 05 c0 ae 00 00    	fldl   0xaec0
    4ae1:	d9 c9                	fxch   %st(1)
    4ae3:	df e9                	fucomip %st(1),%st
    4ae5:	dd d8                	fstp   %st(0)
    4ae7:	0f 87 33 ff ff ff    	ja     4a20 <exp+0x91>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    4aed:	dd 45 e8             	fldl   -0x18(%ebp)
    4af0:	d9 e8                	fld1   
    4af2:	de c1                	faddp  %st,%st(1)
    4af4:	c9                   	leave  
    4af5:	c3                   	ret    

00004af6 <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    4af6:	55                   	push   %ebp
    4af7:	89 e5                	mov    %esp,%ebp
    4af9:	83 ec 68             	sub    $0x68,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    4afc:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    4b00:	83 ec 08             	sub    $0x8,%esp
    4b03:	ff 75 08             	pushl  0x8(%ebp)
    4b06:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4b09:	50                   	push   %eax
    4b0a:	e8 f7 f1 ff ff       	call   3d06 <strcpy>
    4b0f:	83 c4 10             	add    $0x10,%esp
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    4b12:	83 ec 08             	sub    $0x8,%esp
    4b15:	6a 02                	push   $0x2
    4b17:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4b1a:	50                   	push   %eax
    4b1b:	e8 56 f4 ff ff       	call   3f76 <open>
    4b20:	83 c4 10             	add    $0x10,%esp
    4b23:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4b26:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4b2a:	75 16                	jne    4b42 <OpenTableFile+0x4c>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    4b2c:	83 ec 04             	sub    $0x4,%esp
    4b2f:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4b32:	50                   	push   %eax
    4b33:	68 fc ae 00 00       	push   $0xaefc
    4b38:	6a 00                	push   $0x0
    4b3a:	e8 d4 f5 ff ff       	call   4113 <printf>
    4b3f:	83 c4 10             	add    $0x10,%esp
    }
    return f;
    4b42:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4b45:	c9                   	leave  
    4b46:	c3                   	ret    

00004b47 <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    4b47:	55                   	push   %ebp
    4b48:	89 e5                	mov    %esp,%ebp
    4b4a:	57                   	push   %edi
    4b4b:	56                   	push   %esi
    4b4c:	53                   	push   %ebx
    4b4d:	83 ec 1c             	sub    $0x1c,%esp
	layer *info = fr_ps->header;
    4b50:	8b 45 08             	mov    0x8(%ebp),%eax
    4b53:	8b 00                	mov    (%eax),%eax
    4b55:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    4b58:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4b5b:	8b 78 14             	mov    0x14(%eax),%edi
    4b5e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4b61:	8b 70 10             	mov    0x10(%eax),%esi
    4b64:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4b67:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    4b6a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4b6d:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    4b70:	85 c0                	test   %eax,%eax
    4b72:	0f 94 c0             	sete   %al
    4b75:	0f b6 c8             	movzbl %al,%ecx
    4b78:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4b7b:	8b 50 04             	mov    0x4(%eax),%edx
    4b7e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4b81:	8b 00                	mov    (%eax),%eax
    4b83:	57                   	push   %edi
    4b84:	56                   	push   %esi
    4b85:	53                   	push   %ebx
    4b86:	51                   	push   %ecx
    4b87:	52                   	push   %edx
    4b88:	50                   	push   %eax
    4b89:	68 1c af 00 00       	push   $0xaf1c
    4b8e:	6a 00                	push   $0x0
    4b90:	e8 7e f5 ff ff       	call   4113 <printf>
    4b95:	83 c4 20             	add    $0x20,%esp
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    4b98:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4b9b:	8b 78 2c             	mov    0x2c(%eax),%edi
    4b9e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4ba1:	8b 70 28             	mov    0x28(%eax),%esi
    4ba4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4ba7:	8b 58 24             	mov    0x24(%eax),%ebx
    4baa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4bad:	8b 48 20             	mov    0x20(%eax),%ecx
    4bb0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4bb3:	8b 50 1c             	mov    0x1c(%eax),%edx
    4bb6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4bb9:	8b 40 18             	mov    0x18(%eax),%eax
    4bbc:	57                   	push   %edi
    4bbd:	56                   	push   %esi
    4bbe:	53                   	push   %ebx
    4bbf:	51                   	push   %ecx
    4bc0:	52                   	push   %edx
    4bc1:	50                   	push   %eax
    4bc2:	68 5c af 00 00       	push   $0xaf5c
    4bc7:	6a 00                	push   $0x0
    4bc9:	e8 45 f5 ff ff       	call   4113 <printf>
    4bce:	83 c4 20             	add    $0x20,%esp
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    4bd1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4bd4:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4bd7:	8b 0c 85 a0 ef 00 00 	mov    0xefa0(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    4bde:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4be1:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4be4:	dd 04 c5 80 ef 00 00 	fldl   0xef80(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    4beb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4bee:	8b 40 04             	mov    0x4(%eax),%eax
    4bf1:	8d 50 ff             	lea    -0x1(%eax),%edx
    4bf4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4bf7:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4bfa:	89 d0                	mov    %edx,%eax
    4bfc:	c1 e0 04             	shl    $0x4,%eax
    4bff:	29 d0                	sub    %edx,%eax
    4c01:	01 d8                	add    %ebx,%eax
    4c03:	8b 14 85 c0 ee 00 00 	mov    0xeec0(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    4c0a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4c0d:	8b 40 04             	mov    0x4(%eax),%eax
    4c10:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4c13:	8b 04 85 80 ee 00 00 	mov    0xee80(,%eax,4),%eax
    4c1a:	83 ec 04             	sub    $0x4,%esp
    4c1d:	51                   	push   %ecx
    4c1e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4c22:	dd 1c 24             	fstpl  (%esp)
    4c25:	52                   	push   %edx
    4c26:	50                   	push   %eax
    4c27:	68 84 af 00 00       	push   $0xaf84
    4c2c:	6a 00                	push   $0x0
    4c2e:	e8 e0 f4 ff ff       	call   4113 <printf>
    4c33:	83 c4 20             	add    $0x20,%esp
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    4c36:	8b 45 08             	mov    0x8(%ebp),%eax
    4c39:	8b 48 08             	mov    0x8(%eax),%ecx
    4c3c:	8b 45 08             	mov    0x8(%ebp),%eax
    4c3f:	8b 50 0c             	mov    0xc(%eax),%edx
    4c42:	8b 45 08             	mov    0x8(%ebp),%eax
    4c45:	8b 40 10             	mov    0x10(%eax),%eax
    4c48:	83 ec 0c             	sub    $0xc,%esp
    4c4b:	51                   	push   %ecx
    4c4c:	52                   	push   %edx
    4c4d:	50                   	push   %eax
    4c4e:	68 b3 af 00 00       	push   $0xafb3
    4c53:	6a 00                	push   $0x0
    4c55:	e8 b9 f4 ff ff       	call   4113 <printf>
    4c5a:	83 c4 20             	add    $0x20,%esp
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    4c5d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    4c60:	5b                   	pop    %ebx
    4c61:	5e                   	pop    %esi
    4c62:	5f                   	pop    %edi
    4c63:	5d                   	pop    %ebp
    4c64:	c3                   	ret    

00004c65 <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    4c65:	55                   	push   %ebp
    4c66:	89 e5                	mov    %esp,%ebp
    4c68:	83 ec 18             	sub    $0x18,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    4c6b:	83 ec 0c             	sub    $0xc,%esp
    4c6e:	ff 75 08             	pushl  0x8(%ebp)
    4c71:	e8 6e f7 ff ff       	call   43e4 <malloc>
    4c76:	83 c4 10             	add    $0x10,%esp
    4c79:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    4c7c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4c80:	74 15                	je     4c97 <mem_alloc+0x32>
		memset(ptr, 0, block);
    4c82:	83 ec 04             	sub    $0x4,%esp
    4c85:	ff 75 08             	pushl  0x8(%ebp)
    4c88:	6a 00                	push   $0x0
    4c8a:	ff 75 f4             	pushl  -0xc(%ebp)
    4c8d:	e8 0a f1 ff ff       	call   3d9c <memset>
    4c92:	83 c4 10             	add    $0x10,%esp
    4c95:	eb 1a                	jmp    4cb1 <mem_alloc+0x4c>
	else{
		printf(0, "Unable to allocate %s\n", item);
    4c97:	83 ec 04             	sub    $0x4,%esp
    4c9a:	ff 75 0c             	pushl  0xc(%ebp)
    4c9d:	68 cd af 00 00       	push   $0xafcd
    4ca2:	6a 00                	push   $0x0
    4ca4:	e8 6a f4 ff ff       	call   4113 <printf>
    4ca9:	83 c4 10             	add    $0x10,%esp
		exit();
    4cac:	e8 85 f2 ff ff       	call   3f36 <exit>
	}
	return ptr;
    4cb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4cb4:	c9                   	leave  
    4cb5:	c3                   	ret    

00004cb6 <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    4cb6:	55                   	push   %ebp
    4cb7:	89 e5                	mov    %esp,%ebp
    4cb9:	83 ec 08             	sub    $0x8,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    4cbc:	8b 45 0c             	mov    0xc(%ebp),%eax
    4cbf:	83 ec 08             	sub    $0x8,%esp
    4cc2:	68 e4 af 00 00       	push   $0xafe4
    4cc7:	50                   	push   %eax
    4cc8:	e8 98 ff ff ff       	call   4c65 <mem_alloc>
    4ccd:	83 c4 10             	add    $0x10,%esp
    4cd0:	89 c2                	mov    %eax,%edx
    4cd2:	8b 45 08             	mov    0x8(%ebp),%eax
    4cd5:	89 50 04             	mov    %edx,0x4(%eax)
	bs->buf_size = size;
    4cd8:	8b 45 08             	mov    0x8(%ebp),%eax
    4cdb:	8b 55 0c             	mov    0xc(%ebp),%edx
    4cde:	89 50 08             	mov    %edx,0x8(%eax)
}
    4ce1:	c9                   	leave  
    4ce2:	c3                   	ret    

00004ce3 <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    4ce3:	55                   	push   %ebp
    4ce4:	89 e5                	mov    %esp,%ebp
    4ce6:	83 ec 08             	sub    $0x8,%esp
	free(bs->buf);
    4ce9:	8b 45 08             	mov    0x8(%ebp),%eax
    4cec:	8b 40 04             	mov    0x4(%eax),%eax
    4cef:	83 ec 0c             	sub    $0xc,%esp
    4cf2:	50                   	push   %eax
    4cf3:	e8 ab f5 ff ff       	call   42a3 <free>
    4cf8:	83 c4 10             	add    $0x10,%esp
}
    4cfb:	c9                   	leave  
    4cfc:	c3                   	ret    

00004cfd <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    4cfd:	55                   	push   %ebp
    4cfe:	89 e5                	mov    %esp,%ebp
    4d00:	83 ec 08             	sub    $0x8,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    4d03:	83 ec 08             	sub    $0x8,%esp
    4d06:	6a 02                	push   $0x2
    4d08:	ff 75 0c             	pushl  0xc(%ebp)
    4d0b:	e8 66 f2 ff ff       	call   3f76 <open>
    4d10:	83 c4 10             	add    $0x10,%esp
    4d13:	89 c2                	mov    %eax,%edx
    4d15:	8b 45 08             	mov    0x8(%ebp),%eax
    4d18:	89 10                	mov    %edx,(%eax)
    4d1a:	8b 45 08             	mov    0x8(%ebp),%eax
    4d1d:	8b 00                	mov    (%eax),%eax
    4d1f:	83 f8 ff             	cmp    $0xffffffff,%eax
    4d22:	75 1a                	jne    4d3e <open_bit_stream_r+0x41>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    4d24:	83 ec 04             	sub    $0x4,%esp
    4d27:	ff 75 0c             	pushl  0xc(%ebp)
    4d2a:	68 eb af 00 00       	push   $0xafeb
    4d2f:	6a 00                	push   $0x0
    4d31:	e8 dd f3 ff ff       	call   4113 <printf>
    4d36:	83 c4 10             	add    $0x10,%esp
		exit();
    4d39:	e8 f8 f1 ff ff       	call   3f36 <exit>
	}

	bs->format = BINARY;
    4d3e:	8b 45 08             	mov    0x8(%ebp),%eax
    4d41:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    4d45:	83 ec 08             	sub    $0x8,%esp
    4d48:	ff 75 10             	pushl  0x10(%ebp)
    4d4b:	ff 75 08             	pushl  0x8(%ebp)
    4d4e:	e8 63 ff ff ff       	call   4cb6 <alloc_buffer>
    4d53:	83 c4 10             	add    $0x10,%esp
	bs->buf_byte_idx=0;
    4d56:	8b 45 08             	mov    0x8(%ebp),%eax
    4d59:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    4d60:	8b 45 08             	mov    0x8(%ebp),%eax
    4d63:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    4d6a:	8b 45 08             	mov    0x8(%ebp),%eax
    4d6d:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    4d74:	8b 45 08             	mov    0x8(%ebp),%eax
    4d77:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    4d7e:	8b 45 08             	mov    0x8(%ebp),%eax
    4d81:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    4d88:	8b 45 08             	mov    0x8(%ebp),%eax
    4d8b:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    4d92:	c9                   	leave  
    4d93:	c3                   	ret    

00004d94 <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    4d94:	55                   	push   %ebp
    4d95:	89 e5                	mov    %esp,%ebp
    4d97:	83 ec 08             	sub    $0x8,%esp
	close(bs->pt);
    4d9a:	8b 45 08             	mov    0x8(%ebp),%eax
    4d9d:	8b 00                	mov    (%eax),%eax
    4d9f:	83 ec 0c             	sub    $0xc,%esp
    4da2:	50                   	push   %eax
    4da3:	e8 b6 f1 ff ff       	call   3f5e <close>
    4da8:	83 c4 10             	add    $0x10,%esp
	desalloc_buffer(bs);
    4dab:	83 ec 0c             	sub    $0xc,%esp
    4dae:	ff 75 08             	pushl  0x8(%ebp)
    4db1:	e8 2d ff ff ff       	call   4ce3 <desalloc_buffer>
    4db6:	83 c4 10             	add    $0x10,%esp
}
    4db9:	c9                   	leave  
    4dba:	c3                   	ret    

00004dbb <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    4dbb:	55                   	push   %ebp
    4dbc:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    4dbe:	8b 45 08             	mov    0x8(%ebp),%eax
    4dc1:	8b 40 20             	mov    0x20(%eax),%eax
}
    4dc4:	5d                   	pop    %ebp
    4dc5:	c3                   	ret    

00004dc6 <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    4dc6:	55                   	push   %ebp
    4dc7:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    4dc9:	8b 45 08             	mov    0x8(%ebp),%eax
    4dcc:	8b 40 0c             	mov    0xc(%eax),%eax
}
    4dcf:	5d                   	pop    %ebp
    4dd0:	c3                   	ret    

00004dd1 <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    4dd1:	55                   	push   %ebp
    4dd2:	89 e5                	mov    %esp,%ebp
    4dd4:	56                   	push   %esi
    4dd5:	53                   	push   %ebx
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    4dd6:	8b 45 08             	mov    0x8(%ebp),%eax
    4dd9:	8b 40 08             	mov    0x8(%eax),%eax
    4ddc:	8d 50 fe             	lea    -0x2(%eax),%edx
    4ddf:	8b 45 08             	mov    0x8(%ebp),%eax
    4de2:	8b 40 10             	mov    0x10(%eax),%eax
    4de5:	89 d3                	mov    %edx,%ebx
    4de7:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    4de9:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    4dee:	eb 30                	jmp    4e20 <refill_buffer+0x4f>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    4df0:	8b 45 08             	mov    0x8(%ebp),%eax
    4df3:	8b 50 04             	mov    0x4(%eax),%edx
    4df6:	89 d8                	mov    %ebx,%eax
    4df8:	8d 58 ff             	lea    -0x1(%eax),%ebx
    4dfb:	01 c2                	add    %eax,%edx
    4dfd:	8b 45 08             	mov    0x8(%ebp),%eax
    4e00:	8b 00                	mov    (%eax),%eax
    4e02:	83 ec 04             	sub    $0x4,%esp
    4e05:	6a 01                	push   $0x1
    4e07:	52                   	push   %edx
    4e08:	50                   	push   %eax
    4e09:	e8 40 f1 ff ff       	call   3f4e <read>
    4e0e:	83 c4 10             	add    $0x10,%esp
    4e11:	89 c6                	mov    %eax,%esi
		if (!n)
    4e13:	85 f6                	test   %esi,%esi
    4e15:	75 09                	jne    4e20 <refill_buffer+0x4f>
		bs->eob= i+1;
    4e17:	8d 53 01             	lea    0x1(%ebx),%edx
    4e1a:	8b 45 08             	mov    0x8(%ebp),%eax
    4e1d:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    4e20:	85 db                	test   %ebx,%ebx
    4e22:	78 0a                	js     4e2e <refill_buffer+0x5d>
    4e24:	8b 45 08             	mov    0x8(%ebp),%eax
    4e27:	8b 40 1c             	mov    0x1c(%eax),%eax
    4e2a:	85 c0                	test   %eax,%eax
    4e2c:	74 c2                	je     4df0 <refill_buffer+0x1f>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    4e2e:	8d 65 f8             	lea    -0x8(%ebp),%esp
    4e31:	5b                   	pop    %ebx
    4e32:	5e                   	pop    %esi
    4e33:	5d                   	pop    %ebp
    4e34:	c3                   	ret    

00004e35 <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    4e35:	55                   	push   %ebp
    4e36:	89 e5                	mov    %esp,%ebp
    4e38:	53                   	push   %ebx
    4e39:	83 ec 14             	sub    $0x14,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    4e3c:	8b 45 08             	mov    0x8(%ebp),%eax
    4e3f:	8b 40 0c             	mov    0xc(%eax),%eax
    4e42:	8d 50 01             	lea    0x1(%eax),%edx
    4e45:	8b 45 08             	mov    0x8(%ebp),%eax
    4e48:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    4e4b:	8b 45 08             	mov    0x8(%ebp),%eax
    4e4e:	8b 40 14             	mov    0x14(%eax),%eax
    4e51:	85 c0                	test   %eax,%eax
    4e53:	0f 85 a2 00 00 00    	jne    4efb <get1bit+0xc6>
        bs->buf_bit_idx = 8;
    4e59:	8b 45 08             	mov    0x8(%ebp),%eax
    4e5c:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    4e63:	8b 45 08             	mov    0x8(%ebp),%eax
    4e66:	8b 40 10             	mov    0x10(%eax),%eax
    4e69:	8d 50 ff             	lea    -0x1(%eax),%edx
    4e6c:	8b 45 08             	mov    0x8(%ebp),%eax
    4e6f:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    4e72:	8b 45 08             	mov    0x8(%ebp),%eax
    4e75:	8b 40 10             	mov    0x10(%eax),%eax
    4e78:	83 f8 03             	cmp    $0x3,%eax
    4e7b:	7e 10                	jle    4e8d <get1bit+0x58>
    4e7d:	8b 45 08             	mov    0x8(%ebp),%eax
    4e80:	8b 50 10             	mov    0x10(%eax),%edx
    4e83:	8b 45 08             	mov    0x8(%ebp),%eax
    4e86:	8b 40 1c             	mov    0x1c(%eax),%eax
    4e89:	39 c2                	cmp    %eax,%edx
    4e8b:	7d 6e                	jge    4efb <get1bit+0xc6>
             if (bs->eob)
    4e8d:	8b 45 08             	mov    0x8(%ebp),%eax
    4e90:	8b 40 1c             	mov    0x1c(%eax),%eax
    4e93:	85 c0                	test   %eax,%eax
    4e95:	74 0c                	je     4ea3 <get1bit+0x6e>
                bs->eobs = TRUE;
    4e97:	8b 45 08             	mov    0x8(%ebp),%eax
    4e9a:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    4ea1:	eb 58                	jmp    4efb <get1bit+0xc6>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    4ea3:	8b 45 08             	mov    0x8(%ebp),%eax
    4ea6:	8b 58 10             	mov    0x10(%eax),%ebx
    4ea9:	eb 2f                	jmp    4eda <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    4eab:	8b 45 08             	mov    0x8(%ebp),%eax
    4eae:	8b 50 04             	mov    0x4(%eax),%edx
    4eb1:	8b 45 08             	mov    0x8(%ebp),%eax
    4eb4:	8b 40 08             	mov    0x8(%eax),%eax
    4eb7:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4eba:	8b 45 08             	mov    0x8(%ebp),%eax
    4ebd:	8b 40 10             	mov    0x10(%eax),%eax
    4ec0:	29 c1                	sub    %eax,%ecx
    4ec2:	89 c8                	mov    %ecx,%eax
    4ec4:	01 d8                	add    %ebx,%eax
    4ec6:	01 c2                	add    %eax,%edx
    4ec8:	8b 45 08             	mov    0x8(%ebp),%eax
    4ecb:	8b 40 04             	mov    0x4(%eax),%eax
    4ece:	89 d9                	mov    %ebx,%ecx
    4ed0:	01 c8                	add    %ecx,%eax
    4ed2:	0f b6 00             	movzbl (%eax),%eax
    4ed5:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    4ed7:	83 eb 01             	sub    $0x1,%ebx
    4eda:	85 db                	test   %ebx,%ebx
    4edc:	79 cd                	jns    4eab <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    4ede:	83 ec 0c             	sub    $0xc,%esp
    4ee1:	ff 75 08             	pushl  0x8(%ebp)
    4ee4:	e8 e8 fe ff ff       	call   4dd1 <refill_buffer>
    4ee9:	83 c4 10             	add    $0x10,%esp
                bs->buf_byte_idx = bs->buf_size-1;
    4eec:	8b 45 08             	mov    0x8(%ebp),%eax
    4eef:	8b 40 08             	mov    0x8(%eax),%eax
    4ef2:	8d 50 ff             	lea    -0x1(%eax),%edx
    4ef5:	8b 45 08             	mov    0x8(%ebp),%eax
    4ef8:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    4efb:	8b 45 08             	mov    0x8(%ebp),%eax
    4efe:	8b 50 04             	mov    0x4(%eax),%edx
    4f01:	8b 45 08             	mov    0x8(%ebp),%eax
    4f04:	8b 40 10             	mov    0x10(%eax),%eax
    4f07:	01 d0                	add    %edx,%eax
    4f09:	0f b6 00             	movzbl (%eax),%eax
    4f0c:	0f b6 d0             	movzbl %al,%edx
    4f0f:	8b 45 08             	mov    0x8(%ebp),%eax
    4f12:	8b 40 14             	mov    0x14(%eax),%eax
    4f15:	83 e8 01             	sub    $0x1,%eax
    4f18:	8b 04 85 c0 ef 00 00 	mov    0xefc0(,%eax,4),%eax
    4f1f:	21 d0                	and    %edx,%eax
    4f21:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    4f24:	8b 45 08             	mov    0x8(%ebp),%eax
    4f27:	8b 40 14             	mov    0x14(%eax),%eax
    4f2a:	83 e8 01             	sub    $0x1,%eax
    4f2d:	89 c1                	mov    %eax,%ecx
    4f2f:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    4f32:	8b 45 08             	mov    0x8(%ebp),%eax
    4f35:	8b 40 14             	mov    0x14(%eax),%eax
    4f38:	8d 50 ff             	lea    -0x1(%eax),%edx
    4f3b:	8b 45 08             	mov    0x8(%ebp),%eax
    4f3e:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    4f41:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4f44:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4f47:	c9                   	leave  
    4f48:	c3                   	ret    

00004f49 <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    4f49:	55                   	push   %ebp
    4f4a:	89 e5                	mov    %esp,%ebp
    4f4c:	57                   	push   %edi
    4f4d:	56                   	push   %esi
    4f4e:	53                   	push   %ebx
    4f4f:	83 ec 1c             	sub    $0x1c,%esp
	unsigned long val=0;
    4f52:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    4f59:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    4f5c:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    4f60:	7e 14                	jle    4f76 <getbits+0x2d>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    4f62:	83 ec 04             	sub    $0x4,%esp
    4f65:	6a 20                	push   $0x20
    4f67:	68 04 b0 00 00       	push   $0xb004
    4f6c:	6a 00                	push   $0x0
    4f6e:	e8 a0 f1 ff ff       	call   4113 <printf>
    4f73:	83 c4 10             	add    $0x10,%esp

	bs->totbit += N;
    4f76:	8b 45 08             	mov    0x8(%ebp),%eax
    4f79:	8b 50 0c             	mov    0xc(%eax),%edx
    4f7c:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f7f:	01 c2                	add    %eax,%edx
    4f81:	8b 45 08             	mov    0x8(%ebp),%eax
    4f84:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    4f87:	e9 0d 01 00 00       	jmp    5099 <getbits+0x150>
		if (!bs->buf_bit_idx) {
    4f8c:	8b 45 08             	mov    0x8(%ebp),%eax
    4f8f:	8b 40 14             	mov    0x14(%eax),%eax
    4f92:	85 c0                	test   %eax,%eax
    4f94:	0f 85 a2 00 00 00    	jne    503c <getbits+0xf3>
			bs->buf_bit_idx = 8;
    4f9a:	8b 45 08             	mov    0x8(%ebp),%eax
    4f9d:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    4fa4:	8b 45 08             	mov    0x8(%ebp),%eax
    4fa7:	8b 40 10             	mov    0x10(%eax),%eax
    4faa:	8d 50 ff             	lea    -0x1(%eax),%edx
    4fad:	8b 45 08             	mov    0x8(%ebp),%eax
    4fb0:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    4fb3:	8b 45 08             	mov    0x8(%ebp),%eax
    4fb6:	8b 40 10             	mov    0x10(%eax),%eax
    4fb9:	83 f8 03             	cmp    $0x3,%eax
    4fbc:	7e 10                	jle    4fce <getbits+0x85>
    4fbe:	8b 45 08             	mov    0x8(%ebp),%eax
    4fc1:	8b 50 10             	mov    0x10(%eax),%edx
    4fc4:	8b 45 08             	mov    0x8(%ebp),%eax
    4fc7:	8b 40 1c             	mov    0x1c(%eax),%eax
    4fca:	39 c2                	cmp    %eax,%edx
    4fcc:	7d 6e                	jge    503c <getbits+0xf3>
				if (bs->eob)
    4fce:	8b 45 08             	mov    0x8(%ebp),%eax
    4fd1:	8b 40 1c             	mov    0x1c(%eax),%eax
    4fd4:	85 c0                	test   %eax,%eax
    4fd6:	74 0c                	je     4fe4 <getbits+0x9b>
					bs->eobs = TRUE;
    4fd8:	8b 45 08             	mov    0x8(%ebp),%eax
    4fdb:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    4fe2:	eb 58                	jmp    503c <getbits+0xf3>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    4fe4:	8b 45 08             	mov    0x8(%ebp),%eax
    4fe7:	8b 70 10             	mov    0x10(%eax),%esi
    4fea:	eb 2f                	jmp    501b <getbits+0xd2>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    4fec:	8b 45 08             	mov    0x8(%ebp),%eax
    4fef:	8b 50 04             	mov    0x4(%eax),%edx
    4ff2:	8b 45 08             	mov    0x8(%ebp),%eax
    4ff5:	8b 40 08             	mov    0x8(%eax),%eax
    4ff8:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4ffb:	8b 45 08             	mov    0x8(%ebp),%eax
    4ffe:	8b 40 10             	mov    0x10(%eax),%eax
    5001:	29 c1                	sub    %eax,%ecx
    5003:	89 c8                	mov    %ecx,%eax
    5005:	01 f0                	add    %esi,%eax
    5007:	01 c2                	add    %eax,%edx
    5009:	8b 45 08             	mov    0x8(%ebp),%eax
    500c:	8b 40 04             	mov    0x4(%eax),%eax
    500f:	89 f1                	mov    %esi,%ecx
    5011:	01 c8                	add    %ecx,%eax
    5013:	0f b6 00             	movzbl (%eax),%eax
    5016:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    5018:	83 ee 01             	sub    $0x1,%esi
    501b:	85 f6                	test   %esi,%esi
    501d:	79 cd                	jns    4fec <getbits+0xa3>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    501f:	83 ec 0c             	sub    $0xc,%esp
    5022:	ff 75 08             	pushl  0x8(%ebp)
    5025:	e8 a7 fd ff ff       	call   4dd1 <refill_buffer>
    502a:	83 c4 10             	add    $0x10,%esp
					bs->buf_byte_idx = bs->buf_size-1;
    502d:	8b 45 08             	mov    0x8(%ebp),%eax
    5030:	8b 40 08             	mov    0x8(%eax),%eax
    5033:	8d 50 ff             	lea    -0x1(%eax),%edx
    5036:	8b 45 08             	mov    0x8(%ebp),%eax
    5039:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    503c:	8b 45 08             	mov    0x8(%ebp),%eax
    503f:	8b 40 14             	mov    0x14(%eax),%eax
    5042:	39 d8                	cmp    %ebx,%eax
    5044:	0f 4f c3             	cmovg  %ebx,%eax
    5047:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    5049:	8b 45 08             	mov    0x8(%ebp),%eax
    504c:	8b 50 04             	mov    0x4(%eax),%edx
    504f:	8b 45 08             	mov    0x8(%ebp),%eax
    5052:	8b 40 10             	mov    0x10(%eax),%eax
    5055:	01 d0                	add    %edx,%eax
    5057:	0f b6 00             	movzbl (%eax),%eax
    505a:	0f b6 d0             	movzbl %al,%edx
    505d:	8b 45 08             	mov    0x8(%ebp),%eax
    5060:	8b 40 14             	mov    0x14(%eax),%eax
    5063:	8b 04 85 e0 ef 00 00 	mov    0xefe0(,%eax,4),%eax
    506a:	89 d7                	mov    %edx,%edi
    506c:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    506e:	8b 45 08             	mov    0x8(%ebp),%eax
    5071:	8b 40 14             	mov    0x14(%eax),%eax
    5074:	29 f0                	sub    %esi,%eax
    5076:	89 c1                	mov    %eax,%ecx
    5078:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    507a:	89 d8                	mov    %ebx,%eax
    507c:	29 f0                	sub    %esi,%eax
    507e:	89 c1                	mov    %eax,%ecx
    5080:	d3 e7                	shl    %cl,%edi
    5082:	89 f8                	mov    %edi,%eax
    5084:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    5087:	8b 45 08             	mov    0x8(%ebp),%eax
    508a:	8b 40 14             	mov    0x14(%eax),%eax
    508d:	29 f0                	sub    %esi,%eax
    508f:	89 c2                	mov    %eax,%edx
    5091:	8b 45 08             	mov    0x8(%ebp),%eax
    5094:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    5097:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    5099:	85 db                	test   %ebx,%ebx
    509b:	0f 8f eb fe ff ff    	jg     4f8c <getbits+0x43>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    50a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    50a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    50a7:	5b                   	pop    %ebx
    50a8:	5e                   	pop    %esi
    50a9:	5f                   	pop    %edi
    50aa:	5d                   	pop    %ebp
    50ab:	c3                   	ret    

000050ac <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    50ac:	55                   	push   %ebp
    50ad:	89 e5                	mov    %esp,%ebp
    50af:	83 ec 28             	sub    $0x28,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    50b2:	db 45 10             	fildl  0x10(%ebp)
    50b5:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    50b9:	dd 1c 24             	fstpl  (%esp)
    50bc:	dd 05 70 b0 00 00    	fldl   0xb070
    50c2:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    50c6:	dd 1c 24             	fstpl  (%esp)
    50c9:	e8 0f f5 ff ff       	call   45dd <pow>
    50ce:	83 c4 10             	add    $0x10,%esp
    50d1:	d9 7d e6             	fnstcw -0x1a(%ebp)
    50d4:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    50d8:	b4 0c                	mov    $0xc,%ah
    50da:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    50de:	d9 6d e4             	fldcw  -0x1c(%ebp)
    50e1:	db 5d e0             	fistpl -0x20(%ebp)
    50e4:	d9 6d e6             	fldcw  -0x1a(%ebp)
    50e7:	8b 45 e0             	mov    -0x20(%ebp),%eax
    50ea:	83 e8 01             	sub    $0x1,%eax
    50ed:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    50f0:	83 ec 0c             	sub    $0xc,%esp
    50f3:	ff 75 08             	pushl  0x8(%ebp)
    50f6:	e8 cb fc ff ff       	call   4dc6 <sstell>
    50fb:	83 c4 10             	add    $0x10,%esp
    50fe:	83 e0 07             	and    $0x7,%eax
    5101:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    5104:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5108:	74 17                	je     5121 <seek_sync+0x75>
		getbits(bs, (int)(ALIGNING-aligning));
    510a:	b8 08 00 00 00       	mov    $0x8,%eax
    510f:	2b 45 ec             	sub    -0x14(%ebp),%eax
    5112:	83 ec 08             	sub    $0x8,%esp
    5115:	50                   	push   %eax
    5116:	ff 75 08             	pushl  0x8(%ebp)
    5119:	e8 2b fe ff ff       	call   4f49 <getbits>
    511e:	83 c4 10             	add    $0x10,%esp

	val = getbits(bs, N);
    5121:	83 ec 08             	sub    $0x8,%esp
    5124:	ff 75 10             	pushl  0x10(%ebp)
    5127:	ff 75 08             	pushl  0x8(%ebp)
    512a:	e8 1a fe ff ff       	call   4f49 <getbits>
    512f:	83 c4 10             	add    $0x10,%esp
    5132:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    5135:	eb 17                	jmp    514e <seek_sync+0xa2>
		val <<= ALIGNING;
    5137:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    513b:	83 ec 08             	sub    $0x8,%esp
    513e:	6a 08                	push   $0x8
    5140:	ff 75 08             	pushl  0x8(%ebp)
    5143:	e8 01 fe ff ff       	call   4f49 <getbits>
    5148:	83 c4 10             	add    $0x10,%esp
    514b:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    514e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5151:	23 45 f4             	and    -0xc(%ebp),%eax
    5154:	3b 45 0c             	cmp    0xc(%ebp),%eax
    5157:	74 12                	je     516b <seek_sync+0xbf>
    5159:	83 ec 0c             	sub    $0xc,%esp
    515c:	ff 75 08             	pushl  0x8(%ebp)
    515f:	e8 57 fc ff ff       	call   4dbb <end_bs>
    5164:	83 c4 10             	add    $0x10,%esp
    5167:	85 c0                	test   %eax,%eax
    5169:	74 cc                	je     5137 <seek_sync+0x8b>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    516b:	83 ec 0c             	sub    $0xc,%esp
    516e:	ff 75 08             	pushl  0x8(%ebp)
    5171:	e8 45 fc ff ff       	call   4dbb <end_bs>
    5176:	83 c4 10             	add    $0x10,%esp
    5179:	85 c0                	test   %eax,%eax
    517b:	74 07                	je     5184 <seek_sync+0xd8>
		return(0);
    517d:	b8 00 00 00 00       	mov    $0x0,%eax
    5182:	eb 05                	jmp    5189 <seek_sync+0xdd>
	else
		return(1);
    5184:	b8 01 00 00 00       	mov    $0x1,%eax
}
    5189:	c9                   	leave  
    518a:	c3                   	ret    

0000518b <js_bound>:

int js_bound(int lay, int m_ext)
{
    518b:	55                   	push   %ebp
    518c:	89 e5                	mov    %esp,%ebp
    518e:	83 ec 08             	sub    $0x8,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    5191:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    5195:	7e 12                	jle    51a9 <js_bound+0x1e>
    5197:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    519b:	7f 0c                	jg     51a9 <js_bound+0x1e>
    519d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    51a1:	78 06                	js     51a9 <js_bound+0x1e>
    51a3:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    51a7:	7e 1a                	jle    51c3 <js_bound+0x38>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    51a9:	ff 75 0c             	pushl  0xc(%ebp)
    51ac:	ff 75 08             	pushl  0x8(%ebp)
    51af:	68 38 b0 00 00       	push   $0xb038
    51b4:	6a 00                	push   $0x0
    51b6:	e8 58 ef ff ff       	call   4113 <printf>
    51bb:	83 c4 10             	add    $0x10,%esp
        exit();
    51be:	e8 73 ed ff ff       	call   3f36 <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    51c3:	8b 45 08             	mov    0x8(%ebp),%eax
    51c6:	83 e8 01             	sub    $0x1,%eax
    51c9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    51d0:	8b 45 0c             	mov    0xc(%ebp),%eax
    51d3:	01 d0                	add    %edx,%eax
    51d5:	8b 04 85 20 f0 00 00 	mov    0xf020(,%eax,4),%eax
}
    51dc:	c9                   	leave  
    51dd:	c3                   	ret    

000051de <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    51de:	55                   	push   %ebp
    51df:	89 e5                	mov    %esp,%ebp
    51e1:	83 ec 18             	sub    $0x18,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    51e4:	8b 45 08             	mov    0x8(%ebp),%eax
    51e7:	8b 00                	mov    (%eax),%eax
    51e9:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    51ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    51ef:	8b 50 1c             	mov    0x1c(%eax),%edx
    51f2:	8b 45 08             	mov    0x8(%ebp),%eax
    51f5:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    51f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    51fb:	8b 40 1c             	mov    0x1c(%eax),%eax
    51fe:	83 f8 03             	cmp    $0x3,%eax
    5201:	75 07                	jne    520a <hdr_to_frps+0x2c>
    5203:	ba 01 00 00 00       	mov    $0x1,%edx
    5208:	eb 05                	jmp    520f <hdr_to_frps+0x31>
    520a:	ba 02 00 00 00       	mov    $0x2,%edx
    520f:	8b 45 08             	mov    0x8(%ebp),%eax
    5212:	89 50 08             	mov    %edx,0x8(%eax)
	fr_ps->sblimit = SBLIMIT;
    5215:	8b 45 08             	mov    0x8(%ebp),%eax
    5218:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    521f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5222:	8b 40 1c             	mov    0x1c(%eax),%eax
    5225:	83 f8 01             	cmp    $0x1,%eax
    5228:	75 23                	jne    524d <hdr_to_frps+0x6f>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    522a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    522d:	8b 50 20             	mov    0x20(%eax),%edx
    5230:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5233:	8b 40 04             	mov    0x4(%eax),%eax
    5236:	83 ec 08             	sub    $0x8,%esp
    5239:	52                   	push   %edx
    523a:	50                   	push   %eax
    523b:	e8 4b ff ff ff       	call   518b <js_bound>
    5240:	83 c4 10             	add    $0x10,%esp
    5243:	89 c2                	mov    %eax,%edx
    5245:	8b 45 08             	mov    0x8(%ebp),%eax
    5248:	89 50 0c             	mov    %edx,0xc(%eax)
    524b:	eb 0c                	jmp    5259 <hdr_to_frps+0x7b>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    524d:	8b 45 08             	mov    0x8(%ebp),%eax
    5250:	8b 50 10             	mov    0x10(%eax),%edx
    5253:	8b 45 08             	mov    0x8(%ebp),%eax
    5256:	89 50 0c             	mov    %edx,0xc(%eax)
}
    5259:	c9                   	leave  
    525a:	c3                   	ret    

0000525b <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    525b:	55                   	push   %ebp
    525c:	89 e5                	mov    %esp,%ebp
    525e:	83 ec 08             	sub    $0x8,%esp
	if (N != 8) {
    5261:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    5265:	74 17                	je     527e <hputbuf+0x23>
		printf(0,"Not Supported yet!!\n");
    5267:	83 ec 08             	sub    $0x8,%esp
    526a:	68 5b b0 00 00       	push   $0xb05b
    526f:	6a 00                	push   $0x0
    5271:	e8 9d ee ff ff       	call   4113 <printf>
    5276:	83 c4 10             	add    $0x10,%esp
		exit();
    5279:	e8 b8 ec ff ff       	call   3f36 <exit>
	}
	getCoreBuf(1, val);
    527e:	83 ec 08             	sub    $0x8,%esp
    5281:	ff 75 08             	pushl  0x8(%ebp)
    5284:	6a 01                	push   $0x1
    5286:	e8 ab ed ff ff       	call   4036 <getCoreBuf>
    528b:	83 c4 10             	add    $0x10,%esp
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    528e:	c9                   	leave  
    528f:	c3                   	ret    

00005290 <hsstell>:

unsigned long hsstell()
{
    5290:	55                   	push   %ebp
    5291:	89 e5                	mov    %esp,%ebp
    5293:	83 ec 08             	sub    $0x8,%esp
	return getCoreBuf(2, 0);
    5296:	83 ec 08             	sub    $0x8,%esp
    5299:	6a 00                	push   $0x0
    529b:	6a 02                	push   $0x2
    529d:	e8 94 ed ff ff       	call   4036 <getCoreBuf>
    52a2:	83 c4 10             	add    $0x10,%esp
//	return(totbit);
}
    52a5:	c9                   	leave  
    52a6:	c3                   	ret    

000052a7 <hgetbits>:

unsigned long hgetbits(int N)
{
    52a7:	55                   	push   %ebp
    52a8:	89 e5                	mov    %esp,%ebp
    52aa:	83 ec 08             	sub    $0x8,%esp

	return getCoreBuf(3, N);
    52ad:	83 ec 08             	sub    $0x8,%esp
    52b0:	ff 75 08             	pushl  0x8(%ebp)
    52b3:	6a 03                	push   $0x3
    52b5:	e8 7c ed ff ff       	call   4036 <getCoreBuf>
    52ba:	83 c4 10             	add    $0x10,%esp
}
    52bd:	c9                   	leave  
    52be:	c3                   	ret    

000052bf <hget1bit>:


unsigned int hget1bit()
{
    52bf:	55                   	push   %ebp
    52c0:	89 e5                	mov    %esp,%ebp
    52c2:	83 ec 08             	sub    $0x8,%esp
	return(hgetbits(1));
    52c5:	83 ec 0c             	sub    $0xc,%esp
    52c8:	6a 01                	push   $0x1
    52ca:	e8 d8 ff ff ff       	call   52a7 <hgetbits>
    52cf:	83 c4 10             	add    $0x10,%esp
}
    52d2:	c9                   	leave  
    52d3:	c3                   	ret    

000052d4 <rewindNbits>:


void rewindNbits(int N)
{
    52d4:	55                   	push   %ebp
    52d5:	89 e5                	mov    %esp,%ebp
    52d7:	83 ec 08             	sub    $0x8,%esp
	getCoreBuf(4, N);
    52da:	83 ec 08             	sub    $0x8,%esp
    52dd:	ff 75 08             	pushl  0x8(%ebp)
    52e0:	6a 04                	push   $0x4
    52e2:	e8 4f ed ff ff       	call   4036 <getCoreBuf>
    52e7:	83 c4 10             	add    $0x10,%esp
}
    52ea:	c9                   	leave  
    52eb:	c3                   	ret    

000052ec <rewindNbytes>:


void rewindNbytes(int N)
{
    52ec:	55                   	push   %ebp
    52ed:	89 e5                	mov    %esp,%ebp
    52ef:	83 ec 08             	sub    $0x8,%esp
	getCoreBuf(5, N);
    52f2:	83 ec 08             	sub    $0x8,%esp
    52f5:	ff 75 08             	pushl  0x8(%ebp)
    52f8:	6a 05                	push   $0x5
    52fa:	e8 37 ed ff ff       	call   4036 <getCoreBuf>
    52ff:	83 c4 10             	add    $0x10,%esp
}
    5302:	c9                   	leave  
    5303:	c3                   	ret    

00005304 <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    5304:	55                   	push   %ebp
    5305:	89 e5                	mov    %esp,%ebp
    5307:	57                   	push   %edi
    5308:	56                   	push   %esi
    5309:	53                   	push   %ebx
    530a:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    5310:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    5314:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    5318:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    531c:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    5320:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    5324:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    5328:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    532c:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    5330:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    5334:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    5338:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    533c:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    5340:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    5344:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    5348:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    534c:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    5350:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    5354:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    5358:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    535c:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    5360:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    5364:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    5368:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    536c:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    5370:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    5374:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    5378:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    537c:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    5380:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    5384:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    5388:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    538c:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    5390:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    5394:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    5398:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    539c:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    53a0:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    53a4:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    53a8:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    53ac:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    53b0:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    53b4:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    53b8:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    53bc:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    53c0:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    53c4:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    53c8:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    53cc:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    53d0:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    53d4:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    53d8:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    53dc:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    53e0:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    53e4:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    53e8:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    53ec:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    53f0:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    53f4:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    53f8:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    53fc:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    5400:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    5404:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    5408:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    540c:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    5410:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    5414:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    5418:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    541c:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    5420:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    5424:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    5428:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    542c:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    5430:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    5434:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    5438:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    543c:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    5440:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    5444:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    5448:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    544c:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    5450:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    5454:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    5458:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    545f:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    5466:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    546d:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    5474:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    547b:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    5482:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    5489:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    5490:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    5497:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    549e:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    54a5:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    54ac:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    54b3:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    54ba:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    54c1:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    54c8:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    54cf:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    54d6:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    54dd:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    54e4:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    54eb:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    54f2:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    54f9:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    5500:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    5507:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    550e:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    5515:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    551c:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    5520:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    5524:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    5528:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    552c:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    5530:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    5534:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    5538:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    553c:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    5540:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    5544:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    5548:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    554c:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    5550:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    5554:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    5558:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    555c:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    5560:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    5564:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    5568:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    556c:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    5570:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    5574:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    5578:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    557c:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    5580:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    5584:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    5588:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    558c:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    5590:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    5594:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    5598:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    559c:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    55a0:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    55a4:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    55ab:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    55b2:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    55b9:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    55c0:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    55c7:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    55ce:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    55d5:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    55dc:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    55e3:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    55ea:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    55f1:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    55f8:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    55ff:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    5606:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    560d:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    5614:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    561b:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    5622:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    5629:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    5630:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    5637:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    563e:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    5645:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    564c:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    5653:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    565a:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    5661:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    5668:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    566f:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    5676:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    567d:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    5684:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    568b:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    5692:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    5699:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    56a0:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    56a7:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    56ae:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    56b5:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    56bc:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    56c3:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    56ca:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    56d1:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    56d8:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    56df:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    56e6:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    56ed:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    56f4:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    56fb:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    5702:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    5709:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    5710:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    5717:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    571e:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    5725:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    572c:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    5733:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    573a:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    5741:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    5748:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    574f:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    5756:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    575c:	ba 80 b0 00 00       	mov    $0xb080,%edx
    5761:	b9 23 00 00 00       	mov    $0x23,%ecx
    5766:	89 c7                	mov    %eax,%edi
    5768:	89 d6                	mov    %edx,%esi
    576a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    576c:	89 f2                	mov    %esi,%edx
    576e:	89 f8                	mov    %edi,%eax
    5770:	0f b7 0a             	movzwl (%edx),%ecx
    5773:	66 89 08             	mov    %cx,(%eax)
    5776:	8d 40 02             	lea    0x2(%eax),%eax
    5779:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    577c:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    5782:	bb 40 b1 00 00       	mov    $0xb140,%ebx
    5787:	ba 8e 00 00 00       	mov    $0x8e,%edx
    578c:	8b 0b                	mov    (%ebx),%ecx
    578e:	89 08                	mov    %ecx,(%eax)
    5790:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    5794:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    5798:	8d 78 04             	lea    0x4(%eax),%edi
    579b:	83 e7 fc             	and    $0xfffffffc,%edi
    579e:	29 f8                	sub    %edi,%eax
    57a0:	29 c3                	sub    %eax,%ebx
    57a2:	01 c2                	add    %eax,%edx
    57a4:	83 e2 fc             	and    $0xfffffffc,%edx
    57a7:	89 d0                	mov    %edx,%eax
    57a9:	c1 e8 02             	shr    $0x2,%eax
    57ac:	89 de                	mov    %ebx,%esi
    57ae:	89 c1                	mov    %eax,%ecx
    57b0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    57b2:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    57b8:	ba 00 b2 00 00       	mov    $0xb200,%edx
    57bd:	b9 23 00 00 00       	mov    $0x23,%ecx
    57c2:	89 c7                	mov    %eax,%edi
    57c4:	89 d6                	mov    %edx,%esi
    57c6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    57c8:	89 f2                	mov    %esi,%edx
    57ca:	89 f8                	mov    %edi,%eax
    57cc:	0f b7 0a             	movzwl (%edx),%ecx
    57cf:	66 89 08             	mov    %cx,(%eax)
    57d2:	8d 40 02             	lea    0x2(%eax),%eax
    57d5:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    57d8:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    57de:	bb c0 b2 00 00       	mov    $0xb2c0,%ebx
    57e3:	ba fe 00 00 00       	mov    $0xfe,%edx
    57e8:	8b 0b                	mov    (%ebx),%ecx
    57ea:	89 08                	mov    %ecx,(%eax)
    57ec:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    57f0:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    57f4:	8d 78 04             	lea    0x4(%eax),%edi
    57f7:	83 e7 fc             	and    $0xfffffffc,%edi
    57fa:	29 f8                	sub    %edi,%eax
    57fc:	29 c3                	sub    %eax,%ebx
    57fe:	01 c2                	add    %eax,%edx
    5800:	83 e2 fc             	and    $0xfffffffc,%edx
    5803:	89 d0                	mov    %edx,%eax
    5805:	c1 e8 02             	shr    $0x2,%eax
    5808:	89 de                	mov    %ebx,%esi
    580a:	89 c1                	mov    %eax,%ecx
    580c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    580e:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    5814:	ba c0 b3 00 00       	mov    $0xb3c0,%edx
    5819:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    581e:	89 c7                	mov    %eax,%edi
    5820:	89 d6                	mov    %edx,%esi
    5822:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5824:	89 f2                	mov    %esi,%edx
    5826:	89 f8                	mov    %edi,%eax
    5828:	0f b7 0a             	movzwl (%edx),%ecx
    582b:	66 89 08             	mov    %cx,(%eax)
    582e:	8d 40 02             	lea    0x2(%eax),%eax
    5831:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    5834:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    583a:	bb c0 b4 00 00       	mov    $0xb4c0,%ebx
    583f:	ba fe 00 00 00       	mov    $0xfe,%edx
    5844:	8b 0b                	mov    (%ebx),%ecx
    5846:	89 08                	mov    %ecx,(%eax)
    5848:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    584c:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    5850:	8d 78 04             	lea    0x4(%eax),%edi
    5853:	83 e7 fc             	and    $0xfffffffc,%edi
    5856:	29 f8                	sub    %edi,%eax
    5858:	29 c3                	sub    %eax,%ebx
    585a:	01 c2                	add    %eax,%edx
    585c:	83 e2 fc             	and    $0xfffffffc,%edx
    585f:	89 d0                	mov    %edx,%eax
    5861:	c1 e8 02             	shr    $0x2,%eax
    5864:	89 de                	mov    %ebx,%esi
    5866:	89 c1                	mov    %eax,%ecx
    5868:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    586a:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    5870:	ba c0 b5 00 00       	mov    $0xb5c0,%edx
    5875:	b9 ff 00 00 00       	mov    $0xff,%ecx
    587a:	89 c7                	mov    %eax,%edi
    587c:	89 d6                	mov    %edx,%esi
    587e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5880:	89 f2                	mov    %esi,%edx
    5882:	89 f8                	mov    %edi,%eax
    5884:	0f b7 0a             	movzwl (%edx),%ecx
    5887:	66 89 08             	mov    %cx,(%eax)
    588a:	8d 40 02             	lea    0x2(%eax),%eax
    588d:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    5890:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    5896:	bb c0 b9 00 00       	mov    $0xb9c0,%ebx
    589b:	ba fe 03 00 00       	mov    $0x3fe,%edx
    58a0:	8b 0b                	mov    (%ebx),%ecx
    58a2:	89 08                	mov    %ecx,(%eax)
    58a4:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    58a8:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    58ac:	8d 78 04             	lea    0x4(%eax),%edi
    58af:	83 e7 fc             	and    $0xfffffffc,%edi
    58b2:	29 f8                	sub    %edi,%eax
    58b4:	29 c3                	sub    %eax,%ebx
    58b6:	01 c2                	add    %eax,%edx
    58b8:	83 e2 fc             	and    $0xfffffffc,%edx
    58bb:	89 d0                	mov    %edx,%eax
    58bd:	c1 e8 02             	shr    $0x2,%eax
    58c0:	89 de                	mov    %ebx,%esi
    58c2:	89 c1                	mov    %eax,%ecx
    58c4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    58c6:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    58cc:	ba c0 bd 00 00       	mov    $0xbdc0,%edx
    58d1:	b9 ff 00 00 00       	mov    $0xff,%ecx
    58d6:	89 c7                	mov    %eax,%edi
    58d8:	89 d6                	mov    %edx,%esi
    58da:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    58dc:	89 f2                	mov    %esi,%edx
    58de:	89 f8                	mov    %edi,%eax
    58e0:	0f b7 0a             	movzwl (%edx),%ecx
    58e3:	66 89 08             	mov    %cx,(%eax)
    58e6:	8d 40 02             	lea    0x2(%eax),%eax
    58e9:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    58ec:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    58f2:	bb c0 c1 00 00       	mov    $0xc1c0,%ebx
    58f7:	ba 00 01 00 00       	mov    $0x100,%edx
    58fc:	89 c7                	mov    %eax,%edi
    58fe:	89 de                	mov    %ebx,%esi
    5900:	89 d1                	mov    %edx,%ecx
    5902:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    5904:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    590b:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    5912:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    5919:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    5920:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    5927:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    592e:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    5935:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    593c:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    5943:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    594a:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    5951:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    5958:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    595f:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    5966:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    596d:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    5974:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    597b:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    5982:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    5989:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    5990:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    5997:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    599e:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    59a5:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    59ac:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    59b3:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    59ba:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    59c1:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    59c8:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    59cf:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    59d6:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    59dd:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    59e4:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    59eb:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    59f2:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    59f9:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    5a00:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    5a07:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    5a0e:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    5a15:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    5a1c:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    5a23:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    5a2a:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    5a31:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    5a38:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    5a3f:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    5a46:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    5a4d:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    5a54:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    5a5b:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    5a62:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    5a69:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    5a70:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    5a77:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    5a7e:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    5a85:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    5a8c:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    5a93:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    5a9a:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    5aa1:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    5aa8:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    5aaf:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    5ab6:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    5abd:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    5ac4:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    5acb:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    5ad2:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    5ad9:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    5ae0:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    5ae7:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    5aee:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    5af5:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    5afc:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    5b03:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    5b0a:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    5b11:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    5b18:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    5b1f:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    5b26:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    5b2d:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    5b34:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    5b3b:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    5b42:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    5b49:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    5b50:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    5b57:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    5b5e:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    5b65:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    5b6c:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    5b73:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    5b7a:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    5b81:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    5b88:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    5b8f:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    5b96:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    5b9d:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    5ba4:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    5bab:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    5bb2:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    5bb9:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    5bc0:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    5bc7:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    5bce:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    5bd5:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    5bdc:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    5be3:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    5bea:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    5bf1:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    5bf8:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    5bff:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    5c06:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    5c0d:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    5c14:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    5c1b:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    5c22:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    5c29:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    5c30:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    5c37:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    5c3e:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    5c45:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    5c4c:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    5c53:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    5c5a:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    5c61:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    5c68:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    5c6f:	30 00 
    5c71:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    5c78:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    5c7f:	00 00 00 
    5c82:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    5c89:	00 00 00 
    5c8c:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    5c93:	00 00 00 
    5c96:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    5c9d:	00 00 00 
    5ca0:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    5ca7:	ff ff ff 
    5caa:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    5cb1:	00 00 00 
    5cb4:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    5cbb:	00 00 00 
    5cbe:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    5cc5:	00 00 00 
    5cc8:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    5ccf:	00 00 00 
    5cd2:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    5cd9:	31 00 
    5cdb:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    5ce2:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    5ce9:	00 00 00 
    5cec:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    5cf3:	00 00 00 
    5cf6:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    5cfd:	00 00 00 
    5d00:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    5d07:	00 00 00 
    5d0a:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    5d11:	ff ff ff 
    5d14:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    5d1b:	00 00 00 
    5d1e:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    5d25:	00 00 00 
    5d28:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    5d2b:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    5d31:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    5d38:	00 00 00 
    5d3b:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    5d42:	32 00 
    5d44:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    5d4b:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    5d52:	00 00 00 
    5d55:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    5d5c:	00 00 00 
    5d5f:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    5d66:	00 00 00 
    5d69:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    5d70:	00 00 00 
    5d73:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    5d7a:	ff ff ff 
    5d7d:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    5d84:	00 00 00 
    5d87:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    5d8e:	00 00 00 
    5d91:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    5d94:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    5d9a:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    5da1:	00 00 00 
    5da4:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    5dab:	33 00 
    5dad:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    5db4:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    5dbb:	00 00 00 
    5dbe:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    5dc5:	00 00 00 
    5dc8:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    5dcf:	00 00 00 
    5dd2:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    5dd9:	00 00 00 
    5ddc:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    5de3:	ff ff ff 
    5de6:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    5ded:	00 00 00 
    5df0:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    5df7:	00 00 00 
    5dfa:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    5dfd:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    5e03:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    5e0a:	00 00 00 
    5e0d:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    5e14:	34 00 
    5e16:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    5e1d:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    5e24:	00 00 00 
    5e27:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    5e2e:	00 00 00 
    5e31:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    5e38:	00 00 00 
    5e3b:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    5e42:	00 00 00 
    5e45:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    5e4c:	ff ff ff 
    5e4f:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    5e56:	00 00 00 
    5e59:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    5e60:	00 00 00 
    5e63:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    5e6a:	00 00 00 
    5e6d:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    5e74:	00 00 00 
    5e77:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    5e7e:	35 00 
    5e80:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    5e87:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    5e8e:	00 00 00 
    5e91:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    5e98:	00 00 00 
    5e9b:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    5ea2:	00 00 00 
    5ea5:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    5eac:	00 00 00 
    5eaf:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    5eb6:	ff ff ff 
    5eb9:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    5ec0:	00 00 00 
    5ec3:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    5eca:	00 00 00 
    5ecd:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    5ed3:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    5ed9:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    5ee0:	00 00 00 
    5ee3:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    5eea:	36 00 
    5eec:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    5ef3:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    5efa:	00 00 00 
    5efd:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    5f04:	00 00 00 
    5f07:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    5f0e:	00 00 00 
    5f11:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    5f18:	00 00 00 
    5f1b:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    5f22:	ff ff ff 
    5f25:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    5f2c:	00 00 00 
    5f2f:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    5f36:	00 00 00 
    5f39:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    5f3f:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    5f45:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    5f4c:	00 00 00 
    5f4f:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    5f56:	37 00 
    5f58:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    5f5f:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    5f66:	00 00 00 
    5f69:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    5f70:	00 00 00 
    5f73:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    5f7a:	00 00 00 
    5f7d:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    5f84:	00 00 00 
    5f87:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    5f8e:	ff ff ff 
    5f91:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    5f98:	00 00 00 
    5f9b:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    5fa2:	00 00 00 
    5fa5:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    5fab:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    5fb1:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    5fb8:	00 00 00 
    5fbb:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    5fc2:	38 00 
    5fc4:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    5fcb:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    5fd2:	00 00 00 
    5fd5:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    5fdc:	00 00 00 
    5fdf:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    5fe6:	00 00 00 
    5fe9:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    5ff0:	00 00 00 
    5ff3:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    5ffa:	ff ff ff 
    5ffd:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    6004:	00 00 00 
    6007:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    600e:	00 00 00 
    6011:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    6017:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    601d:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    6024:	00 00 00 
    6027:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    602e:	39 00 
    6030:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    6037:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    603e:	00 00 00 
    6041:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    6048:	00 00 00 
    604b:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    6052:	00 00 00 
    6055:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    605c:	00 00 00 
    605f:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    6066:	ff ff ff 
    6069:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    6070:	00 00 00 
    6073:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    607a:	00 00 00 
    607d:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    6083:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    6089:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    6090:	00 00 00 
    6093:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    609a:	31 30 
    609c:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    60a3:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    60aa:	00 00 00 
    60ad:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    60b4:	00 00 00 
    60b7:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    60be:	00 00 00 
    60c1:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    60c8:	00 00 00 
    60cb:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    60d2:	ff ff ff 
    60d5:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    60dc:	00 00 00 
    60df:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    60e6:	00 00 00 
    60e9:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    60ef:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    60f5:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    60fc:	00 00 00 
    60ff:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    6106:	31 31 
    6108:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    610f:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    6116:	00 00 00 
    6119:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    6120:	00 00 00 
    6123:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    612a:	00 00 00 
    612d:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    6134:	00 00 00 
    6137:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    613e:	ff ff ff 
    6141:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    6148:	00 00 00 
    614b:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    6152:	00 00 00 
    6155:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    615b:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    6161:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    6168:	00 00 00 
    616b:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    6172:	31 32 
    6174:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    617b:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    6182:	00 00 00 
    6185:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    618c:	00 00 00 
    618f:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    6196:	00 00 00 
    6199:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    61a0:	00 00 00 
    61a3:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    61aa:	ff ff ff 
    61ad:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    61b4:	00 00 00 
    61b7:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    61be:	00 00 00 
    61c1:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    61c7:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    61cd:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    61d4:	00 00 00 
    61d7:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    61de:	31 33 
    61e0:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    61e7:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    61ee:	00 00 00 
    61f1:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    61f8:	00 00 00 
    61fb:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    6202:	00 00 00 
    6205:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    620c:	00 00 00 
    620f:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    6216:	ff ff ff 
    6219:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    6220:	00 00 00 
    6223:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    622a:	00 00 00 
    622d:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    6233:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    6239:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    6240:	01 00 00 
    6243:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    624a:	31 34 
    624c:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    6253:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    625a:	00 00 00 
    625d:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    6264:	00 00 00 
    6267:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    626e:	00 00 00 
    6271:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    6278:	00 00 00 
    627b:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    6282:	ff ff ff 
    6285:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    628c:	00 00 00 
    628f:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    6296:	00 00 00 
    6299:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    62a0:	00 00 00 
    62a3:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    62aa:	00 00 00 
    62ad:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    62b4:	31 35 
    62b6:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    62bd:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    62c4:	00 00 00 
    62c7:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    62ce:	00 00 00 
    62d1:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    62d8:	00 00 00 
    62db:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    62e2:	00 00 00 
    62e5:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    62ec:	ff ff ff 
    62ef:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    62f6:	00 00 00 
    62f9:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    6300:	00 00 00 
    6303:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    6309:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    630f:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    6316:	01 00 00 
    6319:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    6320:	31 36 
    6322:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    6329:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    6330:	00 00 00 
    6333:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    633a:	00 00 00 
    633d:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    6344:	00 00 00 
    6347:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    634e:	00 00 00 
    6351:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    6358:	ff ff ff 
    635b:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    6362:	00 00 00 
    6365:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    636c:	00 00 00 
    636f:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6375:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    637b:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    6382:	01 00 00 
    6385:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    638c:	31 37 
    638e:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    6395:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    639c:	00 00 00 
    639f:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    63a6:	00 00 00 
    63a9:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    63b0:	00 00 00 
    63b3:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    63ba:	00 00 00 
    63bd:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    63c4:	00 00 00 
    63c7:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    63ce:	00 00 00 
    63d1:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    63d8:	00 00 00 
    63db:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    63e1:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    63e7:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    63ee:	01 00 00 
    63f1:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    63f8:	31 38 
    63fa:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    6401:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    6408:	00 00 00 
    640b:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    6412:	00 00 00 
    6415:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    641c:	00 00 00 
    641f:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    6426:	00 00 00 
    6429:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    6430:	00 00 00 
    6433:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    643a:	00 00 00 
    643d:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    6444:	00 00 00 
    6447:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    644d:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    6453:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    645a:	01 00 00 
    645d:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    6464:	31 39 
    6466:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    646d:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    6474:	00 00 00 
    6477:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    647e:	00 00 00 
    6481:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    6488:	00 00 00 
    648b:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    6492:	00 00 00 
    6495:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    649c:	00 00 00 
    649f:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    64a6:	00 00 00 
    64a9:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    64b0:	00 00 00 
    64b3:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    64b9:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    64bf:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    64c6:	01 00 00 
    64c9:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    64d0:	32 30 
    64d2:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    64d9:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    64e0:	00 00 00 
    64e3:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    64ea:	00 00 00 
    64ed:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    64f4:	00 00 00 
    64f7:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    64fe:	00 00 00 
    6501:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    6508:	00 00 00 
    650b:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    6512:	00 00 00 
    6515:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    651c:	00 00 00 
    651f:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6525:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    652b:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    6532:	01 00 00 
    6535:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    653c:	32 31 
    653e:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    6545:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    654c:	00 00 00 
    654f:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    6556:	00 00 00 
    6559:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    6560:	00 00 00 
    6563:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    656a:	00 00 00 
    656d:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    6574:	00 00 00 
    6577:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    657e:	00 00 00 
    6581:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    6588:	00 00 00 
    658b:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6591:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    6597:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    659e:	01 00 00 
    65a1:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    65a8:	32 32 
    65aa:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    65b1:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    65b8:	00 00 00 
    65bb:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    65c2:	00 00 00 
    65c5:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    65cc:	00 00 00 
    65cf:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    65d6:	03 00 00 
    65d9:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    65e0:	00 00 00 
    65e3:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    65ea:	00 00 00 
    65ed:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    65f4:	00 00 00 
    65f7:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    65fd:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    6603:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    660a:	01 00 00 
    660d:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    6614:	32 33 
    6616:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    661d:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    6624:	00 00 00 
    6627:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    662e:	00 00 00 
    6631:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    6638:	00 00 00 
    663b:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    6642:	1f 00 00 
    6645:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    664c:	00 00 00 
    664f:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    6656:	00 00 00 
    6659:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    6660:	00 00 00 
    6663:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6669:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    666f:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    6676:	01 00 00 
    6679:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    6680:	32 34 
    6682:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    6689:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    6690:	00 00 00 
    6693:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    669a:	00 00 00 
    669d:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    66a4:	00 00 00 
    66a7:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    66ae:	00 00 00 
    66b1:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    66b8:	ff ff ff 
    66bb:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    66c2:	00 00 00 
    66c5:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    66cc:	00 00 00 
    66cf:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    66d5:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    66db:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    66e2:	02 00 00 
    66e5:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    66ec:	32 35 
    66ee:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    66f5:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    66fc:	00 00 00 
    66ff:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    6706:	00 00 00 
    6709:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    6710:	00 00 00 
    6713:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    671a:	00 00 00 
    671d:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    6724:	00 00 00 
    6727:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    672e:	00 00 00 
    6731:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    6738:	00 00 00 
    673b:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6741:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    6747:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    674e:	02 00 00 
    6751:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    6758:	32 36 
    675a:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    6761:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    6768:	00 00 00 
    676b:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    6772:	00 00 00 
    6775:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    677c:	00 00 00 
    677f:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    6786:	00 00 00 
    6789:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    6790:	00 00 00 
    6793:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    679a:	00 00 00 
    679d:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    67a4:	00 00 00 
    67a7:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    67ad:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    67b3:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    67ba:	02 00 00 
    67bd:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    67c4:	32 37 
    67c6:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    67cd:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    67d4:	00 00 00 
    67d7:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    67de:	00 00 00 
    67e1:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    67e8:	00 00 00 
    67eb:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    67f2:	00 00 00 
    67f5:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    67fc:	00 00 00 
    67ff:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    6806:	00 00 00 
    6809:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    6810:	00 00 00 
    6813:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6819:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    681f:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    6826:	02 00 00 
    6829:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    6830:	32 38 
    6832:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    6839:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    6840:	00 00 00 
    6843:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    684a:	00 00 00 
    684d:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    6854:	00 00 00 
    6857:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    685e:	00 00 00 
    6861:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    6868:	00 00 00 
    686b:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    6872:	00 00 00 
    6875:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    687c:	00 00 00 
    687f:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6885:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    688b:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    6892:	02 00 00 
    6895:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    689c:	32 39 
    689e:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    68a5:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    68ac:	00 00 00 
    68af:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    68b6:	00 00 00 
    68b9:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    68c0:	00 00 00 
    68c3:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    68ca:	01 00 00 
    68cd:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    68d4:	00 00 00 
    68d7:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    68de:	00 00 00 
    68e1:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    68e8:	00 00 00 
    68eb:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    68f1:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    68f7:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    68fe:	02 00 00 
    6901:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    6908:	33 30 
    690a:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    6911:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    6918:	00 00 00 
    691b:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    6922:	00 00 00 
    6925:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    692c:	00 00 00 
    692f:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    6936:	07 00 00 
    6939:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    6940:	00 00 00 
    6943:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    694a:	00 00 00 
    694d:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    6954:	00 00 00 
    6957:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    695d:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    6963:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    696a:	02 00 00 
    696d:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    6974:	33 31 
    6976:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    697d:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    6984:	00 00 00 
    6987:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    698e:	00 00 00 
    6991:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    6998:	00 00 00 
    699b:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    69a2:	1f 00 00 
    69a5:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    69ac:	00 00 00 
    69af:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    69b6:	00 00 00 
    69b9:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    69c0:	00 00 00 
    69c3:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    69c9:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    69cf:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    69d6:	02 00 00 
    69d9:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    69e0:	33 32 
    69e2:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    69e9:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    69f0:	00 00 00 
    69f3:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    69fa:	00 00 00 
    69fd:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    6a04:	00 00 00 
    6a07:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    6a0e:	00 00 00 
    6a11:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    6a18:	ff ff ff 
    6a1b:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    6a22:	00 00 00 
    6a25:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    6a2c:	00 00 00 
    6a2f:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    6a35:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    6a3b:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    6a42:	00 00 00 
    6a45:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    6a4c:	33 33 
    6a4e:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    6a55:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    6a5c:	00 00 00 
    6a5f:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    6a66:	00 00 00 
    6a69:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    6a70:	00 00 00 
    6a73:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    6a7a:	00 00 00 
    6a7d:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    6a84:	ff ff ff 
    6a87:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    6a8e:	00 00 00 
    6a91:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    6a98:	00 00 00 
    6a9b:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    6aa1:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    6aa7:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    6aae:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    6ab1:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    6ab7:	5b                   	pop    %ebx
    6ab8:	5e                   	pop    %esi
    6ab9:	5f                   	pop    %edi
    6aba:	5d                   	pop    %ebp
    6abb:	c3                   	ret    

00006abc <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    6abc:	55                   	push   %ebp
    6abd:	89 e5                	mov    %esp,%ebp
    6abf:	83 ec 18             	sub    $0x18,%esp
  HUFFBITS level;
  int point = 0;
    6ac2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    6ac9:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    6ad0:	a1 50 f0 00 00       	mov    0xf050,%eax
    6ad5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    6ad8:	8b 45 08             	mov    0x8(%ebp),%eax
    6adb:	8b 40 20             	mov    0x20(%eax),%eax
    6ade:	85 c0                	test   %eax,%eax
    6ae0:	75 0a                	jne    6aec <huffman_decoder+0x30>
    6ae2:	b8 02 00 00 00       	mov    $0x2,%eax
    6ae7:	e9 15 03 00 00       	jmp    6e01 <huffman_decoder+0x345>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    6aec:	8b 45 08             	mov    0x8(%ebp),%eax
    6aef:	8b 40 24             	mov    0x24(%eax),%eax
    6af2:	85 c0                	test   %eax,%eax
    6af4:	75 1d                	jne    6b13 <huffman_decoder+0x57>
  {  *x = *y = 0;
    6af6:	8b 45 10             	mov    0x10(%ebp),%eax
    6af9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    6aff:	8b 45 10             	mov    0x10(%ebp),%eax
    6b02:	8b 10                	mov    (%eax),%edx
    6b04:	8b 45 0c             	mov    0xc(%ebp),%eax
    6b07:	89 10                	mov    %edx,(%eax)
     return 0;
    6b09:	b8 00 00 00 00       	mov    $0x0,%eax
    6b0e:	e9 ee 02 00 00       	jmp    6e01 <huffman_decoder+0x345>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    6b13:	8b 45 08             	mov    0x8(%ebp),%eax
    6b16:	8b 40 20             	mov    0x20(%eax),%eax
    6b19:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6b1c:	01 d2                	add    %edx,%edx
    6b1e:	01 d0                	add    %edx,%eax
    6b20:	0f b6 00             	movzbl (%eax),%eax
    6b23:	84 c0                	test   %al,%al
    6b25:	75 46                	jne    6b6d <huffman_decoder+0xb1>
      *x = h->val[point][1] >> 4;
    6b27:	8b 45 08             	mov    0x8(%ebp),%eax
    6b2a:	8b 40 20             	mov    0x20(%eax),%eax
    6b2d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6b30:	01 d2                	add    %edx,%edx
    6b32:	01 d0                	add    %edx,%eax
    6b34:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6b38:	c0 e8 04             	shr    $0x4,%al
    6b3b:	0f b6 d0             	movzbl %al,%edx
    6b3e:	8b 45 0c             	mov    0xc(%ebp),%eax
    6b41:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    6b43:	8b 45 08             	mov    0x8(%ebp),%eax
    6b46:	8b 40 20             	mov    0x20(%eax),%eax
    6b49:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6b4c:	01 d2                	add    %edx,%edx
    6b4e:	01 d0                	add    %edx,%eax
    6b50:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6b54:	0f b6 c0             	movzbl %al,%eax
    6b57:	83 e0 0f             	and    $0xf,%eax
    6b5a:	89 c2                	mov    %eax,%edx
    6b5c:	8b 45 10             	mov    0x10(%ebp),%eax
    6b5f:	89 10                	mov    %edx,(%eax)

      error = 0;
    6b61:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    6b68:	e9 af 00 00 00       	jmp    6c1c <huffman_decoder+0x160>
    } 
    if (hget1bit()) {
    6b6d:	e8 4d e7 ff ff       	call   52bf <hget1bit>
    6b72:	85 c0                	test   %eax,%eax
    6b74:	74 47                	je     6bbd <huffman_decoder+0x101>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    6b76:	eb 17                	jmp    6b8f <huffman_decoder+0xd3>
    6b78:	8b 45 08             	mov    0x8(%ebp),%eax
    6b7b:	8b 40 20             	mov    0x20(%eax),%eax
    6b7e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6b81:	01 d2                	add    %edx,%edx
    6b83:	01 d0                	add    %edx,%eax
    6b85:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6b89:	0f b6 c0             	movzbl %al,%eax
    6b8c:	01 45 f0             	add    %eax,-0x10(%ebp)
    6b8f:	8b 45 08             	mov    0x8(%ebp),%eax
    6b92:	8b 40 20             	mov    0x20(%eax),%eax
    6b95:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6b98:	01 d2                	add    %edx,%edx
    6b9a:	01 d0                	add    %edx,%eax
    6b9c:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6ba0:	3c f9                	cmp    $0xf9,%al
    6ba2:	77 d4                	ja     6b78 <huffman_decoder+0xbc>
      point += h->val[point][1];
    6ba4:	8b 45 08             	mov    0x8(%ebp),%eax
    6ba7:	8b 40 20             	mov    0x20(%eax),%eax
    6baa:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6bad:	01 d2                	add    %edx,%edx
    6baf:	01 d0                	add    %edx,%eax
    6bb1:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6bb5:	0f b6 c0             	movzbl %al,%eax
    6bb8:	01 45 f0             	add    %eax,-0x10(%ebp)
    6bbb:	eb 42                	jmp    6bff <huffman_decoder+0x143>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    6bbd:	eb 16                	jmp    6bd5 <huffman_decoder+0x119>
    6bbf:	8b 45 08             	mov    0x8(%ebp),%eax
    6bc2:	8b 40 20             	mov    0x20(%eax),%eax
    6bc5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6bc8:	01 d2                	add    %edx,%edx
    6bca:	01 d0                	add    %edx,%eax
    6bcc:	0f b6 00             	movzbl (%eax),%eax
    6bcf:	0f b6 c0             	movzbl %al,%eax
    6bd2:	01 45 f0             	add    %eax,-0x10(%ebp)
    6bd5:	8b 45 08             	mov    0x8(%ebp),%eax
    6bd8:	8b 40 20             	mov    0x20(%eax),%eax
    6bdb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6bde:	01 d2                	add    %edx,%edx
    6be0:	01 d0                	add    %edx,%eax
    6be2:	0f b6 00             	movzbl (%eax),%eax
    6be5:	3c f9                	cmp    $0xf9,%al
    6be7:	77 d6                	ja     6bbf <huffman_decoder+0x103>
      point += h->val[point][0];
    6be9:	8b 45 08             	mov    0x8(%ebp),%eax
    6bec:	8b 40 20             	mov    0x20(%eax),%eax
    6bef:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6bf2:	01 d2                	add    %edx,%edx
    6bf4:	01 d0                	add    %edx,%eax
    6bf6:	0f b6 00             	movzbl (%eax),%eax
    6bf9:	0f b6 c0             	movzbl %al,%eax
    6bfc:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    6bff:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    6c02:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    6c06:	0f 85 07 ff ff ff    	jne    6b13 <huffman_decoder+0x57>
    6c0c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6c0f:	a1 64 2e 01 00       	mov    0x12e64,%eax
    6c14:	39 c2                	cmp    %eax,%edx
    6c16:	0f 82 f7 fe ff ff    	jb     6b13 <huffman_decoder+0x57>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    6c1c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    6c20:	74 24                	je     6c46 <huffman_decoder+0x18a>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    6c22:	8b 45 08             	mov    0x8(%ebp),%eax
    6c25:	8b 40 04             	mov    0x4(%eax),%eax
    6c28:	83 e8 01             	sub    $0x1,%eax
    6c2b:	01 c0                	add    %eax,%eax
    6c2d:	89 c2                	mov    %eax,%edx
    6c2f:	8b 45 0c             	mov    0xc(%ebp),%eax
    6c32:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    6c34:	8b 45 08             	mov    0x8(%ebp),%eax
    6c37:	8b 40 08             	mov    0x8(%eax),%eax
    6c3a:	83 e8 01             	sub    $0x1,%eax
    6c3d:	01 c0                	add    %eax,%eax
    6c3f:	89 c2                	mov    %eax,%edx
    6c41:	8b 45 10             	mov    0x10(%ebp),%eax
    6c44:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    6c46:	8b 45 08             	mov    0x8(%ebp),%eax
    6c49:	0f b6 00             	movzbl (%eax),%eax
    6c4c:	3c 33                	cmp    $0x33,%al
    6c4e:	0f 85 ec 00 00 00    	jne    6d40 <huffman_decoder+0x284>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    6c54:	8b 45 08             	mov    0x8(%ebp),%eax
    6c57:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6c5b:	3c 32                	cmp    $0x32,%al
    6c5d:	74 0f                	je     6c6e <huffman_decoder+0x1b2>
    6c5f:	8b 45 08             	mov    0x8(%ebp),%eax
    6c62:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6c66:	3c 33                	cmp    $0x33,%al
    6c68:	0f 85 d2 00 00 00    	jne    6d40 <huffman_decoder+0x284>
     *v = (*y>>3) & 1;
    6c6e:	8b 45 10             	mov    0x10(%ebp),%eax
    6c71:	8b 00                	mov    (%eax),%eax
    6c73:	c1 f8 03             	sar    $0x3,%eax
    6c76:	83 e0 01             	and    $0x1,%eax
    6c79:	89 c2                	mov    %eax,%edx
    6c7b:	8b 45 14             	mov    0x14(%ebp),%eax
    6c7e:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    6c80:	8b 45 10             	mov    0x10(%ebp),%eax
    6c83:	8b 00                	mov    (%eax),%eax
    6c85:	c1 f8 02             	sar    $0x2,%eax
    6c88:	83 e0 01             	and    $0x1,%eax
    6c8b:	89 c2                	mov    %eax,%edx
    6c8d:	8b 45 18             	mov    0x18(%ebp),%eax
    6c90:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    6c92:	8b 45 10             	mov    0x10(%ebp),%eax
    6c95:	8b 00                	mov    (%eax),%eax
    6c97:	d1 f8                	sar    %eax
    6c99:	83 e0 01             	and    $0x1,%eax
    6c9c:	89 c2                	mov    %eax,%edx
    6c9e:	8b 45 0c             	mov    0xc(%ebp),%eax
    6ca1:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    6ca3:	8b 45 10             	mov    0x10(%ebp),%eax
    6ca6:	8b 00                	mov    (%eax),%eax
    6ca8:	83 e0 01             	and    $0x1,%eax
    6cab:	89 c2                	mov    %eax,%edx
    6cad:	8b 45 10             	mov    0x10(%ebp),%eax
    6cb0:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    6cb2:	8b 45 14             	mov    0x14(%ebp),%eax
    6cb5:	8b 00                	mov    (%eax),%eax
    6cb7:	85 c0                	test   %eax,%eax
    6cb9:	74 18                	je     6cd3 <huffman_decoder+0x217>
        if (hget1bit() == 1) *v = -*v;
    6cbb:	e8 ff e5 ff ff       	call   52bf <hget1bit>
    6cc0:	83 f8 01             	cmp    $0x1,%eax
    6cc3:	75 0e                	jne    6cd3 <huffman_decoder+0x217>
    6cc5:	8b 45 14             	mov    0x14(%ebp),%eax
    6cc8:	8b 00                	mov    (%eax),%eax
    6cca:	f7 d8                	neg    %eax
    6ccc:	89 c2                	mov    %eax,%edx
    6cce:	8b 45 14             	mov    0x14(%ebp),%eax
    6cd1:	89 10                	mov    %edx,(%eax)
     if (*w)
    6cd3:	8b 45 18             	mov    0x18(%ebp),%eax
    6cd6:	8b 00                	mov    (%eax),%eax
    6cd8:	85 c0                	test   %eax,%eax
    6cda:	74 18                	je     6cf4 <huffman_decoder+0x238>
        if (hget1bit() == 1) *w = -*w;
    6cdc:	e8 de e5 ff ff       	call   52bf <hget1bit>
    6ce1:	83 f8 01             	cmp    $0x1,%eax
    6ce4:	75 0e                	jne    6cf4 <huffman_decoder+0x238>
    6ce6:	8b 45 18             	mov    0x18(%ebp),%eax
    6ce9:	8b 00                	mov    (%eax),%eax
    6ceb:	f7 d8                	neg    %eax
    6ced:	89 c2                	mov    %eax,%edx
    6cef:	8b 45 18             	mov    0x18(%ebp),%eax
    6cf2:	89 10                	mov    %edx,(%eax)
     if (*x)
    6cf4:	8b 45 0c             	mov    0xc(%ebp),%eax
    6cf7:	8b 00                	mov    (%eax),%eax
    6cf9:	85 c0                	test   %eax,%eax
    6cfb:	74 18                	je     6d15 <huffman_decoder+0x259>
        if (hget1bit() == 1) *x = -*x;
    6cfd:	e8 bd e5 ff ff       	call   52bf <hget1bit>
    6d02:	83 f8 01             	cmp    $0x1,%eax
    6d05:	75 0e                	jne    6d15 <huffman_decoder+0x259>
    6d07:	8b 45 0c             	mov    0xc(%ebp),%eax
    6d0a:	8b 00                	mov    (%eax),%eax
    6d0c:	f7 d8                	neg    %eax
    6d0e:	89 c2                	mov    %eax,%edx
    6d10:	8b 45 0c             	mov    0xc(%ebp),%eax
    6d13:	89 10                	mov    %edx,(%eax)
     if (*y)
    6d15:	8b 45 10             	mov    0x10(%ebp),%eax
    6d18:	8b 00                	mov    (%eax),%eax
    6d1a:	85 c0                	test   %eax,%eax
    6d1c:	74 1d                	je     6d3b <huffman_decoder+0x27f>
        if (hget1bit() == 1) *y = -*y;
    6d1e:	e8 9c e5 ff ff       	call   52bf <hget1bit>
    6d23:	83 f8 01             	cmp    $0x1,%eax
    6d26:	75 13                	jne    6d3b <huffman_decoder+0x27f>
    6d28:	8b 45 10             	mov    0x10(%ebp),%eax
    6d2b:	8b 00                	mov    (%eax),%eax
    6d2d:	f7 d8                	neg    %eax
    6d2f:	89 c2                	mov    %eax,%edx
    6d31:	8b 45 10             	mov    0x10(%ebp),%eax
    6d34:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    6d36:	e9 c3 00 00 00       	jmp    6dfe <huffman_decoder+0x342>
    6d3b:	e9 be 00 00 00       	jmp    6dfe <huffman_decoder+0x342>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    6d40:	8b 45 08             	mov    0x8(%ebp),%eax
    6d43:	8b 40 0c             	mov    0xc(%eax),%eax
    6d46:	85 c0                	test   %eax,%eax
    6d48:	74 34                	je     6d7e <huffman_decoder+0x2c2>
       if ((h->xlen-1) == *x) 
    6d4a:	8b 45 08             	mov    0x8(%ebp),%eax
    6d4d:	8b 40 04             	mov    0x4(%eax),%eax
    6d50:	8d 50 ff             	lea    -0x1(%eax),%edx
    6d53:	8b 45 0c             	mov    0xc(%ebp),%eax
    6d56:	8b 00                	mov    (%eax),%eax
    6d58:	39 c2                	cmp    %eax,%edx
    6d5a:	75 22                	jne    6d7e <huffman_decoder+0x2c2>
         *x += hgetbits(h->linbits);
    6d5c:	8b 45 08             	mov    0x8(%ebp),%eax
    6d5f:	8b 40 0c             	mov    0xc(%eax),%eax
    6d62:	83 ec 0c             	sub    $0xc,%esp
    6d65:	50                   	push   %eax
    6d66:	e8 3c e5 ff ff       	call   52a7 <hgetbits>
    6d6b:	83 c4 10             	add    $0x10,%esp
    6d6e:	89 c2                	mov    %eax,%edx
    6d70:	8b 45 0c             	mov    0xc(%ebp),%eax
    6d73:	8b 00                	mov    (%eax),%eax
    6d75:	01 d0                	add    %edx,%eax
    6d77:	89 c2                	mov    %eax,%edx
    6d79:	8b 45 0c             	mov    0xc(%ebp),%eax
    6d7c:	89 10                	mov    %edx,(%eax)
     if (*x)
    6d7e:	8b 45 0c             	mov    0xc(%ebp),%eax
    6d81:	8b 00                	mov    (%eax),%eax
    6d83:	85 c0                	test   %eax,%eax
    6d85:	74 18                	je     6d9f <huffman_decoder+0x2e3>
        if (hget1bit() == 1) *x = -*x;
    6d87:	e8 33 e5 ff ff       	call   52bf <hget1bit>
    6d8c:	83 f8 01             	cmp    $0x1,%eax
    6d8f:	75 0e                	jne    6d9f <huffman_decoder+0x2e3>
    6d91:	8b 45 0c             	mov    0xc(%ebp),%eax
    6d94:	8b 00                	mov    (%eax),%eax
    6d96:	f7 d8                	neg    %eax
    6d98:	89 c2                	mov    %eax,%edx
    6d9a:	8b 45 0c             	mov    0xc(%ebp),%eax
    6d9d:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    6d9f:	8b 45 08             	mov    0x8(%ebp),%eax
    6da2:	8b 40 0c             	mov    0xc(%eax),%eax
    6da5:	85 c0                	test   %eax,%eax
    6da7:	74 34                	je     6ddd <huffman_decoder+0x321>
       if ((h->ylen-1) == *y)
    6da9:	8b 45 08             	mov    0x8(%ebp),%eax
    6dac:	8b 40 08             	mov    0x8(%eax),%eax
    6daf:	8d 50 ff             	lea    -0x1(%eax),%edx
    6db2:	8b 45 10             	mov    0x10(%ebp),%eax
    6db5:	8b 00                	mov    (%eax),%eax
    6db7:	39 c2                	cmp    %eax,%edx
    6db9:	75 22                	jne    6ddd <huffman_decoder+0x321>
         *y += hgetbits(h->linbits);
    6dbb:	8b 45 08             	mov    0x8(%ebp),%eax
    6dbe:	8b 40 0c             	mov    0xc(%eax),%eax
    6dc1:	83 ec 0c             	sub    $0xc,%esp
    6dc4:	50                   	push   %eax
    6dc5:	e8 dd e4 ff ff       	call   52a7 <hgetbits>
    6dca:	83 c4 10             	add    $0x10,%esp
    6dcd:	89 c2                	mov    %eax,%edx
    6dcf:	8b 45 10             	mov    0x10(%ebp),%eax
    6dd2:	8b 00                	mov    (%eax),%eax
    6dd4:	01 d0                	add    %edx,%eax
    6dd6:	89 c2                	mov    %eax,%edx
    6dd8:	8b 45 10             	mov    0x10(%ebp),%eax
    6ddb:	89 10                	mov    %edx,(%eax)
     if (*y)
    6ddd:	8b 45 10             	mov    0x10(%ebp),%eax
    6de0:	8b 00                	mov    (%eax),%eax
    6de2:	85 c0                	test   %eax,%eax
    6de4:	74 18                	je     6dfe <huffman_decoder+0x342>
        if (hget1bit() == 1) *y = -*y;
    6de6:	e8 d4 e4 ff ff       	call   52bf <hget1bit>
    6deb:	83 f8 01             	cmp    $0x1,%eax
    6dee:	75 0e                	jne    6dfe <huffman_decoder+0x342>
    6df0:	8b 45 10             	mov    0x10(%ebp),%eax
    6df3:	8b 00                	mov    (%eax),%eax
    6df5:	f7 d8                	neg    %eax
    6df7:	89 c2                	mov    %eax,%edx
    6df9:	8b 45 10             	mov    0x10(%ebp),%eax
    6dfc:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    6dfe:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    6e01:	c9                   	leave  
    6e02:	c3                   	ret    

00006e03 <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    6e03:	55                   	push   %ebp
    6e04:	89 e5                	mov    %esp,%ebp
    6e06:	83 ec 18             	sub    $0x18,%esp
    layer *hdr = fr_ps->header;
    6e09:	8b 45 0c             	mov    0xc(%ebp),%eax
    6e0c:	8b 00                	mov    (%eax),%eax
    6e0e:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    6e11:	83 ec 0c             	sub    $0xc,%esp
    6e14:	ff 75 08             	pushl  0x8(%ebp)
    6e17:	e8 19 e0 ff ff       	call   4e35 <get1bit>
    6e1c:	83 c4 10             	add    $0x10,%esp
    6e1f:	89 c2                	mov    %eax,%edx
    6e21:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6e24:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    6e26:	83 ec 08             	sub    $0x8,%esp
    6e29:	6a 02                	push   $0x2
    6e2b:	ff 75 08             	pushl  0x8(%ebp)
    6e2e:	e8 16 e1 ff ff       	call   4f49 <getbits>
    6e33:	83 c4 10             	add    $0x10,%esp
    6e36:	ba 04 00 00 00       	mov    $0x4,%edx
    6e3b:	29 c2                	sub    %eax,%edx
    6e3d:	89 d0                	mov    %edx,%eax
    6e3f:	89 c2                	mov    %eax,%edx
    6e41:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6e44:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    6e47:	83 ec 0c             	sub    $0xc,%esp
    6e4a:	ff 75 08             	pushl  0x8(%ebp)
    6e4d:	e8 e3 df ff ff       	call   4e35 <get1bit>
    6e52:	83 c4 10             	add    $0x10,%esp
    6e55:	85 c0                	test   %eax,%eax
    6e57:	0f 94 c0             	sete   %al
    6e5a:	0f b6 d0             	movzbl %al,%edx
    6e5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6e60:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    6e63:	83 ec 08             	sub    $0x8,%esp
    6e66:	6a 04                	push   $0x4
    6e68:	ff 75 08             	pushl  0x8(%ebp)
    6e6b:	e8 d9 e0 ff ff       	call   4f49 <getbits>
    6e70:	83 c4 10             	add    $0x10,%esp
    6e73:	89 c2                	mov    %eax,%edx
    6e75:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6e78:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    6e7b:	83 ec 08             	sub    $0x8,%esp
    6e7e:	6a 02                	push   $0x2
    6e80:	ff 75 08             	pushl  0x8(%ebp)
    6e83:	e8 c1 e0 ff ff       	call   4f49 <getbits>
    6e88:	83 c4 10             	add    $0x10,%esp
    6e8b:	89 c2                	mov    %eax,%edx
    6e8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6e90:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    6e93:	83 ec 0c             	sub    $0xc,%esp
    6e96:	ff 75 08             	pushl  0x8(%ebp)
    6e99:	e8 97 df ff ff       	call   4e35 <get1bit>
    6e9e:	83 c4 10             	add    $0x10,%esp
    6ea1:	89 c2                	mov    %eax,%edx
    6ea3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6ea6:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    6ea9:	83 ec 0c             	sub    $0xc,%esp
    6eac:	ff 75 08             	pushl  0x8(%ebp)
    6eaf:	e8 81 df ff ff       	call   4e35 <get1bit>
    6eb4:	83 c4 10             	add    $0x10,%esp
    6eb7:	89 c2                	mov    %eax,%edx
    6eb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6ebc:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    6ebf:	83 ec 08             	sub    $0x8,%esp
    6ec2:	6a 02                	push   $0x2
    6ec4:	ff 75 08             	pushl  0x8(%ebp)
    6ec7:	e8 7d e0 ff ff       	call   4f49 <getbits>
    6ecc:	83 c4 10             	add    $0x10,%esp
    6ecf:	89 c2                	mov    %eax,%edx
    6ed1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6ed4:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    6ed7:	83 ec 08             	sub    $0x8,%esp
    6eda:	6a 02                	push   $0x2
    6edc:	ff 75 08             	pushl  0x8(%ebp)
    6edf:	e8 65 e0 ff ff       	call   4f49 <getbits>
    6ee4:	83 c4 10             	add    $0x10,%esp
    6ee7:	89 c2                	mov    %eax,%edx
    6ee9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6eec:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    6eef:	83 ec 0c             	sub    $0xc,%esp
    6ef2:	ff 75 08             	pushl  0x8(%ebp)
    6ef5:	e8 3b df ff ff       	call   4e35 <get1bit>
    6efa:	83 c4 10             	add    $0x10,%esp
    6efd:	89 c2                	mov    %eax,%edx
    6eff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6f02:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    6f05:	83 ec 0c             	sub    $0xc,%esp
    6f08:	ff 75 08             	pushl  0x8(%ebp)
    6f0b:	e8 25 df ff ff       	call   4e35 <get1bit>
    6f10:	83 c4 10             	add    $0x10,%esp
    6f13:	89 c2                	mov    %eax,%edx
    6f15:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6f18:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    6f1b:	83 ec 08             	sub    $0x8,%esp
    6f1e:	6a 02                	push   $0x2
    6f20:	ff 75 08             	pushl  0x8(%ebp)
    6f23:	e8 21 e0 ff ff       	call   4f49 <getbits>
    6f28:	83 c4 10             	add    $0x10,%esp
    6f2b:	89 c2                	mov    %eax,%edx
    6f2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6f30:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    6f33:	c9                   	leave  
    6f34:	c3                   	ret    

00006f35 <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    6f35:	55                   	push   %ebp
    6f36:	89 e5                	mov    %esp,%ebp
    6f38:	56                   	push   %esi
    6f39:	53                   	push   %ebx
    6f3a:	83 ec 10             	sub    $0x10,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    6f3d:	8b 45 10             	mov    0x10(%ebp),%eax
    6f40:	8b 40 08             	mov    0x8(%eax),%eax
    6f43:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    6f46:	83 ec 08             	sub    $0x8,%esp
    6f49:	6a 09                	push   $0x9
    6f4b:	ff 75 08             	pushl  0x8(%ebp)
    6f4e:	e8 f6 df ff ff       	call   4f49 <getbits>
    6f53:	83 c4 10             	add    $0x10,%esp
    6f56:	89 c2                	mov    %eax,%edx
    6f58:	8b 45 0c             	mov    0xc(%ebp),%eax
    6f5b:	89 10                	mov    %edx,(%eax)
	if (stereo == 1)
    6f5d:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    6f61:	75 1a                	jne    6f7d <III_get_side_info+0x48>
		si->private_bits = getbits(bs,5);
    6f63:	83 ec 08             	sub    $0x8,%esp
    6f66:	6a 05                	push   $0x5
    6f68:	ff 75 08             	pushl  0x8(%ebp)
    6f6b:	e8 d9 df ff ff       	call   4f49 <getbits>
    6f70:	83 c4 10             	add    $0x10,%esp
    6f73:	89 c2                	mov    %eax,%edx
    6f75:	8b 45 0c             	mov    0xc(%ebp),%eax
    6f78:	89 50 04             	mov    %edx,0x4(%eax)
    6f7b:	eb 18                	jmp    6f95 <III_get_side_info+0x60>
	else
		si->private_bits = getbits(bs,3);
    6f7d:	83 ec 08             	sub    $0x8,%esp
    6f80:	6a 03                	push   $0x3
    6f82:	ff 75 08             	pushl  0x8(%ebp)
    6f85:	e8 bf df ff ff       	call   4f49 <getbits>
    6f8a:	83 c4 10             	add    $0x10,%esp
    6f8d:	89 c2                	mov    %eax,%edx
    6f8f:	8b 45 0c             	mov    0xc(%ebp),%eax
    6f92:	89 50 04             	mov    %edx,0x4(%eax)

	for (ch=0; ch<stereo; ch++)
    6f95:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6f9c:	eb 40                	jmp    6fde <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    6f9e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6fa5:	eb 2d                	jmp    6fd4 <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    6fa7:	83 ec 0c             	sub    $0xc,%esp
    6faa:	ff 75 08             	pushl  0x8(%ebp)
    6fad:	e8 83 de ff ff       	call   4e35 <get1bit>
    6fb2:	83 c4 10             	add    $0x10,%esp
    6fb5:	89 c3                	mov    %eax,%ebx
    6fb7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    6fba:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6fbd:	89 d0                	mov    %edx,%eax
    6fbf:	c1 e0 02             	shl    $0x2,%eax
    6fc2:	01 d0                	add    %edx,%eax
    6fc4:	c1 e0 03             	shl    $0x3,%eax
    6fc7:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6fca:	01 d0                	add    %edx,%eax
    6fcc:	89 5c 81 08          	mov    %ebx,0x8(%ecx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    6fd0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6fd4:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    6fd8:	7e cd                	jle    6fa7 <III_get_side_info+0x72>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    6fda:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6fde:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6fe1:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    6fe4:	7c b8                	jl     6f9e <III_get_side_info+0x69>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    6fe6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    6fed:	e9 cb 05 00 00       	jmp    75bd <III_get_side_info+0x688>
		for (ch=0; ch<stereo; ch++) {
    6ff2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6ff9:	e9 af 05 00 00       	jmp    75ad <III_get_side_info+0x678>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    6ffe:	83 ec 08             	sub    $0x8,%esp
    7001:	6a 0c                	push   $0xc
    7003:	ff 75 08             	pushl  0x8(%ebp)
    7006:	e8 3e df ff ff       	call   4f49 <getbits>
    700b:	83 c4 10             	add    $0x10,%esp
    700e:	89 c6                	mov    %eax,%esi
    7010:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7013:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7016:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7019:	89 c2                	mov    %eax,%edx
    701b:	c1 e2 03             	shl    $0x3,%edx
    701e:	01 c2                	add    %eax,%edx
    7020:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7027:	89 c2                	mov    %eax,%edx
    7029:	89 c8                	mov    %ecx,%eax
    702b:	c1 e0 02             	shl    $0x2,%eax
    702e:	01 c8                	add    %ecx,%eax
    7030:	c1 e0 05             	shl    $0x5,%eax
    7033:	01 d0                	add    %edx,%eax
    7035:	01 d8                	add    %ebx,%eax
    7037:	83 c0 10             	add    $0x10,%eax
    703a:	89 70 08             	mov    %esi,0x8(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    703d:	83 ec 08             	sub    $0x8,%esp
    7040:	6a 09                	push   $0x9
    7042:	ff 75 08             	pushl  0x8(%ebp)
    7045:	e8 ff de ff ff       	call   4f49 <getbits>
    704a:	83 c4 10             	add    $0x10,%esp
    704d:	89 c6                	mov    %eax,%esi
    704f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7052:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7055:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7058:	89 c2                	mov    %eax,%edx
    705a:	c1 e2 03             	shl    $0x3,%edx
    705d:	01 c2                	add    %eax,%edx
    705f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7066:	89 c2                	mov    %eax,%edx
    7068:	89 c8                	mov    %ecx,%eax
    706a:	c1 e0 02             	shl    $0x2,%eax
    706d:	01 c8                	add    %ecx,%eax
    706f:	c1 e0 05             	shl    $0x5,%eax
    7072:	01 d0                	add    %edx,%eax
    7074:	01 d8                	add    %ebx,%eax
    7076:	83 c0 10             	add    $0x10,%eax
    7079:	89 70 0c             	mov    %esi,0xc(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    707c:	83 ec 08             	sub    $0x8,%esp
    707f:	6a 08                	push   $0x8
    7081:	ff 75 08             	pushl  0x8(%ebp)
    7084:	e8 c0 de ff ff       	call   4f49 <getbits>
    7089:	83 c4 10             	add    $0x10,%esp
    708c:	89 c6                	mov    %eax,%esi
    708e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7091:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7094:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7097:	89 c2                	mov    %eax,%edx
    7099:	c1 e2 03             	shl    $0x3,%edx
    709c:	01 c2                	add    %eax,%edx
    709e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    70a5:	89 c2                	mov    %eax,%edx
    70a7:	89 c8                	mov    %ecx,%eax
    70a9:	c1 e0 02             	shl    $0x2,%eax
    70ac:	01 c8                	add    %ecx,%eax
    70ae:	c1 e0 05             	shl    $0x5,%eax
    70b1:	01 d0                	add    %edx,%eax
    70b3:	01 d8                	add    %ebx,%eax
    70b5:	83 c0 10             	add    $0x10,%eax
    70b8:	89 70 10             	mov    %esi,0x10(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    70bb:	83 ec 08             	sub    $0x8,%esp
    70be:	6a 04                	push   $0x4
    70c0:	ff 75 08             	pushl  0x8(%ebp)
    70c3:	e8 81 de ff ff       	call   4f49 <getbits>
    70c8:	83 c4 10             	add    $0x10,%esp
    70cb:	89 c6                	mov    %eax,%esi
    70cd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    70d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    70d3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    70d6:	89 c2                	mov    %eax,%edx
    70d8:	c1 e2 03             	shl    $0x3,%edx
    70db:	01 c2                	add    %eax,%edx
    70dd:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    70e4:	89 c2                	mov    %eax,%edx
    70e6:	89 c8                	mov    %ecx,%eax
    70e8:	c1 e0 02             	shl    $0x2,%eax
    70eb:	01 c8                	add    %ecx,%eax
    70ed:	c1 e0 05             	shl    $0x5,%eax
    70f0:	01 d0                	add    %edx,%eax
    70f2:	01 d8                	add    %ebx,%eax
    70f4:	83 c0 10             	add    $0x10,%eax
    70f7:	89 70 14             	mov    %esi,0x14(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    70fa:	83 ec 0c             	sub    $0xc,%esp
    70fd:	ff 75 08             	pushl  0x8(%ebp)
    7100:	e8 30 dd ff ff       	call   4e35 <get1bit>
    7105:	83 c4 10             	add    $0x10,%esp
    7108:	89 c6                	mov    %eax,%esi
    710a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    710d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7110:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7113:	89 c2                	mov    %eax,%edx
    7115:	c1 e2 03             	shl    $0x3,%edx
    7118:	01 c2                	add    %eax,%edx
    711a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7121:	89 c2                	mov    %eax,%edx
    7123:	89 c8                	mov    %ecx,%eax
    7125:	c1 e0 02             	shl    $0x2,%eax
    7128:	01 c8                	add    %ecx,%eax
    712a:	c1 e0 05             	shl    $0x5,%eax
    712d:	01 d0                	add    %edx,%eax
    712f:	01 d8                	add    %ebx,%eax
    7131:	83 c0 20             	add    $0x20,%eax
    7134:	89 70 08             	mov    %esi,0x8(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    7137:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    713a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    713d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7140:	89 c2                	mov    %eax,%edx
    7142:	c1 e2 03             	shl    $0x3,%edx
    7145:	01 c2                	add    %eax,%edx
    7147:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    714e:	89 c2                	mov    %eax,%edx
    7150:	89 c8                	mov    %ecx,%eax
    7152:	c1 e0 02             	shl    $0x2,%eax
    7155:	01 c8                	add    %ecx,%eax
    7157:	c1 e0 05             	shl    $0x5,%eax
    715a:	01 d0                	add    %edx,%eax
    715c:	01 d8                	add    %ebx,%eax
    715e:	83 c0 20             	add    $0x20,%eax
    7161:	8b 40 08             	mov    0x8(%eax),%eax
    7164:	85 c0                	test   %eax,%eax
    7166:	0f 84 85 02 00 00    	je     73f1 <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    716c:	83 ec 08             	sub    $0x8,%esp
    716f:	6a 02                	push   $0x2
    7171:	ff 75 08             	pushl  0x8(%ebp)
    7174:	e8 d0 dd ff ff       	call   4f49 <getbits>
    7179:	83 c4 10             	add    $0x10,%esp
    717c:	89 c6                	mov    %eax,%esi
    717e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7181:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7184:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7187:	89 c2                	mov    %eax,%edx
    7189:	c1 e2 03             	shl    $0x3,%edx
    718c:	01 c2                	add    %eax,%edx
    718e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7195:	89 c2                	mov    %eax,%edx
    7197:	89 c8                	mov    %ecx,%eax
    7199:	c1 e0 02             	shl    $0x2,%eax
    719c:	01 c8                	add    %ecx,%eax
    719e:	c1 e0 05             	shl    $0x5,%eax
    71a1:	01 d0                	add    %edx,%eax
    71a3:	01 d8                	add    %ebx,%eax
    71a5:	83 c0 20             	add    $0x20,%eax
    71a8:	89 70 0c             	mov    %esi,0xc(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    71ab:	83 ec 0c             	sub    $0xc,%esp
    71ae:	ff 75 08             	pushl  0x8(%ebp)
    71b1:	e8 7f dc ff ff       	call   4e35 <get1bit>
    71b6:	83 c4 10             	add    $0x10,%esp
    71b9:	89 c6                	mov    %eax,%esi
    71bb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    71be:	8b 45 f0             	mov    -0x10(%ebp),%eax
    71c1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    71c4:	89 c2                	mov    %eax,%edx
    71c6:	c1 e2 03             	shl    $0x3,%edx
    71c9:	01 c2                	add    %eax,%edx
    71cb:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    71d2:	89 c2                	mov    %eax,%edx
    71d4:	89 c8                	mov    %ecx,%eax
    71d6:	c1 e0 02             	shl    $0x2,%eax
    71d9:	01 c8                	add    %ecx,%eax
    71db:	c1 e0 05             	shl    $0x5,%eax
    71de:	01 d0                	add    %edx,%eax
    71e0:	01 d8                	add    %ebx,%eax
    71e2:	83 c0 20             	add    $0x20,%eax
    71e5:	89 70 10             	mov    %esi,0x10(%eax)
				for (i=0; i<2; i++)
    71e8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    71ef:	eb 43                	jmp    7234 <III_get_side_info+0x2ff>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    71f1:	83 ec 08             	sub    $0x8,%esp
    71f4:	6a 05                	push   $0x5
    71f6:	ff 75 08             	pushl  0x8(%ebp)
    71f9:	e8 4b dd ff ff       	call   4f49 <getbits>
    71fe:	83 c4 10             	add    $0x10,%esp
    7201:	89 c6                	mov    %eax,%esi
    7203:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7206:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7209:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    720c:	89 c2                	mov    %eax,%edx
    720e:	c1 e2 03             	shl    $0x3,%edx
    7211:	01 c2                	add    %eax,%edx
    7213:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7216:	89 c2                	mov    %eax,%edx
    7218:	89 c8                	mov    %ecx,%eax
    721a:	c1 e0 02             	shl    $0x2,%eax
    721d:	01 c8                	add    %ecx,%eax
    721f:	c1 e0 03             	shl    $0x3,%eax
    7222:	01 c2                	add    %eax,%edx
    7224:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7227:	01 d0                	add    %edx,%eax
    7229:	83 c0 08             	add    $0x8,%eax
    722c:	89 74 83 14          	mov    %esi,0x14(%ebx,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    7230:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7234:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    7238:	7e b7                	jle    71f1 <III_get_side_info+0x2bc>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    723a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7241:	eb 43                	jmp    7286 <III_get_side_info+0x351>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    7243:	83 ec 08             	sub    $0x8,%esp
    7246:	6a 03                	push   $0x3
    7248:	ff 75 08             	pushl  0x8(%ebp)
    724b:	e8 f9 dc ff ff       	call   4f49 <getbits>
    7250:	83 c4 10             	add    $0x10,%esp
    7253:	89 c6                	mov    %eax,%esi
    7255:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7258:	8b 45 f0             	mov    -0x10(%ebp),%eax
    725b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    725e:	89 c2                	mov    %eax,%edx
    7260:	c1 e2 03             	shl    $0x3,%edx
    7263:	01 c2                	add    %eax,%edx
    7265:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7268:	89 c2                	mov    %eax,%edx
    726a:	89 c8                	mov    %ecx,%eax
    726c:	c1 e0 02             	shl    $0x2,%eax
    726f:	01 c8                	add    %ecx,%eax
    7271:	c1 e0 03             	shl    $0x3,%eax
    7274:	01 c2                	add    %eax,%edx
    7276:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7279:	01 d0                	add    %edx,%eax
    727b:	83 c0 0c             	add    $0xc,%eax
    727e:	89 74 83 10          	mov    %esi,0x10(%ebx,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    7282:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7286:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    728a:	7e b7                	jle    7243 <III_get_side_info+0x30e>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    728c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    728f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7292:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7295:	89 c2                	mov    %eax,%edx
    7297:	c1 e2 03             	shl    $0x3,%edx
    729a:	01 c2                	add    %eax,%edx
    729c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    72a3:	89 c2                	mov    %eax,%edx
    72a5:	89 c8                	mov    %ecx,%eax
    72a7:	c1 e0 02             	shl    $0x2,%eax
    72aa:	01 c8                	add    %ecx,%eax
    72ac:	c1 e0 05             	shl    $0x5,%eax
    72af:	01 d0                	add    %edx,%eax
    72b1:	01 d8                	add    %ebx,%eax
    72b3:	83 c0 20             	add    $0x20,%eax
    72b6:	8b 40 0c             	mov    0xc(%eax),%eax
    72b9:	85 c0                	test   %eax,%eax
    72bb:	75 05                	jne    72c2 <III_get_side_info+0x38d>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    72bd:	e8 74 cc ff ff       	call   3f36 <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    72c2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    72c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    72c8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    72cb:	89 c2                	mov    %eax,%edx
    72cd:	c1 e2 03             	shl    $0x3,%edx
    72d0:	01 c2                	add    %eax,%edx
    72d2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    72d9:	89 c2                	mov    %eax,%edx
    72db:	89 c8                	mov    %ecx,%eax
    72dd:	c1 e0 02             	shl    $0x2,%eax
    72e0:	01 c8                	add    %ecx,%eax
    72e2:	c1 e0 05             	shl    $0x5,%eax
    72e5:	01 d0                	add    %edx,%eax
    72e7:	01 d8                	add    %ebx,%eax
    72e9:	83 c0 20             	add    $0x20,%eax
    72ec:	8b 40 0c             	mov    0xc(%eax),%eax
    72ef:	83 f8 02             	cmp    $0x2,%eax
    72f2:	75 64                	jne    7358 <III_get_side_info+0x423>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    72f4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    72f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    72fa:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    72fd:	89 c2                	mov    %eax,%edx
    72ff:	c1 e2 03             	shl    $0x3,%edx
    7302:	01 c2                	add    %eax,%edx
    7304:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    730b:	89 c2                	mov    %eax,%edx
    730d:	89 c8                	mov    %ecx,%eax
    730f:	c1 e0 02             	shl    $0x2,%eax
    7312:	01 c8                	add    %ecx,%eax
    7314:	c1 e0 05             	shl    $0x5,%eax
    7317:	01 d0                	add    %edx,%eax
    7319:	01 d8                	add    %ebx,%eax
    731b:	83 c0 20             	add    $0x20,%eax
    731e:	8b 40 10             	mov    0x10(%eax),%eax
    7321:	85 c0                	test   %eax,%eax
    7323:	75 33                	jne    7358 <III_get_side_info+0x423>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    7325:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7328:	8b 45 f0             	mov    -0x10(%ebp),%eax
    732b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    732e:	89 c2                	mov    %eax,%edx
    7330:	c1 e2 03             	shl    $0x3,%edx
    7333:	01 c2                	add    %eax,%edx
    7335:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    733c:	89 c2                	mov    %eax,%edx
    733e:	89 c8                	mov    %ecx,%eax
    7340:	c1 e0 02             	shl    $0x2,%eax
    7343:	01 c8                	add    %ecx,%eax
    7345:	c1 e0 05             	shl    $0x5,%eax
    7348:	01 d0                	add    %edx,%eax
    734a:	01 d8                	add    %ebx,%eax
    734c:	83 c0 40             	add    $0x40,%eax
    734f:	c7 40 0c 08 00 00 00 	movl   $0x8,0xc(%eax)
    7356:	eb 31                	jmp    7389 <III_get_side_info+0x454>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    7358:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    735b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    735e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7361:	89 c2                	mov    %eax,%edx
    7363:	c1 e2 03             	shl    $0x3,%edx
    7366:	01 c2                	add    %eax,%edx
    7368:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    736f:	89 c2                	mov    %eax,%edx
    7371:	89 c8                	mov    %ecx,%eax
    7373:	c1 e0 02             	shl    $0x2,%eax
    7376:	01 c8                	add    %ecx,%eax
    7378:	c1 e0 05             	shl    $0x5,%eax
    737b:	01 d0                	add    %edx,%eax
    737d:	01 d8                	add    %ebx,%eax
    737f:	83 c0 40             	add    $0x40,%eax
    7382:	c7 40 0c 07 00 00 00 	movl   $0x7,0xc(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    7389:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    738c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    738f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7392:	89 c2                	mov    %eax,%edx
    7394:	c1 e2 03             	shl    $0x3,%edx
    7397:	01 c2                	add    %eax,%edx
    7399:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    73a0:	89 c2                	mov    %eax,%edx
    73a2:	89 c8                	mov    %ecx,%eax
    73a4:	c1 e0 02             	shl    $0x2,%eax
    73a7:	01 c8                	add    %ecx,%eax
    73a9:	c1 e0 05             	shl    $0x5,%eax
    73ac:	01 d0                	add    %edx,%eax
    73ae:	01 d8                	add    %ebx,%eax
    73b0:	83 c0 40             	add    $0x40,%eax
    73b3:	8b 40 0c             	mov    0xc(%eax),%eax
    73b6:	ba 14 00 00 00       	mov    $0x14,%edx
    73bb:	89 d3                	mov    %edx,%ebx
    73bd:	29 c3                	sub    %eax,%ebx
    73bf:	8b 75 0c             	mov    0xc(%ebp),%esi
    73c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    73c5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    73c8:	89 c2                	mov    %eax,%edx
    73ca:	c1 e2 03             	shl    $0x3,%edx
    73cd:	01 c2                	add    %eax,%edx
    73cf:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    73d6:	89 c2                	mov    %eax,%edx
    73d8:	89 c8                	mov    %ecx,%eax
    73da:	c1 e0 02             	shl    $0x2,%eax
    73dd:	01 c8                	add    %ecx,%eax
    73df:	c1 e0 05             	shl    $0x5,%eax
    73e2:	01 d0                	add    %edx,%eax
    73e4:	01 f0                	add    %esi,%eax
    73e6:	83 c0 40             	add    $0x40,%eax
    73e9:	89 58 10             	mov    %ebx,0x10(%eax)
    73ec:	e9 01 01 00 00       	jmp    74f2 <III_get_side_info+0x5bd>
			}
			else {
				for (i=0; i<3; i++)
    73f1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    73f8:	eb 43                	jmp    743d <III_get_side_info+0x508>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    73fa:	83 ec 08             	sub    $0x8,%esp
    73fd:	6a 05                	push   $0x5
    73ff:	ff 75 08             	pushl  0x8(%ebp)
    7402:	e8 42 db ff ff       	call   4f49 <getbits>
    7407:	83 c4 10             	add    $0x10,%esp
    740a:	89 c6                	mov    %eax,%esi
    740c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    740f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7412:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7415:	89 c2                	mov    %eax,%edx
    7417:	c1 e2 03             	shl    $0x3,%edx
    741a:	01 c2                	add    %eax,%edx
    741c:	8d 04 12             	lea    (%edx,%edx,1),%eax
    741f:	89 c2                	mov    %eax,%edx
    7421:	89 c8                	mov    %ecx,%eax
    7423:	c1 e0 02             	shl    $0x2,%eax
    7426:	01 c8                	add    %ecx,%eax
    7428:	c1 e0 03             	shl    $0x3,%eax
    742b:	01 c2                	add    %eax,%edx
    742d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7430:	01 d0                	add    %edx,%eax
    7432:	83 c0 08             	add    $0x8,%eax
    7435:	89 74 83 14          	mov    %esi,0x14(%ebx,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    7439:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    743d:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7441:	7e b7                	jle    73fa <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    7443:	83 ec 08             	sub    $0x8,%esp
    7446:	6a 04                	push   $0x4
    7448:	ff 75 08             	pushl  0x8(%ebp)
    744b:	e8 f9 da ff ff       	call   4f49 <getbits>
    7450:	83 c4 10             	add    $0x10,%esp
    7453:	89 c6                	mov    %eax,%esi
    7455:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7458:	8b 45 f0             	mov    -0x10(%ebp),%eax
    745b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    745e:	89 c2                	mov    %eax,%edx
    7460:	c1 e2 03             	shl    $0x3,%edx
    7463:	01 c2                	add    %eax,%edx
    7465:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    746c:	89 c2                	mov    %eax,%edx
    746e:	89 c8                	mov    %ecx,%eax
    7470:	c1 e0 02             	shl    $0x2,%eax
    7473:	01 c8                	add    %ecx,%eax
    7475:	c1 e0 05             	shl    $0x5,%eax
    7478:	01 d0                	add    %edx,%eax
    747a:	01 d8                	add    %ebx,%eax
    747c:	83 c0 40             	add    $0x40,%eax
    747f:	89 70 0c             	mov    %esi,0xc(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    7482:	83 ec 08             	sub    $0x8,%esp
    7485:	6a 03                	push   $0x3
    7487:	ff 75 08             	pushl  0x8(%ebp)
    748a:	e8 ba da ff ff       	call   4f49 <getbits>
    748f:	83 c4 10             	add    $0x10,%esp
    7492:	89 c6                	mov    %eax,%esi
    7494:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7497:	8b 45 f0             	mov    -0x10(%ebp),%eax
    749a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    749d:	89 c2                	mov    %eax,%edx
    749f:	c1 e2 03             	shl    $0x3,%edx
    74a2:	01 c2                	add    %eax,%edx
    74a4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    74ab:	89 c2                	mov    %eax,%edx
    74ad:	89 c8                	mov    %ecx,%eax
    74af:	c1 e0 02             	shl    $0x2,%eax
    74b2:	01 c8                	add    %ecx,%eax
    74b4:	c1 e0 05             	shl    $0x5,%eax
    74b7:	01 d0                	add    %edx,%eax
    74b9:	01 d8                	add    %ebx,%eax
    74bb:	83 c0 40             	add    $0x40,%eax
    74be:	89 70 10             	mov    %esi,0x10(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    74c1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    74c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    74c7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    74ca:	89 c2                	mov    %eax,%edx
    74cc:	c1 e2 03             	shl    $0x3,%edx
    74cf:	01 c2                	add    %eax,%edx
    74d1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    74d8:	89 c2                	mov    %eax,%edx
    74da:	89 c8                	mov    %ecx,%eax
    74dc:	c1 e0 02             	shl    $0x2,%eax
    74df:	01 c8                	add    %ecx,%eax
    74e1:	c1 e0 05             	shl    $0x5,%eax
    74e4:	01 d0                	add    %edx,%eax
    74e6:	01 d8                	add    %ebx,%eax
    74e8:	83 c0 20             	add    $0x20,%eax
    74eb:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    74f2:	83 ec 0c             	sub    $0xc,%esp
    74f5:	ff 75 08             	pushl  0x8(%ebp)
    74f8:	e8 38 d9 ff ff       	call   4e35 <get1bit>
    74fd:	83 c4 10             	add    $0x10,%esp
    7500:	89 c6                	mov    %eax,%esi
    7502:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7505:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7508:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    750b:	89 c2                	mov    %eax,%edx
    750d:	c1 e2 03             	shl    $0x3,%edx
    7510:	01 c2                	add    %eax,%edx
    7512:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7519:	89 c2                	mov    %eax,%edx
    751b:	89 c8                	mov    %ecx,%eax
    751d:	c1 e0 02             	shl    $0x2,%eax
    7520:	01 c8                	add    %ecx,%eax
    7522:	c1 e0 05             	shl    $0x5,%eax
    7525:	01 d0                	add    %edx,%eax
    7527:	01 d8                	add    %ebx,%eax
    7529:	83 c0 40             	add    $0x40,%eax
    752c:	89 70 14             	mov    %esi,0x14(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    752f:	83 ec 0c             	sub    $0xc,%esp
    7532:	ff 75 08             	pushl  0x8(%ebp)
    7535:	e8 fb d8 ff ff       	call   4e35 <get1bit>
    753a:	83 c4 10             	add    $0x10,%esp
    753d:	89 c6                	mov    %eax,%esi
    753f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7542:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7545:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7548:	89 c2                	mov    %eax,%edx
    754a:	c1 e2 03             	shl    $0x3,%edx
    754d:	01 c2                	add    %eax,%edx
    754f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7556:	89 c2                	mov    %eax,%edx
    7558:	89 c8                	mov    %ecx,%eax
    755a:	c1 e0 02             	shl    $0x2,%eax
    755d:	01 c8                	add    %ecx,%eax
    755f:	c1 e0 05             	shl    $0x5,%eax
    7562:	01 d0                	add    %edx,%eax
    7564:	01 d8                	add    %ebx,%eax
    7566:	83 c0 50             	add    $0x50,%eax
    7569:	89 70 08             	mov    %esi,0x8(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    756c:	83 ec 0c             	sub    $0xc,%esp
    756f:	ff 75 08             	pushl  0x8(%ebp)
    7572:	e8 be d8 ff ff       	call   4e35 <get1bit>
    7577:	83 c4 10             	add    $0x10,%esp
    757a:	89 c6                	mov    %eax,%esi
    757c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    757f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7582:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7585:	89 c2                	mov    %eax,%edx
    7587:	c1 e2 03             	shl    $0x3,%edx
    758a:	01 c2                	add    %eax,%edx
    758c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7593:	89 c2                	mov    %eax,%edx
    7595:	89 c8                	mov    %ecx,%eax
    7597:	c1 e0 02             	shl    $0x2,%eax
    759a:	01 c8                	add    %ecx,%eax
    759c:	c1 e0 05             	shl    $0x5,%eax
    759f:	01 d0                	add    %edx,%eax
    75a1:	01 d8                	add    %ebx,%eax
    75a3:	83 c0 50             	add    $0x50,%eax
    75a6:	89 70 0c             	mov    %esi,0xc(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    75a9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    75ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    75b0:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    75b3:	0f 8c 45 fa ff ff    	jl     6ffe <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    75b9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    75bd:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    75c1:	0f 8e 2b fa ff ff    	jle    6ff2 <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    75c7:	8d 65 f8             	lea    -0x8(%ebp),%esp
    75ca:	5b                   	pop    %ebx
    75cb:	5e                   	pop    %esi
    75cc:	5d                   	pop    %ebp
    75cd:	c3                   	ret    

000075ce <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    75ce:	55                   	push   %ebp
    75cf:	89 e5                	mov    %esp,%ebp
    75d1:	56                   	push   %esi
    75d2:	53                   	push   %ebx
    75d3:	83 ec 10             	sub    $0x10,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    75d6:	8b 45 10             	mov    0x10(%ebp),%eax
    75d9:	89 c2                	mov    %eax,%edx
    75db:	c1 e2 03             	shl    $0x3,%edx
    75de:	01 c2                	add    %eax,%edx
    75e0:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    75e7:	89 c2                	mov    %eax,%edx
    75e9:	8b 4d 14             	mov    0x14(%ebp),%ecx
    75ec:	89 c8                	mov    %ecx,%eax
    75ee:	c1 e0 02             	shl    $0x2,%eax
    75f1:	01 c8                	add    %ecx,%eax
    75f3:	c1 e0 05             	shl    $0x5,%eax
    75f6:	01 d0                	add    %edx,%eax
    75f8:	8d 50 10             	lea    0x10(%eax),%edx
    75fb:	8b 45 0c             	mov    0xc(%ebp),%eax
    75fe:	01 d0                	add    %edx,%eax
    7600:	83 c0 08             	add    $0x8,%eax
    7603:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    7606:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7609:	8b 40 10             	mov    0x10(%eax),%eax
    760c:	85 c0                	test   %eax,%eax
    760e:	0f 84 93 02 00 00    	je     78a7 <III_get_scale_factors+0x2d9>
    7614:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7617:	8b 40 14             	mov    0x14(%eax),%eax
    761a:	83 f8 02             	cmp    $0x2,%eax
    761d:	0f 85 84 02 00 00    	jne    78a7 <III_get_scale_factors+0x2d9>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    7623:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7626:	8b 40 18             	mov    0x18(%eax),%eax
    7629:	85 c0                	test   %eax,%eax
    762b:	0f 84 7c 01 00 00    	je     77ad <III_get_scale_factors+0x1df>
			for (sfb = 0; sfb < 8; sfb++)
    7631:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7638:	eb 3b                	jmp    7675 <III_get_scale_factors+0xa7>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    763a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    763d:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    7640:	8b 04 85 c0 f0 00 00 	mov    0xf0c0(,%eax,4),%eax
    7647:	83 ec 0c             	sub    $0xc,%esp
    764a:	50                   	push   %eax
    764b:	e8 57 dc ff ff       	call   52a7 <hgetbits>
    7650:	83 c4 10             	add    $0x10,%esp
    7653:	89 c3                	mov    %eax,%ebx
    7655:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7658:	8b 45 14             	mov    0x14(%ebp),%eax
    765b:	89 c2                	mov    %eax,%edx
    765d:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7660:	89 c2                	mov    %eax,%edx
    7662:	89 d0                	mov    %edx,%eax
    7664:	c1 e0 05             	shl    $0x5,%eax
    7667:	29 d0                	sub    %edx,%eax
    7669:	8b 55 f4             	mov    -0xc(%ebp),%edx
    766c:	01 d0                	add    %edx,%eax
    766e:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    7671:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7675:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    7679:	7e bf                	jle    763a <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    767b:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    7682:	eb 60                	jmp    76e4 <III_get_scale_factors+0x116>
				for (window=0; window<3; window++)
    7684:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    768b:	eb 4d                	jmp    76da <III_get_scale_factors+0x10c>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    768d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7690:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    7693:	8b 04 85 c0 f0 00 00 	mov    0xf0c0(,%eax,4),%eax
    769a:	83 ec 0c             	sub    $0xc,%esp
    769d:	50                   	push   %eax
    769e:	e8 04 dc ff ff       	call   52a7 <hgetbits>
    76a3:	83 c4 10             	add    $0x10,%esp
    76a6:	89 c6                	mov    %eax,%esi
    76a8:	8b 5d 08             	mov    0x8(%ebp),%ebx
    76ab:	8b 55 ec             	mov    -0x14(%ebp),%edx
    76ae:	8b 4d 14             	mov    0x14(%ebp),%ecx
    76b1:	89 d0                	mov    %edx,%eax
    76b3:	01 c0                	add    %eax,%eax
    76b5:	01 d0                	add    %edx,%eax
    76b7:	c1 e0 02             	shl    $0x2,%eax
    76ba:	01 d0                	add    %edx,%eax
    76bc:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    76bf:	89 d1                	mov    %edx,%ecx
    76c1:	89 ca                	mov    %ecx,%edx
    76c3:	c1 e2 05             	shl    $0x5,%edx
    76c6:	29 ca                	sub    %ecx,%edx
    76c8:	01 c2                	add    %eax,%edx
    76ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    76cd:	01 d0                	add    %edx,%eax
    76cf:	83 c0 14             	add    $0x14,%eax
    76d2:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    76d6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    76da:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    76de:	7e ad                	jle    768d <III_get_scale_factors+0xbf>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    76e0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    76e4:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    76e8:	7e 9a                	jle    7684 <III_get_scale_factors+0xb6>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    76ea:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    76f1:	eb 63                	jmp    7756 <III_get_scale_factors+0x188>
				for (window=0; window<3; window++)
    76f3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    76fa:	eb 50                	jmp    774c <III_get_scale_factors+0x17e>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    76fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    76ff:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    7702:	83 c0 10             	add    $0x10,%eax
    7705:	8b 04 85 c0 f0 00 00 	mov    0xf0c0(,%eax,4),%eax
    770c:	83 ec 0c             	sub    $0xc,%esp
    770f:	50                   	push   %eax
    7710:	e8 92 db ff ff       	call   52a7 <hgetbits>
    7715:	83 c4 10             	add    $0x10,%esp
    7718:	89 c6                	mov    %eax,%esi
    771a:	8b 5d 08             	mov    0x8(%ebp),%ebx
    771d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7720:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7723:	89 d0                	mov    %edx,%eax
    7725:	01 c0                	add    %eax,%eax
    7727:	01 d0                	add    %edx,%eax
    7729:	c1 e0 02             	shl    $0x2,%eax
    772c:	01 d0                	add    %edx,%eax
    772e:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    7731:	89 d1                	mov    %edx,%ecx
    7733:	89 ca                	mov    %ecx,%edx
    7735:	c1 e2 05             	shl    $0x5,%edx
    7738:	29 ca                	sub    %ecx,%edx
    773a:	01 c2                	add    %eax,%edx
    773c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    773f:	01 d0                	add    %edx,%eax
    7741:	83 c0 14             	add    $0x14,%eax
    7744:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    7748:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    774c:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7750:	7e aa                	jle    76fc <III_get_scale_factors+0x12e>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    7752:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7756:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    775a:	7e 97                	jle    76f3 <III_get_scale_factors+0x125>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    775c:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7763:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    776a:	eb 36                	jmp    77a2 <III_get_scale_factors+0x1d4>
				(*scalefac)[ch].s[window][sfb] = 0;
    776c:	8b 5d 08             	mov    0x8(%ebp),%ebx
    776f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7772:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7775:	89 d0                	mov    %edx,%eax
    7777:	01 c0                	add    %eax,%eax
    7779:	01 d0                	add    %edx,%eax
    777b:	c1 e0 02             	shl    $0x2,%eax
    777e:	01 d0                	add    %edx,%eax
    7780:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    7783:	89 d1                	mov    %edx,%ecx
    7785:	89 ca                	mov    %ecx,%edx
    7787:	c1 e2 05             	shl    $0x5,%edx
    778a:	29 ca                	sub    %ecx,%edx
    778c:	01 c2                	add    %eax,%edx
    778e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7791:	01 d0                	add    %edx,%eax
    7793:	83 c0 14             	add    $0x14,%eax
    7796:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    779d:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    779e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    77a2:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    77a6:	7e c4                	jle    776c <III_get_scale_factors+0x19e>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    77a8:	e9 bf 01 00 00       	jmp    796c <III_get_scale_factors+0x39e>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    77ad:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    77b4:	e9 93 00 00 00       	jmp    784c <III_get_scale_factors+0x27e>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    77b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    77bc:	83 c0 04             	add    $0x4,%eax
    77bf:	8b 04 85 84 f0 00 00 	mov    0xf084(,%eax,4),%eax
    77c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    77c9:	eb 68                	jmp    7833 <III_get_scale_factors+0x265>
					for (window=0; window<3; window++)
    77cb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    77d2:	eb 55                	jmp    7829 <III_get_scale_factors+0x25b>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    77d4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    77d7:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    77da:	8b 55 f0             	mov    -0x10(%ebp),%edx
    77dd:	c1 e2 04             	shl    $0x4,%edx
    77e0:	01 d0                	add    %edx,%eax
    77e2:	8b 04 85 c0 f0 00 00 	mov    0xf0c0(,%eax,4),%eax
    77e9:	83 ec 0c             	sub    $0xc,%esp
    77ec:	50                   	push   %eax
    77ed:	e8 b5 da ff ff       	call   52a7 <hgetbits>
    77f2:	83 c4 10             	add    $0x10,%esp
    77f5:	89 c6                	mov    %eax,%esi
    77f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    77fa:	8b 55 ec             	mov    -0x14(%ebp),%edx
    77fd:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7800:	89 d0                	mov    %edx,%eax
    7802:	01 c0                	add    %eax,%eax
    7804:	01 d0                	add    %edx,%eax
    7806:	c1 e0 02             	shl    $0x2,%eax
    7809:	01 d0                	add    %edx,%eax
    780b:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    780e:	89 d1                	mov    %edx,%ecx
    7810:	89 ca                	mov    %ecx,%edx
    7812:	c1 e2 05             	shl    $0x5,%edx
    7815:	29 ca                	sub    %ecx,%edx
    7817:	01 c2                	add    %eax,%edx
    7819:	8b 45 f4             	mov    -0xc(%ebp),%eax
    781c:	01 d0                	add    %edx,%eax
    781e:	83 c0 14             	add    $0x14,%eax
    7821:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    7825:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7829:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    782d:	7e a5                	jle    77d4 <III_get_scale_factors+0x206>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    782f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7833:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7836:	83 c0 01             	add    $0x1,%eax
    7839:	83 c0 04             	add    $0x4,%eax
    783c:	8b 04 85 84 f0 00 00 	mov    0xf084(,%eax,4),%eax
    7843:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    7846:	7f 83                	jg     77cb <III_get_scale_factors+0x1fd>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    7848:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    784c:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7850:	0f 8e 63 ff ff ff    	jle    77b9 <III_get_scale_factors+0x1eb>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    7856:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    785d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7864:	eb 36                	jmp    789c <III_get_scale_factors+0x2ce>
					(*scalefac)[ch].s[window][sfb] = 0;
    7866:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7869:	8b 55 ec             	mov    -0x14(%ebp),%edx
    786c:	8b 4d 14             	mov    0x14(%ebp),%ecx
    786f:	89 d0                	mov    %edx,%eax
    7871:	01 c0                	add    %eax,%eax
    7873:	01 d0                	add    %edx,%eax
    7875:	c1 e0 02             	shl    $0x2,%eax
    7878:	01 d0                	add    %edx,%eax
    787a:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    787d:	89 d1                	mov    %edx,%ecx
    787f:	89 ca                	mov    %ecx,%edx
    7881:	c1 e2 05             	shl    $0x5,%edx
    7884:	29 ca                	sub    %ecx,%edx
    7886:	01 c2                	add    %eax,%edx
    7888:	8b 45 f4             	mov    -0xc(%ebp),%eax
    788b:	01 d0                	add    %edx,%eax
    788d:	83 c0 14             	add    $0x14,%eax
    7890:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    7897:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    7898:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    789c:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    78a0:	7e c4                	jle    7866 <III_get_scale_factors+0x298>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    78a2:	e9 c5 00 00 00       	jmp    796c <III_get_scale_factors+0x39e>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    78a7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    78ae:	e9 92 00 00 00       	jmp    7945 <III_get_scale_factors+0x377>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    78b3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    78b6:	8b 55 14             	mov    0x14(%ebp),%edx
    78b9:	89 d0                	mov    %edx,%eax
    78bb:	c1 e0 02             	shl    $0x2,%eax
    78be:	01 d0                	add    %edx,%eax
    78c0:	c1 e0 03             	shl    $0x3,%eax
    78c3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    78c6:	01 d0                	add    %edx,%eax
    78c8:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    78cc:	85 c0                	test   %eax,%eax
    78ce:	74 06                	je     78d6 <III_get_scale_factors+0x308>
    78d0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    78d4:	75 6b                	jne    7941 <III_get_scale_factors+0x373>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    78d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    78d9:	8b 04 85 80 f0 00 00 	mov    0xf080(,%eax,4),%eax
    78e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    78e3:	eb 4a                	jmp    792f <III_get_scale_factors+0x361>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    78e5:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    78e9:	0f 9f c0             	setg   %al
    78ec:	0f b6 d0             	movzbl %al,%edx
    78ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
    78f2:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    78f5:	c1 e2 04             	shl    $0x4,%edx
    78f8:	01 d0                	add    %edx,%eax
    78fa:	8b 04 85 c0 f0 00 00 	mov    0xf0c0(,%eax,4),%eax
    7901:	83 ec 0c             	sub    $0xc,%esp
    7904:	50                   	push   %eax
    7905:	e8 9d d9 ff ff       	call   52a7 <hgetbits>
    790a:	83 c4 10             	add    $0x10,%esp
    790d:	89 c3                	mov    %eax,%ebx
    790f:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7912:	8b 45 14             	mov    0x14(%ebp),%eax
    7915:	89 c2                	mov    %eax,%edx
    7917:	8d 04 12             	lea    (%edx,%edx,1),%eax
    791a:	89 c2                	mov    %eax,%edx
    791c:	89 d0                	mov    %edx,%eax
    791e:	c1 e0 05             	shl    $0x5,%eax
    7921:	29 d0                	sub    %edx,%eax
    7923:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7926:	01 d0                	add    %edx,%eax
    7928:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    792b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    792f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7932:	83 c0 01             	add    $0x1,%eax
    7935:	8b 04 85 80 f0 00 00 	mov    0xf080(,%eax,4),%eax
    793c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    793f:	7f a4                	jg     78e5 <III_get_scale_factors+0x317>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    7941:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7945:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    7949:	0f 8e 64 ff ff ff    	jle    78b3 <III_get_scale_factors+0x2e5>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    794f:	8b 55 08             	mov    0x8(%ebp),%edx
    7952:	8b 45 14             	mov    0x14(%ebp),%eax
    7955:	c1 e0 03             	shl    $0x3,%eax
    7958:	89 c1                	mov    %eax,%ecx
    795a:	c1 e1 05             	shl    $0x5,%ecx
    795d:	29 c1                	sub    %eax,%ecx
    795f:	89 c8                	mov    %ecx,%eax
    7961:	83 c0 58             	add    $0x58,%eax
    7964:	01 d0                	add    %edx,%eax
    7966:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    796c:	8d 65 f8             	lea    -0x8(%ebp),%esp
    796f:	5b                   	pop    %ebx
    7970:	5e                   	pop    %esi
    7971:	5d                   	pop    %ebp
    7972:	c3                   	ret    

00007973 <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    7973:	55                   	push   %ebp
    7974:	89 e5                	mov    %esp,%ebp
    7976:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    7979:	a1 40 f4 00 00       	mov    0xf440,%eax
    797e:	85 c0                	test   %eax,%eax
    7980:	74 02                	je     7984 <initialize_huffman+0x11>
    7982:	eb 0f                	jmp    7993 <initialize_huffman+0x20>
	read_decoder_table();
    7984:	e8 7b d9 ff ff       	call   5304 <read_decoder_table>
	huffman_initialized = TRUE;
    7989:	c7 05 40 f4 00 00 01 	movl   $0x1,0xf440
    7990:	00 00 00 
}
    7993:	c9                   	leave  
    7994:	c3                   	ret    

00007995 <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    7995:	55                   	push   %ebp
    7996:	89 e5                	mov    %esp,%ebp
    7998:	57                   	push   %edi
    7999:	56                   	push   %esi
    799a:	53                   	push   %ebx
    799b:	83 ec 2c             	sub    $0x2c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    799e:	e8 d0 ff ff ff       	call   7973 <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    79a3:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    79a6:	8b 45 14             	mov    0x14(%ebp),%eax
    79a9:	8b 4d 10             	mov    0x10(%ebp),%ecx
    79ac:	89 c2                	mov    %eax,%edx
    79ae:	c1 e2 03             	shl    $0x3,%edx
    79b1:	01 c2                	add    %eax,%edx
    79b3:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    79ba:	89 c2                	mov    %eax,%edx
    79bc:	89 c8                	mov    %ecx,%eax
    79be:	c1 e0 02             	shl    $0x2,%eax
    79c1:	01 c8                	add    %ecx,%eax
    79c3:	c1 e0 05             	shl    $0x5,%eax
    79c6:	01 d0                	add    %edx,%eax
    79c8:	01 d8                	add    %ebx,%eax
    79ca:	83 c0 20             	add    $0x20,%eax
    79cd:	8b 40 08             	mov    0x8(%eax),%eax
    79d0:	85 c0                	test   %eax,%eax
    79d2:	74 45                	je     7a19 <III_hufman_decode+0x84>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    79d4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    79d7:	8b 45 14             	mov    0x14(%ebp),%eax
    79da:	8b 4d 10             	mov    0x10(%ebp),%ecx
    79dd:	89 c2                	mov    %eax,%edx
    79df:	c1 e2 03             	shl    $0x3,%edx
    79e2:	01 c2                	add    %eax,%edx
    79e4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    79eb:	89 c2                	mov    %eax,%edx
    79ed:	89 c8                	mov    %ecx,%eax
    79ef:	c1 e0 02             	shl    $0x2,%eax
    79f2:	01 c8                	add    %ecx,%eax
    79f4:	c1 e0 05             	shl    $0x5,%eax
    79f7:	01 d0                	add    %edx,%eax
    79f9:	01 d8                	add    %ebx,%eax
    79fb:	83 c0 20             	add    $0x20,%eax
    79fe:	8b 40 0c             	mov    0xc(%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    7a01:	83 f8 02             	cmp    $0x2,%eax
    7a04:	75 13                	jne    7a19 <III_hufman_decode+0x84>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    7a06:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    7a0d:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    7a14:	e9 cf 00 00 00       	jmp    7ae8 <III_hufman_decode+0x153>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7a19:	8b 45 1c             	mov    0x1c(%ebp),%eax
    7a1c:	8b 00                	mov    (%eax),%eax
    7a1e:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    7a21:	8b 75 0c             	mov    0xc(%ebp),%esi
    7a24:	8b 45 14             	mov    0x14(%ebp),%eax
    7a27:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7a2a:	89 c2                	mov    %eax,%edx
    7a2c:	c1 e2 03             	shl    $0x3,%edx
    7a2f:	01 c2                	add    %eax,%edx
    7a31:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7a38:	89 c2                	mov    %eax,%edx
    7a3a:	89 d8                	mov    %ebx,%eax
    7a3c:	c1 e0 02             	shl    $0x2,%eax
    7a3f:	01 d8                	add    %ebx,%eax
    7a41:	c1 e0 05             	shl    $0x5,%eax
    7a44:	01 d0                	add    %edx,%eax
    7a46:	01 f0                	add    %esi,%eax
    7a48:	83 c0 40             	add    $0x40,%eax
    7a4b:	8b 40 0c             	mov    0xc(%eax),%eax
    7a4e:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7a51:	89 c8                	mov    %ecx,%eax
    7a53:	c1 e0 03             	shl    $0x3,%eax
    7a56:	01 c8                	add    %ecx,%eax
    7a58:	c1 e0 02             	shl    $0x2,%eax
    7a5b:	01 c8                	add    %ecx,%eax
    7a5d:	01 d0                	add    %edx,%eax
    7a5f:	8b 04 85 40 f1 00 00 	mov    0xf140(,%eax,4),%eax
    7a66:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7a69:	8b 45 1c             	mov    0x1c(%ebp),%eax
    7a6c:	8b 00                	mov    (%eax),%eax
    7a6e:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    7a71:	8b 75 0c             	mov    0xc(%ebp),%esi
    7a74:	8b 45 14             	mov    0x14(%ebp),%eax
    7a77:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7a7a:	89 c2                	mov    %eax,%edx
    7a7c:	c1 e2 03             	shl    $0x3,%edx
    7a7f:	01 c2                	add    %eax,%edx
    7a81:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7a88:	89 c2                	mov    %eax,%edx
    7a8a:	89 d8                	mov    %ebx,%eax
    7a8c:	c1 e0 02             	shl    $0x2,%eax
    7a8f:	01 d8                	add    %ebx,%eax
    7a91:	c1 e0 05             	shl    $0x5,%eax
    7a94:	01 d0                	add    %edx,%eax
    7a96:	01 f0                	add    %esi,%eax
    7a98:	83 c0 40             	add    $0x40,%eax
    7a9b:	8b 70 0c             	mov    0xc(%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    7a9e:	8b 7d 0c             	mov    0xc(%ebp),%edi
    7aa1:	8b 45 14             	mov    0x14(%ebp),%eax
    7aa4:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7aa7:	89 c2                	mov    %eax,%edx
    7aa9:	c1 e2 03             	shl    $0x3,%edx
    7aac:	01 c2                	add    %eax,%edx
    7aae:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7ab5:	89 c2                	mov    %eax,%edx
    7ab7:	89 d8                	mov    %ebx,%eax
    7ab9:	c1 e0 02             	shl    $0x2,%eax
    7abc:	01 d8                	add    %ebx,%eax
    7abe:	c1 e0 05             	shl    $0x5,%eax
    7ac1:	01 d0                	add    %edx,%eax
    7ac3:	01 f8                	add    %edi,%eax
    7ac5:	83 c0 40             	add    $0x40,%eax
    7ac8:	8b 40 10             	mov    0x10(%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    7acb:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    7acd:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7ad0:	89 c8                	mov    %ecx,%eax
    7ad2:	c1 e0 03             	shl    $0x3,%eax
    7ad5:	01 c8                	add    %ecx,%eax
    7ad7:	c1 e0 02             	shl    $0x2,%eax
    7ada:	01 c8                	add    %ecx,%eax
    7adc:	01 d0                	add    %edx,%eax
    7ade:	8b 04 85 40 f1 00 00 	mov    0xf140(,%eax,4),%eax
    7ae5:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    7ae8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    7aef:	e9 a6 01 00 00       	jmp    7c9a <III_hufman_decode+0x305>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    7af4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7af7:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    7afa:	7d 44                	jge    7b40 <III_hufman_decode+0x1ab>
    7afc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7aff:	8b 45 14             	mov    0x14(%ebp),%eax
    7b02:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7b05:	89 c2                	mov    %eax,%edx
    7b07:	c1 e2 03             	shl    $0x3,%edx
    7b0a:	01 c2                	add    %eax,%edx
    7b0c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7b13:	89 c2                	mov    %eax,%edx
    7b15:	89 c8                	mov    %ecx,%eax
    7b17:	c1 e0 02             	shl    $0x2,%eax
    7b1a:	01 c8                	add    %ecx,%eax
    7b1c:	c1 e0 05             	shl    $0x5,%eax
    7b1f:	01 d0                	add    %edx,%eax
    7b21:	01 d8                	add    %ebx,%eax
    7b23:	83 c0 20             	add    $0x20,%eax
    7b26:	8b 50 14             	mov    0x14(%eax),%edx
    7b29:	89 d0                	mov    %edx,%eax
    7b2b:	c1 e0 02             	shl    $0x2,%eax
    7b2e:	01 d0                	add    %edx,%eax
    7b30:	c1 e0 03             	shl    $0x3,%eax
    7b33:	05 40 2e 01 00       	add    $0x12e40,%eax
    7b38:	89 45 e0             	mov    %eax,-0x20(%ebp)
    7b3b:	e9 88 00 00 00       	jmp    7bc8 <III_hufman_decode+0x233>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    7b40:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7b43:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    7b46:	7d 41                	jge    7b89 <III_hufman_decode+0x1f4>
    7b48:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7b4b:	8b 45 14             	mov    0x14(%ebp),%eax
    7b4e:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7b51:	89 c2                	mov    %eax,%edx
    7b53:	c1 e2 03             	shl    $0x3,%edx
    7b56:	01 c2                	add    %eax,%edx
    7b58:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7b5f:	89 c2                	mov    %eax,%edx
    7b61:	89 c8                	mov    %ecx,%eax
    7b63:	c1 e0 02             	shl    $0x2,%eax
    7b66:	01 c8                	add    %ecx,%eax
    7b68:	c1 e0 05             	shl    $0x5,%eax
    7b6b:	01 d0                	add    %edx,%eax
    7b6d:	01 d8                	add    %ebx,%eax
    7b6f:	83 c0 24             	add    $0x24,%eax
    7b72:	8b 50 14             	mov    0x14(%eax),%edx
    7b75:	89 d0                	mov    %edx,%eax
    7b77:	c1 e0 02             	shl    $0x2,%eax
    7b7a:	01 d0                	add    %edx,%eax
    7b7c:	c1 e0 03             	shl    $0x3,%eax
    7b7f:	05 40 2e 01 00       	add    $0x12e40,%eax
    7b84:	89 45 e0             	mov    %eax,-0x20(%ebp)
    7b87:	eb 3f                	jmp    7bc8 <III_hufman_decode+0x233>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    7b89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7b8c:	8b 45 14             	mov    0x14(%ebp),%eax
    7b8f:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7b92:	89 c2                	mov    %eax,%edx
    7b94:	c1 e2 03             	shl    $0x3,%edx
    7b97:	01 c2                	add    %eax,%edx
    7b99:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7ba0:	89 c2                	mov    %eax,%edx
    7ba2:	89 c8                	mov    %ecx,%eax
    7ba4:	c1 e0 02             	shl    $0x2,%eax
    7ba7:	01 c8                	add    %ecx,%eax
    7ba9:	c1 e0 05             	shl    $0x5,%eax
    7bac:	01 d0                	add    %edx,%eax
    7bae:	01 d8                	add    %ebx,%eax
    7bb0:	83 c0 28             	add    $0x28,%eax
    7bb3:	8b 50 14             	mov    0x14(%eax),%edx
    7bb6:	89 d0                	mov    %edx,%eax
    7bb8:	c1 e0 02             	shl    $0x2,%eax
    7bbb:	01 d0                	add    %edx,%eax
    7bbd:	c1 e0 03             	shl    $0x3,%eax
    7bc0:	05 40 2e 01 00       	add    $0x12e40,%eax
    7bc5:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    7bc8:	83 ec 0c             	sub    $0xc,%esp
    7bcb:	8d 45 c8             	lea    -0x38(%ebp),%eax
    7bce:	50                   	push   %eax
    7bcf:	8d 45 cc             	lea    -0x34(%ebp),%eax
    7bd2:	50                   	push   %eax
    7bd3:	8d 45 d0             	lea    -0x30(%ebp),%eax
    7bd6:	50                   	push   %eax
    7bd7:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    7bda:	50                   	push   %eax
    7bdb:	ff 75 e0             	pushl  -0x20(%ebp)
    7bde:	e8 d9 ee ff ff       	call   6abc <huffman_decoder>
    7be3:	83 c4 20             	add    $0x20,%esp
      is[i/SSLIMIT][i%SSLIMIT] = x;
    7be6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7be9:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7bee:	89 c8                	mov    %ecx,%eax
    7bf0:	f7 ea                	imul   %edx
    7bf2:	c1 fa 02             	sar    $0x2,%edx
    7bf5:	89 c8                	mov    %ecx,%eax
    7bf7:	c1 f8 1f             	sar    $0x1f,%eax
    7bfa:	29 c2                	sub    %eax,%edx
    7bfc:	89 d0                	mov    %edx,%eax
    7bfe:	89 c2                	mov    %eax,%edx
    7c00:	89 d0                	mov    %edx,%eax
    7c02:	c1 e0 03             	shl    $0x3,%eax
    7c05:	01 d0                	add    %edx,%eax
    7c07:	c1 e0 03             	shl    $0x3,%eax
    7c0a:	89 c2                	mov    %eax,%edx
    7c0c:	8b 45 08             	mov    0x8(%ebp),%eax
    7c0f:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7c12:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7c15:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7c1a:	89 c8                	mov    %ecx,%eax
    7c1c:	f7 ea                	imul   %edx
    7c1e:	c1 fa 02             	sar    $0x2,%edx
    7c21:	89 c8                	mov    %ecx,%eax
    7c23:	c1 f8 1f             	sar    $0x1f,%eax
    7c26:	29 c2                	sub    %eax,%edx
    7c28:	89 d0                	mov    %edx,%eax
    7c2a:	c1 e0 03             	shl    $0x3,%eax
    7c2d:	01 d0                	add    %edx,%eax
    7c2f:	01 c0                	add    %eax,%eax
    7c31:	29 c1                	sub    %eax,%ecx
    7c33:	89 ca                	mov    %ecx,%edx
    7c35:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7c38:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    7c3b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7c3e:	8d 48 01             	lea    0x1(%eax),%ecx
    7c41:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7c46:	89 c8                	mov    %ecx,%eax
    7c48:	f7 ea                	imul   %edx
    7c4a:	c1 fa 02             	sar    $0x2,%edx
    7c4d:	89 c8                	mov    %ecx,%eax
    7c4f:	c1 f8 1f             	sar    $0x1f,%eax
    7c52:	29 c2                	sub    %eax,%edx
    7c54:	89 d0                	mov    %edx,%eax
    7c56:	89 c2                	mov    %eax,%edx
    7c58:	89 d0                	mov    %edx,%eax
    7c5a:	c1 e0 03             	shl    $0x3,%eax
    7c5d:	01 d0                	add    %edx,%eax
    7c5f:	c1 e0 03             	shl    $0x3,%eax
    7c62:	89 c2                	mov    %eax,%edx
    7c64:	8b 45 08             	mov    0x8(%ebp),%eax
    7c67:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7c6a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7c6d:	8d 48 01             	lea    0x1(%eax),%ecx
    7c70:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7c75:	89 c8                	mov    %ecx,%eax
    7c77:	f7 ea                	imul   %edx
    7c79:	c1 fa 02             	sar    $0x2,%edx
    7c7c:	89 c8                	mov    %ecx,%eax
    7c7e:	c1 f8 1f             	sar    $0x1f,%eax
    7c81:	29 c2                	sub    %eax,%edx
    7c83:	89 d0                	mov    %edx,%eax
    7c85:	c1 e0 03             	shl    $0x3,%eax
    7c88:	01 d0                	add    %edx,%eax
    7c8a:	01 c0                	add    %eax,%eax
    7c8c:	29 c1                	sub    %eax,%ecx
    7c8e:	89 ca                	mov    %ecx,%edx
    7c90:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7c93:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    7c96:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    7c9a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    7c9d:	8b 75 0c             	mov    0xc(%ebp),%esi
    7ca0:	8b 45 14             	mov    0x14(%ebp),%eax
    7ca3:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7ca6:	89 c2                	mov    %eax,%edx
    7ca8:	c1 e2 03             	shl    $0x3,%edx
    7cab:	01 c2                	add    %eax,%edx
    7cad:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7cb4:	89 c2                	mov    %eax,%edx
    7cb6:	89 c8                	mov    %ecx,%eax
    7cb8:	c1 e0 02             	shl    $0x2,%eax
    7cbb:	01 c8                	add    %ecx,%eax
    7cbd:	c1 e0 05             	shl    $0x5,%eax
    7cc0:	01 d0                	add    %edx,%eax
    7cc2:	01 f0                	add    %esi,%eax
    7cc4:	83 c0 10             	add    $0x10,%eax
    7cc7:	8b 40 0c             	mov    0xc(%eax),%eax
    7cca:	01 c0                	add    %eax,%eax
    7ccc:	39 c3                	cmp    %eax,%ebx
    7cce:	0f 82 20 fe ff ff    	jb     7af4 <III_hufman_decode+0x15f>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    7cd4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7cd7:	8b 45 14             	mov    0x14(%ebp),%eax
    7cda:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7cdd:	89 c2                	mov    %eax,%edx
    7cdf:	c1 e2 03             	shl    $0x3,%edx
    7ce2:	01 c2                	add    %eax,%edx
    7ce4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7ceb:	89 c2                	mov    %eax,%edx
    7ced:	89 c8                	mov    %ecx,%eax
    7cef:	c1 e0 02             	shl    $0x2,%eax
    7cf2:	01 c8                	add    %ecx,%eax
    7cf4:	c1 e0 05             	shl    $0x5,%eax
    7cf7:	01 d0                	add    %edx,%eax
    7cf9:	01 d8                	add    %ebx,%eax
    7cfb:	83 c0 50             	add    $0x50,%eax
    7cfe:	8b 40 0c             	mov    0xc(%eax),%eax
    7d01:	8d 50 20             	lea    0x20(%eax),%edx
    7d04:	89 d0                	mov    %edx,%eax
    7d06:	c1 e0 02             	shl    $0x2,%eax
    7d09:	01 d0                	add    %edx,%eax
    7d0b:	c1 e0 03             	shl    $0x3,%eax
    7d0e:	05 40 2e 01 00       	add    $0x12e40,%eax
    7d13:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    7d16:	e9 88 01 00 00       	jmp    7ea3 <III_hufman_decode+0x50e>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    7d1b:	83 ec 0c             	sub    $0xc,%esp
    7d1e:	8d 45 c8             	lea    -0x38(%ebp),%eax
    7d21:	50                   	push   %eax
    7d22:	8d 45 cc             	lea    -0x34(%ebp),%eax
    7d25:	50                   	push   %eax
    7d26:	8d 45 d0             	lea    -0x30(%ebp),%eax
    7d29:	50                   	push   %eax
    7d2a:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    7d2d:	50                   	push   %eax
    7d2e:	ff 75 e0             	pushl  -0x20(%ebp)
    7d31:	e8 86 ed ff ff       	call   6abc <huffman_decoder>
    7d36:	83 c4 20             	add    $0x20,%esp
      is[i/SSLIMIT][i%SSLIMIT] = v;
    7d39:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7d3c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7d41:	89 c8                	mov    %ecx,%eax
    7d43:	f7 ea                	imul   %edx
    7d45:	c1 fa 02             	sar    $0x2,%edx
    7d48:	89 c8                	mov    %ecx,%eax
    7d4a:	c1 f8 1f             	sar    $0x1f,%eax
    7d4d:	29 c2                	sub    %eax,%edx
    7d4f:	89 d0                	mov    %edx,%eax
    7d51:	89 c2                	mov    %eax,%edx
    7d53:	89 d0                	mov    %edx,%eax
    7d55:	c1 e0 03             	shl    $0x3,%eax
    7d58:	01 d0                	add    %edx,%eax
    7d5a:	c1 e0 03             	shl    $0x3,%eax
    7d5d:	89 c2                	mov    %eax,%edx
    7d5f:	8b 45 08             	mov    0x8(%ebp),%eax
    7d62:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7d65:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7d68:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7d6d:	89 c8                	mov    %ecx,%eax
    7d6f:	f7 ea                	imul   %edx
    7d71:	c1 fa 02             	sar    $0x2,%edx
    7d74:	89 c8                	mov    %ecx,%eax
    7d76:	c1 f8 1f             	sar    $0x1f,%eax
    7d79:	29 c2                	sub    %eax,%edx
    7d7b:	89 d0                	mov    %edx,%eax
    7d7d:	c1 e0 03             	shl    $0x3,%eax
    7d80:	01 d0                	add    %edx,%eax
    7d82:	01 c0                	add    %eax,%eax
    7d84:	29 c1                	sub    %eax,%ecx
    7d86:	89 ca                	mov    %ecx,%edx
    7d88:	8b 45 cc             	mov    -0x34(%ebp),%eax
    7d8b:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    7d8e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7d91:	8d 48 01             	lea    0x1(%eax),%ecx
    7d94:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7d99:	89 c8                	mov    %ecx,%eax
    7d9b:	f7 ea                	imul   %edx
    7d9d:	c1 fa 02             	sar    $0x2,%edx
    7da0:	89 c8                	mov    %ecx,%eax
    7da2:	c1 f8 1f             	sar    $0x1f,%eax
    7da5:	29 c2                	sub    %eax,%edx
    7da7:	89 d0                	mov    %edx,%eax
    7da9:	89 c2                	mov    %eax,%edx
    7dab:	89 d0                	mov    %edx,%eax
    7dad:	c1 e0 03             	shl    $0x3,%eax
    7db0:	01 d0                	add    %edx,%eax
    7db2:	c1 e0 03             	shl    $0x3,%eax
    7db5:	89 c2                	mov    %eax,%edx
    7db7:	8b 45 08             	mov    0x8(%ebp),%eax
    7dba:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7dbd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7dc0:	8d 48 01             	lea    0x1(%eax),%ecx
    7dc3:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7dc8:	89 c8                	mov    %ecx,%eax
    7dca:	f7 ea                	imul   %edx
    7dcc:	c1 fa 02             	sar    $0x2,%edx
    7dcf:	89 c8                	mov    %ecx,%eax
    7dd1:	c1 f8 1f             	sar    $0x1f,%eax
    7dd4:	29 c2                	sub    %eax,%edx
    7dd6:	89 d0                	mov    %edx,%eax
    7dd8:	c1 e0 03             	shl    $0x3,%eax
    7ddb:	01 d0                	add    %edx,%eax
    7ddd:	01 c0                	add    %eax,%eax
    7ddf:	29 c1                	sub    %eax,%ecx
    7de1:	89 ca                	mov    %ecx,%edx
    7de3:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7de6:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    7de9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7dec:	8d 48 02             	lea    0x2(%eax),%ecx
    7def:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7df4:	89 c8                	mov    %ecx,%eax
    7df6:	f7 ea                	imul   %edx
    7df8:	c1 fa 02             	sar    $0x2,%edx
    7dfb:	89 c8                	mov    %ecx,%eax
    7dfd:	c1 f8 1f             	sar    $0x1f,%eax
    7e00:	29 c2                	sub    %eax,%edx
    7e02:	89 d0                	mov    %edx,%eax
    7e04:	89 c2                	mov    %eax,%edx
    7e06:	89 d0                	mov    %edx,%eax
    7e08:	c1 e0 03             	shl    $0x3,%eax
    7e0b:	01 d0                	add    %edx,%eax
    7e0d:	c1 e0 03             	shl    $0x3,%eax
    7e10:	89 c2                	mov    %eax,%edx
    7e12:	8b 45 08             	mov    0x8(%ebp),%eax
    7e15:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7e18:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7e1b:	8d 48 02             	lea    0x2(%eax),%ecx
    7e1e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7e23:	89 c8                	mov    %ecx,%eax
    7e25:	f7 ea                	imul   %edx
    7e27:	c1 fa 02             	sar    $0x2,%edx
    7e2a:	89 c8                	mov    %ecx,%eax
    7e2c:	c1 f8 1f             	sar    $0x1f,%eax
    7e2f:	29 c2                	sub    %eax,%edx
    7e31:	89 d0                	mov    %edx,%eax
    7e33:	c1 e0 03             	shl    $0x3,%eax
    7e36:	01 d0                	add    %edx,%eax
    7e38:	01 c0                	add    %eax,%eax
    7e3a:	29 c1                	sub    %eax,%ecx
    7e3c:	89 ca                	mov    %ecx,%edx
    7e3e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7e41:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    7e44:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7e47:	8d 48 03             	lea    0x3(%eax),%ecx
    7e4a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7e4f:	89 c8                	mov    %ecx,%eax
    7e51:	f7 ea                	imul   %edx
    7e53:	c1 fa 02             	sar    $0x2,%edx
    7e56:	89 c8                	mov    %ecx,%eax
    7e58:	c1 f8 1f             	sar    $0x1f,%eax
    7e5b:	29 c2                	sub    %eax,%edx
    7e5d:	89 d0                	mov    %edx,%eax
    7e5f:	89 c2                	mov    %eax,%edx
    7e61:	89 d0                	mov    %edx,%eax
    7e63:	c1 e0 03             	shl    $0x3,%eax
    7e66:	01 d0                	add    %edx,%eax
    7e68:	c1 e0 03             	shl    $0x3,%eax
    7e6b:	89 c2                	mov    %eax,%edx
    7e6d:	8b 45 08             	mov    0x8(%ebp),%eax
    7e70:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7e73:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7e76:	8d 48 03             	lea    0x3(%eax),%ecx
    7e79:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7e7e:	89 c8                	mov    %ecx,%eax
    7e80:	f7 ea                	imul   %edx
    7e82:	c1 fa 02             	sar    $0x2,%edx
    7e85:	89 c8                	mov    %ecx,%eax
    7e87:	c1 f8 1f             	sar    $0x1f,%eax
    7e8a:	29 c2                	sub    %eax,%edx
    7e8c:	89 d0                	mov    %edx,%eax
    7e8e:	c1 e0 03             	shl    $0x3,%eax
    7e91:	01 d0                	add    %edx,%eax
    7e93:	01 c0                	add    %eax,%eax
    7e95:	29 c1                	sub    %eax,%ecx
    7e97:	89 ca                	mov    %ecx,%edx
    7e99:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7e9c:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    7e9f:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    7ea3:	e8 e8 d3 ff ff       	call   5290 <hsstell>
    7ea8:	89 c6                	mov    %eax,%esi
    7eaa:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7ead:	8b 45 14             	mov    0x14(%ebp),%eax
    7eb0:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7eb3:	89 c2                	mov    %eax,%edx
    7eb5:	c1 e2 03             	shl    $0x3,%edx
    7eb8:	01 c2                	add    %eax,%edx
    7eba:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7ec1:	89 c2                	mov    %eax,%edx
    7ec3:	89 c8                	mov    %ecx,%eax
    7ec5:	c1 e0 02             	shl    $0x2,%eax
    7ec8:	01 c8                	add    %ecx,%eax
    7eca:	c1 e0 05             	shl    $0x5,%eax
    7ecd:	01 d0                	add    %edx,%eax
    7ecf:	01 d8                	add    %ebx,%eax
    7ed1:	83 c0 10             	add    $0x10,%eax
    7ed4:	8b 50 08             	mov    0x8(%eax),%edx
    7ed7:	8b 45 18             	mov    0x18(%ebp),%eax
    7eda:	01 d0                	add    %edx,%eax
    7edc:	39 c6                	cmp    %eax,%esi
    7ede:	73 0d                	jae    7eed <III_hufman_decode+0x558>
    7ee0:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    7ee7:	0f 8e 2e fe ff ff    	jle    7d1b <III_hufman_decode+0x386>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    7eed:	e8 9e d3 ff ff       	call   5290 <hsstell>
    7ef2:	89 c6                	mov    %eax,%esi
    7ef4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7ef7:	8b 45 14             	mov    0x14(%ebp),%eax
    7efa:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7efd:	89 c2                	mov    %eax,%edx
    7eff:	c1 e2 03             	shl    $0x3,%edx
    7f02:	01 c2                	add    %eax,%edx
    7f04:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7f0b:	89 c2                	mov    %eax,%edx
    7f0d:	89 c8                	mov    %ecx,%eax
    7f0f:	c1 e0 02             	shl    $0x2,%eax
    7f12:	01 c8                	add    %ecx,%eax
    7f14:	c1 e0 05             	shl    $0x5,%eax
    7f17:	01 d0                	add    %edx,%eax
    7f19:	01 d8                	add    %ebx,%eax
    7f1b:	83 c0 10             	add    $0x10,%eax
    7f1e:	8b 50 08             	mov    0x8(%eax),%edx
    7f21:	8b 45 18             	mov    0x18(%ebp),%eax
    7f24:	01 d0                	add    %edx,%eax
    7f26:	39 c6                	cmp    %eax,%esi
    7f28:	76 4f                	jbe    7f79 <III_hufman_decode+0x5e4>
   {  i -=4;
    7f2a:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    7f2e:	e8 5d d3 ff ff       	call   5290 <hsstell>
    7f33:	89 c2                	mov    %eax,%edx
    7f35:	8b 45 18             	mov    0x18(%ebp),%eax
    7f38:	89 d6                	mov    %edx,%esi
    7f3a:	29 c6                	sub    %eax,%esi
    7f3c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7f3f:	8b 45 14             	mov    0x14(%ebp),%eax
    7f42:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7f45:	89 c2                	mov    %eax,%edx
    7f47:	c1 e2 03             	shl    $0x3,%edx
    7f4a:	01 c2                	add    %eax,%edx
    7f4c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7f53:	89 c2                	mov    %eax,%edx
    7f55:	89 c8                	mov    %ecx,%eax
    7f57:	c1 e0 02             	shl    $0x2,%eax
    7f5a:	01 c8                	add    %ecx,%eax
    7f5c:	c1 e0 05             	shl    $0x5,%eax
    7f5f:	01 d0                	add    %edx,%eax
    7f61:	01 d8                	add    %ebx,%eax
    7f63:	83 c0 10             	add    $0x10,%eax
    7f66:	8b 40 08             	mov    0x8(%eax),%eax
    7f69:	29 c6                	sub    %eax,%esi
    7f6b:	89 f0                	mov    %esi,%eax
    7f6d:	83 ec 0c             	sub    $0xc,%esp
    7f70:	50                   	push   %eax
    7f71:	e8 5e d3 ff ff       	call   52d4 <rewindNbits>
    7f76:	83 c4 10             	add    $0x10,%esp
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    7f79:	e8 12 d3 ff ff       	call   5290 <hsstell>
    7f7e:	89 c6                	mov    %eax,%esi
    7f80:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7f83:	8b 45 14             	mov    0x14(%ebp),%eax
    7f86:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7f89:	89 c2                	mov    %eax,%edx
    7f8b:	c1 e2 03             	shl    $0x3,%edx
    7f8e:	01 c2                	add    %eax,%edx
    7f90:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7f97:	89 c2                	mov    %eax,%edx
    7f99:	89 c8                	mov    %ecx,%eax
    7f9b:	c1 e0 02             	shl    $0x2,%eax
    7f9e:	01 c8                	add    %ecx,%eax
    7fa0:	c1 e0 05             	shl    $0x5,%eax
    7fa3:	01 d0                	add    %edx,%eax
    7fa5:	01 d8                	add    %ebx,%eax
    7fa7:	83 c0 10             	add    $0x10,%eax
    7faa:	8b 50 08             	mov    0x8(%eax),%edx
    7fad:	8b 45 18             	mov    0x18(%ebp),%eax
    7fb0:	01 d0                	add    %edx,%eax
    7fb2:	39 c6                	cmp    %eax,%esi
    7fb4:	73 48                	jae    7ffe <III_hufman_decode+0x669>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    7fb6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7fb9:	8b 45 14             	mov    0x14(%ebp),%eax
    7fbc:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7fbf:	89 c2                	mov    %eax,%edx
    7fc1:	c1 e2 03             	shl    $0x3,%edx
    7fc4:	01 c2                	add    %eax,%edx
    7fc6:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7fcd:	89 c2                	mov    %eax,%edx
    7fcf:	89 c8                	mov    %ecx,%eax
    7fd1:	c1 e0 02             	shl    $0x2,%eax
    7fd4:	01 c8                	add    %ecx,%eax
    7fd6:	c1 e0 05             	shl    $0x5,%eax
    7fd9:	01 d0                	add    %edx,%eax
    7fdb:	01 d8                	add    %ebx,%eax
    7fdd:	83 c0 10             	add    $0x10,%eax
    7fe0:	8b 50 08             	mov    0x8(%eax),%edx
    7fe3:	8b 45 18             	mov    0x18(%ebp),%eax
    7fe6:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7fe9:	e8 a2 d2 ff ff       	call   5290 <hsstell>
    7fee:	29 c3                	sub    %eax,%ebx
    7ff0:	89 d8                	mov    %ebx,%eax
    7ff2:	83 ec 0c             	sub    $0xc,%esp
    7ff5:	50                   	push   %eax
    7ff6:	e8 ac d2 ff ff       	call   52a7 <hgetbits>
    7ffb:	83 c4 10             	add    $0x10,%esp

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    7ffe:	eb 5a                	jmp    805a <III_hufman_decode+0x6c5>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    8000:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8003:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8008:	89 c8                	mov    %ecx,%eax
    800a:	f7 ea                	imul   %edx
    800c:	c1 fa 02             	sar    $0x2,%edx
    800f:	89 c8                	mov    %ecx,%eax
    8011:	c1 f8 1f             	sar    $0x1f,%eax
    8014:	29 c2                	sub    %eax,%edx
    8016:	89 d0                	mov    %edx,%eax
    8018:	89 c2                	mov    %eax,%edx
    801a:	89 d0                	mov    %edx,%eax
    801c:	c1 e0 03             	shl    $0x3,%eax
    801f:	01 d0                	add    %edx,%eax
    8021:	c1 e0 03             	shl    $0x3,%eax
    8024:	89 c2                	mov    %eax,%edx
    8026:	8b 45 08             	mov    0x8(%ebp),%eax
    8029:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    802c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    802f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8034:	89 c8                	mov    %ecx,%eax
    8036:	f7 ea                	imul   %edx
    8038:	c1 fa 02             	sar    $0x2,%edx
    803b:	89 c8                	mov    %ecx,%eax
    803d:	c1 f8 1f             	sar    $0x1f,%eax
    8040:	29 c2                	sub    %eax,%edx
    8042:	89 d0                	mov    %edx,%eax
    8044:	c1 e0 03             	shl    $0x3,%eax
    8047:	01 d0                	add    %edx,%eax
    8049:	01 c0                	add    %eax,%eax
    804b:	29 c1                	sub    %eax,%ecx
    804d:	89 ca                	mov    %ecx,%edx
    804f:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    8056:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    805a:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    8061:	7e 9d                	jle    8000 <III_hufman_decode+0x66b>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    8063:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8066:	5b                   	pop    %ebx
    8067:	5e                   	pop    %esi
    8068:	5f                   	pop    %edi
    8069:	5d                   	pop    %ebp
    806a:	c3                   	ret    

0000806b <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    806b:	55                   	push   %ebp
    806c:	89 e5                	mov    %esp,%ebp
    806e:	53                   	push   %ebx
    806f:	83 ec 34             	sub    $0x34,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    8072:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8079:	8b 45 1c             	mov    0x1c(%ebp),%eax
    807c:	8b 00                	mov    (%eax),%eax
    807e:	8b 40 10             	mov    0x10(%eax),%eax
    8081:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    8084:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    808b:	8b 45 14             	mov    0x14(%ebp),%eax
    808e:	8b 40 10             	mov    0x10(%eax),%eax
    8091:	85 c0                	test   %eax,%eax
    8093:	74 6a                	je     80ff <III_dequantize_sample+0x94>
    8095:	8b 45 14             	mov    0x14(%ebp),%eax
    8098:	8b 40 14             	mov    0x14(%eax),%eax
    809b:	83 f8 02             	cmp    $0x2,%eax
    809e:	75 5f                	jne    80ff <III_dequantize_sample+0x94>
		if (gr_info->mixed_block_flag)
    80a0:	8b 45 14             	mov    0x14(%ebp),%eax
    80a3:	8b 40 18             	mov    0x18(%eax),%eax
    80a6:	85 c0                	test   %eax,%eax
    80a8:	74 18                	je     80c2 <III_dequantize_sample+0x57>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    80aa:	8b 45 dc             	mov    -0x24(%ebp),%eax
    80ad:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    80b3:	83 c0 04             	add    $0x4,%eax
    80b6:	05 40 f1 00 00       	add    $0xf140,%eax
    80bb:	8b 00                	mov    (%eax),%eax
    80bd:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    80c0:	eb 53                	jmp    8115 <III_dequantize_sample+0xaa>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    80c2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    80c5:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    80cb:	83 c0 54             	add    $0x54,%eax
    80ce:	05 40 f1 00 00       	add    $0xf140,%eax
    80d3:	8b 50 0c             	mov    0xc(%eax),%edx
    80d6:	89 d0                	mov    %edx,%eax
    80d8:	01 c0                	add    %eax,%eax
    80da:	01 d0                	add    %edx,%eax
    80dc:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    80df:	8b 45 dc             	mov    -0x24(%ebp),%eax
    80e2:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    80e8:	83 c0 54             	add    $0x54,%eax
    80eb:	05 40 f1 00 00       	add    $0xf140,%eax
    80f0:	8b 40 0c             	mov    0xc(%eax),%eax
    80f3:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    80f6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    80fd:	eb 16                	jmp    8115 <III_dequantize_sample+0xaa>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    80ff:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8102:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8108:	83 c0 04             	add    $0x4,%eax
    810b:	05 40 f1 00 00       	add    $0xf140,%eax
    8110:	8b 00                	mov    (%eax),%eax
    8112:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    8115:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    811c:	e9 8a 06 00 00       	jmp    87ab <III_dequantize_sample+0x740>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    8121:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8128:	e9 70 06 00 00       	jmp    879d <III_dequantize_sample+0x732>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    812d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8130:	89 d0                	mov    %edx,%eax
    8132:	c1 e0 03             	shl    $0x3,%eax
    8135:	01 d0                	add    %edx,%eax
    8137:	01 c0                	add    %eax,%eax
    8139:	89 c2                	mov    %eax,%edx
    813b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    813e:	01 d0                	add    %edx,%eax
    8140:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    8143:	0f 85 a7 02 00 00    	jne    83f0 <III_dequantize_sample+0x385>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    8149:	8b 45 14             	mov    0x14(%ebp),%eax
    814c:	8b 40 10             	mov    0x10(%eax),%eax
    814f:	85 c0                	test   %eax,%eax
    8151:	0f 84 74 02 00 00    	je     83cb <III_dequantize_sample+0x360>
    8157:	8b 45 14             	mov    0x14(%ebp),%eax
    815a:	8b 40 14             	mov    0x14(%eax),%eax
    815d:	83 f8 02             	cmp    $0x2,%eax
    8160:	0f 85 65 02 00 00    	jne    83cb <III_dequantize_sample+0x360>
					if (gr_info->mixed_block_flag) {
    8166:	8b 45 14             	mov    0x14(%ebp),%eax
    8169:	8b 40 18             	mov    0x18(%eax),%eax
    816c:	85 c0                	test   %eax,%eax
    816e:	0f 84 b8 01 00 00    	je     832c <III_dequantize_sample+0x2c1>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    8174:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8177:	89 d0                	mov    %edx,%eax
    8179:	c1 e0 03             	shl    $0x3,%eax
    817c:	01 d0                	add    %edx,%eax
    817e:	01 c0                	add    %eax,%eax
    8180:	89 c2                	mov    %eax,%edx
    8182:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8185:	01 c2                	add    %eax,%edx
    8187:	8b 45 dc             	mov    -0x24(%ebp),%eax
    818a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8190:	83 c0 20             	add    $0x20,%eax
    8193:	05 40 f1 00 00       	add    $0xf140,%eax
    8198:	8b 00                	mov    (%eax),%eax
    819a:	39 c2                	cmp    %eax,%edx
    819c:	0f 85 96 00 00 00    	jne    8238 <III_dequantize_sample+0x1cd>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    81a2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    81a5:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    81ab:	83 c0 60             	add    $0x60,%eax
    81ae:	05 40 f1 00 00       	add    $0xf140,%eax
    81b3:	8b 50 0c             	mov    0xc(%eax),%edx
    81b6:	89 d0                	mov    %edx,%eax
    81b8:	01 c0                	add    %eax,%eax
    81ba:	01 d0                	add    %edx,%eax
    81bc:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    81bf:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    81c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    81c9:	8d 48 01             	lea    0x1(%eax),%ecx
    81cc:	8b 55 dc             	mov    -0x24(%ebp),%edx
    81cf:	89 d0                	mov    %edx,%eax
    81d1:	c1 e0 03             	shl    $0x3,%eax
    81d4:	01 d0                	add    %edx,%eax
    81d6:	c1 e0 02             	shl    $0x2,%eax
    81d9:	01 d0                	add    %edx,%eax
    81db:	01 c8                	add    %ecx,%eax
    81dd:	83 c0 14             	add    $0x14,%eax
    81e0:	8b 0c 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    81e7:	8b 55 dc             	mov    -0x24(%ebp),%edx
    81ea:	89 d0                	mov    %edx,%eax
    81ec:	c1 e0 03             	shl    $0x3,%eax
    81ef:	01 d0                	add    %edx,%eax
    81f1:	c1 e0 02             	shl    $0x2,%eax
    81f4:	01 d0                	add    %edx,%eax
    81f6:	8b 55 ec             	mov    -0x14(%ebp),%edx
    81f9:	01 d0                	add    %edx,%eax
    81fb:	83 c0 14             	add    $0x14,%eax
    81fe:	8b 04 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    8205:	29 c1                	sub    %eax,%ecx
    8207:	89 c8                	mov    %ecx,%eax
    8209:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    820c:	8b 55 dc             	mov    -0x24(%ebp),%edx
    820f:	89 d0                	mov    %edx,%eax
    8211:	c1 e0 03             	shl    $0x3,%eax
    8214:	01 d0                	add    %edx,%eax
    8216:	c1 e0 02             	shl    $0x2,%eax
    8219:	01 d0                	add    %edx,%eax
    821b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    821e:	01 d0                	add    %edx,%eax
    8220:	83 c0 14             	add    $0x14,%eax
    8223:	8b 14 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%edx
    822a:	89 d0                	mov    %edx,%eax
    822c:	01 c0                	add    %eax,%eax
    822e:	01 d0                	add    %edx,%eax
    8230:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    8233:	e9 91 01 00 00       	jmp    83c9 <III_dequantize_sample+0x35e>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    8238:	8b 55 f0             	mov    -0x10(%ebp),%edx
    823b:	89 d0                	mov    %edx,%eax
    823d:	c1 e0 03             	shl    $0x3,%eax
    8240:	01 d0                	add    %edx,%eax
    8242:	01 c0                	add    %eax,%eax
    8244:	89 c2                	mov    %eax,%edx
    8246:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8249:	01 c2                	add    %eax,%edx
    824b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    824e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8254:	83 c0 20             	add    $0x20,%eax
    8257:	05 40 f1 00 00       	add    $0xf140,%eax
    825c:	8b 00                	mov    (%eax),%eax
    825e:	39 c2                	cmp    %eax,%edx
    8260:	7d 2a                	jge    828c <III_dequantize_sample+0x221>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    8262:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8266:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8269:	8d 48 01             	lea    0x1(%eax),%ecx
    826c:	8b 55 dc             	mov    -0x24(%ebp),%edx
    826f:	89 d0                	mov    %edx,%eax
    8271:	c1 e0 03             	shl    $0x3,%eax
    8274:	01 d0                	add    %edx,%eax
    8276:	c1 e0 02             	shl    $0x2,%eax
    8279:	01 d0                	add    %edx,%eax
    827b:	01 c8                	add    %ecx,%eax
    827d:	8b 04 85 40 f1 00 00 	mov    0xf140(,%eax,4),%eax
    8284:	89 45 e8             	mov    %eax,-0x18(%ebp)
    8287:	e9 3d 01 00 00       	jmp    83c9 <III_dequantize_sample+0x35e>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    828c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8290:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8293:	8d 48 01             	lea    0x1(%eax),%ecx
    8296:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8299:	89 d0                	mov    %edx,%eax
    829b:	c1 e0 03             	shl    $0x3,%eax
    829e:	01 d0                	add    %edx,%eax
    82a0:	c1 e0 02             	shl    $0x2,%eax
    82a3:	01 d0                	add    %edx,%eax
    82a5:	01 c8                	add    %ecx,%eax
    82a7:	83 c0 14             	add    $0x14,%eax
    82aa:	8b 14 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%edx
    82b1:	89 d0                	mov    %edx,%eax
    82b3:	01 c0                	add    %eax,%eax
    82b5:	01 d0                	add    %edx,%eax
    82b7:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    82ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
    82bd:	8d 48 01             	lea    0x1(%eax),%ecx
    82c0:	8b 55 dc             	mov    -0x24(%ebp),%edx
    82c3:	89 d0                	mov    %edx,%eax
    82c5:	c1 e0 03             	shl    $0x3,%eax
    82c8:	01 d0                	add    %edx,%eax
    82ca:	c1 e0 02             	shl    $0x2,%eax
    82cd:	01 d0                	add    %edx,%eax
    82cf:	01 c8                	add    %ecx,%eax
    82d1:	83 c0 14             	add    $0x14,%eax
    82d4:	8b 0c 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    82db:	8b 55 dc             	mov    -0x24(%ebp),%edx
    82de:	89 d0                	mov    %edx,%eax
    82e0:	c1 e0 03             	shl    $0x3,%eax
    82e3:	01 d0                	add    %edx,%eax
    82e5:	c1 e0 02             	shl    $0x2,%eax
    82e8:	01 d0                	add    %edx,%eax
    82ea:	8b 55 ec             	mov    -0x14(%ebp),%edx
    82ed:	01 d0                	add    %edx,%eax
    82ef:	83 c0 14             	add    $0x14,%eax
    82f2:	8b 04 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    82f9:	29 c1                	sub    %eax,%ecx
    82fb:	89 c8                	mov    %ecx,%eax
    82fd:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    8300:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8303:	89 d0                	mov    %edx,%eax
    8305:	c1 e0 03             	shl    $0x3,%eax
    8308:	01 d0                	add    %edx,%eax
    830a:	c1 e0 02             	shl    $0x2,%eax
    830d:	01 d0                	add    %edx,%eax
    830f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8312:	01 d0                	add    %edx,%eax
    8314:	83 c0 14             	add    $0x14,%eax
    8317:	8b 14 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%edx
    831e:	89 d0                	mov    %edx,%eax
    8320:	01 c0                	add    %eax,%eax
    8322:	01 d0                	add    %edx,%eax
    8324:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    8327:	e9 c4 00 00 00       	jmp    83f0 <III_dequantize_sample+0x385>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    832c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8330:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8333:	8d 48 01             	lea    0x1(%eax),%ecx
    8336:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8339:	89 d0                	mov    %edx,%eax
    833b:	c1 e0 03             	shl    $0x3,%eax
    833e:	01 d0                	add    %edx,%eax
    8340:	c1 e0 02             	shl    $0x2,%eax
    8343:	01 d0                	add    %edx,%eax
    8345:	01 c8                	add    %ecx,%eax
    8347:	83 c0 14             	add    $0x14,%eax
    834a:	8b 14 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%edx
    8351:	89 d0                	mov    %edx,%eax
    8353:	01 c0                	add    %eax,%eax
    8355:	01 d0                	add    %edx,%eax
    8357:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    835a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    835d:	8d 48 01             	lea    0x1(%eax),%ecx
    8360:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8363:	89 d0                	mov    %edx,%eax
    8365:	c1 e0 03             	shl    $0x3,%eax
    8368:	01 d0                	add    %edx,%eax
    836a:	c1 e0 02             	shl    $0x2,%eax
    836d:	01 d0                	add    %edx,%eax
    836f:	01 c8                	add    %ecx,%eax
    8371:	83 c0 14             	add    $0x14,%eax
    8374:	8b 0c 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    837b:	8b 55 dc             	mov    -0x24(%ebp),%edx
    837e:	89 d0                	mov    %edx,%eax
    8380:	c1 e0 03             	shl    $0x3,%eax
    8383:	01 d0                	add    %edx,%eax
    8385:	c1 e0 02             	shl    $0x2,%eax
    8388:	01 d0                	add    %edx,%eax
    838a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    838d:	01 d0                	add    %edx,%eax
    838f:	83 c0 14             	add    $0x14,%eax
    8392:	8b 04 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    8399:	29 c1                	sub    %eax,%ecx
    839b:	89 c8                	mov    %ecx,%eax
    839d:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    83a0:	8b 55 dc             	mov    -0x24(%ebp),%edx
    83a3:	89 d0                	mov    %edx,%eax
    83a5:	c1 e0 03             	shl    $0x3,%eax
    83a8:	01 d0                	add    %edx,%eax
    83aa:	c1 e0 02             	shl    $0x2,%eax
    83ad:	01 d0                	add    %edx,%eax
    83af:	8b 55 ec             	mov    -0x14(%ebp),%edx
    83b2:	01 d0                	add    %edx,%eax
    83b4:	83 c0 14             	add    $0x14,%eax
    83b7:	8b 14 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%edx
    83be:	89 d0                	mov    %edx,%eax
    83c0:	01 c0                	add    %eax,%eax
    83c2:	01 d0                	add    %edx,%eax
    83c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    83c7:	eb 27                	jmp    83f0 <III_dequantize_sample+0x385>
    83c9:	eb 25                	jmp    83f0 <III_dequantize_sample+0x385>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    83cb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    83cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    83d2:	8d 48 01             	lea    0x1(%eax),%ecx
    83d5:	8b 55 dc             	mov    -0x24(%ebp),%edx
    83d8:	89 d0                	mov    %edx,%eax
    83da:	c1 e0 03             	shl    $0x3,%eax
    83dd:	01 d0                	add    %edx,%eax
    83df:	c1 e0 02             	shl    $0x2,%eax
    83e2:	01 d0                	add    %edx,%eax
    83e4:	01 c8                	add    %ecx,%eax
    83e6:	8b 04 85 40 f1 00 00 	mov    0xf140(,%eax,4),%eax
    83ed:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    83f0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    83f3:	89 d0                	mov    %edx,%eax
    83f5:	c1 e0 03             	shl    $0x3,%eax
    83f8:	01 d0                	add    %edx,%eax
    83fa:	c1 e0 04             	shl    $0x4,%eax
    83fd:	89 c2                	mov    %eax,%edx
    83ff:	8b 45 0c             	mov    0xc(%ebp),%eax
    8402:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8405:	8b 45 14             	mov    0x14(%ebp),%eax
    8408:	8b 40 08             	mov    0x8(%eax),%eax
    840b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    840e:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    8415:	df 6d c8             	fildll -0x38(%ebp)
    8418:	dd 5d d0             	fstpl  -0x30(%ebp)
    841b:	dd 45 d0             	fldl   -0x30(%ebp)
    841e:	dd 05 10 d6 00 00    	fldl   0xd610
    8424:	de e9                	fsubrp %st,%st(1)
    8426:	dd 05 18 d6 00 00    	fldl   0xd618
    842c:	de c9                	fmulp  %st,%st(1)
    842e:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8432:	dd 1c 24             	fstpl  (%esp)
    8435:	dd 05 20 d6 00 00    	fldl   0xd620
    843b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    843f:	dd 1c 24             	fstpl  (%esp)
    8442:	e8 96 c1 ff ff       	call   45dd <pow>
    8447:	83 c4 10             	add    $0x10,%esp
    844a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    844d:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    8450:	8b 45 14             	mov    0x14(%ebp),%eax
    8453:	8b 40 10             	mov    0x10(%eax),%eax
    8456:	85 c0                	test   %eax,%eax
    8458:	0f 84 9c 01 00 00    	je     85fa <III_dequantize_sample+0x58f>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    845e:	8b 45 14             	mov    0x14(%ebp),%eax
    8461:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    8464:	83 f8 02             	cmp    $0x2,%eax
    8467:	75 0a                	jne    8473 <III_dequantize_sample+0x408>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    8469:	8b 45 14             	mov    0x14(%ebp),%eax
    846c:	8b 40 18             	mov    0x18(%eax),%eax
    846f:	85 c0                	test   %eax,%eax
    8471:	74 27                	je     849a <III_dequantize_sample+0x42f>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    8473:	8b 45 14             	mov    0x14(%ebp),%eax
    8476:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    8479:	83 f8 02             	cmp    $0x2,%eax
    847c:	0f 85 78 01 00 00    	jne    85fa <III_dequantize_sample+0x58f>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    8482:	8b 45 14             	mov    0x14(%ebp),%eax
    8485:	8b 40 18             	mov    0x18(%eax),%eax
    8488:	85 c0                	test   %eax,%eax
    848a:	0f 84 6a 01 00 00    	je     85fa <III_dequantize_sample+0x58f>
    8490:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    8494:	0f 8e 60 01 00 00    	jle    85fa <III_dequantize_sample+0x58f>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    849a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    849d:	89 d0                	mov    %edx,%eax
    849f:	c1 e0 03             	shl    $0x3,%eax
    84a2:	01 d0                	add    %edx,%eax
    84a4:	01 c0                	add    %eax,%eax
    84a6:	89 c2                	mov    %eax,%edx
    84a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    84ab:	01 d0                	add    %edx,%eax
    84ad:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    84b0:	99                   	cltd   
    84b1:	f7 7d e0             	idivl  -0x20(%ebp)
    84b4:	89 c2                	mov    %eax,%edx
    84b6:	8b 45 14             	mov    0x14(%ebp),%eax
    84b9:	83 c2 08             	add    $0x8,%edx
    84bc:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    84c0:	89 45 c8             	mov    %eax,-0x38(%ebp)
    84c3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    84ca:	df 6d c8             	fildll -0x38(%ebp)
    84cd:	dd 5d d0             	fstpl  -0x30(%ebp)
    84d0:	dd 45 d0             	fldl   -0x30(%ebp)
    84d3:	dd 05 28 d6 00 00    	fldl   0xd628
    84d9:	de c9                	fmulp  %st,%st(1)
    84db:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    84df:	dd 1c 24             	fstpl  (%esp)
    84e2:	dd 05 20 d6 00 00    	fldl   0xd620
    84e8:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    84ec:	dd 1c 24             	fstpl  (%esp)
    84ef:	e8 e9 c0 ff ff       	call   45dd <pow>
    84f4:	83 c4 10             	add    $0x10,%esp
    84f7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    84fa:	89 d0                	mov    %edx,%eax
    84fc:	c1 e0 03             	shl    $0x3,%eax
    84ff:	01 d0                	add    %edx,%eax
    8501:	c1 e0 04             	shl    $0x4,%eax
    8504:	89 c2                	mov    %eax,%edx
    8506:	8b 45 0c             	mov    0xc(%ebp),%eax
    8509:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    850c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    850f:	89 d0                	mov    %edx,%eax
    8511:	c1 e0 03             	shl    $0x3,%eax
    8514:	01 d0                	add    %edx,%eax
    8516:	c1 e0 04             	shl    $0x4,%eax
    8519:	89 c2                	mov    %eax,%edx
    851b:	8b 45 0c             	mov    0xc(%ebp),%eax
    851e:	01 c2                	add    %eax,%edx
    8520:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8523:	dd 04 c2             	fldl   (%edx,%eax,8)
    8526:	de c9                	fmulp  %st,%st(1)
    8528:	8b 45 f4             	mov    -0xc(%ebp),%eax
    852b:	dd 1c c1             	fstpl  (%ecx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    852e:	8b 45 14             	mov    0x14(%ebp),%eax
    8531:	8b 40 40             	mov    0x40(%eax),%eax
    8534:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8537:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    853e:	df 6d c8             	fildll -0x38(%ebp)
    8541:	dd 5d d0             	fstpl  -0x30(%ebp)
    8544:	dd 45 d0             	fldl   -0x30(%ebp)
    8547:	d9 e8                	fld1   
    8549:	de c1                	faddp  %st,%st(1)
    854b:	dd 05 30 d6 00 00    	fldl   0xd630
    8551:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    8553:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8556:	89 d0                	mov    %edx,%eax
    8558:	c1 e0 03             	shl    $0x3,%eax
    855b:	01 d0                	add    %edx,%eax
    855d:	01 c0                	add    %eax,%eax
    855f:	89 c2                	mov    %eax,%edx
    8561:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8564:	01 d0                	add    %edx,%eax
    8566:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    8569:	99                   	cltd   
    856a:	f7 7d e0             	idivl  -0x20(%ebp)
    856d:	89 c2                	mov    %eax,%edx
    856f:	8b 5d 10             	mov    0x10(%ebp),%ebx
    8572:	8b 4d 18             	mov    0x18(%ebp),%ecx
    8575:	89 d0                	mov    %edx,%eax
    8577:	01 c0                	add    %eax,%eax
    8579:	01 d0                	add    %edx,%eax
    857b:	c1 e0 02             	shl    $0x2,%eax
    857e:	01 d0                	add    %edx,%eax
    8580:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    8583:	89 d1                	mov    %edx,%ecx
    8585:	89 ca                	mov    %ecx,%edx
    8587:	c1 e2 05             	shl    $0x5,%edx
    858a:	29 ca                	sub    %ecx,%edx
    858c:	01 c2                	add    %eax,%edx
    858e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8591:	01 d0                	add    %edx,%eax
    8593:	83 c0 14             	add    $0x14,%eax
    8596:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    859a:	89 45 c8             	mov    %eax,-0x38(%ebp)
    859d:	db 45 c8             	fildl  -0x38(%ebp)
    85a0:	de c9                	fmulp  %st,%st(1)
    85a2:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    85a6:	dd 1c 24             	fstpl  (%esp)
    85a9:	dd 05 20 d6 00 00    	fldl   0xd620
    85af:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    85b3:	dd 1c 24             	fstpl  (%esp)
    85b6:	e8 22 c0 ff ff       	call   45dd <pow>
    85bb:	83 c4 10             	add    $0x10,%esp
    85be:	8b 55 f0             	mov    -0x10(%ebp),%edx
    85c1:	89 d0                	mov    %edx,%eax
    85c3:	c1 e0 03             	shl    $0x3,%eax
    85c6:	01 d0                	add    %edx,%eax
    85c8:	c1 e0 04             	shl    $0x4,%eax
    85cb:	89 c2                	mov    %eax,%edx
    85cd:	8b 45 0c             	mov    0xc(%ebp),%eax
    85d0:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    85d3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    85d6:	89 d0                	mov    %edx,%eax
    85d8:	c1 e0 03             	shl    $0x3,%eax
    85db:	01 d0                	add    %edx,%eax
    85dd:	c1 e0 04             	shl    $0x4,%eax
    85e0:	89 c2                	mov    %eax,%edx
    85e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    85e5:	01 c2                	add    %eax,%edx
    85e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    85ea:	dd 04 c2             	fldl   (%edx,%eax,8)
    85ed:	de c9                	fmulp  %st,%st(1)
    85ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    85f2:	dd 1c c1             	fstpl  (%ecx,%eax,8)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    85f5:	e9 c0 00 00 00       	jmp    86ba <III_dequantize_sample+0x64f>
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    85fa:	8b 45 14             	mov    0x14(%ebp),%eax
    85fd:	8b 40 40             	mov    0x40(%eax),%eax
    8600:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8603:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    860a:	df 6d c8             	fildll -0x38(%ebp)
    860d:	dd 5d d0             	fstpl  -0x30(%ebp)
    8610:	dd 45 d0             	fldl   -0x30(%ebp)
    8613:	d9 e8                	fld1   
    8615:	de c1                	faddp  %st,%st(1)
    8617:	dd 05 30 d6 00 00    	fldl   0xd630
    861d:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    861f:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8622:	8b 45 18             	mov    0x18(%ebp),%eax
    8625:	89 c2                	mov    %eax,%edx
    8627:	8d 04 12             	lea    (%edx,%edx,1),%eax
    862a:	89 c2                	mov    %eax,%edx
    862c:	89 d0                	mov    %edx,%eax
    862e:	c1 e0 05             	shl    $0x5,%eax
    8631:	29 d0                	sub    %edx,%eax
    8633:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8636:	01 d0                	add    %edx,%eax
    8638:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    863b:	89 c1                	mov    %eax,%ecx
    863d:	8b 45 14             	mov    0x14(%ebp),%eax
    8640:	8b 50 3c             	mov    0x3c(%eax),%edx
    8643:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8646:	8b 04 85 00 f3 00 00 	mov    0xf300(,%eax,4),%eax
    864d:	0f af c2             	imul   %edx,%eax
    8650:	01 c8                	add    %ecx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    8652:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8655:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    865c:	df 6d c8             	fildll -0x38(%ebp)
    865f:	dd 5d d0             	fstpl  -0x30(%ebp)
    8662:	dd 45 d0             	fldl   -0x30(%ebp)
    8665:	de c9                	fmulp  %st,%st(1)
    8667:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    866b:	dd 1c 24             	fstpl  (%esp)
    866e:	dd 05 20 d6 00 00    	fldl   0xd620
    8674:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8678:	dd 1c 24             	fstpl  (%esp)
    867b:	e8 5d bf ff ff       	call   45dd <pow>
    8680:	83 c4 10             	add    $0x10,%esp
    8683:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8686:	89 d0                	mov    %edx,%eax
    8688:	c1 e0 03             	shl    $0x3,%eax
    868b:	01 d0                	add    %edx,%eax
    868d:	c1 e0 04             	shl    $0x4,%eax
    8690:	89 c2                	mov    %eax,%edx
    8692:	8b 45 0c             	mov    0xc(%ebp),%eax
    8695:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8698:	8b 55 f0             	mov    -0x10(%ebp),%edx
    869b:	89 d0                	mov    %edx,%eax
    869d:	c1 e0 03             	shl    $0x3,%eax
    86a0:	01 d0                	add    %edx,%eax
    86a2:	c1 e0 04             	shl    $0x4,%eax
    86a5:	89 c2                	mov    %eax,%edx
    86a7:	8b 45 0c             	mov    0xc(%ebp),%eax
    86aa:	01 c2                	add    %eax,%edx
    86ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    86af:	dd 04 c2             	fldl   (%edx,%eax,8)
    86b2:	de c9                	fmulp  %st,%st(1)
    86b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    86b7:	dd 1c c1             	fstpl  (%ecx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    86ba:	8b 55 f0             	mov    -0x10(%ebp),%edx
    86bd:	89 d0                	mov    %edx,%eax
    86bf:	c1 e0 03             	shl    $0x3,%eax
    86c2:	01 d0                	add    %edx,%eax
    86c4:	c1 e0 03             	shl    $0x3,%eax
    86c7:	89 c2                	mov    %eax,%edx
    86c9:	8b 45 08             	mov    0x8(%ebp),%eax
    86cc:	01 c2                	add    %eax,%edx
    86ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    86d1:	8b 04 82             	mov    (%edx,%eax,4),%eax
    86d4:	c1 e8 1f             	shr    $0x1f,%eax
    86d7:	0f b6 c0             	movzbl %al,%eax
    86da:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    86dd:	8b 55 f0             	mov    -0x10(%ebp),%edx
    86e0:	89 d0                	mov    %edx,%eax
    86e2:	c1 e0 03             	shl    $0x3,%eax
    86e5:	01 d0                	add    %edx,%eax
    86e7:	c1 e0 03             	shl    $0x3,%eax
    86ea:	89 c2                	mov    %eax,%edx
    86ec:	8b 45 08             	mov    0x8(%ebp),%eax
    86ef:	01 c2                	add    %eax,%edx
    86f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    86f4:	8b 04 82             	mov    (%edx,%eax,4),%eax
    86f7:	83 ec 0c             	sub    $0xc,%esp
    86fa:	50                   	push   %eax
    86fb:	e8 c7 bd ff ff       	call   44c7 <abs>
    8700:	83 c4 10             	add    $0x10,%esp
    8703:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8706:	db 45 c8             	fildl  -0x38(%ebp)
    8709:	dd 05 38 d6 00 00    	fldl   0xd638
    870f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8713:	dd 1c 24             	fstpl  (%esp)
    8716:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    871a:	dd 1c 24             	fstpl  (%esp)
    871d:	e8 bb be ff ff       	call   45dd <pow>
    8722:	83 c4 10             	add    $0x10,%esp
    8725:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8728:	89 d0                	mov    %edx,%eax
    872a:	c1 e0 03             	shl    $0x3,%eax
    872d:	01 d0                	add    %edx,%eax
    872f:	c1 e0 04             	shl    $0x4,%eax
    8732:	89 c2                	mov    %eax,%edx
    8734:	8b 45 0c             	mov    0xc(%ebp),%eax
    8737:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    873a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    873d:	89 d0                	mov    %edx,%eax
    873f:	c1 e0 03             	shl    $0x3,%eax
    8742:	01 d0                	add    %edx,%eax
    8744:	c1 e0 04             	shl    $0x4,%eax
    8747:	89 c2                	mov    %eax,%edx
    8749:	8b 45 0c             	mov    0xc(%ebp),%eax
    874c:	01 c2                	add    %eax,%edx
    874e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8751:	dd 04 c2             	fldl   (%edx,%eax,8)
    8754:	de c9                	fmulp  %st,%st(1)
    8756:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8759:	dd 1c c1             	fstpl  (%ecx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    875c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    8760:	74 37                	je     8799 <III_dequantize_sample+0x72e>
    8762:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8765:	89 d0                	mov    %edx,%eax
    8767:	c1 e0 03             	shl    $0x3,%eax
    876a:	01 d0                	add    %edx,%eax
    876c:	c1 e0 04             	shl    $0x4,%eax
    876f:	89 c2                	mov    %eax,%edx
    8771:	8b 45 0c             	mov    0xc(%ebp),%eax
    8774:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8777:	8b 55 f0             	mov    -0x10(%ebp),%edx
    877a:	89 d0                	mov    %edx,%eax
    877c:	c1 e0 03             	shl    $0x3,%eax
    877f:	01 d0                	add    %edx,%eax
    8781:	c1 e0 04             	shl    $0x4,%eax
    8784:	89 c2                	mov    %eax,%edx
    8786:	8b 45 0c             	mov    0xc(%ebp),%eax
    8789:	01 c2                	add    %eax,%edx
    878b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    878e:	dd 04 c2             	fldl   (%edx,%eax,8)
    8791:	d9 e0                	fchs   
    8793:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8796:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    8799:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    879d:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    87a1:	0f 8e 86 f9 ff ff    	jle    812d <III_dequantize_sample+0xc2>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    87a7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    87ab:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    87af:	0f 8e 6c f9 ff ff    	jle    8121 <III_dequantize_sample+0xb6>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    87b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    87b8:	c9                   	leave  
    87b9:	c3                   	ret    

000087ba <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    87ba:	55                   	push   %ebp
    87bb:	89 e5                	mov    %esp,%ebp
    87bd:	57                   	push   %edi
    87be:	56                   	push   %esi
    87bf:	53                   	push   %ebx
    87c0:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    87c3:	8b 45 14             	mov    0x14(%ebp),%eax
    87c6:	8b 00                	mov    (%eax),%eax
    87c8:	8b 40 10             	mov    0x10(%eax),%eax
    87cb:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    87ce:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    87d5:	eb 33                	jmp    880a <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    87d7:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    87de:	eb 20                	jmp    8800 <III_reorder+0x46>
         ro[sb][ss] = 0;
    87e0:	8b 55 e0             	mov    -0x20(%ebp),%edx
    87e3:	89 d0                	mov    %edx,%eax
    87e5:	c1 e0 03             	shl    $0x3,%eax
    87e8:	01 d0                	add    %edx,%eax
    87ea:	c1 e0 04             	shl    $0x4,%eax
    87ed:	89 c2                	mov    %eax,%edx
    87ef:	8b 45 0c             	mov    0xc(%ebp),%eax
    87f2:	01 c2                	add    %eax,%edx
    87f4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    87f7:	d9 ee                	fldz   
    87f9:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    87fc:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8800:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    8804:	7e da                	jle    87e0 <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    8806:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    880a:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    880e:	7e c7                	jle    87d7 <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    8810:	8b 45 10             	mov    0x10(%ebp),%eax
    8813:	8b 40 10             	mov    0x10(%eax),%eax
    8816:	85 c0                	test   %eax,%eax
    8818:	0f 84 b8 03 00 00    	je     8bd6 <III_reorder+0x41c>
    881e:	8b 45 10             	mov    0x10(%ebp),%eax
    8821:	8b 40 14             	mov    0x14(%eax),%eax
    8824:	83 f8 02             	cmp    $0x2,%eax
    8827:	0f 85 a9 03 00 00    	jne    8bd6 <III_reorder+0x41c>
      if (gr_info->mixed_block_flag) {
    882d:	8b 45 10             	mov    0x10(%ebp),%eax
    8830:	8b 40 18             	mov    0x18(%eax),%eax
    8833:	85 c0                	test   %eax,%eax
    8835:	0f 84 06 02 00 00    	je     8a41 <III_reorder+0x287>
         for (sb=0 ; sb < 2 ; sb++)
    883b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    8842:	eb 4c                	jmp    8890 <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    8844:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    884b:	eb 39                	jmp    8886 <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    884d:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8850:	89 d0                	mov    %edx,%eax
    8852:	c1 e0 03             	shl    $0x3,%eax
    8855:	01 d0                	add    %edx,%eax
    8857:	c1 e0 04             	shl    $0x4,%eax
    885a:	89 c2                	mov    %eax,%edx
    885c:	8b 45 0c             	mov    0xc(%ebp),%eax
    885f:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8862:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8865:	89 d0                	mov    %edx,%eax
    8867:	c1 e0 03             	shl    $0x3,%eax
    886a:	01 d0                	add    %edx,%eax
    886c:	c1 e0 04             	shl    $0x4,%eax
    886f:	89 c2                	mov    %eax,%edx
    8871:	8b 45 08             	mov    0x8(%ebp),%eax
    8874:	01 c2                	add    %eax,%edx
    8876:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8879:	dd 04 c2             	fldl   (%edx,%eax,8)
    887c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    887f:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    8882:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8886:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    888a:	7e c1                	jle    884d <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    888c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8890:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    8894:	7e ae                	jle    8844 <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    8896:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    889d:	8b 45 d0             	mov    -0x30(%ebp),%eax
    88a0:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    88a6:	83 c0 5c             	add    $0x5c,%eax
    88a9:	05 40 f1 00 00       	add    $0xf140,%eax
    88ae:	8b 40 0c             	mov    0xc(%eax),%eax
    88b1:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    88b4:	8b 45 d0             	mov    -0x30(%ebp),%eax
    88b7:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    88bd:	83 c0 60             	add    $0x60,%eax
    88c0:	05 40 f1 00 00       	add    $0xf140,%eax
    88c5:	8b 40 0c             	mov    0xc(%eax),%eax
    88c8:	2b 45 e8             	sub    -0x18(%ebp),%eax
    88cb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    88ce:	e9 5f 01 00 00       	jmp    8a32 <III_reorder+0x278>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    88d3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    88da:	e9 fd 00 00 00       	jmp    89dc <III_reorder+0x222>
                  for(freq=0;freq<sfb_lines;freq++) {
    88df:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    88e6:	e9 e1 00 00 00       	jmp    89cc <III_reorder+0x212>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    88eb:	8b 55 e8             	mov    -0x18(%ebp),%edx
    88ee:	89 d0                	mov    %edx,%eax
    88f0:	01 c0                	add    %eax,%eax
    88f2:	01 c2                	add    %eax,%edx
    88f4:	8b 45 d8             	mov    -0x28(%ebp),%eax
    88f7:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    88fb:	01 c2                	add    %eax,%edx
    88fd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8900:	01 d0                	add    %edx,%eax
    8902:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    8905:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8908:	89 d0                	mov    %edx,%eax
    890a:	01 c0                	add    %eax,%eax
    890c:	01 c2                	add    %eax,%edx
    890e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8911:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8914:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    8917:	89 d0                	mov    %edx,%eax
    8919:	01 c0                	add    %eax,%eax
    891b:	01 d0                	add    %edx,%eax
    891d:	01 c8                	add    %ecx,%eax
    891f:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8922:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    8925:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    892a:	89 c8                	mov    %ecx,%eax
    892c:	f7 ea                	imul   %edx
    892e:	c1 fa 02             	sar    $0x2,%edx
    8931:	89 c8                	mov    %ecx,%eax
    8933:	c1 f8 1f             	sar    $0x1f,%eax
    8936:	29 c2                	sub    %eax,%edx
    8938:	89 d0                	mov    %edx,%eax
    893a:	89 c2                	mov    %eax,%edx
    893c:	89 d0                	mov    %edx,%eax
    893e:	c1 e0 03             	shl    $0x3,%eax
    8941:	01 d0                	add    %edx,%eax
    8943:	c1 e0 04             	shl    $0x4,%eax
    8946:	89 c2                	mov    %eax,%edx
    8948:	8b 45 0c             	mov    0xc(%ebp),%eax
    894b:	8d 34 02             	lea    (%edx,%eax,1),%esi
    894e:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    8951:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8956:	89 d8                	mov    %ebx,%eax
    8958:	f7 ea                	imul   %edx
    895a:	c1 fa 02             	sar    $0x2,%edx
    895d:	89 d8                	mov    %ebx,%eax
    895f:	c1 f8 1f             	sar    $0x1f,%eax
    8962:	89 d1                	mov    %edx,%ecx
    8964:	29 c1                	sub    %eax,%ecx
    8966:	89 c8                	mov    %ecx,%eax
    8968:	c1 e0 03             	shl    $0x3,%eax
    896b:	01 c8                	add    %ecx,%eax
    896d:	01 c0                	add    %eax,%eax
    896f:	29 c3                	sub    %eax,%ebx
    8971:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    8973:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8976:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    897b:	89 d8                	mov    %ebx,%eax
    897d:	f7 ea                	imul   %edx
    897f:	c1 fa 02             	sar    $0x2,%edx
    8982:	89 d8                	mov    %ebx,%eax
    8984:	c1 f8 1f             	sar    $0x1f,%eax
    8987:	29 c2                	sub    %eax,%edx
    8989:	89 d0                	mov    %edx,%eax
    898b:	89 c2                	mov    %eax,%edx
    898d:	89 d0                	mov    %edx,%eax
    898f:	c1 e0 03             	shl    $0x3,%eax
    8992:	01 d0                	add    %edx,%eax
    8994:	c1 e0 04             	shl    $0x4,%eax
    8997:	89 c2                	mov    %eax,%edx
    8999:	8b 45 08             	mov    0x8(%ebp),%eax
    899c:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    899f:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    89a2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    89a7:	89 d8                	mov    %ebx,%eax
    89a9:	f7 ea                	imul   %edx
    89ab:	c1 fa 02             	sar    $0x2,%edx
    89ae:	89 d8                	mov    %ebx,%eax
    89b0:	c1 f8 1f             	sar    $0x1f,%eax
    89b3:	29 c2                	sub    %eax,%edx
    89b5:	89 d0                	mov    %edx,%eax
    89b7:	c1 e0 03             	shl    $0x3,%eax
    89ba:	01 d0                	add    %edx,%eax
    89bc:	01 c0                	add    %eax,%eax
    89be:	29 c3                	sub    %eax,%ebx
    89c0:	89 da                	mov    %ebx,%edx
    89c2:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    89c5:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    89c8:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    89cc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    89cf:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    89d2:	0f 8c 13 ff ff ff    	jl     88eb <III_reorder+0x131>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    89d8:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    89dc:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    89e0:	0f 8e f9 fe ff ff    	jle    88df <III_reorder+0x125>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    89e6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    89ea:	8b 55 d0             	mov    -0x30(%ebp),%edx
    89ed:	89 d0                	mov    %edx,%eax
    89ef:	c1 e0 03             	shl    $0x3,%eax
    89f2:	01 d0                	add    %edx,%eax
    89f4:	c1 e0 02             	shl    $0x2,%eax
    89f7:	01 d0                	add    %edx,%eax
    89f9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    89fc:	01 d0                	add    %edx,%eax
    89fe:	83 c0 14             	add    $0x14,%eax
    8a01:	8b 04 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%eax
    8a08:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    8a0b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8a0e:	8d 48 01             	lea    0x1(%eax),%ecx
    8a11:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8a14:	89 d0                	mov    %edx,%eax
    8a16:	c1 e0 03             	shl    $0x3,%eax
    8a19:	01 d0                	add    %edx,%eax
    8a1b:	c1 e0 02             	shl    $0x2,%eax
    8a1e:	01 d0                	add    %edx,%eax
    8a20:	01 c8                	add    %ecx,%eax
    8a22:	83 c0 14             	add    $0x14,%eax
    8a25:	8b 04 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%eax
    8a2c:	2b 45 e8             	sub    -0x18(%ebp),%eax
    8a2f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    8a32:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    8a36:	0f 8e 97 fe ff ff    	jle    88d3 <III_reorder+0x119>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    8a3c:	e9 f0 01 00 00       	jmp    8c31 <III_reorder+0x477>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    8a41:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8a48:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    8a4f:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8a52:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8a58:	83 c0 54             	add    $0x54,%eax
    8a5b:	05 40 f1 00 00       	add    $0xf140,%eax
    8a60:	8b 40 0c             	mov    0xc(%eax),%eax
    8a63:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    8a66:	e9 5f 01 00 00       	jmp    8bca <III_reorder+0x410>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8a6b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    8a72:	e9 fd 00 00 00       	jmp    8b74 <III_reorder+0x3ba>
                  for(freq=0;freq<sfb_lines;freq++) {
    8a77:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    8a7e:	e9 e1 00 00 00       	jmp    8b64 <III_reorder+0x3aa>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    8a83:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8a86:	89 d0                	mov    %edx,%eax
    8a88:	01 c0                	add    %eax,%eax
    8a8a:	01 c2                	add    %eax,%edx
    8a8c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8a8f:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    8a93:	01 c2                	add    %eax,%edx
    8a95:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8a98:	01 d0                	add    %edx,%eax
    8a9a:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    8a9d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8aa0:	89 d0                	mov    %edx,%eax
    8aa2:	01 c0                	add    %eax,%eax
    8aa4:	01 c2                	add    %eax,%edx
    8aa6:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8aa9:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8aac:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    8aaf:	89 d0                	mov    %edx,%eax
    8ab1:	01 c0                	add    %eax,%eax
    8ab3:	01 d0                	add    %edx,%eax
    8ab5:	01 c8                	add    %ecx,%eax
    8ab7:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8aba:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    8abd:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8ac2:	89 c8                	mov    %ecx,%eax
    8ac4:	f7 ea                	imul   %edx
    8ac6:	c1 fa 02             	sar    $0x2,%edx
    8ac9:	89 c8                	mov    %ecx,%eax
    8acb:	c1 f8 1f             	sar    $0x1f,%eax
    8ace:	29 c2                	sub    %eax,%edx
    8ad0:	89 d0                	mov    %edx,%eax
    8ad2:	89 c2                	mov    %eax,%edx
    8ad4:	89 d0                	mov    %edx,%eax
    8ad6:	c1 e0 03             	shl    $0x3,%eax
    8ad9:	01 d0                	add    %edx,%eax
    8adb:	c1 e0 04             	shl    $0x4,%eax
    8ade:	89 c2                	mov    %eax,%edx
    8ae0:	8b 45 0c             	mov    0xc(%ebp),%eax
    8ae3:	8d 34 02             	lea    (%edx,%eax,1),%esi
    8ae6:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    8ae9:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8aee:	89 d8                	mov    %ebx,%eax
    8af0:	f7 ea                	imul   %edx
    8af2:	c1 fa 02             	sar    $0x2,%edx
    8af5:	89 d8                	mov    %ebx,%eax
    8af7:	c1 f8 1f             	sar    $0x1f,%eax
    8afa:	89 d1                	mov    %edx,%ecx
    8afc:	29 c1                	sub    %eax,%ecx
    8afe:	89 c8                	mov    %ecx,%eax
    8b00:	c1 e0 03             	shl    $0x3,%eax
    8b03:	01 c8                	add    %ecx,%eax
    8b05:	01 c0                	add    %eax,%eax
    8b07:	29 c3                	sub    %eax,%ebx
    8b09:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    8b0b:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8b0e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8b13:	89 d8                	mov    %ebx,%eax
    8b15:	f7 ea                	imul   %edx
    8b17:	c1 fa 02             	sar    $0x2,%edx
    8b1a:	89 d8                	mov    %ebx,%eax
    8b1c:	c1 f8 1f             	sar    $0x1f,%eax
    8b1f:	29 c2                	sub    %eax,%edx
    8b21:	89 d0                	mov    %edx,%eax
    8b23:	89 c2                	mov    %eax,%edx
    8b25:	89 d0                	mov    %edx,%eax
    8b27:	c1 e0 03             	shl    $0x3,%eax
    8b2a:	01 d0                	add    %edx,%eax
    8b2c:	c1 e0 04             	shl    $0x4,%eax
    8b2f:	89 c2                	mov    %eax,%edx
    8b31:	8b 45 08             	mov    0x8(%ebp),%eax
    8b34:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    8b37:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8b3a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8b3f:	89 d8                	mov    %ebx,%eax
    8b41:	f7 ea                	imul   %edx
    8b43:	c1 fa 02             	sar    $0x2,%edx
    8b46:	89 d8                	mov    %ebx,%eax
    8b48:	c1 f8 1f             	sar    $0x1f,%eax
    8b4b:	29 c2                	sub    %eax,%edx
    8b4d:	89 d0                	mov    %edx,%eax
    8b4f:	c1 e0 03             	shl    $0x3,%eax
    8b52:	01 d0                	add    %edx,%eax
    8b54:	01 c0                	add    %eax,%eax
    8b56:	29 c3                	sub    %eax,%ebx
    8b58:	89 da                	mov    %ebx,%edx
    8b5a:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8b5d:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    8b60:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    8b64:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8b67:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    8b6a:	0f 8c 13 ff ff ff    	jl     8a83 <III_reorder+0x2c9>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8b70:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    8b74:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    8b78:	0f 8e f9 fe ff ff    	jle    8a77 <III_reorder+0x2bd>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    8b7e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8b82:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8b85:	89 d0                	mov    %edx,%eax
    8b87:	c1 e0 03             	shl    $0x3,%eax
    8b8a:	01 d0                	add    %edx,%eax
    8b8c:	c1 e0 02             	shl    $0x2,%eax
    8b8f:	01 d0                	add    %edx,%eax
    8b91:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8b94:	01 d0                	add    %edx,%eax
    8b96:	83 c0 14             	add    $0x14,%eax
    8b99:	8b 04 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%eax
    8ba0:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    8ba3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8ba6:	8d 48 01             	lea    0x1(%eax),%ecx
    8ba9:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8bac:	89 d0                	mov    %edx,%eax
    8bae:	c1 e0 03             	shl    $0x3,%eax
    8bb1:	01 d0                	add    %edx,%eax
    8bb3:	c1 e0 02             	shl    $0x2,%eax
    8bb6:	01 d0                	add    %edx,%eax
    8bb8:	01 c8                	add    %ecx,%eax
    8bba:	83 c0 14             	add    $0x14,%eax
    8bbd:	8b 04 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%eax
    8bc4:	2b 45 e8             	sub    -0x18(%ebp),%eax
    8bc7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    8bca:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    8bce:	0f 8e 97 fe ff ff    	jle    8a6b <III_reorder+0x2b1>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    8bd4:	eb 5b                	jmp    8c31 <III_reorder+0x477>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    8bd6:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    8bdd:	eb 4c                	jmp    8c2b <III_reorder+0x471>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    8bdf:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    8be6:	eb 39                	jmp    8c21 <III_reorder+0x467>
            ro[sb][ss] = xr[sb][ss];
    8be8:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8beb:	89 d0                	mov    %edx,%eax
    8bed:	c1 e0 03             	shl    $0x3,%eax
    8bf0:	01 d0                	add    %edx,%eax
    8bf2:	c1 e0 04             	shl    $0x4,%eax
    8bf5:	89 c2                	mov    %eax,%edx
    8bf7:	8b 45 0c             	mov    0xc(%ebp),%eax
    8bfa:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8bfd:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8c00:	89 d0                	mov    %edx,%eax
    8c02:	c1 e0 03             	shl    $0x3,%eax
    8c05:	01 d0                	add    %edx,%eax
    8c07:	c1 e0 04             	shl    $0x4,%eax
    8c0a:	89 c2                	mov    %eax,%edx
    8c0c:	8b 45 08             	mov    0x8(%ebp),%eax
    8c0f:	01 c2                	add    %eax,%edx
    8c11:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8c14:	dd 04 c2             	fldl   (%edx,%eax,8)
    8c17:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8c1a:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    8c1d:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8c21:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    8c25:	7e c1                	jle    8be8 <III_reorder+0x42e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    8c27:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8c2b:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    8c2f:	7e ae                	jle    8bdf <III_reorder+0x425>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    8c31:	83 c4 34             	add    $0x34,%esp
    8c34:	5b                   	pop    %ebx
    8c35:	5e                   	pop    %esi
    8c36:	5f                   	pop    %edi
    8c37:	5d                   	pop    %ebp
    8c38:	c3                   	ret    

00008c39 <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    8c39:	55                   	push   %ebp
    8c3a:	89 e5                	mov    %esp,%ebp
    8c3c:	56                   	push   %esi
    8c3d:	53                   	push   %ebx
    8c3e:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    8c44:	8b 45 18             	mov    0x18(%ebp),%eax
    8c47:	8b 00                	mov    (%eax),%eax
    8c49:	8b 40 10             	mov    0x10(%eax),%eax
    8c4c:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    8c4f:	8b 45 18             	mov    0x18(%ebp),%eax
    8c52:	8b 40 08             	mov    0x8(%eax),%eax
    8c55:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8c58:	8b 45 18             	mov    0x18(%ebp),%eax
    8c5b:	8b 00                	mov    (%eax),%eax
    8c5d:	8b 40 1c             	mov    0x1c(%eax),%eax
    8c60:	83 f8 01             	cmp    $0x1,%eax
    8c63:	75 16                	jne    8c7b <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    8c65:	8b 45 18             	mov    0x18(%ebp),%eax
    8c68:	8b 00                	mov    (%eax),%eax
    8c6a:	8b 40 20             	mov    0x20(%eax),%eax
    8c6d:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8c70:	85 c0                	test   %eax,%eax
    8c72:	74 07                	je     8c7b <III_stereo+0x42>
    8c74:	b8 01 00 00 00       	mov    $0x1,%eax
    8c79:	eb 05                	jmp    8c80 <III_stereo+0x47>
    8c7b:	b8 00 00 00 00       	mov    $0x0,%eax
    8c80:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8c83:	8b 45 18             	mov    0x18(%ebp),%eax
    8c86:	8b 00                	mov    (%eax),%eax
    8c88:	8b 40 1c             	mov    0x1c(%eax),%eax
    8c8b:	83 f8 01             	cmp    $0x1,%eax
    8c8e:	75 16                	jne    8ca6 <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    8c90:	8b 45 18             	mov    0x18(%ebp),%eax
    8c93:	8b 00                	mov    (%eax),%eax
    8c95:	8b 40 20             	mov    0x20(%eax),%eax
    8c98:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8c9b:	85 c0                	test   %eax,%eax
    8c9d:	74 07                	je     8ca6 <III_stereo+0x6d>
    8c9f:	b8 01 00 00 00       	mov    $0x1,%eax
    8ca4:	eb 05                	jmp    8cab <III_stereo+0x72>
    8ca6:	b8 00 00 00 00       	mov    $0x0,%eax
    8cab:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    8cae:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8cb5:	eb 12                	jmp    8cc9 <III_stereo+0x90>
      is_pos[i] = 7;
    8cb7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8cba:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    8cc1:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    8cc5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8cc9:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    8cd0:	7e e5                	jle    8cb7 <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    8cd2:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    8cd6:	0f 85 65 0a 00 00    	jne    9741 <III_stereo+0xb08>
    8cdc:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    8ce0:	0f 84 5b 0a 00 00    	je     9741 <III_stereo+0xb08>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    8ce6:	8b 45 14             	mov    0x14(%ebp),%eax
    8ce9:	8b 40 10             	mov    0x10(%eax),%eax
    8cec:	85 c0                	test   %eax,%eax
    8cee:	0f 84 4d 08 00 00    	je     9541 <III_stereo+0x908>
    8cf4:	8b 45 14             	mov    0x14(%ebp),%eax
    8cf7:	8b 40 14             	mov    0x14(%eax),%eax
    8cfa:	83 f8 02             	cmp    $0x2,%eax
    8cfd:	0f 85 3e 08 00 00    	jne    9541 <III_stereo+0x908>
      {  if( gr_info->mixed_block_flag )
    8d03:	8b 45 14             	mov    0x14(%ebp),%eax
    8d06:	8b 40 18             	mov    0x18(%eax),%eax
    8d09:	85 c0                	test   %eax,%eax
    8d0b:	0f 84 f1 04 00 00    	je     9202 <III_stereo+0x5c9>
         {  int max_sfb = 0;
    8d11:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    8d18:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8d1f:	e9 32 03 00 00       	jmp    9056 <III_stereo+0x41d>
            {  int sfbcnt;
               sfbcnt = 2;
    8d24:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    8d2b:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    8d32:	e9 0f 01 00 00       	jmp    8e46 <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    8d37:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8d3a:	8d 48 01             	lea    0x1(%eax),%ecx
    8d3d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8d40:	89 d0                	mov    %edx,%eax
    8d42:	c1 e0 03             	shl    $0x3,%eax
    8d45:	01 d0                	add    %edx,%eax
    8d47:	c1 e0 02             	shl    $0x2,%eax
    8d4a:	01 d0                	add    %edx,%eax
    8d4c:	01 c8                	add    %ecx,%eax
    8d4e:	83 c0 14             	add    $0x14,%eax
    8d51:	8b 0c 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%ecx
    8d58:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8d5b:	89 d0                	mov    %edx,%eax
    8d5d:	c1 e0 03             	shl    $0x3,%eax
    8d60:	01 d0                	add    %edx,%eax
    8d62:	c1 e0 02             	shl    $0x2,%eax
    8d65:	01 d0                	add    %edx,%eax
    8d67:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8d6a:	01 d0                	add    %edx,%eax
    8d6c:	83 c0 14             	add    $0x14,%eax
    8d6f:	8b 04 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%eax
    8d76:	29 c1                	sub    %eax,%ecx
    8d78:	89 c8                	mov    %ecx,%eax
    8d7a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    8d7d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8d80:	89 d0                	mov    %edx,%eax
    8d82:	c1 e0 03             	shl    $0x3,%eax
    8d85:	01 d0                	add    %edx,%eax
    8d87:	c1 e0 02             	shl    $0x2,%eax
    8d8a:	01 d0                	add    %edx,%eax
    8d8c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8d8f:	01 d0                	add    %edx,%eax
    8d91:	83 c0 14             	add    $0x14,%eax
    8d94:	8b 14 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%edx
    8d9b:	89 d0                	mov    %edx,%eax
    8d9d:	01 c0                	add    %eax,%eax
    8d9f:	01 c2                	add    %eax,%edx
    8da1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8da4:	83 c0 01             	add    $0x1,%eax
    8da7:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    8dab:	01 d0                	add    %edx,%eax
    8dad:	83 e8 01             	sub    $0x1,%eax
    8db0:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    8db3:	e9 80 00 00 00       	jmp    8e38 <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    8db8:	8b 45 08             	mov    0x8(%ebp),%eax
    8dbb:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    8dc1:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    8dc4:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8dc9:	89 c8                	mov    %ecx,%eax
    8dcb:	f7 ea                	imul   %edx
    8dcd:	c1 fa 02             	sar    $0x2,%edx
    8dd0:	89 c8                	mov    %ecx,%eax
    8dd2:	c1 f8 1f             	sar    $0x1f,%eax
    8dd5:	89 d3                	mov    %edx,%ebx
    8dd7:	29 c3                	sub    %eax,%ebx
    8dd9:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    8ddc:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8de1:	89 c8                	mov    %ecx,%eax
    8de3:	f7 ea                	imul   %edx
    8de5:	c1 fa 02             	sar    $0x2,%edx
    8de8:	89 c8                	mov    %ecx,%eax
    8dea:	c1 f8 1f             	sar    $0x1f,%eax
    8ded:	29 c2                	sub    %eax,%edx
    8def:	89 d0                	mov    %edx,%eax
    8df1:	c1 e0 03             	shl    $0x3,%eax
    8df4:	01 d0                	add    %edx,%eax
    8df6:	01 c0                	add    %eax,%eax
    8df8:	29 c1                	sub    %eax,%ecx
    8dfa:	89 ca                	mov    %ecx,%edx
    8dfc:	89 d8                	mov    %ebx,%eax
    8dfe:	c1 e0 03             	shl    $0x3,%eax
    8e01:	01 d8                	add    %ebx,%eax
    8e03:	01 c0                	add    %eax,%eax
    8e05:	01 d0                	add    %edx,%eax
    8e07:	dd 04 c6             	fldl   (%esi,%eax,8)
    8e0a:	d9 ee                	fldz   
    8e0c:	df e9                	fucomip %st(1),%st
    8e0e:	7a 0a                	jp     8e1a <III_stereo+0x1e1>
    8e10:	d9 ee                	fldz   
    8e12:	df e9                	fucomip %st(1),%st
    8e14:	dd d8                	fstp   %st(0)
    8e16:	74 18                	je     8e30 <III_stereo+0x1f7>
    8e18:	eb 02                	jmp    8e1c <III_stereo+0x1e3>
    8e1a:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    8e1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8e1f:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    8e22:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    8e29:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    8e30:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    8e34:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    8e38:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    8e3c:	0f 8f 76 ff ff ff    	jg     8db8 <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    8e42:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    8e46:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    8e4a:	0f 8f e7 fe ff ff    	jg     8d37 <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    8e50:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8e53:	83 c0 01             	add    $0x1,%eax
    8e56:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    8e59:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8e5c:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    8e5f:	7e 06                	jle    8e67 <III_stereo+0x22e>
                  max_sfb = sfb;
    8e61:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8e64:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    8e67:	e9 fa 00 00 00       	jmp    8f66 <III_stereo+0x32d>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    8e6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8e6f:	8d 48 01             	lea    0x1(%eax),%ecx
    8e72:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8e75:	89 d0                	mov    %edx,%eax
    8e77:	c1 e0 03             	shl    $0x3,%eax
    8e7a:	01 d0                	add    %edx,%eax
    8e7c:	c1 e0 02             	shl    $0x2,%eax
    8e7f:	01 d0                	add    %edx,%eax
    8e81:	01 c8                	add    %ecx,%eax
    8e83:	83 c0 14             	add    $0x14,%eax
    8e86:	8b 0c 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%ecx
    8e8d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8e90:	89 d0                	mov    %edx,%eax
    8e92:	c1 e0 03             	shl    $0x3,%eax
    8e95:	01 d0                	add    %edx,%eax
    8e97:	c1 e0 02             	shl    $0x2,%eax
    8e9a:	01 d0                	add    %edx,%eax
    8e9c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8e9f:	01 d0                	add    %edx,%eax
    8ea1:	83 c0 14             	add    $0x14,%eax
    8ea4:	8b 04 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%eax
    8eab:	29 c1                	sub    %eax,%ecx
    8ead:	89 c8                	mov    %ecx,%eax
    8eaf:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    8eb2:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8eb5:	89 d0                	mov    %edx,%eax
    8eb7:	c1 e0 03             	shl    $0x3,%eax
    8eba:	01 d0                	add    %edx,%eax
    8ebc:	c1 e0 02             	shl    $0x2,%eax
    8ebf:	01 d0                	add    %edx,%eax
    8ec1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8ec4:	01 d0                	add    %edx,%eax
    8ec6:	83 c0 14             	add    $0x14,%eax
    8ec9:	8b 14 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%edx
    8ed0:	89 d0                	mov    %edx,%eax
    8ed2:	01 c0                	add    %eax,%eax
    8ed4:	01 c2                	add    %eax,%edx
    8ed6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8ed9:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8edd:	01 d0                	add    %edx,%eax
    8edf:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    8ee2:	eb 78                	jmp    8f5c <III_stereo+0x323>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    8ee4:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8ee7:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8eea:	89 d0                	mov    %edx,%eax
    8eec:	01 c0                	add    %eax,%eax
    8eee:	01 d0                	add    %edx,%eax
    8ef0:	c1 e0 02             	shl    $0x2,%eax
    8ef3:	01 d0                	add    %edx,%eax
    8ef5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8ef8:	01 d0                	add    %edx,%eax
    8efa:	83 c0 52             	add    $0x52,%eax
    8efd:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    8f01:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f04:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    8f0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f0e:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8f15:	83 f8 07             	cmp    $0x7,%eax
    8f18:	74 3a                	je     8f54 <III_stereo+0x31b>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    8f1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f1d:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8f24:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    8f2a:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    8f30:	dd 05 40 d6 00 00    	fldl   0xd640
    8f36:	de c9                	fmulp  %st,%st(1)
    8f38:	83 ec 08             	sub    $0x8,%esp
    8f3b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8f3f:	dd 1c 24             	fstpl  (%esp)
    8f42:	e8 60 b6 ff ff       	call   45a7 <tan>
    8f47:	83 c4 10             	add    $0x10,%esp
    8f4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f4d:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    8f54:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    8f58:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    8f5c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    8f60:	7f 82                	jg     8ee4 <III_stereo+0x2ab>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    8f62:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    8f66:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    8f6a:	0f 8e fc fe ff ff    	jle    8e6c <III_stereo+0x233>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    8f70:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8f73:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8f79:	83 c0 7c             	add    $0x7c,%eax
    8f7c:	05 40 f1 00 00       	add    $0xf140,%eax
    8f81:	8b 50 0c             	mov    0xc(%eax),%edx
    8f84:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8f87:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8f8d:	83 c0 78             	add    $0x78,%eax
    8f90:	05 40 f1 00 00       	add    $0xf140,%eax
    8f95:	8b 40 0c             	mov    0xc(%eax),%eax
    8f98:	29 c2                	sub    %eax,%edx
    8f9a:	89 d0                	mov    %edx,%eax
    8f9c:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    8f9f:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8fa2:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8fa8:	83 c0 78             	add    $0x78,%eax
    8fab:	05 40 f1 00 00       	add    $0xf140,%eax
    8fb0:	8b 50 0c             	mov    0xc(%eax),%edx
    8fb3:	89 d0                	mov    %edx,%eax
    8fb5:	01 c0                	add    %eax,%eax
    8fb7:	01 c2                	add    %eax,%edx
    8fb9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8fbc:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8fc0:	01 d0                	add    %edx,%eax
    8fc2:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    8fc5:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8fc8:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8fce:	83 e8 80             	sub    $0xffffff80,%eax
    8fd1:	05 40 f1 00 00       	add    $0xf140,%eax
    8fd6:	8b 50 0c             	mov    0xc(%eax),%edx
    8fd9:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8fdc:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8fe2:	83 c0 7c             	add    $0x7c,%eax
    8fe5:	05 40 f1 00 00       	add    $0xf140,%eax
    8fea:	8b 40 0c             	mov    0xc(%eax),%eax
    8fed:	29 c2                	sub    %eax,%edx
    8fef:	89 d0                	mov    %edx,%eax
    8ff1:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    8ff4:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8ff7:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8ffd:	83 c0 7c             	add    $0x7c,%eax
    9000:	05 40 f1 00 00       	add    $0xf140,%eax
    9005:	8b 50 0c             	mov    0xc(%eax),%edx
    9008:	89 d0                	mov    %edx,%eax
    900a:	01 c0                	add    %eax,%eax
    900c:	01 c2                	add    %eax,%edx
    900e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9011:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9015:	01 d0                	add    %edx,%eax
    9017:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    901a:	eb 30                	jmp    904c <III_stereo+0x413>
               {  is_pos[i] = is_pos[sfb];
    901c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    901f:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    9026:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9029:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    9030:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9033:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    903a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    903d:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    9044:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    9048:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    904c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9050:	7f ca                	jg     901c <III_stereo+0x3e3>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    9052:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9056:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    905a:	0f 8e c4 fc ff ff    	jle    8d24 <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    9060:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    9064:	0f 8f 93 01 00 00    	jg     91fd <III_stereo+0x5c4>
             {  i = 2;
    906a:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    9071:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    9078:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    907f:	eb 63                	jmp    90e4 <III_stereo+0x4ab>
                {  if ( xr[1][i][ss] != 0.0 )
    9081:	8b 45 08             	mov    0x8(%ebp),%eax
    9084:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    908a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    908d:	89 d0                	mov    %edx,%eax
    908f:	c1 e0 03             	shl    $0x3,%eax
    9092:	01 d0                	add    %edx,%eax
    9094:	01 c0                	add    %eax,%eax
    9096:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9099:	01 d0                	add    %edx,%eax
    909b:	dd 04 c1             	fldl   (%ecx,%eax,8)
    909e:	d9 ee                	fldz   
    90a0:	df e9                	fucomip %st(1),%st
    90a2:	7a 0a                	jp     90ae <III_stereo+0x475>
    90a4:	d9 ee                	fldz   
    90a6:	df e9                	fucomip %st(1),%st
    90a8:	dd d8                	fstp   %st(0)
    90aa:	74 23                	je     90cf <III_stereo+0x496>
    90ac:	eb 02                	jmp    90b0 <III_stereo+0x477>
    90ae:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    90b0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    90b3:	89 d0                	mov    %edx,%eax
    90b5:	c1 e0 03             	shl    $0x3,%eax
    90b8:	01 d0                	add    %edx,%eax
    90ba:	01 c0                	add    %eax,%eax
    90bc:	89 c2                	mov    %eax,%edx
    90be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    90c1:	01 d0                	add    %edx,%eax
    90c3:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    90c6:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    90cd:	eb 15                	jmp    90e4 <III_stereo+0x4ab>
                   } else
                   {  ss--;
    90cf:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    90d3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    90d7:	79 0b                	jns    90e4 <III_stereo+0x4ab>
                      {  i--;
    90d9:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    90dd:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    90e4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    90e8:	79 97                	jns    9081 <III_stereo+0x448>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    90ea:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    90f1:	eb 04                	jmp    90f7 <III_stereo+0x4be>
                   i++;
    90f3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    90f7:	8b 55 c8             	mov    -0x38(%ebp),%edx
    90fa:	89 d0                	mov    %edx,%eax
    90fc:	c1 e0 03             	shl    $0x3,%eax
    90ff:	01 d0                	add    %edx,%eax
    9101:	c1 e0 02             	shl    $0x2,%eax
    9104:	01 d0                	add    %edx,%eax
    9106:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9109:	01 d0                	add    %edx,%eax
    910b:	8b 04 85 40 f1 00 00 	mov    0xf140(,%eax,4),%eax
    9112:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    9115:	7e dc                	jle    90f3 <III_stereo+0x4ba>
                   i++;
                sfb = i;
    9117:	8b 45 f0             	mov    -0x10(%ebp),%eax
    911a:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    911d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9120:	89 d0                	mov    %edx,%eax
    9122:	c1 e0 03             	shl    $0x3,%eax
    9125:	01 d0                	add    %edx,%eax
    9127:	c1 e0 02             	shl    $0x2,%eax
    912a:	01 d0                	add    %edx,%eax
    912c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    912f:	01 d0                	add    %edx,%eax
    9131:	8b 04 85 40 f1 00 00 	mov    0xf140(,%eax,4),%eax
    9138:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    913b:	e9 b3 00 00 00       	jmp    91f3 <III_stereo+0x5ba>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    9140:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9143:	8d 48 01             	lea    0x1(%eax),%ecx
    9146:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9149:	89 d0                	mov    %edx,%eax
    914b:	c1 e0 03             	shl    $0x3,%eax
    914e:	01 d0                	add    %edx,%eax
    9150:	c1 e0 02             	shl    $0x2,%eax
    9153:	01 d0                	add    %edx,%eax
    9155:	01 c8                	add    %ecx,%eax
    9157:	8b 0c 85 40 f1 00 00 	mov    0xf140(,%eax,4),%ecx
    915e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9161:	89 d0                	mov    %edx,%eax
    9163:	c1 e0 03             	shl    $0x3,%eax
    9166:	01 d0                	add    %edx,%eax
    9168:	c1 e0 02             	shl    $0x2,%eax
    916b:	01 d0                	add    %edx,%eax
    916d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9170:	01 d0                	add    %edx,%eax
    9172:	8b 04 85 40 f1 00 00 	mov    0xf140(,%eax,4),%eax
    9179:	29 c1                	sub    %eax,%ecx
    917b:	89 c8                	mov    %ecx,%eax
    917d:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    9180:	eb 67                	jmp    91e9 <III_stereo+0x5b0>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    9182:	8b 45 10             	mov    0x10(%ebp),%eax
    9185:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9188:	83 c2 3e             	add    $0x3e,%edx
    918b:	8b 14 90             	mov    (%eax,%edx,4),%edx
    918e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9191:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    9198:	8b 45 f0             	mov    -0x10(%ebp),%eax
    919b:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    91a2:	83 f8 07             	cmp    $0x7,%eax
    91a5:	74 3a                	je     91e1 <III_stereo+0x5a8>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    91a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91aa:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    91b1:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    91b7:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    91bd:	dd 05 40 d6 00 00    	fldl   0xd640
    91c3:	de c9                	fmulp  %st,%st(1)
    91c5:	83 ec 08             	sub    $0x8,%esp
    91c8:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    91cc:	dd 1c 24             	fstpl  (%esp)
    91cf:	e8 d3 b3 ff ff       	call   45a7 <tan>
    91d4:	83 c4 10             	add    $0x10,%esp
    91d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91da:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    91e1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    91e5:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    91e9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    91ed:	7f 93                	jg     9182 <III_stereo+0x549>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    91ef:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    91f3:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    91f7:	0f 8e 43 ff ff ff    	jle    9140 <III_stereo+0x507>
    91fd:	e9 3a 03 00 00       	jmp    953c <III_stereo+0x903>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    9202:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9209:	e9 24 03 00 00       	jmp    9532 <III_stereo+0x8f9>
            {  int sfbcnt;
               sfbcnt = -1;
    920e:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    9215:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    921c:	e9 0f 01 00 00       	jmp    9330 <III_stereo+0x6f7>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9221:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9224:	8d 48 01             	lea    0x1(%eax),%ecx
    9227:	8b 55 c8             	mov    -0x38(%ebp),%edx
    922a:	89 d0                	mov    %edx,%eax
    922c:	c1 e0 03             	shl    $0x3,%eax
    922f:	01 d0                	add    %edx,%eax
    9231:	c1 e0 02             	shl    $0x2,%eax
    9234:	01 d0                	add    %edx,%eax
    9236:	01 c8                	add    %ecx,%eax
    9238:	83 c0 14             	add    $0x14,%eax
    923b:	8b 0c 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%ecx
    9242:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9245:	89 d0                	mov    %edx,%eax
    9247:	c1 e0 03             	shl    $0x3,%eax
    924a:	01 d0                	add    %edx,%eax
    924c:	c1 e0 02             	shl    $0x2,%eax
    924f:	01 d0                	add    %edx,%eax
    9251:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9254:	01 d0                	add    %edx,%eax
    9256:	83 c0 14             	add    $0x14,%eax
    9259:	8b 04 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%eax
    9260:	29 c1                	sub    %eax,%ecx
    9262:	89 c8                	mov    %ecx,%eax
    9264:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    9267:	8b 55 c8             	mov    -0x38(%ebp),%edx
    926a:	89 d0                	mov    %edx,%eax
    926c:	c1 e0 03             	shl    $0x3,%eax
    926f:	01 d0                	add    %edx,%eax
    9271:	c1 e0 02             	shl    $0x2,%eax
    9274:	01 d0                	add    %edx,%eax
    9276:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9279:	01 d0                	add    %edx,%eax
    927b:	83 c0 14             	add    $0x14,%eax
    927e:	8b 14 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%edx
    9285:	89 d0                	mov    %edx,%eax
    9287:	01 c0                	add    %eax,%eax
    9289:	01 c2                	add    %eax,%edx
    928b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    928e:	83 c0 01             	add    $0x1,%eax
    9291:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    9295:	01 d0                	add    %edx,%eax
    9297:	83 e8 01             	sub    $0x1,%eax
    929a:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    929d:	e9 80 00 00 00       	jmp    9322 <III_stereo+0x6e9>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    92a2:	8b 45 08             	mov    0x8(%ebp),%eax
    92a5:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    92ab:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    92ae:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    92b3:	89 c8                	mov    %ecx,%eax
    92b5:	f7 ea                	imul   %edx
    92b7:	c1 fa 02             	sar    $0x2,%edx
    92ba:	89 c8                	mov    %ecx,%eax
    92bc:	c1 f8 1f             	sar    $0x1f,%eax
    92bf:	89 d3                	mov    %edx,%ebx
    92c1:	29 c3                	sub    %eax,%ebx
    92c3:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    92c6:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    92cb:	89 c8                	mov    %ecx,%eax
    92cd:	f7 ea                	imul   %edx
    92cf:	c1 fa 02             	sar    $0x2,%edx
    92d2:	89 c8                	mov    %ecx,%eax
    92d4:	c1 f8 1f             	sar    $0x1f,%eax
    92d7:	29 c2                	sub    %eax,%edx
    92d9:	89 d0                	mov    %edx,%eax
    92db:	c1 e0 03             	shl    $0x3,%eax
    92de:	01 d0                	add    %edx,%eax
    92e0:	01 c0                	add    %eax,%eax
    92e2:	29 c1                	sub    %eax,%ecx
    92e4:	89 ca                	mov    %ecx,%edx
    92e6:	89 d8                	mov    %ebx,%eax
    92e8:	c1 e0 03             	shl    $0x3,%eax
    92eb:	01 d8                	add    %ebx,%eax
    92ed:	01 c0                	add    %eax,%eax
    92ef:	01 d0                	add    %edx,%eax
    92f1:	dd 04 c6             	fldl   (%esi,%eax,8)
    92f4:	d9 ee                	fldz   
    92f6:	df e9                	fucomip %st(1),%st
    92f8:	7a 0a                	jp     9304 <III_stereo+0x6cb>
    92fa:	d9 ee                	fldz   
    92fc:	df e9                	fucomip %st(1),%st
    92fe:	dd d8                	fstp   %st(0)
    9300:	74 18                	je     931a <III_stereo+0x6e1>
    9302:	eb 02                	jmp    9306 <III_stereo+0x6cd>
    9304:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    9306:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9309:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    930c:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    9313:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    931a:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    931e:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    9322:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    9326:	0f 8f 76 ff ff ff    	jg     92a2 <III_stereo+0x669>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    932c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    9330:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    9334:	0f 89 e7 fe ff ff    	jns    9221 <III_stereo+0x5e8>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    933a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    933d:	83 c0 01             	add    $0x1,%eax
    9340:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    9343:	e9 fa 00 00 00       	jmp    9442 <III_stereo+0x809>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9348:	8b 45 f4             	mov    -0xc(%ebp),%eax
    934b:	8d 48 01             	lea    0x1(%eax),%ecx
    934e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9351:	89 d0                	mov    %edx,%eax
    9353:	c1 e0 03             	shl    $0x3,%eax
    9356:	01 d0                	add    %edx,%eax
    9358:	c1 e0 02             	shl    $0x2,%eax
    935b:	01 d0                	add    %edx,%eax
    935d:	01 c8                	add    %ecx,%eax
    935f:	83 c0 14             	add    $0x14,%eax
    9362:	8b 0c 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%ecx
    9369:	8b 55 c8             	mov    -0x38(%ebp),%edx
    936c:	89 d0                	mov    %edx,%eax
    936e:	c1 e0 03             	shl    $0x3,%eax
    9371:	01 d0                	add    %edx,%eax
    9373:	c1 e0 02             	shl    $0x2,%eax
    9376:	01 d0                	add    %edx,%eax
    9378:	8b 55 f4             	mov    -0xc(%ebp),%edx
    937b:	01 d0                	add    %edx,%eax
    937d:	83 c0 14             	add    $0x14,%eax
    9380:	8b 04 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%eax
    9387:	29 c1                	sub    %eax,%ecx
    9389:	89 c8                	mov    %ecx,%eax
    938b:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    938e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9391:	89 d0                	mov    %edx,%eax
    9393:	c1 e0 03             	shl    $0x3,%eax
    9396:	01 d0                	add    %edx,%eax
    9398:	c1 e0 02             	shl    $0x2,%eax
    939b:	01 d0                	add    %edx,%eax
    939d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    93a0:	01 d0                	add    %edx,%eax
    93a2:	83 c0 14             	add    $0x14,%eax
    93a5:	8b 14 85 4c f1 00 00 	mov    0xf14c(,%eax,4),%edx
    93ac:	89 d0                	mov    %edx,%eax
    93ae:	01 c0                	add    %eax,%eax
    93b0:	01 c2                	add    %eax,%edx
    93b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    93b5:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    93b9:	01 d0                	add    %edx,%eax
    93bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    93be:	eb 78                	jmp    9438 <III_stereo+0x7ff>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    93c0:	8b 4d 10             	mov    0x10(%ebp),%ecx
    93c3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    93c6:	89 d0                	mov    %edx,%eax
    93c8:	01 c0                	add    %eax,%eax
    93ca:	01 d0                	add    %edx,%eax
    93cc:	c1 e0 02             	shl    $0x2,%eax
    93cf:	01 d0                	add    %edx,%eax
    93d1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    93d4:	01 d0                	add    %edx,%eax
    93d6:	83 c0 52             	add    $0x52,%eax
    93d9:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    93dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    93e0:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    93e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    93ea:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    93f1:	83 f8 07             	cmp    $0x7,%eax
    93f4:	74 3a                	je     9430 <III_stereo+0x7f7>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    93f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    93f9:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9400:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    9406:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    940c:	dd 05 40 d6 00 00    	fldl   0xd640
    9412:	de c9                	fmulp  %st,%st(1)
    9414:	83 ec 08             	sub    $0x8,%esp
    9417:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    941b:	dd 1c 24             	fstpl  (%esp)
    941e:	e8 84 b1 ff ff       	call   45a7 <tan>
    9423:	83 c4 10             	add    $0x10,%esp
    9426:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9429:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    9430:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    9434:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9438:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    943c:	7f 82                	jg     93c0 <III_stereo+0x787>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    943e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    9442:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    9446:	0f 8e fc fe ff ff    	jle    9348 <III_stereo+0x70f>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    944c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    944f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9455:	83 c0 7c             	add    $0x7c,%eax
    9458:	05 40 f1 00 00       	add    $0xf140,%eax
    945d:	8b 50 0c             	mov    0xc(%eax),%edx
    9460:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9463:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9469:	83 c0 78             	add    $0x78,%eax
    946c:	05 40 f1 00 00       	add    $0xf140,%eax
    9471:	8b 40 0c             	mov    0xc(%eax),%eax
    9474:	29 c2                	sub    %eax,%edx
    9476:	89 d0                	mov    %edx,%eax
    9478:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    947b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    947e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9484:	83 c0 78             	add    $0x78,%eax
    9487:	05 40 f1 00 00       	add    $0xf140,%eax
    948c:	8b 50 0c             	mov    0xc(%eax),%edx
    948f:	89 d0                	mov    %edx,%eax
    9491:	01 c0                	add    %eax,%eax
    9493:	01 c2                	add    %eax,%edx
    9495:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9498:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    949c:	01 d0                	add    %edx,%eax
    949e:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    94a1:	8b 45 c8             	mov    -0x38(%ebp),%eax
    94a4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    94aa:	83 e8 80             	sub    $0xffffff80,%eax
    94ad:	05 40 f1 00 00       	add    $0xf140,%eax
    94b2:	8b 50 0c             	mov    0xc(%eax),%edx
    94b5:	8b 45 c8             	mov    -0x38(%ebp),%eax
    94b8:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    94be:	83 c0 7c             	add    $0x7c,%eax
    94c1:	05 40 f1 00 00       	add    $0xf140,%eax
    94c6:	8b 40 0c             	mov    0xc(%eax),%eax
    94c9:	29 c2                	sub    %eax,%edx
    94cb:	89 d0                	mov    %edx,%eax
    94cd:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    94d0:	8b 45 c8             	mov    -0x38(%ebp),%eax
    94d3:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    94d9:	83 c0 7c             	add    $0x7c,%eax
    94dc:	05 40 f1 00 00       	add    $0xf140,%eax
    94e1:	8b 50 0c             	mov    0xc(%eax),%edx
    94e4:	89 d0                	mov    %edx,%eax
    94e6:	01 c0                	add    %eax,%eax
    94e8:	01 c2                	add    %eax,%edx
    94ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
    94ed:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    94f1:	01 d0                	add    %edx,%eax
    94f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    94f6:	eb 30                	jmp    9528 <III_stereo+0x8ef>
               {  is_pos[i] = is_pos[sfb];
    94f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    94fb:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    9502:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9505:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    950c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    950f:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9516:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9519:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    9520:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    9524:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9528:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    952c:	7f ca                	jg     94f8 <III_stereo+0x8bf>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    952e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9532:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    9536:	0f 8e d2 fc ff ff    	jle    920e <III_stereo+0x5d5>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    953c:	e9 00 02 00 00       	jmp    9741 <III_stereo+0xb08>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    9541:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    9548:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    954f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    9556:	eb 63                	jmp    95bb <III_stereo+0x982>
         {  if ( xr[1][i][ss] != 0.0 )
    9558:	8b 45 08             	mov    0x8(%ebp),%eax
    955b:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9561:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9564:	89 d0                	mov    %edx,%eax
    9566:	c1 e0 03             	shl    $0x3,%eax
    9569:	01 d0                	add    %edx,%eax
    956b:	01 c0                	add    %eax,%eax
    956d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9570:	01 d0                	add    %edx,%eax
    9572:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9575:	d9 ee                	fldz   
    9577:	df e9                	fucomip %st(1),%st
    9579:	7a 0a                	jp     9585 <III_stereo+0x94c>
    957b:	d9 ee                	fldz   
    957d:	df e9                	fucomip %st(1),%st
    957f:	dd d8                	fstp   %st(0)
    9581:	74 23                	je     95a6 <III_stereo+0x96d>
    9583:	eb 02                	jmp    9587 <III_stereo+0x94e>
    9585:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    9587:	8b 55 f0             	mov    -0x10(%ebp),%edx
    958a:	89 d0                	mov    %edx,%eax
    958c:	c1 e0 03             	shl    $0x3,%eax
    958f:	01 d0                	add    %edx,%eax
    9591:	01 c0                	add    %eax,%eax
    9593:	89 c2                	mov    %eax,%edx
    9595:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9598:	01 d0                	add    %edx,%eax
    959a:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    959d:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    95a4:	eb 15                	jmp    95bb <III_stereo+0x982>
            } else
            {  ss--;
    95a6:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    95aa:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    95ae:	79 0b                	jns    95bb <III_stereo+0x982>
               {  i--;
    95b0:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    95b4:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    95bb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    95bf:	79 97                	jns    9558 <III_stereo+0x91f>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    95c1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    95c8:	eb 04                	jmp    95ce <III_stereo+0x995>
            i++;
    95ca:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    95ce:	8b 55 c8             	mov    -0x38(%ebp),%edx
    95d1:	89 d0                	mov    %edx,%eax
    95d3:	c1 e0 03             	shl    $0x3,%eax
    95d6:	01 d0                	add    %edx,%eax
    95d8:	c1 e0 02             	shl    $0x2,%eax
    95db:	01 d0                	add    %edx,%eax
    95dd:	8b 55 f0             	mov    -0x10(%ebp),%edx
    95e0:	01 d0                	add    %edx,%eax
    95e2:	8b 04 85 40 f1 00 00 	mov    0xf140(,%eax,4),%eax
    95e9:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    95ec:	7e dc                	jle    95ca <III_stereo+0x991>
            i++;
         sfb = i;
    95ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
    95f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    95f4:	8b 55 c8             	mov    -0x38(%ebp),%edx
    95f7:	89 d0                	mov    %edx,%eax
    95f9:	c1 e0 03             	shl    $0x3,%eax
    95fc:	01 d0                	add    %edx,%eax
    95fe:	c1 e0 02             	shl    $0x2,%eax
    9601:	01 d0                	add    %edx,%eax
    9603:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9606:	01 d0                	add    %edx,%eax
    9608:	8b 04 85 40 f1 00 00 	mov    0xf140(,%eax,4),%eax
    960f:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    9612:	e9 b3 00 00 00       	jmp    96ca <III_stereo+0xa91>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    9617:	8b 45 f4             	mov    -0xc(%ebp),%eax
    961a:	8d 48 01             	lea    0x1(%eax),%ecx
    961d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9620:	89 d0                	mov    %edx,%eax
    9622:	c1 e0 03             	shl    $0x3,%eax
    9625:	01 d0                	add    %edx,%eax
    9627:	c1 e0 02             	shl    $0x2,%eax
    962a:	01 d0                	add    %edx,%eax
    962c:	01 c8                	add    %ecx,%eax
    962e:	8b 0c 85 40 f1 00 00 	mov    0xf140(,%eax,4),%ecx
    9635:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9638:	89 d0                	mov    %edx,%eax
    963a:	c1 e0 03             	shl    $0x3,%eax
    963d:	01 d0                	add    %edx,%eax
    963f:	c1 e0 02             	shl    $0x2,%eax
    9642:	01 d0                	add    %edx,%eax
    9644:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9647:	01 d0                	add    %edx,%eax
    9649:	8b 04 85 40 f1 00 00 	mov    0xf140(,%eax,4),%eax
    9650:	29 c1                	sub    %eax,%ecx
    9652:	89 c8                	mov    %ecx,%eax
    9654:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    9657:	eb 67                	jmp    96c0 <III_stereo+0xa87>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    9659:	8b 45 10             	mov    0x10(%ebp),%eax
    965c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    965f:	83 c2 3e             	add    $0x3e,%edx
    9662:	8b 14 90             	mov    (%eax,%edx,4),%edx
    9665:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9668:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    966f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9672:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9679:	83 f8 07             	cmp    $0x7,%eax
    967c:	74 3a                	je     96b8 <III_stereo+0xa7f>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    967e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9681:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9688:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    968e:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9694:	dd 05 40 d6 00 00    	fldl   0xd640
    969a:	de c9                	fmulp  %st,%st(1)
    969c:	83 ec 08             	sub    $0x8,%esp
    969f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    96a3:	dd 1c 24             	fstpl  (%esp)
    96a6:	e8 fc ae ff ff       	call   45a7 <tan>
    96ab:	83 c4 10             	add    $0x10,%esp
    96ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
    96b1:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    96b8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    96bc:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    96c0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    96c4:	7f 93                	jg     9659 <III_stereo+0xa20>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    96c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    96ca:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    96ce:	0f 8e 43 ff ff ff    	jle    9617 <III_stereo+0x9de>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    96d4:	8b 45 c8             	mov    -0x38(%ebp),%eax
    96d7:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    96dd:	83 c0 50             	add    $0x50,%eax
    96e0:	05 40 f1 00 00       	add    $0xf140,%eax
    96e5:	8b 00                	mov    (%eax),%eax
    96e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    96ea:	8b 45 c8             	mov    -0x38(%ebp),%eax
    96ed:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    96f3:	83 c0 54             	add    $0x54,%eax
    96f6:	05 40 f1 00 00       	add    $0xf140,%eax
    96fb:	8b 00                	mov    (%eax),%eax
    96fd:	ba 40 02 00 00       	mov    $0x240,%edx
    9702:	29 c2                	sub    %eax,%edx
    9704:	89 d0                	mov    %edx,%eax
    9706:	89 45 e8             	mov    %eax,-0x18(%ebp)
    9709:	eb 30                	jmp    973b <III_stereo+0xb02>
         {  is_pos[i] = is_pos[sfb];
    970b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    970e:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    9715:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9718:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    971f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9722:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9729:	8b 45 f0             	mov    -0x10(%ebp),%eax
    972c:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    9733:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    9737:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    973b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    973f:	7f ca                	jg     970b <III_stereo+0xad2>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    9741:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    9748:	eb 55                	jmp    979f <III_stereo+0xb66>
      for(sb=0;sb<SBLIMIT;sb++)
    974a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9751:	eb 42                	jmp    9795 <III_stereo+0xb5c>
         for(ss=0;ss<SSLIMIT;ss++)
    9753:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    975a:	eb 2f                	jmp    978b <III_stereo+0xb52>
            lr[ch][sb][ss] = 0;
    975c:	8b 55 e0             	mov    -0x20(%ebp),%edx
    975f:	89 d0                	mov    %edx,%eax
    9761:	c1 e0 03             	shl    $0x3,%eax
    9764:	01 d0                	add    %edx,%eax
    9766:	c1 e0 09             	shl    $0x9,%eax
    9769:	89 c2                	mov    %eax,%edx
    976b:	8b 45 0c             	mov    0xc(%ebp),%eax
    976e:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9771:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9774:	89 d0                	mov    %edx,%eax
    9776:	c1 e0 03             	shl    $0x3,%eax
    9779:	01 d0                	add    %edx,%eax
    977b:	01 c0                	add    %eax,%eax
    977d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9780:	01 d0                	add    %edx,%eax
    9782:	d9 ee                	fldz   
    9784:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    9787:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    978b:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    978f:	7e cb                	jle    975c <III_stereo+0xb23>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    9791:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9795:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    9799:	7e b8                	jle    9753 <III_stereo+0xb1a>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    979b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    979f:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    97a3:	7e a5                	jle    974a <III_stereo+0xb11>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    97a5:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    97a9:	0f 85 3b 02 00 00    	jne    99ea <III_stereo+0xdb1>
      for(sb=0;sb<SBLIMIT;sb++)
    97af:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    97b6:	e9 23 02 00 00       	jmp    99de <III_stereo+0xda5>
         for(ss=0;ss<SSLIMIT;ss++) {
    97bb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    97c2:	e9 09 02 00 00       	jmp    99d0 <III_stereo+0xd97>
            i = (sb*18)+ss;
    97c7:	8b 55 e8             	mov    -0x18(%ebp),%edx
    97ca:	89 d0                	mov    %edx,%eax
    97cc:	c1 e0 03             	shl    $0x3,%eax
    97cf:	01 d0                	add    %edx,%eax
    97d1:	01 c0                	add    %eax,%eax
    97d3:	89 c2                	mov    %eax,%edx
    97d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    97d8:	01 d0                	add    %edx,%eax
    97da:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    97dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    97e0:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    97e7:	83 f8 07             	cmp    $0x7,%eax
    97ea:	0f 85 2c 01 00 00    	jne    991c <III_stereo+0xce3>
               if ( ms_stereo ) {
    97f0:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    97f4:	0f 84 b5 00 00 00    	je     98af <III_stereo+0xc76>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    97fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
    97fd:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9800:	89 d0                	mov    %edx,%eax
    9802:	c1 e0 03             	shl    $0x3,%eax
    9805:	01 d0                	add    %edx,%eax
    9807:	01 c0                	add    %eax,%eax
    9809:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    980c:	01 d0                	add    %edx,%eax
    980e:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9811:	8b 45 08             	mov    0x8(%ebp),%eax
    9814:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    981a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    981d:	89 d0                	mov    %edx,%eax
    981f:	c1 e0 03             	shl    $0x3,%eax
    9822:	01 d0                	add    %edx,%eax
    9824:	01 c0                	add    %eax,%eax
    9826:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9829:	01 d0                	add    %edx,%eax
    982b:	dd 04 c1             	fldl   (%ecx,%eax,8)
    982e:	de c1                	faddp  %st,%st(1)
    9830:	dd 05 48 d6 00 00    	fldl   0xd648
    9836:	de f9                	fdivrp %st,%st(1)
    9838:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    983b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    983e:	89 d0                	mov    %edx,%eax
    9840:	c1 e0 03             	shl    $0x3,%eax
    9843:	01 d0                	add    %edx,%eax
    9845:	01 c0                	add    %eax,%eax
    9847:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    984a:	01 d0                	add    %edx,%eax
    984c:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    984f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9852:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    9858:	8b 4d 08             	mov    0x8(%ebp),%ecx
    985b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    985e:	89 d0                	mov    %edx,%eax
    9860:	c1 e0 03             	shl    $0x3,%eax
    9863:	01 d0                	add    %edx,%eax
    9865:	01 c0                	add    %eax,%eax
    9867:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    986a:	01 d0                	add    %edx,%eax
    986c:	dd 04 c1             	fldl   (%ecx,%eax,8)
    986f:	8b 45 08             	mov    0x8(%ebp),%eax
    9872:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9878:	8b 55 e8             	mov    -0x18(%ebp),%edx
    987b:	89 d0                	mov    %edx,%eax
    987d:	c1 e0 03             	shl    $0x3,%eax
    9880:	01 d0                	add    %edx,%eax
    9882:	01 c0                	add    %eax,%eax
    9884:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9887:	01 d0                	add    %edx,%eax
    9889:	dd 04 c1             	fldl   (%ecx,%eax,8)
    988c:	de e9                	fsubrp %st,%st(1)
    988e:	dd 05 48 d6 00 00    	fldl   0xd648
    9894:	de f9                	fdivrp %st,%st(1)
    9896:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9899:	89 d0                	mov    %edx,%eax
    989b:	c1 e0 03             	shl    $0x3,%eax
    989e:	01 d0                	add    %edx,%eax
    98a0:	01 c0                	add    %eax,%eax
    98a2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    98a5:	01 d0                	add    %edx,%eax
    98a7:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    98aa:	e9 1d 01 00 00       	jmp    99cc <III_stereo+0xd93>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    98af:	8b 4d 08             	mov    0x8(%ebp),%ecx
    98b2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    98b5:	89 d0                	mov    %edx,%eax
    98b7:	c1 e0 03             	shl    $0x3,%eax
    98ba:	01 d0                	add    %edx,%eax
    98bc:	01 c0                	add    %eax,%eax
    98be:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    98c1:	01 d0                	add    %edx,%eax
    98c3:	dd 04 c1             	fldl   (%ecx,%eax,8)
    98c6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    98c9:	8b 55 e8             	mov    -0x18(%ebp),%edx
    98cc:	89 d0                	mov    %edx,%eax
    98ce:	c1 e0 03             	shl    $0x3,%eax
    98d1:	01 d0                	add    %edx,%eax
    98d3:	01 c0                	add    %eax,%eax
    98d5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    98d8:	01 d0                	add    %edx,%eax
    98da:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    98dd:	8b 45 0c             	mov    0xc(%ebp),%eax
    98e0:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    98e6:	8b 45 08             	mov    0x8(%ebp),%eax
    98e9:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    98ef:	8b 55 e8             	mov    -0x18(%ebp),%edx
    98f2:	89 d0                	mov    %edx,%eax
    98f4:	c1 e0 03             	shl    $0x3,%eax
    98f7:	01 d0                	add    %edx,%eax
    98f9:	01 c0                	add    %eax,%eax
    98fb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    98fe:	01 d0                	add    %edx,%eax
    9900:	dd 04 c3             	fldl   (%ebx,%eax,8)
    9903:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9906:	89 d0                	mov    %edx,%eax
    9908:	c1 e0 03             	shl    $0x3,%eax
    990b:	01 d0                	add    %edx,%eax
    990d:	01 c0                	add    %eax,%eax
    990f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9912:	01 d0                	add    %edx,%eax
    9914:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    9917:	e9 b0 00 00 00       	jmp    99cc <III_stereo+0xd93>
               }
            }
            else if (i_stereo ) {
    991c:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    9920:	0f 84 94 00 00 00    	je     99ba <III_stereo+0xd81>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    9926:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9929:	8b 55 e8             	mov    -0x18(%ebp),%edx
    992c:	89 d0                	mov    %edx,%eax
    992e:	c1 e0 03             	shl    $0x3,%eax
    9931:	01 d0                	add    %edx,%eax
    9933:	01 c0                	add    %eax,%eax
    9935:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9938:	01 d0                	add    %edx,%eax
    993a:	dd 04 c1             	fldl   (%ecx,%eax,8)
    993d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9940:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9947:	8b 45 f0             	mov    -0x10(%ebp),%eax
    994a:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9951:	d9 e8                	fld1   
    9953:	de c1                	faddp  %st,%st(1)
    9955:	de f9                	fdivrp %st,%st(1)
    9957:	de c9                	fmulp  %st,%st(1)
    9959:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    995c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    995f:	89 d0                	mov    %edx,%eax
    9961:	c1 e0 03             	shl    $0x3,%eax
    9964:	01 d0                	add    %edx,%eax
    9966:	01 c0                	add    %eax,%eax
    9968:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    996b:	01 d0                	add    %edx,%eax
    996d:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    9970:	8b 45 0c             	mov    0xc(%ebp),%eax
    9973:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    9979:	8b 4d 08             	mov    0x8(%ebp),%ecx
    997c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    997f:	89 d0                	mov    %edx,%eax
    9981:	c1 e0 03             	shl    $0x3,%eax
    9984:	01 d0                	add    %edx,%eax
    9986:	01 c0                	add    %eax,%eax
    9988:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    998b:	01 d0                	add    %edx,%eax
    998d:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9990:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9993:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    999a:	d9 e8                	fld1   
    999c:	de c1                	faddp  %st,%st(1)
    999e:	d9 e8                	fld1   
    99a0:	de f1                	fdivp  %st,%st(1)
    99a2:	de c9                	fmulp  %st,%st(1)
    99a4:	8b 55 e8             	mov    -0x18(%ebp),%edx
    99a7:	89 d0                	mov    %edx,%eax
    99a9:	c1 e0 03             	shl    $0x3,%eax
    99ac:	01 d0                	add    %edx,%eax
    99ae:	01 c0                	add    %eax,%eax
    99b0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    99b3:	01 d0                	add    %edx,%eax
    99b5:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    99b8:	eb 12                	jmp    99cc <III_stereo+0xd93>
            }
            else {
               printf(0,"Error in streo processing\n");
    99ba:	83 ec 08             	sub    $0x8,%esp
    99bd:	68 c0 c5 00 00       	push   $0xc5c0
    99c2:	6a 00                	push   $0x0
    99c4:	e8 4a a7 ff ff       	call   4113 <printf>
    99c9:	83 c4 10             	add    $0x10,%esp
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    99cc:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    99d0:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    99d4:	0f 8e ed fd ff ff    	jle    97c7 <III_stereo+0xb8e>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    99da:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    99de:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    99e2:	0f 8e d3 fd ff ff    	jle    97bb <III_stereo+0xb82>
    99e8:	eb 54                	jmp    9a3e <III_stereo+0xe05>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    99ea:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    99f1:	eb 45                	jmp    9a38 <III_stereo+0xdff>
         for(ss=0;ss<SSLIMIT;ss++)
    99f3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    99fa:	eb 32                	jmp    9a2e <III_stereo+0xdf5>
            lr[0][sb][ss] = xr[0][sb][ss];
    99fc:	8b 4d 08             	mov    0x8(%ebp),%ecx
    99ff:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9a02:	89 d0                	mov    %edx,%eax
    9a04:	c1 e0 03             	shl    $0x3,%eax
    9a07:	01 d0                	add    %edx,%eax
    9a09:	01 c0                	add    %eax,%eax
    9a0b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9a0e:	01 d0                	add    %edx,%eax
    9a10:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9a13:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9a16:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9a19:	89 d0                	mov    %edx,%eax
    9a1b:	c1 e0 03             	shl    $0x3,%eax
    9a1e:	01 d0                	add    %edx,%eax
    9a20:	01 c0                	add    %eax,%eax
    9a22:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9a25:	01 d0                	add    %edx,%eax
    9a27:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    9a2a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9a2e:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    9a32:	7e c8                	jle    99fc <III_stereo+0xdc3>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    9a34:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9a38:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    9a3c:	7e b5                	jle    99f3 <III_stereo+0xdba>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    9a3e:	8d 65 f8             	lea    -0x8(%ebp),%esp
    9a41:	5b                   	pop    %ebx
    9a42:	5e                   	pop    %esi
    9a43:	5d                   	pop    %ebp
    9a44:	c3                   	ret    

00009a45 <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    9a45:	55                   	push   %ebp
    9a46:	89 e5                	mov    %esp,%ebp
    9a48:	83 ec 38             	sub    $0x38,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    9a4b:	a1 c0 f3 00 00       	mov    0xf3c0,%eax
    9a50:	85 c0                	test   %eax,%eax
    9a52:	74 72                	je     9ac6 <III_antialias+0x81>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    9a54:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9a5b:	eb 59                	jmp    9ab6 <III_antialias+0x71>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    9a5d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9a60:	dd 04 c5 80 f3 00 00 	fldl   0xf380(,%eax,8)
    9a67:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9a6a:	dd 04 c5 80 f3 00 00 	fldl   0xf380(,%eax,8)
    9a71:	de c9                	fmulp  %st,%st(1)
    9a73:	d9 e8                	fld1   
    9a75:	de c1                	faddp  %st,%st(1)
    9a77:	83 ec 08             	sub    $0x8,%esp
    9a7a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9a7e:	dd 1c 24             	fstpl  (%esp)
    9a81:	e8 e4 ac ff ff       	call   476a <sqrt>
    9a86:	83 c4 10             	add    $0x10,%esp
    9a89:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    9a8c:	d9 e8                	fld1   
    9a8e:	dc 75 e0             	fdivl  -0x20(%ebp)
    9a91:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9a94:	dd 1c c5 80 f4 00 00 	fstpl  0xf480(,%eax,8)
         ca[i] = Ci[i]/sq;
    9a9b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9a9e:	dd 04 c5 80 f3 00 00 	fldl   0xf380(,%eax,8)
    9aa5:	dc 75 e0             	fdivl  -0x20(%ebp)
    9aa8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9aab:	dd 1c c5 c0 f4 00 00 	fstpl  0xf4c0(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    9ab2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9ab6:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    9aba:	7e a1                	jle    9a5d <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    9abc:	c7 05 c0 f3 00 00 00 	movl   $0x0,0xf3c0
    9ac3:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    9ac6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9acd:	eb 4c                	jmp    9b1b <III_antialias+0xd6>
       for(ss=0;ss<SSLIMIT;ss++)
    9acf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9ad6:	eb 39                	jmp    9b11 <III_antialias+0xcc>
          hybridIn[sb][ss] = xr[sb][ss];
    9ad8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9adb:	89 d0                	mov    %edx,%eax
    9add:	c1 e0 03             	shl    $0x3,%eax
    9ae0:	01 d0                	add    %edx,%eax
    9ae2:	c1 e0 04             	shl    $0x4,%eax
    9ae5:	89 c2                	mov    %eax,%edx
    9ae7:	8b 45 0c             	mov    0xc(%ebp),%eax
    9aea:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9aed:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9af0:	89 d0                	mov    %edx,%eax
    9af2:	c1 e0 03             	shl    $0x3,%eax
    9af5:	01 d0                	add    %edx,%eax
    9af7:	c1 e0 04             	shl    $0x4,%eax
    9afa:	89 c2                	mov    %eax,%edx
    9afc:	8b 45 08             	mov    0x8(%ebp),%eax
    9aff:	01 c2                	add    %eax,%edx
    9b01:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9b04:	dd 04 c2             	fldl   (%edx,%eax,8)
    9b07:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9b0a:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    9b0d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9b11:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9b15:	7e c1                	jle    9ad8 <III_antialias+0x93>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    9b17:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9b1b:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    9b1f:	7e ae                	jle    9acf <III_antialias+0x8a>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    9b21:	8b 45 10             	mov    0x10(%ebp),%eax
    9b24:	8b 40 10             	mov    0x10(%eax),%eax
    9b27:	85 c0                	test   %eax,%eax
    9b29:	74 1a                	je     9b45 <III_antialias+0x100>
    9b2b:	8b 45 10             	mov    0x10(%ebp),%eax
    9b2e:	8b 40 14             	mov    0x14(%eax),%eax
    9b31:	83 f8 02             	cmp    $0x2,%eax
    9b34:	75 0f                	jne    9b45 <III_antialias+0x100>
       !gr_info->mixed_block_flag ) return;
    9b36:	8b 45 10             	mov    0x10(%ebp),%eax
    9b39:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    9b3c:	85 c0                	test   %eax,%eax
    9b3e:	75 05                	jne    9b45 <III_antialias+0x100>
       !gr_info->mixed_block_flag ) return;
    9b40:	e9 1c 01 00 00       	jmp    9c61 <III_antialias+0x21c>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9b45:	8b 45 10             	mov    0x10(%ebp),%eax
    9b48:	8b 40 10             	mov    0x10(%eax),%eax
    9b4b:	85 c0                	test   %eax,%eax
    9b4d:	74 1e                	je     9b6d <III_antialias+0x128>
    9b4f:	8b 45 10             	mov    0x10(%ebp),%eax
    9b52:	8b 40 18             	mov    0x18(%eax),%eax
    9b55:	85 c0                	test   %eax,%eax
    9b57:	74 14                	je     9b6d <III_antialias+0x128>
     (gr_info->block_type == 2))
    9b59:	8b 45 10             	mov    0x10(%ebp),%eax
    9b5c:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9b5f:	83 f8 02             	cmp    $0x2,%eax
    9b62:	75 09                	jne    9b6d <III_antialias+0x128>
     (gr_info->block_type == 2))
      sblim = 1;
    9b64:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    9b6b:	eb 07                	jmp    9b74 <III_antialias+0x12f>
   else
      sblim = SBLIMIT-1;
    9b6d:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    9b74:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9b7b:	e9 d5 00 00 00       	jmp    9c55 <III_antialias+0x210>
      for(ss=0;ss<8;ss++) {
    9b80:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9b87:	e9 bb 00 00 00       	jmp    9c47 <III_antialias+0x202>
         bu = xr[sb][17-ss];
    9b8c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9b8f:	89 d0                	mov    %edx,%eax
    9b91:	c1 e0 03             	shl    $0x3,%eax
    9b94:	01 d0                	add    %edx,%eax
    9b96:	c1 e0 04             	shl    $0x4,%eax
    9b99:	89 c2                	mov    %eax,%edx
    9b9b:	8b 45 08             	mov    0x8(%ebp),%eax
    9b9e:	01 c2                	add    %eax,%edx
    9ba0:	b8 11 00 00 00       	mov    $0x11,%eax
    9ba5:	2b 45 f4             	sub    -0xc(%ebp),%eax
    9ba8:	dd 04 c2             	fldl   (%edx,%eax,8)
    9bab:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    9bae:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9bb1:	8d 50 01             	lea    0x1(%eax),%edx
    9bb4:	89 d0                	mov    %edx,%eax
    9bb6:	c1 e0 03             	shl    $0x3,%eax
    9bb9:	01 d0                	add    %edx,%eax
    9bbb:	c1 e0 04             	shl    $0x4,%eax
    9bbe:	89 c2                	mov    %eax,%edx
    9bc0:	8b 45 08             	mov    0x8(%ebp),%eax
    9bc3:	01 c2                	add    %eax,%edx
    9bc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9bc8:	dd 04 c2             	fldl   (%edx,%eax,8)
    9bcb:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    9bce:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9bd1:	89 d0                	mov    %edx,%eax
    9bd3:	c1 e0 03             	shl    $0x3,%eax
    9bd6:	01 d0                	add    %edx,%eax
    9bd8:	c1 e0 04             	shl    $0x4,%eax
    9bdb:	89 c2                	mov    %eax,%edx
    9bdd:	8b 45 0c             	mov    0xc(%ebp),%eax
    9be0:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9be3:	b8 11 00 00 00       	mov    $0x11,%eax
    9be8:	2b 45 f4             	sub    -0xc(%ebp),%eax
    9beb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9bee:	dd 04 d5 80 f4 00 00 	fldl   0xf480(,%edx,8)
    9bf5:	dc 4d d8             	fmull  -0x28(%ebp)
    9bf8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9bfb:	dd 04 d5 c0 f4 00 00 	fldl   0xf4c0(,%edx,8)
    9c02:	dc 4d d0             	fmull  -0x30(%ebp)
    9c05:	de e9                	fsubrp %st,%st(1)
    9c07:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    9c0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9c0d:	8d 50 01             	lea    0x1(%eax),%edx
    9c10:	89 d0                	mov    %edx,%eax
    9c12:	c1 e0 03             	shl    $0x3,%eax
    9c15:	01 d0                	add    %edx,%eax
    9c17:	c1 e0 04             	shl    $0x4,%eax
    9c1a:	89 c2                	mov    %eax,%edx
    9c1c:	8b 45 0c             	mov    0xc(%ebp),%eax
    9c1f:	01 c2                	add    %eax,%edx
    9c21:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9c24:	dd 04 c5 80 f4 00 00 	fldl   0xf480(,%eax,8)
    9c2b:	dc 4d d0             	fmull  -0x30(%ebp)
    9c2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9c31:	dd 04 c5 c0 f4 00 00 	fldl   0xf4c0(,%eax,8)
    9c38:	dc 4d d8             	fmull  -0x28(%ebp)
    9c3b:	de c1                	faddp  %st,%st(1)
    9c3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9c40:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    9c43:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9c47:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    9c4b:	0f 8e 3b ff ff ff    	jle    9b8c <III_antialias+0x147>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    9c51:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9c55:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9c58:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    9c5b:	0f 8c 1f ff ff ff    	jl     9b80 <III_antialias+0x13b>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    9c61:	c9                   	leave  
    9c62:	c3                   	ret    

00009c63 <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    9c63:	55                   	push   %ebp
    9c64:	89 e5                	mov    %esp,%ebp
    9c66:	81 ec 98 00 00 00    	sub    $0x98,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    9c6c:	a1 00 f5 00 00       	mov    0xf500,%eax
    9c71:	85 c0                	test   %eax,%eax
    9c73:	0f 85 9f 02 00 00    	jne    9f18 <inv_mdct+0x2b5>

    /* type 0 */
      for(i=0;i<36;i++)
    9c79:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9c80:	eb 33                	jmp    9cb5 <inv_mdct+0x52>
         win[0][i] = sin( PI/36 *(i+0.5) );
    9c82:	db 45 f4             	fildl  -0xc(%ebp)
    9c85:	dd 05 50 d6 00 00    	fldl   0xd650
    9c8b:	de c1                	faddp  %st,%st(1)
    9c8d:	dd 05 58 d6 00 00    	fldl   0xd658
    9c93:	de c9                	fmulp  %st,%st(1)
    9c95:	83 ec 08             	sub    $0x8,%esp
    9c98:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9c9c:	dd 1c 24             	fstpl  (%esp)
    9c9f:	e8 38 a8 ff ff       	call   44dc <sin>
    9ca4:	83 c4 10             	add    $0x10,%esp
    9ca7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9caa:	dd 1c c5 40 f5 00 00 	fstpl  0xf540(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    9cb1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9cb5:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9cb9:	7e c7                	jle    9c82 <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    9cbb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9cc2:	eb 36                	jmp    9cfa <inv_mdct+0x97>
         win[1][i] = sin( PI/36 *(i+0.5) );
    9cc4:	db 45 f4             	fildl  -0xc(%ebp)
    9cc7:	dd 05 50 d6 00 00    	fldl   0xd650
    9ccd:	de c1                	faddp  %st,%st(1)
    9ccf:	dd 05 58 d6 00 00    	fldl   0xd658
    9cd5:	de c9                	fmulp  %st,%st(1)
    9cd7:	83 ec 08             	sub    $0x8,%esp
    9cda:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9cde:	dd 1c 24             	fstpl  (%esp)
    9ce1:	e8 f6 a7 ff ff       	call   44dc <sin>
    9ce6:	83 c4 10             	add    $0x10,%esp
    9ce9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9cec:	83 c0 24             	add    $0x24,%eax
    9cef:	dd 1c c5 40 f5 00 00 	fstpl  0xf540(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    9cf6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9cfa:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9cfe:	7e c4                	jle    9cc4 <inv_mdct+0x61>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    9d00:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    9d07:	eb 13                	jmp    9d1c <inv_mdct+0xb9>
         win[1][i] = 1.0;
    9d09:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d0c:	83 c0 24             	add    $0x24,%eax
    9d0f:	d9 e8                	fld1   
    9d11:	dd 1c c5 40 f5 00 00 	fstpl  0xf540(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    9d18:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9d1c:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    9d20:	7e e7                	jle    9d09 <inv_mdct+0xa6>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    9d22:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    9d29:	eb 3e                	jmp    9d69 <inv_mdct+0x106>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    9d2b:	db 45 f4             	fildl  -0xc(%ebp)
    9d2e:	dd 05 50 d6 00 00    	fldl   0xd650
    9d34:	de c1                	faddp  %st,%st(1)
    9d36:	dd 05 60 d6 00 00    	fldl   0xd660
    9d3c:	de e9                	fsubrp %st,%st(1)
    9d3e:	dd 05 40 d6 00 00    	fldl   0xd640
    9d44:	de c9                	fmulp  %st,%st(1)
    9d46:	83 ec 08             	sub    $0x8,%esp
    9d49:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9d4d:	dd 1c 24             	fstpl  (%esp)
    9d50:	e8 87 a7 ff ff       	call   44dc <sin>
    9d55:	83 c4 10             	add    $0x10,%esp
    9d58:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d5b:	83 c0 24             	add    $0x24,%eax
    9d5e:	dd 1c c5 40 f5 00 00 	fstpl  0xf540(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    9d65:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9d69:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    9d6d:	7e bc                	jle    9d2b <inv_mdct+0xc8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    9d6f:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    9d76:	eb 13                	jmp    9d8b <inv_mdct+0x128>
         win[1][i] = 0.0;
    9d78:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d7b:	83 c0 24             	add    $0x24,%eax
    9d7e:	d9 ee                	fldz   
    9d80:	dd 1c c5 40 f5 00 00 	fstpl  0xf540(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    9d87:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9d8b:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9d8f:	7e e7                	jle    9d78 <inv_mdct+0x115>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    9d91:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9d98:	eb 13                	jmp    9dad <inv_mdct+0x14a>
         win[3][i] = 0.0;
    9d9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d9d:	83 c0 6c             	add    $0x6c,%eax
    9da0:	d9 ee                	fldz   
    9da2:	dd 1c c5 40 f5 00 00 	fstpl  0xf540(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    9da9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9dad:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    9db1:	7e e7                	jle    9d9a <inv_mdct+0x137>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    9db3:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    9dba:	eb 3e                	jmp    9dfa <inv_mdct+0x197>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    9dbc:	db 45 f4             	fildl  -0xc(%ebp)
    9dbf:	dd 05 50 d6 00 00    	fldl   0xd650
    9dc5:	de c1                	faddp  %st,%st(1)
    9dc7:	dd 05 68 d6 00 00    	fldl   0xd668
    9dcd:	de e9                	fsubrp %st,%st(1)
    9dcf:	dd 05 40 d6 00 00    	fldl   0xd640
    9dd5:	de c9                	fmulp  %st,%st(1)
    9dd7:	83 ec 08             	sub    $0x8,%esp
    9dda:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9dde:	dd 1c 24             	fstpl  (%esp)
    9de1:	e8 f6 a6 ff ff       	call   44dc <sin>
    9de6:	83 c4 10             	add    $0x10,%esp
    9de9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9dec:	83 c0 6c             	add    $0x6c,%eax
    9def:	dd 1c c5 40 f5 00 00 	fstpl  0xf540(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    9df6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9dfa:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    9dfe:	7e bc                	jle    9dbc <inv_mdct+0x159>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    9e00:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    9e07:	eb 13                	jmp    9e1c <inv_mdct+0x1b9>
         win[3][i] =1.0;
    9e09:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9e0c:	83 c0 6c             	add    $0x6c,%eax
    9e0f:	d9 e8                	fld1   
    9e11:	dd 1c c5 40 f5 00 00 	fstpl  0xf540(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    9e18:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9e1c:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9e20:	7e e7                	jle    9e09 <inv_mdct+0x1a6>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    9e22:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    9e29:	eb 36                	jmp    9e61 <inv_mdct+0x1fe>
         win[3][i] = sin( PI/36*(i+0.5) );
    9e2b:	db 45 f4             	fildl  -0xc(%ebp)
    9e2e:	dd 05 50 d6 00 00    	fldl   0xd650
    9e34:	de c1                	faddp  %st,%st(1)
    9e36:	dd 05 58 d6 00 00    	fldl   0xd658
    9e3c:	de c9                	fmulp  %st,%st(1)
    9e3e:	83 ec 08             	sub    $0x8,%esp
    9e41:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9e45:	dd 1c 24             	fstpl  (%esp)
    9e48:	e8 8f a6 ff ff       	call   44dc <sin>
    9e4d:	83 c4 10             	add    $0x10,%esp
    9e50:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9e53:	83 c0 6c             	add    $0x6c,%eax
    9e56:	dd 1c c5 40 f5 00 00 	fstpl  0xf540(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    9e5d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9e61:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9e65:	7e c4                	jle    9e2b <inv_mdct+0x1c8>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    9e67:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9e6e:	eb 36                	jmp    9ea6 <inv_mdct+0x243>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    9e70:	db 45 f4             	fildl  -0xc(%ebp)
    9e73:	dd 05 50 d6 00 00    	fldl   0xd650
    9e79:	de c1                	faddp  %st,%st(1)
    9e7b:	dd 05 40 d6 00 00    	fldl   0xd640
    9e81:	de c9                	fmulp  %st,%st(1)
    9e83:	83 ec 08             	sub    $0x8,%esp
    9e86:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9e8a:	dd 1c 24             	fstpl  (%esp)
    9e8d:	e8 4a a6 ff ff       	call   44dc <sin>
    9e92:	83 c4 10             	add    $0x10,%esp
    9e95:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9e98:	83 c0 48             	add    $0x48,%eax
    9e9b:	dd 1c c5 40 f5 00 00 	fstpl  0xf540(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    9ea2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9ea6:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    9eaa:	7e c4                	jle    9e70 <inv_mdct+0x20d>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    9eac:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    9eb3:	eb 13                	jmp    9ec8 <inv_mdct+0x265>
         win[2][i] = 0.0 ;
    9eb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9eb8:	83 c0 48             	add    $0x48,%eax
    9ebb:	d9 ee                	fldz   
    9ebd:	dd 1c c5 40 f5 00 00 	fstpl  0xf540(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    9ec4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9ec8:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9ecc:	7e e7                	jle    9eb5 <inv_mdct+0x252>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    9ece:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9ed5:	eb 2b                	jmp    9f02 <inv_mdct+0x29f>
         COS[i] = cos(PI/(2*36) * i);
    9ed7:	db 45 f4             	fildl  -0xc(%ebp)
    9eda:	dd 05 70 d6 00 00    	fldl   0xd670
    9ee0:	de c9                	fmulp  %st,%st(1)
    9ee2:	83 ec 08             	sub    $0x8,%esp
    9ee5:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9ee9:	dd 1c 24             	fstpl  (%esp)
    9eec:	e8 8a a6 ff ff       	call   457b <cos>
    9ef1:	83 c4 10             	add    $0x10,%esp
    9ef4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9ef7:	dd 1c c5 c0 f9 00 00 	fstpl  0xf9c0(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    9efe:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9f02:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    9f09:	7e cc                	jle    9ed7 <inv_mdct+0x274>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    9f0b:	a1 00 f5 00 00       	mov    0xf500,%eax
    9f10:	83 c0 01             	add    $0x1,%eax
    9f13:	a3 00 f5 00 00       	mov    %eax,0xf500
    }

    for(i=0;i<36;i++)
    9f18:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9f1f:	eb 17                	jmp    9f38 <inv_mdct+0x2d5>
       out[i]=0;
    9f21:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f24:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9f2b:	8b 45 0c             	mov    0xc(%ebp),%eax
    9f2e:	01 d0                	add    %edx,%eax
    9f30:	d9 ee                	fldz   
    9f32:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    9f34:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9f38:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9f3c:	7e e3                	jle    9f21 <inv_mdct+0x2be>
       out[i]=0;

    if(block_type == 2){
    9f3e:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    9f42:	0f 85 8f 01 00 00    	jne    a0d7 <inv_mdct+0x474>
       N=12;
    9f48:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    9f4f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9f56:	e9 6d 01 00 00       	jmp    a0c8 <inv_mdct+0x465>
          for(p= 0;p<N;p++){
    9f5b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9f62:	e9 e9 00 00 00       	jmp    a050 <inv_mdct+0x3ed>
             sum = 0.0;
    9f67:	d9 ee                	fldz   
    9f69:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    9f6c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9f73:	e9 99 00 00 00       	jmp    a011 <inv_mdct+0x3ae>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    9f78:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9f7b:	89 d0                	mov    %edx,%eax
    9f7d:	01 c0                	add    %eax,%eax
    9f7f:	01 c2                	add    %eax,%edx
    9f81:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f84:	01 d0                	add    %edx,%eax
    9f86:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9f8d:	8b 45 08             	mov    0x8(%ebp),%eax
    9f90:	01 d0                	add    %edx,%eax
    9f92:	dd 00                	fldl   (%eax)
    9f94:	dd 9d 70 ff ff ff    	fstpl  -0x90(%ebp)
    9f9a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9f9d:	01 c0                	add    %eax,%eax
    9f9f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    9fa5:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    9fab:	dd 05 78 d6 00 00    	fldl   0xd678
    9fb1:	de f1                	fdivp  %st,%st(1)
    9fb3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9fb6:	01 c0                	add    %eax,%eax
    9fb8:	8d 50 01             	lea    0x1(%eax),%edx
    9fbb:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9fbe:	89 c1                	mov    %eax,%ecx
    9fc0:	c1 e9 1f             	shr    $0x1f,%ecx
    9fc3:	01 c8                	add    %ecx,%eax
    9fc5:	d1 f8                	sar    %eax
    9fc7:	01 d0                	add    %edx,%eax
    9fc9:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    9fcf:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    9fd5:	de c9                	fmulp  %st,%st(1)
    9fd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9fda:	01 c0                	add    %eax,%eax
    9fdc:	83 c0 01             	add    $0x1,%eax
    9fdf:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    9fe5:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    9feb:	de c9                	fmulp  %st,%st(1)
    9fed:	83 ec 08             	sub    $0x8,%esp
    9ff0:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9ff4:	dd 1c 24             	fstpl  (%esp)
    9ff7:	e8 7f a5 ff ff       	call   457b <cos>
    9ffc:	83 c4 10             	add    $0x10,%esp
    9fff:	dc 8d 70 ff ff ff    	fmull  -0x90(%ebp)
    a005:	dd 45 e0             	fldl   -0x20(%ebp)
    a008:	de c1                	faddp  %st,%st(1)
    a00a:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    a00d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a011:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a014:	89 c2                	mov    %eax,%edx
    a016:	c1 ea 1f             	shr    $0x1f,%edx
    a019:	01 d0                	add    %edx,%eax
    a01b:	d1 f8                	sar    %eax
    a01d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a020:	0f 8f 52 ff ff ff    	jg     9f78 <inv_mdct+0x315>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    a026:	8b 55 10             	mov    0x10(%ebp),%edx
    a029:	89 d0                	mov    %edx,%eax
    a02b:	c1 e0 03             	shl    $0x3,%eax
    a02e:	01 d0                	add    %edx,%eax
    a030:	c1 e0 02             	shl    $0x2,%eax
    a033:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a036:	01 d0                	add    %edx,%eax
    a038:	dd 04 c5 40 f5 00 00 	fldl   0xf540(,%eax,8)
    a03f:	dc 4d e0             	fmull  -0x20(%ebp)
    a042:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a045:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    a04c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a050:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a053:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a056:	0f 8c 0b ff ff ff    	jl     9f67 <inv_mdct+0x304>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    a05c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a063:	eb 57                	jmp    a0bc <inv_mdct+0x459>
             out[6*i+p+6] += tmp[p];
    a065:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a068:	89 d0                	mov    %edx,%eax
    a06a:	01 c0                	add    %eax,%eax
    a06c:	01 d0                	add    %edx,%eax
    a06e:	01 c0                	add    %eax,%eax
    a070:	89 c2                	mov    %eax,%edx
    a072:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a075:	01 d0                	add    %edx,%eax
    a077:	83 c0 06             	add    $0x6,%eax
    a07a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a081:	8b 45 0c             	mov    0xc(%ebp),%eax
    a084:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a087:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a08a:	89 d0                	mov    %edx,%eax
    a08c:	01 c0                	add    %eax,%eax
    a08e:	01 d0                	add    %edx,%eax
    a090:	01 c0                	add    %eax,%eax
    a092:	89 c2                	mov    %eax,%edx
    a094:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a097:	01 d0                	add    %edx,%eax
    a099:	83 c0 06             	add    $0x6,%eax
    a09c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a0a3:	8b 45 0c             	mov    0xc(%ebp),%eax
    a0a6:	01 d0                	add    %edx,%eax
    a0a8:	dd 00                	fldl   (%eax)
    a0aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a0ad:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    a0b4:	de c1                	faddp  %st,%st(1)
    a0b6:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    a0b8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a0bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a0bf:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a0c2:	7c a1                	jl     a065 <inv_mdct+0x402>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    a0c4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a0c8:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    a0cc:	0f 8e 89 fe ff ff    	jle    9f5b <inv_mdct+0x2f8>
    a0d2:	e9 da 00 00 00       	jmp    a1b1 <inv_mdct+0x54e>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    a0d7:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    a0de:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a0e5:	e9 bb 00 00 00       	jmp    a1a5 <inv_mdct+0x542>
         sum = 0.0;
    a0ea:	d9 ee                	fldz   
    a0ec:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    a0ef:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a0f6:	eb 6a                	jmp    a162 <inv_mdct+0x4ff>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    a0f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a0fb:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a102:	8b 45 08             	mov    0x8(%ebp),%eax
    a105:	01 d0                	add    %edx,%eax
    a107:	dd 00                	fldl   (%eax)
    a109:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a10c:	01 c0                	add    %eax,%eax
    a10e:	8d 50 01             	lea    0x1(%eax),%edx
    a111:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a114:	89 c1                	mov    %eax,%ecx
    a116:	c1 e9 1f             	shr    $0x1f,%ecx
    a119:	01 c8                	add    %ecx,%eax
    a11b:	d1 f8                	sar    %eax
    a11d:	01 c2                	add    %eax,%edx
    a11f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a122:	01 c0                	add    %eax,%eax
    a124:	83 c0 01             	add    $0x1,%eax
    a127:	89 d1                	mov    %edx,%ecx
    a129:	0f af c8             	imul   %eax,%ecx
    a12c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a131:	89 c8                	mov    %ecx,%eax
    a133:	f7 ea                	imul   %edx
    a135:	c1 fa 05             	sar    $0x5,%edx
    a138:	89 c8                	mov    %ecx,%eax
    a13a:	c1 f8 1f             	sar    $0x1f,%eax
    a13d:	29 c2                	sub    %eax,%edx
    a13f:	89 d0                	mov    %edx,%eax
    a141:	c1 e0 03             	shl    $0x3,%eax
    a144:	01 d0                	add    %edx,%eax
    a146:	c1 e0 04             	shl    $0x4,%eax
    a149:	29 c1                	sub    %eax,%ecx
    a14b:	89 ca                	mov    %ecx,%edx
    a14d:	dd 04 d5 c0 f9 00 00 	fldl   0xf9c0(,%edx,8)
    a154:	de c9                	fmulp  %st,%st(1)
    a156:	dd 45 e0             	fldl   -0x20(%ebp)
    a159:	de c1                	faddp  %st,%st(1)
    a15b:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    a15e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a162:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a165:	89 c2                	mov    %eax,%edx
    a167:	c1 ea 1f             	shr    $0x1f,%edx
    a16a:	01 d0                	add    %edx,%eax
    a16c:	d1 f8                	sar    %eax
    a16e:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a171:	7f 85                	jg     a0f8 <inv_mdct+0x495>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    a173:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a176:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a17d:	8b 45 0c             	mov    0xc(%ebp),%eax
    a180:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a183:	8b 55 10             	mov    0x10(%ebp),%edx
    a186:	89 d0                	mov    %edx,%eax
    a188:	c1 e0 03             	shl    $0x3,%eax
    a18b:	01 d0                	add    %edx,%eax
    a18d:	c1 e0 02             	shl    $0x2,%eax
    a190:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a193:	01 d0                	add    %edx,%eax
    a195:	dd 04 c5 40 f5 00 00 	fldl   0xf540(,%eax,8)
    a19c:	dc 4d e0             	fmull  -0x20(%ebp)
    a19f:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    a1a1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a1a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a1a8:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a1ab:	0f 8c 39 ff ff ff    	jl     a0ea <inv_mdct+0x487>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    a1b1:	c9                   	leave  
    a1b2:	c3                   	ret    

0000a1b3 <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    a1b3:	55                   	push   %ebp
    a1b4:	89 e5                	mov    %esp,%ebp
    a1b6:	53                   	push   %ebx
    a1b7:	81 ec 44 01 00 00    	sub    $0x144,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    a1bd:	a1 c4 f3 00 00       	mov    0xf3c4,%eax
    a1c2:	85 c0                	test   %eax,%eax
    a1c4:	74 6f                	je     a235 <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    a1c6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a1cd:	eb 56                	jmp    a225 <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    a1cf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a1d6:	eb 43                	jmp    a21b <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    a1d8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a1df:	eb 30                	jmp    a211 <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    a1e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a1e4:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a1e7:	89 c2                	mov    %eax,%edx
    a1e9:	c1 e2 03             	shl    $0x3,%edx
    a1ec:	01 c2                	add    %eax,%edx
    a1ee:	8d 04 12             	lea    (%edx,%edx,1),%eax
    a1f1:	89 c2                	mov    %eax,%edx
    a1f3:	89 c8                	mov    %ecx,%eax
    a1f5:	c1 e0 03             	shl    $0x3,%eax
    a1f8:	01 c8                	add    %ecx,%eax
    a1fa:	c1 e0 06             	shl    $0x6,%eax
    a1fd:	01 c2                	add    %eax,%edx
    a1ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a202:	01 d0                	add    %edx,%eax
    a204:	d9 ee                	fldz   
    a206:	dd 1c c5 40 fe 00 00 	fstpl  0xfe40(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    a20d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a211:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    a215:	7e ca                	jle    a1e1 <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    a217:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a21b:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    a21f:	7e b7                	jle    a1d8 <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    a221:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a225:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    a229:	7e a4                	jle    a1cf <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    a22b:	c7 05 c4 f3 00 00 00 	movl   $0x0,0xf3c4
    a232:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    a235:	8b 45 18             	mov    0x18(%ebp),%eax
    a238:	8b 40 10             	mov    0x10(%eax),%eax
    a23b:	85 c0                	test   %eax,%eax
    a23d:	74 10                	je     a24f <III_hybrid+0x9c>
    a23f:	8b 45 18             	mov    0x18(%ebp),%eax
    a242:	8b 40 18             	mov    0x18(%eax),%eax
    a245:	85 c0                	test   %eax,%eax
    a247:	74 06                	je     a24f <III_hybrid+0x9c>
    a249:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    a24d:	7e 08                	jle    a257 <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    a24f:	8b 45 18             	mov    0x18(%ebp),%eax
    a252:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    a255:	eb 05                	jmp    a25c <III_hybrid+0xa9>
    a257:	b8 00 00 00 00       	mov    $0x0,%eax
    a25c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    a25f:	83 ec 04             	sub    $0x4,%esp
    a262:	ff 75 e4             	pushl  -0x1c(%ebp)
    a265:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    a26b:	50                   	push   %eax
    a26c:	ff 75 08             	pushl  0x8(%ebp)
    a26f:	e8 ef f9 ff ff       	call   9c63 <inv_mdct>
    a274:	83 c4 10             	add    $0x10,%esp

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    a277:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a27e:	e9 83 00 00 00       	jmp    a306 <III_hybrid+0x153>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    a283:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a286:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a28d:	8b 45 0c             	mov    0xc(%ebp),%eax
    a290:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    a293:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a296:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    a29d:	8b 45 10             	mov    0x10(%ebp),%eax
    a2a0:	8b 4d 14             	mov    0x14(%ebp),%ecx
    a2a3:	89 c2                	mov    %eax,%edx
    a2a5:	c1 e2 03             	shl    $0x3,%edx
    a2a8:	01 c2                	add    %eax,%edx
    a2aa:	8d 04 12             	lea    (%edx,%edx,1),%eax
    a2ad:	89 c2                	mov    %eax,%edx
    a2af:	89 c8                	mov    %ecx,%eax
    a2b1:	c1 e0 03             	shl    $0x3,%eax
    a2b4:	01 c8                	add    %ecx,%eax
    a2b6:	c1 e0 06             	shl    $0x6,%eax
    a2b9:	01 c2                	add    %eax,%edx
    a2bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a2be:	01 d0                	add    %edx,%eax
    a2c0:	dd 04 c5 40 fe 00 00 	fldl   0xfe40(,%eax,8)
    a2c7:	de c1                	faddp  %st,%st(1)
    a2c9:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    a2cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a2ce:	83 c0 12             	add    $0x12,%eax
    a2d1:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    a2d8:	8b 45 10             	mov    0x10(%ebp),%eax
    a2db:	8b 4d 14             	mov    0x14(%ebp),%ecx
    a2de:	89 c2                	mov    %eax,%edx
    a2e0:	c1 e2 03             	shl    $0x3,%edx
    a2e3:	01 c2                	add    %eax,%edx
    a2e5:	8d 04 12             	lea    (%edx,%edx,1),%eax
    a2e8:	89 c2                	mov    %eax,%edx
    a2ea:	89 c8                	mov    %ecx,%eax
    a2ec:	c1 e0 03             	shl    $0x3,%eax
    a2ef:	01 c8                	add    %ecx,%eax
    a2f1:	c1 e0 06             	shl    $0x6,%eax
    a2f4:	01 c2                	add    %eax,%edx
    a2f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a2f9:	01 d0                	add    %edx,%eax
    a2fb:	dd 1c c5 40 fe 00 00 	fstpl  0xfe40(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    a302:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a306:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a30a:	0f 8e 73 ff ff ff    	jle    a283 <III_hybrid+0xd0>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    a310:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    a313:	c9                   	leave  
    a314:	c3                   	ret    

0000a315 <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    a315:	55                   	push   %ebp
    a316:	89 e5                	mov    %esp,%ebp
    a318:	57                   	push   %edi
    a319:	56                   	push   %esi
    a31a:	53                   	push   %ebx
    a31b:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    a31e:	be 00 00 00 00       	mov    $0x0,%esi
    a323:	e9 1a 01 00 00       	jmp    a442 <create_syn_filter+0x12d>
		for (k=0; k<32; k++) {
    a328:	bb 00 00 00 00       	mov    $0x0,%ebx
    a32d:	e9 04 01 00 00       	jmp    a436 <create_syn_filter+0x121>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    a332:	89 f0                	mov    %esi,%eax
    a334:	c1 e0 08             	shl    $0x8,%eax
    a337:	89 c2                	mov    %eax,%edx
    a339:	8b 45 08             	mov    0x8(%ebp),%eax
    a33c:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    a33f:	89 75 dc             	mov    %esi,-0x24(%ebp)
    a342:	db 45 dc             	fildl  -0x24(%ebp)
    a345:	dd 05 80 d6 00 00    	fldl   0xd680
    a34b:	de c9                	fmulp  %st,%st(1)
    a34d:	dd 05 88 d6 00 00    	fldl   0xd688
    a353:	de c1                	faddp  %st,%st(1)
    a355:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    a358:	83 c0 01             	add    $0x1,%eax
    a35b:	89 45 dc             	mov    %eax,-0x24(%ebp)
    a35e:	db 45 dc             	fildl  -0x24(%ebp)
    a361:	de c9                	fmulp  %st,%st(1)
    a363:	83 ec 08             	sub    $0x8,%esp
    a366:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    a36a:	dd 1c 24             	fstpl  (%esp)
    a36d:	e8 09 a2 ff ff       	call   457b <cos>
    a372:	83 c4 10             	add    $0x10,%esp
    a375:	dd 05 90 d6 00 00    	fldl   0xd690
    a37b:	de c9                	fmulp  %st,%st(1)
    a37d:	dd 1c df             	fstpl  (%edi,%ebx,8)
    a380:	dd 04 df             	fldl   (%edi,%ebx,8)
    a383:	d9 ee                	fldz   
    a385:	d9 c9                	fxch   %st(1)
    a387:	df e9                	fucomip %st(1),%st
    a389:	dd d8                	fstp   %st(0)
    a38b:	72 41                	jb     a3ce <create_syn_filter+0xb9>
				filter[i][k] = (int)(filter[i][k]+0.5);
    a38d:	89 f0                	mov    %esi,%eax
    a38f:	c1 e0 08             	shl    $0x8,%eax
    a392:	89 c2                	mov    %eax,%edx
    a394:	8b 45 08             	mov    0x8(%ebp),%eax
    a397:	01 c2                	add    %eax,%edx
    a399:	89 f0                	mov    %esi,%eax
    a39b:	c1 e0 08             	shl    $0x8,%eax
    a39e:	89 c1                	mov    %eax,%ecx
    a3a0:	8b 45 08             	mov    0x8(%ebp),%eax
    a3a3:	01 c8                	add    %ecx,%eax
    a3a5:	dd 04 d8             	fldl   (%eax,%ebx,8)
    a3a8:	dd 05 50 d6 00 00    	fldl   0xd650
    a3ae:	de c1                	faddp  %st,%st(1)
    a3b0:	d9 7d e6             	fnstcw -0x1a(%ebp)
    a3b3:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    a3b7:	b4 0c                	mov    $0xc,%ah
    a3b9:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    a3bd:	d9 6d e4             	fldcw  -0x1c(%ebp)
    a3c0:	db 5d dc             	fistpl -0x24(%ebp)
    a3c3:	d9 6d e6             	fldcw  -0x1a(%ebp)
    a3c6:	db 45 dc             	fildl  -0x24(%ebp)
    a3c9:	dd 1c da             	fstpl  (%edx,%ebx,8)
    a3cc:	eb 3f                	jmp    a40d <create_syn_filter+0xf8>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    a3ce:	89 f0                	mov    %esi,%eax
    a3d0:	c1 e0 08             	shl    $0x8,%eax
    a3d3:	89 c2                	mov    %eax,%edx
    a3d5:	8b 45 08             	mov    0x8(%ebp),%eax
    a3d8:	01 c2                	add    %eax,%edx
    a3da:	89 f0                	mov    %esi,%eax
    a3dc:	c1 e0 08             	shl    $0x8,%eax
    a3df:	89 c1                	mov    %eax,%ecx
    a3e1:	8b 45 08             	mov    0x8(%ebp),%eax
    a3e4:	01 c8                	add    %ecx,%eax
    a3e6:	dd 04 d8             	fldl   (%eax,%ebx,8)
    a3e9:	dd 05 50 d6 00 00    	fldl   0xd650
    a3ef:	de e9                	fsubrp %st,%st(1)
    a3f1:	d9 7d e6             	fnstcw -0x1a(%ebp)
    a3f4:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    a3f8:	b4 0c                	mov    $0xc,%ah
    a3fa:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    a3fe:	d9 6d e4             	fldcw  -0x1c(%ebp)
    a401:	db 5d dc             	fistpl -0x24(%ebp)
    a404:	d9 6d e6             	fldcw  -0x1a(%ebp)
    a407:	db 45 dc             	fildl  -0x24(%ebp)
    a40a:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    a40d:	89 f0                	mov    %esi,%eax
    a40f:	c1 e0 08             	shl    $0x8,%eax
    a412:	89 c2                	mov    %eax,%edx
    a414:	8b 45 08             	mov    0x8(%ebp),%eax
    a417:	01 d0                	add    %edx,%eax
    a419:	89 f2                	mov    %esi,%edx
    a41b:	89 d1                	mov    %edx,%ecx
    a41d:	c1 e1 08             	shl    $0x8,%ecx
    a420:	8b 55 08             	mov    0x8(%ebp),%edx
    a423:	01 ca                	add    %ecx,%edx
    a425:	dd 04 da             	fldl   (%edx,%ebx,8)
    a428:	dd 05 98 d6 00 00    	fldl   0xd698
    a42e:	de c9                	fmulp  %st,%st(1)
    a430:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    a433:	83 c3 01             	add    $0x1,%ebx
    a436:	83 fb 1f             	cmp    $0x1f,%ebx
    a439:	0f 8e f3 fe ff ff    	jle    a332 <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    a43f:	83 c6 01             	add    $0x1,%esi
    a442:	83 fe 3f             	cmp    $0x3f,%esi
    a445:	0f 8e dd fe ff ff    	jle    a328 <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    a44b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a44e:	5b                   	pop    %ebx
    a44f:	5e                   	pop    %esi
    a450:	5f                   	pop    %edi
    a451:	5d                   	pop    %ebp
    a452:	c3                   	ret    

0000a453 <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    a453:	55                   	push   %ebp
    a454:	89 e5                	mov    %esp,%ebp
    a456:	57                   	push   %edi
    a457:	56                   	push   %esi
    a458:	53                   	push   %ebx
    a459:	81 ec 04 10 00 00    	sub    $0x1004,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    a45f:	8d 85 f0 ef ff ff    	lea    -0x1010(%ebp),%eax
    a465:	bb 00 c6 00 00       	mov    $0xc600,%ebx
    a46a:	ba 00 04 00 00       	mov    $0x400,%edx
    a46f:	89 c7                	mov    %eax,%edi
    a471:	89 de                	mov    %ebx,%esi
    a473:	89 d1                	mov    %edx,%ecx
    a475:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    a477:	8d 85 f0 ef ff ff    	lea    -0x1010(%ebp),%eax
    a47d:	89 45 08             	mov    %eax,0x8(%ebp)
}
    a480:	81 c4 04 10 00 00    	add    $0x1004,%esp
    a486:	5b                   	pop    %ebx
    a487:	5e                   	pop    %esi
    a488:	5f                   	pop    %edi
    a489:	5d                   	pop    %ebp
    a48a:	c3                   	ret    

0000a48b <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    a48b:	55                   	push   %ebp
    a48c:	89 e5                	mov    %esp,%ebp
    a48e:	57                   	push   %edi
    a48f:	56                   	push   %esi
    a490:	53                   	push   %ebx
    a491:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    a494:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    a49b:	a1 c8 f3 00 00       	mov    0xf3c8,%eax
    a4a0:	85 c0                	test   %eax,%eax
    a4a2:	74 7a                	je     a51e <SubBandSynthesis+0x93>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    a4a4:	83 ec 08             	sub    $0x8,%esp
    a4a7:	68 00 d6 00 00       	push   $0xd600
    a4ac:	68 00 40 00 00       	push   $0x4000
    a4b1:	e8 af a7 ff ff       	call   4c65 <mem_alloc>
    a4b6:	83 c4 10             	add    $0x10,%esp
    a4b9:	a3 40 22 01 00       	mov    %eax,0x12240
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    a4be:	83 ec 08             	sub    $0x8,%esp
    a4c1:	68 03 d6 00 00       	push   $0xd603
    a4c6:	68 00 40 00 00       	push   $0x4000
    a4cb:	e8 95 a7 ff ff       	call   4c65 <mem_alloc>
    a4d0:	83 c4 10             	add    $0x10,%esp
    a4d3:	a3 44 22 01 00       	mov    %eax,0x12244
		create_syn_filter(*filter);
    a4d8:	a1 44 22 01 00       	mov    0x12244,%eax
    a4dd:	83 ec 0c             	sub    $0xc,%esp
    a4e0:	50                   	push   %eax
    a4e1:	e8 2f fe ff ff       	call   a315 <create_syn_filter>
    a4e6:	83 c4 10             	add    $0x10,%esp
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    a4e9:	83 ec 08             	sub    $0x8,%esp
    a4ec:	68 06 d6 00 00       	push   $0xd606
    a4f1:	68 00 10 00 00       	push   $0x1000
    a4f6:	e8 6a a7 ff ff       	call   4c65 <mem_alloc>
    a4fb:	83 c4 10             	add    $0x10,%esp
    a4fe:	a3 48 22 01 00       	mov    %eax,0x12248
		read_syn_window(window);
    a503:	a1 48 22 01 00       	mov    0x12248,%eax
    a508:	83 ec 0c             	sub    $0xc,%esp
    a50b:	50                   	push   %eax
    a50c:	e8 42 ff ff ff       	call   a453 <read_syn_window>
    a511:	83 c4 10             	add    $0x10,%esp
		init = 0;
    a514:	c7 05 c8 f3 00 00 00 	movl   $0x0,0xf3c8
    a51b:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    a51e:	8b 45 0c             	mov    0xc(%ebp),%eax
    a521:	8b 04 85 cc f3 00 00 	mov    0xf3cc(,%eax,4),%eax
    a528:	83 e8 40             	sub    $0x40,%eax
    a52b:	25 ff 03 00 00       	and    $0x3ff,%eax
    a530:	89 c2                	mov    %eax,%edx
    a532:	8b 45 0c             	mov    0xc(%ebp),%eax
    a535:	89 14 85 cc f3 00 00 	mov    %edx,0xf3cc(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    a53c:	8b 15 40 22 01 00    	mov    0x12240,%edx
    a542:	8b 45 0c             	mov    0xc(%ebp),%eax
    a545:	8b 04 85 cc f3 00 00 	mov    0xf3cc(,%eax,4),%eax
    a54c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a54f:	c1 e1 0a             	shl    $0xa,%ecx
    a552:	01 c8                	add    %ecx,%eax
    a554:	c1 e0 03             	shl    $0x3,%eax
    a557:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    a55a:	bb 00 00 00 00       	mov    $0x0,%ebx
    a55f:	eb 40                	jmp    a5a1 <SubBandSynthesis+0x116>
		sum = 0;
    a561:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    a563:	be 00 00 00 00       	mov    $0x0,%esi
    a568:	eb 26                	jmp    a590 <SubBandSynthesis+0x105>
			sum += bandPtr[k] * (*filter)[i][k];
    a56a:	89 f0                	mov    %esi,%eax
    a56c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a573:	8b 45 08             	mov    0x8(%ebp),%eax
    a576:	01 d0                	add    %edx,%eax
    a578:	dd 00                	fldl   (%eax)
    a57a:	a1 44 22 01 00       	mov    0x12244,%eax
    a57f:	89 da                	mov    %ebx,%edx
    a581:	c1 e2 05             	shl    $0x5,%edx
    a584:	01 f2                	add    %esi,%edx
    a586:	dd 04 d0             	fldl   (%eax,%edx,8)
    a589:	de c9                	fmulp  %st,%st(1)
    a58b:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    a58d:	83 c6 01             	add    $0x1,%esi
    a590:	83 fe 1f             	cmp    $0x1f,%esi
    a593:	7e d5                	jle    a56a <SubBandSynthesis+0xdf>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    a595:	89 d8                	mov    %ebx,%eax
    a597:	c1 e0 03             	shl    $0x3,%eax
    a59a:	01 f8                	add    %edi,%eax
    a59c:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    a59e:	83 c3 01             	add    $0x1,%ebx
    a5a1:	83 fb 3f             	cmp    $0x3f,%ebx
    a5a4:	7e bb                	jle    a561 <SubBandSynthesis+0xd6>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    a5a6:	bf 00 00 00 00       	mov    $0x0,%edi
    a5ab:	e9 c7 00 00 00       	jmp    a677 <SubBandSynthesis+0x1ec>
		sum = 0;
    a5b0:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    a5b2:	bb 00 00 00 00       	mov    $0x0,%ebx
    a5b7:	eb 4c                	jmp    a605 <SubBandSynthesis+0x17a>
			k = j + (i<<5);
    a5b9:	89 d8                	mov    %ebx,%eax
    a5bb:	c1 e0 05             	shl    $0x5,%eax
    a5be:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a5c1:	a1 48 22 01 00       	mov    0x12248,%eax
    a5c6:	89 f2                	mov    %esi,%edx
    a5c8:	c1 e2 03             	shl    $0x3,%edx
    a5cb:	01 d0                	add    %edx,%eax
    a5cd:	dd 00                	fldl   (%eax)
    a5cf:	a1 40 22 01 00       	mov    0x12240,%eax
    a5d4:	8d 53 01             	lea    0x1(%ebx),%edx
    a5d7:	d1 fa                	sar    %edx
    a5d9:	c1 e2 06             	shl    $0x6,%edx
    a5dc:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    a5df:	8b 55 0c             	mov    0xc(%ebp),%edx
    a5e2:	8b 14 95 cc f3 00 00 	mov    0xf3cc(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a5e9:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    a5eb:	89 d1                	mov    %edx,%ecx
    a5ed:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a5f3:	8b 55 0c             	mov    0xc(%ebp),%edx
    a5f6:	c1 e2 0a             	shl    $0xa,%edx
    a5f9:	01 ca                	add    %ecx,%edx
    a5fb:	dd 04 d0             	fldl   (%eax,%edx,8)
    a5fe:	de c9                	fmulp  %st,%st(1)
    a600:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    a602:	83 c3 01             	add    $0x1,%ebx
    a605:	83 fb 0f             	cmp    $0xf,%ebx
    a608:	7e af                	jle    a5b9 <SubBandSynthesis+0x12e>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    a60a:	dd 05 a0 d6 00 00    	fldl   0xd6a0
    a610:	de c9                	fmulp  %st,%st(1)
    a612:	d9 7d d6             	fnstcw -0x2a(%ebp)
    a615:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    a619:	b4 0c                	mov    $0xc,%ah
    a61b:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    a61f:	d9 6d d4             	fldcw  -0x2c(%ebp)
    a622:	db 5d e0             	fistpl -0x20(%ebp)
    a625:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    a628:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    a62f:	7e 15                	jle    a646 <SubBandSynthesis+0x1bb>
    a631:	89 f8                	mov    %edi,%eax
    a633:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a636:	8b 45 10             	mov    0x10(%ebp),%eax
    a639:	01 d0                	add    %edx,%eax
    a63b:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    a640:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a644:	eb 2e                	jmp    a674 <SubBandSynthesis+0x1e9>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    a646:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    a64d:	7d 15                	jge    a664 <SubBandSynthesis+0x1d9>
    a64f:	89 f8                	mov    %edi,%eax
    a651:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a654:	8b 45 10             	mov    0x10(%ebp),%eax
    a657:	01 d0                	add    %edx,%eax
    a659:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    a65e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a662:	eb 10                	jmp    a674 <SubBandSynthesis+0x1e9>
			else                           samples[j] = foo;
    a664:	89 f8                	mov    %edi,%eax
    a666:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a669:	8b 45 10             	mov    0x10(%ebp),%eax
    a66c:	01 d0                	add    %edx,%eax
    a66e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a671:	66 89 10             	mov    %dx,(%eax)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    a674:	83 c7 01             	add    $0x1,%edi
    a677:	83 ff 1f             	cmp    $0x1f,%edi
    a67a:	0f 8e 30 ff ff ff    	jle    a5b0 <SubBandSynthesis+0x125>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    a680:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    a683:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a686:	5b                   	pop    %ebx
    a687:	5e                   	pop    %esi
    a688:	5f                   	pop    %edi
    a689:	5d                   	pop    %ebp
    a68a:	c3                   	ret    

0000a68b <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    a68b:	55                   	push   %ebp
    a68c:	89 e5                	mov    %esp,%ebp
    a68e:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    a691:	8b 45 10             	mov    0x10(%ebp),%eax
    a694:	8b 40 08             	mov    0x8(%eax),%eax
    a697:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    a69a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    a6a1:	eb 75                	jmp    a718 <out_fifo+0x8d>
    a6a3:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    a6aa:	eb 62                	jmp    a70e <out_fifo+0x83>
            (*psampFrames)++;
    a6ac:	8b 45 14             	mov    0x14(%ebp),%eax
    a6af:	8b 00                	mov    (%eax),%eax
    a6b1:	8d 50 01             	lea    0x1(%eax),%edx
    a6b4:	8b 45 14             	mov    0x14(%ebp),%eax
    a6b7:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    a6b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a6c0:	eb 40                	jmp    a702 <out_fifo+0x77>
                if (!(k%1600) && k) {
    a6c2:	8b 0d 4c 22 01 00    	mov    0x1224c,%ecx
    a6c8:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    a6cd:	89 c8                	mov    %ecx,%eax
    a6cf:	f7 ea                	imul   %edx
    a6d1:	c1 fa 09             	sar    $0x9,%edx
    a6d4:	89 c8                	mov    %ecx,%eax
    a6d6:	c1 f8 1f             	sar    $0x1f,%eax
    a6d9:	29 c2                	sub    %eax,%edx
    a6db:	89 d0                	mov    %edx,%eax
    a6dd:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    a6e3:	29 c1                	sub    %eax,%ecx
    a6e5:	89 c8                	mov    %ecx,%eax
    a6e7:	85 c0                	test   %eax,%eax
    a6e9:	75 13                	jne    a6fe <out_fifo+0x73>
    a6eb:	a1 4c 22 01 00       	mov    0x1224c,%eax
    a6f0:	85 c0                	test   %eax,%eax
    a6f2:	74 0a                	je     a6fe <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    a6f4:	c7 05 4c 22 01 00 00 	movl   $0x0,0x1224c
    a6fb:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    a6fe:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a702:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a705:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a708:	7c b8                	jl     a6c2 <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    a70a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    a70e:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    a712:	7e 98                	jle    a6ac <out_fifo+0x21>
    a714:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    a718:	8b 45 fc             	mov    -0x4(%ebp),%eax
    a71b:	3b 45 0c             	cmp    0xc(%ebp),%eax
    a71e:	7c 83                	jl     a6a3 <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    a720:	c9                   	leave  
    a721:	c3                   	ret    

0000a722 <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    a722:	55                   	push   %ebp
    a723:	89 e5                	mov    %esp,%ebp
    a725:	83 ec 08             	sub    $0x8,%esp
    *old_crc = getbits(bs, 16);
    a728:	83 ec 08             	sub    $0x8,%esp
    a72b:	6a 10                	push   $0x10
    a72d:	ff 75 08             	pushl  0x8(%ebp)
    a730:	e8 14 a8 ff ff       	call   4f49 <getbits>
    a735:	83 c4 10             	add    $0x10,%esp
    a738:	89 c2                	mov    %eax,%edx
    a73a:	8b 45 0c             	mov    0xc(%ebp),%eax
    a73d:	89 10                	mov    %edx,(%eax)
}
    a73f:	c9                   	leave  
    a740:	c3                   	ret    

0000a741 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    a741:	55                   	push   %ebp
    a742:	89 e5                	mov    %esp,%ebp
    a744:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    a747:	8b 45 08             	mov    0x8(%ebp),%eax
    a74a:	8b 40 0c             	mov    0xc(%eax),%eax
    a74d:	83 c0 1e             	add    $0x1e,%eax
    a750:	8b 14 85 c0 ee 00 00 	mov    0xeec0(,%eax,4),%edx
    a757:	89 d0                	mov    %edx,%eax
    a759:	c1 e0 03             	shl    $0x3,%eax
    a75c:	01 d0                	add    %edx,%eax
    a75e:	c1 e0 04             	shl    $0x4,%eax
    a761:	89 45 e8             	mov    %eax,-0x18(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
    a764:	db 45 e8             	fildl  -0x18(%ebp)
    a767:	8b 45 08             	mov    0x8(%ebp),%eax
    a76a:	8b 40 10             	mov    0x10(%eax),%eax
    a76d:	dd 04 c5 80 ef 00 00 	fldl   0xef80(,%eax,8)
    a774:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    a776:	d9 7d ee             	fnstcw -0x12(%ebp)
    a779:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
    a77d:	b4 0c                	mov    $0xc,%ah
    a77f:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    a783:	d9 6d ec             	fldcw  -0x14(%ebp)
    a786:	db 5d fc             	fistpl -0x4(%ebp)
    a789:	d9 6d ee             	fldcw  -0x12(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    a78c:	8b 45 08             	mov    0x8(%ebp),%eax
    a78f:	8b 40 14             	mov    0x14(%eax),%eax
    a792:	85 c0                	test   %eax,%eax
    a794:	74 04                	je     a79a <main_data_slots+0x59>
    a796:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    a79a:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    a79e:	8b 45 08             	mov    0x8(%ebp),%eax
    a7a1:	8b 40 08             	mov    0x8(%eax),%eax
    a7a4:	85 c0                	test   %eax,%eax
    a7a6:	74 04                	je     a7ac <main_data_slots+0x6b>
		nSlots -= 2;
    a7a8:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    a7ac:	8b 45 10             	mov    0x10(%ebp),%eax
    a7af:	83 f8 01             	cmp    $0x1,%eax
    a7b2:	75 06                	jne    a7ba <main_data_slots+0x79>
		nSlots -= 17;
    a7b4:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    a7b8:	eb 04                	jmp    a7be <main_data_slots+0x7d>
	else
		nSlots -=32;
    a7ba:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    a7be:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    a7c1:	c9                   	leave  
    a7c2:	c3                   	ret    
