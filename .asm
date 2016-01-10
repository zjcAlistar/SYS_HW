
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
       c:	e8 44 3e 00 00       	call   3e55 <malloc>
      11:	83 c4 10             	add    $0x10,%esp
      14:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
      17:	83 ec 0c             	sub    $0xc,%esp
      1a:	6a 20                	push   $0x20
      1c:	e8 34 3e 00 00       	call   3e55 <malloc>
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
      39:	e8 39 37 00 00       	call   3777 <strcpy>
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
      61:	8b 15 c8 eb 00 00    	mov    0xebc8,%edx
      67:	8b 5d f4             	mov    -0xc(%ebp),%ebx
      6a:	8d 45 d8             	lea    -0x28(%ebp),%eax
      6d:	83 ec 0c             	sub    $0xc,%esp
      70:	52                   	push   %edx
      71:	ff 35 18 1a 01 00    	pushl  0x11a18
      77:	ff 35 14 1a 01 00    	pushl  0x11a14
      7d:	ff 35 10 1a 01 00    	pushl  0x11a10
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
      a4:	8b 15 c4 eb 00 00    	mov    0xebc4,%edx
      aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
      ad:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
      b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
      b3:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
      ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
      bd:	a3 c4 eb 00 00       	mov    %eax,0xebc4
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
      cd:	a1 c4 eb 00 00       	mov    0xebc4,%eax
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
      f0:	e8 1f 3c 00 00       	call   3d14 <free>
      f5:	83 c4 10             	add    $0x10,%esp
		free(temp);
      f8:	83 ec 0c             	sub    $0xc,%esp
      fb:	ff 75 f0             	pushl  -0x10(%ebp)
      fe:	e8 11 3c 00 00       	call   3d14 <free>
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
     10c:	c7 05 c4 eb 00 00 00 	movl   $0x0,0xebc4
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
     124:	e8 bd 36 00 00       	call   37e6 <strlen>
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
     1bd:	c7 05 c8 eb 00 00 00 	movl   $0x0,0xebc8
     1c4:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     1c7:	83 ec 08             	sub    $0x8,%esp
     1ca:	6a 00                	push   $0x0
     1cc:	ff 75 08             	pushl  0x8(%ebp)
     1cf:	e8 13 38 00 00       	call   39e7 <open>
     1d4:	83 c4 10             	add    $0x10,%esp
     1d7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     1da:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     1de:	79 1a                	jns    1fa <list+0x49>
		printf(2, "ls: cannot open %s\n", path);
     1e0:	83 ec 04             	sub    $0x4,%esp
     1e3:	ff 75 08             	pushl  0x8(%ebp)
     1e6:	68 40 a2 00 00       	push   $0xa240
     1eb:	6a 02                	push   $0x2
     1ed:	e8 92 39 00 00       	call   3b84 <printf>
     1f2:	83 c4 10             	add    $0x10,%esp
		return;
     1f5:	e9 52 02 00 00       	jmp    44c <list+0x29b>
	}

	if (fstat(fd, &st) < 0) {
     1fa:	83 ec 08             	sub    $0x8,%esp
     1fd:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     203:	50                   	push   %eax
     204:	ff 75 e4             	pushl  -0x1c(%ebp)
     207:	e8 f3 37 00 00       	call   39ff <fstat>
     20c:	83 c4 10             	add    $0x10,%esp
     20f:	85 c0                	test   %eax,%eax
     211:	79 28                	jns    23b <list+0x8a>
		printf(2, "ls: cannot stat %s\n", path);
     213:	83 ec 04             	sub    $0x4,%esp
     216:	ff 75 08             	pushl  0x8(%ebp)
     219:	68 54 a2 00 00       	push   $0xa254
     21e:	6a 02                	push   $0x2
     220:	e8 5f 39 00 00       	call   3b84 <printf>
     225:	83 c4 10             	add    $0x10,%esp
		close(fd);
     228:	83 ec 0c             	sub    $0xc,%esp
     22b:	ff 75 e4             	pushl  -0x1c(%ebp)
     22e:	e8 9c 37 00 00       	call   39cf <close>
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
     27c:	68 68 a2 00 00       	push   $0xa268
     281:	6a 01                	push   $0x1
     283:	e8 fc 38 00 00       	call   3b84 <printf>
     288:	83 c4 20             	add    $0x20,%esp
		break;
     28b:	e9 ae 01 00 00       	jmp    43e <list+0x28d>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     290:	83 ec 0c             	sub    $0xc,%esp
     293:	ff 75 08             	pushl  0x8(%ebp)
     296:	e8 4b 35 00 00       	call   37e6 <strlen>
     29b:	83 c4 10             	add    $0x10,%esp
     29e:	83 c0 10             	add    $0x10,%eax
     2a1:	3d 00 02 00 00       	cmp    $0x200,%eax
     2a6:	76 17                	jbe    2bf <list+0x10e>
			printf(1, "ls: path too long\n");
     2a8:	83 ec 08             	sub    $0x8,%esp
     2ab:	68 75 a2 00 00       	push   $0xa275
     2b0:	6a 01                	push   $0x1
     2b2:	e8 cd 38 00 00       	call   3b84 <printf>
     2b7:	83 c4 10             	add    $0x10,%esp
			break;
     2ba:	e9 7f 01 00 00       	jmp    43e <list+0x28d>
		}
		strcpy(buf, path);
     2bf:	83 ec 08             	sub    $0x8,%esp
     2c2:	ff 75 08             	pushl  0x8(%ebp)
     2c5:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2cb:	50                   	push   %eax
     2cc:	e8 a6 34 00 00       	call   3777 <strcpy>
     2d1:	83 c4 10             	add    $0x10,%esp
		p = buf + strlen(buf);
     2d4:	83 ec 0c             	sub    $0xc,%esp
     2d7:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2dd:	50                   	push   %eax
     2de:	e8 03 35 00 00       	call   37e6 <strlen>
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
     327:	e8 36 36 00 00       	call   3962 <memmove>
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
     349:	e8 7a 35 00 00       	call   38c8 <stat>
     34e:	83 c4 10             	add    $0x10,%esp
     351:	85 c0                	test   %eax,%eax
     353:	79 1e                	jns    373 <list+0x1c2>
				printf(1, "ls: cannot stat %s\n", buf);
     355:	83 ec 04             	sub    $0x4,%esp
     358:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     35e:	50                   	push   %eax
     35f:	68 54 a2 00 00       	push   $0xa254
     364:	6a 01                	push   $0x1
     366:	e8 19 38 00 00       	call   3b84 <printf>
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
     3a0:	8b 15 c8 eb 00 00    	mov    0xebc8,%edx
     3a6:	8d 45 d0             	lea    -0x30(%ebp),%eax
     3a9:	83 ec 0c             	sub    $0xc,%esp
     3ac:	52                   	push   %edx
     3ad:	ff 35 18 1a 01 00    	pushl  0x11a18
     3b3:	ff 35 14 1a 01 00    	pushl  0x11a14
     3b9:	ff 35 10 1a 01 00    	pushl  0x11a10
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
     410:	a1 c8 eb 00 00       	mov    0xebc8,%eax
     415:	83 c0 01             	add    $0x1,%eax
     418:	a3 c8 eb 00 00       	mov    %eax,0xebc8
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
     42c:	e8 8e 35 00 00       	call   39bf <read>
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
     444:	e8 86 35 00 00       	call   39cf <close>
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
     493:	e8 14 1c 00 00       	call   20ac <fill_rect>
     498:	83 c4 20             	add    $0x20,%esp
	}
	if (style == ICON_STYLE) {
     49b:	a1 84 e2 00 00       	mov    0xe284,%eax
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
     4c6:	ff 35 f0 e2 00 00    	pushl  0xe2f0
     4cc:	ff 35 ec e2 00 00    	pushl  0xe2ec
     4d2:	ff 35 e8 e2 00 00    	pushl  0xe2e8
     4d8:	ff 75 10             	pushl  0x10(%ebp)
     4db:	ff 75 0c             	pushl  0xc(%ebp)
     4de:	ff 75 08             	pushl  0x8(%ebp)
     4e1:	e8 d0 21 00 00       	call   26b6 <draw_picture>
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
     4f9:	ff 35 58 e3 00 00    	pushl  0xe358
     4ff:	ff 35 54 e3 00 00    	pushl  0xe354
     505:	ff 35 50 e3 00 00    	pushl  0xe350
     50b:	ff 75 10             	pushl  0x10(%ebp)
     50e:	ff 75 0c             	pushl  0xc(%ebp)
     511:	ff 75 08             	pushl  0x8(%ebp)
     514:	e8 9d 21 00 00       	call   26b6 <draw_picture>
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
     523:	e8 be 32 00 00       	call   37e6 <strlen>
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
     56e:	e8 94 20 00 00       	call   2607 <puts_str>
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
     59c:	ff 35 24 e3 00 00    	pushl  0xe324
     5a2:	ff 35 20 e3 00 00    	pushl  0xe320
     5a8:	ff 35 1c e3 00 00    	pushl  0xe31c
     5ae:	ff 75 10             	pushl  0x10(%ebp)
     5b1:	ff 75 0c             	pushl  0xc(%ebp)
     5b4:	ff 75 08             	pushl  0x8(%ebp)
     5b7:	e8 fa 20 00 00       	call   26b6 <draw_picture>
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
     5f6:	e8 0c 20 00 00       	call   2607 <puts_str>
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
     60e:	ff 35 8c e3 00 00    	pushl  0xe38c
     614:	ff 35 88 e3 00 00    	pushl  0xe388
     61a:	ff 35 84 e3 00 00    	pushl  0xe384
     620:	ff 75 10             	pushl  0x10(%ebp)
     623:	ff 75 0c             	pushl  0xc(%ebp)
     626:	ff 75 08             	pushl  0x8(%ebp)
     629:	e8 88 20 00 00       	call   26b6 <draw_picture>
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
     654:	e8 ae 1f 00 00       	call   2607 <puts_str>
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
     66d:	e8 e3 37 00 00       	call   3e55 <malloc>
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
		4 * BUTTON_WIDTH + 200, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "up1.bmp",
		5 * BUTTON_WIDTH + 200, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
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
     7e0:	e8 8d 1f 00 00       	call   2772 <draw_line>
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
     80a:	e8 63 1f 00 00       	call   2772 <draw_line>
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
     834:	e8 39 1f 00 00       	call   2772 <draw_line>
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
     854:	e8 19 1f 00 00       	call   2772 <draw_line>
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
     877:	e8 30 18 00 00       	call   20ac <fill_rect>
     87c:	83 c4 20             	add    $0x20,%esp
			TOOLSBAR_COLOR);
	puts_str(context, "Finder", 0, WINDOW_WIDTH / 2, 3);
     87f:	83 ec 04             	sub    $0x4,%esp
     882:	6a 03                	push   $0x3
     884:	68 2c 01 00 00       	push   $0x12c
     889:	6a 00                	push   $0x0
     88b:	68 88 a2 00 00       	push   $0xa288
     890:	ff 75 10             	pushl  0x10(%ebp)
     893:	ff 75 0c             	pushl  0xc(%ebp)
     896:	ff 75 08             	pushl  0x8(%ebp)
     899:	e8 69 1d 00 00       	call   2607 <puts_str>
     89e:	83 c4 20             	add    $0x20,%esp
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     8a1:	83 ec 0c             	sub    $0xc,%esp
     8a4:	6a 0a                	push   $0xa
     8a6:	68 c0 e3 00 00       	push   $0xe3c0
     8ab:	ff 75 10             	pushl  0x10(%ebp)
     8ae:	ff 75 0c             	pushl  0xc(%ebp)
     8b1:	ff 75 08             	pushl  0x8(%ebp)
     8b4:	e8 7e 21 00 00       	call   2a37 <draw_iconlist>
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
     8cb:	a1 84 e2 00 00       	mov    0xe284,%eax
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
     8ff:	e8 a8 17 00 00       	call   20ac <fill_rect>
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
     929:	e8 44 1e 00 00       	call   2772 <draw_line>
     92e:	83 c4 20             	add    $0x20,%esp
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);

	//printf(0, "listing complete!\n");
	//printItemList();
	p = fileItemList;
     931:	a1 c4 eb 00 00       	mov    0xebc4,%eax
     936:	89 45 f4             	mov    %eax,-0xc(%ebp)
	itemCounter = 0;
     939:	c7 05 c8 eb 00 00 00 	movl   $0x0,0xebc8
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
     996:	a1 84 e2 00 00       	mov    0xe284,%eax
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
     9ba:	e8 ed 16 00 00       	call   20ac <fill_rect>
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
     9db:	e8 cc 16 00 00       	call   20ac <fill_rect>
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
     a03:	e8 a4 16 00 00       	call   20ac <fill_rect>
     a08:	83 c4 20             	add    $0x20,%esp
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     a0b:	83 ec 04             	sub    $0x4,%esp
     a0e:	6a 50                	push   $0x50
     a10:	6a 2b                	push   $0x2b
     a12:	6a 00                	push   $0x0
     a14:	68 8f a2 00 00       	push   $0xa28f
     a19:	ff 75 10             	pushl  0x10(%ebp)
     a1c:	ff 75 0c             	pushl  0xc(%ebp)
     a1f:	ff 75 08             	pushl  0x8(%ebp)
     a22:	e8 e0 1b 00 00       	call   2607 <puts_str>
     a27:	83 c4 20             	add    $0x20,%esp
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     a2a:	83 ec 04             	sub    $0x4,%esp
     a2d:	6a 50                	push   $0x50
     a2f:	68 cb 00 00 00       	push   $0xcb
     a34:	6a 00                	push   $0x0
     a36:	68 94 a2 00 00       	push   $0xa294
     a3b:	ff 75 10             	pushl  0x10(%ebp)
     a3e:	ff 75 0c             	pushl  0xc(%ebp)
     a41:	ff 75 08             	pushl  0x8(%ebp)
     a44:	e8 be 1b 00 00       	call   2607 <puts_str>
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
     a61:	e8 ef 33 00 00       	call   3e55 <malloc>
     a66:	83 c4 10             	add    $0x10,%esp
     a69:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
     a6c:	83 ec 0c             	sub    $0xc,%esp
     a6f:	6a 04                	push   $0x4
     a71:	e8 df 33 00 00       	call   3e55 <malloc>
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
     b26:	e8 e9 31 00 00       	call   3d14 <free>
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
     b3c:	a1 c4 eb 00 00       	mov    0xebc4,%eax
     b41:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     b44:	eb 22                	jmp    b68 <printItemList+0x32>
		printf(0, "%s\n", p->name);
     b46:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b49:	8b 40 14             	mov    0x14(%eax),%eax
     b4c:	83 ec 04             	sub    $0x4,%esp
     b4f:	50                   	push   %eax
     b50:	68 99 a2 00 00       	push   $0xa299
     b55:	6a 00                	push   $0x0
     b57:	e8 28 30 00 00       	call   3b84 <printf>
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
     b76:	a1 84 e2 00 00       	mov    0xe284,%eax
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
     bca:	8b 15 c0 eb 00 00    	mov    0xebc0,%edx
     bd0:	8b 45 e8             	mov    -0x18(%ebp),%eax
     bd3:	01 c2                	add    %eax,%edx
     bd5:	8b 45 08             	mov    0x8(%ebp),%eax
     bd8:	83 ec 0c             	sub    $0xc,%esp
     bdb:	6a 5f                	push   $0x5f
     bdd:	6a 64                	push   $0x64
     bdf:	52                   	push   %edx
     be0:	ff 75 e4             	pushl  -0x1c(%ebp)
     be3:	50                   	push   %eax
     be4:	e8 0e 26 00 00       	call   31f7 <initRect>
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
     bfe:	a1 c0 eb 00 00       	mov    0xebc0,%eax
     c03:	01 c2                	add    %eax,%edx
     c05:	8b 45 08             	mov    0x8(%ebp),%eax
     c08:	83 ec 0c             	sub    $0xc,%esp
     c0b:	6a 1e                	push   $0x1e
     c0d:	51                   	push   %ecx
     c0e:	52                   	push   %edx
     c0f:	6a 00                	push   $0x0
     c11:	50                   	push   %eax
     c12:	e8 e0 25 00 00       	call   31f7 <initRect>
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
     c27:	a1 84 e2 00 00       	mov    0xe284,%eax
     c2c:	83 f8 01             	cmp    $0x1,%eax
     c2f:	75 0d                	jne    c3e <addItemEvent+0x1d>
		if (item.pos.start.y <= TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)
     c31:	8b 45 28             	mov    0x28(%ebp),%eax
     c34:	83 f8 46             	cmp    $0x46,%eax
     c37:	7f 12                	jg     c4b <addItemEvent+0x2a>
			return;
     c39:	e9 95 00 00 00       	jmp    cd3 <addItemEvent+0xb2>
	} else {
		if (item.pos.start.y <= TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)
     c3e:	8b 45 28             	mov    0x28(%ebp),%eax
     c41:	83 f8 62             	cmp    $0x62,%eax
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
     c5d:	68 e7 18 00 00       	push   $0x18e7
     c62:	6a 02                	push   $0x2
     c64:	ff 75 30             	pushl  0x30(%ebp)
     c67:	ff 75 2c             	pushl  0x2c(%ebp)
     c6a:	ff 75 28             	pushl  0x28(%ebp)
     c6d:	ff 75 24             	pushl  0x24(%ebp)
     c70:	ff 75 08             	pushl  0x8(%ebp)
     c73:	e8 61 26 00 00       	call   32d9 <createClickable>
     c78:	83 c4 20             	add    $0x20,%esp
		break;
     c7b:	eb 56                	jmp    cd3 <addItemEvent+0xb2>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     c7d:	83 ec 04             	sub    $0x4,%esp
     c80:	68 e7 18 00 00       	push   $0x18e7
     c85:	6a 02                	push   $0x2
     c87:	ff 75 30             	pushl  0x30(%ebp)
     c8a:	ff 75 2c             	pushl  0x2c(%ebp)
     c8d:	ff 75 28             	pushl  0x28(%ebp)
     c90:	ff 75 24             	pushl  0x24(%ebp)
     c93:	ff 75 08             	pushl  0x8(%ebp)
     c96:	e8 3e 26 00 00       	call   32d9 <createClickable>
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
     cb7:	e8 1d 26 00 00       	call   32d9 <createClickable>
     cbc:	83 c4 20             	add    $0x20,%esp
		break;
     cbf:	eb 12                	jmp    cd3 <addItemEvent+0xb2>
	default:
		printf(0, "unknown file type!");
     cc1:	83 ec 08             	sub    $0x8,%esp
     cc4:	68 9d a2 00 00       	push   $0xa29d
     cc9:	6a 00                	push   $0x0
     ccb:	e8 b4 2e 00 00       	call   3b84 <printf>
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
     cdb:	a1 c4 eb 00 00       	mov    0xebc4,%eax
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
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp };

void addWndEvent(ClickableManager *cm) {
     d30:	55                   	push   %ebp
     d31:	89 e5                	mov    %esp,%ebp
     d33:	57                   	push   %edi
     d34:	56                   	push   %esi
     d35:	53                   	push   %ebx
     d36:	83 ec 2c             	sub    $0x2c,%esp
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
     d39:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
	for (i = 0; i < n; i++) {
     d40:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     d47:	e9 81 00 00 00       	jmp    dcd <addWndEvent+0x9d>
		createClickable(cm,
     d4c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d4f:	8b 1c 85 e0 e5 00 00 	mov    0xe5e0(,%eax,4),%ebx
     d56:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d59:	6b c0 34             	imul   $0x34,%eax,%eax
     d5c:	83 c0 20             	add    $0x20,%eax
     d5f:	05 c0 e3 00 00       	add    $0xe3c0,%eax
     d64:	8b 78 10             	mov    0x10(%eax),%edi
     d67:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d6a:	6b c0 34             	imul   $0x34,%eax,%eax
     d6d:	83 c0 20             	add    $0x20,%eax
     d70:	05 c0 e3 00 00       	add    $0xe3c0,%eax
     d75:	8b 70 0c             	mov    0xc(%eax),%esi
     d78:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d7b:	6b c0 34             	imul   $0x34,%eax,%eax
     d7e:	83 c0 20             	add    $0x20,%eax
     d81:	05 c0 e3 00 00       	add    $0xe3c0,%eax
     d86:	8b 48 04             	mov    0x4(%eax),%ecx
     d89:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d8c:	6b c0 34             	imul   $0x34,%eax,%eax
     d8f:	83 c0 20             	add    $0x20,%eax
     d92:	05 c0 e3 00 00       	add    $0xe3c0,%eax
     d97:	8b 10                	mov    (%eax),%edx
     d99:	8d 45 d0             	lea    -0x30(%ebp),%eax
     d9c:	83 ec 0c             	sub    $0xc,%esp
     d9f:	57                   	push   %edi
     da0:	56                   	push   %esi
     da1:	51                   	push   %ecx
     da2:	52                   	push   %edx
     da3:	50                   	push   %eax
     da4:	e8 4e 24 00 00       	call   31f7 <initRect>
     da9:	83 c4 1c             	add    $0x1c,%esp
     dac:	83 ec 04             	sub    $0x4,%esp
     daf:	53                   	push   %ebx
     db0:	6a 02                	push   $0x2
     db2:	ff 75 dc             	pushl  -0x24(%ebp)
     db5:	ff 75 d8             	pushl  -0x28(%ebp)
     db8:	ff 75 d4             	pushl  -0x2c(%ebp)
     dbb:	ff 75 d0             	pushl  -0x30(%ebp)
     dbe:	ff 75 08             	pushl  0x8(%ebp)
     dc1:	e8 13 25 00 00       	call   32d9 <createClickable>
     dc6:	83 c4 20             	add    $0x20,%esp
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp };

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
     de7:	a1 c4 eb 00 00       	mov    0xebc4,%eax
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
     e09:	e8 3a 24 00 00       	call   3248 <isIn>
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
     e36:	a1 c4 eb 00 00       	mov    0xebc4,%eax
     e3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// while (q != 0)
	// {
	// 	p = q;
	// 	q = q->next;
	// }
	if (style == ICON_STYLE){
     e3e:	a1 84 e2 00 00       	mov    0xe284,%eax
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
     e62:	a1 c0 eb 00 00       	mov    0xebc0,%eax
     e67:	83 e8 1e             	sub    $0x1e,%eax
     e6a:	a3 c0 eb 00 00       	mov    %eax,0xebc0
     e6f:	eb 5d                	jmp    ece <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - ICON_ITEM_HEIGHT));
     e71:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e74:	8b 40 1c             	mov    0x1c(%eax),%eax
     e77:	ba 63 01 00 00       	mov    $0x163,%edx
     e7c:	29 c2                	sub    %eax,%edx
     e7e:	a1 c0 eb 00 00       	mov    0xebc0,%eax
     e83:	01 d0                	add    %edx,%eax
     e85:	a3 c0 eb 00 00       	mov    %eax,0xebc0
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
     ea6:	a1 c0 eb 00 00       	mov    0xebc0,%eax
     eab:	83 e8 1e             	sub    $0x1e,%eax
     eae:	a3 c0 eb 00 00       	mov    %eax,0xebc0
     eb3:	eb 19                	jmp    ece <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - LIST_ITEM_HEIGHT));
     eb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     eb8:	8b 40 1c             	mov    0x1c(%eax),%eax
     ebb:	ba a4 01 00 00       	mov    $0x1a4,%edx
     ec0:	29 c2                	sub    %eax,%edx
     ec2:	a1 c0 eb 00 00       	mov    0xebc0,%eax
     ec7:	01 d0                	add    %edx,%eax
     ec9:	a3 c0 eb 00 00       	mov    %eax,0xebc0
			}
		}
	}
	//printf(0, "tryingToScrollDown, current Offset %d\n", scrollOffset);
	printf(0, "scrollDown, current Offset %d\n", scrollOffset);
     ece:	a1 c0 eb 00 00       	mov    0xebc0,%eax
     ed3:	83 ec 04             	sub    $0x4,%esp
     ed6:	50                   	push   %eax
     ed7:	68 b0 a2 00 00       	push   $0xa2b0
     edc:	6a 00                	push   $0x0
     ede:	e8 a1 2c 00 00       	call   3b84 <printf>
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
     efb:	68 cf a2 00 00       	push   $0xa2cf
     f00:	e8 ac f2 ff ff       	call   1b1 <list>
     f05:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
     f08:	83 ec 04             	sub    $0x4,%esp
     f0b:	ff 35 18 1a 01 00    	pushl  0x11a18
     f11:	ff 35 14 1a 01 00    	pushl  0x11a14
     f17:	ff 35 10 1a 01 00    	pushl  0x11a10
     f1d:	e8 9c f9 ff ff       	call   8be <drawFinderContent>
     f22:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
     f25:	83 ec 04             	sub    $0x4,%esp
     f28:	ff 35 18 1a 01 00    	pushl  0x11a18
     f2e:	ff 35 14 1a 01 00    	pushl  0x11a14
     f34:	ff 35 10 1a 01 00    	pushl  0x11a10
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
     f57:	e8 9b 22 00 00       	call   31f7 <initRect>
     f5c:	83 c4 1c             	add    $0x1c,%esp
     f5f:	83 ec 0c             	sub    $0xc,%esp
     f62:	ff 75 f4             	pushl  -0xc(%ebp)
     f65:	ff 75 f0             	pushl  -0x10(%ebp)
     f68:	ff 75 ec             	pushl  -0x14(%ebp)
     f6b:	ff 75 e8             	pushl  -0x18(%ebp)
     f6e:	68 1c 1a 01 00       	push   $0x11a1c
     f73:	e8 44 24 00 00       	call   33bc <deleteClickable>
     f78:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
     f7b:	83 ec 0c             	sub    $0xc,%esp
     f7e:	68 1c 1a 01 00       	push   $0x11a1c
     f83:	e8 a8 fd ff ff       	call   d30 <addWndEvent>
     f88:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
     f8b:	83 ec 0c             	sub    $0xc,%esp
     f8e:	68 1c 1a 01 00       	push   $0x11a1c
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
     fa3:	a1 c4 eb 00 00       	mov    0xebc4,%eax
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
     fc2:	a1 84 e2 00 00       	mov    0xe284,%eax
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
     fe2:	a1 c0 eb 00 00       	mov    0xebc0,%eax
     fe7:	83 c0 1e             	add    $0x1e,%eax
     fea:	a3 c0 eb 00 00       	mov    %eax,0xebc0
     fef:	eb 59                	jmp    104a <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT));
     ff1:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ff4:	8b 40 1c             	mov    0x1c(%eax),%eax
     ff7:	ba 46 00 00 00       	mov    $0x46,%edx
     ffc:	29 c2                	sub    %eax,%edx
     ffe:	a1 c0 eb 00 00       	mov    0xebc0,%eax
    1003:	01 d0                	add    %edx,%eax
    1005:	a3 c0 eb 00 00       	mov    %eax,0xebc0
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
    1022:	a1 c0 eb 00 00       	mov    0xebc0,%eax
    1027:	83 c0 1e             	add    $0x1e,%eax
    102a:	a3 c0 eb 00 00       	mov    %eax,0xebc0
    102f:	eb 19                	jmp    104a <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT));
    1031:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1034:	8b 40 1c             	mov    0x1c(%eax),%eax
    1037:	ba 62 00 00 00       	mov    $0x62,%edx
    103c:	29 c2                	sub    %eax,%edx
    103e:	a1 c0 eb 00 00       	mov    0xebc0,%eax
    1043:	01 d0                	add    %edx,%eax
    1045:	a3 c0 eb 00 00       	mov    %eax,0xebc0
			}
		}
	}
	//printf(0, "tryingToScrollUp, current Offset %d\n", scrollOffset);
	printf(0, "scrollUp, current Offset %d\n", scrollOffset);
    104a:	a1 c0 eb 00 00       	mov    0xebc0,%eax
    104f:	83 ec 04             	sub    $0x4,%esp
    1052:	50                   	push   %eax
    1053:	68 d1 a2 00 00       	push   $0xa2d1
    1058:	6a 00                	push   $0x0
    105a:	e8 25 2b 00 00       	call   3b84 <printf>
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
    1077:	68 cf a2 00 00       	push   $0xa2cf
    107c:	e8 30 f1 ff ff       	call   1b1 <list>
    1081:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    1084:	83 ec 04             	sub    $0x4,%esp
    1087:	ff 35 18 1a 01 00    	pushl  0x11a18
    108d:	ff 35 14 1a 01 00    	pushl  0x11a14
    1093:	ff 35 10 1a 01 00    	pushl  0x11a10
    1099:	e8 20 f8 ff ff       	call   8be <drawFinderContent>
    109e:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    10a1:	83 ec 04             	sub    $0x4,%esp
    10a4:	ff 35 18 1a 01 00    	pushl  0x11a18
    10aa:	ff 35 14 1a 01 00    	pushl  0x11a14
    10b0:	ff 35 10 1a 01 00    	pushl  0x11a10
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
    10d3:	e8 1f 21 00 00       	call   31f7 <initRect>
    10d8:	83 c4 1c             	add    $0x1c,%esp
    10db:	83 ec 0c             	sub    $0xc,%esp
    10de:	ff 75 f4             	pushl  -0xc(%ebp)
    10e1:	ff 75 f0             	pushl  -0x10(%ebp)
    10e4:	ff 75 ec             	pushl  -0x14(%ebp)
    10e7:	ff 75 e8             	pushl  -0x18(%ebp)
    10ea:	68 1c 1a 01 00       	push   $0x11a1c
    10ef:	e8 c8 22 00 00       	call   33bc <deleteClickable>
    10f4:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    10f7:	83 ec 0c             	sub    $0xc,%esp
    10fa:	68 1c 1a 01 00       	push   $0x11a1c
    10ff:	e8 2c fc ff ff       	call   d30 <addWndEvent>
    1104:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1107:	83 ec 0c             	sub    $0xc,%esp
    110a:	68 1c 1a 01 00       	push   $0x11a1c
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
    111f:	c7 05 c0 eb 00 00 00 	movl   $0x0,0xebc0
    1126:	00 00 00 
	printf(0, "entering : %s\n", name);
    1129:	83 ec 04             	sub    $0x4,%esp
    112c:	ff 75 08             	pushl  0x8(%ebp)
    112f:	68 ee a2 00 00       	push   $0xa2ee
    1134:	6a 00                	push   $0x0
    1136:	e8 49 2a 00 00       	call   3b84 <printf>
    113b:	83 c4 10             	add    $0x10,%esp
	if (chdir(name) < 0)
    113e:	83 ec 0c             	sub    $0xc,%esp
    1141:	ff 75 08             	pushl  0x8(%ebp)
    1144:	e8 ce 28 00 00       	call   3a17 <chdir>
    1149:	83 c4 10             	add    $0x10,%esp
    114c:	85 c0                	test   %eax,%eax
    114e:	79 15                	jns    1165 <enterDir+0x4c>
		printf(2, "cannot cd %s\n", name);
    1150:	83 ec 04             	sub    $0x4,%esp
    1153:	ff 75 08             	pushl  0x8(%ebp)
    1156:	68 fd a2 00 00       	push   $0xa2fd
    115b:	6a 02                	push   $0x2
    115d:	e8 22 2a 00 00       	call   3b84 <printf>
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
    119b:	68 cf a2 00 00       	push   $0xa2cf
    11a0:	e8 0c f0 ff ff       	call   1b1 <list>
    11a5:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    11a8:	83 ec 04             	sub    $0x4,%esp
    11ab:	ff 35 18 1a 01 00    	pushl  0x11a18
    11b1:	ff 35 14 1a 01 00    	pushl  0x11a14
    11b7:	ff 35 10 1a 01 00    	pushl  0x11a10
    11bd:	e8 fc f6 ff ff       	call   8be <drawFinderContent>
    11c2:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    11c5:	83 ec 04             	sub    $0x4,%esp
    11c8:	ff 35 18 1a 01 00    	pushl  0x11a18
    11ce:	ff 35 14 1a 01 00    	pushl  0x11a14
    11d4:	ff 35 10 1a 01 00    	pushl  0x11a10
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
    11f7:	e8 fb 1f 00 00       	call   31f7 <initRect>
    11fc:	83 c4 1c             	add    $0x1c,%esp
    11ff:	83 ec 0c             	sub    $0xc,%esp
    1202:	ff 75 f0             	pushl  -0x10(%ebp)
    1205:	ff 75 ec             	pushl  -0x14(%ebp)
    1208:	ff 75 e8             	pushl  -0x18(%ebp)
    120b:	ff 75 e4             	pushl  -0x1c(%ebp)
    120e:	68 1c 1a 01 00       	push   $0x11a1c
    1213:	e8 a4 21 00 00       	call   33bc <deleteClickable>
    1218:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    121b:	83 ec 0c             	sub    $0xc,%esp
    121e:	68 1c 1a 01 00       	push   $0x11a1c
    1223:	e8 08 fb ff ff       	call   d30 <addWndEvent>
    1228:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    122b:	83 ec 0c             	sub    $0xc,%esp
    122e:	68 1c 1a 01 00       	push   $0x11a1c
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
    1249:	e8 98 25 00 00       	call   37e6 <strlen>
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
    1263:	e8 7e 25 00 00       	call   37e6 <strlen>
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
    128b:	e8 85 26 00 00       	call   3915 <atoi>
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
    12b7:	e8 bb 24 00 00       	call   3777 <strcpy>
    12bc:	83 c4 10             	add    $0x10,%esp
		close(fd);
    12bf:	83 ec 0c             	sub    $0xc,%esp
    12c2:	ff 75 e8             	pushl  -0x18(%ebp)
    12c5:	e8 05 27 00 00       	call   39cf <close>
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
    12d5:	e8 0d 27 00 00       	call   39e7 <open>
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
    12f5:	e8 ed 26 00 00       	call   39e7 <open>
    12fa:	83 c4 10             	add    $0x10,%esp
    12fd:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1300:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1304:	79 1a                	jns    1320 <newFile+0xe3>
		printf(0, "cat: cannot open %s\n", name);
    1306:	83 ec 04             	sub    $0x4,%esp
    1309:	ff 75 08             	pushl  0x8(%ebp)
    130c:	68 0b a3 00 00       	push   $0xa30b
    1311:	6a 00                	push   $0x0
    1313:	e8 6c 28 00 00       	call   3b84 <printf>
    1318:	83 c4 10             	add    $0x10,%esp
		exit();
    131b:	e8 87 26 00 00       	call   39a7 <exit>
	}
	close(fd);
    1320:	83 ec 0c             	sub    $0xc,%esp
    1323:	ff 75 e8             	pushl  -0x18(%ebp)
    1326:	e8 a4 26 00 00       	call   39cf <close>
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
    1385:	68 cf a2 00 00       	push   $0xa2cf
    138a:	e8 22 ee ff ff       	call   1b1 <list>
    138f:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    1392:	83 ec 04             	sub    $0x4,%esp
    1395:	ff 35 18 1a 01 00    	pushl  0x11a18
    139b:	ff 35 14 1a 01 00    	pushl  0x11a14
    13a1:	ff 35 10 1a 01 00    	pushl  0x11a10
    13a7:	e8 12 f5 ff ff       	call   8be <drawFinderContent>
    13ac:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    13af:	83 ec 04             	sub    $0x4,%esp
    13b2:	ff 35 18 1a 01 00    	pushl  0x11a18
    13b8:	ff 35 14 1a 01 00    	pushl  0x11a14
    13be:	ff 35 10 1a 01 00    	pushl  0x11a10
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
    13e1:	e8 11 1e 00 00       	call   31f7 <initRect>
    13e6:	83 c4 1c             	add    $0x1c,%esp
    13e9:	83 ec 0c             	sub    $0xc,%esp
    13ec:	ff 75 f4             	pushl  -0xc(%ebp)
    13ef:	ff 75 f0             	pushl  -0x10(%ebp)
    13f2:	ff 75 ec             	pushl  -0x14(%ebp)
    13f5:	ff 75 e8             	pushl  -0x18(%ebp)
    13f8:	68 1c 1a 01 00       	push   $0x11a1c
    13fd:	e8 ba 1f 00 00       	call   33bc <deleteClickable>
    1402:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1405:	83 ec 0c             	sub    $0xc,%esp
    1408:	68 1c 1a 01 00       	push   $0x11a1c
    140d:	e8 1e f9 ff ff       	call   d30 <addWndEvent>
    1412:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1415:	83 ec 0c             	sub    $0xc,%esp
    1418:	68 1c 1a 01 00       	push   $0x11a1c
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
    1433:	e8 ae 23 00 00       	call   37e6 <strlen>
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
    144d:	e8 94 23 00 00       	call   37e6 <strlen>
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
    1475:	e8 9b 24 00 00       	call   3915 <atoi>
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
    14a1:	e8 d1 22 00 00       	call   3777 <strcpy>
    14a6:	83 c4 10             	add    $0x10,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    14a9:	83 ec 0c             	sub    $0xc,%esp
    14ac:	ff 75 08             	pushl  0x8(%ebp)
    14af:	e8 5b 25 00 00       	call   3a0f <mkdir>
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
    1512:	68 20 a3 00 00       	push   $0xa320
    1517:	6a 00                	push   $0x0
    1519:	e8 66 26 00 00       	call   3b84 <printf>
    151e:	83 c4 10             	add    $0x10,%esp
	list(".");
    1521:	83 ec 0c             	sub    $0xc,%esp
    1524:	68 cf a2 00 00       	push   $0xa2cf
    1529:	e8 83 ec ff ff       	call   1b1 <list>
    152e:	83 c4 10             	add    $0x10,%esp
	printItemList();
    1531:	e8 00 f6 ff ff       	call   b36 <printItemList>
	drawFinderContent(context);
    1536:	83 ec 04             	sub    $0x4,%esp
    1539:	ff 35 18 1a 01 00    	pushl  0x11a18
    153f:	ff 35 14 1a 01 00    	pushl  0x11a14
    1545:	ff 35 10 1a 01 00    	pushl  0x11a10
    154b:	e8 6e f3 ff ff       	call   8be <drawFinderContent>
    1550:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1553:	83 ec 04             	sub    $0x4,%esp
    1556:	ff 35 18 1a 01 00    	pushl  0x11a18
    155c:	ff 35 14 1a 01 00    	pushl  0x11a14
    1562:	ff 35 10 1a 01 00    	pushl  0x11a10
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
    1585:	e8 6d 1c 00 00       	call   31f7 <initRect>
    158a:	83 c4 1c             	add    $0x1c,%esp
    158d:	83 ec 0c             	sub    $0xc,%esp
    1590:	ff 75 f4             	pushl  -0xc(%ebp)
    1593:	ff 75 f0             	pushl  -0x10(%ebp)
    1596:	ff 75 ec             	pushl  -0x14(%ebp)
    1599:	ff 75 e8             	pushl  -0x18(%ebp)
    159c:	68 1c 1a 01 00       	push   $0x11a1c
    15a1:	e8 16 1e 00 00       	call   33bc <deleteClickable>
    15a6:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    15a9:	83 ec 0c             	sub    $0xc,%esp
    15ac:	68 1c 1a 01 00       	push   $0x11a1c
    15b1:	e8 7a f7 ff ff       	call   d30 <addWndEvent>
    15b6:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    15b9:	83 ec 0c             	sub    $0xc,%esp
    15bc:	68 1c 1a 01 00       	push   $0x11a1c
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
    15d7:	68 2d a3 00 00       	push   $0xa32d
    15dc:	6a 00                	push   $0x0
    15de:	e8 a1 25 00 00       	call   3b84 <printf>
    15e3:	83 c4 10             	add    $0x10,%esp
	if(unlink(name) < 0){
    15e6:	83 ec 0c             	sub    $0xc,%esp
    15e9:	ff 75 08             	pushl  0x8(%ebp)
    15ec:	e8 06 24 00 00       	call   39f7 <unlink>
    15f1:	83 c4 10             	add    $0x10,%esp
    15f4:	85 c0                	test   %eax,%eax
    15f6:	0f 89 b3 00 00 00    	jns    16af <deleteFile+0xe4>
		if (chdir(name) < 0){
    15fc:	83 ec 0c             	sub    $0xc,%esp
    15ff:	ff 75 08             	pushl  0x8(%ebp)
    1602:	e8 10 24 00 00       	call   3a17 <chdir>
    1607:	83 c4 10             	add    $0x10,%esp
    160a:	85 c0                	test   %eax,%eax
    160c:	79 1a                	jns    1628 <deleteFile+0x5d>
			printf(2, "rm: %s failed to delete\n", name);
    160e:	83 ec 04             	sub    $0x4,%esp
    1611:	ff 75 08             	pushl  0x8(%ebp)
    1614:	68 4b a3 00 00       	push   $0xa34b
    1619:	6a 02                	push   $0x2
    161b:	e8 64 25 00 00       	call   3b84 <printf>
    1620:	83 c4 10             	add    $0x10,%esp
    1623:	e9 87 00 00 00       	jmp    16af <deleteFile+0xe4>
		}
		else{
			freeFileItemList();
    1628:	e8 9a ea ff ff       	call   c7 <freeFileItemList>
			list(".");
    162d:	83 ec 0c             	sub    $0xc,%esp
    1630:	68 cf a2 00 00       	push   $0xa2cf
    1635:	e8 77 eb ff ff       	call   1b1 <list>
    163a:	83 c4 10             	add    $0x10,%esp
			struct fileItem *p;
			p = fileItemList;
    163d:	a1 c4 eb 00 00       	mov    0xebc4,%eax
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
    1661:	68 cf a2 00 00       	push   $0xa2cf
    1666:	e8 46 eb ff ff       	call   1b1 <list>
    166b:	83 c4 10             	add    $0x10,%esp
				p = fileItemList;
    166e:	a1 c4 eb 00 00       	mov    0xebc4,%eax
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
    167f:	68 64 a3 00 00       	push   $0xa364
    1684:	e8 8e 23 00 00       	call   3a17 <chdir>
    1689:	83 c4 10             	add    $0x10,%esp
			freeFileItemList();
    168c:	e8 36 ea ff ff       	call   c7 <freeFileItemList>
			list(".");
    1691:	83 ec 0c             	sub    $0xc,%esp
    1694:	68 cf a2 00 00       	push   $0xa2cf
    1699:	e8 13 eb ff ff       	call   1b1 <list>
    169e:	83 c4 10             	add    $0x10,%esp
			unlink(name);
    16a1:	83 ec 0c             	sub    $0xc,%esp
    16a4:	ff 75 08             	pushl  0x8(%ebp)
    16a7:	e8 4b 23 00 00       	call   39f7 <unlink>
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
    16b7:	a1 c4 eb 00 00       	mov    0xebc4,%eax
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
    16d5:	68 67 a3 00 00       	push   $0xa367
    16da:	6a 00                	push   $0x0
    16dc:	e8 a3 24 00 00       	call   3b84 <printf>
    16e1:	83 c4 10             	add    $0x10,%esp
	while (q != 0)
    16e4:	e9 90 00 00 00       	jmp    1779 <h_deleteFile+0xc8>
	{
		printf(0, "hi2\n");
    16e9:	83 ec 08             	sub    $0x8,%esp
    16ec:	68 6c a3 00 00       	push   $0xa36c
    16f1:	6a 00                	push   $0x0
    16f3:	e8 8c 24 00 00       	call   3b84 <printf>
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
    170a:	e8 46 27 00 00       	call   3e55 <malloc>
    170f:	83 c4 10             	add    $0x10,%esp
    1712:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    1715:	83 ec 0c             	sub    $0xc,%esp
    1718:	6a 20                	push   $0x20
    171a:	e8 36 27 00 00       	call   3e55 <malloc>
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
    173b:	e8 37 20 00 00       	call   3777 <strcpy>
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
    178c:	68 74 a3 00 00       	push   $0xa374
    1791:	6a 00                	push   $0x0
    1793:	e8 ec 23 00 00       	call   3b84 <printf>
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
    17c1:	68 dc a3 00 00       	push   $0xa3dc
    17c6:	6a 00                	push   $0x0
    17c8:	e8 b7 23 00 00       	call   3b84 <printf>
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
    17e8:	68 f2 a3 00 00       	push   $0xa3f2
    17ed:	6a 00                	push   $0x0
    17ef:	e8 90 23 00 00       	call   3b84 <printf>
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
    180a:	e8 05 25 00 00       	call   3d14 <free>
    180f:	83 c4 10             	add    $0x10,%esp
		free(p2);
    1812:	83 ec 0c             	sub    $0xc,%esp
    1815:	ff 75 e8             	pushl  -0x18(%ebp)
    1818:	e8 f7 24 00 00       	call   3d14 <free>
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
    1829:	68 fe a3 00 00       	push   $0xa3fe
    182e:	6a 00                	push   $0x0
    1830:	e8 4f 23 00 00       	call   3b84 <printf>
    1835:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    1838:	e8 8a e8 ff ff       	call   c7 <freeFileItemList>
	list(".");
    183d:	83 ec 0c             	sub    $0xc,%esp
    1840:	68 cf a2 00 00       	push   $0xa2cf
    1845:	e8 67 e9 ff ff       	call   1b1 <list>
    184a:	83 c4 10             	add    $0x10,%esp
	printItemList();
    184d:	e8 e4 f2 ff ff       	call   b36 <printItemList>
	drawFinderContent(context);
    1852:	83 ec 04             	sub    $0x4,%esp
    1855:	ff 35 18 1a 01 00    	pushl  0x11a18
    185b:	ff 35 14 1a 01 00    	pushl  0x11a14
    1861:	ff 35 10 1a 01 00    	pushl  0x11a10
    1867:	e8 52 f0 ff ff       	call   8be <drawFinderContent>
    186c:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    186f:	83 ec 04             	sub    $0x4,%esp
    1872:	ff 35 18 1a 01 00    	pushl  0x11a18
    1878:	ff 35 14 1a 01 00    	pushl  0x11a14
    187e:	ff 35 10 1a 01 00    	pushl  0x11a10
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
    18a1:	e8 51 19 00 00       	call   31f7 <initRect>
    18a6:	83 c4 1c             	add    $0x1c,%esp
    18a9:	83 ec 0c             	sub    $0xc,%esp
    18ac:	ff 75 e4             	pushl  -0x1c(%ebp)
    18af:	ff 75 e0             	pushl  -0x20(%ebp)
    18b2:	ff 75 dc             	pushl  -0x24(%ebp)
    18b5:	ff 75 d8             	pushl  -0x28(%ebp)
    18b8:	68 1c 1a 01 00       	push   $0x11a1c
    18bd:	e8 fa 1a 00 00       	call   33bc <deleteClickable>
    18c2:	83 c4 20             	add    $0x20,%esp
		addWndEvent(&cm);
    18c5:	83 ec 0c             	sub    $0xc,%esp
    18c8:	68 1c 1a 01 00       	push   $0x11a1c
    18cd:	e8 5e f4 ff ff       	call   d30 <addWndEvent>
    18d2:	83 c4 10             	add    $0x10,%esp
		addListEvent(&cm);
    18d5:	83 ec 0c             	sub    $0xc,%esp
    18d8:	68 1c 1a 01 00       	push   $0x11a1c
    18dd:	e8 f3 f3 ff ff       	call   cd5 <addListEvent>
    18e2:	83 c4 10             	add    $0x10,%esp
}
    18e5:	c9                   	leave  
    18e6:	c3                   	ret    

000018e7 <h_chooseFile>:

void h_chooseFile(Point p) {
    18e7:	55                   	push   %ebp
    18e8:	89 e5                	mov    %esp,%ebp
    18ea:	83 ec 18             	sub    $0x18,%esp
	struct fileItem *temp = getFileItem(p);
    18ed:	83 ec 08             	sub    $0x8,%esp
    18f0:	ff 75 0c             	pushl  0xc(%ebp)
    18f3:	ff 75 08             	pushl  0x8(%ebp)
    18f6:	e8 e6 f4 ff ff       	call   de1 <getFileItem>
    18fb:	83 c4 10             	add    $0x10,%esp
    18fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (temp->chosen != 0)
    1901:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1904:	8b 40 28             	mov    0x28(%eax),%eax
    1907:	85 c0                	test   %eax,%eax
    1909:	74 1e                	je     1929 <h_chooseFile+0x42>
	{
		printf(0, "chooseFile!\n");
    190b:	83 ec 08             	sub    $0x8,%esp
    190e:	68 10 a4 00 00       	push   $0xa410
    1913:	6a 00                	push   $0x0
    1915:	e8 6a 22 00 00       	call   3b84 <printf>
    191a:	83 c4 10             	add    $0x10,%esp
		temp->chosen = 0;
    191d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1920:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    1927:	eb 1c                	jmp    1945 <h_chooseFile+0x5e>
	}
	else
	{
		printf(0, "unchooseFile!\n");
    1929:	83 ec 08             	sub    $0x8,%esp
    192c:	68 1d a4 00 00       	push   $0xa41d
    1931:	6a 00                	push   $0x0
    1933:	e8 4c 22 00 00       	call   3b84 <printf>
    1938:	83 c4 10             	add    $0x10,%esp
		temp->chosen = 1;
    193b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    193e:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    1945:	83 ec 04             	sub    $0x4,%esp
    1948:	ff 35 18 1a 01 00    	pushl  0x11a18
    194e:	ff 35 14 1a 01 00    	pushl  0x11a14
    1954:	ff 35 10 1a 01 00    	pushl  0x11a10
    195a:	e8 5f ef ff ff       	call   8be <drawFinderContent>
    195f:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1962:	83 ec 04             	sub    $0x4,%esp
    1965:	ff 35 18 1a 01 00    	pushl  0x11a18
    196b:	ff 35 14 1a 01 00    	pushl  0x11a14
    1971:	ff 35 10 1a 01 00    	pushl  0x11a10
    1977:	e8 46 ee ff ff       	call   7c2 <drawFinderWnd>
    197c:	83 c4 10             	add    $0x10,%esp
}
    197f:	c9                   	leave  
    1980:	c3                   	ret    

00001981 <h_closeWnd>:

void h_closeWnd(Point p) {
    1981:	55                   	push   %ebp
    1982:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    1984:	c7 05 80 e2 00 00 00 	movl   $0x0,0xe280
    198b:	00 00 00 
}
    198e:	5d                   	pop    %ebp
    198f:	c3                   	ret    

00001990 <h_chvm1>:

void h_chvm1(Point p) {
    1990:	55                   	push   %ebp
    1991:	89 e5                	mov    %esp,%ebp
    1993:	83 ec 18             	sub    $0x18,%esp
	style = ICON_STYLE;
    1996:	c7 05 84 e2 00 00 01 	movl   $0x1,0xe284
    199d:	00 00 00 
	freeFileItemList();
    19a0:	e8 22 e7 ff ff       	call   c7 <freeFileItemList>
		list(".");
    19a5:	83 ec 0c             	sub    $0xc,%esp
    19a8:	68 cf a2 00 00       	push   $0xa2cf
    19ad:	e8 ff e7 ff ff       	call   1b1 <list>
    19b2:	83 c4 10             	add    $0x10,%esp
		drawFinderContent(context);
    19b5:	83 ec 04             	sub    $0x4,%esp
    19b8:	ff 35 18 1a 01 00    	pushl  0x11a18
    19be:	ff 35 14 1a 01 00    	pushl  0x11a14
    19c4:	ff 35 10 1a 01 00    	pushl  0x11a10
    19ca:	e8 ef ee ff ff       	call   8be <drawFinderContent>
    19cf:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    19d2:	83 ec 04             	sub    $0x4,%esp
    19d5:	ff 35 18 1a 01 00    	pushl  0x11a18
    19db:	ff 35 14 1a 01 00    	pushl  0x11a14
    19e1:	ff 35 10 1a 01 00    	pushl  0x11a10
    19e7:	e8 d6 ed ff ff       	call   7c2 <drawFinderWnd>
    19ec:	83 c4 10             	add    $0x10,%esp
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    19ef:	8d 45 e8             	lea    -0x18(%ebp),%eax
    19f2:	83 ec 0c             	sub    $0xc,%esp
    19f5:	68 58 02 00 00       	push   $0x258
    19fa:	68 20 03 00 00       	push   $0x320
    19ff:	6a 00                	push   $0x0
    1a01:	6a 00                	push   $0x0
    1a03:	50                   	push   %eax
    1a04:	e8 ee 17 00 00       	call   31f7 <initRect>
    1a09:	83 c4 1c             	add    $0x1c,%esp
    1a0c:	83 ec 0c             	sub    $0xc,%esp
    1a0f:	ff 75 f4             	pushl  -0xc(%ebp)
    1a12:	ff 75 f0             	pushl  -0x10(%ebp)
    1a15:	ff 75 ec             	pushl  -0x14(%ebp)
    1a18:	ff 75 e8             	pushl  -0x18(%ebp)
    1a1b:	68 1c 1a 01 00       	push   $0x11a1c
    1a20:	e8 97 19 00 00       	call   33bc <deleteClickable>
    1a25:	83 c4 20             	add    $0x20,%esp
			addWndEvent(&cm);
    1a28:	83 ec 0c             	sub    $0xc,%esp
    1a2b:	68 1c 1a 01 00       	push   $0x11a1c
    1a30:	e8 fb f2 ff ff       	call   d30 <addWndEvent>
    1a35:	83 c4 10             	add    $0x10,%esp
			addListEvent(&cm);
    1a38:	83 ec 0c             	sub    $0xc,%esp
    1a3b:	68 1c 1a 01 00       	push   $0x11a1c
    1a40:	e8 90 f2 ff ff       	call   cd5 <addListEvent>
    1a45:	83 c4 10             	add    $0x10,%esp
}
    1a48:	c9                   	leave  
    1a49:	c3                   	ret    

00001a4a <h_chvm2>:

void h_chvm2(Point p) {
    1a4a:	55                   	push   %ebp
    1a4b:	89 e5                	mov    %esp,%ebp
    1a4d:	83 ec 18             	sub    $0x18,%esp
	style = LIST_STYLE;
    1a50:	c7 05 84 e2 00 00 02 	movl   $0x2,0xe284
    1a57:	00 00 00 
	freeFileItemList();
    1a5a:	e8 68 e6 ff ff       	call   c7 <freeFileItemList>
		list(".");
    1a5f:	83 ec 0c             	sub    $0xc,%esp
    1a62:	68 cf a2 00 00       	push   $0xa2cf
    1a67:	e8 45 e7 ff ff       	call   1b1 <list>
    1a6c:	83 c4 10             	add    $0x10,%esp
		drawFinderContent(context);
    1a6f:	83 ec 04             	sub    $0x4,%esp
    1a72:	ff 35 18 1a 01 00    	pushl  0x11a18
    1a78:	ff 35 14 1a 01 00    	pushl  0x11a14
    1a7e:	ff 35 10 1a 01 00    	pushl  0x11a10
    1a84:	e8 35 ee ff ff       	call   8be <drawFinderContent>
    1a89:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1a8c:	83 ec 04             	sub    $0x4,%esp
    1a8f:	ff 35 18 1a 01 00    	pushl  0x11a18
    1a95:	ff 35 14 1a 01 00    	pushl  0x11a14
    1a9b:	ff 35 10 1a 01 00    	pushl  0x11a10
    1aa1:	e8 1c ed ff ff       	call   7c2 <drawFinderWnd>
    1aa6:	83 c4 10             	add    $0x10,%esp
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1aa9:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1aac:	83 ec 0c             	sub    $0xc,%esp
    1aaf:	68 58 02 00 00       	push   $0x258
    1ab4:	68 20 03 00 00       	push   $0x320
    1ab9:	6a 00                	push   $0x0
    1abb:	6a 00                	push   $0x0
    1abd:	50                   	push   %eax
    1abe:	e8 34 17 00 00       	call   31f7 <initRect>
    1ac3:	83 c4 1c             	add    $0x1c,%esp
    1ac6:	83 ec 0c             	sub    $0xc,%esp
    1ac9:	ff 75 f4             	pushl  -0xc(%ebp)
    1acc:	ff 75 f0             	pushl  -0x10(%ebp)
    1acf:	ff 75 ec             	pushl  -0x14(%ebp)
    1ad2:	ff 75 e8             	pushl  -0x18(%ebp)
    1ad5:	68 1c 1a 01 00       	push   $0x11a1c
    1ada:	e8 dd 18 00 00       	call   33bc <deleteClickable>
    1adf:	83 c4 20             	add    $0x20,%esp
			addWndEvent(&cm);
    1ae2:	83 ec 0c             	sub    $0xc,%esp
    1ae5:	68 1c 1a 01 00       	push   $0x11a1c
    1aea:	e8 41 f2 ff ff       	call   d30 <addWndEvent>
    1aef:	83 c4 10             	add    $0x10,%esp
			addListEvent(&cm);
    1af2:	83 ec 0c             	sub    $0xc,%esp
    1af5:	68 1c 1a 01 00       	push   $0x11a1c
    1afa:	e8 d6 f1 ff ff       	call   cd5 <addListEvent>
    1aff:	83 c4 10             	add    $0x10,%esp
}
    1b02:	c9                   	leave  
    1b03:	c3                   	ret    

00001b04 <h_goUp>:

void h_goUp(Point p) {
    1b04:	55                   	push   %ebp
    1b05:	89 e5                	mov    %esp,%ebp
    1b07:	83 ec 18             	sub    $0x18,%esp
	enterDir("..");
    1b0a:	83 ec 0c             	sub    $0xc,%esp
    1b0d:	68 64 a3 00 00       	push   $0xa364
    1b12:	e8 02 f6 ff ff       	call   1119 <enterDir>
    1b17:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    1b1a:	e8 a8 e5 ff ff       	call   c7 <freeFileItemList>
	list(".");
    1b1f:	83 ec 0c             	sub    $0xc,%esp
    1b22:	68 cf a2 00 00       	push   $0xa2cf
    1b27:	e8 85 e6 ff ff       	call   1b1 <list>
    1b2c:	83 c4 10             	add    $0x10,%esp
	drawFinderContent(context);
    1b2f:	83 ec 04             	sub    $0x4,%esp
    1b32:	ff 35 18 1a 01 00    	pushl  0x11a18
    1b38:	ff 35 14 1a 01 00    	pushl  0x11a14
    1b3e:	ff 35 10 1a 01 00    	pushl  0x11a10
    1b44:	e8 75 ed ff ff       	call   8be <drawFinderContent>
    1b49:	83 c4 10             	add    $0x10,%esp
	drawFinderWnd(context);
    1b4c:	83 ec 04             	sub    $0x4,%esp
    1b4f:	ff 35 18 1a 01 00    	pushl  0x11a18
    1b55:	ff 35 14 1a 01 00    	pushl  0x11a14
    1b5b:	ff 35 10 1a 01 00    	pushl  0x11a10
    1b61:	e8 5c ec ff ff       	call   7c2 <drawFinderWnd>
    1b66:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1b69:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1b6c:	83 ec 0c             	sub    $0xc,%esp
    1b6f:	68 58 02 00 00       	push   $0x258
    1b74:	68 20 03 00 00       	push   $0x320
    1b79:	6a 00                	push   $0x0
    1b7b:	6a 00                	push   $0x0
    1b7d:	50                   	push   %eax
    1b7e:	e8 74 16 00 00       	call   31f7 <initRect>
    1b83:	83 c4 1c             	add    $0x1c,%esp
    1b86:	83 ec 0c             	sub    $0xc,%esp
    1b89:	ff 75 f4             	pushl  -0xc(%ebp)
    1b8c:	ff 75 f0             	pushl  -0x10(%ebp)
    1b8f:	ff 75 ec             	pushl  -0x14(%ebp)
    1b92:	ff 75 e8             	pushl  -0x18(%ebp)
    1b95:	68 1c 1a 01 00       	push   $0x11a1c
    1b9a:	e8 1d 18 00 00       	call   33bc <deleteClickable>
    1b9f:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1ba2:	83 ec 0c             	sub    $0xc,%esp
    1ba5:	68 1c 1a 01 00       	push   $0x11a1c
    1baa:	e8 81 f1 ff ff       	call   d30 <addWndEvent>
    1baf:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1bb2:	83 ec 0c             	sub    $0xc,%esp
    1bb5:	68 1c 1a 01 00       	push   $0x11a1c
    1bba:	e8 16 f1 ff ff       	call   cd5 <addListEvent>
    1bbf:	83 c4 10             	add    $0x10,%esp
}
    1bc2:	c9                   	leave  
    1bc3:	c3                   	ret    

00001bc4 <h_empty>:

void h_empty(Point p) {
    1bc4:	55                   	push   %ebp
    1bc5:	89 e5                	mov    %esp,%ebp

}
    1bc7:	5d                   	pop    %ebp
    1bc8:	c3                   	ret    

00001bc9 <main>:

int main(int argc, char *argv[]) {
    1bc9:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1bcd:	83 e4 f0             	and    $0xfffffff0,%esp
    1bd0:	ff 71 fc             	pushl  -0x4(%ecx)
    1bd3:	55                   	push   %ebp
    1bd4:	89 e5                	mov    %esp,%ebp
    1bd6:	56                   	push   %esi
    1bd7:	53                   	push   %ebx
    1bd8:	51                   	push   %ecx
    1bd9:	83 ec 7c             	sub    $0x7c,%esp
	int winid;
	struct Msg msg;

	Point p;

	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    1bdc:	83 ec 04             	sub    $0x4,%esp
    1bdf:	68 c2 01 00 00       	push   $0x1c2
    1be4:	68 58 02 00 00       	push   $0x258
    1be9:	68 10 1a 01 00       	push   $0x11a10
    1bee:	e8 d5 03 00 00       	call   1fc8 <init_context>
    1bf3:	83 c4 10             	add    $0x10,%esp
    1bf6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    1bf9:	8d 45 88             	lea    -0x78(%ebp),%eax
    1bfc:	ff 35 18 1a 01 00    	pushl  0x11a18
    1c02:	ff 35 14 1a 01 00    	pushl  0x11a14
    1c08:	ff 35 10 1a 01 00    	pushl  0x11a10
    1c0e:	50                   	push   %eax
    1c0f:	e8 77 16 00 00       	call   328b <initClickManager>
    1c14:	83 c4 0c             	add    $0xc,%esp
    1c17:	8b 45 88             	mov    -0x78(%ebp),%eax
    1c1a:	a3 1c 1a 01 00       	mov    %eax,0x11a1c
    1c1f:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1c22:	a3 20 1a 01 00       	mov    %eax,0x11a20
    1c27:	8b 45 90             	mov    -0x70(%ebp),%eax
    1c2a:	a3 24 1a 01 00       	mov    %eax,0x11a24
    1c2f:	8b 45 94             	mov    -0x6c(%ebp),%eax
    1c32:	a3 28 1a 01 00       	mov    %eax,0x11a28
    1c37:	8b 45 98             	mov    -0x68(%ebp),%eax
    1c3a:	a3 2c 1a 01 00       	mov    %eax,0x11a2c
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    1c3f:	83 ec 08             	sub    $0x8,%esp
    1c42:	6a 0a                	push   $0xa
    1c44:	68 c0 e3 00 00       	push   $0xe3c0
    1c49:	e8 a4 0d 00 00       	call   29f2 <load_iconlist>
    1c4e:	83 c4 10             	add    $0x10,%esp
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    1c51:	83 ec 08             	sub    $0x8,%esp
    1c54:	6a 04                	push   $0x4
    1c56:	68 c0 e2 00 00       	push   $0xe2c0
    1c5b:	e8 92 0d 00 00       	call   29f2 <load_iconlist>
    1c60:	83 c4 10             	add    $0x10,%esp
	//testHandlers();
	mkdir("userfolder");
    1c63:	83 ec 0c             	sub    $0xc,%esp
    1c66:	68 2c a4 00 00       	push   $0xa42c
    1c6b:	e8 9f 1d 00 00       	call   3a0f <mkdir>
    1c70:	83 c4 10             	add    $0x10,%esp
	enterDir("userfolder");
    1c73:	83 ec 0c             	sub    $0xc,%esp
    1c76:	68 2c a4 00 00       	push   $0xa42c
    1c7b:	e8 99 f4 ff ff       	call   1119 <enterDir>
    1c80:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    1c83:	e8 3f e4 ff ff       	call   c7 <freeFileItemList>
	list(".");
    1c88:	83 ec 0c             	sub    $0xc,%esp
    1c8b:	68 cf a2 00 00       	push   $0xa2cf
    1c90:	e8 1c e5 ff ff       	call   1b1 <list>
    1c95:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1c98:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    1c9b:	83 ec 0c             	sub    $0xc,%esp
    1c9e:	68 58 02 00 00       	push   $0x258
    1ca3:	68 20 03 00 00       	push   $0x320
    1ca8:	6a 00                	push   $0x0
    1caa:	6a 00                	push   $0x0
    1cac:	50                   	push   %eax
    1cad:	e8 45 15 00 00       	call   31f7 <initRect>
    1cb2:	83 c4 1c             	add    $0x1c,%esp
    1cb5:	83 ec 0c             	sub    $0xc,%esp
    1cb8:	ff 75 e0             	pushl  -0x20(%ebp)
    1cbb:	ff 75 dc             	pushl  -0x24(%ebp)
    1cbe:	ff 75 d8             	pushl  -0x28(%ebp)
    1cc1:	ff 75 d4             	pushl  -0x2c(%ebp)
    1cc4:	68 1c 1a 01 00       	push   $0x11a1c
    1cc9:	e8 ee 16 00 00       	call   33bc <deleteClickable>
    1cce:	83 c4 20             	add    $0x20,%esp
	addWndEvent(&cm);
    1cd1:	83 ec 0c             	sub    $0xc,%esp
    1cd4:	68 1c 1a 01 00       	push   $0x11a1c
    1cd9:	e8 52 f0 ff ff       	call   d30 <addWndEvent>
    1cde:	83 c4 10             	add    $0x10,%esp
	addListEvent(&cm);
    1ce1:	83 ec 0c             	sub    $0xc,%esp
    1ce4:	68 1c 1a 01 00       	push   $0x11a1c
    1ce9:	e8 e7 ef ff ff       	call   cd5 <addListEvent>
    1cee:	83 c4 10             	add    $0x10,%esp
	while (isRun) {
    1cf1:	e9 94 01 00 00       	jmp    1e8a <main+0x2c1>
		getMsg(&msg);
    1cf6:	83 ec 0c             	sub    $0xc,%esp
    1cf9:	8d 45 bc             	lea    -0x44(%ebp),%eax
    1cfc:	50                   	push   %eax
    1cfd:	e8 45 1d 00 00       	call   3a47 <getMsg>
    1d02:	83 c4 10             	add    $0x10,%esp
		switch (msg.msg_type) {
    1d05:	8b 45 bc             	mov    -0x44(%ebp),%eax
    1d08:	83 f8 08             	cmp    $0x8,%eax
    1d0b:	0f 87 78 01 00 00    	ja     1e89 <main+0x2c0>
    1d11:	8b 04 85 38 a4 00 00 	mov    0xa438(,%eax,4),%eax
    1d18:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    1d1a:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    1d1d:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1d20:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    1d23:	83 ec 04             	sub    $0x4,%esp
    1d26:	51                   	push   %ecx
    1d27:	52                   	push   %edx
    1d28:	50                   	push   %eax
    1d29:	e8 a2 14 00 00       	call   31d0 <initPoint>
    1d2e:	83 c4 0c             	add    $0xc,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    1d31:	a1 20 1a 01 00       	mov    0x11a20,%eax
    1d36:	83 ec 04             	sub    $0x4,%esp
    1d39:	ff 75 b8             	pushl  -0x48(%ebp)
    1d3c:	ff 75 b4             	pushl  -0x4c(%ebp)
    1d3f:	50                   	push   %eax
    1d40:	e8 49 17 00 00       	call   348e <executeHandler>
    1d45:	83 c4 10             	add    $0x10,%esp
    1d48:	85 c0                	test   %eax,%eax
    1d4a:	74 14                	je     1d60 <main+0x197>
				updateWindow(winid, context.addr);
    1d4c:	a1 10 1a 01 00       	mov    0x11a10,%eax
    1d51:	83 ec 08             	sub    $0x8,%esp
    1d54:	50                   	push   %eax
    1d55:	ff 75 e4             	pushl  -0x1c(%ebp)
    1d58:	e8 02 1d 00 00       	call   3a5f <updateWindow>
    1d5d:	83 c4 10             	add    $0x10,%esp
			}
			break;
    1d60:	e9 25 01 00 00       	jmp    1e8a <main+0x2c1>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderContent(context);
    1d65:	83 ec 04             	sub    $0x4,%esp
    1d68:	ff 35 18 1a 01 00    	pushl  0x11a18
    1d6e:	ff 35 14 1a 01 00    	pushl  0x11a14
    1d74:	ff 35 10 1a 01 00    	pushl  0x11a10
    1d7a:	e8 3f eb ff ff       	call   8be <drawFinderContent>
    1d7f:	83 c4 10             	add    $0x10,%esp
			drawFinderWnd(context);
    1d82:	83 ec 04             	sub    $0x4,%esp
    1d85:	ff 35 18 1a 01 00    	pushl  0x11a18
    1d8b:	ff 35 14 1a 01 00    	pushl  0x11a14
    1d91:	ff 35 10 1a 01 00    	pushl  0x11a10
    1d97:	e8 26 ea ff ff       	call   7c2 <drawFinderWnd>
    1d9c:	83 c4 10             	add    $0x10,%esp
			updateWindow(winid, context.addr);
    1d9f:	a1 10 1a 01 00       	mov    0x11a10,%eax
    1da4:	83 ec 08             	sub    $0x8,%esp
    1da7:	50                   	push   %eax
    1da8:	ff 75 e4             	pushl  -0x1c(%ebp)
    1dab:	e8 af 1c 00 00       	call   3a5f <updateWindow>
    1db0:	83 c4 10             	add    $0x10,%esp
			break;
    1db3:	e9 d2 00 00 00       	jmp    1e8a <main+0x2c1>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    1db8:	8b 75 cc             	mov    -0x34(%ebp),%esi
    1dbb:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    1dbe:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    1dc1:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1dc4:	a1 10 1a 01 00       	mov    0x11a10,%eax
    1dc9:	83 ec 08             	sub    $0x8,%esp
    1dcc:	56                   	push   %esi
    1dcd:	53                   	push   %ebx
    1dce:	51                   	push   %ecx
    1dcf:	52                   	push   %edx
    1dd0:	50                   	push   %eax
    1dd1:	ff 75 e4             	pushl  -0x1c(%ebp)
    1dd4:	e8 8e 1c 00 00       	call   3a67 <updatePartialWindow>
    1dd9:	83 c4 20             	add    $0x20,%esp
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    1ddc:	e9 a9 00 00 00       	jmp    1e8a <main+0x2c1>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    1de1:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    1de4:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1de7:	8d 45 80             	lea    -0x80(%ebp),%eax
    1dea:	83 ec 04             	sub    $0x4,%esp
    1ded:	51                   	push   %ecx
    1dee:	52                   	push   %edx
    1def:	50                   	push   %eax
    1df0:	e8 db 13 00 00       	call   31d0 <initPoint>
    1df5:	83 c4 0c             	add    $0xc,%esp
    1df8:	8b 45 80             	mov    -0x80(%ebp),%eax
    1dfb:	8b 55 84             	mov    -0x7c(%ebp),%edx
    1dfe:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    1e01:	89 55 b8             	mov    %edx,-0x48(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.left_click, p)) {
    1e04:	a1 1c 1a 01 00       	mov    0x11a1c,%eax
    1e09:	83 ec 04             	sub    $0x4,%esp
    1e0c:	ff 75 b8             	pushl  -0x48(%ebp)
    1e0f:	ff 75 b4             	pushl  -0x4c(%ebp)
    1e12:	50                   	push   %eax
    1e13:	e8 76 16 00 00       	call   348e <executeHandler>
    1e18:	83 c4 10             	add    $0x10,%esp
    1e1b:	85 c0                	test   %eax,%eax
    1e1d:	74 14                	je     1e33 <main+0x26a>

				updateWindow(winid, context.addr);
    1e1f:	a1 10 1a 01 00       	mov    0x11a10,%eax
    1e24:	83 ec 08             	sub    $0x8,%esp
    1e27:	50                   	push   %eax
    1e28:	ff 75 e4             	pushl  -0x1c(%ebp)
    1e2b:	e8 2f 1c 00 00       	call   3a5f <updateWindow>
    1e30:	83 c4 10             	add    $0x10,%esp
			}
			break;
    1e33:	eb 55                	jmp    1e8a <main+0x2c1>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    1e35:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    1e38:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1e3b:	8d 45 80             	lea    -0x80(%ebp),%eax
    1e3e:	83 ec 04             	sub    $0x4,%esp
    1e41:	51                   	push   %ecx
    1e42:	52                   	push   %edx
    1e43:	50                   	push   %eax
    1e44:	e8 87 13 00 00       	call   31d0 <initPoint>
    1e49:	83 c4 0c             	add    $0xc,%esp
    1e4c:	8b 45 80             	mov    -0x80(%ebp),%eax
    1e4f:	8b 55 84             	mov    -0x7c(%ebp),%edx
    1e52:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    1e55:	89 55 b8             	mov    %edx,-0x48(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    1e58:	a1 24 1a 01 00       	mov    0x11a24,%eax
    1e5d:	83 ec 04             	sub    $0x4,%esp
    1e60:	ff 75 b8             	pushl  -0x48(%ebp)
    1e63:	ff 75 b4             	pushl  -0x4c(%ebp)
    1e66:	50                   	push   %eax
    1e67:	e8 22 16 00 00       	call   348e <executeHandler>
    1e6c:	83 c4 10             	add    $0x10,%esp
    1e6f:	85 c0                	test   %eax,%eax
    1e71:	74 14                	je     1e87 <main+0x2be>
				updateWindow(winid, context.addr);
    1e73:	a1 10 1a 01 00       	mov    0x11a10,%eax
    1e78:	83 ec 08             	sub    $0x8,%esp
    1e7b:	50                   	push   %eax
    1e7c:	ff 75 e4             	pushl  -0x1c(%ebp)
    1e7f:	e8 db 1b 00 00       	call   3a5f <updateWindow>
    1e84:	83 c4 10             	add    $0x10,%esp
			}
			break;
    1e87:	eb 01                	jmp    1e8a <main+0x2c1>
		default:
			break;
    1e89:	90                   	nop
	freeFileItemList();
	list(".");
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	while (isRun) {
    1e8a:	a1 80 e2 00 00       	mov    0xe280,%eax
    1e8f:	85 c0                	test   %eax,%eax
    1e91:	0f 85 5f fe ff ff    	jne    1cf6 <main+0x12d>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    1e97:	83 ec 08             	sub    $0x8,%esp
    1e9a:	ff 75 e4             	pushl  -0x1c(%ebp)
    1e9d:	68 10 1a 01 00       	push   $0x11a10
    1ea2:	e8 95 01 00 00       	call   203c <free_context>
    1ea7:	83 c4 10             	add    $0x10,%esp
	exit();
    1eaa:	e8 f8 1a 00 00       	call   39a7 <exit>

00001eaf <testHandlers>:
}

void testHandlers() {
    1eaf:	55                   	push   %ebp
    1eb0:	89 e5                	mov    %esp,%ebp
    1eb2:	83 ec 08             	sub    $0x8,%esp

	list(".");
    1eb5:	83 ec 0c             	sub    $0xc,%esp
    1eb8:	68 cf a2 00 00       	push   $0xa2cf
    1ebd:	e8 ef e2 ff ff       	call   1b1 <list>
    1ec2:	83 c4 10             	add    $0x10,%esp
	printf(0, "original list:\n");
    1ec5:	83 ec 08             	sub    $0x8,%esp
    1ec8:	68 5c a4 00 00       	push   $0xa45c
    1ecd:	6a 00                	push   $0x0
    1ecf:	e8 b0 1c 00 00       	call   3b84 <printf>
    1ed4:	83 c4 10             	add    $0x10,%esp
	printItemList();
    1ed7:	e8 5a ec ff ff       	call   b36 <printItemList>
	printf(0, "\n");
    1edc:	83 ec 08             	sub    $0x8,%esp
    1edf:	68 6c a4 00 00       	push   $0xa46c
    1ee4:	6a 00                	push   $0x0
    1ee6:	e8 99 1c 00 00       	call   3b84 <printf>
    1eeb:	83 c4 10             	add    $0x10,%esp
	printf(0, "new a folder:\n");
    1eee:	83 ec 08             	sub    $0x8,%esp
    1ef1:	68 6e a4 00 00       	push   $0xa46e
    1ef6:	6a 00                	push   $0x0
    1ef8:	e8 87 1c 00 00       	call   3b84 <printf>
    1efd:	83 c4 10             	add    $0x10,%esp
	newFolder("newfolder");
    1f00:	83 ec 0c             	sub    $0xc,%esp
    1f03:	68 7d a4 00 00       	push   $0xa47d
    1f08:	e8 1a f5 ff ff       	call   1427 <newFolder>
    1f0d:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    1f10:	e8 b2 e1 ff ff       	call   c7 <freeFileItemList>
	list(".");
    1f15:	83 ec 0c             	sub    $0xc,%esp
    1f18:	68 cf a2 00 00       	push   $0xa2cf
    1f1d:	e8 8f e2 ff ff       	call   1b1 <list>
    1f22:	83 c4 10             	add    $0x10,%esp
	printItemList();
    1f25:	e8 0c ec ff ff       	call   b36 <printItemList>
	printf(0, "\n");
    1f2a:	83 ec 08             	sub    $0x8,%esp
    1f2d:	68 6c a4 00 00       	push   $0xa46c
    1f32:	6a 00                	push   $0x0
    1f34:	e8 4b 1c 00 00       	call   3b84 <printf>
    1f39:	83 c4 10             	add    $0x10,%esp
	printf(0, "enter new folder:\n");
    1f3c:	83 ec 08             	sub    $0x8,%esp
    1f3f:	68 87 a4 00 00       	push   $0xa487
    1f44:	6a 00                	push   $0x0
    1f46:	e8 39 1c 00 00       	call   3b84 <printf>
    1f4b:	83 c4 10             	add    $0x10,%esp
	enterDir("newfolder");
    1f4e:	83 ec 0c             	sub    $0xc,%esp
    1f51:	68 7d a4 00 00       	push   $0xa47d
    1f56:	e8 be f1 ff ff       	call   1119 <enterDir>
    1f5b:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    1f5e:	e8 64 e1 ff ff       	call   c7 <freeFileItemList>
	list(".");
    1f63:	83 ec 0c             	sub    $0xc,%esp
    1f66:	68 cf a2 00 00       	push   $0xa2cf
    1f6b:	e8 41 e2 ff ff       	call   1b1 <list>
    1f70:	83 c4 10             	add    $0x10,%esp
	printItemList();
    1f73:	e8 be eb ff ff       	call   b36 <printItemList>
	printf(0, "\n");
    1f78:	83 ec 08             	sub    $0x8,%esp
    1f7b:	68 6c a4 00 00       	push   $0xa46c
    1f80:	6a 00                	push   $0x0
    1f82:	e8 fd 1b 00 00       	call   3b84 <printf>
    1f87:	83 c4 10             	add    $0x10,%esp
	printf(0, "new a file:\n");
    1f8a:	83 ec 08             	sub    $0x8,%esp
    1f8d:	68 9a a4 00 00       	push   $0xa49a
    1f92:	6a 00                	push   $0x0
    1f94:	e8 eb 1b 00 00       	call   3b84 <printf>
    1f99:	83 c4 10             	add    $0x10,%esp
	newFile("newfile.txt");
    1f9c:	83 ec 0c             	sub    $0xc,%esp
    1f9f:	68 a7 a4 00 00       	push   $0xa4a7
    1fa4:	e8 94 f2 ff ff       	call   123d <newFile>
    1fa9:	83 c4 10             	add    $0x10,%esp
	freeFileItemList();
    1fac:	e8 16 e1 ff ff       	call   c7 <freeFileItemList>
	list(".");
    1fb1:	83 ec 0c             	sub    $0xc,%esp
    1fb4:	68 cf a2 00 00       	push   $0xa2cf
    1fb9:	e8 f3 e1 ff ff       	call   1b1 <list>
    1fbe:	83 c4 10             	add    $0x10,%esp
	printItemList();
    1fc1:	e8 70 eb ff ff       	call   b36 <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    1fc6:	c9                   	leave  
    1fc7:	c3                   	ret    

00001fc8 <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    1fc8:	55                   	push   %ebp
    1fc9:	89 e5                	mov    %esp,%ebp
    1fcb:	83 ec 08             	sub    $0x8,%esp
    context_ptr->width = width;
    1fce:	8b 45 08             	mov    0x8(%ebp),%eax
    1fd1:	8b 55 0c             	mov    0xc(%ebp),%edx
    1fd4:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    1fd7:	8b 45 08             	mov    0x8(%ebp),%eax
    1fda:	8b 55 10             	mov    0x10(%ebp),%edx
    1fdd:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    1fe0:	8b 55 0c             	mov    0xc(%ebp),%edx
    1fe3:	8b 45 10             	mov    0x10(%ebp),%eax
    1fe6:	0f af c2             	imul   %edx,%eax
    1fe9:	01 c0                	add    %eax,%eax
    1feb:	83 ec 0c             	sub    $0xc,%esp
    1fee:	50                   	push   %eax
    1fef:	e8 61 1e 00 00       	call   3e55 <malloc>
    1ff4:	83 c4 10             	add    $0x10,%esp
    1ff7:	89 c2                	mov    %eax,%edx
    1ff9:	8b 45 08             	mov    0x8(%ebp),%eax
    1ffc:	89 10                	mov    %edx,(%eax)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    1ffe:	8b 55 0c             	mov    0xc(%ebp),%edx
    2001:	8b 45 10             	mov    0x10(%ebp),%eax
    2004:	0f af c2             	imul   %edx,%eax
    2007:	8d 14 00             	lea    (%eax,%eax,1),%edx
    200a:	8b 45 08             	mov    0x8(%ebp),%eax
    200d:	8b 00                	mov    (%eax),%eax
    200f:	83 ec 04             	sub    $0x4,%esp
    2012:	52                   	push   %edx
    2013:	6a 00                	push   $0x0
    2015:	50                   	push   %eax
    2016:	e8 f2 17 00 00       	call   380d <memset>
    201b:	83 c4 10             	add    $0x10,%esp
    initializeASCII();
    201e:	e8 73 01 00 00       	call   2196 <initializeASCII>
    initializeGBK();
    2023:	e8 f4 02 00 00       	call   231c <initializeGBK>
    return createWindow(0, 0, width, height);
    2028:	ff 75 10             	pushl  0x10(%ebp)
    202b:	ff 75 0c             	pushl  0xc(%ebp)
    202e:	6a 00                	push   $0x0
    2030:	6a 00                	push   $0x0
    2032:	e8 18 1a 00 00       	call   3a4f <createWindow>
    2037:	83 c4 10             	add    $0x10,%esp
}
    203a:	c9                   	leave  
    203b:	c3                   	ret    

0000203c <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    203c:	55                   	push   %ebp
    203d:	89 e5                	mov    %esp,%ebp
    203f:	83 ec 08             	sub    $0x8,%esp
    free(context_ptr->addr);
    2042:	8b 45 08             	mov    0x8(%ebp),%eax
    2045:	8b 00                	mov    (%eax),%eax
    2047:	83 ec 0c             	sub    $0xc,%esp
    204a:	50                   	push   %eax
    204b:	e8 c4 1c 00 00       	call   3d14 <free>
    2050:	83 c4 10             	add    $0x10,%esp
    freeASCII();
    2053:	e8 ab 02 00 00       	call   2303 <freeASCII>
    freeGBK();
    2058:	e8 60 03 00 00       	call   23bd <freeGBK>
    destroyWindow(winid);
    205d:	83 ec 0c             	sub    $0xc,%esp
    2060:	ff 75 0c             	pushl  0xc(%ebp)
    2063:	e8 ef 19 00 00       	call   3a57 <destroyWindow>
    2068:	83 c4 10             	add    $0x10,%esp
}
    206b:	c9                   	leave  
    206c:	c3                   	ret    

0000206d <draw_point>:
*             then do nothing!
*/

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    206d:	55                   	push   %ebp
    206e:	89 e5                	mov    %esp,%ebp
    2070:	83 ec 04             	sub    $0x4,%esp
    2073:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2076:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width) 
    207a:	8b 45 0c             	mov    0xc(%ebp),%eax
    207d:	3b 45 14             	cmp    0x14(%ebp),%eax
    2080:	77 02                	ja     2084 <draw_point+0x17>
    return;
    2082:	eb 26                	jmp    20aa <draw_point+0x3d>
  if(y >= c.height)
    2084:	8b 45 10             	mov    0x10(%ebp),%eax
    2087:	3b 45 18             	cmp    0x18(%ebp),%eax
    208a:	77 02                	ja     208e <draw_point+0x21>
    return;
    208c:	eb 1c                	jmp    20aa <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    208e:	8b 45 08             	mov    0x8(%ebp),%eax
    2091:	8b 55 0c             	mov    0xc(%ebp),%edx
    2094:	89 d1                	mov    %edx,%ecx
    2096:	0f af 4d 18          	imul   0x18(%ebp),%ecx
    209a:	8b 55 14             	mov    0x14(%ebp),%edx
    209d:	01 ca                	add    %ecx,%edx
    209f:	01 d2                	add    %edx,%edx
    20a1:	01 c2                	add    %eax,%edx
    20a3:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    20a7:	66 89 02             	mov    %ax,(%edx)
}
    20aa:	c9                   	leave  
    20ab:	c3                   	ret    

000020ac <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    20ac:	55                   	push   %ebp
    20ad:	89 e5                	mov    %esp,%ebp
    20af:	83 ec 14             	sub    $0x14,%esp
    20b2:	8b 45 24             	mov    0x24(%ebp),%eax
    20b5:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    20b9:	8b 55 14             	mov    0x14(%ebp),%edx
    20bc:	8b 45 1c             	mov    0x1c(%ebp),%eax
    20bf:	01 d0                	add    %edx,%eax
    20c1:	8b 55 0c             	mov    0xc(%ebp),%edx
    20c4:	39 d0                	cmp    %edx,%eax
    20c6:	0f 47 c2             	cmova  %edx,%eax
    20c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height; 
    20cc:	8b 55 18             	mov    0x18(%ebp),%edx
    20cf:	8b 45 20             	mov    0x20(%ebp),%eax
    20d2:	01 d0                	add    %edx,%eax
    20d4:	8b 55 10             	mov    0x10(%ebp),%edx
    20d7:	39 d0                	cmp    %edx,%eax
    20d9:	0f 47 c2             	cmova  %edx,%eax
    20dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    20df:	8b 45 18             	mov    0x18(%ebp),%eax
    20e2:	89 45 f8             	mov    %eax,-0x8(%ebp)
    20e5:	eb 36                	jmp    211d <fill_rect+0x71>
	{
		for (x = bx; x < mx; x++)
    20e7:	8b 45 14             	mov    0x14(%ebp),%eax
    20ea:	89 45 fc             	mov    %eax,-0x4(%ebp)
    20ed:	eb 22                	jmp    2111 <fill_rect+0x65>
		{
			draw_point(c, x, y, color);
    20ef:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    20f3:	8b 55 f8             	mov    -0x8(%ebp),%edx
    20f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    20f9:	51                   	push   %ecx
    20fa:	52                   	push   %edx
    20fb:	50                   	push   %eax
    20fc:	ff 75 10             	pushl  0x10(%ebp)
    20ff:	ff 75 0c             	pushl  0xc(%ebp)
    2102:	ff 75 08             	pushl  0x8(%ebp)
    2105:	e8 63 ff ff ff       	call   206d <draw_point>
    210a:	83 c4 18             	add    $0x18,%esp
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    210d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    2111:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2114:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2117:	7c d6                	jl     20ef <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
    2119:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    211d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2120:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    2123:	7c c2                	jl     20e7 <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    2125:	c9                   	leave  
    2126:	c3                   	ret    

00002127 <printBinary>:

void printBinary(char c)
{
    2127:	55                   	push   %ebp
    2128:	89 e5                	mov    %esp,%ebp
    212a:	83 ec 28             	sub    $0x28,%esp
    212d:	8b 45 08             	mov    0x8(%ebp),%eax
    2130:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    2133:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    213a:	eb 40                	jmp    217c <printBinary+0x55>
	{
		if(((c << i) & 0x80) != 0)
    213c:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    2140:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2143:	89 c1                	mov    %eax,%ecx
    2145:	d3 e2                	shl    %cl,%edx
    2147:	89 d0                	mov    %edx,%eax
    2149:	25 80 00 00 00       	and    $0x80,%eax
    214e:	85 c0                	test   %eax,%eax
    2150:	74 14                	je     2166 <printBinary+0x3f>
		{
			printf(0, "1");
    2152:	83 ec 08             	sub    $0x8,%esp
    2155:	68 b3 a4 00 00       	push   $0xa4b3
    215a:	6a 00                	push   $0x0
    215c:	e8 23 1a 00 00       	call   3b84 <printf>
    2161:	83 c4 10             	add    $0x10,%esp
    2164:	eb 12                	jmp    2178 <printBinary+0x51>
		}
		else
		{
			printf(0, "0");
    2166:	83 ec 08             	sub    $0x8,%esp
    2169:	68 b5 a4 00 00       	push   $0xa4b5
    216e:	6a 00                	push   $0x0
    2170:	e8 0f 1a 00 00       	call   3b84 <printf>
    2175:	83 c4 10             	add    $0x10,%esp
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    2178:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    217c:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    2180:	7e ba                	jle    213c <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    2182:	83 ec 08             	sub    $0x8,%esp
    2185:	68 b7 a4 00 00       	push   $0xa4b7
    218a:	6a 00                	push   $0x0
    218c:	e8 f3 19 00 00       	call   3b84 <printf>
    2191:	83 c4 10             	add    $0x10,%esp
}
    2194:	c9                   	leave  
    2195:	c3                   	ret    

00002196 <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    2196:	55                   	push   %ebp
    2197:	89 e5                	mov    %esp,%ebp
    2199:	56                   	push   %esi
    219a:	53                   	push   %ebx
    219b:	83 ec 20             	sub    $0x20,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    219e:	83 ec 08             	sub    $0x8,%esp
    21a1:	68 b9 a4 00 00       	push   $0xa4b9
    21a6:	6a 00                	push   $0x0
    21a8:	e8 d7 19 00 00       	call   3b84 <printf>
    21ad:	83 c4 10             	add    $0x10,%esp
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    21b0:	83 ec 08             	sub    $0x8,%esp
    21b3:	6a 00                	push   $0x0
    21b5:	68 cc a4 00 00       	push   $0xa4cc
    21ba:	e8 28 18 00 00       	call   39e7 <open>
    21bf:	83 c4 10             	add    $0x10,%esp
    21c2:	89 45 e8             	mov    %eax,-0x18(%ebp)
    21c5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    21c9:	79 1c                	jns    21e7 <initializeASCII+0x51>
	  printf(0,"cannot open %s\n", HANKAKU);
    21cb:	83 ec 04             	sub    $0x4,%esp
    21ce:	68 cc a4 00 00       	push   $0xa4cc
    21d3:	68 d8 a4 00 00       	push   $0xa4d8
    21d8:	6a 00                	push   $0x0
    21da:	e8 a5 19 00 00       	call   3b84 <printf>
    21df:	83 c4 10             	add    $0x10,%esp
	  return;
    21e2:	e9 15 01 00 00       	jmp    22fc <initializeASCII+0x166>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    21e7:	83 ec 0c             	sub    $0xc,%esp
    21ea:	68 00 10 00 00       	push   $0x1000
    21ef:	e8 61 1c 00 00       	call   3e55 <malloc>
    21f4:	83 c4 10             	add    $0x10,%esp
    21f7:	a3 40 1a 01 00       	mov    %eax,0x11a40
	for (i = 0; i < ASCII_NUM; i++)
    21fc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2203:	eb 12                	jmp    2217 <initializeASCII+0x81>
	{
		hankaku[i] = 0;
    2205:	8b 15 40 1a 01 00    	mov    0x11a40,%edx
    220b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    220e:	01 d0                	add    %edx,%eax
    2210:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    2213:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2217:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    221e:	7e e5                	jle    2205 <initializeASCII+0x6f>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    2220:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    2227:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    222e:	e9 84 00 00 00       	jmp    22b7 <initializeASCII+0x121>
	{
		for (i = 0; i < n; i++){
    2233:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    223a:	eb 73                	jmp    22af <initializeASCII+0x119>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    223c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    223f:	05 80 1a 01 00       	add    $0x11a80,%eax
    2244:	0f b6 00             	movzbl (%eax),%eax
    2247:	3c 2a                	cmp    $0x2a,%al
    2249:	74 0f                	je     225a <initializeASCII+0xc4>
    224b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    224e:	05 80 1a 01 00       	add    $0x11a80,%eax
    2253:	0f b6 00             	movzbl (%eax),%eax
    2256:	3c 2e                	cmp    $0x2e,%al
    2258:	75 51                	jne    22ab <initializeASCII+0x115>
			{
				if (buf[i] == '*')
    225a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    225d:	05 80 1a 01 00       	add    $0x11a80,%eax
    2262:	0f b6 00             	movzbl (%eax),%eax
    2265:	3c 2a                	cmp    $0x2a,%al
    2267:	75 2d                	jne    2296 <initializeASCII+0x100>
				{
					hankaku[y] |= (0x80 >> x);
    2269:	8b 15 40 1a 01 00    	mov    0x11a40,%edx
    226f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2272:	01 c2                	add    %eax,%edx
    2274:	8b 0d 40 1a 01 00    	mov    0x11a40,%ecx
    227a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    227d:	01 c8                	add    %ecx,%eax
    227f:	0f b6 00             	movzbl (%eax),%eax
    2282:	89 c3                	mov    %eax,%ebx
    2284:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2287:	be 80 00 00 00       	mov    $0x80,%esi
    228c:	89 c1                	mov    %eax,%ecx
    228e:	d3 fe                	sar    %cl,%esi
    2290:	89 f0                	mov    %esi,%eax
    2292:	09 d8                	or     %ebx,%eax
    2294:	88 02                	mov    %al,(%edx)
				}
				x ++;
    2296:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    229a:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    229e:	7e 0b                	jle    22ab <initializeASCII+0x115>
				{
					x = 0;
    22a0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    22a7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    22ab:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    22af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22b2:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    22b5:	7c 85                	jl     223c <initializeASCII+0xa6>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    22b7:	83 ec 04             	sub    $0x4,%esp
    22ba:	68 00 02 00 00       	push   $0x200
    22bf:	68 80 1a 01 00       	push   $0x11a80
    22c4:	ff 75 e8             	pushl  -0x18(%ebp)
    22c7:	e8 f3 16 00 00       	call   39bf <read>
    22cc:	83 c4 10             	add    $0x10,%esp
    22cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    22d2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    22d6:	0f 8f 57 ff ff ff    	jg     2233 <initializeASCII+0x9d>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    22dc:	83 ec 08             	sub    $0x8,%esp
    22df:	68 e8 a4 00 00       	push   $0xa4e8
    22e4:	6a 00                	push   $0x0
    22e6:	e8 99 18 00 00       	call   3b84 <printf>
    22eb:	83 c4 10             	add    $0x10,%esp
	close(fd);
    22ee:	83 ec 0c             	sub    $0xc,%esp
    22f1:	ff 75 e8             	pushl  -0x18(%ebp)
    22f4:	e8 d6 16 00 00       	call   39cf <close>
    22f9:	83 c4 10             	add    $0x10,%esp
}
    22fc:	8d 65 f8             	lea    -0x8(%ebp),%esp
    22ff:	5b                   	pop    %ebx
    2300:	5e                   	pop    %esi
    2301:	5d                   	pop    %ebp
    2302:	c3                   	ret    

00002303 <freeASCII>:

void freeASCII(){
    2303:	55                   	push   %ebp
    2304:	89 e5                	mov    %esp,%ebp
    2306:	83 ec 08             	sub    $0x8,%esp
	free(hankaku);
    2309:	a1 40 1a 01 00       	mov    0x11a40,%eax
    230e:	83 ec 0c             	sub    $0xc,%esp
    2311:	50                   	push   %eax
    2312:	e8 fd 19 00 00       	call   3d14 <free>
    2317:	83 c4 10             	add    $0x10,%esp
}
    231a:	c9                   	leave  
    231b:	c3                   	ret    

0000231c <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    231c:	55                   	push   %ebp
    231d:	89 e5                	mov    %esp,%ebp
    231f:	83 ec 18             	sub    $0x18,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    2322:	83 ec 08             	sub    $0x8,%esp
    2325:	68 05 a5 00 00       	push   $0xa505
    232a:	6a 00                	push   $0x0
    232c:	e8 53 18 00 00       	call   3b84 <printf>
    2331:	83 c4 10             	add    $0x10,%esp
	if((fd = open(HZK16, 0)) < 0){
    2334:	83 ec 08             	sub    $0x8,%esp
    2337:	6a 00                	push   $0x0
    2339:	68 16 a5 00 00       	push   $0xa516
    233e:	e8 a4 16 00 00       	call   39e7 <open>
    2343:	83 c4 10             	add    $0x10,%esp
    2346:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2349:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    234d:	79 19                	jns    2368 <initializeGBK+0x4c>
		printf(0,"cannot open %s\n", HZK16);
    234f:	83 ec 04             	sub    $0x4,%esp
    2352:	68 16 a5 00 00       	push   $0xa516
    2357:	68 d8 a4 00 00       	push   $0xa4d8
    235c:	6a 00                	push   $0x0
    235e:	e8 21 18 00 00       	call   3b84 <printf>
    2363:	83 c4 10             	add    $0x10,%esp
		return;
    2366:	eb 53                	jmp    23bb <initializeGBK+0x9f>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    2368:	83 ec 0c             	sub    $0xc,%esp
    236b:	68 78 69 00 00       	push   $0x6978
    2370:	e8 e0 1a 00 00       	call   3e55 <malloc>
    2375:	83 c4 10             	add    $0x10,%esp
    2378:	a3 44 1a 01 00       	mov    %eax,0x11a44
	fontFile.size = read(fd, fontFile.buf, 27000);
    237d:	a1 44 1a 01 00       	mov    0x11a44,%eax
    2382:	83 ec 04             	sub    $0x4,%esp
    2385:	68 78 69 00 00       	push   $0x6978
    238a:	50                   	push   %eax
    238b:	ff 75 f4             	pushl  -0xc(%ebp)
    238e:	e8 2c 16 00 00       	call   39bf <read>
    2393:	83 c4 10             	add    $0x10,%esp
    2396:	a3 48 1a 01 00       	mov    %eax,0x11a48
	printf(0,"initialzing gbk complete!\n");
    239b:	83 ec 08             	sub    $0x8,%esp
    239e:	68 20 a5 00 00       	push   $0xa520
    23a3:	6a 00                	push   $0x0
    23a5:	e8 da 17 00 00       	call   3b84 <printf>
    23aa:	83 c4 10             	add    $0x10,%esp
	close(fd);
    23ad:	83 ec 0c             	sub    $0xc,%esp
    23b0:	ff 75 f4             	pushl  -0xc(%ebp)
    23b3:	e8 17 16 00 00       	call   39cf <close>
    23b8:	83 c4 10             	add    $0x10,%esp
}
    23bb:	c9                   	leave  
    23bc:	c3                   	ret    

000023bd <freeGBK>:

void freeGBK(){
    23bd:	55                   	push   %ebp
    23be:	89 e5                	mov    %esp,%ebp
    23c0:	83 ec 08             	sub    $0x8,%esp
	free(fontFile.buf);
    23c3:	a1 44 1a 01 00       	mov    0x11a44,%eax
    23c8:	83 ec 0c             	sub    $0xc,%esp
    23cb:	50                   	push   %eax
    23cc:	e8 43 19 00 00       	call   3d14 <free>
    23d1:	83 c4 10             	add    $0x10,%esp
}
    23d4:	c9                   	leave  
    23d5:	c3                   	ret    

000023d6 <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    23d6:	55                   	push   %ebp
    23d7:	89 e5                	mov    %esp,%ebp
    23d9:	53                   	push   %ebx
    23da:	83 ec 18             	sub    $0x18,%esp
    23dd:	8b 55 14             	mov    0x14(%ebp),%edx
    23e0:	8b 45 18             	mov    0x18(%ebp),%eax
    23e3:	88 55 e8             	mov    %dl,-0x18(%ebp)
    23e6:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    23ea:	8b 45 20             	mov    0x20(%ebp),%eax
    23ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
    23f0:	eb 6b                	jmp    245d <put_ascii+0x87>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    23f2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    23f9:	eb 58                	jmp    2453 <put_ascii+0x7d>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    23fb:	8b 15 40 1a 01 00    	mov    0x11a40,%edx
    2401:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
    2405:	c1 e0 04             	shl    $0x4,%eax
    2408:	89 c1                	mov    %eax,%ecx
    240a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    240d:	2b 45 20             	sub    0x20(%ebp),%eax
    2410:	01 c8                	add    %ecx,%eax
    2412:	01 d0                	add    %edx,%eax
    2414:	0f b6 00             	movzbl (%eax),%eax
    2417:	0f b6 d0             	movzbl %al,%edx
    241a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    241d:	89 c1                	mov    %eax,%ecx
    241f:	d3 e2                	shl    %cl,%edx
    2421:	89 d0                	mov    %edx,%eax
    2423:	25 80 00 00 00       	and    $0x80,%eax
    2428:	85 c0                	test   %eax,%eax
    242a:	74 23                	je     244f <put_ascii+0x79>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    242c:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2430:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2433:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2436:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    2439:	01 d9                	add    %ebx,%ecx
    243b:	52                   	push   %edx
    243c:	50                   	push   %eax
    243d:	51                   	push   %ecx
    243e:	ff 75 10             	pushl  0x10(%ebp)
    2441:	ff 75 0c             	pushl  0xc(%ebp)
    2444:	ff 75 08             	pushl  0x8(%ebp)
    2447:	e8 21 fc ff ff       	call   206d <draw_point>
    244c:	83 c4 18             	add    $0x18,%esp
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    244f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2453:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2457:	7e a2                	jle    23fb <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    2459:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    245d:	8b 45 20             	mov    0x20(%ebp),%eax
    2460:	83 c0 10             	add    $0x10,%eax
    2463:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2466:	7f 8a                	jg     23f2 <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    2468:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    246b:	c9                   	leave  
    246c:	c3                   	ret    

0000246d <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    246d:	55                   	push   %ebp
    246e:	89 e5                	mov    %esp,%ebp
    2470:	53                   	push   %ebx
    2471:	83 ec 18             	sub    $0x18,%esp
    2474:	8b 55 14             	mov    0x14(%ebp),%edx
    2477:	8b 45 18             	mov    0x18(%ebp),%eax
    247a:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    247e:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    2482:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    2486:	0f b6 c0             	movzbl %al,%eax
    2489:	3d a0 00 00 00       	cmp    $0xa0,%eax
    248e:	0f 8e 1e 01 00 00    	jle    25b2 <put_gbk+0x145>
    2494:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2498:	66 c1 f8 08          	sar    $0x8,%ax
    249c:	98                   	cwtl   
    249d:	0f b6 c0             	movzbl %al,%eax
    24a0:	3d a0 00 00 00       	cmp    $0xa0,%eax
    24a5:	0f 8e 07 01 00 00    	jle    25b2 <put_gbk+0x145>
		hzk16Base = fontFile.buf;
    24ab:	a1 44 1a 01 00       	mov    0x11a44,%eax
    24b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    24b3:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    24b7:	0f b6 c0             	movzbl %al,%eax
    24ba:	2d a1 00 00 00       	sub    $0xa1,%eax
    24bf:	6b c0 5e             	imul   $0x5e,%eax,%eax
    24c2:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    24c6:	66 c1 fa 08          	sar    $0x8,%dx
    24ca:	0f bf d2             	movswl %dx,%edx
    24cd:	0f b6 d2             	movzbl %dl,%edx
    24d0:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    24d6:	01 d0                	add    %edx,%eax
    24d8:	c1 e0 05             	shl    $0x5,%eax
    24db:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    24de:	8b 45 20             	mov    0x20(%ebp),%eax
    24e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    24e4:	e9 b8 00 00 00       	jmp    25a1 <put_gbk+0x134>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    24e9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    24f0:	eb 47                	jmp    2539 <put_gbk+0xcc>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    24f2:	8b 55 ec             	mov    -0x14(%ebp),%edx
    24f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    24f8:	01 d0                	add    %edx,%eax
    24fa:	0f b6 00             	movzbl (%eax),%eax
    24fd:	0f b6 d0             	movzbl %al,%edx
    2500:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2503:	89 c1                	mov    %eax,%ecx
    2505:	d3 e2                	shl    %cl,%edx
    2507:	89 d0                	mov    %edx,%eax
    2509:	25 80 00 00 00       	and    $0x80,%eax
    250e:	85 c0                	test   %eax,%eax
    2510:	74 23                	je     2535 <put_gbk+0xc8>
					draw_point(c, x + tmpX, tmpY, colorNum);
    2512:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2516:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2519:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    251c:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    251f:	01 d9                	add    %ebx,%ecx
    2521:	52                   	push   %edx
    2522:	50                   	push   %eax
    2523:	51                   	push   %ecx
    2524:	ff 75 10             	pushl  0x10(%ebp)
    2527:	ff 75 0c             	pushl  0xc(%ebp)
    252a:	ff 75 08             	pushl  0x8(%ebp)
    252d:	e8 3b fb ff ff       	call   206d <draw_point>
    2532:	83 c4 18             	add    $0x18,%esp
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2535:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2539:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    253d:	7e b3                	jle    24f2 <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    253f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2543:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    254a:	eb 47                	jmp    2593 <put_gbk+0x126>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    254c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    254f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2552:	01 d0                	add    %edx,%eax
    2554:	0f b6 00             	movzbl (%eax),%eax
    2557:	0f b6 d0             	movzbl %al,%edx
    255a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    255d:	89 c1                	mov    %eax,%ecx
    255f:	d3 e2                	shl    %cl,%edx
    2561:	89 d0                	mov    %edx,%eax
    2563:	25 80 00 00 00       	and    $0x80,%eax
    2568:	85 c0                	test   %eax,%eax
    256a:	74 23                	je     258f <put_gbk+0x122>
					draw_point(c, x + tmpX, tmpY, colorNum);
    256c:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2570:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2573:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2576:	8b 4d f8             	mov    -0x8(%ebp),%ecx
    2579:	01 d9                	add    %ebx,%ecx
    257b:	52                   	push   %edx
    257c:	50                   	push   %eax
    257d:	51                   	push   %ecx
    257e:	ff 75 10             	pushl  0x10(%ebp)
    2581:	ff 75 0c             	pushl  0xc(%ebp)
    2584:	ff 75 08             	pushl  0x8(%ebp)
    2587:	e8 e1 fa ff ff       	call   206d <draw_point>
    258c:	83 c4 18             	add    $0x18,%esp
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    258f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2593:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2597:	7e b3                	jle    254c <put_gbk+0xdf>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    2599:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    259d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    25a1:	8b 45 20             	mov    0x20(%ebp),%eax
    25a4:	83 c0 10             	add    $0x10,%eax
    25a7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    25aa:	0f 8f 39 ff ff ff    	jg     24e9 <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    25b0:	eb 50                	jmp    2602 <put_gbk+0x195>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    25b2:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    25b6:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    25ba:	0f b6 c0             	movzbl %al,%eax
    25bd:	ff 75 20             	pushl  0x20(%ebp)
    25c0:	ff 75 1c             	pushl  0x1c(%ebp)
    25c3:	52                   	push   %edx
    25c4:	50                   	push   %eax
    25c5:	ff 75 10             	pushl  0x10(%ebp)
    25c8:	ff 75 0c             	pushl  0xc(%ebp)
    25cb:	ff 75 08             	pushl  0x8(%ebp)
    25ce:	e8 03 fe ff ff       	call   23d6 <put_ascii>
    25d3:	83 c4 1c             	add    $0x1c,%esp
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    25d6:	8b 45 1c             	mov    0x1c(%ebp),%eax
    25d9:	8d 48 08             	lea    0x8(%eax),%ecx
    25dc:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    25e0:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    25e4:	66 c1 f8 08          	sar    $0x8,%ax
    25e8:	0f b6 c0             	movzbl %al,%eax
    25eb:	ff 75 20             	pushl  0x20(%ebp)
    25ee:	51                   	push   %ecx
    25ef:	52                   	push   %edx
    25f0:	50                   	push   %eax
    25f1:	ff 75 10             	pushl  0x10(%ebp)
    25f4:	ff 75 0c             	pushl  0xc(%ebp)
    25f7:	ff 75 08             	pushl  0x8(%ebp)
    25fa:	e8 d7 fd ff ff       	call   23d6 <put_ascii>
    25ff:	83 c4 1c             	add    $0x1c,%esp
	}
}
    2602:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2605:	c9                   	leave  
    2606:	c3                   	ret    

00002607 <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    2607:	55                   	push   %ebp
    2608:	89 e5                	mov    %esp,%ebp
    260a:	83 ec 28             	sub    $0x28,%esp
    260d:	8b 45 18             	mov    0x18(%ebp),%eax
    2610:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    2614:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    261b:	83 ec 0c             	sub    $0xc,%esp
    261e:	ff 75 14             	pushl  0x14(%ebp)
    2621:	e8 c0 11 00 00       	call   37e6 <strlen>
    2626:	83 c4 10             	add    $0x10,%esp
    2629:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    262c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2633:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2636:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2639:	eb 36                	jmp    2671 <puts_str+0x6a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    263b:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    263f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2642:	8b 45 14             	mov    0x14(%ebp),%eax
    2645:	01 c8                	add    %ecx,%eax
    2647:	0f b6 00             	movzbl (%eax),%eax
    264a:	0f b6 c0             	movzbl %al,%eax
    264d:	83 ec 04             	sub    $0x4,%esp
    2650:	ff 75 20             	pushl  0x20(%ebp)
    2653:	ff 75 f0             	pushl  -0x10(%ebp)
    2656:	52                   	push   %edx
    2657:	50                   	push   %eax
    2658:	ff 75 10             	pushl  0x10(%ebp)
    265b:	ff 75 0c             	pushl  0xc(%ebp)
    265e:	ff 75 08             	pushl  0x8(%ebp)
    2661:	e8 70 fd ff ff       	call   23d6 <put_ascii>
    2666:	83 c4 20             	add    $0x20,%esp
			xTmp += 8;
    2669:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    266d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    2671:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2674:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    2677:	72 c2                	jb     263b <puts_str+0x34>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    2679:	c9                   	leave  
    267a:	c3                   	ret    

0000267b <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    267b:	55                   	push   %ebp
    267c:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    267e:	8b 45 10             	mov    0x10(%ebp),%eax
    2681:	8d 50 07             	lea    0x7(%eax),%edx
    2684:	85 c0                	test   %eax,%eax
    2686:	0f 48 c2             	cmovs  %edx,%eax
    2689:	c1 f8 03             	sar    $0x3,%eax
    268c:	89 c1                	mov    %eax,%ecx
    268e:	8b 45 0c             	mov    0xc(%ebp),%eax
    2691:	8d 50 03             	lea    0x3(%eax),%edx
    2694:	85 c0                	test   %eax,%eax
    2696:	0f 48 c2             	cmovs  %edx,%eax
    2699:	c1 f8 02             	sar    $0x2,%eax
    269c:	c1 e0 05             	shl    $0x5,%eax
    269f:	01 c1                	add    %eax,%ecx
    26a1:	8b 45 08             	mov    0x8(%ebp),%eax
    26a4:	8d 50 07             	lea    0x7(%eax),%edx
    26a7:	85 c0                	test   %eax,%eax
    26a9:	0f 48 c2             	cmovs  %edx,%eax
    26ac:	c1 f8 03             	sar    $0x3,%eax
    26af:	c1 e0 0b             	shl    $0xb,%eax
    26b2:	01 c8                	add    %ecx,%eax
}
    26b4:	5d                   	pop    %ebp
    26b5:	c3                   	ret    

000026b6 <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    26b6:	55                   	push   %ebp
    26b7:	89 e5                	mov    %esp,%ebp
    26b9:	53                   	push   %ebx
    26ba:	83 ec 10             	sub    $0x10,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    26bd:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    26c4:	e9 98 00 00 00       	jmp    2761 <draw_picture+0xab>
	{
		for (j = 0; j < pic.width; j++)
    26c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    26d0:	eb 7f                	jmp    2751 <draw_picture+0x9b>
		{
			rgb = pic.data[i*pic.width+j];
    26d2:	8b 55 14             	mov    0x14(%ebp),%edx
    26d5:	8b 45 18             	mov    0x18(%ebp),%eax
    26d8:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    26dc:	89 c1                	mov    %eax,%ecx
    26de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26e1:	01 c8                	add    %ecx,%eax
    26e3:	c1 e0 02             	shl    $0x2,%eax
    26e6:	01 d0                	add    %edx,%eax
    26e8:	8b 00                	mov    (%eax),%eax
    26ea:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    26ed:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    26f1:	3c 01                	cmp    $0x1,%al
    26f3:	75 02                	jne    26f7 <draw_picture+0x41>
    26f5:	eb 56                	jmp    274d <draw_picture+0x97>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    26f7:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    26fb:	0f b6 c8             	movzbl %al,%ecx
    26fe:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    2702:	0f b6 d0             	movzbl %al,%edx
    2705:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    2709:	0f b6 c0             	movzbl %al,%eax
    270c:	51                   	push   %ecx
    270d:	52                   	push   %edx
    270e:	50                   	push   %eax
    270f:	e8 67 ff ff ff       	call   267b <_RGB16BIT565>
    2714:	83 c4 0c             	add    $0xc,%esp
    2717:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    271b:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
    271f:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2722:	83 ea 01             	sub    $0x1,%edx
    2725:	89 d1                	mov    %edx,%ecx
    2727:	2b 4d f8             	sub    -0x8(%ebp),%ecx
    272a:	8b 55 24             	mov    0x24(%ebp),%edx
    272d:	01 ca                	add    %ecx,%edx
    272f:	89 d3                	mov    %edx,%ebx
    2731:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2734:	8b 55 20             	mov    0x20(%ebp),%edx
    2737:	01 ca                	add    %ecx,%edx
    2739:	50                   	push   %eax
    273a:	53                   	push   %ebx
    273b:	52                   	push   %edx
    273c:	ff 75 10             	pushl  0x10(%ebp)
    273f:	ff 75 0c             	pushl  0xc(%ebp)
    2742:	ff 75 08             	pushl  0x8(%ebp)
    2745:	e8 23 f9 ff ff       	call   206d <draw_point>
    274a:	83 c4 18             	add    $0x18,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    274d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2751:	8b 45 18             	mov    0x18(%ebp),%eax
    2754:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2757:	0f 8f 75 ff ff ff    	jg     26d2 <draw_picture+0x1c>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    275d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2761:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2764:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    2767:	0f 8f 5c ff ff ff    	jg     26c9 <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    276d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2770:	c9                   	leave  
    2771:	c3                   	ret    

00002772 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    2772:	55                   	push   %ebp
    2773:	89 e5                	mov    %esp,%ebp
    2775:	83 ec 24             	sub    $0x24,%esp
    2778:	8b 45 24             	mov    0x24(%ebp),%eax
    277b:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    277f:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2782:	2b 45 14             	sub    0x14(%ebp),%eax
    2785:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    2788:	8b 45 20             	mov    0x20(%ebp),%eax
    278b:	2b 45 18             	sub    0x18(%ebp),%eax
    278e:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    2791:	8b 45 14             	mov    0x14(%ebp),%eax
    2794:	c1 e0 0a             	shl    $0xa,%eax
    2797:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    279a:	8b 45 18             	mov    0x18(%ebp),%eax
    279d:	c1 e0 0a             	shl    $0xa,%eax
    27a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    27a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    27a6:	c1 f8 1f             	sar    $0x1f,%eax
    27a9:	31 45 fc             	xor    %eax,-0x4(%ebp)
    27ac:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    27af:	8b 45 f8             	mov    -0x8(%ebp),%eax
    27b2:	c1 f8 1f             	sar    $0x1f,%eax
    27b5:	31 45 f8             	xor    %eax,-0x8(%ebp)
    27b8:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    27bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    27be:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    27c1:	7c 4f                	jl     2812 <draw_line+0xa0>
		len = dx + 1;
    27c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    27c6:	83 c0 01             	add    $0x1,%eax
    27c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    27cc:	8b 45 1c             	mov    0x1c(%ebp),%eax
    27cf:	3b 45 14             	cmp    0x14(%ebp),%eax
    27d2:	7e 07                	jle    27db <draw_line+0x69>
    27d4:	b8 00 04 00 00       	mov    $0x400,%eax
    27d9:	eb 05                	jmp    27e0 <draw_line+0x6e>
    27db:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    27e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    27e3:	8b 45 20             	mov    0x20(%ebp),%eax
    27e6:	3b 45 18             	cmp    0x18(%ebp),%eax
    27e9:	7c 12                	jl     27fd <draw_line+0x8b>
    27eb:	8b 45 20             	mov    0x20(%ebp),%eax
    27ee:	2b 45 18             	sub    0x18(%ebp),%eax
    27f1:	83 c0 01             	add    $0x1,%eax
    27f4:	c1 e0 0a             	shl    $0xa,%eax
    27f7:	99                   	cltd   
    27f8:	f7 7d ec             	idivl  -0x14(%ebp)
    27fb:	eb 10                	jmp    280d <draw_line+0x9b>
    27fd:	8b 45 20             	mov    0x20(%ebp),%eax
    2800:	2b 45 18             	sub    0x18(%ebp),%eax
    2803:	83 e8 01             	sub    $0x1,%eax
    2806:	c1 e0 0a             	shl    $0xa,%eax
    2809:	99                   	cltd   
    280a:	f7 7d ec             	idivl  -0x14(%ebp)
    280d:	89 45 f8             	mov    %eax,-0x8(%ebp)
    2810:	eb 4d                	jmp    285f <draw_line+0xed>
	}
	else {
		len = dy + 1;
    2812:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2815:	83 c0 01             	add    $0x1,%eax
    2818:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    281b:	8b 45 20             	mov    0x20(%ebp),%eax
    281e:	3b 45 18             	cmp    0x18(%ebp),%eax
    2821:	7e 07                	jle    282a <draw_line+0xb8>
    2823:	b8 00 04 00 00       	mov    $0x400,%eax
    2828:	eb 05                	jmp    282f <draw_line+0xbd>
    282a:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    282f:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    2832:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2835:	3b 45 14             	cmp    0x14(%ebp),%eax
    2838:	7c 12                	jl     284c <draw_line+0xda>
    283a:	8b 45 1c             	mov    0x1c(%ebp),%eax
    283d:	2b 45 14             	sub    0x14(%ebp),%eax
    2840:	83 c0 01             	add    $0x1,%eax
    2843:	c1 e0 0a             	shl    $0xa,%eax
    2846:	99                   	cltd   
    2847:	f7 7d ec             	idivl  -0x14(%ebp)
    284a:	eb 10                	jmp    285c <draw_line+0xea>
    284c:	8b 45 1c             	mov    0x1c(%ebp),%eax
    284f:	2b 45 14             	sub    0x14(%ebp),%eax
    2852:	83 e8 01             	sub    $0x1,%eax
    2855:	c1 e0 0a             	shl    $0xa,%eax
    2858:	99                   	cltd   
    2859:	f7 7d ec             	idivl  -0x14(%ebp)
    285c:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    285f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    2866:	eb 36                	jmp    289e <draw_line+0x12c>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    2868:	0f b7 45 dc          	movzwl -0x24(%ebp),%eax
    286c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    286f:	c1 fa 0a             	sar    $0xa,%edx
    2872:	89 d1                	mov    %edx,%ecx
    2874:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2877:	c1 fa 0a             	sar    $0xa,%edx
    287a:	50                   	push   %eax
    287b:	51                   	push   %ecx
    287c:	52                   	push   %edx
    287d:	ff 75 10             	pushl  0x10(%ebp)
    2880:	ff 75 0c             	pushl  0xc(%ebp)
    2883:	ff 75 08             	pushl  0x8(%ebp)
    2886:	e8 e2 f7 ff ff       	call   206d <draw_point>
    288b:	83 c4 18             	add    $0x18,%esp
		y += dy;
    288e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2891:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    2894:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2897:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    289a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    289e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    28a1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    28a4:	7c c2                	jl     2868 <draw_line+0xf6>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    28a6:	c9                   	leave  
    28a7:	c3                   	ret    

000028a8 <draw_window>:

void
draw_window(Context c, char *title)
{
    28a8:	55                   	push   %ebp
    28a9:	89 e5                	mov    %esp,%ebp
    28ab:	83 ec 18             	sub    $0x18,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    28ae:	8b 45 0c             	mov    0xc(%ebp),%eax
    28b1:	83 e8 01             	sub    $0x1,%eax
    28b4:	6a 00                	push   $0x0
    28b6:	6a 00                	push   $0x0
    28b8:	50                   	push   %eax
    28b9:	6a 00                	push   $0x0
    28bb:	6a 00                	push   $0x0
    28bd:	ff 75 10             	pushl  0x10(%ebp)
    28c0:	ff 75 0c             	pushl  0xc(%ebp)
    28c3:	ff 75 08             	pushl  0x8(%ebp)
    28c6:	e8 a7 fe ff ff       	call   2772 <draw_line>
    28cb:	83 c4 20             	add    $0x20,%esp
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    28ce:	8b 45 10             	mov    0x10(%ebp),%eax
    28d1:	8d 48 ff             	lea    -0x1(%eax),%ecx
    28d4:	8b 45 0c             	mov    0xc(%ebp),%eax
    28d7:	8d 50 ff             	lea    -0x1(%eax),%edx
    28da:	8b 45 0c             	mov    0xc(%ebp),%eax
    28dd:	83 e8 01             	sub    $0x1,%eax
    28e0:	6a 00                	push   $0x0
    28e2:	51                   	push   %ecx
    28e3:	52                   	push   %edx
    28e4:	6a 00                	push   $0x0
    28e6:	50                   	push   %eax
    28e7:	ff 75 10             	pushl  0x10(%ebp)
    28ea:	ff 75 0c             	pushl  0xc(%ebp)
    28ed:	ff 75 08             	pushl  0x8(%ebp)
    28f0:	e8 7d fe ff ff       	call   2772 <draw_line>
    28f5:	83 c4 20             	add    $0x20,%esp
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    28f8:	8b 45 10             	mov    0x10(%ebp),%eax
    28fb:	8d 48 ff             	lea    -0x1(%eax),%ecx
    28fe:	8b 45 10             	mov    0x10(%ebp),%eax
    2901:	8d 50 ff             	lea    -0x1(%eax),%edx
    2904:	8b 45 0c             	mov    0xc(%ebp),%eax
    2907:	83 e8 01             	sub    $0x1,%eax
    290a:	6a 00                	push   $0x0
    290c:	51                   	push   %ecx
    290d:	6a 00                	push   $0x0
    290f:	52                   	push   %edx
    2910:	50                   	push   %eax
    2911:	ff 75 10             	pushl  0x10(%ebp)
    2914:	ff 75 0c             	pushl  0xc(%ebp)
    2917:	ff 75 08             	pushl  0x8(%ebp)
    291a:	e8 53 fe ff ff       	call   2772 <draw_line>
    291f:	83 c4 20             	add    $0x20,%esp
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    2922:	8b 45 10             	mov    0x10(%ebp),%eax
    2925:	83 e8 01             	sub    $0x1,%eax
    2928:	6a 00                	push   $0x0
    292a:	6a 00                	push   $0x0
    292c:	6a 00                	push   $0x0
    292e:	50                   	push   %eax
    292f:	6a 00                	push   $0x0
    2931:	ff 75 10             	pushl  0x10(%ebp)
    2934:	ff 75 0c             	pushl  0xc(%ebp)
    2937:	ff 75 08             	pushl  0x8(%ebp)
    293a:	e8 33 fe ff ff       	call   2772 <draw_line>
    293f:	83 c4 20             	add    $0x20,%esp
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    2942:	8b 45 0c             	mov    0xc(%ebp),%eax
    2945:	83 e8 02             	sub    $0x2,%eax
    2948:	68 cb 5a 00 00       	push   $0x5acb
    294d:	6a 14                	push   $0x14
    294f:	50                   	push   %eax
    2950:	6a 01                	push   $0x1
    2952:	6a 01                	push   $0x1
    2954:	ff 75 10             	pushl  0x10(%ebp)
    2957:	ff 75 0c             	pushl  0xc(%ebp)
    295a:	ff 75 08             	pushl  0x8(%ebp)
    295d:	e8 4a f7 ff ff       	call   20ac <fill_rect>
    2962:	83 c4 20             	add    $0x20,%esp
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    2965:	8b 45 0c             	mov    0xc(%ebp),%eax
    2968:	83 e8 02             	sub    $0x2,%eax
    296b:	89 c2                	mov    %eax,%edx
    296d:	8b 45 10             	mov    0x10(%ebp),%eax
    2970:	83 e8 15             	sub    $0x15,%eax
    2973:	68 cb 5a 00 00       	push   $0x5acb
    2978:	6a 14                	push   $0x14
    297a:	52                   	push   %edx
    297b:	50                   	push   %eax
    297c:	6a 01                	push   $0x1
    297e:	ff 75 10             	pushl  0x10(%ebp)
    2981:	ff 75 0c             	pushl  0xc(%ebp)
    2984:	ff 75 08             	pushl  0x8(%ebp)
    2987:	e8 20 f7 ff ff       	call   20ac <fill_rect>
    298c:	83 c4 20             	add    $0x20,%esp

  loadBitmap(&pic, "close.bmp");
    298f:	83 ec 08             	sub    $0x8,%esp
    2992:	68 3b a5 00 00       	push   $0xa53b
    2997:	8d 45 ec             	lea    -0x14(%ebp),%eax
    299a:	50                   	push   %eax
    299b:	e8 fb 00 00 00       	call   2a9b <loadBitmap>
    29a0:	83 c4 10             	add    $0x10,%esp
  draw_picture(c, pic, 3, 3);
    29a3:	6a 03                	push   $0x3
    29a5:	6a 03                	push   $0x3
    29a7:	ff 75 f4             	pushl  -0xc(%ebp)
    29aa:	ff 75 f0             	pushl  -0x10(%ebp)
    29ad:	ff 75 ec             	pushl  -0x14(%ebp)
    29b0:	ff 75 10             	pushl  0x10(%ebp)
    29b3:	ff 75 0c             	pushl  0xc(%ebp)
    29b6:	ff 75 08             	pushl  0x8(%ebp)
    29b9:	e8 f8 fc ff ff       	call   26b6 <draw_picture>
    29be:	83 c4 20             	add    $0x20,%esp
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    29c1:	83 ec 04             	sub    $0x4,%esp
    29c4:	6a 02                	push   $0x2
    29c6:	6a 19                	push   $0x19
    29c8:	68 ff ff 00 00       	push   $0xffff
    29cd:	ff 75 14             	pushl  0x14(%ebp)
    29d0:	ff 75 10             	pushl  0x10(%ebp)
    29d3:	ff 75 0c             	pushl  0xc(%ebp)
    29d6:	ff 75 08             	pushl  0x8(%ebp)
    29d9:	e8 29 fc ff ff       	call   2607 <puts_str>
    29de:	83 c4 20             	add    $0x20,%esp
  freepic(&pic);
    29e1:	83 ec 0c             	sub    $0xc,%esp
    29e4:	8d 45 ec             	lea    -0x14(%ebp),%eax
    29e7:	50                   	push   %eax
    29e8:	e8 cd 05 00 00       	call   2fba <freepic>
    29ed:	83 c4 10             	add    $0x10,%esp
}
    29f0:	c9                   	leave  
    29f1:	c3                   	ret    

000029f2 <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    29f2:	55                   	push   %ebp
    29f3:	89 e5                	mov    %esp,%ebp
    29f5:	83 ec 18             	sub    $0x18,%esp
	int i;
	for (i = 0; i < len; i++)
    29f8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    29ff:	eb 2c                	jmp    2a2d <load_iconlist+0x3b>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    2a01:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a04:	6b d0 34             	imul   $0x34,%eax,%edx
    2a07:	8b 45 08             	mov    0x8(%ebp),%eax
    2a0a:	01 d0                	add    %edx,%eax
    2a0c:	89 c1                	mov    %eax,%ecx
    2a0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a11:	6b d0 34             	imul   $0x34,%eax,%edx
    2a14:	8b 45 08             	mov    0x8(%ebp),%eax
    2a17:	01 d0                	add    %edx,%eax
    2a19:	83 c0 28             	add    $0x28,%eax
    2a1c:	83 ec 08             	sub    $0x8,%esp
    2a1f:	51                   	push   %ecx
    2a20:	50                   	push   %eax
    2a21:	e8 75 00 00 00       	call   2a9b <loadBitmap>
    2a26:	83 c4 10             	add    $0x10,%esp
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    2a29:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2a2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a30:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2a33:	7c cc                	jl     2a01 <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    2a35:	c9                   	leave  
    2a36:	c3                   	ret    

00002a37 <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    2a37:	55                   	push   %ebp
    2a38:	89 e5                	mov    %esp,%ebp
    2a3a:	53                   	push   %ebx
    2a3b:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; i < len; i++)
    2a3e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2a45:	eb 47                	jmp    2a8e <draw_iconlist+0x57>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    2a47:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2a4a:	6b d0 34             	imul   $0x34,%eax,%edx
    2a4d:	8b 45 14             	mov    0x14(%ebp),%eax
    2a50:	01 d0                	add    %edx,%eax
    2a52:	8b 48 24             	mov    0x24(%eax),%ecx
    2a55:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2a58:	6b d0 34             	imul   $0x34,%eax,%edx
    2a5b:	8b 45 14             	mov    0x14(%ebp),%eax
    2a5e:	01 d0                	add    %edx,%eax
    2a60:	8b 50 20             	mov    0x20(%eax),%edx
    2a63:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2a66:	6b d8 34             	imul   $0x34,%eax,%ebx
    2a69:	8b 45 14             	mov    0x14(%ebp),%eax
    2a6c:	01 d8                	add    %ebx,%eax
    2a6e:	51                   	push   %ecx
    2a6f:	52                   	push   %edx
    2a70:	ff 70 30             	pushl  0x30(%eax)
    2a73:	ff 70 2c             	pushl  0x2c(%eax)
    2a76:	ff 70 28             	pushl  0x28(%eax)
    2a79:	ff 75 10             	pushl  0x10(%ebp)
    2a7c:	ff 75 0c             	pushl  0xc(%ebp)
    2a7f:	ff 75 08             	pushl  0x8(%ebp)
    2a82:	e8 2f fc ff ff       	call   26b6 <draw_picture>
    2a87:	83 c4 20             	add    $0x20,%esp
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    2a8a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2a8e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2a91:	3b 45 18             	cmp    0x18(%ebp),%eax
    2a94:	7c b1                	jl     2a47 <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    2a96:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2a99:	c9                   	leave  
    2a9a:	c3                   	ret    

00002a9b <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    2a9b:	55                   	push   %ebp
    2a9c:	89 e5                	mov    %esp,%ebp
    2a9e:	81 ec 88 00 00 00    	sub    $0x88,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    2aa4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    2aab:	83 ec 08             	sub    $0x8,%esp
    2aae:	6a 00                	push   $0x0
    2ab0:	ff 75 0c             	pushl  0xc(%ebp)
    2ab3:	e8 2f 0f 00 00       	call   39e7 <open>
    2ab8:	83 c4 10             	add    $0x10,%esp
    2abb:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2abe:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2ac2:	79 1a                	jns    2ade <loadBitmap+0x43>
		printf(0, "cannot open %s\n", pic_name);
    2ac4:	83 ec 04             	sub    $0x4,%esp
    2ac7:	ff 75 0c             	pushl  0xc(%ebp)
    2aca:	68 48 a5 00 00       	push   $0xa548
    2acf:	6a 00                	push   $0x0
    2ad1:	e8 ae 10 00 00       	call   3b84 <printf>
    2ad6:	83 c4 10             	add    $0x10,%esp
		return;
    2ad9:	e9 ca 02 00 00       	jmp    2da8 <loadBitmap+0x30d>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    2ade:	83 ec 04             	sub    $0x4,%esp
    2ae1:	ff 75 0c             	pushl  0xc(%ebp)
    2ae4:	68 58 a5 00 00       	push   $0xa558
    2ae9:	6a 00                	push   $0x0
    2aeb:	e8 94 10 00 00       	call   3b84 <printf>
    2af0:	83 c4 10             	add    $0x10,%esp
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    2af3:	83 ec 0c             	sub    $0xc,%esp
    2af6:	6a 0e                	push   $0xe
    2af8:	e8 58 13 00 00       	call   3e55 <malloc>
    2afd:	83 c4 10             	add    $0x10,%esp
    2b00:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    2b03:	83 ec 04             	sub    $0x4,%esp
    2b06:	6a 0e                	push   $0xe
    2b08:	ff 75 e4             	pushl  -0x1c(%ebp)
    2b0b:	ff 75 e8             	pushl  -0x18(%ebp)
    2b0e:	e8 ac 0e 00 00       	call   39bf <read>
    2b13:	83 c4 10             	add    $0x10,%esp
    2b16:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    2b19:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b1c:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    2b1f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2b22:	0f b7 00             	movzwl (%eax),%eax
    2b25:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    2b29:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    2b2d:	66 3d 42 4d          	cmp    $0x4d42,%ax
    2b31:	74 17                	je     2b4a <loadBitmap+0xaf>
		printf(0, "file is not .bmp file!");
    2b33:	83 ec 08             	sub    $0x8,%esp
    2b36:	68 6c a5 00 00       	push   $0xa56c
    2b3b:	6a 00                	push   $0x0
    2b3d:	e8 42 10 00 00       	call   3b84 <printf>
    2b42:	83 c4 10             	add    $0x10,%esp
		return;
    2b45:	e9 5e 02 00 00       	jmp    2da8 <loadBitmap+0x30d>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    2b4a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b4d:	83 c0 02             	add    $0x2,%eax
    2b50:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    2b53:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2b56:	8b 00                	mov    (%eax),%eax
    2b58:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    2b5b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b5e:	83 c0 06             	add    $0x6,%eax
    2b61:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    2b64:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2b67:	0f b7 00             	movzwl (%eax),%eax
    2b6a:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    2b6e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b71:	83 c0 08             	add    $0x8,%eax
    2b74:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    2b77:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2b7a:	0f b7 00             	movzwl (%eax),%eax
    2b7d:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    2b81:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b84:	83 c0 0a             	add    $0xa,%eax
    2b87:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    2b8a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2b8d:	8b 00                	mov    (%eax),%eax
    2b8f:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    2b92:	83 ec 04             	sub    $0x4,%esp
    2b95:	6a 28                	push   $0x28
    2b97:	8d 45 84             	lea    -0x7c(%ebp),%eax
    2b9a:	50                   	push   %eax
    2b9b:	ff 75 e8             	pushl  -0x18(%ebp)
    2b9e:	e8 1c 0e 00 00       	call   39bf <read>
    2ba3:	83 c4 10             	add    $0x10,%esp
	width = bitInfoHead.biWidth;
    2ba6:	8b 45 88             	mov    -0x78(%ebp),%eax
    2ba9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    2bac:	8b 45 8c             	mov    -0x74(%ebp),%eax
    2baf:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    2bb2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2bb5:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    2bb9:	c1 e0 02             	shl    $0x2,%eax
    2bbc:	83 ec 0c             	sub    $0xc,%esp
    2bbf:	50                   	push   %eax
    2bc0:	ff 75 d0             	pushl  -0x30(%ebp)
    2bc3:	ff 75 d4             	pushl  -0x2c(%ebp)
    2bc6:	68 84 a5 00 00       	push   $0xa584
    2bcb:	6a 00                	push   $0x0
    2bcd:	e8 b2 0f 00 00       	call   3b84 <printf>
    2bd2:	83 c4 20             	add    $0x20,%esp
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    2bd5:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    2bd9:	75 12                	jne    2bed <loadBitmap+0x152>
		printf(0, "0");
    2bdb:	83 ec 08             	sub    $0x8,%esp
    2bde:	68 a9 a5 00 00       	push   $0xa5a9
    2be3:	6a 00                	push   $0x0
    2be5:	e8 9a 0f 00 00       	call   3b84 <printf>
    2bea:	83 c4 10             	add    $0x10,%esp
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    2bed:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    2bf1:	0f b7 c0             	movzwl %ax,%eax
    2bf4:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    2bf8:	83 c0 1f             	add    $0x1f,%eax
    2bfb:	8d 50 1f             	lea    0x1f(%eax),%edx
    2bfe:	85 c0                	test   %eax,%eax
    2c00:	0f 48 c2             	cmovs  %edx,%eax
    2c03:	c1 f8 05             	sar    $0x5,%eax
    2c06:	c1 e0 02             	shl    $0x2,%eax
    2c09:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    2c0c:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2c0f:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    2c13:	83 ec 0c             	sub    $0xc,%esp
    2c16:	50                   	push   %eax
    2c17:	e8 39 12 00 00       	call   3e55 <malloc>
    2c1c:	83 c4 10             	add    $0x10,%esp
    2c1f:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    2c22:	8b 55 d0             	mov    -0x30(%ebp),%edx
    2c25:	8b 45 cc             	mov    -0x34(%ebp),%eax
    2c28:	0f af c2             	imul   %edx,%eax
    2c2b:	83 ec 04             	sub    $0x4,%esp
    2c2e:	50                   	push   %eax
    2c2f:	6a 00                	push   $0x0
    2c31:	ff 75 c8             	pushl  -0x38(%ebp)
    2c34:	e8 d4 0b 00 00       	call   380d <memset>
    2c39:	83 c4 10             	add    $0x10,%esp
	long nData = height * l_width;
    2c3c:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2c3f:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    2c43:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    2c46:	83 ec 04             	sub    $0x4,%esp
    2c49:	ff 75 c4             	pushl  -0x3c(%ebp)
    2c4c:	ff 75 c8             	pushl  -0x38(%ebp)
    2c4f:	ff 75 e8             	pushl  -0x18(%ebp)
    2c52:	e8 68 0d 00 00       	call   39bf <read>
    2c57:	83 c4 10             	add    $0x10,%esp

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    2c5a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2c5d:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    2c61:	c1 e0 02             	shl    $0x2,%eax
    2c64:	83 ec 0c             	sub    $0xc,%esp
    2c67:	50                   	push   %eax
    2c68:	e8 e8 11 00 00       	call   3e55 <malloc>
    2c6d:	83 c4 10             	add    $0x10,%esp
    2c70:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    2c73:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    2c76:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2c79:	0f af c2             	imul   %edx,%eax
    2c7c:	c1 e0 02             	shl    $0x2,%eax
    2c7f:	83 ec 04             	sub    $0x4,%esp
    2c82:	50                   	push   %eax
    2c83:	6a 00                	push   $0x0
    2c85:	ff 75 c0             	pushl  -0x40(%ebp)
    2c88:	e8 80 0b 00 00       	call   380d <memset>
    2c8d:	83 c4 10             	add    $0x10,%esp
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    2c90:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    2c94:	66 83 f8 17          	cmp    $0x17,%ax
    2c98:	77 17                	ja     2cb1 <loadBitmap+0x216>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    2c9a:	83 ec 08             	sub    $0x8,%esp
    2c9d:	68 ac a5 00 00       	push   $0xa5ac
    2ca2:	6a 00                	push   $0x0
    2ca4:	e8 db 0e 00 00       	call   3b84 <printf>
    2ca9:	83 c4 10             	add    $0x10,%esp
		return;
    2cac:	e9 f7 00 00 00       	jmp    2da8 <loadBitmap+0x30d>
	} else	//位图为24位真彩色
	{
		index = 0;
    2cb1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    2cb8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2cbf:	e9 94 00 00 00       	jmp    2d58 <loadBitmap+0x2bd>
			for (j = 0; j < width; j++) {
    2cc4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2ccb:	eb 7b                	jmp    2d48 <loadBitmap+0x2ad>
				k = i * l_width + j * 3;
    2ccd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2cd0:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    2cd4:	89 c1                	mov    %eax,%ecx
    2cd6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2cd9:	89 d0                	mov    %edx,%eax
    2cdb:	01 c0                	add    %eax,%eax
    2cdd:	01 d0                	add    %edx,%eax
    2cdf:	01 c8                	add    %ecx,%eax
    2ce1:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    2ce4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ce7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    2cee:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2cf1:	01 c2                	add    %eax,%edx
    2cf3:	8b 45 bc             	mov    -0x44(%ebp),%eax
    2cf6:	8d 48 02             	lea    0x2(%eax),%ecx
    2cf9:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2cfc:	01 c8                	add    %ecx,%eax
    2cfe:	0f b6 00             	movzbl (%eax),%eax
    2d01:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    2d04:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d07:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    2d0e:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2d11:	01 c2                	add    %eax,%edx
    2d13:	8b 45 bc             	mov    -0x44(%ebp),%eax
    2d16:	8d 48 01             	lea    0x1(%eax),%ecx
    2d19:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2d1c:	01 c8                	add    %ecx,%eax
    2d1e:	0f b6 00             	movzbl (%eax),%eax
    2d21:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    2d24:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d27:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    2d2e:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2d31:	01 c2                	add    %eax,%edx
    2d33:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    2d36:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2d39:	01 c8                	add    %ecx,%eax
    2d3b:	0f b6 00             	movzbl (%eax),%eax
    2d3e:	88 02                	mov    %al,(%edx)
				index++;
    2d40:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    2d44:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2d48:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d4b:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    2d4e:	0f 8c 79 ff ff ff    	jl     2ccd <loadBitmap+0x232>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    2d54:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2d58:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d5b:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    2d5e:	0f 8c 60 ff ff ff    	jl     2cc4 <loadBitmap+0x229>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    2d64:	83 ec 0c             	sub    $0xc,%esp
    2d67:	ff 75 e8             	pushl  -0x18(%ebp)
    2d6a:	e8 60 0c 00 00       	call   39cf <close>
    2d6f:	83 c4 10             	add    $0x10,%esp

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    2d72:	8b 45 08             	mov    0x8(%ebp),%eax
    2d75:	8b 55 c0             	mov    -0x40(%ebp),%edx
    2d78:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    2d7a:	8b 45 08             	mov    0x8(%ebp),%eax
    2d7d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    2d80:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    2d83:	8b 45 08             	mov    0x8(%ebp),%eax
    2d86:	8b 55 d0             	mov    -0x30(%ebp),%edx
    2d89:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    2d8c:	83 ec 0c             	sub    $0xc,%esp
    2d8f:	ff 75 c8             	pushl  -0x38(%ebp)
    2d92:	e8 7d 0f 00 00       	call   3d14 <free>
    2d97:	83 c4 10             	add    $0x10,%esp
	free(BmpFileHeader);
    2d9a:	83 ec 0c             	sub    $0xc,%esp
    2d9d:	ff 75 e4             	pushl  -0x1c(%ebp)
    2da0:	e8 6f 0f 00 00       	call   3d14 <free>
    2da5:	83 c4 10             	add    $0x10,%esp
	//printf("\n");
}
    2da8:	c9                   	leave  
    2da9:	c3                   	ret    

00002daa <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    2daa:	55                   	push   %ebp
    2dab:	89 e5                	mov    %esp,%ebp
    2dad:	83 ec 08             	sub    $0x8,%esp
	printf(0, "位图文件头:\n");
    2db0:	83 ec 08             	sub    $0x8,%esp
    2db3:	68 cc a5 00 00       	push   $0xa5cc
    2db8:	6a 00                	push   $0x0
    2dba:	e8 c5 0d 00 00       	call   3b84 <printf>
    2dbf:	83 c4 10             	add    $0x10,%esp
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    2dc2:	8b 45 08             	mov    0x8(%ebp),%eax
    2dc5:	0f b7 00             	movzwl (%eax),%eax
    2dc8:	0f b7 c0             	movzwl %ax,%eax
    2dcb:	83 ec 04             	sub    $0x4,%esp
    2dce:	50                   	push   %eax
    2dcf:	68 de a5 00 00       	push   $0xa5de
    2dd4:	6a 00                	push   $0x0
    2dd6:	e8 a9 0d 00 00       	call   3b84 <printf>
    2ddb:	83 c4 10             	add    $0x10,%esp
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    2dde:	8b 45 08             	mov    0x8(%ebp),%eax
    2de1:	8b 40 04             	mov    0x4(%eax),%eax
    2de4:	83 ec 04             	sub    $0x4,%esp
    2de7:	50                   	push   %eax
    2de8:	68 fc a5 00 00       	push   $0xa5fc
    2ded:	6a 00                	push   $0x0
    2def:	e8 90 0d 00 00       	call   3b84 <printf>
    2df4:	83 c4 10             	add    $0x10,%esp
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    2df7:	8b 45 08             	mov    0x8(%ebp),%eax
    2dfa:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    2dfe:	0f b7 c0             	movzwl %ax,%eax
    2e01:	83 ec 04             	sub    $0x4,%esp
    2e04:	50                   	push   %eax
    2e05:	68 0d a6 00 00       	push   $0xa60d
    2e0a:	6a 00                	push   $0x0
    2e0c:	e8 73 0d 00 00       	call   3b84 <printf>
    2e11:	83 c4 10             	add    $0x10,%esp
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    2e14:	8b 45 08             	mov    0x8(%ebp),%eax
    2e17:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    2e1b:	0f b7 c0             	movzwl %ax,%eax
    2e1e:	83 ec 04             	sub    $0x4,%esp
    2e21:	50                   	push   %eax
    2e22:	68 0d a6 00 00       	push   $0xa60d
    2e27:	6a 00                	push   $0x0
    2e29:	e8 56 0d 00 00       	call   3b84 <printf>
    2e2e:	83 c4 10             	add    $0x10,%esp
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    2e31:	8b 45 08             	mov    0x8(%ebp),%eax
    2e34:	8b 40 0c             	mov    0xc(%eax),%eax
    2e37:	83 ec 04             	sub    $0x4,%esp
    2e3a:	50                   	push   %eax
    2e3b:	68 1c a6 00 00       	push   $0xa61c
    2e40:	6a 00                	push   $0x0
    2e42:	e8 3d 0d 00 00       	call   3b84 <printf>
    2e47:	83 c4 10             	add    $0x10,%esp
}
    2e4a:	c9                   	leave  
    2e4b:	c3                   	ret    

00002e4c <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    2e4c:	55                   	push   %ebp
    2e4d:	89 e5                	mov    %esp,%ebp
    2e4f:	83 ec 08             	sub    $0x8,%esp
	printf(0, "位图信息头:\n");
    2e52:	83 ec 08             	sub    $0x8,%esp
    2e55:	68 45 a6 00 00       	push   $0xa645
    2e5a:	6a 00                	push   $0x0
    2e5c:	e8 23 0d 00 00       	call   3b84 <printf>
    2e61:	83 c4 10             	add    $0x10,%esp
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    2e64:	8b 45 08             	mov    0x8(%ebp),%eax
    2e67:	8b 00                	mov    (%eax),%eax
    2e69:	83 ec 04             	sub    $0x4,%esp
    2e6c:	50                   	push   %eax
    2e6d:	68 57 a6 00 00       	push   $0xa657
    2e72:	6a 00                	push   $0x0
    2e74:	e8 0b 0d 00 00       	call   3b84 <printf>
    2e79:	83 c4 10             	add    $0x10,%esp
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    2e7c:	8b 45 08             	mov    0x8(%ebp),%eax
    2e7f:	8b 40 04             	mov    0x4(%eax),%eax
    2e82:	83 ec 04             	sub    $0x4,%esp
    2e85:	50                   	push   %eax
    2e86:	68 6e a6 00 00       	push   $0xa66e
    2e8b:	6a 00                	push   $0x0
    2e8d:	e8 f2 0c 00 00       	call   3b84 <printf>
    2e92:	83 c4 10             	add    $0x10,%esp
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    2e95:	8b 45 08             	mov    0x8(%ebp),%eax
    2e98:	8b 40 08             	mov    0x8(%eax),%eax
    2e9b:	83 ec 04             	sub    $0x4,%esp
    2e9e:	50                   	push   %eax
    2e9f:	68 7c a6 00 00       	push   $0xa67c
    2ea4:	6a 00                	push   $0x0
    2ea6:	e8 d9 0c 00 00       	call   3b84 <printf>
    2eab:	83 c4 10             	add    $0x10,%esp
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    2eae:	8b 45 08             	mov    0x8(%ebp),%eax
    2eb1:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    2eb5:	0f b7 c0             	movzwl %ax,%eax
    2eb8:	83 ec 04             	sub    $0x4,%esp
    2ebb:	50                   	push   %eax
    2ebc:	68 8a a6 00 00       	push   $0xa68a
    2ec1:	6a 00                	push   $0x0
    2ec3:	e8 bc 0c 00 00       	call   3b84 <printf>
    2ec8:	83 c4 10             	add    $0x10,%esp
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    2ecb:	8b 45 08             	mov    0x8(%ebp),%eax
    2ece:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    2ed2:	0f b7 c0             	movzwl %ax,%eax
    2ed5:	83 ec 04             	sub    $0x4,%esp
    2ed8:	50                   	push   %eax
    2ed9:	68 a0 a6 00 00       	push   $0xa6a0
    2ede:	6a 00                	push   $0x0
    2ee0:	e8 9f 0c 00 00       	call   3b84 <printf>
    2ee5:	83 c4 10             	add    $0x10,%esp
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    2ee8:	8b 45 08             	mov    0x8(%ebp),%eax
    2eeb:	8b 40 10             	mov    0x10(%eax),%eax
    2eee:	83 ec 04             	sub    $0x4,%esp
    2ef1:	50                   	push   %eax
    2ef2:	68 c1 a6 00 00       	push   $0xa6c1
    2ef7:	6a 00                	push   $0x0
    2ef9:	e8 86 0c 00 00       	call   3b84 <printf>
    2efe:	83 c4 10             	add    $0x10,%esp
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    2f01:	8b 45 08             	mov    0x8(%ebp),%eax
    2f04:	8b 40 14             	mov    0x14(%eax),%eax
    2f07:	83 ec 04             	sub    $0x4,%esp
    2f0a:	50                   	push   %eax
    2f0b:	68 d4 a6 00 00       	push   $0xa6d4
    2f10:	6a 00                	push   $0x0
    2f12:	e8 6d 0c 00 00       	call   3b84 <printf>
    2f17:	83 c4 10             	add    $0x10,%esp
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    2f1a:	8b 45 08             	mov    0x8(%ebp),%eax
    2f1d:	8b 40 18             	mov    0x18(%eax),%eax
    2f20:	83 ec 04             	sub    $0x4,%esp
    2f23:	50                   	push   %eax
    2f24:	68 08 a7 00 00       	push   $0xa708
    2f29:	6a 00                	push   $0x0
    2f2b:	e8 54 0c 00 00       	call   3b84 <printf>
    2f30:	83 c4 10             	add    $0x10,%esp
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    2f33:	8b 45 08             	mov    0x8(%ebp),%eax
    2f36:	8b 40 1c             	mov    0x1c(%eax),%eax
    2f39:	83 ec 04             	sub    $0x4,%esp
    2f3c:	50                   	push   %eax
    2f3d:	68 1d a7 00 00       	push   $0xa71d
    2f42:	6a 00                	push   $0x0
    2f44:	e8 3b 0c 00 00       	call   3b84 <printf>
    2f49:	83 c4 10             	add    $0x10,%esp
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    2f4c:	8b 45 08             	mov    0x8(%ebp),%eax
    2f4f:	8b 40 20             	mov    0x20(%eax),%eax
    2f52:	83 ec 04             	sub    $0x4,%esp
    2f55:	50                   	push   %eax
    2f56:	68 32 a7 00 00       	push   $0xa732
    2f5b:	6a 00                	push   $0x0
    2f5d:	e8 22 0c 00 00       	call   3b84 <printf>
    2f62:	83 c4 10             	add    $0x10,%esp
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    2f65:	8b 45 08             	mov    0x8(%ebp),%eax
    2f68:	8b 40 24             	mov    0x24(%eax),%eax
    2f6b:	83 ec 04             	sub    $0x4,%esp
    2f6e:	50                   	push   %eax
    2f6f:	68 49 a7 00 00       	push   $0xa749
    2f74:	6a 00                	push   $0x0
    2f76:	e8 09 0c 00 00       	call   3b84 <printf>
    2f7b:	83 c4 10             	add    $0x10,%esp
}
    2f7e:	c9                   	leave  
    2f7f:	c3                   	ret    

00002f80 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    2f80:	55                   	push   %ebp
    2f81:	89 e5                	mov    %esp,%ebp
    2f83:	83 ec 08             	sub    $0x8,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    2f86:	8b 45 08             	mov    0x8(%ebp),%eax
    2f89:	0f b6 00             	movzbl (%eax),%eax
    2f8c:	0f b6 c8             	movzbl %al,%ecx
    2f8f:	8b 45 08             	mov    0x8(%ebp),%eax
    2f92:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    2f96:	0f b6 d0             	movzbl %al,%edx
    2f99:	8b 45 08             	mov    0x8(%ebp),%eax
    2f9c:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    2fa0:	0f b6 c0             	movzbl %al,%eax
    2fa3:	83 ec 0c             	sub    $0xc,%esp
    2fa6:	51                   	push   %ecx
    2fa7:	52                   	push   %edx
    2fa8:	50                   	push   %eax
    2fa9:	68 5d a7 00 00       	push   $0xa75d
    2fae:	6a 00                	push   $0x0
    2fb0:	e8 cf 0b 00 00       	call   3b84 <printf>
    2fb5:	83 c4 20             	add    $0x20,%esp
}
    2fb8:	c9                   	leave  
    2fb9:	c3                   	ret    

00002fba <freepic>:

void freepic(PICNODE *pic) {
    2fba:	55                   	push   %ebp
    2fbb:	89 e5                	mov    %esp,%ebp
    2fbd:	83 ec 08             	sub    $0x8,%esp
	free(pic->data);
    2fc0:	8b 45 08             	mov    0x8(%ebp),%eax
    2fc3:	8b 00                	mov    (%eax),%eax
    2fc5:	83 ec 0c             	sub    $0xc,%esp
    2fc8:	50                   	push   %eax
    2fc9:	e8 46 0d 00 00       	call   3d14 <free>
    2fce:	83 c4 10             	add    $0x10,%esp
}
    2fd1:	c9                   	leave  
    2fd2:	c3                   	ret    

00002fd3 <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    2fd3:	55                   	push   %ebp
    2fd4:	89 e5                	mov    %esp,%ebp
    2fd6:	83 ec 68             	sub    $0x68,%esp
	int W = 15;
    2fd9:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    2fe0:	8d 45 dc             	lea    -0x24(%ebp),%eax
    2fe3:	83 ec 0c             	sub    $0xc,%esp
    2fe6:	ff 75 ec             	pushl  -0x14(%ebp)
    2fe9:	ff 75 ec             	pushl  -0x14(%ebp)
    2fec:	6a 00                	push   $0x0
    2fee:	6a 00                	push   $0x0
    2ff0:	50                   	push   %eax
    2ff1:	e8 01 02 00 00       	call   31f7 <initRect>
    2ff6:	83 c4 1c             	add    $0x1c,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    2ff9:	8b 45 08             	mov    0x8(%ebp),%eax
    2ffc:	8b 40 04             	mov    0x4(%eax),%eax
    2fff:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3002:	89 c2                	mov    %eax,%edx
    3004:	8d 45 cc             	lea    -0x34(%ebp),%eax
    3007:	83 ec 0c             	sub    $0xc,%esp
    300a:	ff 75 ec             	pushl  -0x14(%ebp)
    300d:	ff 75 ec             	pushl  -0x14(%ebp)
    3010:	6a 00                	push   $0x0
    3012:	52                   	push   %edx
    3013:	50                   	push   %eax
    3014:	e8 de 01 00 00       	call   31f7 <initRect>
    3019:	83 c4 1c             	add    $0x1c,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    301c:	8b 45 08             	mov    0x8(%ebp),%eax
    301f:	8b 40 08             	mov    0x8(%eax),%eax
    3022:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3025:	89 c1                	mov    %eax,%ecx
    3027:	8b 45 08             	mov    0x8(%ebp),%eax
    302a:	8b 40 04             	mov    0x4(%eax),%eax
    302d:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3030:	89 c2                	mov    %eax,%edx
    3032:	8d 45 bc             	lea    -0x44(%ebp),%eax
    3035:	83 ec 0c             	sub    $0xc,%esp
    3038:	ff 75 ec             	pushl  -0x14(%ebp)
    303b:	ff 75 ec             	pushl  -0x14(%ebp)
    303e:	51                   	push   %ecx
    303f:	52                   	push   %edx
    3040:	50                   	push   %eax
    3041:	e8 b1 01 00 00       	call   31f7 <initRect>
    3046:	83 c4 1c             	add    $0x1c,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    3049:	8b 45 08             	mov    0x8(%ebp),%eax
    304c:	8b 40 08             	mov    0x8(%eax),%eax
    304f:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3052:	89 c2                	mov    %eax,%edx
    3054:	8d 45 ac             	lea    -0x54(%ebp),%eax
    3057:	83 ec 0c             	sub    $0xc,%esp
    305a:	ff 75 ec             	pushl  -0x14(%ebp)
    305d:	ff 75 ec             	pushl  -0x14(%ebp)
    3060:	52                   	push   %edx
    3061:	6a 00                	push   $0x0
    3063:	50                   	push   %eax
    3064:	e8 8e 01 00 00       	call   31f7 <initRect>
    3069:	83 c4 1c             	add    $0x1c,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    306c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3073:	e9 47 01 00 00       	jmp    31bf <set_icon_alpha+0x1ec>
		for (j = 0; j < pic->height; j++) {
    3078:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    307f:	e9 28 01 00 00       	jmp    31ac <set_icon_alpha+0x1d9>
			p = initPoint(i, j);
    3084:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3087:	83 ec 04             	sub    $0x4,%esp
    308a:	ff 75 f0             	pushl  -0x10(%ebp)
    308d:	ff 75 f4             	pushl  -0xc(%ebp)
    3090:	50                   	push   %eax
    3091:	e8 3a 01 00 00       	call   31d0 <initPoint>
    3096:	83 c4 0c             	add    $0xc,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    3099:	83 ec 08             	sub    $0x8,%esp
    309c:	ff 75 e8             	pushl  -0x18(%ebp)
    309f:	ff 75 e4             	pushl  -0x1c(%ebp)
    30a2:	ff 75 e0             	pushl  -0x20(%ebp)
    30a5:	ff 75 dc             	pushl  -0x24(%ebp)
    30a8:	ff 75 a8             	pushl  -0x58(%ebp)
    30ab:	ff 75 a4             	pushl  -0x5c(%ebp)
    30ae:	e8 95 01 00 00       	call   3248 <isIn>
    30b3:	83 c4 20             	add    $0x20,%esp
    30b6:	85 c0                	test   %eax,%eax
    30b8:	75 67                	jne    3121 <set_icon_alpha+0x14e>
    30ba:	83 ec 08             	sub    $0x8,%esp
    30bd:	ff 75 d8             	pushl  -0x28(%ebp)
    30c0:	ff 75 d4             	pushl  -0x2c(%ebp)
    30c3:	ff 75 d0             	pushl  -0x30(%ebp)
    30c6:	ff 75 cc             	pushl  -0x34(%ebp)
    30c9:	ff 75 a8             	pushl  -0x58(%ebp)
    30cc:	ff 75 a4             	pushl  -0x5c(%ebp)
    30cf:	e8 74 01 00 00       	call   3248 <isIn>
    30d4:	83 c4 20             	add    $0x20,%esp
    30d7:	85 c0                	test   %eax,%eax
    30d9:	75 46                	jne    3121 <set_icon_alpha+0x14e>
    30db:	83 ec 08             	sub    $0x8,%esp
    30de:	ff 75 c8             	pushl  -0x38(%ebp)
    30e1:	ff 75 c4             	pushl  -0x3c(%ebp)
    30e4:	ff 75 c0             	pushl  -0x40(%ebp)
    30e7:	ff 75 bc             	pushl  -0x44(%ebp)
    30ea:	ff 75 a8             	pushl  -0x58(%ebp)
    30ed:	ff 75 a4             	pushl  -0x5c(%ebp)
    30f0:	e8 53 01 00 00       	call   3248 <isIn>
    30f5:	83 c4 20             	add    $0x20,%esp
    30f8:	85 c0                	test   %eax,%eax
    30fa:	75 25                	jne    3121 <set_icon_alpha+0x14e>
    30fc:	83 ec 08             	sub    $0x8,%esp
    30ff:	ff 75 b8             	pushl  -0x48(%ebp)
    3102:	ff 75 b4             	pushl  -0x4c(%ebp)
    3105:	ff 75 b0             	pushl  -0x50(%ebp)
    3108:	ff 75 ac             	pushl  -0x54(%ebp)
    310b:	ff 75 a8             	pushl  -0x58(%ebp)
    310e:	ff 75 a4             	pushl  -0x5c(%ebp)
    3111:	e8 32 01 00 00       	call   3248 <isIn>
    3116:	83 c4 20             	add    $0x20,%esp
    3119:	85 c0                	test   %eax,%eax
    311b:	0f 84 87 00 00 00    	je     31a8 <set_icon_alpha+0x1d5>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    3121:	8b 45 08             	mov    0x8(%ebp),%eax
    3124:	8b 10                	mov    (%eax),%edx
    3126:	8b 45 08             	mov    0x8(%ebp),%eax
    3129:	8b 40 04             	mov    0x4(%eax),%eax
    312c:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3130:	89 c1                	mov    %eax,%ecx
    3132:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3135:	01 c8                	add    %ecx,%eax
    3137:	c1 e0 02             	shl    $0x2,%eax
    313a:	01 d0                	add    %edx,%eax
    313c:	0f b6 00             	movzbl (%eax),%eax
    313f:	3c ff                	cmp    $0xff,%al
    3141:	75 65                	jne    31a8 <set_icon_alpha+0x1d5>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    3143:	8b 45 08             	mov    0x8(%ebp),%eax
    3146:	8b 10                	mov    (%eax),%edx
    3148:	8b 45 08             	mov    0x8(%ebp),%eax
    314b:	8b 40 04             	mov    0x4(%eax),%eax
    314e:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3152:	89 c1                	mov    %eax,%ecx
    3154:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3157:	01 c8                	add    %ecx,%eax
    3159:	c1 e0 02             	shl    $0x2,%eax
    315c:	01 d0                	add    %edx,%eax
    315e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    3162:	3c ff                	cmp    $0xff,%al
    3164:	75 42                	jne    31a8 <set_icon_alpha+0x1d5>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    3166:	8b 45 08             	mov    0x8(%ebp),%eax
    3169:	8b 10                	mov    (%eax),%edx
    316b:	8b 45 08             	mov    0x8(%ebp),%eax
    316e:	8b 40 04             	mov    0x4(%eax),%eax
    3171:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3175:	89 c1                	mov    %eax,%ecx
    3177:	8b 45 f4             	mov    -0xc(%ebp),%eax
    317a:	01 c8                	add    %ecx,%eax
    317c:	c1 e0 02             	shl    $0x2,%eax
    317f:	01 d0                	add    %edx,%eax
    3181:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    3185:	3c ff                	cmp    $0xff,%al
    3187:	75 1f                	jne    31a8 <set_icon_alpha+0x1d5>
					pic->data[j * pic->width + i].rgbReserved = 1;
    3189:	8b 45 08             	mov    0x8(%ebp),%eax
    318c:	8b 10                	mov    (%eax),%edx
    318e:	8b 45 08             	mov    0x8(%ebp),%eax
    3191:	8b 40 04             	mov    0x4(%eax),%eax
    3194:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3198:	89 c1                	mov    %eax,%ecx
    319a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    319d:	01 c8                	add    %ecx,%eax
    319f:	c1 e0 02             	shl    $0x2,%eax
    31a2:	01 d0                	add    %edx,%eax
    31a4:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    31a8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    31ac:	8b 45 08             	mov    0x8(%ebp),%eax
    31af:	8b 40 08             	mov    0x8(%eax),%eax
    31b2:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    31b5:	0f 8f c9 fe ff ff    	jg     3084 <set_icon_alpha+0xb1>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    31bb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    31bf:	8b 45 08             	mov    0x8(%ebp),%eax
    31c2:	8b 40 04             	mov    0x4(%eax),%eax
    31c5:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    31c8:	0f 8f aa fe ff ff    	jg     3078 <set_icon_alpha+0xa5>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    31ce:	c9                   	leave  
    31cf:	c3                   	ret    

000031d0 <initPoint>:
#include "context.h"
#include "message.h"
#include "types.h"
#include "user.h"
Point initPoint(int x, int y)
{
    31d0:	55                   	push   %ebp
    31d1:	89 e5                	mov    %esp,%ebp
    31d3:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    31d6:	8b 45 0c             	mov    0xc(%ebp),%eax
    31d9:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    31dc:	8b 45 10             	mov    0x10(%ebp),%eax
    31df:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    31e2:	8b 4d 08             	mov    0x8(%ebp),%ecx
    31e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    31e8:	8b 55 fc             	mov    -0x4(%ebp),%edx
    31eb:	89 01                	mov    %eax,(%ecx)
    31ed:	89 51 04             	mov    %edx,0x4(%ecx)
}
    31f0:	8b 45 08             	mov    0x8(%ebp),%eax
    31f3:	c9                   	leave  
    31f4:	c2 04 00             	ret    $0x4

000031f7 <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    31f7:	55                   	push   %ebp
    31f8:	89 e5                	mov    %esp,%ebp
    31fa:	83 ec 18             	sub    $0x18,%esp
	Rect r;
	r.start = initPoint(x, y);
    31fd:	8d 45 e8             	lea    -0x18(%ebp),%eax
    3200:	ff 75 10             	pushl  0x10(%ebp)
    3203:	ff 75 0c             	pushl  0xc(%ebp)
    3206:	50                   	push   %eax
    3207:	e8 c4 ff ff ff       	call   31d0 <initPoint>
    320c:	83 c4 08             	add    $0x8,%esp
    320f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3212:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3215:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3218:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    321b:	8b 45 14             	mov    0x14(%ebp),%eax
    321e:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    3221:	8b 45 18             	mov    0x18(%ebp),%eax
    3224:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    3227:	8b 45 08             	mov    0x8(%ebp),%eax
    322a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    322d:	89 10                	mov    %edx,(%eax)
    322f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3232:	89 50 04             	mov    %edx,0x4(%eax)
    3235:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3238:	89 50 08             	mov    %edx,0x8(%eax)
    323b:	8b 55 fc             	mov    -0x4(%ebp),%edx
    323e:	89 50 0c             	mov    %edx,0xc(%eax)
}
    3241:	8b 45 08             	mov    0x8(%ebp),%eax
    3244:	c9                   	leave  
    3245:	c2 04 00             	ret    $0x4

00003248 <isIn>:

int isIn(Point p, Rect r)
{
    3248:	55                   	push   %ebp
    3249:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    324b:	8b 55 08             	mov    0x8(%ebp),%edx
    324e:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    3251:	39 c2                	cmp    %eax,%edx
    3253:	7c 2f                	jl     3284 <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    3255:	8b 45 08             	mov    0x8(%ebp),%eax
    3258:	8b 4d 10             	mov    0x10(%ebp),%ecx
    325b:	8b 55 18             	mov    0x18(%ebp),%edx
    325e:	01 ca                	add    %ecx,%edx
    3260:	39 d0                	cmp    %edx,%eax
    3262:	7d 20                	jge    3284 <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    3264:	8b 55 0c             	mov    0xc(%ebp),%edx
    3267:	8b 45 14             	mov    0x14(%ebp),%eax
    326a:	39 c2                	cmp    %eax,%edx
    326c:	7c 16                	jl     3284 <isIn+0x3c>
    326e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3271:	8b 4d 14             	mov    0x14(%ebp),%ecx
    3274:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3277:	01 ca                	add    %ecx,%edx
    3279:	39 d0                	cmp    %edx,%eax
    327b:	7d 07                	jge    3284 <isIn+0x3c>
    327d:	b8 01 00 00 00       	mov    $0x1,%eax
    3282:	eb 05                	jmp    3289 <isIn+0x41>
    3284:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3289:	5d                   	pop    %ebp
    328a:	c3                   	ret    

0000328b <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    328b:	55                   	push   %ebp
    328c:	89 e5                	mov    %esp,%ebp
    328e:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    3291:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    3298:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    329f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    32a6:	8b 45 10             	mov    0x10(%ebp),%eax
    32a9:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    32ac:	8b 45 14             	mov    0x14(%ebp),%eax
    32af:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    32b2:	8b 45 08             	mov    0x8(%ebp),%eax
    32b5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    32b8:	89 10                	mov    %edx,(%eax)
    32ba:	8b 55 f0             	mov    -0x10(%ebp),%edx
    32bd:	89 50 04             	mov    %edx,0x4(%eax)
    32c0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    32c3:	89 50 08             	mov    %edx,0x8(%eax)
    32c6:	8b 55 f8             	mov    -0x8(%ebp),%edx
    32c9:	89 50 0c             	mov    %edx,0xc(%eax)
    32cc:	8b 55 fc             	mov    -0x4(%ebp),%edx
    32cf:	89 50 10             	mov    %edx,0x10(%eax)
}
    32d2:	8b 45 08             	mov    0x8(%ebp),%eax
    32d5:	c9                   	leave  
    32d6:	c2 04 00             	ret    $0x4

000032d9 <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    32d9:	55                   	push   %ebp
    32da:	89 e5                	mov    %esp,%ebp
    32dc:	83 ec 08             	sub    $0x8,%esp
	switch (MsgType)
    32df:	8b 45 1c             	mov    0x1c(%ebp),%eax
    32e2:	83 f8 03             	cmp    $0x3,%eax
    32e5:	74 4f                	je     3336 <createClickable+0x5d>
    32e7:	83 f8 04             	cmp    $0x4,%eax
    32ea:	74 07                	je     32f3 <createClickable+0x1a>
    32ec:	83 f8 02             	cmp    $0x2,%eax
    32ef:	74 25                	je     3316 <createClickable+0x3d>
    32f1:	eb 66                	jmp    3359 <createClickable+0x80>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    32f3:	8b 45 08             	mov    0x8(%ebp),%eax
    32f6:	83 c0 04             	add    $0x4,%eax
    32f9:	83 ec 08             	sub    $0x8,%esp
    32fc:	ff 75 20             	pushl  0x20(%ebp)
    32ff:	ff 75 18             	pushl  0x18(%ebp)
    3302:	ff 75 14             	pushl  0x14(%ebp)
    3305:	ff 75 10             	pushl  0x10(%ebp)
    3308:	ff 75 0c             	pushl  0xc(%ebp)
    330b:	50                   	push   %eax
    330c:	e8 5d 00 00 00       	call   336e <addClickable>
    3311:	83 c4 20             	add    $0x20,%esp
	        break;
    3314:	eb 56                	jmp    336c <createClickable+0x93>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    3316:	8b 45 08             	mov    0x8(%ebp),%eax
    3319:	83 ec 08             	sub    $0x8,%esp
    331c:	ff 75 20             	pushl  0x20(%ebp)
    331f:	ff 75 18             	pushl  0x18(%ebp)
    3322:	ff 75 14             	pushl  0x14(%ebp)
    3325:	ff 75 10             	pushl  0x10(%ebp)
    3328:	ff 75 0c             	pushl  0xc(%ebp)
    332b:	50                   	push   %eax
    332c:	e8 3d 00 00 00       	call   336e <addClickable>
    3331:	83 c4 20             	add    $0x20,%esp
	    	break;
    3334:	eb 36                	jmp    336c <createClickable+0x93>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    3336:	8b 45 08             	mov    0x8(%ebp),%eax
    3339:	83 c0 08             	add    $0x8,%eax
    333c:	83 ec 08             	sub    $0x8,%esp
    333f:	ff 75 20             	pushl  0x20(%ebp)
    3342:	ff 75 18             	pushl  0x18(%ebp)
    3345:	ff 75 14             	pushl  0x14(%ebp)
    3348:	ff 75 10             	pushl  0x10(%ebp)
    334b:	ff 75 0c             	pushl  0xc(%ebp)
    334e:	50                   	push   %eax
    334f:	e8 1a 00 00 00       	call   336e <addClickable>
    3354:	83 c4 20             	add    $0x20,%esp
	    	break;
    3357:	eb 13                	jmp    336c <createClickable+0x93>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    3359:	83 ec 08             	sub    $0x8,%esp
    335c:	68 6c a7 00 00       	push   $0xa76c
    3361:	6a 00                	push   $0x0
    3363:	e8 1c 08 00 00       	call   3b84 <printf>
    3368:	83 c4 10             	add    $0x10,%esp
	    	break;
    336b:	90                   	nop
	}
}
    336c:	c9                   	leave  
    336d:	c3                   	ret    

0000336e <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    336e:	55                   	push   %ebp
    336f:	89 e5                	mov    %esp,%ebp
    3371:	83 ec 18             	sub    $0x18,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    3374:	83 ec 0c             	sub    $0xc,%esp
    3377:	6a 18                	push   $0x18
    3379:	e8 d7 0a 00 00       	call   3e55 <malloc>
    337e:	83 c4 10             	add    $0x10,%esp
    3381:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    3384:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3387:	8b 55 0c             	mov    0xc(%ebp),%edx
    338a:	89 10                	mov    %edx,(%eax)
    338c:	8b 55 10             	mov    0x10(%ebp),%edx
    338f:	89 50 04             	mov    %edx,0x4(%eax)
    3392:	8b 55 14             	mov    0x14(%ebp),%edx
    3395:	89 50 08             	mov    %edx,0x8(%eax)
    3398:	8b 55 18             	mov    0x18(%ebp),%edx
    339b:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    339e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33a1:	8b 55 1c             	mov    0x1c(%ebp),%edx
    33a4:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    33a7:	8b 45 08             	mov    0x8(%ebp),%eax
    33aa:	8b 10                	mov    (%eax),%edx
    33ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33af:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    33b2:	8b 45 08             	mov    0x8(%ebp),%eax
    33b5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    33b8:	89 10                	mov    %edx,(%eax)
}
    33ba:	c9                   	leave  
    33bb:	c3                   	ret    

000033bc <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    33bc:	55                   	push   %ebp
    33bd:	89 e5                	mov    %esp,%ebp
    33bf:	83 ec 18             	sub    $0x18,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    33c2:	8b 45 08             	mov    0x8(%ebp),%eax
    33c5:	8b 00                	mov    (%eax),%eax
    33c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    33ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
    33cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    33d0:	e9 ad 00 00 00       	jmp    3482 <deleteClickable+0xc6>
	{
		if (isIn(cur->area.start, region))
    33d5:	ff 75 18             	pushl  0x18(%ebp)
    33d8:	ff 75 14             	pushl  0x14(%ebp)
    33db:	ff 75 10             	pushl  0x10(%ebp)
    33de:	ff 75 0c             	pushl  0xc(%ebp)
    33e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    33e4:	ff 70 04             	pushl  0x4(%eax)
    33e7:	ff 30                	pushl  (%eax)
    33e9:	e8 5a fe ff ff       	call   3248 <isIn>
    33ee:	83 c4 18             	add    $0x18,%esp
    33f1:	85 c0                	test   %eax,%eax
    33f3:	74 66                	je     345b <deleteClickable+0x9f>
		{
			//如果当前指针指向头部
			if (cur == *head)
    33f5:	8b 45 08             	mov    0x8(%ebp),%eax
    33f8:	8b 00                	mov    (%eax),%eax
    33fa:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    33fd:	75 31                	jne    3430 <deleteClickable+0x74>
			{
				//删除头节点
				temp = *head;
    33ff:	8b 45 08             	mov    0x8(%ebp),%eax
    3402:	8b 00                	mov    (%eax),%eax
    3404:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    3407:	8b 45 f0             	mov    -0x10(%ebp),%eax
    340a:	8b 50 14             	mov    0x14(%eax),%edx
    340d:	8b 45 08             	mov    0x8(%ebp),%eax
    3410:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    3412:	8b 45 08             	mov    0x8(%ebp),%eax
    3415:	8b 00                	mov    (%eax),%eax
    3417:	89 45 f4             	mov    %eax,-0xc(%ebp)
    341a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    341d:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    3420:	83 ec 0c             	sub    $0xc,%esp
    3423:	ff 75 ec             	pushl  -0x14(%ebp)
    3426:	e8 e9 08 00 00       	call   3d14 <free>
    342b:	83 c4 10             	add    $0x10,%esp
    342e:	eb 52                	jmp    3482 <deleteClickable+0xc6>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    3430:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3433:	8b 50 14             	mov    0x14(%eax),%edx
    3436:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3439:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    343c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    343f:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    3442:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3445:	8b 40 14             	mov    0x14(%eax),%eax
    3448:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    344b:	83 ec 0c             	sub    $0xc,%esp
    344e:	ff 75 ec             	pushl  -0x14(%ebp)
    3451:	e8 be 08 00 00       	call   3d14 <free>
    3456:	83 c4 10             	add    $0x10,%esp
    3459:	eb 27                	jmp    3482 <deleteClickable+0xc6>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    345b:	8b 45 08             	mov    0x8(%ebp),%eax
    345e:	8b 00                	mov    (%eax),%eax
    3460:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3463:	75 0b                	jne    3470 <deleteClickable+0xb4>
			{
				cur = cur->next;
    3465:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3468:	8b 40 14             	mov    0x14(%eax),%eax
    346b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    346e:	eb 12                	jmp    3482 <deleteClickable+0xc6>
			}
			else
			{
				cur = cur->next;
    3470:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3473:	8b 40 14             	mov    0x14(%eax),%eax
    3476:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    3479:	8b 45 f4             	mov    -0xc(%ebp),%eax
    347c:	8b 40 14             	mov    0x14(%eax),%eax
    347f:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    3482:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3486:	0f 85 49 ff ff ff    	jne    33d5 <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    348c:	c9                   	leave  
    348d:	c3                   	ret    

0000348e <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    348e:	55                   	push   %ebp
    348f:	89 e5                	mov    %esp,%ebp
    3491:	83 ec 18             	sub    $0x18,%esp
	Clickable *cur = head;
    3494:	8b 45 08             	mov    0x8(%ebp),%eax
    3497:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    349a:	eb 44                	jmp    34e0 <executeHandler+0x52>
	{
		if (isIn(click, cur->area))
    349c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    349f:	ff 70 0c             	pushl  0xc(%eax)
    34a2:	ff 70 08             	pushl  0x8(%eax)
    34a5:	ff 70 04             	pushl  0x4(%eax)
    34a8:	ff 30                	pushl  (%eax)
    34aa:	ff 75 10             	pushl  0x10(%ebp)
    34ad:	ff 75 0c             	pushl  0xc(%ebp)
    34b0:	e8 93 fd ff ff       	call   3248 <isIn>
    34b5:	83 c4 18             	add    $0x18,%esp
    34b8:	85 c0                	test   %eax,%eax
    34ba:	74 1b                	je     34d7 <executeHandler+0x49>
		{
			cur->handler(click);
    34bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34bf:	8b 40 10             	mov    0x10(%eax),%eax
    34c2:	83 ec 08             	sub    $0x8,%esp
    34c5:	ff 75 10             	pushl  0x10(%ebp)
    34c8:	ff 75 0c             	pushl  0xc(%ebp)
    34cb:	ff d0                	call   *%eax
    34cd:	83 c4 10             	add    $0x10,%esp
			return 1;
    34d0:	b8 01 00 00 00       	mov    $0x1,%eax
    34d5:	eb 26                	jmp    34fd <executeHandler+0x6f>
		}
		cur = cur->next;
    34d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34da:	8b 40 14             	mov    0x14(%eax),%eax
    34dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    34e0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    34e4:	75 b6                	jne    349c <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	printf(0, "execute: none!\n");
    34e6:	83 ec 08             	sub    $0x8,%esp
    34e9:	68 9a a7 00 00       	push   $0xa79a
    34ee:	6a 00                	push   $0x0
    34f0:	e8 8f 06 00 00       	call   3b84 <printf>
    34f5:	83 c4 10             	add    $0x10,%esp
	return 0;
    34f8:	b8 00 00 00 00       	mov    $0x0,%eax
}
    34fd:	c9                   	leave  
    34fe:	c3                   	ret    

000034ff <printClickable>:

void printClickable(Clickable *c)
{
    34ff:	55                   	push   %ebp
    3500:	89 e5                	mov    %esp,%ebp
    3502:	53                   	push   %ebx
    3503:	83 ec 04             	sub    $0x4,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    3506:	8b 45 08             	mov    0x8(%ebp),%eax
    3509:	8b 58 0c             	mov    0xc(%eax),%ebx
    350c:	8b 45 08             	mov    0x8(%ebp),%eax
    350f:	8b 48 08             	mov    0x8(%eax),%ecx
    3512:	8b 45 08             	mov    0x8(%ebp),%eax
    3515:	8b 50 04             	mov    0x4(%eax),%edx
    3518:	8b 45 08             	mov    0x8(%ebp),%eax
    351b:	8b 00                	mov    (%eax),%eax
    351d:	83 ec 08             	sub    $0x8,%esp
    3520:	53                   	push   %ebx
    3521:	51                   	push   %ecx
    3522:	52                   	push   %edx
    3523:	50                   	push   %eax
    3524:	68 aa a7 00 00       	push   $0xa7aa
    3529:	6a 00                	push   $0x0
    352b:	e8 54 06 00 00       	call   3b84 <printf>
    3530:	83 c4 20             	add    $0x20,%esp
}
    3533:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3536:	c9                   	leave  
    3537:	c3                   	ret    

00003538 <printClickableList>:

void printClickableList(Clickable *head)
{
    3538:	55                   	push   %ebp
    3539:	89 e5                	mov    %esp,%ebp
    353b:	83 ec 18             	sub    $0x18,%esp
	Clickable *cur = head;
    353e:	8b 45 08             	mov    0x8(%ebp),%eax
    3541:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    3544:	83 ec 08             	sub    $0x8,%esp
    3547:	68 bc a7 00 00       	push   $0xa7bc
    354c:	6a 00                	push   $0x0
    354e:	e8 31 06 00 00       	call   3b84 <printf>
    3553:	83 c4 10             	add    $0x10,%esp
	while(cur != 0)
    3556:	eb 17                	jmp    356f <printClickableList+0x37>
	{
		printClickable(cur);
    3558:	83 ec 0c             	sub    $0xc,%esp
    355b:	ff 75 f4             	pushl  -0xc(%ebp)
    355e:	e8 9c ff ff ff       	call   34ff <printClickable>
    3563:	83 c4 10             	add    $0x10,%esp
		cur = cur->next;
    3566:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3569:	8b 40 14             	mov    0x14(%eax),%eax
    356c:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    356f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3573:	75 e3                	jne    3558 <printClickableList+0x20>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    3575:	83 ec 08             	sub    $0x8,%esp
    3578:	68 cd a7 00 00       	push   $0xa7cd
    357d:	6a 00                	push   $0x0
    357f:	e8 00 06 00 00       	call   3b84 <printf>
    3584:	83 c4 10             	add    $0x10,%esp
}
    3587:	c9                   	leave  
    3588:	c3                   	ret    

00003589 <testHanler>:

void testHanler(struct Point p)
{
    3589:	55                   	push   %ebp
    358a:	89 e5                	mov    %esp,%ebp
    358c:	83 ec 08             	sub    $0x8,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    358f:	8b 55 0c             	mov    0xc(%ebp),%edx
    3592:	8b 45 08             	mov    0x8(%ebp),%eax
    3595:	52                   	push   %edx
    3596:	50                   	push   %eax
    3597:	68 cf a7 00 00       	push   $0xa7cf
    359c:	6a 00                	push   $0x0
    359e:	e8 e1 05 00 00       	call   3b84 <printf>
    35a3:	83 c4 10             	add    $0x10,%esp
}
    35a6:	c9                   	leave  
    35a7:	c3                   	ret    

000035a8 <testClickable>:
void testClickable(struct Context c)
{
    35a8:	55                   	push   %ebp
    35a9:	89 e5                	mov    %esp,%ebp
    35ab:	83 ec 78             	sub    $0x78,%esp
	ClickableManager cm = initClickManager(c);
    35ae:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    35b1:	ff 75 10             	pushl  0x10(%ebp)
    35b4:	ff 75 0c             	pushl  0xc(%ebp)
    35b7:	ff 75 08             	pushl  0x8(%ebp)
    35ba:	50                   	push   %eax
    35bb:	e8 cb fc ff ff       	call   328b <initClickManager>
    35c0:	83 c4 0c             	add    $0xc,%esp

	Rect r1 = initRect(5,5,20,20);
    35c3:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    35c6:	83 ec 04             	sub    $0x4,%esp
    35c9:	6a 14                	push   $0x14
    35cb:	6a 14                	push   $0x14
    35cd:	6a 05                	push   $0x5
    35cf:	6a 05                	push   $0x5
    35d1:	50                   	push   %eax
    35d2:	e8 20 fc ff ff       	call   31f7 <initRect>
    35d7:	83 c4 14             	add    $0x14,%esp
	Rect r2 = initRect(20,20,20,20);
    35da:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    35dd:	83 ec 04             	sub    $0x4,%esp
    35e0:	6a 14                	push   $0x14
    35e2:	6a 14                	push   $0x14
    35e4:	6a 14                	push   $0x14
    35e6:	6a 14                	push   $0x14
    35e8:	50                   	push   %eax
    35e9:	e8 09 fc ff ff       	call   31f7 <initRect>
    35ee:	83 c4 14             	add    $0x14,%esp
	Rect r3 = initRect(50,50,15,15);
    35f1:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    35f4:	83 ec 04             	sub    $0x4,%esp
    35f7:	6a 0f                	push   $0xf
    35f9:	6a 0f                	push   $0xf
    35fb:	6a 32                	push   $0x32
    35fd:	6a 32                	push   $0x32
    35ff:	50                   	push   %eax
    3600:	e8 f2 fb ff ff       	call   31f7 <initRect>
    3605:	83 c4 14             	add    $0x14,%esp
	Rect r4 = initRect(0,0,30,30);
    3608:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    360b:	83 ec 04             	sub    $0x4,%esp
    360e:	6a 1e                	push   $0x1e
    3610:	6a 1e                	push   $0x1e
    3612:	6a 00                	push   $0x0
    3614:	6a 00                	push   $0x0
    3616:	50                   	push   %eax
    3617:	e8 db fb ff ff       	call   31f7 <initRect>
    361c:	83 c4 14             	add    $0x14,%esp
	Point p1 = initPoint(23, 23);
    361f:	8d 45 9c             	lea    -0x64(%ebp),%eax
    3622:	83 ec 04             	sub    $0x4,%esp
    3625:	6a 17                	push   $0x17
    3627:	6a 17                	push   $0x17
    3629:	50                   	push   %eax
    362a:	e8 a1 fb ff ff       	call   31d0 <initPoint>
    362f:	83 c4 0c             	add    $0xc,%esp
	Point p2 = initPoint(70, 70);
    3632:	8d 45 94             	lea    -0x6c(%ebp),%eax
    3635:	83 ec 04             	sub    $0x4,%esp
    3638:	6a 46                	push   $0x46
    363a:	6a 46                	push   $0x46
    363c:	50                   	push   %eax
    363d:	e8 8e fb ff ff       	call   31d0 <initPoint>
    3642:	83 c4 0c             	add    $0xc,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    3645:	83 ec 04             	sub    $0x4,%esp
    3648:	68 89 35 00 00       	push   $0x3589
    364d:	6a 02                	push   $0x2
    364f:	ff 75 e0             	pushl  -0x20(%ebp)
    3652:	ff 75 dc             	pushl  -0x24(%ebp)
    3655:	ff 75 d8             	pushl  -0x28(%ebp)
    3658:	ff 75 d4             	pushl  -0x2c(%ebp)
    365b:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    365e:	50                   	push   %eax
    365f:	e8 75 fc ff ff       	call   32d9 <createClickable>
    3664:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    3667:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    366a:	83 ec 04             	sub    $0x4,%esp
    366d:	50                   	push   %eax
    366e:	68 e3 a7 00 00       	push   $0xa7e3
    3673:	6a 00                	push   $0x0
    3675:	e8 0a 05 00 00       	call   3b84 <printf>
    367a:	83 c4 10             	add    $0x10,%esp
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    367d:	83 ec 04             	sub    $0x4,%esp
    3680:	68 89 35 00 00       	push   $0x3589
    3685:	6a 02                	push   $0x2
    3687:	ff 75 d0             	pushl  -0x30(%ebp)
    368a:	ff 75 cc             	pushl  -0x34(%ebp)
    368d:	ff 75 c8             	pushl  -0x38(%ebp)
    3690:	ff 75 c4             	pushl  -0x3c(%ebp)
    3693:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3696:	50                   	push   %eax
    3697:	e8 3d fc ff ff       	call   32d9 <createClickable>
    369c:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    369f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    36a2:	83 ec 04             	sub    $0x4,%esp
    36a5:	50                   	push   %eax
    36a6:	68 e3 a7 00 00       	push   $0xa7e3
    36ab:	6a 00                	push   $0x0
    36ad:	e8 d2 04 00 00       	call   3b84 <printf>
    36b2:	83 c4 10             	add    $0x10,%esp
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    36b5:	83 ec 04             	sub    $0x4,%esp
    36b8:	68 89 35 00 00       	push   $0x3589
    36bd:	6a 02                	push   $0x2
    36bf:	ff 75 c0             	pushl  -0x40(%ebp)
    36c2:	ff 75 bc             	pushl  -0x44(%ebp)
    36c5:	ff 75 b8             	pushl  -0x48(%ebp)
    36c8:	ff 75 b4             	pushl  -0x4c(%ebp)
    36cb:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    36ce:	50                   	push   %eax
    36cf:	e8 05 fc ff ff       	call   32d9 <createClickable>
    36d4:	83 c4 20             	add    $0x20,%esp
	printf(0, "left_click: %d\n", cm.left_click);
    36d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    36da:	83 ec 04             	sub    $0x4,%esp
    36dd:	50                   	push   %eax
    36de:	68 e3 a7 00 00       	push   $0xa7e3
    36e3:	6a 00                	push   $0x0
    36e5:	e8 9a 04 00 00       	call   3b84 <printf>
    36ea:	83 c4 10             	add    $0x10,%esp
	printClickableList(cm.left_click);
    36ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    36f0:	83 ec 0c             	sub    $0xc,%esp
    36f3:	50                   	push   %eax
    36f4:	e8 3f fe ff ff       	call   3538 <printClickableList>
    36f9:	83 c4 10             	add    $0x10,%esp
	executeHandler(cm.left_click, p1);
    36fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    36ff:	83 ec 04             	sub    $0x4,%esp
    3702:	ff 75 a0             	pushl  -0x60(%ebp)
    3705:	ff 75 9c             	pushl  -0x64(%ebp)
    3708:	50                   	push   %eax
    3709:	e8 80 fd ff ff       	call   348e <executeHandler>
    370e:	83 c4 10             	add    $0x10,%esp
	executeHandler(cm.left_click, p2);
    3711:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3714:	83 ec 04             	sub    $0x4,%esp
    3717:	ff 75 98             	pushl  -0x68(%ebp)
    371a:	ff 75 94             	pushl  -0x6c(%ebp)
    371d:	50                   	push   %eax
    371e:	e8 6b fd ff ff       	call   348e <executeHandler>
    3723:	83 c4 10             	add    $0x10,%esp
	deleteClickable(&cm.left_click, r4);
    3726:	83 ec 0c             	sub    $0xc,%esp
    3729:	ff 75 b0             	pushl  -0x50(%ebp)
    372c:	ff 75 ac             	pushl  -0x54(%ebp)
    372f:	ff 75 a8             	pushl  -0x58(%ebp)
    3732:	ff 75 a4             	pushl  -0x5c(%ebp)
    3735:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3738:	50                   	push   %eax
    3739:	e8 7e fc ff ff       	call   33bc <deleteClickable>
    373e:	83 c4 20             	add    $0x20,%esp
	printClickableList(cm.left_click);
    3741:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3744:	83 ec 0c             	sub    $0xc,%esp
    3747:	50                   	push   %eax
    3748:	e8 eb fd ff ff       	call   3538 <printClickableList>
    374d:	83 c4 10             	add    $0x10,%esp
}
    3750:	c9                   	leave  
    3751:	c3                   	ret    

00003752 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    3752:	55                   	push   %ebp
    3753:	89 e5                	mov    %esp,%ebp
    3755:	57                   	push   %edi
    3756:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    3757:	8b 4d 08             	mov    0x8(%ebp),%ecx
    375a:	8b 55 10             	mov    0x10(%ebp),%edx
    375d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3760:	89 cb                	mov    %ecx,%ebx
    3762:	89 df                	mov    %ebx,%edi
    3764:	89 d1                	mov    %edx,%ecx
    3766:	fc                   	cld    
    3767:	f3 aa                	rep stos %al,%es:(%edi)
    3769:	89 ca                	mov    %ecx,%edx
    376b:	89 fb                	mov    %edi,%ebx
    376d:	89 5d 08             	mov    %ebx,0x8(%ebp)
    3770:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    3773:	5b                   	pop    %ebx
    3774:	5f                   	pop    %edi
    3775:	5d                   	pop    %ebp
    3776:	c3                   	ret    

00003777 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3777:	55                   	push   %ebp
    3778:	89 e5                	mov    %esp,%ebp
    377a:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    377d:	8b 45 08             	mov    0x8(%ebp),%eax
    3780:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    3783:	90                   	nop
    3784:	8b 45 08             	mov    0x8(%ebp),%eax
    3787:	8d 50 01             	lea    0x1(%eax),%edx
    378a:	89 55 08             	mov    %edx,0x8(%ebp)
    378d:	8b 55 0c             	mov    0xc(%ebp),%edx
    3790:	8d 4a 01             	lea    0x1(%edx),%ecx
    3793:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    3796:	0f b6 12             	movzbl (%edx),%edx
    3799:	88 10                	mov    %dl,(%eax)
    379b:	0f b6 00             	movzbl (%eax),%eax
    379e:	84 c0                	test   %al,%al
    37a0:	75 e2                	jne    3784 <strcpy+0xd>
    ;
  return os;
    37a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    37a5:	c9                   	leave  
    37a6:	c3                   	ret    

000037a7 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    37a7:	55                   	push   %ebp
    37a8:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    37aa:	eb 08                	jmp    37b4 <strcmp+0xd>
    p++, q++;
    37ac:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    37b0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    37b4:	8b 45 08             	mov    0x8(%ebp),%eax
    37b7:	0f b6 00             	movzbl (%eax),%eax
    37ba:	84 c0                	test   %al,%al
    37bc:	74 10                	je     37ce <strcmp+0x27>
    37be:	8b 45 08             	mov    0x8(%ebp),%eax
    37c1:	0f b6 10             	movzbl (%eax),%edx
    37c4:	8b 45 0c             	mov    0xc(%ebp),%eax
    37c7:	0f b6 00             	movzbl (%eax),%eax
    37ca:	38 c2                	cmp    %al,%dl
    37cc:	74 de                	je     37ac <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    37ce:	8b 45 08             	mov    0x8(%ebp),%eax
    37d1:	0f b6 00             	movzbl (%eax),%eax
    37d4:	0f b6 d0             	movzbl %al,%edx
    37d7:	8b 45 0c             	mov    0xc(%ebp),%eax
    37da:	0f b6 00             	movzbl (%eax),%eax
    37dd:	0f b6 c0             	movzbl %al,%eax
    37e0:	29 c2                	sub    %eax,%edx
    37e2:	89 d0                	mov    %edx,%eax
}
    37e4:	5d                   	pop    %ebp
    37e5:	c3                   	ret    

000037e6 <strlen>:

uint
strlen(char *s)
{
    37e6:	55                   	push   %ebp
    37e7:	89 e5                	mov    %esp,%ebp
    37e9:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    37ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    37f3:	eb 04                	jmp    37f9 <strlen+0x13>
    37f5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    37f9:	8b 55 fc             	mov    -0x4(%ebp),%edx
    37fc:	8b 45 08             	mov    0x8(%ebp),%eax
    37ff:	01 d0                	add    %edx,%eax
    3801:	0f b6 00             	movzbl (%eax),%eax
    3804:	84 c0                	test   %al,%al
    3806:	75 ed                	jne    37f5 <strlen+0xf>
    ;
  return n;
    3808:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    380b:	c9                   	leave  
    380c:	c3                   	ret    

0000380d <memset>:

void*
memset(void *dst, int c, uint n)
{
    380d:	55                   	push   %ebp
    380e:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
    3810:	8b 45 10             	mov    0x10(%ebp),%eax
    3813:	50                   	push   %eax
    3814:	ff 75 0c             	pushl  0xc(%ebp)
    3817:	ff 75 08             	pushl  0x8(%ebp)
    381a:	e8 33 ff ff ff       	call   3752 <stosb>
    381f:	83 c4 0c             	add    $0xc,%esp
  return dst;
    3822:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3825:	c9                   	leave  
    3826:	c3                   	ret    

00003827 <strchr>:

char*
strchr(const char *s, char c)
{
    3827:	55                   	push   %ebp
    3828:	89 e5                	mov    %esp,%ebp
    382a:	83 ec 04             	sub    $0x4,%esp
    382d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3830:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    3833:	eb 14                	jmp    3849 <strchr+0x22>
    if(*s == c)
    3835:	8b 45 08             	mov    0x8(%ebp),%eax
    3838:	0f b6 00             	movzbl (%eax),%eax
    383b:	3a 45 fc             	cmp    -0x4(%ebp),%al
    383e:	75 05                	jne    3845 <strchr+0x1e>
      return (char*)s;
    3840:	8b 45 08             	mov    0x8(%ebp),%eax
    3843:	eb 13                	jmp    3858 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3845:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3849:	8b 45 08             	mov    0x8(%ebp),%eax
    384c:	0f b6 00             	movzbl (%eax),%eax
    384f:	84 c0                	test   %al,%al
    3851:	75 e2                	jne    3835 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    3853:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3858:	c9                   	leave  
    3859:	c3                   	ret    

0000385a <gets>:

char*
gets(char *buf, int max)
{
    385a:	55                   	push   %ebp
    385b:	89 e5                	mov    %esp,%ebp
    385d:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3860:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3867:	eb 44                	jmp    38ad <gets+0x53>
    cc = read(0, &c, 1);
    3869:	83 ec 04             	sub    $0x4,%esp
    386c:	6a 01                	push   $0x1
    386e:	8d 45 ef             	lea    -0x11(%ebp),%eax
    3871:	50                   	push   %eax
    3872:	6a 00                	push   $0x0
    3874:	e8 46 01 00 00       	call   39bf <read>
    3879:	83 c4 10             	add    $0x10,%esp
    387c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    387f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3883:	7f 02                	jg     3887 <gets+0x2d>
      break;
    3885:	eb 31                	jmp    38b8 <gets+0x5e>
    buf[i++] = c;
    3887:	8b 45 f4             	mov    -0xc(%ebp),%eax
    388a:	8d 50 01             	lea    0x1(%eax),%edx
    388d:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3890:	89 c2                	mov    %eax,%edx
    3892:	8b 45 08             	mov    0x8(%ebp),%eax
    3895:	01 c2                	add    %eax,%edx
    3897:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    389b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    389d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    38a1:	3c 0a                	cmp    $0xa,%al
    38a3:	74 13                	je     38b8 <gets+0x5e>
    38a5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    38a9:	3c 0d                	cmp    $0xd,%al
    38ab:	74 0b                	je     38b8 <gets+0x5e>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    38ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    38b0:	83 c0 01             	add    $0x1,%eax
    38b3:	3b 45 0c             	cmp    0xc(%ebp),%eax
    38b6:	7c b1                	jl     3869 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    38b8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    38bb:	8b 45 08             	mov    0x8(%ebp),%eax
    38be:	01 d0                	add    %edx,%eax
    38c0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    38c3:	8b 45 08             	mov    0x8(%ebp),%eax
}
    38c6:	c9                   	leave  
    38c7:	c3                   	ret    

000038c8 <stat>:

int
stat(char *n, struct stat *st)
{
    38c8:	55                   	push   %ebp
    38c9:	89 e5                	mov    %esp,%ebp
    38cb:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    38ce:	83 ec 08             	sub    $0x8,%esp
    38d1:	6a 00                	push   $0x0
    38d3:	ff 75 08             	pushl  0x8(%ebp)
    38d6:	e8 0c 01 00 00       	call   39e7 <open>
    38db:	83 c4 10             	add    $0x10,%esp
    38de:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    38e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    38e5:	79 07                	jns    38ee <stat+0x26>
    return -1;
    38e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    38ec:	eb 25                	jmp    3913 <stat+0x4b>
  r = fstat(fd, st);
    38ee:	83 ec 08             	sub    $0x8,%esp
    38f1:	ff 75 0c             	pushl  0xc(%ebp)
    38f4:	ff 75 f4             	pushl  -0xc(%ebp)
    38f7:	e8 03 01 00 00       	call   39ff <fstat>
    38fc:	83 c4 10             	add    $0x10,%esp
    38ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    3902:	83 ec 0c             	sub    $0xc,%esp
    3905:	ff 75 f4             	pushl  -0xc(%ebp)
    3908:	e8 c2 00 00 00       	call   39cf <close>
    390d:	83 c4 10             	add    $0x10,%esp
  return r;
    3910:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    3913:	c9                   	leave  
    3914:	c3                   	ret    

00003915 <atoi>:

int
atoi(const char *s)
{
    3915:	55                   	push   %ebp
    3916:	89 e5                	mov    %esp,%ebp
    3918:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    391b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    3922:	eb 25                	jmp    3949 <atoi+0x34>
    n = n*10 + *s++ - '0';
    3924:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3927:	89 d0                	mov    %edx,%eax
    3929:	c1 e0 02             	shl    $0x2,%eax
    392c:	01 d0                	add    %edx,%eax
    392e:	01 c0                	add    %eax,%eax
    3930:	89 c1                	mov    %eax,%ecx
    3932:	8b 45 08             	mov    0x8(%ebp),%eax
    3935:	8d 50 01             	lea    0x1(%eax),%edx
    3938:	89 55 08             	mov    %edx,0x8(%ebp)
    393b:	0f b6 00             	movzbl (%eax),%eax
    393e:	0f be c0             	movsbl %al,%eax
    3941:	01 c8                	add    %ecx,%eax
    3943:	83 e8 30             	sub    $0x30,%eax
    3946:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3949:	8b 45 08             	mov    0x8(%ebp),%eax
    394c:	0f b6 00             	movzbl (%eax),%eax
    394f:	3c 2f                	cmp    $0x2f,%al
    3951:	7e 0a                	jle    395d <atoi+0x48>
    3953:	8b 45 08             	mov    0x8(%ebp),%eax
    3956:	0f b6 00             	movzbl (%eax),%eax
    3959:	3c 39                	cmp    $0x39,%al
    395b:	7e c7                	jle    3924 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    395d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3960:	c9                   	leave  
    3961:	c3                   	ret    

00003962 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3962:	55                   	push   %ebp
    3963:	89 e5                	mov    %esp,%ebp
    3965:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    3968:	8b 45 08             	mov    0x8(%ebp),%eax
    396b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    396e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3971:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    3974:	eb 17                	jmp    398d <memmove+0x2b>
    *dst++ = *src++;
    3976:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3979:	8d 50 01             	lea    0x1(%eax),%edx
    397c:	89 55 fc             	mov    %edx,-0x4(%ebp)
    397f:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3982:	8d 4a 01             	lea    0x1(%edx),%ecx
    3985:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    3988:	0f b6 12             	movzbl (%edx),%edx
    398b:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    398d:	8b 45 10             	mov    0x10(%ebp),%eax
    3990:	8d 50 ff             	lea    -0x1(%eax),%edx
    3993:	89 55 10             	mov    %edx,0x10(%ebp)
    3996:	85 c0                	test   %eax,%eax
    3998:	7f dc                	jg     3976 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    399a:	8b 45 08             	mov    0x8(%ebp),%eax
}
    399d:	c9                   	leave  
    399e:	c3                   	ret    

0000399f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    399f:	b8 01 00 00 00       	mov    $0x1,%eax
    39a4:	cd 40                	int    $0x40
    39a6:	c3                   	ret    

000039a7 <exit>:
SYSCALL(exit)
    39a7:	b8 02 00 00 00       	mov    $0x2,%eax
    39ac:	cd 40                	int    $0x40
    39ae:	c3                   	ret    

000039af <wait>:
SYSCALL(wait)
    39af:	b8 03 00 00 00       	mov    $0x3,%eax
    39b4:	cd 40                	int    $0x40
    39b6:	c3                   	ret    

000039b7 <pipe>:
SYSCALL(pipe)
    39b7:	b8 04 00 00 00       	mov    $0x4,%eax
    39bc:	cd 40                	int    $0x40
    39be:	c3                   	ret    

000039bf <read>:
SYSCALL(read)
    39bf:	b8 05 00 00 00       	mov    $0x5,%eax
    39c4:	cd 40                	int    $0x40
    39c6:	c3                   	ret    

000039c7 <write>:
SYSCALL(write)
    39c7:	b8 10 00 00 00       	mov    $0x10,%eax
    39cc:	cd 40                	int    $0x40
    39ce:	c3                   	ret    

000039cf <close>:
SYSCALL(close)
    39cf:	b8 15 00 00 00       	mov    $0x15,%eax
    39d4:	cd 40                	int    $0x40
    39d6:	c3                   	ret    

000039d7 <kill>:
SYSCALL(kill)
    39d7:	b8 06 00 00 00       	mov    $0x6,%eax
    39dc:	cd 40                	int    $0x40
    39de:	c3                   	ret    

000039df <exec>:
SYSCALL(exec)
    39df:	b8 07 00 00 00       	mov    $0x7,%eax
    39e4:	cd 40                	int    $0x40
    39e6:	c3                   	ret    

000039e7 <open>:
SYSCALL(open)
    39e7:	b8 0f 00 00 00       	mov    $0xf,%eax
    39ec:	cd 40                	int    $0x40
    39ee:	c3                   	ret    

000039ef <mknod>:
SYSCALL(mknod)
    39ef:	b8 11 00 00 00       	mov    $0x11,%eax
    39f4:	cd 40                	int    $0x40
    39f6:	c3                   	ret    

000039f7 <unlink>:
SYSCALL(unlink)
    39f7:	b8 12 00 00 00       	mov    $0x12,%eax
    39fc:	cd 40                	int    $0x40
    39fe:	c3                   	ret    

000039ff <fstat>:
SYSCALL(fstat)
    39ff:	b8 08 00 00 00       	mov    $0x8,%eax
    3a04:	cd 40                	int    $0x40
    3a06:	c3                   	ret    

00003a07 <link>:
SYSCALL(link)
    3a07:	b8 13 00 00 00       	mov    $0x13,%eax
    3a0c:	cd 40                	int    $0x40
    3a0e:	c3                   	ret    

00003a0f <mkdir>:
SYSCALL(mkdir)
    3a0f:	b8 14 00 00 00       	mov    $0x14,%eax
    3a14:	cd 40                	int    $0x40
    3a16:	c3                   	ret    

00003a17 <chdir>:
SYSCALL(chdir)
    3a17:	b8 09 00 00 00       	mov    $0x9,%eax
    3a1c:	cd 40                	int    $0x40
    3a1e:	c3                   	ret    

00003a1f <dup>:
SYSCALL(dup)
    3a1f:	b8 0a 00 00 00       	mov    $0xa,%eax
    3a24:	cd 40                	int    $0x40
    3a26:	c3                   	ret    

00003a27 <getpid>:
SYSCALL(getpid)
    3a27:	b8 0b 00 00 00       	mov    $0xb,%eax
    3a2c:	cd 40                	int    $0x40
    3a2e:	c3                   	ret    

00003a2f <sbrk>:
SYSCALL(sbrk)
    3a2f:	b8 0c 00 00 00       	mov    $0xc,%eax
    3a34:	cd 40                	int    $0x40
    3a36:	c3                   	ret    

00003a37 <sleep>:
SYSCALL(sleep)
    3a37:	b8 0d 00 00 00       	mov    $0xd,%eax
    3a3c:	cd 40                	int    $0x40
    3a3e:	c3                   	ret    

00003a3f <uptime>:
SYSCALL(uptime)
    3a3f:	b8 0e 00 00 00       	mov    $0xe,%eax
    3a44:	cd 40                	int    $0x40
    3a46:	c3                   	ret    

00003a47 <getMsg>:
SYSCALL(getMsg)
    3a47:	b8 16 00 00 00       	mov    $0x16,%eax
    3a4c:	cd 40                	int    $0x40
    3a4e:	c3                   	ret    

00003a4f <createWindow>:
SYSCALL(createWindow)
    3a4f:	b8 17 00 00 00       	mov    $0x17,%eax
    3a54:	cd 40                	int    $0x40
    3a56:	c3                   	ret    

00003a57 <destroyWindow>:
SYSCALL(destroyWindow)
    3a57:	b8 18 00 00 00       	mov    $0x18,%eax
    3a5c:	cd 40                	int    $0x40
    3a5e:	c3                   	ret    

00003a5f <updateWindow>:
SYSCALL(updateWindow)
    3a5f:	b8 19 00 00 00       	mov    $0x19,%eax
    3a64:	cd 40                	int    $0x40
    3a66:	c3                   	ret    

00003a67 <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    3a67:	b8 1a 00 00 00       	mov    $0x1a,%eax
    3a6c:	cd 40                	int    $0x40
    3a6e:	c3                   	ret    

00003a6f <kwrite>:
SYSCALL(kwrite)
    3a6f:	b8 1c 00 00 00       	mov    $0x1c,%eax
    3a74:	cd 40                	int    $0x40
    3a76:	c3                   	ret    

00003a77 <setSampleRate>:
SYSCALL(setSampleRate)
    3a77:	b8 1b 00 00 00       	mov    $0x1b,%eax
    3a7c:	cd 40                	int    $0x40
    3a7e:	c3                   	ret    

00003a7f <pause>:
SYSCALL(pause)
    3a7f:	b8 1d 00 00 00       	mov    $0x1d,%eax
    3a84:	cd 40                	int    $0x40
    3a86:	c3                   	ret    

00003a87 <wavdecode>:
SYSCALL(wavdecode)
    3a87:	b8 1e 00 00 00       	mov    $0x1e,%eax
    3a8c:	cd 40                	int    $0x40
    3a8e:	c3                   	ret    

00003a8f <beginDecode>:
SYSCALL(beginDecode)
    3a8f:	b8 1f 00 00 00       	mov    $0x1f,%eax
    3a94:	cd 40                	int    $0x40
    3a96:	c3                   	ret    

00003a97 <waitForDecode>:
SYSCALL(waitForDecode)
    3a97:	b8 20 00 00 00       	mov    $0x20,%eax
    3a9c:	cd 40                	int    $0x40
    3a9e:	c3                   	ret    

00003a9f <endDecode>:
SYSCALL(endDecode)
    3a9f:	b8 21 00 00 00       	mov    $0x21,%eax
    3aa4:	cd 40                	int    $0x40
    3aa6:	c3                   	ret    

00003aa7 <getCoreBuf>:
    3aa7:	b8 22 00 00 00       	mov    $0x22,%eax
    3aac:	cd 40                	int    $0x40
    3aae:	c3                   	ret    

00003aaf <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    3aaf:	55                   	push   %ebp
    3ab0:	89 e5                	mov    %esp,%ebp
    3ab2:	83 ec 18             	sub    $0x18,%esp
    3ab5:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ab8:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    3abb:	83 ec 04             	sub    $0x4,%esp
    3abe:	6a 01                	push   $0x1
    3ac0:	8d 45 f4             	lea    -0xc(%ebp),%eax
    3ac3:	50                   	push   %eax
    3ac4:	ff 75 08             	pushl  0x8(%ebp)
    3ac7:	e8 fb fe ff ff       	call   39c7 <write>
    3acc:	83 c4 10             	add    $0x10,%esp
}
    3acf:	c9                   	leave  
    3ad0:	c3                   	ret    

00003ad1 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    3ad1:	55                   	push   %ebp
    3ad2:	89 e5                	mov    %esp,%ebp
    3ad4:	53                   	push   %ebx
    3ad5:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3ad8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    3adf:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    3ae3:	74 17                	je     3afc <printint+0x2b>
    3ae5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3ae9:	79 11                	jns    3afc <printint+0x2b>
    neg = 1;
    3aeb:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    3af2:	8b 45 0c             	mov    0xc(%ebp),%eax
    3af5:	f7 d8                	neg    %eax
    3af7:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3afa:	eb 06                	jmp    3b02 <printint+0x31>
  } else {
    x = xx;
    3afc:	8b 45 0c             	mov    0xc(%ebp),%eax
    3aff:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    3b02:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    3b09:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3b0c:	8d 41 01             	lea    0x1(%ecx),%eax
    3b0f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3b12:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3b15:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3b18:	ba 00 00 00 00       	mov    $0x0,%edx
    3b1d:	f7 f3                	div    %ebx
    3b1f:	89 d0                	mov    %edx,%eax
    3b21:	0f b6 80 08 e6 00 00 	movzbl 0xe608(%eax),%eax
    3b28:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    3b2c:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3b2f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3b32:	ba 00 00 00 00       	mov    $0x0,%edx
    3b37:	f7 f3                	div    %ebx
    3b39:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3b3c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3b40:	75 c7                	jne    3b09 <printint+0x38>
  if(neg)
    3b42:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3b46:	74 0e                	je     3b56 <printint+0x85>
    buf[i++] = '-';
    3b48:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b4b:	8d 50 01             	lea    0x1(%eax),%edx
    3b4e:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3b51:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    3b56:	eb 1d                	jmp    3b75 <printint+0xa4>
    putc(fd, buf[i]);
    3b58:	8d 55 dc             	lea    -0x24(%ebp),%edx
    3b5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b5e:	01 d0                	add    %edx,%eax
    3b60:	0f b6 00             	movzbl (%eax),%eax
    3b63:	0f be c0             	movsbl %al,%eax
    3b66:	83 ec 08             	sub    $0x8,%esp
    3b69:	50                   	push   %eax
    3b6a:	ff 75 08             	pushl  0x8(%ebp)
    3b6d:	e8 3d ff ff ff       	call   3aaf <putc>
    3b72:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3b75:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    3b79:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3b7d:	79 d9                	jns    3b58 <printint+0x87>
    putc(fd, buf[i]);
}
    3b7f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3b82:	c9                   	leave  
    3b83:	c3                   	ret    

00003b84 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3b84:	55                   	push   %ebp
    3b85:	89 e5                	mov    %esp,%ebp
    3b87:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    3b8a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    3b91:	8d 45 0c             	lea    0xc(%ebp),%eax
    3b94:	83 c0 04             	add    $0x4,%eax
    3b97:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    3b9a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3ba1:	e9 59 01 00 00       	jmp    3cff <printf+0x17b>
    c = fmt[i] & 0xff;
    3ba6:	8b 55 0c             	mov    0xc(%ebp),%edx
    3ba9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3bac:	01 d0                	add    %edx,%eax
    3bae:	0f b6 00             	movzbl (%eax),%eax
    3bb1:	0f be c0             	movsbl %al,%eax
    3bb4:	25 ff 00 00 00       	and    $0xff,%eax
    3bb9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    3bbc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3bc0:	75 2c                	jne    3bee <printf+0x6a>
      if(c == '%'){
    3bc2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3bc6:	75 0c                	jne    3bd4 <printf+0x50>
        state = '%';
    3bc8:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    3bcf:	e9 27 01 00 00       	jmp    3cfb <printf+0x177>
      } else {
        putc(fd, c);
    3bd4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3bd7:	0f be c0             	movsbl %al,%eax
    3bda:	83 ec 08             	sub    $0x8,%esp
    3bdd:	50                   	push   %eax
    3bde:	ff 75 08             	pushl  0x8(%ebp)
    3be1:	e8 c9 fe ff ff       	call   3aaf <putc>
    3be6:	83 c4 10             	add    $0x10,%esp
    3be9:	e9 0d 01 00 00       	jmp    3cfb <printf+0x177>
      }
    } else if(state == '%'){
    3bee:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    3bf2:	0f 85 03 01 00 00    	jne    3cfb <printf+0x177>
      if(c == 'd'){
    3bf8:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    3bfc:	75 1e                	jne    3c1c <printf+0x98>
        printint(fd, *ap, 10, 1);
    3bfe:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3c01:	8b 00                	mov    (%eax),%eax
    3c03:	6a 01                	push   $0x1
    3c05:	6a 0a                	push   $0xa
    3c07:	50                   	push   %eax
    3c08:	ff 75 08             	pushl  0x8(%ebp)
    3c0b:	e8 c1 fe ff ff       	call   3ad1 <printint>
    3c10:	83 c4 10             	add    $0x10,%esp
        ap++;
    3c13:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3c17:	e9 d8 00 00 00       	jmp    3cf4 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
    3c1c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    3c20:	74 06                	je     3c28 <printf+0xa4>
    3c22:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    3c26:	75 1e                	jne    3c46 <printf+0xc2>
        printint(fd, *ap, 16, 0);
    3c28:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3c2b:	8b 00                	mov    (%eax),%eax
    3c2d:	6a 00                	push   $0x0
    3c2f:	6a 10                	push   $0x10
    3c31:	50                   	push   %eax
    3c32:	ff 75 08             	pushl  0x8(%ebp)
    3c35:	e8 97 fe ff ff       	call   3ad1 <printint>
    3c3a:	83 c4 10             	add    $0x10,%esp
        ap++;
    3c3d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3c41:	e9 ae 00 00 00       	jmp    3cf4 <printf+0x170>
      } else if(c == 's'){
    3c46:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    3c4a:	75 43                	jne    3c8f <printf+0x10b>
        s = (char*)*ap;
    3c4c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3c4f:	8b 00                	mov    (%eax),%eax
    3c51:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    3c54:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    3c58:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3c5c:	75 07                	jne    3c65 <printf+0xe1>
          s = "(null)";
    3c5e:	c7 45 f4 f3 a7 00 00 	movl   $0xa7f3,-0xc(%ebp)
        while(*s != 0){
    3c65:	eb 1c                	jmp    3c83 <printf+0xff>
          putc(fd, *s);
    3c67:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3c6a:	0f b6 00             	movzbl (%eax),%eax
    3c6d:	0f be c0             	movsbl %al,%eax
    3c70:	83 ec 08             	sub    $0x8,%esp
    3c73:	50                   	push   %eax
    3c74:	ff 75 08             	pushl  0x8(%ebp)
    3c77:	e8 33 fe ff ff       	call   3aaf <putc>
    3c7c:	83 c4 10             	add    $0x10,%esp
          s++;
    3c7f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3c83:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3c86:	0f b6 00             	movzbl (%eax),%eax
    3c89:	84 c0                	test   %al,%al
    3c8b:	75 da                	jne    3c67 <printf+0xe3>
    3c8d:	eb 65                	jmp    3cf4 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3c8f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    3c93:	75 1d                	jne    3cb2 <printf+0x12e>
        putc(fd, *ap);
    3c95:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3c98:	8b 00                	mov    (%eax),%eax
    3c9a:	0f be c0             	movsbl %al,%eax
    3c9d:	83 ec 08             	sub    $0x8,%esp
    3ca0:	50                   	push   %eax
    3ca1:	ff 75 08             	pushl  0x8(%ebp)
    3ca4:	e8 06 fe ff ff       	call   3aaf <putc>
    3ca9:	83 c4 10             	add    $0x10,%esp
        ap++;
    3cac:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3cb0:	eb 42                	jmp    3cf4 <printf+0x170>
      } else if(c == '%'){
    3cb2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3cb6:	75 17                	jne    3ccf <printf+0x14b>
        putc(fd, c);
    3cb8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3cbb:	0f be c0             	movsbl %al,%eax
    3cbe:	83 ec 08             	sub    $0x8,%esp
    3cc1:	50                   	push   %eax
    3cc2:	ff 75 08             	pushl  0x8(%ebp)
    3cc5:	e8 e5 fd ff ff       	call   3aaf <putc>
    3cca:	83 c4 10             	add    $0x10,%esp
    3ccd:	eb 25                	jmp    3cf4 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    3ccf:	83 ec 08             	sub    $0x8,%esp
    3cd2:	6a 25                	push   $0x25
    3cd4:	ff 75 08             	pushl  0x8(%ebp)
    3cd7:	e8 d3 fd ff ff       	call   3aaf <putc>
    3cdc:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
    3cdf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3ce2:	0f be c0             	movsbl %al,%eax
    3ce5:	83 ec 08             	sub    $0x8,%esp
    3ce8:	50                   	push   %eax
    3ce9:	ff 75 08             	pushl  0x8(%ebp)
    3cec:	e8 be fd ff ff       	call   3aaf <putc>
    3cf1:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    3cf4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3cfb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3cff:	8b 55 0c             	mov    0xc(%ebp),%edx
    3d02:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3d05:	01 d0                	add    %edx,%eax
    3d07:	0f b6 00             	movzbl (%eax),%eax
    3d0a:	84 c0                	test   %al,%al
    3d0c:	0f 85 94 fe ff ff    	jne    3ba6 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3d12:	c9                   	leave  
    3d13:	c3                   	ret    

00003d14 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3d14:	55                   	push   %ebp
    3d15:	89 e5                	mov    %esp,%ebp
    3d17:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3d1a:	8b 45 08             	mov    0x8(%ebp),%eax
    3d1d:	83 e8 08             	sub    $0x8,%eax
    3d20:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3d23:	a1 d4 eb 00 00       	mov    0xebd4,%eax
    3d28:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3d2b:	eb 24                	jmp    3d51 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3d2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3d30:	8b 00                	mov    (%eax),%eax
    3d32:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3d35:	77 12                	ja     3d49 <free+0x35>
    3d37:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3d3a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3d3d:	77 24                	ja     3d63 <free+0x4f>
    3d3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3d42:	8b 00                	mov    (%eax),%eax
    3d44:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3d47:	77 1a                	ja     3d63 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3d49:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3d4c:	8b 00                	mov    (%eax),%eax
    3d4e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3d51:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3d54:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3d57:	76 d4                	jbe    3d2d <free+0x19>
    3d59:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3d5c:	8b 00                	mov    (%eax),%eax
    3d5e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3d61:	76 ca                	jbe    3d2d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    3d63:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3d66:	8b 40 04             	mov    0x4(%eax),%eax
    3d69:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    3d70:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3d73:	01 c2                	add    %eax,%edx
    3d75:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3d78:	8b 00                	mov    (%eax),%eax
    3d7a:	39 c2                	cmp    %eax,%edx
    3d7c:	75 24                	jne    3da2 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    3d7e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3d81:	8b 50 04             	mov    0x4(%eax),%edx
    3d84:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3d87:	8b 00                	mov    (%eax),%eax
    3d89:	8b 40 04             	mov    0x4(%eax),%eax
    3d8c:	01 c2                	add    %eax,%edx
    3d8e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3d91:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    3d94:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3d97:	8b 00                	mov    (%eax),%eax
    3d99:	8b 10                	mov    (%eax),%edx
    3d9b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3d9e:	89 10                	mov    %edx,(%eax)
    3da0:	eb 0a                	jmp    3dac <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    3da2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3da5:	8b 10                	mov    (%eax),%edx
    3da7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3daa:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    3dac:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3daf:	8b 40 04             	mov    0x4(%eax),%eax
    3db2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    3db9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3dbc:	01 d0                	add    %edx,%eax
    3dbe:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3dc1:	75 20                	jne    3de3 <free+0xcf>
    p->s.size += bp->s.size;
    3dc3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3dc6:	8b 50 04             	mov    0x4(%eax),%edx
    3dc9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3dcc:	8b 40 04             	mov    0x4(%eax),%eax
    3dcf:	01 c2                	add    %eax,%edx
    3dd1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3dd4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3dd7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3dda:	8b 10                	mov    (%eax),%edx
    3ddc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3ddf:	89 10                	mov    %edx,(%eax)
    3de1:	eb 08                	jmp    3deb <free+0xd7>
  } else
    p->s.ptr = bp;
    3de3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3de6:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3de9:	89 10                	mov    %edx,(%eax)
  freep = p;
    3deb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3dee:	a3 d4 eb 00 00       	mov    %eax,0xebd4
}
    3df3:	c9                   	leave  
    3df4:	c3                   	ret    

00003df5 <morecore>:

static Header*
morecore(uint nu)
{
    3df5:	55                   	push   %ebp
    3df6:	89 e5                	mov    %esp,%ebp
    3df8:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    3dfb:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    3e02:	77 07                	ja     3e0b <morecore+0x16>
    nu = 4096;
    3e04:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    3e0b:	8b 45 08             	mov    0x8(%ebp),%eax
    3e0e:	c1 e0 03             	shl    $0x3,%eax
    3e11:	83 ec 0c             	sub    $0xc,%esp
    3e14:	50                   	push   %eax
    3e15:	e8 15 fc ff ff       	call   3a2f <sbrk>
    3e1a:	83 c4 10             	add    $0x10,%esp
    3e1d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    3e20:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    3e24:	75 07                	jne    3e2d <morecore+0x38>
    return 0;
    3e26:	b8 00 00 00 00       	mov    $0x0,%eax
    3e2b:	eb 26                	jmp    3e53 <morecore+0x5e>
  hp = (Header*)p;
    3e2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e30:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    3e33:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3e36:	8b 55 08             	mov    0x8(%ebp),%edx
    3e39:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    3e3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3e3f:	83 c0 08             	add    $0x8,%eax
    3e42:	83 ec 0c             	sub    $0xc,%esp
    3e45:	50                   	push   %eax
    3e46:	e8 c9 fe ff ff       	call   3d14 <free>
    3e4b:	83 c4 10             	add    $0x10,%esp
  return freep;
    3e4e:	a1 d4 eb 00 00       	mov    0xebd4,%eax
}
    3e53:	c9                   	leave  
    3e54:	c3                   	ret    

00003e55 <malloc>:

void*
malloc(uint nbytes)
{
    3e55:	55                   	push   %ebp
    3e56:	89 e5                	mov    %esp,%ebp
    3e58:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3e5b:	8b 45 08             	mov    0x8(%ebp),%eax
    3e5e:	83 c0 07             	add    $0x7,%eax
    3e61:	c1 e8 03             	shr    $0x3,%eax
    3e64:	83 c0 01             	add    $0x1,%eax
    3e67:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    3e6a:	a1 d4 eb 00 00       	mov    0xebd4,%eax
    3e6f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3e72:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3e76:	75 23                	jne    3e9b <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    3e78:	c7 45 f0 cc eb 00 00 	movl   $0xebcc,-0x10(%ebp)
    3e7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3e82:	a3 d4 eb 00 00       	mov    %eax,0xebd4
    3e87:	a1 d4 eb 00 00       	mov    0xebd4,%eax
    3e8c:	a3 cc eb 00 00       	mov    %eax,0xebcc
    base.s.size = 0;
    3e91:	c7 05 d0 eb 00 00 00 	movl   $0x0,0xebd0
    3e98:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3e9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3e9e:	8b 00                	mov    (%eax),%eax
    3ea0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    3ea3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ea6:	8b 40 04             	mov    0x4(%eax),%eax
    3ea9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    3eac:	72 4d                	jb     3efb <malloc+0xa6>
      if(p->s.size == nunits)
    3eae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3eb1:	8b 40 04             	mov    0x4(%eax),%eax
    3eb4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    3eb7:	75 0c                	jne    3ec5 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    3eb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ebc:	8b 10                	mov    (%eax),%edx
    3ebe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ec1:	89 10                	mov    %edx,(%eax)
    3ec3:	eb 26                	jmp    3eeb <malloc+0x96>
      else {
        p->s.size -= nunits;
    3ec5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ec8:	8b 40 04             	mov    0x4(%eax),%eax
    3ecb:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3ece:	89 c2                	mov    %eax,%edx
    3ed0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ed3:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    3ed6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ed9:	8b 40 04             	mov    0x4(%eax),%eax
    3edc:	c1 e0 03             	shl    $0x3,%eax
    3edf:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    3ee2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ee5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3ee8:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    3eeb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3eee:	a3 d4 eb 00 00       	mov    %eax,0xebd4
      return (void*)(p + 1);
    3ef3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ef6:	83 c0 08             	add    $0x8,%eax
    3ef9:	eb 3b                	jmp    3f36 <malloc+0xe1>
    }
    if(p == freep)
    3efb:	a1 d4 eb 00 00       	mov    0xebd4,%eax
    3f00:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    3f03:	75 1e                	jne    3f23 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
    3f05:	83 ec 0c             	sub    $0xc,%esp
    3f08:	ff 75 ec             	pushl  -0x14(%ebp)
    3f0b:	e8 e5 fe ff ff       	call   3df5 <morecore>
    3f10:	83 c4 10             	add    $0x10,%esp
    3f13:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3f16:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3f1a:	75 07                	jne    3f23 <malloc+0xce>
        return 0;
    3f1c:	b8 00 00 00 00       	mov    $0x0,%eax
    3f21:	eb 13                	jmp    3f36 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3f23:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f26:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3f29:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f2c:	8b 00                	mov    (%eax),%eax
    3f2e:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    3f31:	e9 6d ff ff ff       	jmp    3ea3 <malloc+0x4e>
}
    3f36:	c9                   	leave  
    3f37:	c3                   	ret    

00003f38 <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    3f38:	55                   	push   %ebp
    3f39:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    3f3b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    3f3f:	79 07                	jns    3f48 <abs+0x10>
		return x * -1;
    3f41:	8b 45 08             	mov    0x8(%ebp),%eax
    3f44:	f7 d8                	neg    %eax
    3f46:	eb 03                	jmp    3f4b <abs+0x13>
	else
		return x;
    3f48:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3f4b:	5d                   	pop    %ebp
    3f4c:	c3                   	ret    

00003f4d <sin>:
double sin(double x)  
{  
    3f4d:	55                   	push   %ebp
    3f4e:	89 e5                	mov    %esp,%ebp
    3f50:	83 ec 40             	sub    $0x40,%esp
    3f53:	8b 45 08             	mov    0x8(%ebp),%eax
    3f56:	89 45 c8             	mov    %eax,-0x38(%ebp)
    3f59:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f5c:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    3f5f:	dd 45 c8             	fldl   -0x38(%ebp)
    3f62:	dd 5d f8             	fstpl  -0x8(%ebp)
    3f65:	d9 e8                	fld1   
    3f67:	dd 5d f0             	fstpl  -0x10(%ebp)
    3f6a:	dd 45 c8             	fldl   -0x38(%ebp)
    3f6d:	dd 5d e8             	fstpl  -0x18(%ebp)
    3f70:	dd 45 c8             	fldl   -0x38(%ebp)
    3f73:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    3f76:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    3f7d:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    3f84:	eb 50                	jmp    3fd6 <sin+0x89>
	{  
		n = n+1;  
    3f86:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    3f8a:	db 45 dc             	fildl  -0x24(%ebp)
    3f8d:	dc 4d f0             	fmull  -0x10(%ebp)
    3f90:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3f93:	83 c0 01             	add    $0x1,%eax
    3f96:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    3f99:	db 45 c4             	fildl  -0x3c(%ebp)
    3f9c:	de c9                	fmulp  %st,%st(1)
    3f9e:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    3fa1:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    3fa5:	dd 45 c8             	fldl   -0x38(%ebp)
    3fa8:	dc 4d c8             	fmull  -0x38(%ebp)
    3fab:	dd 45 e8             	fldl   -0x18(%ebp)
    3fae:	de c9                	fmulp  %st,%st(1)
    3fb0:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    3fb3:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    3fb6:	dd 45 e8             	fldl   -0x18(%ebp)
    3fb9:	dc 75 f0             	fdivl  -0x10(%ebp)
    3fbc:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    3fbf:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    3fc3:	7e 08                	jle    3fcd <sin+0x80>
    3fc5:	dd 45 f8             	fldl   -0x8(%ebp)
    3fc8:	dc 45 e0             	faddl  -0x20(%ebp)
    3fcb:	eb 06                	jmp    3fd3 <sin+0x86>
    3fcd:	dd 45 f8             	fldl   -0x8(%ebp)
    3fd0:	dc 65 e0             	fsubl  -0x20(%ebp)
    3fd3:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    3fd6:	dd 45 e0             	fldl   -0x20(%ebp)
    3fd9:	dd 05 00 a8 00 00    	fldl   0xa800
    3fdf:	d9 c9                	fxch   %st(1)
    3fe1:	df e9                	fucomip %st(1),%st
    3fe3:	dd d8                	fstp   %st(0)
    3fe5:	77 9f                	ja     3f86 <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    3fe7:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    3fea:	c9                   	leave  
    3feb:	c3                   	ret    

00003fec <cos>:
double cos(double x)  
{  
    3fec:	55                   	push   %ebp
    3fed:	89 e5                	mov    %esp,%ebp
    3fef:	83 ec 08             	sub    $0x8,%esp
    3ff2:	8b 45 08             	mov    0x8(%ebp),%eax
    3ff5:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3ff8:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ffb:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    3ffe:	dd 05 08 a8 00 00    	fldl   0xa808
    4004:	dc 65 f8             	fsubl  -0x8(%ebp)
    4007:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    400b:	dd 1c 24             	fstpl  (%esp)
    400e:	e8 3a ff ff ff       	call   3f4d <sin>
    4013:	83 c4 08             	add    $0x8,%esp
}  
    4016:	c9                   	leave  
    4017:	c3                   	ret    

00004018 <tan>:
double tan(double x)  
{  
    4018:	55                   	push   %ebp
    4019:	89 e5                	mov    %esp,%ebp
    401b:	83 ec 10             	sub    $0x10,%esp
    401e:	8b 45 08             	mov    0x8(%ebp),%eax
    4021:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4024:	8b 45 0c             	mov    0xc(%ebp),%eax
    4027:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    402a:	ff 75 fc             	pushl  -0x4(%ebp)
    402d:	ff 75 f8             	pushl  -0x8(%ebp)
    4030:	e8 18 ff ff ff       	call   3f4d <sin>
    4035:	83 c4 08             	add    $0x8,%esp
    4038:	dd 5d f0             	fstpl  -0x10(%ebp)
    403b:	ff 75 fc             	pushl  -0x4(%ebp)
    403e:	ff 75 f8             	pushl  -0x8(%ebp)
    4041:	e8 a6 ff ff ff       	call   3fec <cos>
    4046:	83 c4 08             	add    $0x8,%esp
    4049:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    404c:	c9                   	leave  
    404d:	c3                   	ret    

0000404e <pow>:

double pow(double x, double y)
{
    404e:	55                   	push   %ebp
    404f:	89 e5                	mov    %esp,%ebp
    4051:	83 ec 38             	sub    $0x38,%esp
    4054:	8b 45 08             	mov    0x8(%ebp),%eax
    4057:	89 45 e0             	mov    %eax,-0x20(%ebp)
    405a:	8b 45 0c             	mov    0xc(%ebp),%eax
    405d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4060:	8b 45 10             	mov    0x10(%ebp),%eax
    4063:	89 45 d8             	mov    %eax,-0x28(%ebp)
    4066:	8b 45 14             	mov    0x14(%ebp),%eax
    4069:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    406c:	dd 45 e0             	fldl   -0x20(%ebp)
    406f:	d9 ee                	fldz   
    4071:	df e9                	fucomip %st(1),%st
    4073:	dd d8                	fstp   %st(0)
    4075:	7a 28                	jp     409f <pow+0x51>
    4077:	dd 45 e0             	fldl   -0x20(%ebp)
    407a:	d9 ee                	fldz   
    407c:	df e9                	fucomip %st(1),%st
    407e:	dd d8                	fstp   %st(0)
    4080:	75 1d                	jne    409f <pow+0x51>
    4082:	dd 45 d8             	fldl   -0x28(%ebp)
    4085:	d9 ee                	fldz   
    4087:	df e9                	fucomip %st(1),%st
    4089:	dd d8                	fstp   %st(0)
    408b:	7a 0b                	jp     4098 <pow+0x4a>
    408d:	dd 45 d8             	fldl   -0x28(%ebp)
    4090:	d9 ee                	fldz   
    4092:	df e9                	fucomip %st(1),%st
    4094:	dd d8                	fstp   %st(0)
    4096:	74 07                	je     409f <pow+0x51>
    4098:	d9 ee                	fldz   
    409a:	e9 3a 01 00 00       	jmp    41d9 <pow+0x18b>
	else if(x==0 && y==0) return 1;
    409f:	dd 45 e0             	fldl   -0x20(%ebp)
    40a2:	d9 ee                	fldz   
    40a4:	df e9                	fucomip %st(1),%st
    40a6:	dd d8                	fstp   %st(0)
    40a8:	7a 28                	jp     40d2 <pow+0x84>
    40aa:	dd 45 e0             	fldl   -0x20(%ebp)
    40ad:	d9 ee                	fldz   
    40af:	df e9                	fucomip %st(1),%st
    40b1:	dd d8                	fstp   %st(0)
    40b3:	75 1d                	jne    40d2 <pow+0x84>
    40b5:	dd 45 d8             	fldl   -0x28(%ebp)
    40b8:	d9 ee                	fldz   
    40ba:	df e9                	fucomip %st(1),%st
    40bc:	dd d8                	fstp   %st(0)
    40be:	7a 12                	jp     40d2 <pow+0x84>
    40c0:	dd 45 d8             	fldl   -0x28(%ebp)
    40c3:	d9 ee                	fldz   
    40c5:	df e9                	fucomip %st(1),%st
    40c7:	dd d8                	fstp   %st(0)
    40c9:	75 07                	jne    40d2 <pow+0x84>
    40cb:	d9 e8                	fld1   
    40cd:	e9 07 01 00 00       	jmp    41d9 <pow+0x18b>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    40d2:	d9 ee                	fldz   
    40d4:	dd 45 d8             	fldl   -0x28(%ebp)
    40d7:	d9 c9                	fxch   %st(1)
    40d9:	df e9                	fucomip %st(1),%st
    40db:	dd d8                	fstp   %st(0)
    40dd:	76 23                	jbe    4102 <pow+0xb4>
    40df:	dd 45 d8             	fldl   -0x28(%ebp)
    40e2:	d9 e0                	fchs   
    40e4:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    40e8:	dd 1c 24             	fstpl  (%esp)
    40eb:	ff 75 e4             	pushl  -0x1c(%ebp)
    40ee:	ff 75 e0             	pushl  -0x20(%ebp)
    40f1:	e8 58 ff ff ff       	call   404e <pow>
    40f6:	83 c4 10             	add    $0x10,%esp
    40f9:	d9 e8                	fld1   
    40fb:	de f1                	fdivp  %st,%st(1)
    40fd:	e9 d7 00 00 00       	jmp    41d9 <pow+0x18b>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    4102:	d9 ee                	fldz   
    4104:	dd 45 e0             	fldl   -0x20(%ebp)
    4107:	d9 c9                	fxch   %st(1)
    4109:	df e9                	fucomip %st(1),%st
    410b:	dd d8                	fstp   %st(0)
    410d:	76 3a                	jbe    4149 <pow+0xfb>
    410f:	dd 45 d8             	fldl   -0x28(%ebp)
    4112:	d9 7d d6             	fnstcw -0x2a(%ebp)
    4115:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    4119:	b4 0c                	mov    $0xc,%ah
    411b:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    411f:	d9 6d d4             	fldcw  -0x2c(%ebp)
    4122:	db 5d cc             	fistpl -0x34(%ebp)
    4125:	d9 6d d6             	fldcw  -0x2a(%ebp)
    4128:	db 45 cc             	fildl  -0x34(%ebp)
    412b:	dd 45 d8             	fldl   -0x28(%ebp)
    412e:	de e1                	fsubp  %st,%st(1)
    4130:	d9 ee                	fldz   
    4132:	df e9                	fucomip %st(1),%st
    4134:	7a 0a                	jp     4140 <pow+0xf2>
    4136:	d9 ee                	fldz   
    4138:	df e9                	fucomip %st(1),%st
    413a:	dd d8                	fstp   %st(0)
    413c:	74 0b                	je     4149 <pow+0xfb>
    413e:	eb 02                	jmp    4142 <pow+0xf4>
    4140:	dd d8                	fstp   %st(0)
    4142:	d9 ee                	fldz   
    4144:	e9 90 00 00 00       	jmp    41d9 <pow+0x18b>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    4149:	d9 ee                	fldz   
    414b:	dd 45 e0             	fldl   -0x20(%ebp)
    414e:	d9 c9                	fxch   %st(1)
    4150:	df e9                	fucomip %st(1),%st
    4152:	dd d8                	fstp   %st(0)
    4154:	76 5d                	jbe    41b3 <pow+0x165>
    4156:	dd 45 d8             	fldl   -0x28(%ebp)
    4159:	d9 7d d6             	fnstcw -0x2a(%ebp)
    415c:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    4160:	b4 0c                	mov    $0xc,%ah
    4162:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    4166:	d9 6d d4             	fldcw  -0x2c(%ebp)
    4169:	db 5d cc             	fistpl -0x34(%ebp)
    416c:	d9 6d d6             	fldcw  -0x2a(%ebp)
    416f:	db 45 cc             	fildl  -0x34(%ebp)
    4172:	dd 45 d8             	fldl   -0x28(%ebp)
    4175:	de e1                	fsubp  %st,%st(1)
    4177:	d9 ee                	fldz   
    4179:	df e9                	fucomip %st(1),%st
    417b:	7a 34                	jp     41b1 <pow+0x163>
    417d:	d9 ee                	fldz   
    417f:	df e9                	fucomip %st(1),%st
    4181:	dd d8                	fstp   %st(0)
    4183:	75 2e                	jne    41b3 <pow+0x165>
	{
		double powint=1;
    4185:	d9 e8                	fld1   
    4187:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    418a:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    4191:	eb 0d                	jmp    41a0 <pow+0x152>
    4193:	dd 45 f0             	fldl   -0x10(%ebp)
    4196:	dc 4d e0             	fmull  -0x20(%ebp)
    4199:	dd 5d f0             	fstpl  -0x10(%ebp)
    419c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    41a0:	db 45 ec             	fildl  -0x14(%ebp)
    41a3:	dd 45 d8             	fldl   -0x28(%ebp)
    41a6:	df e9                	fucomip %st(1),%st
    41a8:	dd d8                	fstp   %st(0)
    41aa:	73 e7                	jae    4193 <pow+0x145>
		return powint;
    41ac:	dd 45 f0             	fldl   -0x10(%ebp)
    41af:	eb 28                	jmp    41d9 <pow+0x18b>
    41b1:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    41b3:	83 ec 08             	sub    $0x8,%esp
    41b6:	ff 75 e4             	pushl  -0x1c(%ebp)
    41b9:	ff 75 e0             	pushl  -0x20(%ebp)
    41bc:	e8 49 00 00 00       	call   420a <ln>
    41c1:	83 c4 10             	add    $0x10,%esp
    41c4:	dc 4d d8             	fmull  -0x28(%ebp)
    41c7:	83 ec 08             	sub    $0x8,%esp
    41ca:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    41ce:	dd 1c 24             	fstpl  (%esp)
    41d1:	e8 2a 02 00 00       	call   4400 <exp>
    41d6:	83 c4 10             	add    $0x10,%esp
}
    41d9:	c9                   	leave  
    41da:	c3                   	ret    

000041db <sqrt>:
// 求根
double sqrt(double x)
{
    41db:	55                   	push   %ebp
    41dc:	89 e5                	mov    %esp,%ebp
    41de:	83 ec 18             	sub    $0x18,%esp
    41e1:	8b 45 08             	mov    0x8(%ebp),%eax
    41e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    41e7:	8b 45 0c             	mov    0xc(%ebp),%eax
    41ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    41ed:	dd 05 10 a8 00 00    	fldl   0xa810
    41f3:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    41f7:	dd 1c 24             	fstpl  (%esp)
    41fa:	ff 75 f4             	pushl  -0xc(%ebp)
    41fd:	ff 75 f0             	pushl  -0x10(%ebp)
    4200:	e8 49 fe ff ff       	call   404e <pow>
    4205:	83 c4 10             	add    $0x10,%esp
}
    4208:	c9                   	leave  
    4209:	c3                   	ret    

0000420a <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    420a:	55                   	push   %ebp
    420b:	89 e5                	mov    %esp,%ebp
    420d:	83 ec 78             	sub    $0x78,%esp
    4210:	8b 45 08             	mov    0x8(%ebp),%eax
    4213:	89 45 90             	mov    %eax,-0x70(%ebp)
    4216:	8b 45 0c             	mov    0xc(%ebp),%eax
    4219:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    421c:	dd 45 90             	fldl   -0x70(%ebp)
    421f:	d9 e8                	fld1   
    4221:	de e9                	fsubrp %st,%st(1)
    4223:	dd 5d c0             	fstpl  -0x40(%ebp)
    4226:	d9 ee                	fldz   
    4228:	dd 5d f0             	fstpl  -0x10(%ebp)
    422b:	d9 ee                	fldz   
    422d:	dd 5d b8             	fstpl  -0x48(%ebp)
    4230:	d9 ee                	fldz   
    4232:	dd 5d b0             	fstpl  -0x50(%ebp)
    4235:	d9 ee                	fldz   
    4237:	dd 5d e8             	fstpl  -0x18(%ebp)
    423a:	d9 e8                	fld1   
    423c:	dd 5d e0             	fstpl  -0x20(%ebp)
    423f:	d9 e8                	fld1   
    4241:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    4244:	dd 45 90             	fldl   -0x70(%ebp)
    4247:	d9 e8                	fld1   
    4249:	df e9                	fucomip %st(1),%st
    424b:	dd d8                	fstp   %st(0)
    424d:	7a 12                	jp     4261 <ln+0x57>
    424f:	dd 45 90             	fldl   -0x70(%ebp)
    4252:	d9 e8                	fld1   
    4254:	df e9                	fucomip %st(1),%st
    4256:	dd d8                	fstp   %st(0)
    4258:	75 07                	jne    4261 <ln+0x57>
    425a:	d9 ee                	fldz   
    425c:	e9 9d 01 00 00       	jmp    43fe <ln+0x1f4>
	else if(x>2) return -ln(1/x);
    4261:	dd 45 90             	fldl   -0x70(%ebp)
    4264:	dd 05 18 a8 00 00    	fldl   0xa818
    426a:	d9 c9                	fxch   %st(1)
    426c:	df e9                	fucomip %st(1),%st
    426e:	dd d8                	fstp   %st(0)
    4270:	76 1e                	jbe    4290 <ln+0x86>
    4272:	d9 e8                	fld1   
    4274:	dc 75 90             	fdivl  -0x70(%ebp)
    4277:	83 ec 08             	sub    $0x8,%esp
    427a:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    427e:	dd 1c 24             	fstpl  (%esp)
    4281:	e8 84 ff ff ff       	call   420a <ln>
    4286:	83 c4 10             	add    $0x10,%esp
    4289:	d9 e0                	fchs   
    428b:	e9 6e 01 00 00       	jmp    43fe <ln+0x1f4>
	else if(x<.1)
    4290:	dd 05 20 a8 00 00    	fldl   0xa820
    4296:	dd 45 90             	fldl   -0x70(%ebp)
    4299:	d9 c9                	fxch   %st(1)
    429b:	df e9                	fucomip %st(1),%st
    429d:	dd d8                	fstp   %st(0)
    429f:	76 65                	jbe    4306 <ln+0xfc>
	{
		double n=-1;
    42a1:	d9 e8                	fld1   
    42a3:	d9 e0                	fchs   
    42a5:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    42a8:	dd 45 c8             	fldl   -0x38(%ebp)
    42ab:	dd 05 28 a8 00 00    	fldl   0xa828
    42b1:	de e9                	fsubrp %st,%st(1)
    42b3:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    42b6:	83 ec 08             	sub    $0x8,%esp
    42b9:	ff 75 cc             	pushl  -0x34(%ebp)
    42bc:	ff 75 c8             	pushl  -0x38(%ebp)
    42bf:	e8 3c 01 00 00       	call   4400 <exp>
    42c4:	83 c4 10             	add    $0x10,%esp
    42c7:	dd 45 90             	fldl   -0x70(%ebp)
    42ca:	de f1                	fdivp  %st,%st(1)
    42cc:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    42cf:	dd 45 a0             	fldl   -0x60(%ebp)
    42d2:	dd 05 18 a8 00 00    	fldl   0xa818
    42d8:	d9 c9                	fxch   %st(1)
    42da:	df e9                	fucomip %st(1),%st
    42dc:	dd d8                	fstp   %st(0)
    42de:	77 c8                	ja     42a8 <ln+0x9e>
    42e0:	d9 e8                	fld1   
    42e2:	dd 45 a0             	fldl   -0x60(%ebp)
    42e5:	d9 c9                	fxch   %st(1)
    42e7:	df e9                	fucomip %st(1),%st
    42e9:	dd d8                	fstp   %st(0)
    42eb:	77 bb                	ja     42a8 <ln+0x9e>
		return ln(a)+n;
    42ed:	83 ec 08             	sub    $0x8,%esp
    42f0:	ff 75 a4             	pushl  -0x5c(%ebp)
    42f3:	ff 75 a0             	pushl  -0x60(%ebp)
    42f6:	e8 0f ff ff ff       	call   420a <ln>
    42fb:	83 c4 10             	add    $0x10,%esp
    42fe:	dc 45 c8             	faddl  -0x38(%ebp)
    4301:	e9 f8 00 00 00       	jmp    43fe <ln+0x1f4>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    4306:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    430d:	d9 e8                	fld1   
    430f:	dd 5d d8             	fstpl  -0x28(%ebp)
    4312:	e9 b6 00 00 00       	jmp    43cd <ln+0x1c3>
	{
		ln_tmp=ln_px;
    4317:	dd 45 e8             	fldl   -0x18(%ebp)
    431a:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    431d:	dd 45 d8             	fldl   -0x28(%ebp)
    4320:	dc 4d c0             	fmull  -0x40(%ebp)
    4323:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    4326:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    432a:	75 0d                	jne    4339 <ln+0x12f>
    432c:	db 45 d4             	fildl  -0x2c(%ebp)
    432f:	dd 45 d8             	fldl   -0x28(%ebp)
    4332:	de f1                	fdivp  %st,%st(1)
    4334:	dd 5d d8             	fstpl  -0x28(%ebp)
    4337:	eb 13                	jmp    434c <ln+0x142>
		else tmp=tmp/-l;
    4339:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    433c:	f7 d8                	neg    %eax
    433e:	89 45 8c             	mov    %eax,-0x74(%ebp)
    4341:	db 45 8c             	fildl  -0x74(%ebp)
    4344:	dd 45 d8             	fldl   -0x28(%ebp)
    4347:	de f1                	fdivp  %st,%st(1)
    4349:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    434c:	dd 45 f0             	fldl   -0x10(%ebp)
    434f:	dc 45 d8             	faddl  -0x28(%ebp)
    4352:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    4355:	dd 45 d8             	fldl   -0x28(%ebp)
    4358:	d9 e0                	fchs   
    435a:	dc 4d c0             	fmull  -0x40(%ebp)
    435d:	db 45 d4             	fildl  -0x2c(%ebp)
    4360:	de c9                	fmulp  %st,%st(1)
    4362:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4365:	83 c0 01             	add    $0x1,%eax
    4368:	89 45 8c             	mov    %eax,-0x74(%ebp)
    436b:	db 45 8c             	fildl  -0x74(%ebp)
    436e:	de f9                	fdivrp %st,%st(1)
    4370:	dc 45 f0             	faddl  -0x10(%ebp)
    4373:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    4376:	dd 45 d8             	fldl   -0x28(%ebp)
    4379:	dc 4d c0             	fmull  -0x40(%ebp)
    437c:	dc 4d c0             	fmull  -0x40(%ebp)
    437f:	db 45 d4             	fildl  -0x2c(%ebp)
    4382:	de c9                	fmulp  %st,%st(1)
    4384:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4387:	83 c0 02             	add    $0x2,%eax
    438a:	89 45 8c             	mov    %eax,-0x74(%ebp)
    438d:	db 45 8c             	fildl  -0x74(%ebp)
    4390:	de f9                	fdivrp %st,%st(1)
    4392:	dc 45 b8             	faddl  -0x48(%ebp)
    4395:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    4398:	dd 45 b0             	fldl   -0x50(%ebp)
    439b:	dc 65 b8             	fsubl  -0x48(%ebp)
    439e:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    43a1:	dd 45 a8             	fldl   -0x58(%ebp)
    43a4:	dc 4d a8             	fmull  -0x58(%ebp)
    43a7:	dd 45 b8             	fldl   -0x48(%ebp)
    43aa:	d8 c0                	fadd   %st(0),%st
    43ac:	dd 45 b0             	fldl   -0x50(%ebp)
    43af:	de e1                	fsubp  %st,%st(1)
    43b1:	dc 45 f0             	faddl  -0x10(%ebp)
    43b4:	de f9                	fdivrp %st,%st(1)
    43b6:	dd 45 b0             	fldl   -0x50(%ebp)
    43b9:	de e1                	fsubp  %st,%st(1)
    43bb:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    43be:	db 45 d4             	fildl  -0x2c(%ebp)
    43c1:	dd 45 d8             	fldl   -0x28(%ebp)
    43c4:	de c9                	fmulp  %st,%st(1)
    43c6:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    43c9:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    43cd:	dd 45 e8             	fldl   -0x18(%ebp)
    43d0:	dc 65 e0             	fsubl  -0x20(%ebp)
    43d3:	dd 05 30 a8 00 00    	fldl   0xa830
    43d9:	d9 c9                	fxch   %st(1)
    43db:	df e9                	fucomip %st(1),%st
    43dd:	dd d8                	fstp   %st(0)
    43df:	0f 87 32 ff ff ff    	ja     4317 <ln+0x10d>
    43e5:	dd 45 e8             	fldl   -0x18(%ebp)
    43e8:	dc 65 e0             	fsubl  -0x20(%ebp)
    43eb:	dd 05 38 a8 00 00    	fldl   0xa838
    43f1:	df e9                	fucomip %st(1),%st
    43f3:	dd d8                	fstp   %st(0)
    43f5:	0f 87 1c ff ff ff    	ja     4317 <ln+0x10d>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    43fb:	dd 45 e8             	fldl   -0x18(%ebp)
}
    43fe:	c9                   	leave  
    43ff:	c3                   	ret    

00004400 <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    4400:	55                   	push   %ebp
    4401:	89 e5                	mov    %esp,%ebp
    4403:	83 ec 68             	sub    $0x68,%esp
    4406:	8b 45 08             	mov    0x8(%ebp),%eax
    4409:	89 45 a0             	mov    %eax,-0x60(%ebp)
    440c:	8b 45 0c             	mov    0xc(%ebp),%eax
    440f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    4412:	dd 45 a0             	fldl   -0x60(%ebp)
    4415:	dd 5d c0             	fstpl  -0x40(%ebp)
    4418:	d9 ee                	fldz   
    441a:	dd 5d f0             	fstpl  -0x10(%ebp)
    441d:	d9 ee                	fldz   
    441f:	dd 5d b8             	fstpl  -0x48(%ebp)
    4422:	d9 ee                	fldz   
    4424:	dd 5d b0             	fstpl  -0x50(%ebp)
    4427:	d9 ee                	fldz   
    4429:	dd 5d e8             	fstpl  -0x18(%ebp)
    442c:	d9 e8                	fld1   
    442e:	dd 5d e0             	fstpl  -0x20(%ebp)
    4431:	d9 e8                	fld1   
    4433:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    4436:	dd 45 a0             	fldl   -0x60(%ebp)
    4439:	d9 ee                	fldz   
    443b:	df e9                	fucomip %st(1),%st
    443d:	dd d8                	fstp   %st(0)
    443f:	7a 12                	jp     4453 <exp+0x53>
    4441:	dd 45 a0             	fldl   -0x60(%ebp)
    4444:	d9 ee                	fldz   
    4446:	df e9                	fucomip %st(1),%st
    4448:	dd d8                	fstp   %st(0)
    444a:	75 07                	jne    4453 <exp+0x53>
    444c:	d9 e8                	fld1   
    444e:	e9 12 01 00 00       	jmp    4565 <exp+0x165>
	if(x<0) return 1/exp(-x); 
    4453:	d9 ee                	fldz   
    4455:	dd 45 a0             	fldl   -0x60(%ebp)
    4458:	d9 c9                	fxch   %st(1)
    445a:	df e9                	fucomip %st(1),%st
    445c:	dd d8                	fstp   %st(0)
    445e:	76 20                	jbe    4480 <exp+0x80>
    4460:	dd 45 a0             	fldl   -0x60(%ebp)
    4463:	d9 e0                	fchs   
    4465:	83 ec 08             	sub    $0x8,%esp
    4468:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    446c:	dd 1c 24             	fstpl  (%esp)
    446f:	e8 8c ff ff ff       	call   4400 <exp>
    4474:	83 c4 10             	add    $0x10,%esp
    4477:	d9 e8                	fld1   
    4479:	de f1                	fdivp  %st,%st(1)
    447b:	e9 e5 00 00 00       	jmp    4565 <exp+0x165>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    4480:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    4487:	d9 e8                	fld1   
    4489:	dd 5d d0             	fstpl  -0x30(%ebp)
    448c:	e9 92 00 00 00       	jmp    4523 <exp+0x123>
	{
		ex_tmp=ex_px;
    4491:	dd 45 e8             	fldl   -0x18(%ebp)
    4494:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    4497:	dd 45 d0             	fldl   -0x30(%ebp)
    449a:	dc 4d c0             	fmull  -0x40(%ebp)
    449d:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    44a0:	db 45 cc             	fildl  -0x34(%ebp)
    44a3:	dd 45 d0             	fldl   -0x30(%ebp)
    44a6:	de f1                	fdivp  %st,%st(1)
    44a8:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    44ab:	dd 45 f0             	fldl   -0x10(%ebp)
    44ae:	dc 45 d0             	faddl  -0x30(%ebp)
    44b1:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    44b4:	dd 45 d0             	fldl   -0x30(%ebp)
    44b7:	dc 4d c0             	fmull  -0x40(%ebp)
    44ba:	8b 45 cc             	mov    -0x34(%ebp),%eax
    44bd:	83 c0 01             	add    $0x1,%eax
    44c0:	89 45 9c             	mov    %eax,-0x64(%ebp)
    44c3:	db 45 9c             	fildl  -0x64(%ebp)
    44c6:	de f9                	fdivrp %st,%st(1)
    44c8:	dc 45 f0             	faddl  -0x10(%ebp)
    44cb:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    44ce:	dd 45 d0             	fldl   -0x30(%ebp)
    44d1:	dc 4d c0             	fmull  -0x40(%ebp)
    44d4:	dc 4d c0             	fmull  -0x40(%ebp)
    44d7:	8b 45 cc             	mov    -0x34(%ebp),%eax
    44da:	83 c0 01             	add    $0x1,%eax
    44dd:	89 45 9c             	mov    %eax,-0x64(%ebp)
    44e0:	db 45 9c             	fildl  -0x64(%ebp)
    44e3:	de f9                	fdivrp %st,%st(1)
    44e5:	8b 45 cc             	mov    -0x34(%ebp),%eax
    44e8:	83 c0 02             	add    $0x2,%eax
    44eb:	89 45 9c             	mov    %eax,-0x64(%ebp)
    44ee:	db 45 9c             	fildl  -0x64(%ebp)
    44f1:	de f9                	fdivrp %st,%st(1)
    44f3:	dc 45 b8             	faddl  -0x48(%ebp)
    44f6:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    44f9:	dd 45 b0             	fldl   -0x50(%ebp)
    44fc:	dc 65 b8             	fsubl  -0x48(%ebp)
    44ff:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    4502:	dd 45 d8             	fldl   -0x28(%ebp)
    4505:	dc 4d d8             	fmull  -0x28(%ebp)
    4508:	dd 45 b8             	fldl   -0x48(%ebp)
    450b:	d8 c0                	fadd   %st(0),%st
    450d:	dd 45 b0             	fldl   -0x50(%ebp)
    4510:	de e1                	fsubp  %st,%st(1)
    4512:	dc 45 f0             	faddl  -0x10(%ebp)
    4515:	de f9                	fdivrp %st,%st(1)
    4517:	dd 45 b0             	fldl   -0x50(%ebp)
    451a:	de e1                	fsubp  %st,%st(1)
    451c:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    451f:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    4523:	dd 45 e8             	fldl   -0x18(%ebp)
    4526:	dc 65 e0             	fsubl  -0x20(%ebp)
    4529:	dd 05 40 a8 00 00    	fldl   0xa840
    452f:	d9 c9                	fxch   %st(1)
    4531:	df e9                	fucomip %st(1),%st
    4533:	dd d8                	fstp   %st(0)
    4535:	77 12                	ja     4549 <exp+0x149>
    4537:	dd 45 e8             	fldl   -0x18(%ebp)
    453a:	dc 65 e0             	fsubl  -0x20(%ebp)
    453d:	dd 05 48 a8 00 00    	fldl   0xa848
    4543:	df e9                	fucomip %st(1),%st
    4545:	dd d8                	fstp   %st(0)
    4547:	76 15                	jbe    455e <exp+0x15e>
    4549:	dd 45 d8             	fldl   -0x28(%ebp)
    454c:	dd 05 40 a8 00 00    	fldl   0xa840
    4552:	d9 c9                	fxch   %st(1)
    4554:	df e9                	fucomip %st(1),%st
    4556:	dd d8                	fstp   %st(0)
    4558:	0f 87 33 ff ff ff    	ja     4491 <exp+0x91>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    455e:	dd 45 e8             	fldl   -0x18(%ebp)
    4561:	d9 e8                	fld1   
    4563:	de c1                	faddp  %st,%st(1)
    4565:	c9                   	leave  
    4566:	c3                   	ret    

00004567 <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    4567:	55                   	push   %ebp
    4568:	89 e5                	mov    %esp,%ebp
    456a:	83 ec 68             	sub    $0x68,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    456d:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    4571:	83 ec 08             	sub    $0x8,%esp
    4574:	ff 75 08             	pushl  0x8(%ebp)
    4577:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    457a:	50                   	push   %eax
    457b:	e8 f7 f1 ff ff       	call   3777 <strcpy>
    4580:	83 c4 10             	add    $0x10,%esp
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    4583:	83 ec 08             	sub    $0x8,%esp
    4586:	6a 02                	push   $0x2
    4588:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    458b:	50                   	push   %eax
    458c:	e8 56 f4 ff ff       	call   39e7 <open>
    4591:	83 c4 10             	add    $0x10,%esp
    4594:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4597:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    459b:	75 16                	jne    45b3 <OpenTableFile+0x4c>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    459d:	83 ec 04             	sub    $0x4,%esp
    45a0:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    45a3:	50                   	push   %eax
    45a4:	68 7c a8 00 00       	push   $0xa87c
    45a9:	6a 00                	push   $0x0
    45ab:	e8 d4 f5 ff ff       	call   3b84 <printf>
    45b0:	83 c4 10             	add    $0x10,%esp
    }
    return f;
    45b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    45b6:	c9                   	leave  
    45b7:	c3                   	ret    

000045b8 <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    45b8:	55                   	push   %ebp
    45b9:	89 e5                	mov    %esp,%ebp
    45bb:	57                   	push   %edi
    45bc:	56                   	push   %esi
    45bd:	53                   	push   %ebx
    45be:	83 ec 1c             	sub    $0x1c,%esp
	layer *info = fr_ps->header;
    45c1:	8b 45 08             	mov    0x8(%ebp),%eax
    45c4:	8b 00                	mov    (%eax),%eax
    45c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    45c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    45cc:	8b 78 14             	mov    0x14(%eax),%edi
    45cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    45d2:	8b 70 10             	mov    0x10(%eax),%esi
    45d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    45d8:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    45db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    45de:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    45e1:	85 c0                	test   %eax,%eax
    45e3:	0f 94 c0             	sete   %al
    45e6:	0f b6 c8             	movzbl %al,%ecx
    45e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    45ec:	8b 50 04             	mov    0x4(%eax),%edx
    45ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    45f2:	8b 00                	mov    (%eax),%eax
    45f4:	57                   	push   %edi
    45f5:	56                   	push   %esi
    45f6:	53                   	push   %ebx
    45f7:	51                   	push   %ecx
    45f8:	52                   	push   %edx
    45f9:	50                   	push   %eax
    45fa:	68 9c a8 00 00       	push   $0xa89c
    45ff:	6a 00                	push   $0x0
    4601:	e8 7e f5 ff ff       	call   3b84 <printf>
    4606:	83 c4 20             	add    $0x20,%esp
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    4609:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    460c:	8b 78 2c             	mov    0x2c(%eax),%edi
    460f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4612:	8b 70 28             	mov    0x28(%eax),%esi
    4615:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4618:	8b 58 24             	mov    0x24(%eax),%ebx
    461b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    461e:	8b 48 20             	mov    0x20(%eax),%ecx
    4621:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4624:	8b 50 1c             	mov    0x1c(%eax),%edx
    4627:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    462a:	8b 40 18             	mov    0x18(%eax),%eax
    462d:	57                   	push   %edi
    462e:	56                   	push   %esi
    462f:	53                   	push   %ebx
    4630:	51                   	push   %ecx
    4631:	52                   	push   %edx
    4632:	50                   	push   %eax
    4633:	68 dc a8 00 00       	push   $0xa8dc
    4638:	6a 00                	push   $0x0
    463a:	e8 45 f5 ff ff       	call   3b84 <printf>
    463f:	83 c4 20             	add    $0x20,%esp
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    4642:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4645:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4648:	8b 0c 85 60 e7 00 00 	mov    0xe760(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    464f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4652:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4655:	dd 04 c5 40 e7 00 00 	fldl   0xe740(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    465c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    465f:	8b 40 04             	mov    0x4(%eax),%eax
    4662:	8d 50 ff             	lea    -0x1(%eax),%edx
    4665:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4668:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    466b:	89 d0                	mov    %edx,%eax
    466d:	c1 e0 04             	shl    $0x4,%eax
    4670:	29 d0                	sub    %edx,%eax
    4672:	01 d8                	add    %ebx,%eax
    4674:	8b 14 85 80 e6 00 00 	mov    0xe680(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    467b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    467e:	8b 40 04             	mov    0x4(%eax),%eax
    4681:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4684:	8b 04 85 40 e6 00 00 	mov    0xe640(,%eax,4),%eax
    468b:	83 ec 04             	sub    $0x4,%esp
    468e:	51                   	push   %ecx
    468f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4693:	dd 1c 24             	fstpl  (%esp)
    4696:	52                   	push   %edx
    4697:	50                   	push   %eax
    4698:	68 04 a9 00 00       	push   $0xa904
    469d:	6a 00                	push   $0x0
    469f:	e8 e0 f4 ff ff       	call   3b84 <printf>
    46a4:	83 c4 20             	add    $0x20,%esp
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    46a7:	8b 45 08             	mov    0x8(%ebp),%eax
    46aa:	8b 48 08             	mov    0x8(%eax),%ecx
    46ad:	8b 45 08             	mov    0x8(%ebp),%eax
    46b0:	8b 50 0c             	mov    0xc(%eax),%edx
    46b3:	8b 45 08             	mov    0x8(%ebp),%eax
    46b6:	8b 40 10             	mov    0x10(%eax),%eax
    46b9:	83 ec 0c             	sub    $0xc,%esp
    46bc:	51                   	push   %ecx
    46bd:	52                   	push   %edx
    46be:	50                   	push   %eax
    46bf:	68 33 a9 00 00       	push   $0xa933
    46c4:	6a 00                	push   $0x0
    46c6:	e8 b9 f4 ff ff       	call   3b84 <printf>
    46cb:	83 c4 20             	add    $0x20,%esp
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    46ce:	8d 65 f4             	lea    -0xc(%ebp),%esp
    46d1:	5b                   	pop    %ebx
    46d2:	5e                   	pop    %esi
    46d3:	5f                   	pop    %edi
    46d4:	5d                   	pop    %ebp
    46d5:	c3                   	ret    

000046d6 <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    46d6:	55                   	push   %ebp
    46d7:	89 e5                	mov    %esp,%ebp
    46d9:	83 ec 18             	sub    $0x18,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    46dc:	83 ec 0c             	sub    $0xc,%esp
    46df:	ff 75 08             	pushl  0x8(%ebp)
    46e2:	e8 6e f7 ff ff       	call   3e55 <malloc>
    46e7:	83 c4 10             	add    $0x10,%esp
    46ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    46ed:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    46f1:	74 15                	je     4708 <mem_alloc+0x32>
		memset(ptr, 0, block);
    46f3:	83 ec 04             	sub    $0x4,%esp
    46f6:	ff 75 08             	pushl  0x8(%ebp)
    46f9:	6a 00                	push   $0x0
    46fb:	ff 75 f4             	pushl  -0xc(%ebp)
    46fe:	e8 0a f1 ff ff       	call   380d <memset>
    4703:	83 c4 10             	add    $0x10,%esp
    4706:	eb 1a                	jmp    4722 <mem_alloc+0x4c>
	else{
		printf(0, "Unable to allocate %s\n", item);
    4708:	83 ec 04             	sub    $0x4,%esp
    470b:	ff 75 0c             	pushl  0xc(%ebp)
    470e:	68 4d a9 00 00       	push   $0xa94d
    4713:	6a 00                	push   $0x0
    4715:	e8 6a f4 ff ff       	call   3b84 <printf>
    471a:	83 c4 10             	add    $0x10,%esp
		exit();
    471d:	e8 85 f2 ff ff       	call   39a7 <exit>
	}
	return ptr;
    4722:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4725:	c9                   	leave  
    4726:	c3                   	ret    

00004727 <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    4727:	55                   	push   %ebp
    4728:	89 e5                	mov    %esp,%ebp
    472a:	83 ec 08             	sub    $0x8,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    472d:	8b 45 0c             	mov    0xc(%ebp),%eax
    4730:	83 ec 08             	sub    $0x8,%esp
    4733:	68 64 a9 00 00       	push   $0xa964
    4738:	50                   	push   %eax
    4739:	e8 98 ff ff ff       	call   46d6 <mem_alloc>
    473e:	83 c4 10             	add    $0x10,%esp
    4741:	89 c2                	mov    %eax,%edx
    4743:	8b 45 08             	mov    0x8(%ebp),%eax
    4746:	89 50 04             	mov    %edx,0x4(%eax)
	bs->buf_size = size;
    4749:	8b 45 08             	mov    0x8(%ebp),%eax
    474c:	8b 55 0c             	mov    0xc(%ebp),%edx
    474f:	89 50 08             	mov    %edx,0x8(%eax)
}
    4752:	c9                   	leave  
    4753:	c3                   	ret    

00004754 <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    4754:	55                   	push   %ebp
    4755:	89 e5                	mov    %esp,%ebp
    4757:	83 ec 08             	sub    $0x8,%esp
	free(bs->buf);
    475a:	8b 45 08             	mov    0x8(%ebp),%eax
    475d:	8b 40 04             	mov    0x4(%eax),%eax
    4760:	83 ec 0c             	sub    $0xc,%esp
    4763:	50                   	push   %eax
    4764:	e8 ab f5 ff ff       	call   3d14 <free>
    4769:	83 c4 10             	add    $0x10,%esp
}
    476c:	c9                   	leave  
    476d:	c3                   	ret    

0000476e <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    476e:	55                   	push   %ebp
    476f:	89 e5                	mov    %esp,%ebp
    4771:	83 ec 08             	sub    $0x8,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    4774:	83 ec 08             	sub    $0x8,%esp
    4777:	6a 02                	push   $0x2
    4779:	ff 75 0c             	pushl  0xc(%ebp)
    477c:	e8 66 f2 ff ff       	call   39e7 <open>
    4781:	83 c4 10             	add    $0x10,%esp
    4784:	89 c2                	mov    %eax,%edx
    4786:	8b 45 08             	mov    0x8(%ebp),%eax
    4789:	89 10                	mov    %edx,(%eax)
    478b:	8b 45 08             	mov    0x8(%ebp),%eax
    478e:	8b 00                	mov    (%eax),%eax
    4790:	83 f8 ff             	cmp    $0xffffffff,%eax
    4793:	75 1a                	jne    47af <open_bit_stream_r+0x41>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    4795:	83 ec 04             	sub    $0x4,%esp
    4798:	ff 75 0c             	pushl  0xc(%ebp)
    479b:	68 6b a9 00 00       	push   $0xa96b
    47a0:	6a 00                	push   $0x0
    47a2:	e8 dd f3 ff ff       	call   3b84 <printf>
    47a7:	83 c4 10             	add    $0x10,%esp
		exit();
    47aa:	e8 f8 f1 ff ff       	call   39a7 <exit>
	}

	bs->format = BINARY;
    47af:	8b 45 08             	mov    0x8(%ebp),%eax
    47b2:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    47b6:	83 ec 08             	sub    $0x8,%esp
    47b9:	ff 75 10             	pushl  0x10(%ebp)
    47bc:	ff 75 08             	pushl  0x8(%ebp)
    47bf:	e8 63 ff ff ff       	call   4727 <alloc_buffer>
    47c4:	83 c4 10             	add    $0x10,%esp
	bs->buf_byte_idx=0;
    47c7:	8b 45 08             	mov    0x8(%ebp),%eax
    47ca:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    47d1:	8b 45 08             	mov    0x8(%ebp),%eax
    47d4:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    47db:	8b 45 08             	mov    0x8(%ebp),%eax
    47de:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    47e5:	8b 45 08             	mov    0x8(%ebp),%eax
    47e8:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    47ef:	8b 45 08             	mov    0x8(%ebp),%eax
    47f2:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    47f9:	8b 45 08             	mov    0x8(%ebp),%eax
    47fc:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    4803:	c9                   	leave  
    4804:	c3                   	ret    

00004805 <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    4805:	55                   	push   %ebp
    4806:	89 e5                	mov    %esp,%ebp
    4808:	83 ec 08             	sub    $0x8,%esp
	close(bs->pt);
    480b:	8b 45 08             	mov    0x8(%ebp),%eax
    480e:	8b 00                	mov    (%eax),%eax
    4810:	83 ec 0c             	sub    $0xc,%esp
    4813:	50                   	push   %eax
    4814:	e8 b6 f1 ff ff       	call   39cf <close>
    4819:	83 c4 10             	add    $0x10,%esp
	desalloc_buffer(bs);
    481c:	83 ec 0c             	sub    $0xc,%esp
    481f:	ff 75 08             	pushl  0x8(%ebp)
    4822:	e8 2d ff ff ff       	call   4754 <desalloc_buffer>
    4827:	83 c4 10             	add    $0x10,%esp
}
    482a:	c9                   	leave  
    482b:	c3                   	ret    

0000482c <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    482c:	55                   	push   %ebp
    482d:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    482f:	8b 45 08             	mov    0x8(%ebp),%eax
    4832:	8b 40 20             	mov    0x20(%eax),%eax
}
    4835:	5d                   	pop    %ebp
    4836:	c3                   	ret    

00004837 <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    4837:	55                   	push   %ebp
    4838:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    483a:	8b 45 08             	mov    0x8(%ebp),%eax
    483d:	8b 40 0c             	mov    0xc(%eax),%eax
}
    4840:	5d                   	pop    %ebp
    4841:	c3                   	ret    

00004842 <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    4842:	55                   	push   %ebp
    4843:	89 e5                	mov    %esp,%ebp
    4845:	56                   	push   %esi
    4846:	53                   	push   %ebx
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    4847:	8b 45 08             	mov    0x8(%ebp),%eax
    484a:	8b 40 08             	mov    0x8(%eax),%eax
    484d:	8d 50 fe             	lea    -0x2(%eax),%edx
    4850:	8b 45 08             	mov    0x8(%ebp),%eax
    4853:	8b 40 10             	mov    0x10(%eax),%eax
    4856:	89 d3                	mov    %edx,%ebx
    4858:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    485a:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    485f:	eb 30                	jmp    4891 <refill_buffer+0x4f>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    4861:	8b 45 08             	mov    0x8(%ebp),%eax
    4864:	8b 50 04             	mov    0x4(%eax),%edx
    4867:	89 d8                	mov    %ebx,%eax
    4869:	8d 58 ff             	lea    -0x1(%eax),%ebx
    486c:	01 c2                	add    %eax,%edx
    486e:	8b 45 08             	mov    0x8(%ebp),%eax
    4871:	8b 00                	mov    (%eax),%eax
    4873:	83 ec 04             	sub    $0x4,%esp
    4876:	6a 01                	push   $0x1
    4878:	52                   	push   %edx
    4879:	50                   	push   %eax
    487a:	e8 40 f1 ff ff       	call   39bf <read>
    487f:	83 c4 10             	add    $0x10,%esp
    4882:	89 c6                	mov    %eax,%esi
		if (!n)
    4884:	85 f6                	test   %esi,%esi
    4886:	75 09                	jne    4891 <refill_buffer+0x4f>
		bs->eob= i+1;
    4888:	8d 53 01             	lea    0x1(%ebx),%edx
    488b:	8b 45 08             	mov    0x8(%ebp),%eax
    488e:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    4891:	85 db                	test   %ebx,%ebx
    4893:	78 0a                	js     489f <refill_buffer+0x5d>
    4895:	8b 45 08             	mov    0x8(%ebp),%eax
    4898:	8b 40 1c             	mov    0x1c(%eax),%eax
    489b:	85 c0                	test   %eax,%eax
    489d:	74 c2                	je     4861 <refill_buffer+0x1f>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    489f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    48a2:	5b                   	pop    %ebx
    48a3:	5e                   	pop    %esi
    48a4:	5d                   	pop    %ebp
    48a5:	c3                   	ret    

000048a6 <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    48a6:	55                   	push   %ebp
    48a7:	89 e5                	mov    %esp,%ebp
    48a9:	53                   	push   %ebx
    48aa:	83 ec 14             	sub    $0x14,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    48ad:	8b 45 08             	mov    0x8(%ebp),%eax
    48b0:	8b 40 0c             	mov    0xc(%eax),%eax
    48b3:	8d 50 01             	lea    0x1(%eax),%edx
    48b6:	8b 45 08             	mov    0x8(%ebp),%eax
    48b9:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    48bc:	8b 45 08             	mov    0x8(%ebp),%eax
    48bf:	8b 40 14             	mov    0x14(%eax),%eax
    48c2:	85 c0                	test   %eax,%eax
    48c4:	0f 85 a2 00 00 00    	jne    496c <get1bit+0xc6>
        bs->buf_bit_idx = 8;
    48ca:	8b 45 08             	mov    0x8(%ebp),%eax
    48cd:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    48d4:	8b 45 08             	mov    0x8(%ebp),%eax
    48d7:	8b 40 10             	mov    0x10(%eax),%eax
    48da:	8d 50 ff             	lea    -0x1(%eax),%edx
    48dd:	8b 45 08             	mov    0x8(%ebp),%eax
    48e0:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    48e3:	8b 45 08             	mov    0x8(%ebp),%eax
    48e6:	8b 40 10             	mov    0x10(%eax),%eax
    48e9:	83 f8 03             	cmp    $0x3,%eax
    48ec:	7e 10                	jle    48fe <get1bit+0x58>
    48ee:	8b 45 08             	mov    0x8(%ebp),%eax
    48f1:	8b 50 10             	mov    0x10(%eax),%edx
    48f4:	8b 45 08             	mov    0x8(%ebp),%eax
    48f7:	8b 40 1c             	mov    0x1c(%eax),%eax
    48fa:	39 c2                	cmp    %eax,%edx
    48fc:	7d 6e                	jge    496c <get1bit+0xc6>
             if (bs->eob)
    48fe:	8b 45 08             	mov    0x8(%ebp),%eax
    4901:	8b 40 1c             	mov    0x1c(%eax),%eax
    4904:	85 c0                	test   %eax,%eax
    4906:	74 0c                	je     4914 <get1bit+0x6e>
                bs->eobs = TRUE;
    4908:	8b 45 08             	mov    0x8(%ebp),%eax
    490b:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    4912:	eb 58                	jmp    496c <get1bit+0xc6>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    4914:	8b 45 08             	mov    0x8(%ebp),%eax
    4917:	8b 58 10             	mov    0x10(%eax),%ebx
    491a:	eb 2f                	jmp    494b <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    491c:	8b 45 08             	mov    0x8(%ebp),%eax
    491f:	8b 50 04             	mov    0x4(%eax),%edx
    4922:	8b 45 08             	mov    0x8(%ebp),%eax
    4925:	8b 40 08             	mov    0x8(%eax),%eax
    4928:	8d 48 ff             	lea    -0x1(%eax),%ecx
    492b:	8b 45 08             	mov    0x8(%ebp),%eax
    492e:	8b 40 10             	mov    0x10(%eax),%eax
    4931:	29 c1                	sub    %eax,%ecx
    4933:	89 c8                	mov    %ecx,%eax
    4935:	01 d8                	add    %ebx,%eax
    4937:	01 c2                	add    %eax,%edx
    4939:	8b 45 08             	mov    0x8(%ebp),%eax
    493c:	8b 40 04             	mov    0x4(%eax),%eax
    493f:	89 d9                	mov    %ebx,%ecx
    4941:	01 c8                	add    %ecx,%eax
    4943:	0f b6 00             	movzbl (%eax),%eax
    4946:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    4948:	83 eb 01             	sub    $0x1,%ebx
    494b:	85 db                	test   %ebx,%ebx
    494d:	79 cd                	jns    491c <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    494f:	83 ec 0c             	sub    $0xc,%esp
    4952:	ff 75 08             	pushl  0x8(%ebp)
    4955:	e8 e8 fe ff ff       	call   4842 <refill_buffer>
    495a:	83 c4 10             	add    $0x10,%esp
                bs->buf_byte_idx = bs->buf_size-1;
    495d:	8b 45 08             	mov    0x8(%ebp),%eax
    4960:	8b 40 08             	mov    0x8(%eax),%eax
    4963:	8d 50 ff             	lea    -0x1(%eax),%edx
    4966:	8b 45 08             	mov    0x8(%ebp),%eax
    4969:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    496c:	8b 45 08             	mov    0x8(%ebp),%eax
    496f:	8b 50 04             	mov    0x4(%eax),%edx
    4972:	8b 45 08             	mov    0x8(%ebp),%eax
    4975:	8b 40 10             	mov    0x10(%eax),%eax
    4978:	01 d0                	add    %edx,%eax
    497a:	0f b6 00             	movzbl (%eax),%eax
    497d:	0f b6 d0             	movzbl %al,%edx
    4980:	8b 45 08             	mov    0x8(%ebp),%eax
    4983:	8b 40 14             	mov    0x14(%eax),%eax
    4986:	83 e8 01             	sub    $0x1,%eax
    4989:	8b 04 85 80 e7 00 00 	mov    0xe780(,%eax,4),%eax
    4990:	21 d0                	and    %edx,%eax
    4992:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    4995:	8b 45 08             	mov    0x8(%ebp),%eax
    4998:	8b 40 14             	mov    0x14(%eax),%eax
    499b:	83 e8 01             	sub    $0x1,%eax
    499e:	89 c1                	mov    %eax,%ecx
    49a0:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    49a3:	8b 45 08             	mov    0x8(%ebp),%eax
    49a6:	8b 40 14             	mov    0x14(%eax),%eax
    49a9:	8d 50 ff             	lea    -0x1(%eax),%edx
    49ac:	8b 45 08             	mov    0x8(%ebp),%eax
    49af:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    49b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    49b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    49b8:	c9                   	leave  
    49b9:	c3                   	ret    

000049ba <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    49ba:	55                   	push   %ebp
    49bb:	89 e5                	mov    %esp,%ebp
    49bd:	57                   	push   %edi
    49be:	56                   	push   %esi
    49bf:	53                   	push   %ebx
    49c0:	83 ec 1c             	sub    $0x1c,%esp
	unsigned long val=0;
    49c3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    49ca:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    49cd:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    49d1:	7e 14                	jle    49e7 <getbits+0x2d>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    49d3:	83 ec 04             	sub    $0x4,%esp
    49d6:	6a 20                	push   $0x20
    49d8:	68 84 a9 00 00       	push   $0xa984
    49dd:	6a 00                	push   $0x0
    49df:	e8 a0 f1 ff ff       	call   3b84 <printf>
    49e4:	83 c4 10             	add    $0x10,%esp

	bs->totbit += N;
    49e7:	8b 45 08             	mov    0x8(%ebp),%eax
    49ea:	8b 50 0c             	mov    0xc(%eax),%edx
    49ed:	8b 45 0c             	mov    0xc(%ebp),%eax
    49f0:	01 c2                	add    %eax,%edx
    49f2:	8b 45 08             	mov    0x8(%ebp),%eax
    49f5:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    49f8:	e9 0d 01 00 00       	jmp    4b0a <getbits+0x150>
		if (!bs->buf_bit_idx) {
    49fd:	8b 45 08             	mov    0x8(%ebp),%eax
    4a00:	8b 40 14             	mov    0x14(%eax),%eax
    4a03:	85 c0                	test   %eax,%eax
    4a05:	0f 85 a2 00 00 00    	jne    4aad <getbits+0xf3>
			bs->buf_bit_idx = 8;
    4a0b:	8b 45 08             	mov    0x8(%ebp),%eax
    4a0e:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    4a15:	8b 45 08             	mov    0x8(%ebp),%eax
    4a18:	8b 40 10             	mov    0x10(%eax),%eax
    4a1b:	8d 50 ff             	lea    -0x1(%eax),%edx
    4a1e:	8b 45 08             	mov    0x8(%ebp),%eax
    4a21:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    4a24:	8b 45 08             	mov    0x8(%ebp),%eax
    4a27:	8b 40 10             	mov    0x10(%eax),%eax
    4a2a:	83 f8 03             	cmp    $0x3,%eax
    4a2d:	7e 10                	jle    4a3f <getbits+0x85>
    4a2f:	8b 45 08             	mov    0x8(%ebp),%eax
    4a32:	8b 50 10             	mov    0x10(%eax),%edx
    4a35:	8b 45 08             	mov    0x8(%ebp),%eax
    4a38:	8b 40 1c             	mov    0x1c(%eax),%eax
    4a3b:	39 c2                	cmp    %eax,%edx
    4a3d:	7d 6e                	jge    4aad <getbits+0xf3>
				if (bs->eob)
    4a3f:	8b 45 08             	mov    0x8(%ebp),%eax
    4a42:	8b 40 1c             	mov    0x1c(%eax),%eax
    4a45:	85 c0                	test   %eax,%eax
    4a47:	74 0c                	je     4a55 <getbits+0x9b>
					bs->eobs = TRUE;
    4a49:	8b 45 08             	mov    0x8(%ebp),%eax
    4a4c:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    4a53:	eb 58                	jmp    4aad <getbits+0xf3>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    4a55:	8b 45 08             	mov    0x8(%ebp),%eax
    4a58:	8b 70 10             	mov    0x10(%eax),%esi
    4a5b:	eb 2f                	jmp    4a8c <getbits+0xd2>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    4a5d:	8b 45 08             	mov    0x8(%ebp),%eax
    4a60:	8b 50 04             	mov    0x4(%eax),%edx
    4a63:	8b 45 08             	mov    0x8(%ebp),%eax
    4a66:	8b 40 08             	mov    0x8(%eax),%eax
    4a69:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4a6c:	8b 45 08             	mov    0x8(%ebp),%eax
    4a6f:	8b 40 10             	mov    0x10(%eax),%eax
    4a72:	29 c1                	sub    %eax,%ecx
    4a74:	89 c8                	mov    %ecx,%eax
    4a76:	01 f0                	add    %esi,%eax
    4a78:	01 c2                	add    %eax,%edx
    4a7a:	8b 45 08             	mov    0x8(%ebp),%eax
    4a7d:	8b 40 04             	mov    0x4(%eax),%eax
    4a80:	89 f1                	mov    %esi,%ecx
    4a82:	01 c8                	add    %ecx,%eax
    4a84:	0f b6 00             	movzbl (%eax),%eax
    4a87:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    4a89:	83 ee 01             	sub    $0x1,%esi
    4a8c:	85 f6                	test   %esi,%esi
    4a8e:	79 cd                	jns    4a5d <getbits+0xa3>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    4a90:	83 ec 0c             	sub    $0xc,%esp
    4a93:	ff 75 08             	pushl  0x8(%ebp)
    4a96:	e8 a7 fd ff ff       	call   4842 <refill_buffer>
    4a9b:	83 c4 10             	add    $0x10,%esp
					bs->buf_byte_idx = bs->buf_size-1;
    4a9e:	8b 45 08             	mov    0x8(%ebp),%eax
    4aa1:	8b 40 08             	mov    0x8(%eax),%eax
    4aa4:	8d 50 ff             	lea    -0x1(%eax),%edx
    4aa7:	8b 45 08             	mov    0x8(%ebp),%eax
    4aaa:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    4aad:	8b 45 08             	mov    0x8(%ebp),%eax
    4ab0:	8b 40 14             	mov    0x14(%eax),%eax
    4ab3:	39 d8                	cmp    %ebx,%eax
    4ab5:	0f 4f c3             	cmovg  %ebx,%eax
    4ab8:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    4aba:	8b 45 08             	mov    0x8(%ebp),%eax
    4abd:	8b 50 04             	mov    0x4(%eax),%edx
    4ac0:	8b 45 08             	mov    0x8(%ebp),%eax
    4ac3:	8b 40 10             	mov    0x10(%eax),%eax
    4ac6:	01 d0                	add    %edx,%eax
    4ac8:	0f b6 00             	movzbl (%eax),%eax
    4acb:	0f b6 d0             	movzbl %al,%edx
    4ace:	8b 45 08             	mov    0x8(%ebp),%eax
    4ad1:	8b 40 14             	mov    0x14(%eax),%eax
    4ad4:	8b 04 85 a0 e7 00 00 	mov    0xe7a0(,%eax,4),%eax
    4adb:	89 d7                	mov    %edx,%edi
    4add:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    4adf:	8b 45 08             	mov    0x8(%ebp),%eax
    4ae2:	8b 40 14             	mov    0x14(%eax),%eax
    4ae5:	29 f0                	sub    %esi,%eax
    4ae7:	89 c1                	mov    %eax,%ecx
    4ae9:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    4aeb:	89 d8                	mov    %ebx,%eax
    4aed:	29 f0                	sub    %esi,%eax
    4aef:	89 c1                	mov    %eax,%ecx
    4af1:	d3 e7                	shl    %cl,%edi
    4af3:	89 f8                	mov    %edi,%eax
    4af5:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    4af8:	8b 45 08             	mov    0x8(%ebp),%eax
    4afb:	8b 40 14             	mov    0x14(%eax),%eax
    4afe:	29 f0                	sub    %esi,%eax
    4b00:	89 c2                	mov    %eax,%edx
    4b02:	8b 45 08             	mov    0x8(%ebp),%eax
    4b05:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    4b08:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    4b0a:	85 db                	test   %ebx,%ebx
    4b0c:	0f 8f eb fe ff ff    	jg     49fd <getbits+0x43>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    4b12:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    4b15:	8d 65 f4             	lea    -0xc(%ebp),%esp
    4b18:	5b                   	pop    %ebx
    4b19:	5e                   	pop    %esi
    4b1a:	5f                   	pop    %edi
    4b1b:	5d                   	pop    %ebp
    4b1c:	c3                   	ret    

00004b1d <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    4b1d:	55                   	push   %ebp
    4b1e:	89 e5                	mov    %esp,%ebp
    4b20:	83 ec 28             	sub    $0x28,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    4b23:	db 45 10             	fildl  0x10(%ebp)
    4b26:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4b2a:	dd 1c 24             	fstpl  (%esp)
    4b2d:	dd 05 f0 a9 00 00    	fldl   0xa9f0
    4b33:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    4b37:	dd 1c 24             	fstpl  (%esp)
    4b3a:	e8 0f f5 ff ff       	call   404e <pow>
    4b3f:	83 c4 10             	add    $0x10,%esp
    4b42:	d9 7d e6             	fnstcw -0x1a(%ebp)
    4b45:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    4b49:	b4 0c                	mov    $0xc,%ah
    4b4b:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    4b4f:	d9 6d e4             	fldcw  -0x1c(%ebp)
    4b52:	db 5d e0             	fistpl -0x20(%ebp)
    4b55:	d9 6d e6             	fldcw  -0x1a(%ebp)
    4b58:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4b5b:	83 e8 01             	sub    $0x1,%eax
    4b5e:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    4b61:	83 ec 0c             	sub    $0xc,%esp
    4b64:	ff 75 08             	pushl  0x8(%ebp)
    4b67:	e8 cb fc ff ff       	call   4837 <sstell>
    4b6c:	83 c4 10             	add    $0x10,%esp
    4b6f:	83 e0 07             	and    $0x7,%eax
    4b72:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    4b75:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4b79:	74 17                	je     4b92 <seek_sync+0x75>
		getbits(bs, (int)(ALIGNING-aligning));
    4b7b:	b8 08 00 00 00       	mov    $0x8,%eax
    4b80:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4b83:	83 ec 08             	sub    $0x8,%esp
    4b86:	50                   	push   %eax
    4b87:	ff 75 08             	pushl  0x8(%ebp)
    4b8a:	e8 2b fe ff ff       	call   49ba <getbits>
    4b8f:	83 c4 10             	add    $0x10,%esp

	val = getbits(bs, N);
    4b92:	83 ec 08             	sub    $0x8,%esp
    4b95:	ff 75 10             	pushl  0x10(%ebp)
    4b98:	ff 75 08             	pushl  0x8(%ebp)
    4b9b:	e8 1a fe ff ff       	call   49ba <getbits>
    4ba0:	83 c4 10             	add    $0x10,%esp
    4ba3:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    4ba6:	eb 17                	jmp    4bbf <seek_sync+0xa2>
		val <<= ALIGNING;
    4ba8:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    4bac:	83 ec 08             	sub    $0x8,%esp
    4baf:	6a 08                	push   $0x8
    4bb1:	ff 75 08             	pushl  0x8(%ebp)
    4bb4:	e8 01 fe ff ff       	call   49ba <getbits>
    4bb9:	83 c4 10             	add    $0x10,%esp
    4bbc:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    4bbf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4bc2:	23 45 f4             	and    -0xc(%ebp),%eax
    4bc5:	3b 45 0c             	cmp    0xc(%ebp),%eax
    4bc8:	74 12                	je     4bdc <seek_sync+0xbf>
    4bca:	83 ec 0c             	sub    $0xc,%esp
    4bcd:	ff 75 08             	pushl  0x8(%ebp)
    4bd0:	e8 57 fc ff ff       	call   482c <end_bs>
    4bd5:	83 c4 10             	add    $0x10,%esp
    4bd8:	85 c0                	test   %eax,%eax
    4bda:	74 cc                	je     4ba8 <seek_sync+0x8b>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    4bdc:	83 ec 0c             	sub    $0xc,%esp
    4bdf:	ff 75 08             	pushl  0x8(%ebp)
    4be2:	e8 45 fc ff ff       	call   482c <end_bs>
    4be7:	83 c4 10             	add    $0x10,%esp
    4bea:	85 c0                	test   %eax,%eax
    4bec:	74 07                	je     4bf5 <seek_sync+0xd8>
		return(0);
    4bee:	b8 00 00 00 00       	mov    $0x0,%eax
    4bf3:	eb 05                	jmp    4bfa <seek_sync+0xdd>
	else
		return(1);
    4bf5:	b8 01 00 00 00       	mov    $0x1,%eax
}
    4bfa:	c9                   	leave  
    4bfb:	c3                   	ret    

00004bfc <js_bound>:

int js_bound(int lay, int m_ext)
{
    4bfc:	55                   	push   %ebp
    4bfd:	89 e5                	mov    %esp,%ebp
    4bff:	83 ec 08             	sub    $0x8,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    4c02:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    4c06:	7e 12                	jle    4c1a <js_bound+0x1e>
    4c08:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    4c0c:	7f 0c                	jg     4c1a <js_bound+0x1e>
    4c0e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    4c12:	78 06                	js     4c1a <js_bound+0x1e>
    4c14:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    4c18:	7e 1a                	jle    4c34 <js_bound+0x38>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    4c1a:	ff 75 0c             	pushl  0xc(%ebp)
    4c1d:	ff 75 08             	pushl  0x8(%ebp)
    4c20:	68 b8 a9 00 00       	push   $0xa9b8
    4c25:	6a 00                	push   $0x0
    4c27:	e8 58 ef ff ff       	call   3b84 <printf>
    4c2c:	83 c4 10             	add    $0x10,%esp
        exit();
    4c2f:	e8 73 ed ff ff       	call   39a7 <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    4c34:	8b 45 08             	mov    0x8(%ebp),%eax
    4c37:	83 e8 01             	sub    $0x1,%eax
    4c3a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    4c41:	8b 45 0c             	mov    0xc(%ebp),%eax
    4c44:	01 d0                	add    %edx,%eax
    4c46:	8b 04 85 e0 e7 00 00 	mov    0xe7e0(,%eax,4),%eax
}
    4c4d:	c9                   	leave  
    4c4e:	c3                   	ret    

00004c4f <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    4c4f:	55                   	push   %ebp
    4c50:	89 e5                	mov    %esp,%ebp
    4c52:	83 ec 18             	sub    $0x18,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    4c55:	8b 45 08             	mov    0x8(%ebp),%eax
    4c58:	8b 00                	mov    (%eax),%eax
    4c5a:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    4c5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4c60:	8b 50 1c             	mov    0x1c(%eax),%edx
    4c63:	8b 45 08             	mov    0x8(%ebp),%eax
    4c66:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    4c69:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4c6c:	8b 40 1c             	mov    0x1c(%eax),%eax
    4c6f:	83 f8 03             	cmp    $0x3,%eax
    4c72:	75 07                	jne    4c7b <hdr_to_frps+0x2c>
    4c74:	ba 01 00 00 00       	mov    $0x1,%edx
    4c79:	eb 05                	jmp    4c80 <hdr_to_frps+0x31>
    4c7b:	ba 02 00 00 00       	mov    $0x2,%edx
    4c80:	8b 45 08             	mov    0x8(%ebp),%eax
    4c83:	89 50 08             	mov    %edx,0x8(%eax)
	fr_ps->sblimit = SBLIMIT;
    4c86:	8b 45 08             	mov    0x8(%ebp),%eax
    4c89:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    4c90:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4c93:	8b 40 1c             	mov    0x1c(%eax),%eax
    4c96:	83 f8 01             	cmp    $0x1,%eax
    4c99:	75 23                	jne    4cbe <hdr_to_frps+0x6f>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    4c9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4c9e:	8b 50 20             	mov    0x20(%eax),%edx
    4ca1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4ca4:	8b 40 04             	mov    0x4(%eax),%eax
    4ca7:	83 ec 08             	sub    $0x8,%esp
    4caa:	52                   	push   %edx
    4cab:	50                   	push   %eax
    4cac:	e8 4b ff ff ff       	call   4bfc <js_bound>
    4cb1:	83 c4 10             	add    $0x10,%esp
    4cb4:	89 c2                	mov    %eax,%edx
    4cb6:	8b 45 08             	mov    0x8(%ebp),%eax
    4cb9:	89 50 0c             	mov    %edx,0xc(%eax)
    4cbc:	eb 0c                	jmp    4cca <hdr_to_frps+0x7b>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    4cbe:	8b 45 08             	mov    0x8(%ebp),%eax
    4cc1:	8b 50 10             	mov    0x10(%eax),%edx
    4cc4:	8b 45 08             	mov    0x8(%ebp),%eax
    4cc7:	89 50 0c             	mov    %edx,0xc(%eax)
}
    4cca:	c9                   	leave  
    4ccb:	c3                   	ret    

00004ccc <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    4ccc:	55                   	push   %ebp
    4ccd:	89 e5                	mov    %esp,%ebp
    4ccf:	83 ec 08             	sub    $0x8,%esp
	if (N != 8) {
    4cd2:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    4cd6:	74 17                	je     4cef <hputbuf+0x23>
		printf(0,"Not Supported yet!!\n");
    4cd8:	83 ec 08             	sub    $0x8,%esp
    4cdb:	68 db a9 00 00       	push   $0xa9db
    4ce0:	6a 00                	push   $0x0
    4ce2:	e8 9d ee ff ff       	call   3b84 <printf>
    4ce7:	83 c4 10             	add    $0x10,%esp
		exit();
    4cea:	e8 b8 ec ff ff       	call   39a7 <exit>
	}
	getCoreBuf(1, val);
    4cef:	83 ec 08             	sub    $0x8,%esp
    4cf2:	ff 75 08             	pushl  0x8(%ebp)
    4cf5:	6a 01                	push   $0x1
    4cf7:	e8 ab ed ff ff       	call   3aa7 <getCoreBuf>
    4cfc:	83 c4 10             	add    $0x10,%esp
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    4cff:	c9                   	leave  
    4d00:	c3                   	ret    

00004d01 <hsstell>:

unsigned long hsstell()
{
    4d01:	55                   	push   %ebp
    4d02:	89 e5                	mov    %esp,%ebp
    4d04:	83 ec 08             	sub    $0x8,%esp
	return getCoreBuf(2, 0);
    4d07:	83 ec 08             	sub    $0x8,%esp
    4d0a:	6a 00                	push   $0x0
    4d0c:	6a 02                	push   $0x2
    4d0e:	e8 94 ed ff ff       	call   3aa7 <getCoreBuf>
    4d13:	83 c4 10             	add    $0x10,%esp
//	return(totbit);
}
    4d16:	c9                   	leave  
    4d17:	c3                   	ret    

00004d18 <hgetbits>:

unsigned long hgetbits(int N)
{
    4d18:	55                   	push   %ebp
    4d19:	89 e5                	mov    %esp,%ebp
    4d1b:	83 ec 08             	sub    $0x8,%esp

	return getCoreBuf(3, N);
    4d1e:	83 ec 08             	sub    $0x8,%esp
    4d21:	ff 75 08             	pushl  0x8(%ebp)
    4d24:	6a 03                	push   $0x3
    4d26:	e8 7c ed ff ff       	call   3aa7 <getCoreBuf>
    4d2b:	83 c4 10             	add    $0x10,%esp
}
    4d2e:	c9                   	leave  
    4d2f:	c3                   	ret    

00004d30 <hget1bit>:


unsigned int hget1bit()
{
    4d30:	55                   	push   %ebp
    4d31:	89 e5                	mov    %esp,%ebp
    4d33:	83 ec 08             	sub    $0x8,%esp
	return(hgetbits(1));
    4d36:	83 ec 0c             	sub    $0xc,%esp
    4d39:	6a 01                	push   $0x1
    4d3b:	e8 d8 ff ff ff       	call   4d18 <hgetbits>
    4d40:	83 c4 10             	add    $0x10,%esp
}
    4d43:	c9                   	leave  
    4d44:	c3                   	ret    

00004d45 <rewindNbits>:


void rewindNbits(int N)
{
    4d45:	55                   	push   %ebp
    4d46:	89 e5                	mov    %esp,%ebp
    4d48:	83 ec 08             	sub    $0x8,%esp
	getCoreBuf(4, N);
    4d4b:	83 ec 08             	sub    $0x8,%esp
    4d4e:	ff 75 08             	pushl  0x8(%ebp)
    4d51:	6a 04                	push   $0x4
    4d53:	e8 4f ed ff ff       	call   3aa7 <getCoreBuf>
    4d58:	83 c4 10             	add    $0x10,%esp
}
    4d5b:	c9                   	leave  
    4d5c:	c3                   	ret    

00004d5d <rewindNbytes>:


void rewindNbytes(int N)
{
    4d5d:	55                   	push   %ebp
    4d5e:	89 e5                	mov    %esp,%ebp
    4d60:	83 ec 08             	sub    $0x8,%esp
	getCoreBuf(5, N);
    4d63:	83 ec 08             	sub    $0x8,%esp
    4d66:	ff 75 08             	pushl  0x8(%ebp)
    4d69:	6a 05                	push   $0x5
    4d6b:	e8 37 ed ff ff       	call   3aa7 <getCoreBuf>
    4d70:	83 c4 10             	add    $0x10,%esp
}
    4d73:	c9                   	leave  
    4d74:	c3                   	ret    

00004d75 <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    4d75:	55                   	push   %ebp
    4d76:	89 e5                	mov    %esp,%ebp
    4d78:	57                   	push   %edi
    4d79:	56                   	push   %esi
    4d7a:	53                   	push   %ebx
    4d7b:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    4d81:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    4d85:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    4d89:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    4d8d:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    4d91:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    4d95:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    4d99:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    4d9d:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    4da1:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    4da5:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    4da9:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    4dad:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    4db1:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    4db5:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    4db9:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    4dbd:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    4dc1:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    4dc5:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    4dc9:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    4dcd:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    4dd1:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    4dd5:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    4dd9:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    4ddd:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    4de1:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    4de5:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    4de9:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    4ded:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    4df1:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    4df5:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    4df9:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    4dfd:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    4e01:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    4e05:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    4e09:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    4e0d:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    4e11:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    4e15:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    4e19:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    4e1d:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    4e21:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    4e25:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    4e29:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    4e2d:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    4e31:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    4e35:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    4e39:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    4e3d:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    4e41:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    4e45:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    4e49:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    4e4d:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    4e51:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    4e55:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    4e59:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    4e5d:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    4e61:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    4e65:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    4e69:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    4e6d:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    4e71:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    4e75:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    4e79:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    4e7d:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    4e81:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    4e85:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    4e89:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    4e8d:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    4e91:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    4e95:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    4e99:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    4e9d:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    4ea1:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    4ea5:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    4ea9:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    4ead:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    4eb1:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    4eb5:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    4eb9:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    4ebd:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    4ec1:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    4ec5:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    4ec9:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    4ed0:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    4ed7:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    4ede:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    4ee5:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    4eec:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    4ef3:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    4efa:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    4f01:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    4f08:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    4f0f:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    4f16:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    4f1d:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    4f24:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    4f2b:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    4f32:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    4f39:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    4f40:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    4f47:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    4f4e:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    4f55:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    4f5c:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    4f63:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    4f6a:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    4f71:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    4f78:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    4f7f:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    4f86:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    4f8d:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    4f91:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    4f95:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    4f99:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    4f9d:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    4fa1:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    4fa5:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    4fa9:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    4fad:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    4fb1:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    4fb5:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    4fb9:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    4fbd:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    4fc1:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    4fc5:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    4fc9:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    4fcd:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    4fd1:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    4fd5:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    4fd9:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    4fdd:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    4fe1:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    4fe5:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    4fe9:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    4fed:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    4ff1:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    4ff5:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    4ff9:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    4ffd:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    5001:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    5005:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    5009:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    500d:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    5011:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    5015:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    501c:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    5023:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    502a:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    5031:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    5038:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    503f:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    5046:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    504d:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    5054:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    505b:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    5062:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    5069:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    5070:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    5077:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    507e:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    5085:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    508c:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    5093:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    509a:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    50a1:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    50a8:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    50af:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    50b6:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    50bd:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    50c4:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    50cb:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    50d2:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    50d9:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    50e0:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    50e7:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    50ee:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    50f5:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    50fc:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    5103:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    510a:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    5111:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    5118:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    511f:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    5126:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    512d:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    5134:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    513b:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    5142:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    5149:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    5150:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    5157:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    515e:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    5165:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    516c:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    5173:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    517a:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    5181:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    5188:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    518f:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    5196:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    519d:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    51a4:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    51ab:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    51b2:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    51b9:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    51c0:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    51c7:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    51cd:	ba 00 aa 00 00       	mov    $0xaa00,%edx
    51d2:	b9 23 00 00 00       	mov    $0x23,%ecx
    51d7:	89 c7                	mov    %eax,%edi
    51d9:	89 d6                	mov    %edx,%esi
    51db:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    51dd:	89 f2                	mov    %esi,%edx
    51df:	89 f8                	mov    %edi,%eax
    51e1:	0f b7 0a             	movzwl (%edx),%ecx
    51e4:	66 89 08             	mov    %cx,(%eax)
    51e7:	8d 40 02             	lea    0x2(%eax),%eax
    51ea:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    51ed:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    51f3:	bb c0 aa 00 00       	mov    $0xaac0,%ebx
    51f8:	ba 8e 00 00 00       	mov    $0x8e,%edx
    51fd:	8b 0b                	mov    (%ebx),%ecx
    51ff:	89 08                	mov    %ecx,(%eax)
    5201:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    5205:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    5209:	8d 78 04             	lea    0x4(%eax),%edi
    520c:	83 e7 fc             	and    $0xfffffffc,%edi
    520f:	29 f8                	sub    %edi,%eax
    5211:	29 c3                	sub    %eax,%ebx
    5213:	01 c2                	add    %eax,%edx
    5215:	83 e2 fc             	and    $0xfffffffc,%edx
    5218:	89 d0                	mov    %edx,%eax
    521a:	c1 e8 02             	shr    $0x2,%eax
    521d:	89 de                	mov    %ebx,%esi
    521f:	89 c1                	mov    %eax,%ecx
    5221:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    5223:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    5229:	ba 80 ab 00 00       	mov    $0xab80,%edx
    522e:	b9 23 00 00 00       	mov    $0x23,%ecx
    5233:	89 c7                	mov    %eax,%edi
    5235:	89 d6                	mov    %edx,%esi
    5237:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5239:	89 f2                	mov    %esi,%edx
    523b:	89 f8                	mov    %edi,%eax
    523d:	0f b7 0a             	movzwl (%edx),%ecx
    5240:	66 89 08             	mov    %cx,(%eax)
    5243:	8d 40 02             	lea    0x2(%eax),%eax
    5246:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    5249:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    524f:	bb 40 ac 00 00       	mov    $0xac40,%ebx
    5254:	ba fe 00 00 00       	mov    $0xfe,%edx
    5259:	8b 0b                	mov    (%ebx),%ecx
    525b:	89 08                	mov    %ecx,(%eax)
    525d:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    5261:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    5265:	8d 78 04             	lea    0x4(%eax),%edi
    5268:	83 e7 fc             	and    $0xfffffffc,%edi
    526b:	29 f8                	sub    %edi,%eax
    526d:	29 c3                	sub    %eax,%ebx
    526f:	01 c2                	add    %eax,%edx
    5271:	83 e2 fc             	and    $0xfffffffc,%edx
    5274:	89 d0                	mov    %edx,%eax
    5276:	c1 e8 02             	shr    $0x2,%eax
    5279:	89 de                	mov    %ebx,%esi
    527b:	89 c1                	mov    %eax,%ecx
    527d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    527f:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    5285:	ba 40 ad 00 00       	mov    $0xad40,%edx
    528a:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    528f:	89 c7                	mov    %eax,%edi
    5291:	89 d6                	mov    %edx,%esi
    5293:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5295:	89 f2                	mov    %esi,%edx
    5297:	89 f8                	mov    %edi,%eax
    5299:	0f b7 0a             	movzwl (%edx),%ecx
    529c:	66 89 08             	mov    %cx,(%eax)
    529f:	8d 40 02             	lea    0x2(%eax),%eax
    52a2:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    52a5:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    52ab:	bb 40 ae 00 00       	mov    $0xae40,%ebx
    52b0:	ba fe 00 00 00       	mov    $0xfe,%edx
    52b5:	8b 0b                	mov    (%ebx),%ecx
    52b7:	89 08                	mov    %ecx,(%eax)
    52b9:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    52bd:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    52c1:	8d 78 04             	lea    0x4(%eax),%edi
    52c4:	83 e7 fc             	and    $0xfffffffc,%edi
    52c7:	29 f8                	sub    %edi,%eax
    52c9:	29 c3                	sub    %eax,%ebx
    52cb:	01 c2                	add    %eax,%edx
    52cd:	83 e2 fc             	and    $0xfffffffc,%edx
    52d0:	89 d0                	mov    %edx,%eax
    52d2:	c1 e8 02             	shr    $0x2,%eax
    52d5:	89 de                	mov    %ebx,%esi
    52d7:	89 c1                	mov    %eax,%ecx
    52d9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    52db:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    52e1:	ba 40 af 00 00       	mov    $0xaf40,%edx
    52e6:	b9 ff 00 00 00       	mov    $0xff,%ecx
    52eb:	89 c7                	mov    %eax,%edi
    52ed:	89 d6                	mov    %edx,%esi
    52ef:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    52f1:	89 f2                	mov    %esi,%edx
    52f3:	89 f8                	mov    %edi,%eax
    52f5:	0f b7 0a             	movzwl (%edx),%ecx
    52f8:	66 89 08             	mov    %cx,(%eax)
    52fb:	8d 40 02             	lea    0x2(%eax),%eax
    52fe:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    5301:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    5307:	bb 40 b3 00 00       	mov    $0xb340,%ebx
    530c:	ba fe 03 00 00       	mov    $0x3fe,%edx
    5311:	8b 0b                	mov    (%ebx),%ecx
    5313:	89 08                	mov    %ecx,(%eax)
    5315:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
    5319:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
    531d:	8d 78 04             	lea    0x4(%eax),%edi
    5320:	83 e7 fc             	and    $0xfffffffc,%edi
    5323:	29 f8                	sub    %edi,%eax
    5325:	29 c3                	sub    %eax,%ebx
    5327:	01 c2                	add    %eax,%edx
    5329:	83 e2 fc             	and    $0xfffffffc,%edx
    532c:	89 d0                	mov    %edx,%eax
    532e:	c1 e8 02             	shr    $0x2,%eax
    5331:	89 de                	mov    %ebx,%esi
    5333:	89 c1                	mov    %eax,%ecx
    5335:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    5337:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    533d:	ba 40 b7 00 00       	mov    $0xb740,%edx
    5342:	b9 ff 00 00 00       	mov    $0xff,%ecx
    5347:	89 c7                	mov    %eax,%edi
    5349:	89 d6                	mov    %edx,%esi
    534b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    534d:	89 f2                	mov    %esi,%edx
    534f:	89 f8                	mov    %edi,%eax
    5351:	0f b7 0a             	movzwl (%edx),%ecx
    5354:	66 89 08             	mov    %cx,(%eax)
    5357:	8d 40 02             	lea    0x2(%eax),%eax
    535a:	8d 52 02             	lea    0x2(%edx),%edx

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    535d:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    5363:	bb 40 bb 00 00       	mov    $0xbb40,%ebx
    5368:	ba 00 01 00 00       	mov    $0x100,%edx
    536d:	89 c7                	mov    %eax,%edi
    536f:	89 de                	mov    %ebx,%esi
    5371:	89 d1                	mov    %edx,%ecx
    5373:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    5375:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    537c:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    5383:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    538a:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    5391:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    5398:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    539f:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    53a6:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    53ad:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    53b4:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    53bb:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    53c2:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    53c9:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    53d0:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    53d7:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    53de:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    53e5:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    53ec:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    53f3:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    53fa:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    5401:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    5408:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    540f:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    5416:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    541d:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    5424:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    542b:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    5432:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    5439:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    5440:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    5447:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    544e:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    5455:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    545c:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    5463:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    546a:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    5471:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    5478:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    547f:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    5486:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    548d:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    5494:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    549b:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    54a2:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    54a9:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    54b0:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    54b7:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    54be:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    54c5:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    54cc:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    54d3:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    54da:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    54e1:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    54e8:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    54ef:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    54f6:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    54fd:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    5504:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    550b:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    5512:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    5519:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    5520:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    5527:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    552e:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    5535:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    553c:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    5543:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    554a:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    5551:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    5558:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    555f:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    5566:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    556d:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    5574:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    557b:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    5582:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    5589:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    5590:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    5597:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    559e:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    55a5:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    55ac:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    55b3:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    55ba:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    55c1:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    55c8:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    55cf:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    55d6:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    55dd:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    55e4:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    55eb:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    55f2:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    55f9:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    5600:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    5607:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    560e:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    5615:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    561c:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    5623:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    562a:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    5631:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    5638:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    563f:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    5646:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    564d:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    5654:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    565b:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    5662:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    5669:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    5670:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    5677:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    567e:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    5685:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    568c:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    5693:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    569a:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    56a1:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    56a8:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    56af:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    56b6:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    56bd:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    56c4:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    56cb:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    56d2:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    56d9:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    56e0:	30 00 
    56e2:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    56e9:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    56f0:	00 00 00 
    56f3:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    56fa:	00 00 00 
    56fd:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    5704:	00 00 00 
    5707:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    570e:	00 00 00 
    5711:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    5718:	ff ff ff 
    571b:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    5722:	00 00 00 
    5725:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    572c:	00 00 00 
    572f:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    5736:	00 00 00 
    5739:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    5740:	00 00 00 
    5743:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    574a:	31 00 
    574c:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    5753:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    575a:	00 00 00 
    575d:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    5764:	00 00 00 
    5767:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    576e:	00 00 00 
    5771:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    5778:	00 00 00 
    577b:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    5782:	ff ff ff 
    5785:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    578c:	00 00 00 
    578f:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    5796:	00 00 00 
    5799:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    579c:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    57a2:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    57a9:	00 00 00 
    57ac:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    57b3:	32 00 
    57b5:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    57bc:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    57c3:	00 00 00 
    57c6:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    57cd:	00 00 00 
    57d0:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    57d7:	00 00 00 
    57da:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    57e1:	00 00 00 
    57e4:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    57eb:	ff ff ff 
    57ee:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    57f5:	00 00 00 
    57f8:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    57ff:	00 00 00 
    5802:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    5805:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    580b:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    5812:	00 00 00 
    5815:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    581c:	33 00 
    581e:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    5825:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    582c:	00 00 00 
    582f:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    5836:	00 00 00 
    5839:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    5840:	00 00 00 
    5843:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    584a:	00 00 00 
    584d:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    5854:	ff ff ff 
    5857:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    585e:	00 00 00 
    5861:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    5868:	00 00 00 
    586b:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    586e:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    5874:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    587b:	00 00 00 
    587e:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    5885:	34 00 
    5887:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    588e:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    5895:	00 00 00 
    5898:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    589f:	00 00 00 
    58a2:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    58a9:	00 00 00 
    58ac:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    58b3:	00 00 00 
    58b6:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    58bd:	ff ff ff 
    58c0:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    58c7:	00 00 00 
    58ca:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    58d1:	00 00 00 
    58d4:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    58db:	00 00 00 
    58de:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    58e5:	00 00 00 
    58e8:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    58ef:	35 00 
    58f1:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    58f8:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    58ff:	00 00 00 
    5902:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    5909:	00 00 00 
    590c:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    5913:	00 00 00 
    5916:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    591d:	00 00 00 
    5920:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    5927:	ff ff ff 
    592a:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    5931:	00 00 00 
    5934:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    593b:	00 00 00 
    593e:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    5944:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    594a:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    5951:	00 00 00 
    5954:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    595b:	36 00 
    595d:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    5964:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    596b:	00 00 00 
    596e:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    5975:	00 00 00 
    5978:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    597f:	00 00 00 
    5982:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    5989:	00 00 00 
    598c:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    5993:	ff ff ff 
    5996:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    599d:	00 00 00 
    59a0:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    59a7:	00 00 00 
    59aa:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    59b0:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    59b6:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    59bd:	00 00 00 
    59c0:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    59c7:	37 00 
    59c9:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    59d0:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    59d7:	00 00 00 
    59da:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    59e1:	00 00 00 
    59e4:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    59eb:	00 00 00 
    59ee:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    59f5:	00 00 00 
    59f8:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    59ff:	ff ff ff 
    5a02:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    5a09:	00 00 00 
    5a0c:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    5a13:	00 00 00 
    5a16:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    5a1c:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    5a22:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    5a29:	00 00 00 
    5a2c:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    5a33:	38 00 
    5a35:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    5a3c:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    5a43:	00 00 00 
    5a46:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    5a4d:	00 00 00 
    5a50:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    5a57:	00 00 00 
    5a5a:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    5a61:	00 00 00 
    5a64:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    5a6b:	ff ff ff 
    5a6e:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    5a75:	00 00 00 
    5a78:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    5a7f:	00 00 00 
    5a82:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    5a88:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    5a8e:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    5a95:	00 00 00 
    5a98:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    5a9f:	39 00 
    5aa1:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    5aa8:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    5aaf:	00 00 00 
    5ab2:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    5ab9:	00 00 00 
    5abc:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    5ac3:	00 00 00 
    5ac6:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    5acd:	00 00 00 
    5ad0:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    5ad7:	ff ff ff 
    5ada:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    5ae1:	00 00 00 
    5ae4:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    5aeb:	00 00 00 
    5aee:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    5af4:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    5afa:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    5b01:	00 00 00 
    5b04:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    5b0b:	31 30 
    5b0d:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    5b14:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    5b1b:	00 00 00 
    5b1e:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    5b25:	00 00 00 
    5b28:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    5b2f:	00 00 00 
    5b32:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    5b39:	00 00 00 
    5b3c:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    5b43:	ff ff ff 
    5b46:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    5b4d:	00 00 00 
    5b50:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    5b57:	00 00 00 
    5b5a:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    5b60:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    5b66:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    5b6d:	00 00 00 
    5b70:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    5b77:	31 31 
    5b79:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    5b80:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    5b87:	00 00 00 
    5b8a:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    5b91:	00 00 00 
    5b94:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    5b9b:	00 00 00 
    5b9e:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    5ba5:	00 00 00 
    5ba8:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    5baf:	ff ff ff 
    5bb2:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    5bb9:	00 00 00 
    5bbc:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    5bc3:	00 00 00 
    5bc6:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    5bcc:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    5bd2:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    5bd9:	00 00 00 
    5bdc:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    5be3:	31 32 
    5be5:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    5bec:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    5bf3:	00 00 00 
    5bf6:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    5bfd:	00 00 00 
    5c00:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    5c07:	00 00 00 
    5c0a:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    5c11:	00 00 00 
    5c14:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    5c1b:	ff ff ff 
    5c1e:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    5c25:	00 00 00 
    5c28:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    5c2f:	00 00 00 
    5c32:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    5c38:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    5c3e:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    5c45:	00 00 00 
    5c48:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    5c4f:	31 33 
    5c51:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    5c58:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    5c5f:	00 00 00 
    5c62:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    5c69:	00 00 00 
    5c6c:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    5c73:	00 00 00 
    5c76:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    5c7d:	00 00 00 
    5c80:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    5c87:	ff ff ff 
    5c8a:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    5c91:	00 00 00 
    5c94:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    5c9b:	00 00 00 
    5c9e:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    5ca4:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    5caa:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    5cb1:	01 00 00 
    5cb4:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    5cbb:	31 34 
    5cbd:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    5cc4:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    5ccb:	00 00 00 
    5cce:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    5cd5:	00 00 00 
    5cd8:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    5cdf:	00 00 00 
    5ce2:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    5ce9:	00 00 00 
    5cec:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    5cf3:	ff ff ff 
    5cf6:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    5cfd:	00 00 00 
    5d00:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    5d07:	00 00 00 
    5d0a:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    5d11:	00 00 00 
    5d14:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    5d1b:	00 00 00 
    5d1e:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    5d25:	31 35 
    5d27:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    5d2e:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    5d35:	00 00 00 
    5d38:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    5d3f:	00 00 00 
    5d42:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    5d49:	00 00 00 
    5d4c:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    5d53:	00 00 00 
    5d56:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    5d5d:	ff ff ff 
    5d60:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    5d67:	00 00 00 
    5d6a:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    5d71:	00 00 00 
    5d74:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    5d7a:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    5d80:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    5d87:	01 00 00 
    5d8a:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    5d91:	31 36 
    5d93:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    5d9a:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    5da1:	00 00 00 
    5da4:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    5dab:	00 00 00 
    5dae:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    5db5:	00 00 00 
    5db8:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    5dbf:	00 00 00 
    5dc2:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    5dc9:	ff ff ff 
    5dcc:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    5dd3:	00 00 00 
    5dd6:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    5ddd:	00 00 00 
    5de0:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    5de6:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    5dec:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    5df3:	01 00 00 
    5df6:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    5dfd:	31 37 
    5dff:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    5e06:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    5e0d:	00 00 00 
    5e10:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    5e17:	00 00 00 
    5e1a:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    5e21:	00 00 00 
    5e24:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    5e2b:	00 00 00 
    5e2e:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    5e35:	00 00 00 
    5e38:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    5e3f:	00 00 00 
    5e42:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    5e49:	00 00 00 
    5e4c:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    5e52:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    5e58:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    5e5f:	01 00 00 
    5e62:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    5e69:	31 38 
    5e6b:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    5e72:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    5e79:	00 00 00 
    5e7c:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    5e83:	00 00 00 
    5e86:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    5e8d:	00 00 00 
    5e90:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    5e97:	00 00 00 
    5e9a:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    5ea1:	00 00 00 
    5ea4:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    5eab:	00 00 00 
    5eae:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    5eb5:	00 00 00 
    5eb8:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    5ebe:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    5ec4:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    5ecb:	01 00 00 
    5ece:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    5ed5:	31 39 
    5ed7:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    5ede:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    5ee5:	00 00 00 
    5ee8:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    5eef:	00 00 00 
    5ef2:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    5ef9:	00 00 00 
    5efc:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    5f03:	00 00 00 
    5f06:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    5f0d:	00 00 00 
    5f10:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    5f17:	00 00 00 
    5f1a:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    5f21:	00 00 00 
    5f24:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    5f2a:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    5f30:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    5f37:	01 00 00 
    5f3a:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    5f41:	32 30 
    5f43:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    5f4a:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    5f51:	00 00 00 
    5f54:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    5f5b:	00 00 00 
    5f5e:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    5f65:	00 00 00 
    5f68:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    5f6f:	00 00 00 
    5f72:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    5f79:	00 00 00 
    5f7c:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    5f83:	00 00 00 
    5f86:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    5f8d:	00 00 00 
    5f90:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    5f96:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    5f9c:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    5fa3:	01 00 00 
    5fa6:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    5fad:	32 31 
    5faf:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    5fb6:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    5fbd:	00 00 00 
    5fc0:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    5fc7:	00 00 00 
    5fca:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    5fd1:	00 00 00 
    5fd4:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    5fdb:	00 00 00 
    5fde:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    5fe5:	00 00 00 
    5fe8:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    5fef:	00 00 00 
    5ff2:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    5ff9:	00 00 00 
    5ffc:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6002:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    6008:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    600f:	01 00 00 
    6012:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    6019:	32 32 
    601b:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    6022:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    6029:	00 00 00 
    602c:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    6033:	00 00 00 
    6036:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    603d:	00 00 00 
    6040:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    6047:	03 00 00 
    604a:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    6051:	00 00 00 
    6054:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    605b:	00 00 00 
    605e:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    6065:	00 00 00 
    6068:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    606e:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    6074:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    607b:	01 00 00 
    607e:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    6085:	32 33 
    6087:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    608e:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    6095:	00 00 00 
    6098:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    609f:	00 00 00 
    60a2:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    60a9:	00 00 00 
    60ac:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    60b3:	1f 00 00 
    60b6:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    60bd:	00 00 00 
    60c0:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    60c7:	00 00 00 
    60ca:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    60d1:	00 00 00 
    60d4:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    60da:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    60e0:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    60e7:	01 00 00 
    60ea:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    60f1:	32 34 
    60f3:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    60fa:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    6101:	00 00 00 
    6104:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    610b:	00 00 00 
    610e:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    6115:	00 00 00 
    6118:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    611f:	00 00 00 
    6122:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    6129:	ff ff ff 
    612c:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    6133:	00 00 00 
    6136:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    613d:	00 00 00 
    6140:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6146:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    614c:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    6153:	02 00 00 
    6156:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    615d:	32 35 
    615f:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    6166:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    616d:	00 00 00 
    6170:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    6177:	00 00 00 
    617a:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    6181:	00 00 00 
    6184:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    618b:	00 00 00 
    618e:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    6195:	00 00 00 
    6198:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    619f:	00 00 00 
    61a2:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    61a9:	00 00 00 
    61ac:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    61b2:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    61b8:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    61bf:	02 00 00 
    61c2:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    61c9:	32 36 
    61cb:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    61d2:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    61d9:	00 00 00 
    61dc:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    61e3:	00 00 00 
    61e6:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    61ed:	00 00 00 
    61f0:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    61f7:	00 00 00 
    61fa:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    6201:	00 00 00 
    6204:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    620b:	00 00 00 
    620e:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    6215:	00 00 00 
    6218:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    621e:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    6224:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    622b:	02 00 00 
    622e:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    6235:	32 37 
    6237:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    623e:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    6245:	00 00 00 
    6248:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    624f:	00 00 00 
    6252:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    6259:	00 00 00 
    625c:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    6263:	00 00 00 
    6266:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    626d:	00 00 00 
    6270:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    6277:	00 00 00 
    627a:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    6281:	00 00 00 
    6284:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    628a:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    6290:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    6297:	02 00 00 
    629a:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    62a1:	32 38 
    62a3:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    62aa:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    62b1:	00 00 00 
    62b4:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    62bb:	00 00 00 
    62be:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    62c5:	00 00 00 
    62c8:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    62cf:	00 00 00 
    62d2:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    62d9:	00 00 00 
    62dc:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    62e3:	00 00 00 
    62e6:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    62ed:	00 00 00 
    62f0:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    62f6:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    62fc:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    6303:	02 00 00 
    6306:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    630d:	32 39 
    630f:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    6316:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    631d:	00 00 00 
    6320:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    6327:	00 00 00 
    632a:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    6331:	00 00 00 
    6334:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    633b:	01 00 00 
    633e:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    6345:	00 00 00 
    6348:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    634f:	00 00 00 
    6352:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    6359:	00 00 00 
    635c:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6362:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    6368:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    636f:	02 00 00 
    6372:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    6379:	33 30 
    637b:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    6382:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    6389:	00 00 00 
    638c:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    6393:	00 00 00 
    6396:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    639d:	00 00 00 
    63a0:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    63a7:	07 00 00 
    63aa:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    63b1:	00 00 00 
    63b4:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    63bb:	00 00 00 
    63be:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    63c5:	00 00 00 
    63c8:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    63ce:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    63d4:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    63db:	02 00 00 
    63de:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    63e5:	33 31 
    63e7:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    63ee:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    63f5:	00 00 00 
    63f8:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    63ff:	00 00 00 
    6402:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    6409:	00 00 00 
    640c:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    6413:	1f 00 00 
    6416:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    641d:	00 00 00 
    6420:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    6427:	00 00 00 
    642a:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    6431:	00 00 00 
    6434:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    643a:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    6440:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    6447:	02 00 00 
    644a:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    6451:	33 32 
    6453:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    645a:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    6461:	00 00 00 
    6464:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    646b:	00 00 00 
    646e:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    6475:	00 00 00 
    6478:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    647f:	00 00 00 
    6482:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    6489:	ff ff ff 
    648c:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    6493:	00 00 00 
    6496:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    649d:	00 00 00 
    64a0:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    64a6:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    64ac:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    64b3:	00 00 00 
    64b6:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    64bd:	33 33 
    64bf:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    64c6:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    64cd:	00 00 00 
    64d0:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    64d7:	00 00 00 
    64da:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    64e1:	00 00 00 
    64e4:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    64eb:	00 00 00 
    64ee:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    64f5:	ff ff ff 
    64f8:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    64ff:	00 00 00 
    6502:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    6509:	00 00 00 
    650c:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    6512:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    6518:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    651f:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    6522:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    6528:	5b                   	pop    %ebx
    6529:	5e                   	pop    %esi
    652a:	5f                   	pop    %edi
    652b:	5d                   	pop    %ebp
    652c:	c3                   	ret    

0000652d <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    652d:	55                   	push   %ebp
    652e:	89 e5                	mov    %esp,%ebp
    6530:	83 ec 18             	sub    $0x18,%esp
  HUFFBITS level;
  int point = 0;
    6533:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    653a:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    6541:	a1 10 e8 00 00       	mov    0xe810,%eax
    6546:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    6549:	8b 45 08             	mov    0x8(%ebp),%eax
    654c:	8b 40 20             	mov    0x20(%eax),%eax
    654f:	85 c0                	test   %eax,%eax
    6551:	75 0a                	jne    655d <huffman_decoder+0x30>
    6553:	b8 02 00 00 00       	mov    $0x2,%eax
    6558:	e9 15 03 00 00       	jmp    6872 <huffman_decoder+0x345>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    655d:	8b 45 08             	mov    0x8(%ebp),%eax
    6560:	8b 40 24             	mov    0x24(%eax),%eax
    6563:	85 c0                	test   %eax,%eax
    6565:	75 1d                	jne    6584 <huffman_decoder+0x57>
  {  *x = *y = 0;
    6567:	8b 45 10             	mov    0x10(%ebp),%eax
    656a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    6570:	8b 45 10             	mov    0x10(%ebp),%eax
    6573:	8b 10                	mov    (%eax),%edx
    6575:	8b 45 0c             	mov    0xc(%ebp),%eax
    6578:	89 10                	mov    %edx,(%eax)
     return 0;
    657a:	b8 00 00 00 00       	mov    $0x0,%eax
    657f:	e9 ee 02 00 00       	jmp    6872 <huffman_decoder+0x345>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    6584:	8b 45 08             	mov    0x8(%ebp),%eax
    6587:	8b 40 20             	mov    0x20(%eax),%eax
    658a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    658d:	01 d2                	add    %edx,%edx
    658f:	01 d0                	add    %edx,%eax
    6591:	0f b6 00             	movzbl (%eax),%eax
    6594:	84 c0                	test   %al,%al
    6596:	75 46                	jne    65de <huffman_decoder+0xb1>
      *x = h->val[point][1] >> 4;
    6598:	8b 45 08             	mov    0x8(%ebp),%eax
    659b:	8b 40 20             	mov    0x20(%eax),%eax
    659e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    65a1:	01 d2                	add    %edx,%edx
    65a3:	01 d0                	add    %edx,%eax
    65a5:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    65a9:	c0 e8 04             	shr    $0x4,%al
    65ac:	0f b6 d0             	movzbl %al,%edx
    65af:	8b 45 0c             	mov    0xc(%ebp),%eax
    65b2:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    65b4:	8b 45 08             	mov    0x8(%ebp),%eax
    65b7:	8b 40 20             	mov    0x20(%eax),%eax
    65ba:	8b 55 f0             	mov    -0x10(%ebp),%edx
    65bd:	01 d2                	add    %edx,%edx
    65bf:	01 d0                	add    %edx,%eax
    65c1:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    65c5:	0f b6 c0             	movzbl %al,%eax
    65c8:	83 e0 0f             	and    $0xf,%eax
    65cb:	89 c2                	mov    %eax,%edx
    65cd:	8b 45 10             	mov    0x10(%ebp),%eax
    65d0:	89 10                	mov    %edx,(%eax)

      error = 0;
    65d2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    65d9:	e9 af 00 00 00       	jmp    668d <huffman_decoder+0x160>
    } 
    if (hget1bit()) {
    65de:	e8 4d e7 ff ff       	call   4d30 <hget1bit>
    65e3:	85 c0                	test   %eax,%eax
    65e5:	74 47                	je     662e <huffman_decoder+0x101>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    65e7:	eb 17                	jmp    6600 <huffman_decoder+0xd3>
    65e9:	8b 45 08             	mov    0x8(%ebp),%eax
    65ec:	8b 40 20             	mov    0x20(%eax),%eax
    65ef:	8b 55 f0             	mov    -0x10(%ebp),%edx
    65f2:	01 d2                	add    %edx,%edx
    65f4:	01 d0                	add    %edx,%eax
    65f6:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    65fa:	0f b6 c0             	movzbl %al,%eax
    65fd:	01 45 f0             	add    %eax,-0x10(%ebp)
    6600:	8b 45 08             	mov    0x8(%ebp),%eax
    6603:	8b 40 20             	mov    0x20(%eax),%eax
    6606:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6609:	01 d2                	add    %edx,%edx
    660b:	01 d0                	add    %edx,%eax
    660d:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6611:	3c f9                	cmp    $0xf9,%al
    6613:	77 d4                	ja     65e9 <huffman_decoder+0xbc>
      point += h->val[point][1];
    6615:	8b 45 08             	mov    0x8(%ebp),%eax
    6618:	8b 40 20             	mov    0x20(%eax),%eax
    661b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    661e:	01 d2                	add    %edx,%edx
    6620:	01 d0                	add    %edx,%eax
    6622:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6626:	0f b6 c0             	movzbl %al,%eax
    6629:	01 45 f0             	add    %eax,-0x10(%ebp)
    662c:	eb 42                	jmp    6670 <huffman_decoder+0x143>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    662e:	eb 16                	jmp    6646 <huffman_decoder+0x119>
    6630:	8b 45 08             	mov    0x8(%ebp),%eax
    6633:	8b 40 20             	mov    0x20(%eax),%eax
    6636:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6639:	01 d2                	add    %edx,%edx
    663b:	01 d0                	add    %edx,%eax
    663d:	0f b6 00             	movzbl (%eax),%eax
    6640:	0f b6 c0             	movzbl %al,%eax
    6643:	01 45 f0             	add    %eax,-0x10(%ebp)
    6646:	8b 45 08             	mov    0x8(%ebp),%eax
    6649:	8b 40 20             	mov    0x20(%eax),%eax
    664c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    664f:	01 d2                	add    %edx,%edx
    6651:	01 d0                	add    %edx,%eax
    6653:	0f b6 00             	movzbl (%eax),%eax
    6656:	3c f9                	cmp    $0xf9,%al
    6658:	77 d6                	ja     6630 <huffman_decoder+0x103>
      point += h->val[point][0];
    665a:	8b 45 08             	mov    0x8(%ebp),%eax
    665d:	8b 40 20             	mov    0x20(%eax),%eax
    6660:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6663:	01 d2                	add    %edx,%edx
    6665:	01 d0                	add    %edx,%eax
    6667:	0f b6 00             	movzbl (%eax),%eax
    666a:	0f b6 c0             	movzbl %al,%eax
    666d:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    6670:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    6673:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    6677:	0f 85 07 ff ff ff    	jne    6584 <huffman_decoder+0x57>
    667d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6680:	a1 a4 1c 01 00       	mov    0x11ca4,%eax
    6685:	39 c2                	cmp    %eax,%edx
    6687:	0f 82 f7 fe ff ff    	jb     6584 <huffman_decoder+0x57>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    668d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    6691:	74 24                	je     66b7 <huffman_decoder+0x18a>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    6693:	8b 45 08             	mov    0x8(%ebp),%eax
    6696:	8b 40 04             	mov    0x4(%eax),%eax
    6699:	83 e8 01             	sub    $0x1,%eax
    669c:	01 c0                	add    %eax,%eax
    669e:	89 c2                	mov    %eax,%edx
    66a0:	8b 45 0c             	mov    0xc(%ebp),%eax
    66a3:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    66a5:	8b 45 08             	mov    0x8(%ebp),%eax
    66a8:	8b 40 08             	mov    0x8(%eax),%eax
    66ab:	83 e8 01             	sub    $0x1,%eax
    66ae:	01 c0                	add    %eax,%eax
    66b0:	89 c2                	mov    %eax,%edx
    66b2:	8b 45 10             	mov    0x10(%ebp),%eax
    66b5:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    66b7:	8b 45 08             	mov    0x8(%ebp),%eax
    66ba:	0f b6 00             	movzbl (%eax),%eax
    66bd:	3c 33                	cmp    $0x33,%al
    66bf:	0f 85 ec 00 00 00    	jne    67b1 <huffman_decoder+0x284>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    66c5:	8b 45 08             	mov    0x8(%ebp),%eax
    66c8:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    66cc:	3c 32                	cmp    $0x32,%al
    66ce:	74 0f                	je     66df <huffman_decoder+0x1b2>
    66d0:	8b 45 08             	mov    0x8(%ebp),%eax
    66d3:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    66d7:	3c 33                	cmp    $0x33,%al
    66d9:	0f 85 d2 00 00 00    	jne    67b1 <huffman_decoder+0x284>
     *v = (*y>>3) & 1;
    66df:	8b 45 10             	mov    0x10(%ebp),%eax
    66e2:	8b 00                	mov    (%eax),%eax
    66e4:	c1 f8 03             	sar    $0x3,%eax
    66e7:	83 e0 01             	and    $0x1,%eax
    66ea:	89 c2                	mov    %eax,%edx
    66ec:	8b 45 14             	mov    0x14(%ebp),%eax
    66ef:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    66f1:	8b 45 10             	mov    0x10(%ebp),%eax
    66f4:	8b 00                	mov    (%eax),%eax
    66f6:	c1 f8 02             	sar    $0x2,%eax
    66f9:	83 e0 01             	and    $0x1,%eax
    66fc:	89 c2                	mov    %eax,%edx
    66fe:	8b 45 18             	mov    0x18(%ebp),%eax
    6701:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    6703:	8b 45 10             	mov    0x10(%ebp),%eax
    6706:	8b 00                	mov    (%eax),%eax
    6708:	d1 f8                	sar    %eax
    670a:	83 e0 01             	and    $0x1,%eax
    670d:	89 c2                	mov    %eax,%edx
    670f:	8b 45 0c             	mov    0xc(%ebp),%eax
    6712:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    6714:	8b 45 10             	mov    0x10(%ebp),%eax
    6717:	8b 00                	mov    (%eax),%eax
    6719:	83 e0 01             	and    $0x1,%eax
    671c:	89 c2                	mov    %eax,%edx
    671e:	8b 45 10             	mov    0x10(%ebp),%eax
    6721:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    6723:	8b 45 14             	mov    0x14(%ebp),%eax
    6726:	8b 00                	mov    (%eax),%eax
    6728:	85 c0                	test   %eax,%eax
    672a:	74 18                	je     6744 <huffman_decoder+0x217>
        if (hget1bit() == 1) *v = -*v;
    672c:	e8 ff e5 ff ff       	call   4d30 <hget1bit>
    6731:	83 f8 01             	cmp    $0x1,%eax
    6734:	75 0e                	jne    6744 <huffman_decoder+0x217>
    6736:	8b 45 14             	mov    0x14(%ebp),%eax
    6739:	8b 00                	mov    (%eax),%eax
    673b:	f7 d8                	neg    %eax
    673d:	89 c2                	mov    %eax,%edx
    673f:	8b 45 14             	mov    0x14(%ebp),%eax
    6742:	89 10                	mov    %edx,(%eax)
     if (*w)
    6744:	8b 45 18             	mov    0x18(%ebp),%eax
    6747:	8b 00                	mov    (%eax),%eax
    6749:	85 c0                	test   %eax,%eax
    674b:	74 18                	je     6765 <huffman_decoder+0x238>
        if (hget1bit() == 1) *w = -*w;
    674d:	e8 de e5 ff ff       	call   4d30 <hget1bit>
    6752:	83 f8 01             	cmp    $0x1,%eax
    6755:	75 0e                	jne    6765 <huffman_decoder+0x238>
    6757:	8b 45 18             	mov    0x18(%ebp),%eax
    675a:	8b 00                	mov    (%eax),%eax
    675c:	f7 d8                	neg    %eax
    675e:	89 c2                	mov    %eax,%edx
    6760:	8b 45 18             	mov    0x18(%ebp),%eax
    6763:	89 10                	mov    %edx,(%eax)
     if (*x)
    6765:	8b 45 0c             	mov    0xc(%ebp),%eax
    6768:	8b 00                	mov    (%eax),%eax
    676a:	85 c0                	test   %eax,%eax
    676c:	74 18                	je     6786 <huffman_decoder+0x259>
        if (hget1bit() == 1) *x = -*x;
    676e:	e8 bd e5 ff ff       	call   4d30 <hget1bit>
    6773:	83 f8 01             	cmp    $0x1,%eax
    6776:	75 0e                	jne    6786 <huffman_decoder+0x259>
    6778:	8b 45 0c             	mov    0xc(%ebp),%eax
    677b:	8b 00                	mov    (%eax),%eax
    677d:	f7 d8                	neg    %eax
    677f:	89 c2                	mov    %eax,%edx
    6781:	8b 45 0c             	mov    0xc(%ebp),%eax
    6784:	89 10                	mov    %edx,(%eax)
     if (*y)
    6786:	8b 45 10             	mov    0x10(%ebp),%eax
    6789:	8b 00                	mov    (%eax),%eax
    678b:	85 c0                	test   %eax,%eax
    678d:	74 1d                	je     67ac <huffman_decoder+0x27f>
        if (hget1bit() == 1) *y = -*y;
    678f:	e8 9c e5 ff ff       	call   4d30 <hget1bit>
    6794:	83 f8 01             	cmp    $0x1,%eax
    6797:	75 13                	jne    67ac <huffman_decoder+0x27f>
    6799:	8b 45 10             	mov    0x10(%ebp),%eax
    679c:	8b 00                	mov    (%eax),%eax
    679e:	f7 d8                	neg    %eax
    67a0:	89 c2                	mov    %eax,%edx
    67a2:	8b 45 10             	mov    0x10(%ebp),%eax
    67a5:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    67a7:	e9 c3 00 00 00       	jmp    686f <huffman_decoder+0x342>
    67ac:	e9 be 00 00 00       	jmp    686f <huffman_decoder+0x342>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    67b1:	8b 45 08             	mov    0x8(%ebp),%eax
    67b4:	8b 40 0c             	mov    0xc(%eax),%eax
    67b7:	85 c0                	test   %eax,%eax
    67b9:	74 34                	je     67ef <huffman_decoder+0x2c2>
       if ((h->xlen-1) == *x) 
    67bb:	8b 45 08             	mov    0x8(%ebp),%eax
    67be:	8b 40 04             	mov    0x4(%eax),%eax
    67c1:	8d 50 ff             	lea    -0x1(%eax),%edx
    67c4:	8b 45 0c             	mov    0xc(%ebp),%eax
    67c7:	8b 00                	mov    (%eax),%eax
    67c9:	39 c2                	cmp    %eax,%edx
    67cb:	75 22                	jne    67ef <huffman_decoder+0x2c2>
         *x += hgetbits(h->linbits);
    67cd:	8b 45 08             	mov    0x8(%ebp),%eax
    67d0:	8b 40 0c             	mov    0xc(%eax),%eax
    67d3:	83 ec 0c             	sub    $0xc,%esp
    67d6:	50                   	push   %eax
    67d7:	e8 3c e5 ff ff       	call   4d18 <hgetbits>
    67dc:	83 c4 10             	add    $0x10,%esp
    67df:	89 c2                	mov    %eax,%edx
    67e1:	8b 45 0c             	mov    0xc(%ebp),%eax
    67e4:	8b 00                	mov    (%eax),%eax
    67e6:	01 d0                	add    %edx,%eax
    67e8:	89 c2                	mov    %eax,%edx
    67ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    67ed:	89 10                	mov    %edx,(%eax)
     if (*x)
    67ef:	8b 45 0c             	mov    0xc(%ebp),%eax
    67f2:	8b 00                	mov    (%eax),%eax
    67f4:	85 c0                	test   %eax,%eax
    67f6:	74 18                	je     6810 <huffman_decoder+0x2e3>
        if (hget1bit() == 1) *x = -*x;
    67f8:	e8 33 e5 ff ff       	call   4d30 <hget1bit>
    67fd:	83 f8 01             	cmp    $0x1,%eax
    6800:	75 0e                	jne    6810 <huffman_decoder+0x2e3>
    6802:	8b 45 0c             	mov    0xc(%ebp),%eax
    6805:	8b 00                	mov    (%eax),%eax
    6807:	f7 d8                	neg    %eax
    6809:	89 c2                	mov    %eax,%edx
    680b:	8b 45 0c             	mov    0xc(%ebp),%eax
    680e:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    6810:	8b 45 08             	mov    0x8(%ebp),%eax
    6813:	8b 40 0c             	mov    0xc(%eax),%eax
    6816:	85 c0                	test   %eax,%eax
    6818:	74 34                	je     684e <huffman_decoder+0x321>
       if ((h->ylen-1) == *y)
    681a:	8b 45 08             	mov    0x8(%ebp),%eax
    681d:	8b 40 08             	mov    0x8(%eax),%eax
    6820:	8d 50 ff             	lea    -0x1(%eax),%edx
    6823:	8b 45 10             	mov    0x10(%ebp),%eax
    6826:	8b 00                	mov    (%eax),%eax
    6828:	39 c2                	cmp    %eax,%edx
    682a:	75 22                	jne    684e <huffman_decoder+0x321>
         *y += hgetbits(h->linbits);
    682c:	8b 45 08             	mov    0x8(%ebp),%eax
    682f:	8b 40 0c             	mov    0xc(%eax),%eax
    6832:	83 ec 0c             	sub    $0xc,%esp
    6835:	50                   	push   %eax
    6836:	e8 dd e4 ff ff       	call   4d18 <hgetbits>
    683b:	83 c4 10             	add    $0x10,%esp
    683e:	89 c2                	mov    %eax,%edx
    6840:	8b 45 10             	mov    0x10(%ebp),%eax
    6843:	8b 00                	mov    (%eax),%eax
    6845:	01 d0                	add    %edx,%eax
    6847:	89 c2                	mov    %eax,%edx
    6849:	8b 45 10             	mov    0x10(%ebp),%eax
    684c:	89 10                	mov    %edx,(%eax)
     if (*y)
    684e:	8b 45 10             	mov    0x10(%ebp),%eax
    6851:	8b 00                	mov    (%eax),%eax
    6853:	85 c0                	test   %eax,%eax
    6855:	74 18                	je     686f <huffman_decoder+0x342>
        if (hget1bit() == 1) *y = -*y;
    6857:	e8 d4 e4 ff ff       	call   4d30 <hget1bit>
    685c:	83 f8 01             	cmp    $0x1,%eax
    685f:	75 0e                	jne    686f <huffman_decoder+0x342>
    6861:	8b 45 10             	mov    0x10(%ebp),%eax
    6864:	8b 00                	mov    (%eax),%eax
    6866:	f7 d8                	neg    %eax
    6868:	89 c2                	mov    %eax,%edx
    686a:	8b 45 10             	mov    0x10(%ebp),%eax
    686d:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    686f:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    6872:	c9                   	leave  
    6873:	c3                   	ret    

00006874 <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    6874:	55                   	push   %ebp
    6875:	89 e5                	mov    %esp,%ebp
    6877:	83 ec 18             	sub    $0x18,%esp
    layer *hdr = fr_ps->header;
    687a:	8b 45 0c             	mov    0xc(%ebp),%eax
    687d:	8b 00                	mov    (%eax),%eax
    687f:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    6882:	83 ec 0c             	sub    $0xc,%esp
    6885:	ff 75 08             	pushl  0x8(%ebp)
    6888:	e8 19 e0 ff ff       	call   48a6 <get1bit>
    688d:	83 c4 10             	add    $0x10,%esp
    6890:	89 c2                	mov    %eax,%edx
    6892:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6895:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    6897:	83 ec 08             	sub    $0x8,%esp
    689a:	6a 02                	push   $0x2
    689c:	ff 75 08             	pushl  0x8(%ebp)
    689f:	e8 16 e1 ff ff       	call   49ba <getbits>
    68a4:	83 c4 10             	add    $0x10,%esp
    68a7:	ba 04 00 00 00       	mov    $0x4,%edx
    68ac:	29 c2                	sub    %eax,%edx
    68ae:	89 d0                	mov    %edx,%eax
    68b0:	89 c2                	mov    %eax,%edx
    68b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    68b5:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    68b8:	83 ec 0c             	sub    $0xc,%esp
    68bb:	ff 75 08             	pushl  0x8(%ebp)
    68be:	e8 e3 df ff ff       	call   48a6 <get1bit>
    68c3:	83 c4 10             	add    $0x10,%esp
    68c6:	85 c0                	test   %eax,%eax
    68c8:	0f 94 c0             	sete   %al
    68cb:	0f b6 d0             	movzbl %al,%edx
    68ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    68d1:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    68d4:	83 ec 08             	sub    $0x8,%esp
    68d7:	6a 04                	push   $0x4
    68d9:	ff 75 08             	pushl  0x8(%ebp)
    68dc:	e8 d9 e0 ff ff       	call   49ba <getbits>
    68e1:	83 c4 10             	add    $0x10,%esp
    68e4:	89 c2                	mov    %eax,%edx
    68e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    68e9:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    68ec:	83 ec 08             	sub    $0x8,%esp
    68ef:	6a 02                	push   $0x2
    68f1:	ff 75 08             	pushl  0x8(%ebp)
    68f4:	e8 c1 e0 ff ff       	call   49ba <getbits>
    68f9:	83 c4 10             	add    $0x10,%esp
    68fc:	89 c2                	mov    %eax,%edx
    68fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6901:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    6904:	83 ec 0c             	sub    $0xc,%esp
    6907:	ff 75 08             	pushl  0x8(%ebp)
    690a:	e8 97 df ff ff       	call   48a6 <get1bit>
    690f:	83 c4 10             	add    $0x10,%esp
    6912:	89 c2                	mov    %eax,%edx
    6914:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6917:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    691a:	83 ec 0c             	sub    $0xc,%esp
    691d:	ff 75 08             	pushl  0x8(%ebp)
    6920:	e8 81 df ff ff       	call   48a6 <get1bit>
    6925:	83 c4 10             	add    $0x10,%esp
    6928:	89 c2                	mov    %eax,%edx
    692a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    692d:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    6930:	83 ec 08             	sub    $0x8,%esp
    6933:	6a 02                	push   $0x2
    6935:	ff 75 08             	pushl  0x8(%ebp)
    6938:	e8 7d e0 ff ff       	call   49ba <getbits>
    693d:	83 c4 10             	add    $0x10,%esp
    6940:	89 c2                	mov    %eax,%edx
    6942:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6945:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    6948:	83 ec 08             	sub    $0x8,%esp
    694b:	6a 02                	push   $0x2
    694d:	ff 75 08             	pushl  0x8(%ebp)
    6950:	e8 65 e0 ff ff       	call   49ba <getbits>
    6955:	83 c4 10             	add    $0x10,%esp
    6958:	89 c2                	mov    %eax,%edx
    695a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    695d:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    6960:	83 ec 0c             	sub    $0xc,%esp
    6963:	ff 75 08             	pushl  0x8(%ebp)
    6966:	e8 3b df ff ff       	call   48a6 <get1bit>
    696b:	83 c4 10             	add    $0x10,%esp
    696e:	89 c2                	mov    %eax,%edx
    6970:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6973:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    6976:	83 ec 0c             	sub    $0xc,%esp
    6979:	ff 75 08             	pushl  0x8(%ebp)
    697c:	e8 25 df ff ff       	call   48a6 <get1bit>
    6981:	83 c4 10             	add    $0x10,%esp
    6984:	89 c2                	mov    %eax,%edx
    6986:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6989:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    698c:	83 ec 08             	sub    $0x8,%esp
    698f:	6a 02                	push   $0x2
    6991:	ff 75 08             	pushl  0x8(%ebp)
    6994:	e8 21 e0 ff ff       	call   49ba <getbits>
    6999:	83 c4 10             	add    $0x10,%esp
    699c:	89 c2                	mov    %eax,%edx
    699e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    69a1:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    69a4:	c9                   	leave  
    69a5:	c3                   	ret    

000069a6 <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    69a6:	55                   	push   %ebp
    69a7:	89 e5                	mov    %esp,%ebp
    69a9:	56                   	push   %esi
    69aa:	53                   	push   %ebx
    69ab:	83 ec 10             	sub    $0x10,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    69ae:	8b 45 10             	mov    0x10(%ebp),%eax
    69b1:	8b 40 08             	mov    0x8(%eax),%eax
    69b4:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    69b7:	83 ec 08             	sub    $0x8,%esp
    69ba:	6a 09                	push   $0x9
    69bc:	ff 75 08             	pushl  0x8(%ebp)
    69bf:	e8 f6 df ff ff       	call   49ba <getbits>
    69c4:	83 c4 10             	add    $0x10,%esp
    69c7:	89 c2                	mov    %eax,%edx
    69c9:	8b 45 0c             	mov    0xc(%ebp),%eax
    69cc:	89 10                	mov    %edx,(%eax)
	if (stereo == 1)
    69ce:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    69d2:	75 1a                	jne    69ee <III_get_side_info+0x48>
		si->private_bits = getbits(bs,5);
    69d4:	83 ec 08             	sub    $0x8,%esp
    69d7:	6a 05                	push   $0x5
    69d9:	ff 75 08             	pushl  0x8(%ebp)
    69dc:	e8 d9 df ff ff       	call   49ba <getbits>
    69e1:	83 c4 10             	add    $0x10,%esp
    69e4:	89 c2                	mov    %eax,%edx
    69e6:	8b 45 0c             	mov    0xc(%ebp),%eax
    69e9:	89 50 04             	mov    %edx,0x4(%eax)
    69ec:	eb 18                	jmp    6a06 <III_get_side_info+0x60>
	else
		si->private_bits = getbits(bs,3);
    69ee:	83 ec 08             	sub    $0x8,%esp
    69f1:	6a 03                	push   $0x3
    69f3:	ff 75 08             	pushl  0x8(%ebp)
    69f6:	e8 bf df ff ff       	call   49ba <getbits>
    69fb:	83 c4 10             	add    $0x10,%esp
    69fe:	89 c2                	mov    %eax,%edx
    6a00:	8b 45 0c             	mov    0xc(%ebp),%eax
    6a03:	89 50 04             	mov    %edx,0x4(%eax)

	for (ch=0; ch<stereo; ch++)
    6a06:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6a0d:	eb 40                	jmp    6a4f <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    6a0f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6a16:	eb 2d                	jmp    6a45 <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    6a18:	83 ec 0c             	sub    $0xc,%esp
    6a1b:	ff 75 08             	pushl  0x8(%ebp)
    6a1e:	e8 83 de ff ff       	call   48a6 <get1bit>
    6a23:	83 c4 10             	add    $0x10,%esp
    6a26:	89 c3                	mov    %eax,%ebx
    6a28:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    6a2b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6a2e:	89 d0                	mov    %edx,%eax
    6a30:	c1 e0 02             	shl    $0x2,%eax
    6a33:	01 d0                	add    %edx,%eax
    6a35:	c1 e0 03             	shl    $0x3,%eax
    6a38:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6a3b:	01 d0                	add    %edx,%eax
    6a3d:	89 5c 81 08          	mov    %ebx,0x8(%ecx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    6a41:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6a45:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    6a49:	7e cd                	jle    6a18 <III_get_side_info+0x72>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    6a4b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6a4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6a52:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    6a55:	7c b8                	jl     6a0f <III_get_side_info+0x69>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    6a57:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    6a5e:	e9 cb 05 00 00       	jmp    702e <III_get_side_info+0x688>
		for (ch=0; ch<stereo; ch++) {
    6a63:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6a6a:	e9 af 05 00 00       	jmp    701e <III_get_side_info+0x678>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    6a6f:	83 ec 08             	sub    $0x8,%esp
    6a72:	6a 0c                	push   $0xc
    6a74:	ff 75 08             	pushl  0x8(%ebp)
    6a77:	e8 3e df ff ff       	call   49ba <getbits>
    6a7c:	83 c4 10             	add    $0x10,%esp
    6a7f:	89 c6                	mov    %eax,%esi
    6a81:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6a84:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6a87:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6a8a:	89 c2                	mov    %eax,%edx
    6a8c:	c1 e2 03             	shl    $0x3,%edx
    6a8f:	01 c2                	add    %eax,%edx
    6a91:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6a98:	89 c2                	mov    %eax,%edx
    6a9a:	89 c8                	mov    %ecx,%eax
    6a9c:	c1 e0 02             	shl    $0x2,%eax
    6a9f:	01 c8                	add    %ecx,%eax
    6aa1:	c1 e0 05             	shl    $0x5,%eax
    6aa4:	01 d0                	add    %edx,%eax
    6aa6:	01 d8                	add    %ebx,%eax
    6aa8:	83 c0 10             	add    $0x10,%eax
    6aab:	89 70 08             	mov    %esi,0x8(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    6aae:	83 ec 08             	sub    $0x8,%esp
    6ab1:	6a 09                	push   $0x9
    6ab3:	ff 75 08             	pushl  0x8(%ebp)
    6ab6:	e8 ff de ff ff       	call   49ba <getbits>
    6abb:	83 c4 10             	add    $0x10,%esp
    6abe:	89 c6                	mov    %eax,%esi
    6ac0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6ac3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6ac6:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6ac9:	89 c2                	mov    %eax,%edx
    6acb:	c1 e2 03             	shl    $0x3,%edx
    6ace:	01 c2                	add    %eax,%edx
    6ad0:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6ad7:	89 c2                	mov    %eax,%edx
    6ad9:	89 c8                	mov    %ecx,%eax
    6adb:	c1 e0 02             	shl    $0x2,%eax
    6ade:	01 c8                	add    %ecx,%eax
    6ae0:	c1 e0 05             	shl    $0x5,%eax
    6ae3:	01 d0                	add    %edx,%eax
    6ae5:	01 d8                	add    %ebx,%eax
    6ae7:	83 c0 10             	add    $0x10,%eax
    6aea:	89 70 0c             	mov    %esi,0xc(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    6aed:	83 ec 08             	sub    $0x8,%esp
    6af0:	6a 08                	push   $0x8
    6af2:	ff 75 08             	pushl  0x8(%ebp)
    6af5:	e8 c0 de ff ff       	call   49ba <getbits>
    6afa:	83 c4 10             	add    $0x10,%esp
    6afd:	89 c6                	mov    %eax,%esi
    6aff:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6b02:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6b05:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6b08:	89 c2                	mov    %eax,%edx
    6b0a:	c1 e2 03             	shl    $0x3,%edx
    6b0d:	01 c2                	add    %eax,%edx
    6b0f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6b16:	89 c2                	mov    %eax,%edx
    6b18:	89 c8                	mov    %ecx,%eax
    6b1a:	c1 e0 02             	shl    $0x2,%eax
    6b1d:	01 c8                	add    %ecx,%eax
    6b1f:	c1 e0 05             	shl    $0x5,%eax
    6b22:	01 d0                	add    %edx,%eax
    6b24:	01 d8                	add    %ebx,%eax
    6b26:	83 c0 10             	add    $0x10,%eax
    6b29:	89 70 10             	mov    %esi,0x10(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    6b2c:	83 ec 08             	sub    $0x8,%esp
    6b2f:	6a 04                	push   $0x4
    6b31:	ff 75 08             	pushl  0x8(%ebp)
    6b34:	e8 81 de ff ff       	call   49ba <getbits>
    6b39:	83 c4 10             	add    $0x10,%esp
    6b3c:	89 c6                	mov    %eax,%esi
    6b3e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6b41:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6b44:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6b47:	89 c2                	mov    %eax,%edx
    6b49:	c1 e2 03             	shl    $0x3,%edx
    6b4c:	01 c2                	add    %eax,%edx
    6b4e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6b55:	89 c2                	mov    %eax,%edx
    6b57:	89 c8                	mov    %ecx,%eax
    6b59:	c1 e0 02             	shl    $0x2,%eax
    6b5c:	01 c8                	add    %ecx,%eax
    6b5e:	c1 e0 05             	shl    $0x5,%eax
    6b61:	01 d0                	add    %edx,%eax
    6b63:	01 d8                	add    %ebx,%eax
    6b65:	83 c0 10             	add    $0x10,%eax
    6b68:	89 70 14             	mov    %esi,0x14(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    6b6b:	83 ec 0c             	sub    $0xc,%esp
    6b6e:	ff 75 08             	pushl  0x8(%ebp)
    6b71:	e8 30 dd ff ff       	call   48a6 <get1bit>
    6b76:	83 c4 10             	add    $0x10,%esp
    6b79:	89 c6                	mov    %eax,%esi
    6b7b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6b7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6b81:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6b84:	89 c2                	mov    %eax,%edx
    6b86:	c1 e2 03             	shl    $0x3,%edx
    6b89:	01 c2                	add    %eax,%edx
    6b8b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6b92:	89 c2                	mov    %eax,%edx
    6b94:	89 c8                	mov    %ecx,%eax
    6b96:	c1 e0 02             	shl    $0x2,%eax
    6b99:	01 c8                	add    %ecx,%eax
    6b9b:	c1 e0 05             	shl    $0x5,%eax
    6b9e:	01 d0                	add    %edx,%eax
    6ba0:	01 d8                	add    %ebx,%eax
    6ba2:	83 c0 20             	add    $0x20,%eax
    6ba5:	89 70 08             	mov    %esi,0x8(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    6ba8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6bab:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6bae:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6bb1:	89 c2                	mov    %eax,%edx
    6bb3:	c1 e2 03             	shl    $0x3,%edx
    6bb6:	01 c2                	add    %eax,%edx
    6bb8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6bbf:	89 c2                	mov    %eax,%edx
    6bc1:	89 c8                	mov    %ecx,%eax
    6bc3:	c1 e0 02             	shl    $0x2,%eax
    6bc6:	01 c8                	add    %ecx,%eax
    6bc8:	c1 e0 05             	shl    $0x5,%eax
    6bcb:	01 d0                	add    %edx,%eax
    6bcd:	01 d8                	add    %ebx,%eax
    6bcf:	83 c0 20             	add    $0x20,%eax
    6bd2:	8b 40 08             	mov    0x8(%eax),%eax
    6bd5:	85 c0                	test   %eax,%eax
    6bd7:	0f 84 85 02 00 00    	je     6e62 <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    6bdd:	83 ec 08             	sub    $0x8,%esp
    6be0:	6a 02                	push   $0x2
    6be2:	ff 75 08             	pushl  0x8(%ebp)
    6be5:	e8 d0 dd ff ff       	call   49ba <getbits>
    6bea:	83 c4 10             	add    $0x10,%esp
    6bed:	89 c6                	mov    %eax,%esi
    6bef:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6bf2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6bf5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6bf8:	89 c2                	mov    %eax,%edx
    6bfa:	c1 e2 03             	shl    $0x3,%edx
    6bfd:	01 c2                	add    %eax,%edx
    6bff:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6c06:	89 c2                	mov    %eax,%edx
    6c08:	89 c8                	mov    %ecx,%eax
    6c0a:	c1 e0 02             	shl    $0x2,%eax
    6c0d:	01 c8                	add    %ecx,%eax
    6c0f:	c1 e0 05             	shl    $0x5,%eax
    6c12:	01 d0                	add    %edx,%eax
    6c14:	01 d8                	add    %ebx,%eax
    6c16:	83 c0 20             	add    $0x20,%eax
    6c19:	89 70 0c             	mov    %esi,0xc(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    6c1c:	83 ec 0c             	sub    $0xc,%esp
    6c1f:	ff 75 08             	pushl  0x8(%ebp)
    6c22:	e8 7f dc ff ff       	call   48a6 <get1bit>
    6c27:	83 c4 10             	add    $0x10,%esp
    6c2a:	89 c6                	mov    %eax,%esi
    6c2c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6c2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6c32:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6c35:	89 c2                	mov    %eax,%edx
    6c37:	c1 e2 03             	shl    $0x3,%edx
    6c3a:	01 c2                	add    %eax,%edx
    6c3c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6c43:	89 c2                	mov    %eax,%edx
    6c45:	89 c8                	mov    %ecx,%eax
    6c47:	c1 e0 02             	shl    $0x2,%eax
    6c4a:	01 c8                	add    %ecx,%eax
    6c4c:	c1 e0 05             	shl    $0x5,%eax
    6c4f:	01 d0                	add    %edx,%eax
    6c51:	01 d8                	add    %ebx,%eax
    6c53:	83 c0 20             	add    $0x20,%eax
    6c56:	89 70 10             	mov    %esi,0x10(%eax)
				for (i=0; i<2; i++)
    6c59:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6c60:	eb 43                	jmp    6ca5 <III_get_side_info+0x2ff>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    6c62:	83 ec 08             	sub    $0x8,%esp
    6c65:	6a 05                	push   $0x5
    6c67:	ff 75 08             	pushl  0x8(%ebp)
    6c6a:	e8 4b dd ff ff       	call   49ba <getbits>
    6c6f:	83 c4 10             	add    $0x10,%esp
    6c72:	89 c6                	mov    %eax,%esi
    6c74:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6c77:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6c7a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6c7d:	89 c2                	mov    %eax,%edx
    6c7f:	c1 e2 03             	shl    $0x3,%edx
    6c82:	01 c2                	add    %eax,%edx
    6c84:	8d 04 12             	lea    (%edx,%edx,1),%eax
    6c87:	89 c2                	mov    %eax,%edx
    6c89:	89 c8                	mov    %ecx,%eax
    6c8b:	c1 e0 02             	shl    $0x2,%eax
    6c8e:	01 c8                	add    %ecx,%eax
    6c90:	c1 e0 03             	shl    $0x3,%eax
    6c93:	01 c2                	add    %eax,%edx
    6c95:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6c98:	01 d0                	add    %edx,%eax
    6c9a:	83 c0 08             	add    $0x8,%eax
    6c9d:	89 74 83 14          	mov    %esi,0x14(%ebx,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    6ca1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6ca5:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    6ca9:	7e b7                	jle    6c62 <III_get_side_info+0x2bc>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    6cab:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6cb2:	eb 43                	jmp    6cf7 <III_get_side_info+0x351>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    6cb4:	83 ec 08             	sub    $0x8,%esp
    6cb7:	6a 03                	push   $0x3
    6cb9:	ff 75 08             	pushl  0x8(%ebp)
    6cbc:	e8 f9 dc ff ff       	call   49ba <getbits>
    6cc1:	83 c4 10             	add    $0x10,%esp
    6cc4:	89 c6                	mov    %eax,%esi
    6cc6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6cc9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6ccc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6ccf:	89 c2                	mov    %eax,%edx
    6cd1:	c1 e2 03             	shl    $0x3,%edx
    6cd4:	01 c2                	add    %eax,%edx
    6cd6:	8d 04 12             	lea    (%edx,%edx,1),%eax
    6cd9:	89 c2                	mov    %eax,%edx
    6cdb:	89 c8                	mov    %ecx,%eax
    6cdd:	c1 e0 02             	shl    $0x2,%eax
    6ce0:	01 c8                	add    %ecx,%eax
    6ce2:	c1 e0 03             	shl    $0x3,%eax
    6ce5:	01 c2                	add    %eax,%edx
    6ce7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6cea:	01 d0                	add    %edx,%eax
    6cec:	83 c0 0c             	add    $0xc,%eax
    6cef:	89 74 83 10          	mov    %esi,0x10(%ebx,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    6cf3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6cf7:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    6cfb:	7e b7                	jle    6cb4 <III_get_side_info+0x30e>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    6cfd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6d00:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6d03:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6d06:	89 c2                	mov    %eax,%edx
    6d08:	c1 e2 03             	shl    $0x3,%edx
    6d0b:	01 c2                	add    %eax,%edx
    6d0d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6d14:	89 c2                	mov    %eax,%edx
    6d16:	89 c8                	mov    %ecx,%eax
    6d18:	c1 e0 02             	shl    $0x2,%eax
    6d1b:	01 c8                	add    %ecx,%eax
    6d1d:	c1 e0 05             	shl    $0x5,%eax
    6d20:	01 d0                	add    %edx,%eax
    6d22:	01 d8                	add    %ebx,%eax
    6d24:	83 c0 20             	add    $0x20,%eax
    6d27:	8b 40 0c             	mov    0xc(%eax),%eax
    6d2a:	85 c0                	test   %eax,%eax
    6d2c:	75 05                	jne    6d33 <III_get_side_info+0x38d>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    6d2e:	e8 74 cc ff ff       	call   39a7 <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    6d33:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6d36:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6d39:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6d3c:	89 c2                	mov    %eax,%edx
    6d3e:	c1 e2 03             	shl    $0x3,%edx
    6d41:	01 c2                	add    %eax,%edx
    6d43:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6d4a:	89 c2                	mov    %eax,%edx
    6d4c:	89 c8                	mov    %ecx,%eax
    6d4e:	c1 e0 02             	shl    $0x2,%eax
    6d51:	01 c8                	add    %ecx,%eax
    6d53:	c1 e0 05             	shl    $0x5,%eax
    6d56:	01 d0                	add    %edx,%eax
    6d58:	01 d8                	add    %ebx,%eax
    6d5a:	83 c0 20             	add    $0x20,%eax
    6d5d:	8b 40 0c             	mov    0xc(%eax),%eax
    6d60:	83 f8 02             	cmp    $0x2,%eax
    6d63:	75 64                	jne    6dc9 <III_get_side_info+0x423>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    6d65:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6d68:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6d6b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6d6e:	89 c2                	mov    %eax,%edx
    6d70:	c1 e2 03             	shl    $0x3,%edx
    6d73:	01 c2                	add    %eax,%edx
    6d75:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6d7c:	89 c2                	mov    %eax,%edx
    6d7e:	89 c8                	mov    %ecx,%eax
    6d80:	c1 e0 02             	shl    $0x2,%eax
    6d83:	01 c8                	add    %ecx,%eax
    6d85:	c1 e0 05             	shl    $0x5,%eax
    6d88:	01 d0                	add    %edx,%eax
    6d8a:	01 d8                	add    %ebx,%eax
    6d8c:	83 c0 20             	add    $0x20,%eax
    6d8f:	8b 40 10             	mov    0x10(%eax),%eax
    6d92:	85 c0                	test   %eax,%eax
    6d94:	75 33                	jne    6dc9 <III_get_side_info+0x423>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    6d96:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6d99:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6d9c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6d9f:	89 c2                	mov    %eax,%edx
    6da1:	c1 e2 03             	shl    $0x3,%edx
    6da4:	01 c2                	add    %eax,%edx
    6da6:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6dad:	89 c2                	mov    %eax,%edx
    6daf:	89 c8                	mov    %ecx,%eax
    6db1:	c1 e0 02             	shl    $0x2,%eax
    6db4:	01 c8                	add    %ecx,%eax
    6db6:	c1 e0 05             	shl    $0x5,%eax
    6db9:	01 d0                	add    %edx,%eax
    6dbb:	01 d8                	add    %ebx,%eax
    6dbd:	83 c0 40             	add    $0x40,%eax
    6dc0:	c7 40 0c 08 00 00 00 	movl   $0x8,0xc(%eax)
    6dc7:	eb 31                	jmp    6dfa <III_get_side_info+0x454>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    6dc9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6dcc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6dcf:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6dd2:	89 c2                	mov    %eax,%edx
    6dd4:	c1 e2 03             	shl    $0x3,%edx
    6dd7:	01 c2                	add    %eax,%edx
    6dd9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6de0:	89 c2                	mov    %eax,%edx
    6de2:	89 c8                	mov    %ecx,%eax
    6de4:	c1 e0 02             	shl    $0x2,%eax
    6de7:	01 c8                	add    %ecx,%eax
    6de9:	c1 e0 05             	shl    $0x5,%eax
    6dec:	01 d0                	add    %edx,%eax
    6dee:	01 d8                	add    %ebx,%eax
    6df0:	83 c0 40             	add    $0x40,%eax
    6df3:	c7 40 0c 07 00 00 00 	movl   $0x7,0xc(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    6dfa:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6dfd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6e00:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6e03:	89 c2                	mov    %eax,%edx
    6e05:	c1 e2 03             	shl    $0x3,%edx
    6e08:	01 c2                	add    %eax,%edx
    6e0a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6e11:	89 c2                	mov    %eax,%edx
    6e13:	89 c8                	mov    %ecx,%eax
    6e15:	c1 e0 02             	shl    $0x2,%eax
    6e18:	01 c8                	add    %ecx,%eax
    6e1a:	c1 e0 05             	shl    $0x5,%eax
    6e1d:	01 d0                	add    %edx,%eax
    6e1f:	01 d8                	add    %ebx,%eax
    6e21:	83 c0 40             	add    $0x40,%eax
    6e24:	8b 40 0c             	mov    0xc(%eax),%eax
    6e27:	ba 14 00 00 00       	mov    $0x14,%edx
    6e2c:	89 d3                	mov    %edx,%ebx
    6e2e:	29 c3                	sub    %eax,%ebx
    6e30:	8b 75 0c             	mov    0xc(%ebp),%esi
    6e33:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6e36:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6e39:	89 c2                	mov    %eax,%edx
    6e3b:	c1 e2 03             	shl    $0x3,%edx
    6e3e:	01 c2                	add    %eax,%edx
    6e40:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6e47:	89 c2                	mov    %eax,%edx
    6e49:	89 c8                	mov    %ecx,%eax
    6e4b:	c1 e0 02             	shl    $0x2,%eax
    6e4e:	01 c8                	add    %ecx,%eax
    6e50:	c1 e0 05             	shl    $0x5,%eax
    6e53:	01 d0                	add    %edx,%eax
    6e55:	01 f0                	add    %esi,%eax
    6e57:	83 c0 40             	add    $0x40,%eax
    6e5a:	89 58 10             	mov    %ebx,0x10(%eax)
    6e5d:	e9 01 01 00 00       	jmp    6f63 <III_get_side_info+0x5bd>
			}
			else {
				for (i=0; i<3; i++)
    6e62:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6e69:	eb 43                	jmp    6eae <III_get_side_info+0x508>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    6e6b:	83 ec 08             	sub    $0x8,%esp
    6e6e:	6a 05                	push   $0x5
    6e70:	ff 75 08             	pushl  0x8(%ebp)
    6e73:	e8 42 db ff ff       	call   49ba <getbits>
    6e78:	83 c4 10             	add    $0x10,%esp
    6e7b:	89 c6                	mov    %eax,%esi
    6e7d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6e80:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6e83:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6e86:	89 c2                	mov    %eax,%edx
    6e88:	c1 e2 03             	shl    $0x3,%edx
    6e8b:	01 c2                	add    %eax,%edx
    6e8d:	8d 04 12             	lea    (%edx,%edx,1),%eax
    6e90:	89 c2                	mov    %eax,%edx
    6e92:	89 c8                	mov    %ecx,%eax
    6e94:	c1 e0 02             	shl    $0x2,%eax
    6e97:	01 c8                	add    %ecx,%eax
    6e99:	c1 e0 03             	shl    $0x3,%eax
    6e9c:	01 c2                	add    %eax,%edx
    6e9e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6ea1:	01 d0                	add    %edx,%eax
    6ea3:	83 c0 08             	add    $0x8,%eax
    6ea6:	89 74 83 14          	mov    %esi,0x14(%ebx,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    6eaa:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6eae:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    6eb2:	7e b7                	jle    6e6b <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    6eb4:	83 ec 08             	sub    $0x8,%esp
    6eb7:	6a 04                	push   $0x4
    6eb9:	ff 75 08             	pushl  0x8(%ebp)
    6ebc:	e8 f9 da ff ff       	call   49ba <getbits>
    6ec1:	83 c4 10             	add    $0x10,%esp
    6ec4:	89 c6                	mov    %eax,%esi
    6ec6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6ec9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6ecc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6ecf:	89 c2                	mov    %eax,%edx
    6ed1:	c1 e2 03             	shl    $0x3,%edx
    6ed4:	01 c2                	add    %eax,%edx
    6ed6:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6edd:	89 c2                	mov    %eax,%edx
    6edf:	89 c8                	mov    %ecx,%eax
    6ee1:	c1 e0 02             	shl    $0x2,%eax
    6ee4:	01 c8                	add    %ecx,%eax
    6ee6:	c1 e0 05             	shl    $0x5,%eax
    6ee9:	01 d0                	add    %edx,%eax
    6eeb:	01 d8                	add    %ebx,%eax
    6eed:	83 c0 40             	add    $0x40,%eax
    6ef0:	89 70 0c             	mov    %esi,0xc(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    6ef3:	83 ec 08             	sub    $0x8,%esp
    6ef6:	6a 03                	push   $0x3
    6ef8:	ff 75 08             	pushl  0x8(%ebp)
    6efb:	e8 ba da ff ff       	call   49ba <getbits>
    6f00:	83 c4 10             	add    $0x10,%esp
    6f03:	89 c6                	mov    %eax,%esi
    6f05:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6f08:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6f0b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6f0e:	89 c2                	mov    %eax,%edx
    6f10:	c1 e2 03             	shl    $0x3,%edx
    6f13:	01 c2                	add    %eax,%edx
    6f15:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6f1c:	89 c2                	mov    %eax,%edx
    6f1e:	89 c8                	mov    %ecx,%eax
    6f20:	c1 e0 02             	shl    $0x2,%eax
    6f23:	01 c8                	add    %ecx,%eax
    6f25:	c1 e0 05             	shl    $0x5,%eax
    6f28:	01 d0                	add    %edx,%eax
    6f2a:	01 d8                	add    %ebx,%eax
    6f2c:	83 c0 40             	add    $0x40,%eax
    6f2f:	89 70 10             	mov    %esi,0x10(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    6f32:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6f35:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6f38:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6f3b:	89 c2                	mov    %eax,%edx
    6f3d:	c1 e2 03             	shl    $0x3,%edx
    6f40:	01 c2                	add    %eax,%edx
    6f42:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6f49:	89 c2                	mov    %eax,%edx
    6f4b:	89 c8                	mov    %ecx,%eax
    6f4d:	c1 e0 02             	shl    $0x2,%eax
    6f50:	01 c8                	add    %ecx,%eax
    6f52:	c1 e0 05             	shl    $0x5,%eax
    6f55:	01 d0                	add    %edx,%eax
    6f57:	01 d8                	add    %ebx,%eax
    6f59:	83 c0 20             	add    $0x20,%eax
    6f5c:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    6f63:	83 ec 0c             	sub    $0xc,%esp
    6f66:	ff 75 08             	pushl  0x8(%ebp)
    6f69:	e8 38 d9 ff ff       	call   48a6 <get1bit>
    6f6e:	83 c4 10             	add    $0x10,%esp
    6f71:	89 c6                	mov    %eax,%esi
    6f73:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6f76:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6f79:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6f7c:	89 c2                	mov    %eax,%edx
    6f7e:	c1 e2 03             	shl    $0x3,%edx
    6f81:	01 c2                	add    %eax,%edx
    6f83:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6f8a:	89 c2                	mov    %eax,%edx
    6f8c:	89 c8                	mov    %ecx,%eax
    6f8e:	c1 e0 02             	shl    $0x2,%eax
    6f91:	01 c8                	add    %ecx,%eax
    6f93:	c1 e0 05             	shl    $0x5,%eax
    6f96:	01 d0                	add    %edx,%eax
    6f98:	01 d8                	add    %ebx,%eax
    6f9a:	83 c0 40             	add    $0x40,%eax
    6f9d:	89 70 14             	mov    %esi,0x14(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    6fa0:	83 ec 0c             	sub    $0xc,%esp
    6fa3:	ff 75 08             	pushl  0x8(%ebp)
    6fa6:	e8 fb d8 ff ff       	call   48a6 <get1bit>
    6fab:	83 c4 10             	add    $0x10,%esp
    6fae:	89 c6                	mov    %eax,%esi
    6fb0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6fb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6fb6:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6fb9:	89 c2                	mov    %eax,%edx
    6fbb:	c1 e2 03             	shl    $0x3,%edx
    6fbe:	01 c2                	add    %eax,%edx
    6fc0:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6fc7:	89 c2                	mov    %eax,%edx
    6fc9:	89 c8                	mov    %ecx,%eax
    6fcb:	c1 e0 02             	shl    $0x2,%eax
    6fce:	01 c8                	add    %ecx,%eax
    6fd0:	c1 e0 05             	shl    $0x5,%eax
    6fd3:	01 d0                	add    %edx,%eax
    6fd5:	01 d8                	add    %ebx,%eax
    6fd7:	83 c0 50             	add    $0x50,%eax
    6fda:	89 70 08             	mov    %esi,0x8(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    6fdd:	83 ec 0c             	sub    $0xc,%esp
    6fe0:	ff 75 08             	pushl  0x8(%ebp)
    6fe3:	e8 be d8 ff ff       	call   48a6 <get1bit>
    6fe8:	83 c4 10             	add    $0x10,%esp
    6feb:	89 c6                	mov    %eax,%esi
    6fed:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6ff0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6ff3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6ff6:	89 c2                	mov    %eax,%edx
    6ff8:	c1 e2 03             	shl    $0x3,%edx
    6ffb:	01 c2                	add    %eax,%edx
    6ffd:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7004:	89 c2                	mov    %eax,%edx
    7006:	89 c8                	mov    %ecx,%eax
    7008:	c1 e0 02             	shl    $0x2,%eax
    700b:	01 c8                	add    %ecx,%eax
    700d:	c1 e0 05             	shl    $0x5,%eax
    7010:	01 d0                	add    %edx,%eax
    7012:	01 d8                	add    %ebx,%eax
    7014:	83 c0 50             	add    $0x50,%eax
    7017:	89 70 0c             	mov    %esi,0xc(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    701a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    701e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7021:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    7024:	0f 8c 45 fa ff ff    	jl     6a6f <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    702a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    702e:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7032:	0f 8e 2b fa ff ff    	jle    6a63 <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    7038:	8d 65 f8             	lea    -0x8(%ebp),%esp
    703b:	5b                   	pop    %ebx
    703c:	5e                   	pop    %esi
    703d:	5d                   	pop    %ebp
    703e:	c3                   	ret    

0000703f <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    703f:	55                   	push   %ebp
    7040:	89 e5                	mov    %esp,%ebp
    7042:	56                   	push   %esi
    7043:	53                   	push   %ebx
    7044:	83 ec 10             	sub    $0x10,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    7047:	8b 45 10             	mov    0x10(%ebp),%eax
    704a:	89 c2                	mov    %eax,%edx
    704c:	c1 e2 03             	shl    $0x3,%edx
    704f:	01 c2                	add    %eax,%edx
    7051:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7058:	89 c2                	mov    %eax,%edx
    705a:	8b 4d 14             	mov    0x14(%ebp),%ecx
    705d:	89 c8                	mov    %ecx,%eax
    705f:	c1 e0 02             	shl    $0x2,%eax
    7062:	01 c8                	add    %ecx,%eax
    7064:	c1 e0 05             	shl    $0x5,%eax
    7067:	01 d0                	add    %edx,%eax
    7069:	8d 50 10             	lea    0x10(%eax),%edx
    706c:	8b 45 0c             	mov    0xc(%ebp),%eax
    706f:	01 d0                	add    %edx,%eax
    7071:	83 c0 08             	add    $0x8,%eax
    7074:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    7077:	8b 45 e8             	mov    -0x18(%ebp),%eax
    707a:	8b 40 10             	mov    0x10(%eax),%eax
    707d:	85 c0                	test   %eax,%eax
    707f:	0f 84 93 02 00 00    	je     7318 <III_get_scale_factors+0x2d9>
    7085:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7088:	8b 40 14             	mov    0x14(%eax),%eax
    708b:	83 f8 02             	cmp    $0x2,%eax
    708e:	0f 85 84 02 00 00    	jne    7318 <III_get_scale_factors+0x2d9>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    7094:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7097:	8b 40 18             	mov    0x18(%eax),%eax
    709a:	85 c0                	test   %eax,%eax
    709c:	0f 84 7c 01 00 00    	je     721e <III_get_scale_factors+0x1df>
			for (sfb = 0; sfb < 8; sfb++)
    70a2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    70a9:	eb 3b                	jmp    70e6 <III_get_scale_factors+0xa7>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    70ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
    70ae:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    70b1:	8b 04 85 80 e8 00 00 	mov    0xe880(,%eax,4),%eax
    70b8:	83 ec 0c             	sub    $0xc,%esp
    70bb:	50                   	push   %eax
    70bc:	e8 57 dc ff ff       	call   4d18 <hgetbits>
    70c1:	83 c4 10             	add    $0x10,%esp
    70c4:	89 c3                	mov    %eax,%ebx
    70c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
    70c9:	8b 45 14             	mov    0x14(%ebp),%eax
    70cc:	89 c2                	mov    %eax,%edx
    70ce:	8d 04 12             	lea    (%edx,%edx,1),%eax
    70d1:	89 c2                	mov    %eax,%edx
    70d3:	89 d0                	mov    %edx,%eax
    70d5:	c1 e0 05             	shl    $0x5,%eax
    70d8:	29 d0                	sub    %edx,%eax
    70da:	8b 55 f4             	mov    -0xc(%ebp),%edx
    70dd:	01 d0                	add    %edx,%eax
    70df:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    70e2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    70e6:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    70ea:	7e bf                	jle    70ab <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    70ec:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    70f3:	eb 60                	jmp    7155 <III_get_scale_factors+0x116>
				for (window=0; window<3; window++)
    70f5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    70fc:	eb 4d                	jmp    714b <III_get_scale_factors+0x10c>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    70fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7101:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    7104:	8b 04 85 80 e8 00 00 	mov    0xe880(,%eax,4),%eax
    710b:	83 ec 0c             	sub    $0xc,%esp
    710e:	50                   	push   %eax
    710f:	e8 04 dc ff ff       	call   4d18 <hgetbits>
    7114:	83 c4 10             	add    $0x10,%esp
    7117:	89 c6                	mov    %eax,%esi
    7119:	8b 5d 08             	mov    0x8(%ebp),%ebx
    711c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    711f:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7122:	89 d0                	mov    %edx,%eax
    7124:	01 c0                	add    %eax,%eax
    7126:	01 d0                	add    %edx,%eax
    7128:	c1 e0 02             	shl    $0x2,%eax
    712b:	01 d0                	add    %edx,%eax
    712d:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    7130:	89 d1                	mov    %edx,%ecx
    7132:	89 ca                	mov    %ecx,%edx
    7134:	c1 e2 05             	shl    $0x5,%edx
    7137:	29 ca                	sub    %ecx,%edx
    7139:	01 c2                	add    %eax,%edx
    713b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    713e:	01 d0                	add    %edx,%eax
    7140:	83 c0 14             	add    $0x14,%eax
    7143:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    7147:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    714b:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    714f:	7e ad                	jle    70fe <III_get_scale_factors+0xbf>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    7151:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7155:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    7159:	7e 9a                	jle    70f5 <III_get_scale_factors+0xb6>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    715b:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    7162:	eb 63                	jmp    71c7 <III_get_scale_factors+0x188>
				for (window=0; window<3; window++)
    7164:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    716b:	eb 50                	jmp    71bd <III_get_scale_factors+0x17e>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    716d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7170:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    7173:	83 c0 10             	add    $0x10,%eax
    7176:	8b 04 85 80 e8 00 00 	mov    0xe880(,%eax,4),%eax
    717d:	83 ec 0c             	sub    $0xc,%esp
    7180:	50                   	push   %eax
    7181:	e8 92 db ff ff       	call   4d18 <hgetbits>
    7186:	83 c4 10             	add    $0x10,%esp
    7189:	89 c6                	mov    %eax,%esi
    718b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    718e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7191:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7194:	89 d0                	mov    %edx,%eax
    7196:	01 c0                	add    %eax,%eax
    7198:	01 d0                	add    %edx,%eax
    719a:	c1 e0 02             	shl    $0x2,%eax
    719d:	01 d0                	add    %edx,%eax
    719f:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    71a2:	89 d1                	mov    %edx,%ecx
    71a4:	89 ca                	mov    %ecx,%edx
    71a6:	c1 e2 05             	shl    $0x5,%edx
    71a9:	29 ca                	sub    %ecx,%edx
    71ab:	01 c2                	add    %eax,%edx
    71ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    71b0:	01 d0                	add    %edx,%eax
    71b2:	83 c0 14             	add    $0x14,%eax
    71b5:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    71b9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    71bd:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    71c1:	7e aa                	jle    716d <III_get_scale_factors+0x12e>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    71c3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    71c7:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    71cb:	7e 97                	jle    7164 <III_get_scale_factors+0x125>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    71cd:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    71d4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    71db:	eb 36                	jmp    7213 <III_get_scale_factors+0x1d4>
				(*scalefac)[ch].s[window][sfb] = 0;
    71dd:	8b 5d 08             	mov    0x8(%ebp),%ebx
    71e0:	8b 55 ec             	mov    -0x14(%ebp),%edx
    71e3:	8b 4d 14             	mov    0x14(%ebp),%ecx
    71e6:	89 d0                	mov    %edx,%eax
    71e8:	01 c0                	add    %eax,%eax
    71ea:	01 d0                	add    %edx,%eax
    71ec:	c1 e0 02             	shl    $0x2,%eax
    71ef:	01 d0                	add    %edx,%eax
    71f1:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    71f4:	89 d1                	mov    %edx,%ecx
    71f6:	89 ca                	mov    %ecx,%edx
    71f8:	c1 e2 05             	shl    $0x5,%edx
    71fb:	29 ca                	sub    %ecx,%edx
    71fd:	01 c2                	add    %eax,%edx
    71ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7202:	01 d0                	add    %edx,%eax
    7204:	83 c0 14             	add    $0x14,%eax
    7207:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    720e:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    720f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7213:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7217:	7e c4                	jle    71dd <III_get_scale_factors+0x19e>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    7219:	e9 bf 01 00 00       	jmp    73dd <III_get_scale_factors+0x39e>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    721e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7225:	e9 93 00 00 00       	jmp    72bd <III_get_scale_factors+0x27e>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    722a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    722d:	83 c0 04             	add    $0x4,%eax
    7230:	8b 04 85 44 e8 00 00 	mov    0xe844(,%eax,4),%eax
    7237:	89 45 f4             	mov    %eax,-0xc(%ebp)
    723a:	eb 68                	jmp    72a4 <III_get_scale_factors+0x265>
					for (window=0; window<3; window++)
    723c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7243:	eb 55                	jmp    729a <III_get_scale_factors+0x25b>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    7245:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7248:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    724b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    724e:	c1 e2 04             	shl    $0x4,%edx
    7251:	01 d0                	add    %edx,%eax
    7253:	8b 04 85 80 e8 00 00 	mov    0xe880(,%eax,4),%eax
    725a:	83 ec 0c             	sub    $0xc,%esp
    725d:	50                   	push   %eax
    725e:	e8 b5 da ff ff       	call   4d18 <hgetbits>
    7263:	83 c4 10             	add    $0x10,%esp
    7266:	89 c6                	mov    %eax,%esi
    7268:	8b 5d 08             	mov    0x8(%ebp),%ebx
    726b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    726e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7271:	89 d0                	mov    %edx,%eax
    7273:	01 c0                	add    %eax,%eax
    7275:	01 d0                	add    %edx,%eax
    7277:	c1 e0 02             	shl    $0x2,%eax
    727a:	01 d0                	add    %edx,%eax
    727c:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    727f:	89 d1                	mov    %edx,%ecx
    7281:	89 ca                	mov    %ecx,%edx
    7283:	c1 e2 05             	shl    $0x5,%edx
    7286:	29 ca                	sub    %ecx,%edx
    7288:	01 c2                	add    %eax,%edx
    728a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    728d:	01 d0                	add    %edx,%eax
    728f:	83 c0 14             	add    $0x14,%eax
    7292:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    7296:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    729a:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    729e:	7e a5                	jle    7245 <III_get_scale_factors+0x206>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    72a0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    72a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    72a7:	83 c0 01             	add    $0x1,%eax
    72aa:	83 c0 04             	add    $0x4,%eax
    72ad:	8b 04 85 44 e8 00 00 	mov    0xe844(,%eax,4),%eax
    72b4:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    72b7:	7f 83                	jg     723c <III_get_scale_factors+0x1fd>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    72b9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    72bd:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    72c1:	0f 8e 63 ff ff ff    	jle    722a <III_get_scale_factors+0x1eb>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    72c7:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    72ce:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    72d5:	eb 36                	jmp    730d <III_get_scale_factors+0x2ce>
					(*scalefac)[ch].s[window][sfb] = 0;
    72d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    72da:	8b 55 ec             	mov    -0x14(%ebp),%edx
    72dd:	8b 4d 14             	mov    0x14(%ebp),%ecx
    72e0:	89 d0                	mov    %edx,%eax
    72e2:	01 c0                	add    %eax,%eax
    72e4:	01 d0                	add    %edx,%eax
    72e6:	c1 e0 02             	shl    $0x2,%eax
    72e9:	01 d0                	add    %edx,%eax
    72eb:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    72ee:	89 d1                	mov    %edx,%ecx
    72f0:	89 ca                	mov    %ecx,%edx
    72f2:	c1 e2 05             	shl    $0x5,%edx
    72f5:	29 ca                	sub    %ecx,%edx
    72f7:	01 c2                	add    %eax,%edx
    72f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    72fc:	01 d0                	add    %edx,%eax
    72fe:	83 c0 14             	add    $0x14,%eax
    7301:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    7308:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    7309:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    730d:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7311:	7e c4                	jle    72d7 <III_get_scale_factors+0x298>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    7313:	e9 c5 00 00 00       	jmp    73dd <III_get_scale_factors+0x39e>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    7318:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    731f:	e9 92 00 00 00       	jmp    73b6 <III_get_scale_factors+0x377>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    7324:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7327:	8b 55 14             	mov    0x14(%ebp),%edx
    732a:	89 d0                	mov    %edx,%eax
    732c:	c1 e0 02             	shl    $0x2,%eax
    732f:	01 d0                	add    %edx,%eax
    7331:	c1 e0 03             	shl    $0x3,%eax
    7334:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7337:	01 d0                	add    %edx,%eax
    7339:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    733d:	85 c0                	test   %eax,%eax
    733f:	74 06                	je     7347 <III_get_scale_factors+0x308>
    7341:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    7345:	75 6b                	jne    73b2 <III_get_scale_factors+0x373>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    7347:	8b 45 f0             	mov    -0x10(%ebp),%eax
    734a:	8b 04 85 40 e8 00 00 	mov    0xe840(,%eax,4),%eax
    7351:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7354:	eb 4a                	jmp    73a0 <III_get_scale_factors+0x361>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    7356:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    735a:	0f 9f c0             	setg   %al
    735d:	0f b6 d0             	movzbl %al,%edx
    7360:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7363:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    7366:	c1 e2 04             	shl    $0x4,%edx
    7369:	01 d0                	add    %edx,%eax
    736b:	8b 04 85 80 e8 00 00 	mov    0xe880(,%eax,4),%eax
    7372:	83 ec 0c             	sub    $0xc,%esp
    7375:	50                   	push   %eax
    7376:	e8 9d d9 ff ff       	call   4d18 <hgetbits>
    737b:	83 c4 10             	add    $0x10,%esp
    737e:	89 c3                	mov    %eax,%ebx
    7380:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7383:	8b 45 14             	mov    0x14(%ebp),%eax
    7386:	89 c2                	mov    %eax,%edx
    7388:	8d 04 12             	lea    (%edx,%edx,1),%eax
    738b:	89 c2                	mov    %eax,%edx
    738d:	89 d0                	mov    %edx,%eax
    738f:	c1 e0 05             	shl    $0x5,%eax
    7392:	29 d0                	sub    %edx,%eax
    7394:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7397:	01 d0                	add    %edx,%eax
    7399:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    739c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    73a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    73a3:	83 c0 01             	add    $0x1,%eax
    73a6:	8b 04 85 40 e8 00 00 	mov    0xe840(,%eax,4),%eax
    73ad:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    73b0:	7f a4                	jg     7356 <III_get_scale_factors+0x317>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    73b2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    73b6:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    73ba:	0f 8e 64 ff ff ff    	jle    7324 <III_get_scale_factors+0x2e5>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    73c0:	8b 55 08             	mov    0x8(%ebp),%edx
    73c3:	8b 45 14             	mov    0x14(%ebp),%eax
    73c6:	c1 e0 03             	shl    $0x3,%eax
    73c9:	89 c1                	mov    %eax,%ecx
    73cb:	c1 e1 05             	shl    $0x5,%ecx
    73ce:	29 c1                	sub    %eax,%ecx
    73d0:	89 c8                	mov    %ecx,%eax
    73d2:	83 c0 58             	add    $0x58,%eax
    73d5:	01 d0                	add    %edx,%eax
    73d7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    73dd:	8d 65 f8             	lea    -0x8(%ebp),%esp
    73e0:	5b                   	pop    %ebx
    73e1:	5e                   	pop    %esi
    73e2:	5d                   	pop    %ebp
    73e3:	c3                   	ret    

000073e4 <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    73e4:	55                   	push   %ebp
    73e5:	89 e5                	mov    %esp,%ebp
    73e7:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    73ea:	a1 00 ec 00 00       	mov    0xec00,%eax
    73ef:	85 c0                	test   %eax,%eax
    73f1:	74 02                	je     73f5 <initialize_huffman+0x11>
    73f3:	eb 0f                	jmp    7404 <initialize_huffman+0x20>
	read_decoder_table();
    73f5:	e8 7b d9 ff ff       	call   4d75 <read_decoder_table>
	huffman_initialized = TRUE;
    73fa:	c7 05 00 ec 00 00 01 	movl   $0x1,0xec00
    7401:	00 00 00 
}
    7404:	c9                   	leave  
    7405:	c3                   	ret    

00007406 <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    7406:	55                   	push   %ebp
    7407:	89 e5                	mov    %esp,%ebp
    7409:	57                   	push   %edi
    740a:	56                   	push   %esi
    740b:	53                   	push   %ebx
    740c:	83 ec 2c             	sub    $0x2c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    740f:	e8 d0 ff ff ff       	call   73e4 <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    7414:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7417:	8b 45 14             	mov    0x14(%ebp),%eax
    741a:	8b 4d 10             	mov    0x10(%ebp),%ecx
    741d:	89 c2                	mov    %eax,%edx
    741f:	c1 e2 03             	shl    $0x3,%edx
    7422:	01 c2                	add    %eax,%edx
    7424:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    742b:	89 c2                	mov    %eax,%edx
    742d:	89 c8                	mov    %ecx,%eax
    742f:	c1 e0 02             	shl    $0x2,%eax
    7432:	01 c8                	add    %ecx,%eax
    7434:	c1 e0 05             	shl    $0x5,%eax
    7437:	01 d0                	add    %edx,%eax
    7439:	01 d8                	add    %ebx,%eax
    743b:	83 c0 20             	add    $0x20,%eax
    743e:	8b 40 08             	mov    0x8(%eax),%eax
    7441:	85 c0                	test   %eax,%eax
    7443:	74 45                	je     748a <III_hufman_decode+0x84>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    7445:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7448:	8b 45 14             	mov    0x14(%ebp),%eax
    744b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    744e:	89 c2                	mov    %eax,%edx
    7450:	c1 e2 03             	shl    $0x3,%edx
    7453:	01 c2                	add    %eax,%edx
    7455:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    745c:	89 c2                	mov    %eax,%edx
    745e:	89 c8                	mov    %ecx,%eax
    7460:	c1 e0 02             	shl    $0x2,%eax
    7463:	01 c8                	add    %ecx,%eax
    7465:	c1 e0 05             	shl    $0x5,%eax
    7468:	01 d0                	add    %edx,%eax
    746a:	01 d8                	add    %ebx,%eax
    746c:	83 c0 20             	add    $0x20,%eax
    746f:	8b 40 0c             	mov    0xc(%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    7472:	83 f8 02             	cmp    $0x2,%eax
    7475:	75 13                	jne    748a <III_hufman_decode+0x84>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    7477:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    747e:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    7485:	e9 cf 00 00 00       	jmp    7559 <III_hufman_decode+0x153>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    748a:	8b 45 1c             	mov    0x1c(%ebp),%eax
    748d:	8b 00                	mov    (%eax),%eax
    748f:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    7492:	8b 75 0c             	mov    0xc(%ebp),%esi
    7495:	8b 45 14             	mov    0x14(%ebp),%eax
    7498:	8b 5d 10             	mov    0x10(%ebp),%ebx
    749b:	89 c2                	mov    %eax,%edx
    749d:	c1 e2 03             	shl    $0x3,%edx
    74a0:	01 c2                	add    %eax,%edx
    74a2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    74a9:	89 c2                	mov    %eax,%edx
    74ab:	89 d8                	mov    %ebx,%eax
    74ad:	c1 e0 02             	shl    $0x2,%eax
    74b0:	01 d8                	add    %ebx,%eax
    74b2:	c1 e0 05             	shl    $0x5,%eax
    74b5:	01 d0                	add    %edx,%eax
    74b7:	01 f0                	add    %esi,%eax
    74b9:	83 c0 40             	add    $0x40,%eax
    74bc:	8b 40 0c             	mov    0xc(%eax),%eax
    74bf:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    74c2:	89 c8                	mov    %ecx,%eax
    74c4:	c1 e0 03             	shl    $0x3,%eax
    74c7:	01 c8                	add    %ecx,%eax
    74c9:	c1 e0 02             	shl    $0x2,%eax
    74cc:	01 c8                	add    %ecx,%eax
    74ce:	01 d0                	add    %edx,%eax
    74d0:	8b 04 85 00 e9 00 00 	mov    0xe900(,%eax,4),%eax
    74d7:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    74da:	8b 45 1c             	mov    0x1c(%ebp),%eax
    74dd:	8b 00                	mov    (%eax),%eax
    74df:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    74e2:	8b 75 0c             	mov    0xc(%ebp),%esi
    74e5:	8b 45 14             	mov    0x14(%ebp),%eax
    74e8:	8b 5d 10             	mov    0x10(%ebp),%ebx
    74eb:	89 c2                	mov    %eax,%edx
    74ed:	c1 e2 03             	shl    $0x3,%edx
    74f0:	01 c2                	add    %eax,%edx
    74f2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    74f9:	89 c2                	mov    %eax,%edx
    74fb:	89 d8                	mov    %ebx,%eax
    74fd:	c1 e0 02             	shl    $0x2,%eax
    7500:	01 d8                	add    %ebx,%eax
    7502:	c1 e0 05             	shl    $0x5,%eax
    7505:	01 d0                	add    %edx,%eax
    7507:	01 f0                	add    %esi,%eax
    7509:	83 c0 40             	add    $0x40,%eax
    750c:	8b 70 0c             	mov    0xc(%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    750f:	8b 7d 0c             	mov    0xc(%ebp),%edi
    7512:	8b 45 14             	mov    0x14(%ebp),%eax
    7515:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7518:	89 c2                	mov    %eax,%edx
    751a:	c1 e2 03             	shl    $0x3,%edx
    751d:	01 c2                	add    %eax,%edx
    751f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7526:	89 c2                	mov    %eax,%edx
    7528:	89 d8                	mov    %ebx,%eax
    752a:	c1 e0 02             	shl    $0x2,%eax
    752d:	01 d8                	add    %ebx,%eax
    752f:	c1 e0 05             	shl    $0x5,%eax
    7532:	01 d0                	add    %edx,%eax
    7534:	01 f8                	add    %edi,%eax
    7536:	83 c0 40             	add    $0x40,%eax
    7539:	8b 40 10             	mov    0x10(%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    753c:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    753e:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7541:	89 c8                	mov    %ecx,%eax
    7543:	c1 e0 03             	shl    $0x3,%eax
    7546:	01 c8                	add    %ecx,%eax
    7548:	c1 e0 02             	shl    $0x2,%eax
    754b:	01 c8                	add    %ecx,%eax
    754d:	01 d0                	add    %edx,%eax
    754f:	8b 04 85 00 e9 00 00 	mov    0xe900(,%eax,4),%eax
    7556:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    7559:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    7560:	e9 a6 01 00 00       	jmp    770b <III_hufman_decode+0x305>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    7565:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7568:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    756b:	7d 44                	jge    75b1 <III_hufman_decode+0x1ab>
    756d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7570:	8b 45 14             	mov    0x14(%ebp),%eax
    7573:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7576:	89 c2                	mov    %eax,%edx
    7578:	c1 e2 03             	shl    $0x3,%edx
    757b:	01 c2                	add    %eax,%edx
    757d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7584:	89 c2                	mov    %eax,%edx
    7586:	89 c8                	mov    %ecx,%eax
    7588:	c1 e0 02             	shl    $0x2,%eax
    758b:	01 c8                	add    %ecx,%eax
    758d:	c1 e0 05             	shl    $0x5,%eax
    7590:	01 d0                	add    %edx,%eax
    7592:	01 d8                	add    %ebx,%eax
    7594:	83 c0 20             	add    $0x20,%eax
    7597:	8b 50 14             	mov    0x14(%eax),%edx
    759a:	89 d0                	mov    %edx,%eax
    759c:	c1 e0 02             	shl    $0x2,%eax
    759f:	01 d0                	add    %edx,%eax
    75a1:	c1 e0 03             	shl    $0x3,%eax
    75a4:	05 80 1c 01 00       	add    $0x11c80,%eax
    75a9:	89 45 e0             	mov    %eax,-0x20(%ebp)
    75ac:	e9 88 00 00 00       	jmp    7639 <III_hufman_decode+0x233>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    75b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    75b4:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    75b7:	7d 41                	jge    75fa <III_hufman_decode+0x1f4>
    75b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    75bc:	8b 45 14             	mov    0x14(%ebp),%eax
    75bf:	8b 4d 10             	mov    0x10(%ebp),%ecx
    75c2:	89 c2                	mov    %eax,%edx
    75c4:	c1 e2 03             	shl    $0x3,%edx
    75c7:	01 c2                	add    %eax,%edx
    75c9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    75d0:	89 c2                	mov    %eax,%edx
    75d2:	89 c8                	mov    %ecx,%eax
    75d4:	c1 e0 02             	shl    $0x2,%eax
    75d7:	01 c8                	add    %ecx,%eax
    75d9:	c1 e0 05             	shl    $0x5,%eax
    75dc:	01 d0                	add    %edx,%eax
    75de:	01 d8                	add    %ebx,%eax
    75e0:	83 c0 24             	add    $0x24,%eax
    75e3:	8b 50 14             	mov    0x14(%eax),%edx
    75e6:	89 d0                	mov    %edx,%eax
    75e8:	c1 e0 02             	shl    $0x2,%eax
    75eb:	01 d0                	add    %edx,%eax
    75ed:	c1 e0 03             	shl    $0x3,%eax
    75f0:	05 80 1c 01 00       	add    $0x11c80,%eax
    75f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    75f8:	eb 3f                	jmp    7639 <III_hufman_decode+0x233>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    75fa:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    75fd:	8b 45 14             	mov    0x14(%ebp),%eax
    7600:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7603:	89 c2                	mov    %eax,%edx
    7605:	c1 e2 03             	shl    $0x3,%edx
    7608:	01 c2                	add    %eax,%edx
    760a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7611:	89 c2                	mov    %eax,%edx
    7613:	89 c8                	mov    %ecx,%eax
    7615:	c1 e0 02             	shl    $0x2,%eax
    7618:	01 c8                	add    %ecx,%eax
    761a:	c1 e0 05             	shl    $0x5,%eax
    761d:	01 d0                	add    %edx,%eax
    761f:	01 d8                	add    %ebx,%eax
    7621:	83 c0 28             	add    $0x28,%eax
    7624:	8b 50 14             	mov    0x14(%eax),%edx
    7627:	89 d0                	mov    %edx,%eax
    7629:	c1 e0 02             	shl    $0x2,%eax
    762c:	01 d0                	add    %edx,%eax
    762e:	c1 e0 03             	shl    $0x3,%eax
    7631:	05 80 1c 01 00       	add    $0x11c80,%eax
    7636:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    7639:	83 ec 0c             	sub    $0xc,%esp
    763c:	8d 45 c8             	lea    -0x38(%ebp),%eax
    763f:	50                   	push   %eax
    7640:	8d 45 cc             	lea    -0x34(%ebp),%eax
    7643:	50                   	push   %eax
    7644:	8d 45 d0             	lea    -0x30(%ebp),%eax
    7647:	50                   	push   %eax
    7648:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    764b:	50                   	push   %eax
    764c:	ff 75 e0             	pushl  -0x20(%ebp)
    764f:	e8 d9 ee ff ff       	call   652d <huffman_decoder>
    7654:	83 c4 20             	add    $0x20,%esp
      is[i/SSLIMIT][i%SSLIMIT] = x;
    7657:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    765a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    765f:	89 c8                	mov    %ecx,%eax
    7661:	f7 ea                	imul   %edx
    7663:	c1 fa 02             	sar    $0x2,%edx
    7666:	89 c8                	mov    %ecx,%eax
    7668:	c1 f8 1f             	sar    $0x1f,%eax
    766b:	29 c2                	sub    %eax,%edx
    766d:	89 d0                	mov    %edx,%eax
    766f:	89 c2                	mov    %eax,%edx
    7671:	89 d0                	mov    %edx,%eax
    7673:	c1 e0 03             	shl    $0x3,%eax
    7676:	01 d0                	add    %edx,%eax
    7678:	c1 e0 03             	shl    $0x3,%eax
    767b:	89 c2                	mov    %eax,%edx
    767d:	8b 45 08             	mov    0x8(%ebp),%eax
    7680:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7683:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7686:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    768b:	89 c8                	mov    %ecx,%eax
    768d:	f7 ea                	imul   %edx
    768f:	c1 fa 02             	sar    $0x2,%edx
    7692:	89 c8                	mov    %ecx,%eax
    7694:	c1 f8 1f             	sar    $0x1f,%eax
    7697:	29 c2                	sub    %eax,%edx
    7699:	89 d0                	mov    %edx,%eax
    769b:	c1 e0 03             	shl    $0x3,%eax
    769e:	01 d0                	add    %edx,%eax
    76a0:	01 c0                	add    %eax,%eax
    76a2:	29 c1                	sub    %eax,%ecx
    76a4:	89 ca                	mov    %ecx,%edx
    76a6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    76a9:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    76ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    76af:	8d 48 01             	lea    0x1(%eax),%ecx
    76b2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    76b7:	89 c8                	mov    %ecx,%eax
    76b9:	f7 ea                	imul   %edx
    76bb:	c1 fa 02             	sar    $0x2,%edx
    76be:	89 c8                	mov    %ecx,%eax
    76c0:	c1 f8 1f             	sar    $0x1f,%eax
    76c3:	29 c2                	sub    %eax,%edx
    76c5:	89 d0                	mov    %edx,%eax
    76c7:	89 c2                	mov    %eax,%edx
    76c9:	89 d0                	mov    %edx,%eax
    76cb:	c1 e0 03             	shl    $0x3,%eax
    76ce:	01 d0                	add    %edx,%eax
    76d0:	c1 e0 03             	shl    $0x3,%eax
    76d3:	89 c2                	mov    %eax,%edx
    76d5:	8b 45 08             	mov    0x8(%ebp),%eax
    76d8:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    76db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    76de:	8d 48 01             	lea    0x1(%eax),%ecx
    76e1:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    76e6:	89 c8                	mov    %ecx,%eax
    76e8:	f7 ea                	imul   %edx
    76ea:	c1 fa 02             	sar    $0x2,%edx
    76ed:	89 c8                	mov    %ecx,%eax
    76ef:	c1 f8 1f             	sar    $0x1f,%eax
    76f2:	29 c2                	sub    %eax,%edx
    76f4:	89 d0                	mov    %edx,%eax
    76f6:	c1 e0 03             	shl    $0x3,%eax
    76f9:	01 d0                	add    %edx,%eax
    76fb:	01 c0                	add    %eax,%eax
    76fd:	29 c1                	sub    %eax,%ecx
    76ff:	89 ca                	mov    %ecx,%edx
    7701:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7704:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    7707:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    770b:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    770e:	8b 75 0c             	mov    0xc(%ebp),%esi
    7711:	8b 45 14             	mov    0x14(%ebp),%eax
    7714:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7717:	89 c2                	mov    %eax,%edx
    7719:	c1 e2 03             	shl    $0x3,%edx
    771c:	01 c2                	add    %eax,%edx
    771e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7725:	89 c2                	mov    %eax,%edx
    7727:	89 c8                	mov    %ecx,%eax
    7729:	c1 e0 02             	shl    $0x2,%eax
    772c:	01 c8                	add    %ecx,%eax
    772e:	c1 e0 05             	shl    $0x5,%eax
    7731:	01 d0                	add    %edx,%eax
    7733:	01 f0                	add    %esi,%eax
    7735:	83 c0 10             	add    $0x10,%eax
    7738:	8b 40 0c             	mov    0xc(%eax),%eax
    773b:	01 c0                	add    %eax,%eax
    773d:	39 c3                	cmp    %eax,%ebx
    773f:	0f 82 20 fe ff ff    	jb     7565 <III_hufman_decode+0x15f>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    7745:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7748:	8b 45 14             	mov    0x14(%ebp),%eax
    774b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    774e:	89 c2                	mov    %eax,%edx
    7750:	c1 e2 03             	shl    $0x3,%edx
    7753:	01 c2                	add    %eax,%edx
    7755:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    775c:	89 c2                	mov    %eax,%edx
    775e:	89 c8                	mov    %ecx,%eax
    7760:	c1 e0 02             	shl    $0x2,%eax
    7763:	01 c8                	add    %ecx,%eax
    7765:	c1 e0 05             	shl    $0x5,%eax
    7768:	01 d0                	add    %edx,%eax
    776a:	01 d8                	add    %ebx,%eax
    776c:	83 c0 50             	add    $0x50,%eax
    776f:	8b 40 0c             	mov    0xc(%eax),%eax
    7772:	8d 50 20             	lea    0x20(%eax),%edx
    7775:	89 d0                	mov    %edx,%eax
    7777:	c1 e0 02             	shl    $0x2,%eax
    777a:	01 d0                	add    %edx,%eax
    777c:	c1 e0 03             	shl    $0x3,%eax
    777f:	05 80 1c 01 00       	add    $0x11c80,%eax
    7784:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    7787:	e9 88 01 00 00       	jmp    7914 <III_hufman_decode+0x50e>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    778c:	83 ec 0c             	sub    $0xc,%esp
    778f:	8d 45 c8             	lea    -0x38(%ebp),%eax
    7792:	50                   	push   %eax
    7793:	8d 45 cc             	lea    -0x34(%ebp),%eax
    7796:	50                   	push   %eax
    7797:	8d 45 d0             	lea    -0x30(%ebp),%eax
    779a:	50                   	push   %eax
    779b:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    779e:	50                   	push   %eax
    779f:	ff 75 e0             	pushl  -0x20(%ebp)
    77a2:	e8 86 ed ff ff       	call   652d <huffman_decoder>
    77a7:	83 c4 20             	add    $0x20,%esp
      is[i/SSLIMIT][i%SSLIMIT] = v;
    77aa:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    77ad:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    77b2:	89 c8                	mov    %ecx,%eax
    77b4:	f7 ea                	imul   %edx
    77b6:	c1 fa 02             	sar    $0x2,%edx
    77b9:	89 c8                	mov    %ecx,%eax
    77bb:	c1 f8 1f             	sar    $0x1f,%eax
    77be:	29 c2                	sub    %eax,%edx
    77c0:	89 d0                	mov    %edx,%eax
    77c2:	89 c2                	mov    %eax,%edx
    77c4:	89 d0                	mov    %edx,%eax
    77c6:	c1 e0 03             	shl    $0x3,%eax
    77c9:	01 d0                	add    %edx,%eax
    77cb:	c1 e0 03             	shl    $0x3,%eax
    77ce:	89 c2                	mov    %eax,%edx
    77d0:	8b 45 08             	mov    0x8(%ebp),%eax
    77d3:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    77d6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    77d9:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    77de:	89 c8                	mov    %ecx,%eax
    77e0:	f7 ea                	imul   %edx
    77e2:	c1 fa 02             	sar    $0x2,%edx
    77e5:	89 c8                	mov    %ecx,%eax
    77e7:	c1 f8 1f             	sar    $0x1f,%eax
    77ea:	29 c2                	sub    %eax,%edx
    77ec:	89 d0                	mov    %edx,%eax
    77ee:	c1 e0 03             	shl    $0x3,%eax
    77f1:	01 d0                	add    %edx,%eax
    77f3:	01 c0                	add    %eax,%eax
    77f5:	29 c1                	sub    %eax,%ecx
    77f7:	89 ca                	mov    %ecx,%edx
    77f9:	8b 45 cc             	mov    -0x34(%ebp),%eax
    77fc:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    77ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7802:	8d 48 01             	lea    0x1(%eax),%ecx
    7805:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    780a:	89 c8                	mov    %ecx,%eax
    780c:	f7 ea                	imul   %edx
    780e:	c1 fa 02             	sar    $0x2,%edx
    7811:	89 c8                	mov    %ecx,%eax
    7813:	c1 f8 1f             	sar    $0x1f,%eax
    7816:	29 c2                	sub    %eax,%edx
    7818:	89 d0                	mov    %edx,%eax
    781a:	89 c2                	mov    %eax,%edx
    781c:	89 d0                	mov    %edx,%eax
    781e:	c1 e0 03             	shl    $0x3,%eax
    7821:	01 d0                	add    %edx,%eax
    7823:	c1 e0 03             	shl    $0x3,%eax
    7826:	89 c2                	mov    %eax,%edx
    7828:	8b 45 08             	mov    0x8(%ebp),%eax
    782b:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    782e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7831:	8d 48 01             	lea    0x1(%eax),%ecx
    7834:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7839:	89 c8                	mov    %ecx,%eax
    783b:	f7 ea                	imul   %edx
    783d:	c1 fa 02             	sar    $0x2,%edx
    7840:	89 c8                	mov    %ecx,%eax
    7842:	c1 f8 1f             	sar    $0x1f,%eax
    7845:	29 c2                	sub    %eax,%edx
    7847:	89 d0                	mov    %edx,%eax
    7849:	c1 e0 03             	shl    $0x3,%eax
    784c:	01 d0                	add    %edx,%eax
    784e:	01 c0                	add    %eax,%eax
    7850:	29 c1                	sub    %eax,%ecx
    7852:	89 ca                	mov    %ecx,%edx
    7854:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7857:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    785a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    785d:	8d 48 02             	lea    0x2(%eax),%ecx
    7860:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7865:	89 c8                	mov    %ecx,%eax
    7867:	f7 ea                	imul   %edx
    7869:	c1 fa 02             	sar    $0x2,%edx
    786c:	89 c8                	mov    %ecx,%eax
    786e:	c1 f8 1f             	sar    $0x1f,%eax
    7871:	29 c2                	sub    %eax,%edx
    7873:	89 d0                	mov    %edx,%eax
    7875:	89 c2                	mov    %eax,%edx
    7877:	89 d0                	mov    %edx,%eax
    7879:	c1 e0 03             	shl    $0x3,%eax
    787c:	01 d0                	add    %edx,%eax
    787e:	c1 e0 03             	shl    $0x3,%eax
    7881:	89 c2                	mov    %eax,%edx
    7883:	8b 45 08             	mov    0x8(%ebp),%eax
    7886:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7889:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    788c:	8d 48 02             	lea    0x2(%eax),%ecx
    788f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7894:	89 c8                	mov    %ecx,%eax
    7896:	f7 ea                	imul   %edx
    7898:	c1 fa 02             	sar    $0x2,%edx
    789b:	89 c8                	mov    %ecx,%eax
    789d:	c1 f8 1f             	sar    $0x1f,%eax
    78a0:	29 c2                	sub    %eax,%edx
    78a2:	89 d0                	mov    %edx,%eax
    78a4:	c1 e0 03             	shl    $0x3,%eax
    78a7:	01 d0                	add    %edx,%eax
    78a9:	01 c0                	add    %eax,%eax
    78ab:	29 c1                	sub    %eax,%ecx
    78ad:	89 ca                	mov    %ecx,%edx
    78af:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    78b2:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    78b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    78b8:	8d 48 03             	lea    0x3(%eax),%ecx
    78bb:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    78c0:	89 c8                	mov    %ecx,%eax
    78c2:	f7 ea                	imul   %edx
    78c4:	c1 fa 02             	sar    $0x2,%edx
    78c7:	89 c8                	mov    %ecx,%eax
    78c9:	c1 f8 1f             	sar    $0x1f,%eax
    78cc:	29 c2                	sub    %eax,%edx
    78ce:	89 d0                	mov    %edx,%eax
    78d0:	89 c2                	mov    %eax,%edx
    78d2:	89 d0                	mov    %edx,%eax
    78d4:	c1 e0 03             	shl    $0x3,%eax
    78d7:	01 d0                	add    %edx,%eax
    78d9:	c1 e0 03             	shl    $0x3,%eax
    78dc:	89 c2                	mov    %eax,%edx
    78de:	8b 45 08             	mov    0x8(%ebp),%eax
    78e1:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    78e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    78e7:	8d 48 03             	lea    0x3(%eax),%ecx
    78ea:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    78ef:	89 c8                	mov    %ecx,%eax
    78f1:	f7 ea                	imul   %edx
    78f3:	c1 fa 02             	sar    $0x2,%edx
    78f6:	89 c8                	mov    %ecx,%eax
    78f8:	c1 f8 1f             	sar    $0x1f,%eax
    78fb:	29 c2                	sub    %eax,%edx
    78fd:	89 d0                	mov    %edx,%eax
    78ff:	c1 e0 03             	shl    $0x3,%eax
    7902:	01 d0                	add    %edx,%eax
    7904:	01 c0                	add    %eax,%eax
    7906:	29 c1                	sub    %eax,%ecx
    7908:	89 ca                	mov    %ecx,%edx
    790a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    790d:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    7910:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    7914:	e8 e8 d3 ff ff       	call   4d01 <hsstell>
    7919:	89 c6                	mov    %eax,%esi
    791b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    791e:	8b 45 14             	mov    0x14(%ebp),%eax
    7921:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7924:	89 c2                	mov    %eax,%edx
    7926:	c1 e2 03             	shl    $0x3,%edx
    7929:	01 c2                	add    %eax,%edx
    792b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7932:	89 c2                	mov    %eax,%edx
    7934:	89 c8                	mov    %ecx,%eax
    7936:	c1 e0 02             	shl    $0x2,%eax
    7939:	01 c8                	add    %ecx,%eax
    793b:	c1 e0 05             	shl    $0x5,%eax
    793e:	01 d0                	add    %edx,%eax
    7940:	01 d8                	add    %ebx,%eax
    7942:	83 c0 10             	add    $0x10,%eax
    7945:	8b 50 08             	mov    0x8(%eax),%edx
    7948:	8b 45 18             	mov    0x18(%ebp),%eax
    794b:	01 d0                	add    %edx,%eax
    794d:	39 c6                	cmp    %eax,%esi
    794f:	73 0d                	jae    795e <III_hufman_decode+0x558>
    7951:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    7958:	0f 8e 2e fe ff ff    	jle    778c <III_hufman_decode+0x386>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    795e:	e8 9e d3 ff ff       	call   4d01 <hsstell>
    7963:	89 c6                	mov    %eax,%esi
    7965:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7968:	8b 45 14             	mov    0x14(%ebp),%eax
    796b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    796e:	89 c2                	mov    %eax,%edx
    7970:	c1 e2 03             	shl    $0x3,%edx
    7973:	01 c2                	add    %eax,%edx
    7975:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    797c:	89 c2                	mov    %eax,%edx
    797e:	89 c8                	mov    %ecx,%eax
    7980:	c1 e0 02             	shl    $0x2,%eax
    7983:	01 c8                	add    %ecx,%eax
    7985:	c1 e0 05             	shl    $0x5,%eax
    7988:	01 d0                	add    %edx,%eax
    798a:	01 d8                	add    %ebx,%eax
    798c:	83 c0 10             	add    $0x10,%eax
    798f:	8b 50 08             	mov    0x8(%eax),%edx
    7992:	8b 45 18             	mov    0x18(%ebp),%eax
    7995:	01 d0                	add    %edx,%eax
    7997:	39 c6                	cmp    %eax,%esi
    7999:	76 4f                	jbe    79ea <III_hufman_decode+0x5e4>
   {  i -=4;
    799b:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    799f:	e8 5d d3 ff ff       	call   4d01 <hsstell>
    79a4:	89 c2                	mov    %eax,%edx
    79a6:	8b 45 18             	mov    0x18(%ebp),%eax
    79a9:	89 d6                	mov    %edx,%esi
    79ab:	29 c6                	sub    %eax,%esi
    79ad:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    79b0:	8b 45 14             	mov    0x14(%ebp),%eax
    79b3:	8b 4d 10             	mov    0x10(%ebp),%ecx
    79b6:	89 c2                	mov    %eax,%edx
    79b8:	c1 e2 03             	shl    $0x3,%edx
    79bb:	01 c2                	add    %eax,%edx
    79bd:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    79c4:	89 c2                	mov    %eax,%edx
    79c6:	89 c8                	mov    %ecx,%eax
    79c8:	c1 e0 02             	shl    $0x2,%eax
    79cb:	01 c8                	add    %ecx,%eax
    79cd:	c1 e0 05             	shl    $0x5,%eax
    79d0:	01 d0                	add    %edx,%eax
    79d2:	01 d8                	add    %ebx,%eax
    79d4:	83 c0 10             	add    $0x10,%eax
    79d7:	8b 40 08             	mov    0x8(%eax),%eax
    79da:	29 c6                	sub    %eax,%esi
    79dc:	89 f0                	mov    %esi,%eax
    79de:	83 ec 0c             	sub    $0xc,%esp
    79e1:	50                   	push   %eax
    79e2:	e8 5e d3 ff ff       	call   4d45 <rewindNbits>
    79e7:	83 c4 10             	add    $0x10,%esp
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    79ea:	e8 12 d3 ff ff       	call   4d01 <hsstell>
    79ef:	89 c6                	mov    %eax,%esi
    79f1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    79f4:	8b 45 14             	mov    0x14(%ebp),%eax
    79f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    79fa:	89 c2                	mov    %eax,%edx
    79fc:	c1 e2 03             	shl    $0x3,%edx
    79ff:	01 c2                	add    %eax,%edx
    7a01:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7a08:	89 c2                	mov    %eax,%edx
    7a0a:	89 c8                	mov    %ecx,%eax
    7a0c:	c1 e0 02             	shl    $0x2,%eax
    7a0f:	01 c8                	add    %ecx,%eax
    7a11:	c1 e0 05             	shl    $0x5,%eax
    7a14:	01 d0                	add    %edx,%eax
    7a16:	01 d8                	add    %ebx,%eax
    7a18:	83 c0 10             	add    $0x10,%eax
    7a1b:	8b 50 08             	mov    0x8(%eax),%edx
    7a1e:	8b 45 18             	mov    0x18(%ebp),%eax
    7a21:	01 d0                	add    %edx,%eax
    7a23:	39 c6                	cmp    %eax,%esi
    7a25:	73 48                	jae    7a6f <III_hufman_decode+0x669>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    7a27:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7a2a:	8b 45 14             	mov    0x14(%ebp),%eax
    7a2d:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7a30:	89 c2                	mov    %eax,%edx
    7a32:	c1 e2 03             	shl    $0x3,%edx
    7a35:	01 c2                	add    %eax,%edx
    7a37:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7a3e:	89 c2                	mov    %eax,%edx
    7a40:	89 c8                	mov    %ecx,%eax
    7a42:	c1 e0 02             	shl    $0x2,%eax
    7a45:	01 c8                	add    %ecx,%eax
    7a47:	c1 e0 05             	shl    $0x5,%eax
    7a4a:	01 d0                	add    %edx,%eax
    7a4c:	01 d8                	add    %ebx,%eax
    7a4e:	83 c0 10             	add    $0x10,%eax
    7a51:	8b 50 08             	mov    0x8(%eax),%edx
    7a54:	8b 45 18             	mov    0x18(%ebp),%eax
    7a57:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7a5a:	e8 a2 d2 ff ff       	call   4d01 <hsstell>
    7a5f:	29 c3                	sub    %eax,%ebx
    7a61:	89 d8                	mov    %ebx,%eax
    7a63:	83 ec 0c             	sub    $0xc,%esp
    7a66:	50                   	push   %eax
    7a67:	e8 ac d2 ff ff       	call   4d18 <hgetbits>
    7a6c:	83 c4 10             	add    $0x10,%esp

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    7a6f:	eb 5a                	jmp    7acb <III_hufman_decode+0x6c5>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    7a71:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7a74:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7a79:	89 c8                	mov    %ecx,%eax
    7a7b:	f7 ea                	imul   %edx
    7a7d:	c1 fa 02             	sar    $0x2,%edx
    7a80:	89 c8                	mov    %ecx,%eax
    7a82:	c1 f8 1f             	sar    $0x1f,%eax
    7a85:	29 c2                	sub    %eax,%edx
    7a87:	89 d0                	mov    %edx,%eax
    7a89:	89 c2                	mov    %eax,%edx
    7a8b:	89 d0                	mov    %edx,%eax
    7a8d:	c1 e0 03             	shl    $0x3,%eax
    7a90:	01 d0                	add    %edx,%eax
    7a92:	c1 e0 03             	shl    $0x3,%eax
    7a95:	89 c2                	mov    %eax,%edx
    7a97:	8b 45 08             	mov    0x8(%ebp),%eax
    7a9a:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7a9d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7aa0:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7aa5:	89 c8                	mov    %ecx,%eax
    7aa7:	f7 ea                	imul   %edx
    7aa9:	c1 fa 02             	sar    $0x2,%edx
    7aac:	89 c8                	mov    %ecx,%eax
    7aae:	c1 f8 1f             	sar    $0x1f,%eax
    7ab1:	29 c2                	sub    %eax,%edx
    7ab3:	89 d0                	mov    %edx,%eax
    7ab5:	c1 e0 03             	shl    $0x3,%eax
    7ab8:	01 d0                	add    %edx,%eax
    7aba:	01 c0                	add    %eax,%eax
    7abc:	29 c1                	sub    %eax,%ecx
    7abe:	89 ca                	mov    %ecx,%edx
    7ac0:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    7ac7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    7acb:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    7ad2:	7e 9d                	jle    7a71 <III_hufman_decode+0x66b>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    7ad4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    7ad7:	5b                   	pop    %ebx
    7ad8:	5e                   	pop    %esi
    7ad9:	5f                   	pop    %edi
    7ada:	5d                   	pop    %ebp
    7adb:	c3                   	ret    

00007adc <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    7adc:	55                   	push   %ebp
    7add:	89 e5                	mov    %esp,%ebp
    7adf:	53                   	push   %ebx
    7ae0:	83 ec 34             	sub    $0x34,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    7ae3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7aea:	8b 45 1c             	mov    0x1c(%ebp),%eax
    7aed:	8b 00                	mov    (%eax),%eax
    7aef:	8b 40 10             	mov    0x10(%eax),%eax
    7af2:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    7af5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    7afc:	8b 45 14             	mov    0x14(%ebp),%eax
    7aff:	8b 40 10             	mov    0x10(%eax),%eax
    7b02:	85 c0                	test   %eax,%eax
    7b04:	74 6a                	je     7b70 <III_dequantize_sample+0x94>
    7b06:	8b 45 14             	mov    0x14(%ebp),%eax
    7b09:	8b 40 14             	mov    0x14(%eax),%eax
    7b0c:	83 f8 02             	cmp    $0x2,%eax
    7b0f:	75 5f                	jne    7b70 <III_dequantize_sample+0x94>
		if (gr_info->mixed_block_flag)
    7b11:	8b 45 14             	mov    0x14(%ebp),%eax
    7b14:	8b 40 18             	mov    0x18(%eax),%eax
    7b17:	85 c0                	test   %eax,%eax
    7b19:	74 18                	je     7b33 <III_dequantize_sample+0x57>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    7b1b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7b1e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7b24:	83 c0 04             	add    $0x4,%eax
    7b27:	05 00 e9 00 00       	add    $0xe900,%eax
    7b2c:	8b 00                	mov    (%eax),%eax
    7b2e:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    7b31:	eb 53                	jmp    7b86 <III_dequantize_sample+0xaa>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    7b33:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7b36:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7b3c:	83 c0 54             	add    $0x54,%eax
    7b3f:	05 00 e9 00 00       	add    $0xe900,%eax
    7b44:	8b 50 0c             	mov    0xc(%eax),%edx
    7b47:	89 d0                	mov    %edx,%eax
    7b49:	01 c0                	add    %eax,%eax
    7b4b:	01 d0                	add    %edx,%eax
    7b4d:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    7b50:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7b53:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7b59:	83 c0 54             	add    $0x54,%eax
    7b5c:	05 00 e9 00 00       	add    $0xe900,%eax
    7b61:	8b 40 0c             	mov    0xc(%eax),%eax
    7b64:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    7b67:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    7b6e:	eb 16                	jmp    7b86 <III_dequantize_sample+0xaa>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    7b70:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7b73:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7b79:	83 c0 04             	add    $0x4,%eax
    7b7c:	05 00 e9 00 00       	add    $0xe900,%eax
    7b81:	8b 00                	mov    (%eax),%eax
    7b83:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    7b86:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7b8d:	e9 8a 06 00 00       	jmp    821c <III_dequantize_sample+0x740>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    7b92:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7b99:	e9 70 06 00 00       	jmp    820e <III_dequantize_sample+0x732>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    7b9e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7ba1:	89 d0                	mov    %edx,%eax
    7ba3:	c1 e0 03             	shl    $0x3,%eax
    7ba6:	01 d0                	add    %edx,%eax
    7ba8:	01 c0                	add    %eax,%eax
    7baa:	89 c2                	mov    %eax,%edx
    7bac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7baf:	01 d0                	add    %edx,%eax
    7bb1:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    7bb4:	0f 85 a7 02 00 00    	jne    7e61 <III_dequantize_sample+0x385>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    7bba:	8b 45 14             	mov    0x14(%ebp),%eax
    7bbd:	8b 40 10             	mov    0x10(%eax),%eax
    7bc0:	85 c0                	test   %eax,%eax
    7bc2:	0f 84 74 02 00 00    	je     7e3c <III_dequantize_sample+0x360>
    7bc8:	8b 45 14             	mov    0x14(%ebp),%eax
    7bcb:	8b 40 14             	mov    0x14(%eax),%eax
    7bce:	83 f8 02             	cmp    $0x2,%eax
    7bd1:	0f 85 65 02 00 00    	jne    7e3c <III_dequantize_sample+0x360>
					if (gr_info->mixed_block_flag) {
    7bd7:	8b 45 14             	mov    0x14(%ebp),%eax
    7bda:	8b 40 18             	mov    0x18(%eax),%eax
    7bdd:	85 c0                	test   %eax,%eax
    7bdf:	0f 84 b8 01 00 00    	je     7d9d <III_dequantize_sample+0x2c1>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    7be5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7be8:	89 d0                	mov    %edx,%eax
    7bea:	c1 e0 03             	shl    $0x3,%eax
    7bed:	01 d0                	add    %edx,%eax
    7bef:	01 c0                	add    %eax,%eax
    7bf1:	89 c2                	mov    %eax,%edx
    7bf3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7bf6:	01 c2                	add    %eax,%edx
    7bf8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7bfb:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7c01:	83 c0 20             	add    $0x20,%eax
    7c04:	05 00 e9 00 00       	add    $0xe900,%eax
    7c09:	8b 00                	mov    (%eax),%eax
    7c0b:	39 c2                	cmp    %eax,%edx
    7c0d:	0f 85 96 00 00 00    	jne    7ca9 <III_dequantize_sample+0x1cd>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    7c13:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7c16:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7c1c:	83 c0 60             	add    $0x60,%eax
    7c1f:	05 00 e9 00 00       	add    $0xe900,%eax
    7c24:	8b 50 0c             	mov    0xc(%eax),%edx
    7c27:	89 d0                	mov    %edx,%eax
    7c29:	01 c0                	add    %eax,%eax
    7c2b:	01 d0                	add    %edx,%eax
    7c2d:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    7c30:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    7c37:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7c3a:	8d 48 01             	lea    0x1(%eax),%ecx
    7c3d:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7c40:	89 d0                	mov    %edx,%eax
    7c42:	c1 e0 03             	shl    $0x3,%eax
    7c45:	01 d0                	add    %edx,%eax
    7c47:	c1 e0 02             	shl    $0x2,%eax
    7c4a:	01 d0                	add    %edx,%eax
    7c4c:	01 c8                	add    %ecx,%eax
    7c4e:	83 c0 14             	add    $0x14,%eax
    7c51:	8b 0c 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    7c58:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7c5b:	89 d0                	mov    %edx,%eax
    7c5d:	c1 e0 03             	shl    $0x3,%eax
    7c60:	01 d0                	add    %edx,%eax
    7c62:	c1 e0 02             	shl    $0x2,%eax
    7c65:	01 d0                	add    %edx,%eax
    7c67:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7c6a:	01 d0                	add    %edx,%eax
    7c6c:	83 c0 14             	add    $0x14,%eax
    7c6f:	8b 04 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    7c76:	29 c1                	sub    %eax,%ecx
    7c78:	89 c8                	mov    %ecx,%eax
    7c7a:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    7c7d:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7c80:	89 d0                	mov    %edx,%eax
    7c82:	c1 e0 03             	shl    $0x3,%eax
    7c85:	01 d0                	add    %edx,%eax
    7c87:	c1 e0 02             	shl    $0x2,%eax
    7c8a:	01 d0                	add    %edx,%eax
    7c8c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7c8f:	01 d0                	add    %edx,%eax
    7c91:	83 c0 14             	add    $0x14,%eax
    7c94:	8b 14 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%edx
    7c9b:	89 d0                	mov    %edx,%eax
    7c9d:	01 c0                	add    %eax,%eax
    7c9f:	01 d0                	add    %edx,%eax
    7ca1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    7ca4:	e9 91 01 00 00       	jmp    7e3a <III_dequantize_sample+0x35e>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    7ca9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7cac:	89 d0                	mov    %edx,%eax
    7cae:	c1 e0 03             	shl    $0x3,%eax
    7cb1:	01 d0                	add    %edx,%eax
    7cb3:	01 c0                	add    %eax,%eax
    7cb5:	89 c2                	mov    %eax,%edx
    7cb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7cba:	01 c2                	add    %eax,%edx
    7cbc:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7cbf:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7cc5:	83 c0 20             	add    $0x20,%eax
    7cc8:	05 00 e9 00 00       	add    $0xe900,%eax
    7ccd:	8b 00                	mov    (%eax),%eax
    7ccf:	39 c2                	cmp    %eax,%edx
    7cd1:	7d 2a                	jge    7cfd <III_dequantize_sample+0x221>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    7cd3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7cd7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7cda:	8d 48 01             	lea    0x1(%eax),%ecx
    7cdd:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7ce0:	89 d0                	mov    %edx,%eax
    7ce2:	c1 e0 03             	shl    $0x3,%eax
    7ce5:	01 d0                	add    %edx,%eax
    7ce7:	c1 e0 02             	shl    $0x2,%eax
    7cea:	01 d0                	add    %edx,%eax
    7cec:	01 c8                	add    %ecx,%eax
    7cee:	8b 04 85 00 e9 00 00 	mov    0xe900(,%eax,4),%eax
    7cf5:	89 45 e8             	mov    %eax,-0x18(%ebp)
    7cf8:	e9 3d 01 00 00       	jmp    7e3a <III_dequantize_sample+0x35e>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    7cfd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7d01:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7d04:	8d 48 01             	lea    0x1(%eax),%ecx
    7d07:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7d0a:	89 d0                	mov    %edx,%eax
    7d0c:	c1 e0 03             	shl    $0x3,%eax
    7d0f:	01 d0                	add    %edx,%eax
    7d11:	c1 e0 02             	shl    $0x2,%eax
    7d14:	01 d0                	add    %edx,%eax
    7d16:	01 c8                	add    %ecx,%eax
    7d18:	83 c0 14             	add    $0x14,%eax
    7d1b:	8b 14 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%edx
    7d22:	89 d0                	mov    %edx,%eax
    7d24:	01 c0                	add    %eax,%eax
    7d26:	01 d0                	add    %edx,%eax
    7d28:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    7d2b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7d2e:	8d 48 01             	lea    0x1(%eax),%ecx
    7d31:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7d34:	89 d0                	mov    %edx,%eax
    7d36:	c1 e0 03             	shl    $0x3,%eax
    7d39:	01 d0                	add    %edx,%eax
    7d3b:	c1 e0 02             	shl    $0x2,%eax
    7d3e:	01 d0                	add    %edx,%eax
    7d40:	01 c8                	add    %ecx,%eax
    7d42:	83 c0 14             	add    $0x14,%eax
    7d45:	8b 0c 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    7d4c:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7d4f:	89 d0                	mov    %edx,%eax
    7d51:	c1 e0 03             	shl    $0x3,%eax
    7d54:	01 d0                	add    %edx,%eax
    7d56:	c1 e0 02             	shl    $0x2,%eax
    7d59:	01 d0                	add    %edx,%eax
    7d5b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7d5e:	01 d0                	add    %edx,%eax
    7d60:	83 c0 14             	add    $0x14,%eax
    7d63:	8b 04 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    7d6a:	29 c1                	sub    %eax,%ecx
    7d6c:	89 c8                	mov    %ecx,%eax
    7d6e:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    7d71:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7d74:	89 d0                	mov    %edx,%eax
    7d76:	c1 e0 03             	shl    $0x3,%eax
    7d79:	01 d0                	add    %edx,%eax
    7d7b:	c1 e0 02             	shl    $0x2,%eax
    7d7e:	01 d0                	add    %edx,%eax
    7d80:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7d83:	01 d0                	add    %edx,%eax
    7d85:	83 c0 14             	add    $0x14,%eax
    7d88:	8b 14 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%edx
    7d8f:	89 d0                	mov    %edx,%eax
    7d91:	01 c0                	add    %eax,%eax
    7d93:	01 d0                	add    %edx,%eax
    7d95:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    7d98:	e9 c4 00 00 00       	jmp    7e61 <III_dequantize_sample+0x385>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    7d9d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7da1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7da4:	8d 48 01             	lea    0x1(%eax),%ecx
    7da7:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7daa:	89 d0                	mov    %edx,%eax
    7dac:	c1 e0 03             	shl    $0x3,%eax
    7daf:	01 d0                	add    %edx,%eax
    7db1:	c1 e0 02             	shl    $0x2,%eax
    7db4:	01 d0                	add    %edx,%eax
    7db6:	01 c8                	add    %ecx,%eax
    7db8:	83 c0 14             	add    $0x14,%eax
    7dbb:	8b 14 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%edx
    7dc2:	89 d0                	mov    %edx,%eax
    7dc4:	01 c0                	add    %eax,%eax
    7dc6:	01 d0                	add    %edx,%eax
    7dc8:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    7dcb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7dce:	8d 48 01             	lea    0x1(%eax),%ecx
    7dd1:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7dd4:	89 d0                	mov    %edx,%eax
    7dd6:	c1 e0 03             	shl    $0x3,%eax
    7dd9:	01 d0                	add    %edx,%eax
    7ddb:	c1 e0 02             	shl    $0x2,%eax
    7dde:	01 d0                	add    %edx,%eax
    7de0:	01 c8                	add    %ecx,%eax
    7de2:	83 c0 14             	add    $0x14,%eax
    7de5:	8b 0c 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    7dec:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7def:	89 d0                	mov    %edx,%eax
    7df1:	c1 e0 03             	shl    $0x3,%eax
    7df4:	01 d0                	add    %edx,%eax
    7df6:	c1 e0 02             	shl    $0x2,%eax
    7df9:	01 d0                	add    %edx,%eax
    7dfb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7dfe:	01 d0                	add    %edx,%eax
    7e00:	83 c0 14             	add    $0x14,%eax
    7e03:	8b 04 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    7e0a:	29 c1                	sub    %eax,%ecx
    7e0c:	89 c8                	mov    %ecx,%eax
    7e0e:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    7e11:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7e14:	89 d0                	mov    %edx,%eax
    7e16:	c1 e0 03             	shl    $0x3,%eax
    7e19:	01 d0                	add    %edx,%eax
    7e1b:	c1 e0 02             	shl    $0x2,%eax
    7e1e:	01 d0                	add    %edx,%eax
    7e20:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7e23:	01 d0                	add    %edx,%eax
    7e25:	83 c0 14             	add    $0x14,%eax
    7e28:	8b 14 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%edx
    7e2f:	89 d0                	mov    %edx,%eax
    7e31:	01 c0                	add    %eax,%eax
    7e33:	01 d0                	add    %edx,%eax
    7e35:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    7e38:	eb 27                	jmp    7e61 <III_dequantize_sample+0x385>
    7e3a:	eb 25                	jmp    7e61 <III_dequantize_sample+0x385>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    7e3c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7e40:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7e43:	8d 48 01             	lea    0x1(%eax),%ecx
    7e46:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7e49:	89 d0                	mov    %edx,%eax
    7e4b:	c1 e0 03             	shl    $0x3,%eax
    7e4e:	01 d0                	add    %edx,%eax
    7e50:	c1 e0 02             	shl    $0x2,%eax
    7e53:	01 d0                	add    %edx,%eax
    7e55:	01 c8                	add    %ecx,%eax
    7e57:	8b 04 85 00 e9 00 00 	mov    0xe900(,%eax,4),%eax
    7e5e:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    7e61:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7e64:	89 d0                	mov    %edx,%eax
    7e66:	c1 e0 03             	shl    $0x3,%eax
    7e69:	01 d0                	add    %edx,%eax
    7e6b:	c1 e0 04             	shl    $0x4,%eax
    7e6e:	89 c2                	mov    %eax,%edx
    7e70:	8b 45 0c             	mov    0xc(%ebp),%eax
    7e73:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7e76:	8b 45 14             	mov    0x14(%ebp),%eax
    7e79:	8b 40 08             	mov    0x8(%eax),%eax
    7e7c:	89 45 c8             	mov    %eax,-0x38(%ebp)
    7e7f:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    7e86:	df 6d c8             	fildll -0x38(%ebp)
    7e89:	dd 5d d0             	fstpl  -0x30(%ebp)
    7e8c:	dd 45 d0             	fldl   -0x30(%ebp)
    7e8f:	dd 05 90 cf 00 00    	fldl   0xcf90
    7e95:	de e9                	fsubrp %st,%st(1)
    7e97:	dd 05 98 cf 00 00    	fldl   0xcf98
    7e9d:	de c9                	fmulp  %st,%st(1)
    7e9f:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    7ea3:	dd 1c 24             	fstpl  (%esp)
    7ea6:	dd 05 a0 cf 00 00    	fldl   0xcfa0
    7eac:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    7eb0:	dd 1c 24             	fstpl  (%esp)
    7eb3:	e8 96 c1 ff ff       	call   404e <pow>
    7eb8:	83 c4 10             	add    $0x10,%esp
    7ebb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ebe:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    7ec1:	8b 45 14             	mov    0x14(%ebp),%eax
    7ec4:	8b 40 10             	mov    0x10(%eax),%eax
    7ec7:	85 c0                	test   %eax,%eax
    7ec9:	0f 84 9c 01 00 00    	je     806b <III_dequantize_sample+0x58f>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    7ecf:	8b 45 14             	mov    0x14(%ebp),%eax
    7ed2:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    7ed5:	83 f8 02             	cmp    $0x2,%eax
    7ed8:	75 0a                	jne    7ee4 <III_dequantize_sample+0x408>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    7eda:	8b 45 14             	mov    0x14(%ebp),%eax
    7edd:	8b 40 18             	mov    0x18(%eax),%eax
    7ee0:	85 c0                	test   %eax,%eax
    7ee2:	74 27                	je     7f0b <III_dequantize_sample+0x42f>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    7ee4:	8b 45 14             	mov    0x14(%ebp),%eax
    7ee7:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    7eea:	83 f8 02             	cmp    $0x2,%eax
    7eed:	0f 85 78 01 00 00    	jne    806b <III_dequantize_sample+0x58f>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    7ef3:	8b 45 14             	mov    0x14(%ebp),%eax
    7ef6:	8b 40 18             	mov    0x18(%eax),%eax
    7ef9:	85 c0                	test   %eax,%eax
    7efb:	0f 84 6a 01 00 00    	je     806b <III_dequantize_sample+0x58f>
    7f01:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7f05:	0f 8e 60 01 00 00    	jle    806b <III_dequantize_sample+0x58f>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    7f0b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7f0e:	89 d0                	mov    %edx,%eax
    7f10:	c1 e0 03             	shl    $0x3,%eax
    7f13:	01 d0                	add    %edx,%eax
    7f15:	01 c0                	add    %eax,%eax
    7f17:	89 c2                	mov    %eax,%edx
    7f19:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f1c:	01 d0                	add    %edx,%eax
    7f1e:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    7f21:	99                   	cltd   
    7f22:	f7 7d e0             	idivl  -0x20(%ebp)
    7f25:	89 c2                	mov    %eax,%edx
    7f27:	8b 45 14             	mov    0x14(%ebp),%eax
    7f2a:	83 c2 08             	add    $0x8,%edx
    7f2d:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    7f31:	89 45 c8             	mov    %eax,-0x38(%ebp)
    7f34:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    7f3b:	df 6d c8             	fildll -0x38(%ebp)
    7f3e:	dd 5d d0             	fstpl  -0x30(%ebp)
    7f41:	dd 45 d0             	fldl   -0x30(%ebp)
    7f44:	dd 05 a8 cf 00 00    	fldl   0xcfa8
    7f4a:	de c9                	fmulp  %st,%st(1)
    7f4c:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    7f50:	dd 1c 24             	fstpl  (%esp)
    7f53:	dd 05 a0 cf 00 00    	fldl   0xcfa0
    7f59:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    7f5d:	dd 1c 24             	fstpl  (%esp)
    7f60:	e8 e9 c0 ff ff       	call   404e <pow>
    7f65:	83 c4 10             	add    $0x10,%esp
    7f68:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7f6b:	89 d0                	mov    %edx,%eax
    7f6d:	c1 e0 03             	shl    $0x3,%eax
    7f70:	01 d0                	add    %edx,%eax
    7f72:	c1 e0 04             	shl    $0x4,%eax
    7f75:	89 c2                	mov    %eax,%edx
    7f77:	8b 45 0c             	mov    0xc(%ebp),%eax
    7f7a:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    7f7d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7f80:	89 d0                	mov    %edx,%eax
    7f82:	c1 e0 03             	shl    $0x3,%eax
    7f85:	01 d0                	add    %edx,%eax
    7f87:	c1 e0 04             	shl    $0x4,%eax
    7f8a:	89 c2                	mov    %eax,%edx
    7f8c:	8b 45 0c             	mov    0xc(%ebp),%eax
    7f8f:	01 c2                	add    %eax,%edx
    7f91:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f94:	dd 04 c2             	fldl   (%edx,%eax,8)
    7f97:	de c9                	fmulp  %st,%st(1)
    7f99:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f9c:	dd 1c c1             	fstpl  (%ecx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    7f9f:	8b 45 14             	mov    0x14(%ebp),%eax
    7fa2:	8b 40 40             	mov    0x40(%eax),%eax
    7fa5:	89 45 c8             	mov    %eax,-0x38(%ebp)
    7fa8:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    7faf:	df 6d c8             	fildll -0x38(%ebp)
    7fb2:	dd 5d d0             	fstpl  -0x30(%ebp)
    7fb5:	dd 45 d0             	fldl   -0x30(%ebp)
    7fb8:	d9 e8                	fld1   
    7fba:	de c1                	faddp  %st,%st(1)
    7fbc:	dd 05 b0 cf 00 00    	fldl   0xcfb0
    7fc2:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    7fc4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7fc7:	89 d0                	mov    %edx,%eax
    7fc9:	c1 e0 03             	shl    $0x3,%eax
    7fcc:	01 d0                	add    %edx,%eax
    7fce:	01 c0                	add    %eax,%eax
    7fd0:	89 c2                	mov    %eax,%edx
    7fd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7fd5:	01 d0                	add    %edx,%eax
    7fd7:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    7fda:	99                   	cltd   
    7fdb:	f7 7d e0             	idivl  -0x20(%ebp)
    7fde:	89 c2                	mov    %eax,%edx
    7fe0:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7fe3:	8b 4d 18             	mov    0x18(%ebp),%ecx
    7fe6:	89 d0                	mov    %edx,%eax
    7fe8:	01 c0                	add    %eax,%eax
    7fea:	01 d0                	add    %edx,%eax
    7fec:	c1 e0 02             	shl    $0x2,%eax
    7fef:	01 d0                	add    %edx,%eax
    7ff1:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
    7ff4:	89 d1                	mov    %edx,%ecx
    7ff6:	89 ca                	mov    %ecx,%edx
    7ff8:	c1 e2 05             	shl    $0x5,%edx
    7ffb:	29 ca                	sub    %ecx,%edx
    7ffd:	01 c2                	add    %eax,%edx
    7fff:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8002:	01 d0                	add    %edx,%eax
    8004:	83 c0 14             	add    $0x14,%eax
    8007:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    800b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    800e:	db 45 c8             	fildl  -0x38(%ebp)
    8011:	de c9                	fmulp  %st,%st(1)
    8013:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8017:	dd 1c 24             	fstpl  (%esp)
    801a:	dd 05 a0 cf 00 00    	fldl   0xcfa0
    8020:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8024:	dd 1c 24             	fstpl  (%esp)
    8027:	e8 22 c0 ff ff       	call   404e <pow>
    802c:	83 c4 10             	add    $0x10,%esp
    802f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8032:	89 d0                	mov    %edx,%eax
    8034:	c1 e0 03             	shl    $0x3,%eax
    8037:	01 d0                	add    %edx,%eax
    8039:	c1 e0 04             	shl    $0x4,%eax
    803c:	89 c2                	mov    %eax,%edx
    803e:	8b 45 0c             	mov    0xc(%ebp),%eax
    8041:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8044:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8047:	89 d0                	mov    %edx,%eax
    8049:	c1 e0 03             	shl    $0x3,%eax
    804c:	01 d0                	add    %edx,%eax
    804e:	c1 e0 04             	shl    $0x4,%eax
    8051:	89 c2                	mov    %eax,%edx
    8053:	8b 45 0c             	mov    0xc(%ebp),%eax
    8056:	01 c2                	add    %eax,%edx
    8058:	8b 45 f4             	mov    -0xc(%ebp),%eax
    805b:	dd 04 c2             	fldl   (%edx,%eax,8)
    805e:	de c9                	fmulp  %st,%st(1)
    8060:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8063:	dd 1c c1             	fstpl  (%ecx,%eax,8)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    8066:	e9 c0 00 00 00       	jmp    812b <III_dequantize_sample+0x64f>
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    806b:	8b 45 14             	mov    0x14(%ebp),%eax
    806e:	8b 40 40             	mov    0x40(%eax),%eax
    8071:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8074:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    807b:	df 6d c8             	fildll -0x38(%ebp)
    807e:	dd 5d d0             	fstpl  -0x30(%ebp)
    8081:	dd 45 d0             	fldl   -0x30(%ebp)
    8084:	d9 e8                	fld1   
    8086:	de c1                	faddp  %st,%st(1)
    8088:	dd 05 b0 cf 00 00    	fldl   0xcfb0
    808e:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    8090:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8093:	8b 45 18             	mov    0x18(%ebp),%eax
    8096:	89 c2                	mov    %eax,%edx
    8098:	8d 04 12             	lea    (%edx,%edx,1),%eax
    809b:	89 c2                	mov    %eax,%edx
    809d:	89 d0                	mov    %edx,%eax
    809f:	c1 e0 05             	shl    $0x5,%eax
    80a2:	29 d0                	sub    %edx,%eax
    80a4:	8b 55 ec             	mov    -0x14(%ebp),%edx
    80a7:	01 d0                	add    %edx,%eax
    80a9:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    80ac:	89 c1                	mov    %eax,%ecx
    80ae:	8b 45 14             	mov    0x14(%ebp),%eax
    80b1:	8b 50 3c             	mov    0x3c(%eax),%edx
    80b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    80b7:	8b 04 85 c0 ea 00 00 	mov    0xeac0(,%eax,4),%eax
    80be:	0f af c2             	imul   %edx,%eax
    80c1:	01 c8                	add    %ecx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    80c3:	89 45 c8             	mov    %eax,-0x38(%ebp)
    80c6:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
    80cd:	df 6d c8             	fildll -0x38(%ebp)
    80d0:	dd 5d d0             	fstpl  -0x30(%ebp)
    80d3:	dd 45 d0             	fldl   -0x30(%ebp)
    80d6:	de c9                	fmulp  %st,%st(1)
    80d8:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    80dc:	dd 1c 24             	fstpl  (%esp)
    80df:	dd 05 a0 cf 00 00    	fldl   0xcfa0
    80e5:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    80e9:	dd 1c 24             	fstpl  (%esp)
    80ec:	e8 5d bf ff ff       	call   404e <pow>
    80f1:	83 c4 10             	add    $0x10,%esp
    80f4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    80f7:	89 d0                	mov    %edx,%eax
    80f9:	c1 e0 03             	shl    $0x3,%eax
    80fc:	01 d0                	add    %edx,%eax
    80fe:	c1 e0 04             	shl    $0x4,%eax
    8101:	89 c2                	mov    %eax,%edx
    8103:	8b 45 0c             	mov    0xc(%ebp),%eax
    8106:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8109:	8b 55 f0             	mov    -0x10(%ebp),%edx
    810c:	89 d0                	mov    %edx,%eax
    810e:	c1 e0 03             	shl    $0x3,%eax
    8111:	01 d0                	add    %edx,%eax
    8113:	c1 e0 04             	shl    $0x4,%eax
    8116:	89 c2                	mov    %eax,%edx
    8118:	8b 45 0c             	mov    0xc(%ebp),%eax
    811b:	01 c2                	add    %eax,%edx
    811d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8120:	dd 04 c2             	fldl   (%edx,%eax,8)
    8123:	de c9                	fmulp  %st,%st(1)
    8125:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8128:	dd 1c c1             	fstpl  (%ecx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    812b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    812e:	89 d0                	mov    %edx,%eax
    8130:	c1 e0 03             	shl    $0x3,%eax
    8133:	01 d0                	add    %edx,%eax
    8135:	c1 e0 03             	shl    $0x3,%eax
    8138:	89 c2                	mov    %eax,%edx
    813a:	8b 45 08             	mov    0x8(%ebp),%eax
    813d:	01 c2                	add    %eax,%edx
    813f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8142:	8b 04 82             	mov    (%edx,%eax,4),%eax
    8145:	c1 e8 1f             	shr    $0x1f,%eax
    8148:	0f b6 c0             	movzbl %al,%eax
    814b:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    814e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8151:	89 d0                	mov    %edx,%eax
    8153:	c1 e0 03             	shl    $0x3,%eax
    8156:	01 d0                	add    %edx,%eax
    8158:	c1 e0 03             	shl    $0x3,%eax
    815b:	89 c2                	mov    %eax,%edx
    815d:	8b 45 08             	mov    0x8(%ebp),%eax
    8160:	01 c2                	add    %eax,%edx
    8162:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8165:	8b 04 82             	mov    (%edx,%eax,4),%eax
    8168:	83 ec 0c             	sub    $0xc,%esp
    816b:	50                   	push   %eax
    816c:	e8 c7 bd ff ff       	call   3f38 <abs>
    8171:	83 c4 10             	add    $0x10,%esp
    8174:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8177:	db 45 c8             	fildl  -0x38(%ebp)
    817a:	dd 05 b8 cf 00 00    	fldl   0xcfb8
    8180:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8184:	dd 1c 24             	fstpl  (%esp)
    8187:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    818b:	dd 1c 24             	fstpl  (%esp)
    818e:	e8 bb be ff ff       	call   404e <pow>
    8193:	83 c4 10             	add    $0x10,%esp
    8196:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8199:	89 d0                	mov    %edx,%eax
    819b:	c1 e0 03             	shl    $0x3,%eax
    819e:	01 d0                	add    %edx,%eax
    81a0:	c1 e0 04             	shl    $0x4,%eax
    81a3:	89 c2                	mov    %eax,%edx
    81a5:	8b 45 0c             	mov    0xc(%ebp),%eax
    81a8:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    81ab:	8b 55 f0             	mov    -0x10(%ebp),%edx
    81ae:	89 d0                	mov    %edx,%eax
    81b0:	c1 e0 03             	shl    $0x3,%eax
    81b3:	01 d0                	add    %edx,%eax
    81b5:	c1 e0 04             	shl    $0x4,%eax
    81b8:	89 c2                	mov    %eax,%edx
    81ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    81bd:	01 c2                	add    %eax,%edx
    81bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    81c2:	dd 04 c2             	fldl   (%edx,%eax,8)
    81c5:	de c9                	fmulp  %st,%st(1)
    81c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    81ca:	dd 1c c1             	fstpl  (%ecx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    81cd:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    81d1:	74 37                	je     820a <III_dequantize_sample+0x72e>
    81d3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    81d6:	89 d0                	mov    %edx,%eax
    81d8:	c1 e0 03             	shl    $0x3,%eax
    81db:	01 d0                	add    %edx,%eax
    81dd:	c1 e0 04             	shl    $0x4,%eax
    81e0:	89 c2                	mov    %eax,%edx
    81e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    81e5:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    81e8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    81eb:	89 d0                	mov    %edx,%eax
    81ed:	c1 e0 03             	shl    $0x3,%eax
    81f0:	01 d0                	add    %edx,%eax
    81f2:	c1 e0 04             	shl    $0x4,%eax
    81f5:	89 c2                	mov    %eax,%edx
    81f7:	8b 45 0c             	mov    0xc(%ebp),%eax
    81fa:	01 c2                	add    %eax,%edx
    81fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    81ff:	dd 04 c2             	fldl   (%edx,%eax,8)
    8202:	d9 e0                	fchs   
    8204:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8207:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    820a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    820e:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    8212:	0f 8e 86 f9 ff ff    	jle    7b9e <III_dequantize_sample+0xc2>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    8218:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    821c:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    8220:	0f 8e 6c f9 ff ff    	jle    7b92 <III_dequantize_sample+0xb6>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    8226:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    8229:	c9                   	leave  
    822a:	c3                   	ret    

0000822b <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    822b:	55                   	push   %ebp
    822c:	89 e5                	mov    %esp,%ebp
    822e:	57                   	push   %edi
    822f:	56                   	push   %esi
    8230:	53                   	push   %ebx
    8231:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    8234:	8b 45 14             	mov    0x14(%ebp),%eax
    8237:	8b 00                	mov    (%eax),%eax
    8239:	8b 40 10             	mov    0x10(%eax),%eax
    823c:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    823f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    8246:	eb 33                	jmp    827b <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    8248:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    824f:	eb 20                	jmp    8271 <III_reorder+0x46>
         ro[sb][ss] = 0;
    8251:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8254:	89 d0                	mov    %edx,%eax
    8256:	c1 e0 03             	shl    $0x3,%eax
    8259:	01 d0                	add    %edx,%eax
    825b:	c1 e0 04             	shl    $0x4,%eax
    825e:	89 c2                	mov    %eax,%edx
    8260:	8b 45 0c             	mov    0xc(%ebp),%eax
    8263:	01 c2                	add    %eax,%edx
    8265:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8268:	d9 ee                	fldz   
    826a:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    826d:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8271:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    8275:	7e da                	jle    8251 <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    8277:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    827b:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    827f:	7e c7                	jle    8248 <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    8281:	8b 45 10             	mov    0x10(%ebp),%eax
    8284:	8b 40 10             	mov    0x10(%eax),%eax
    8287:	85 c0                	test   %eax,%eax
    8289:	0f 84 b8 03 00 00    	je     8647 <III_reorder+0x41c>
    828f:	8b 45 10             	mov    0x10(%ebp),%eax
    8292:	8b 40 14             	mov    0x14(%eax),%eax
    8295:	83 f8 02             	cmp    $0x2,%eax
    8298:	0f 85 a9 03 00 00    	jne    8647 <III_reorder+0x41c>
      if (gr_info->mixed_block_flag) {
    829e:	8b 45 10             	mov    0x10(%ebp),%eax
    82a1:	8b 40 18             	mov    0x18(%eax),%eax
    82a4:	85 c0                	test   %eax,%eax
    82a6:	0f 84 06 02 00 00    	je     84b2 <III_reorder+0x287>
         for (sb=0 ; sb < 2 ; sb++)
    82ac:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    82b3:	eb 4c                	jmp    8301 <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    82b5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    82bc:	eb 39                	jmp    82f7 <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    82be:	8b 55 e0             	mov    -0x20(%ebp),%edx
    82c1:	89 d0                	mov    %edx,%eax
    82c3:	c1 e0 03             	shl    $0x3,%eax
    82c6:	01 d0                	add    %edx,%eax
    82c8:	c1 e0 04             	shl    $0x4,%eax
    82cb:	89 c2                	mov    %eax,%edx
    82cd:	8b 45 0c             	mov    0xc(%ebp),%eax
    82d0:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    82d3:	8b 55 e0             	mov    -0x20(%ebp),%edx
    82d6:	89 d0                	mov    %edx,%eax
    82d8:	c1 e0 03             	shl    $0x3,%eax
    82db:	01 d0                	add    %edx,%eax
    82dd:	c1 e0 04             	shl    $0x4,%eax
    82e0:	89 c2                	mov    %eax,%edx
    82e2:	8b 45 08             	mov    0x8(%ebp),%eax
    82e5:	01 c2                	add    %eax,%edx
    82e7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    82ea:	dd 04 c2             	fldl   (%edx,%eax,8)
    82ed:	8b 45 dc             	mov    -0x24(%ebp),%eax
    82f0:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    82f3:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    82f7:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    82fb:	7e c1                	jle    82be <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    82fd:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8301:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    8305:	7e ae                	jle    82b5 <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    8307:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    830e:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8311:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8317:	83 c0 5c             	add    $0x5c,%eax
    831a:	05 00 e9 00 00       	add    $0xe900,%eax
    831f:	8b 40 0c             	mov    0xc(%eax),%eax
    8322:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    8325:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8328:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    832e:	83 c0 60             	add    $0x60,%eax
    8331:	05 00 e9 00 00       	add    $0xe900,%eax
    8336:	8b 40 0c             	mov    0xc(%eax),%eax
    8339:	2b 45 e8             	sub    -0x18(%ebp),%eax
    833c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    833f:	e9 5f 01 00 00       	jmp    84a3 <III_reorder+0x278>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8344:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    834b:	e9 fd 00 00 00       	jmp    844d <III_reorder+0x222>
                  for(freq=0;freq<sfb_lines;freq++) {
    8350:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    8357:	e9 e1 00 00 00       	jmp    843d <III_reorder+0x212>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    835c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    835f:	89 d0                	mov    %edx,%eax
    8361:	01 c0                	add    %eax,%eax
    8363:	01 c2                	add    %eax,%edx
    8365:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8368:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    836c:	01 c2                	add    %eax,%edx
    836e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8371:	01 d0                	add    %edx,%eax
    8373:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    8376:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8379:	89 d0                	mov    %edx,%eax
    837b:	01 c0                	add    %eax,%eax
    837d:	01 c2                	add    %eax,%edx
    837f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8382:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8385:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    8388:	89 d0                	mov    %edx,%eax
    838a:	01 c0                	add    %eax,%eax
    838c:	01 d0                	add    %edx,%eax
    838e:	01 c8                	add    %ecx,%eax
    8390:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8393:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    8396:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    839b:	89 c8                	mov    %ecx,%eax
    839d:	f7 ea                	imul   %edx
    839f:	c1 fa 02             	sar    $0x2,%edx
    83a2:	89 c8                	mov    %ecx,%eax
    83a4:	c1 f8 1f             	sar    $0x1f,%eax
    83a7:	29 c2                	sub    %eax,%edx
    83a9:	89 d0                	mov    %edx,%eax
    83ab:	89 c2                	mov    %eax,%edx
    83ad:	89 d0                	mov    %edx,%eax
    83af:	c1 e0 03             	shl    $0x3,%eax
    83b2:	01 d0                	add    %edx,%eax
    83b4:	c1 e0 04             	shl    $0x4,%eax
    83b7:	89 c2                	mov    %eax,%edx
    83b9:	8b 45 0c             	mov    0xc(%ebp),%eax
    83bc:	8d 34 02             	lea    (%edx,%eax,1),%esi
    83bf:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    83c2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    83c7:	89 d8                	mov    %ebx,%eax
    83c9:	f7 ea                	imul   %edx
    83cb:	c1 fa 02             	sar    $0x2,%edx
    83ce:	89 d8                	mov    %ebx,%eax
    83d0:	c1 f8 1f             	sar    $0x1f,%eax
    83d3:	89 d1                	mov    %edx,%ecx
    83d5:	29 c1                	sub    %eax,%ecx
    83d7:	89 c8                	mov    %ecx,%eax
    83d9:	c1 e0 03             	shl    $0x3,%eax
    83dc:	01 c8                	add    %ecx,%eax
    83de:	01 c0                	add    %eax,%eax
    83e0:	29 c3                	sub    %eax,%ebx
    83e2:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    83e4:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    83e7:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    83ec:	89 d8                	mov    %ebx,%eax
    83ee:	f7 ea                	imul   %edx
    83f0:	c1 fa 02             	sar    $0x2,%edx
    83f3:	89 d8                	mov    %ebx,%eax
    83f5:	c1 f8 1f             	sar    $0x1f,%eax
    83f8:	29 c2                	sub    %eax,%edx
    83fa:	89 d0                	mov    %edx,%eax
    83fc:	89 c2                	mov    %eax,%edx
    83fe:	89 d0                	mov    %edx,%eax
    8400:	c1 e0 03             	shl    $0x3,%eax
    8403:	01 d0                	add    %edx,%eax
    8405:	c1 e0 04             	shl    $0x4,%eax
    8408:	89 c2                	mov    %eax,%edx
    840a:	8b 45 08             	mov    0x8(%ebp),%eax
    840d:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    8410:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8413:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8418:	89 d8                	mov    %ebx,%eax
    841a:	f7 ea                	imul   %edx
    841c:	c1 fa 02             	sar    $0x2,%edx
    841f:	89 d8                	mov    %ebx,%eax
    8421:	c1 f8 1f             	sar    $0x1f,%eax
    8424:	29 c2                	sub    %eax,%edx
    8426:	89 d0                	mov    %edx,%eax
    8428:	c1 e0 03             	shl    $0x3,%eax
    842b:	01 d0                	add    %edx,%eax
    842d:	01 c0                	add    %eax,%eax
    842f:	29 c3                	sub    %eax,%ebx
    8431:	89 da                	mov    %ebx,%edx
    8433:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8436:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    8439:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    843d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8440:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    8443:	0f 8c 13 ff ff ff    	jl     835c <III_reorder+0x131>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8449:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    844d:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    8451:	0f 8e f9 fe ff ff    	jle    8350 <III_reorder+0x125>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    8457:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    845b:	8b 55 d0             	mov    -0x30(%ebp),%edx
    845e:	89 d0                	mov    %edx,%eax
    8460:	c1 e0 03             	shl    $0x3,%eax
    8463:	01 d0                	add    %edx,%eax
    8465:	c1 e0 02             	shl    $0x2,%eax
    8468:	01 d0                	add    %edx,%eax
    846a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    846d:	01 d0                	add    %edx,%eax
    846f:	83 c0 14             	add    $0x14,%eax
    8472:	8b 04 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%eax
    8479:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    847c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    847f:	8d 48 01             	lea    0x1(%eax),%ecx
    8482:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8485:	89 d0                	mov    %edx,%eax
    8487:	c1 e0 03             	shl    $0x3,%eax
    848a:	01 d0                	add    %edx,%eax
    848c:	c1 e0 02             	shl    $0x2,%eax
    848f:	01 d0                	add    %edx,%eax
    8491:	01 c8                	add    %ecx,%eax
    8493:	83 c0 14             	add    $0x14,%eax
    8496:	8b 04 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%eax
    849d:	2b 45 e8             	sub    -0x18(%ebp),%eax
    84a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    84a3:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    84a7:	0f 8e 97 fe ff ff    	jle    8344 <III_reorder+0x119>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    84ad:	e9 f0 01 00 00       	jmp    86a2 <III_reorder+0x477>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    84b2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    84b9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    84c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    84c3:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    84c9:	83 c0 54             	add    $0x54,%eax
    84cc:	05 00 e9 00 00       	add    $0xe900,%eax
    84d1:	8b 40 0c             	mov    0xc(%eax),%eax
    84d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    84d7:	e9 5f 01 00 00       	jmp    863b <III_reorder+0x410>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    84dc:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    84e3:	e9 fd 00 00 00       	jmp    85e5 <III_reorder+0x3ba>
                  for(freq=0;freq<sfb_lines;freq++) {
    84e8:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    84ef:	e9 e1 00 00 00       	jmp    85d5 <III_reorder+0x3aa>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    84f4:	8b 55 e8             	mov    -0x18(%ebp),%edx
    84f7:	89 d0                	mov    %edx,%eax
    84f9:	01 c0                	add    %eax,%eax
    84fb:	01 c2                	add    %eax,%edx
    84fd:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8500:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    8504:	01 c2                	add    %eax,%edx
    8506:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8509:	01 d0                	add    %edx,%eax
    850b:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    850e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8511:	89 d0                	mov    %edx,%eax
    8513:	01 c0                	add    %eax,%eax
    8515:	01 c2                	add    %eax,%edx
    8517:	8b 45 d8             	mov    -0x28(%ebp),%eax
    851a:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    851d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    8520:	89 d0                	mov    %edx,%eax
    8522:	01 c0                	add    %eax,%eax
    8524:	01 d0                	add    %edx,%eax
    8526:	01 c8                	add    %ecx,%eax
    8528:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    852b:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    852e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8533:	89 c8                	mov    %ecx,%eax
    8535:	f7 ea                	imul   %edx
    8537:	c1 fa 02             	sar    $0x2,%edx
    853a:	89 c8                	mov    %ecx,%eax
    853c:	c1 f8 1f             	sar    $0x1f,%eax
    853f:	29 c2                	sub    %eax,%edx
    8541:	89 d0                	mov    %edx,%eax
    8543:	89 c2                	mov    %eax,%edx
    8545:	89 d0                	mov    %edx,%eax
    8547:	c1 e0 03             	shl    $0x3,%eax
    854a:	01 d0                	add    %edx,%eax
    854c:	c1 e0 04             	shl    $0x4,%eax
    854f:	89 c2                	mov    %eax,%edx
    8551:	8b 45 0c             	mov    0xc(%ebp),%eax
    8554:	8d 34 02             	lea    (%edx,%eax,1),%esi
    8557:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    855a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    855f:	89 d8                	mov    %ebx,%eax
    8561:	f7 ea                	imul   %edx
    8563:	c1 fa 02             	sar    $0x2,%edx
    8566:	89 d8                	mov    %ebx,%eax
    8568:	c1 f8 1f             	sar    $0x1f,%eax
    856b:	89 d1                	mov    %edx,%ecx
    856d:	29 c1                	sub    %eax,%ecx
    856f:	89 c8                	mov    %ecx,%eax
    8571:	c1 e0 03             	shl    $0x3,%eax
    8574:	01 c8                	add    %ecx,%eax
    8576:	01 c0                	add    %eax,%eax
    8578:	29 c3                	sub    %eax,%ebx
    857a:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    857c:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    857f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8584:	89 d8                	mov    %ebx,%eax
    8586:	f7 ea                	imul   %edx
    8588:	c1 fa 02             	sar    $0x2,%edx
    858b:	89 d8                	mov    %ebx,%eax
    858d:	c1 f8 1f             	sar    $0x1f,%eax
    8590:	29 c2                	sub    %eax,%edx
    8592:	89 d0                	mov    %edx,%eax
    8594:	89 c2                	mov    %eax,%edx
    8596:	89 d0                	mov    %edx,%eax
    8598:	c1 e0 03             	shl    $0x3,%eax
    859b:	01 d0                	add    %edx,%eax
    859d:	c1 e0 04             	shl    $0x4,%eax
    85a0:	89 c2                	mov    %eax,%edx
    85a2:	8b 45 08             	mov    0x8(%ebp),%eax
    85a5:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    85a8:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    85ab:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    85b0:	89 d8                	mov    %ebx,%eax
    85b2:	f7 ea                	imul   %edx
    85b4:	c1 fa 02             	sar    $0x2,%edx
    85b7:	89 d8                	mov    %ebx,%eax
    85b9:	c1 f8 1f             	sar    $0x1f,%eax
    85bc:	29 c2                	sub    %eax,%edx
    85be:	89 d0                	mov    %edx,%eax
    85c0:	c1 e0 03             	shl    $0x3,%eax
    85c3:	01 d0                	add    %edx,%eax
    85c5:	01 c0                	add    %eax,%eax
    85c7:	29 c3                	sub    %eax,%ebx
    85c9:	89 da                	mov    %ebx,%edx
    85cb:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    85ce:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    85d1:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    85d5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    85d8:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    85db:	0f 8c 13 ff ff ff    	jl     84f4 <III_reorder+0x2c9>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    85e1:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    85e5:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    85e9:	0f 8e f9 fe ff ff    	jle    84e8 <III_reorder+0x2bd>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    85ef:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    85f3:	8b 55 d0             	mov    -0x30(%ebp),%edx
    85f6:	89 d0                	mov    %edx,%eax
    85f8:	c1 e0 03             	shl    $0x3,%eax
    85fb:	01 d0                	add    %edx,%eax
    85fd:	c1 e0 02             	shl    $0x2,%eax
    8600:	01 d0                	add    %edx,%eax
    8602:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8605:	01 d0                	add    %edx,%eax
    8607:	83 c0 14             	add    $0x14,%eax
    860a:	8b 04 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%eax
    8611:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    8614:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8617:	8d 48 01             	lea    0x1(%eax),%ecx
    861a:	8b 55 d0             	mov    -0x30(%ebp),%edx
    861d:	89 d0                	mov    %edx,%eax
    861f:	c1 e0 03             	shl    $0x3,%eax
    8622:	01 d0                	add    %edx,%eax
    8624:	c1 e0 02             	shl    $0x2,%eax
    8627:	01 d0                	add    %edx,%eax
    8629:	01 c8                	add    %ecx,%eax
    862b:	83 c0 14             	add    $0x14,%eax
    862e:	8b 04 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%eax
    8635:	2b 45 e8             	sub    -0x18(%ebp),%eax
    8638:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    863b:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    863f:	0f 8e 97 fe ff ff    	jle    84dc <III_reorder+0x2b1>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    8645:	eb 5b                	jmp    86a2 <III_reorder+0x477>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    8647:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    864e:	eb 4c                	jmp    869c <III_reorder+0x471>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    8650:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    8657:	eb 39                	jmp    8692 <III_reorder+0x467>
            ro[sb][ss] = xr[sb][ss];
    8659:	8b 55 e0             	mov    -0x20(%ebp),%edx
    865c:	89 d0                	mov    %edx,%eax
    865e:	c1 e0 03             	shl    $0x3,%eax
    8661:	01 d0                	add    %edx,%eax
    8663:	c1 e0 04             	shl    $0x4,%eax
    8666:	89 c2                	mov    %eax,%edx
    8668:	8b 45 0c             	mov    0xc(%ebp),%eax
    866b:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    866e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8671:	89 d0                	mov    %edx,%eax
    8673:	c1 e0 03             	shl    $0x3,%eax
    8676:	01 d0                	add    %edx,%eax
    8678:	c1 e0 04             	shl    $0x4,%eax
    867b:	89 c2                	mov    %eax,%edx
    867d:	8b 45 08             	mov    0x8(%ebp),%eax
    8680:	01 c2                	add    %eax,%edx
    8682:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8685:	dd 04 c2             	fldl   (%edx,%eax,8)
    8688:	8b 45 dc             	mov    -0x24(%ebp),%eax
    868b:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    868e:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8692:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    8696:	7e c1                	jle    8659 <III_reorder+0x42e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    8698:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    869c:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    86a0:	7e ae                	jle    8650 <III_reorder+0x425>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    86a2:	83 c4 34             	add    $0x34,%esp
    86a5:	5b                   	pop    %ebx
    86a6:	5e                   	pop    %esi
    86a7:	5f                   	pop    %edi
    86a8:	5d                   	pop    %ebp
    86a9:	c3                   	ret    

000086aa <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    86aa:	55                   	push   %ebp
    86ab:	89 e5                	mov    %esp,%ebp
    86ad:	56                   	push   %esi
    86ae:	53                   	push   %ebx
    86af:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    86b5:	8b 45 18             	mov    0x18(%ebp),%eax
    86b8:	8b 00                	mov    (%eax),%eax
    86ba:	8b 40 10             	mov    0x10(%eax),%eax
    86bd:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    86c0:	8b 45 18             	mov    0x18(%ebp),%eax
    86c3:	8b 40 08             	mov    0x8(%eax),%eax
    86c6:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    86c9:	8b 45 18             	mov    0x18(%ebp),%eax
    86cc:	8b 00                	mov    (%eax),%eax
    86ce:	8b 40 1c             	mov    0x1c(%eax),%eax
    86d1:	83 f8 01             	cmp    $0x1,%eax
    86d4:	75 16                	jne    86ec <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    86d6:	8b 45 18             	mov    0x18(%ebp),%eax
    86d9:	8b 00                	mov    (%eax),%eax
    86db:	8b 40 20             	mov    0x20(%eax),%eax
    86de:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    86e1:	85 c0                	test   %eax,%eax
    86e3:	74 07                	je     86ec <III_stereo+0x42>
    86e5:	b8 01 00 00 00       	mov    $0x1,%eax
    86ea:	eb 05                	jmp    86f1 <III_stereo+0x47>
    86ec:	b8 00 00 00 00       	mov    $0x0,%eax
    86f1:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    86f4:	8b 45 18             	mov    0x18(%ebp),%eax
    86f7:	8b 00                	mov    (%eax),%eax
    86f9:	8b 40 1c             	mov    0x1c(%eax),%eax
    86fc:	83 f8 01             	cmp    $0x1,%eax
    86ff:	75 16                	jne    8717 <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    8701:	8b 45 18             	mov    0x18(%ebp),%eax
    8704:	8b 00                	mov    (%eax),%eax
    8706:	8b 40 20             	mov    0x20(%eax),%eax
    8709:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    870c:	85 c0                	test   %eax,%eax
    870e:	74 07                	je     8717 <III_stereo+0x6d>
    8710:	b8 01 00 00 00       	mov    $0x1,%eax
    8715:	eb 05                	jmp    871c <III_stereo+0x72>
    8717:	b8 00 00 00 00       	mov    $0x0,%eax
    871c:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    871f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8726:	eb 12                	jmp    873a <III_stereo+0x90>
      is_pos[i] = 7;
    8728:	8b 45 f0             	mov    -0x10(%ebp),%eax
    872b:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    8732:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    8736:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    873a:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    8741:	7e e5                	jle    8728 <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    8743:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    8747:	0f 85 65 0a 00 00    	jne    91b2 <III_stereo+0xb08>
    874d:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    8751:	0f 84 5b 0a 00 00    	je     91b2 <III_stereo+0xb08>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    8757:	8b 45 14             	mov    0x14(%ebp),%eax
    875a:	8b 40 10             	mov    0x10(%eax),%eax
    875d:	85 c0                	test   %eax,%eax
    875f:	0f 84 4d 08 00 00    	je     8fb2 <III_stereo+0x908>
    8765:	8b 45 14             	mov    0x14(%ebp),%eax
    8768:	8b 40 14             	mov    0x14(%eax),%eax
    876b:	83 f8 02             	cmp    $0x2,%eax
    876e:	0f 85 3e 08 00 00    	jne    8fb2 <III_stereo+0x908>
      {  if( gr_info->mixed_block_flag )
    8774:	8b 45 14             	mov    0x14(%ebp),%eax
    8777:	8b 40 18             	mov    0x18(%eax),%eax
    877a:	85 c0                	test   %eax,%eax
    877c:	0f 84 f1 04 00 00    	je     8c73 <III_stereo+0x5c9>
         {  int max_sfb = 0;
    8782:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    8789:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8790:	e9 32 03 00 00       	jmp    8ac7 <III_stereo+0x41d>
            {  int sfbcnt;
               sfbcnt = 2;
    8795:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    879c:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    87a3:	e9 0f 01 00 00       	jmp    88b7 <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    87a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    87ab:	8d 48 01             	lea    0x1(%eax),%ecx
    87ae:	8b 55 c8             	mov    -0x38(%ebp),%edx
    87b1:	89 d0                	mov    %edx,%eax
    87b3:	c1 e0 03             	shl    $0x3,%eax
    87b6:	01 d0                	add    %edx,%eax
    87b8:	c1 e0 02             	shl    $0x2,%eax
    87bb:	01 d0                	add    %edx,%eax
    87bd:	01 c8                	add    %ecx,%eax
    87bf:	83 c0 14             	add    $0x14,%eax
    87c2:	8b 0c 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%ecx
    87c9:	8b 55 c8             	mov    -0x38(%ebp),%edx
    87cc:	89 d0                	mov    %edx,%eax
    87ce:	c1 e0 03             	shl    $0x3,%eax
    87d1:	01 d0                	add    %edx,%eax
    87d3:	c1 e0 02             	shl    $0x2,%eax
    87d6:	01 d0                	add    %edx,%eax
    87d8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    87db:	01 d0                	add    %edx,%eax
    87dd:	83 c0 14             	add    $0x14,%eax
    87e0:	8b 04 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%eax
    87e7:	29 c1                	sub    %eax,%ecx
    87e9:	89 c8                	mov    %ecx,%eax
    87eb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    87ee:	8b 55 c8             	mov    -0x38(%ebp),%edx
    87f1:	89 d0                	mov    %edx,%eax
    87f3:	c1 e0 03             	shl    $0x3,%eax
    87f6:	01 d0                	add    %edx,%eax
    87f8:	c1 e0 02             	shl    $0x2,%eax
    87fb:	01 d0                	add    %edx,%eax
    87fd:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8800:	01 d0                	add    %edx,%eax
    8802:	83 c0 14             	add    $0x14,%eax
    8805:	8b 14 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%edx
    880c:	89 d0                	mov    %edx,%eax
    880e:	01 c0                	add    %eax,%eax
    8810:	01 c2                	add    %eax,%edx
    8812:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8815:	83 c0 01             	add    $0x1,%eax
    8818:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    881c:	01 d0                	add    %edx,%eax
    881e:	83 e8 01             	sub    $0x1,%eax
    8821:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    8824:	e9 80 00 00 00       	jmp    88a9 <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    8829:	8b 45 08             	mov    0x8(%ebp),%eax
    882c:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    8832:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    8835:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    883a:	89 c8                	mov    %ecx,%eax
    883c:	f7 ea                	imul   %edx
    883e:	c1 fa 02             	sar    $0x2,%edx
    8841:	89 c8                	mov    %ecx,%eax
    8843:	c1 f8 1f             	sar    $0x1f,%eax
    8846:	89 d3                	mov    %edx,%ebx
    8848:	29 c3                	sub    %eax,%ebx
    884a:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    884d:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8852:	89 c8                	mov    %ecx,%eax
    8854:	f7 ea                	imul   %edx
    8856:	c1 fa 02             	sar    $0x2,%edx
    8859:	89 c8                	mov    %ecx,%eax
    885b:	c1 f8 1f             	sar    $0x1f,%eax
    885e:	29 c2                	sub    %eax,%edx
    8860:	89 d0                	mov    %edx,%eax
    8862:	c1 e0 03             	shl    $0x3,%eax
    8865:	01 d0                	add    %edx,%eax
    8867:	01 c0                	add    %eax,%eax
    8869:	29 c1                	sub    %eax,%ecx
    886b:	89 ca                	mov    %ecx,%edx
    886d:	89 d8                	mov    %ebx,%eax
    886f:	c1 e0 03             	shl    $0x3,%eax
    8872:	01 d8                	add    %ebx,%eax
    8874:	01 c0                	add    %eax,%eax
    8876:	01 d0                	add    %edx,%eax
    8878:	dd 04 c6             	fldl   (%esi,%eax,8)
    887b:	d9 ee                	fldz   
    887d:	df e9                	fucomip %st(1),%st
    887f:	7a 0a                	jp     888b <III_stereo+0x1e1>
    8881:	d9 ee                	fldz   
    8883:	df e9                	fucomip %st(1),%st
    8885:	dd d8                	fstp   %st(0)
    8887:	74 18                	je     88a1 <III_stereo+0x1f7>
    8889:	eb 02                	jmp    888d <III_stereo+0x1e3>
    888b:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    888d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8890:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    8893:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    889a:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    88a1:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    88a5:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    88a9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    88ad:	0f 8f 76 ff ff ff    	jg     8829 <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    88b3:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    88b7:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    88bb:	0f 8f e7 fe ff ff    	jg     87a8 <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    88c1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    88c4:	83 c0 01             	add    $0x1,%eax
    88c7:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    88ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88cd:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    88d0:	7e 06                	jle    88d8 <III_stereo+0x22e>
                  max_sfb = sfb;
    88d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88d5:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    88d8:	e9 fa 00 00 00       	jmp    89d7 <III_stereo+0x32d>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    88dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88e0:	8d 48 01             	lea    0x1(%eax),%ecx
    88e3:	8b 55 c8             	mov    -0x38(%ebp),%edx
    88e6:	89 d0                	mov    %edx,%eax
    88e8:	c1 e0 03             	shl    $0x3,%eax
    88eb:	01 d0                	add    %edx,%eax
    88ed:	c1 e0 02             	shl    $0x2,%eax
    88f0:	01 d0                	add    %edx,%eax
    88f2:	01 c8                	add    %ecx,%eax
    88f4:	83 c0 14             	add    $0x14,%eax
    88f7:	8b 0c 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%ecx
    88fe:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8901:	89 d0                	mov    %edx,%eax
    8903:	c1 e0 03             	shl    $0x3,%eax
    8906:	01 d0                	add    %edx,%eax
    8908:	c1 e0 02             	shl    $0x2,%eax
    890b:	01 d0                	add    %edx,%eax
    890d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8910:	01 d0                	add    %edx,%eax
    8912:	83 c0 14             	add    $0x14,%eax
    8915:	8b 04 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%eax
    891c:	29 c1                	sub    %eax,%ecx
    891e:	89 c8                	mov    %ecx,%eax
    8920:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    8923:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8926:	89 d0                	mov    %edx,%eax
    8928:	c1 e0 03             	shl    $0x3,%eax
    892b:	01 d0                	add    %edx,%eax
    892d:	c1 e0 02             	shl    $0x2,%eax
    8930:	01 d0                	add    %edx,%eax
    8932:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8935:	01 d0                	add    %edx,%eax
    8937:	83 c0 14             	add    $0x14,%eax
    893a:	8b 14 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%edx
    8941:	89 d0                	mov    %edx,%eax
    8943:	01 c0                	add    %eax,%eax
    8945:	01 c2                	add    %eax,%edx
    8947:	8b 45 ec             	mov    -0x14(%ebp),%eax
    894a:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    894e:	01 d0                	add    %edx,%eax
    8950:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    8953:	eb 78                	jmp    89cd <III_stereo+0x323>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    8955:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8958:	8b 55 ec             	mov    -0x14(%ebp),%edx
    895b:	89 d0                	mov    %edx,%eax
    895d:	01 c0                	add    %eax,%eax
    895f:	01 d0                	add    %edx,%eax
    8961:	c1 e0 02             	shl    $0x2,%eax
    8964:	01 d0                	add    %edx,%eax
    8966:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8969:	01 d0                	add    %edx,%eax
    896b:	83 c0 52             	add    $0x52,%eax
    896e:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    8972:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8975:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    897c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    897f:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8986:	83 f8 07             	cmp    $0x7,%eax
    8989:	74 3a                	je     89c5 <III_stereo+0x31b>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    898b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    898e:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8995:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    899b:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    89a1:	dd 05 c0 cf 00 00    	fldl   0xcfc0
    89a7:	de c9                	fmulp  %st,%st(1)
    89a9:	83 ec 08             	sub    $0x8,%esp
    89ac:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    89b0:	dd 1c 24             	fstpl  (%esp)
    89b3:	e8 60 b6 ff ff       	call   4018 <tan>
    89b8:	83 c4 10             	add    $0x10,%esp
    89bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    89be:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    89c5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    89c9:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    89cd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    89d1:	7f 82                	jg     8955 <III_stereo+0x2ab>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    89d3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    89d7:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    89db:	0f 8e fc fe ff ff    	jle    88dd <III_stereo+0x233>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    89e1:	8b 45 c8             	mov    -0x38(%ebp),%eax
    89e4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    89ea:	83 c0 7c             	add    $0x7c,%eax
    89ed:	05 00 e9 00 00       	add    $0xe900,%eax
    89f2:	8b 50 0c             	mov    0xc(%eax),%edx
    89f5:	8b 45 c8             	mov    -0x38(%ebp),%eax
    89f8:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    89fe:	83 c0 78             	add    $0x78,%eax
    8a01:	05 00 e9 00 00       	add    $0xe900,%eax
    8a06:	8b 40 0c             	mov    0xc(%eax),%eax
    8a09:	29 c2                	sub    %eax,%edx
    8a0b:	89 d0                	mov    %edx,%eax
    8a0d:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    8a10:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8a13:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8a19:	83 c0 78             	add    $0x78,%eax
    8a1c:	05 00 e9 00 00       	add    $0xe900,%eax
    8a21:	8b 50 0c             	mov    0xc(%eax),%edx
    8a24:	89 d0                	mov    %edx,%eax
    8a26:	01 c0                	add    %eax,%eax
    8a28:	01 c2                	add    %eax,%edx
    8a2a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8a2d:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8a31:	01 d0                	add    %edx,%eax
    8a33:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    8a36:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8a39:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8a3f:	83 e8 80             	sub    $0xffffff80,%eax
    8a42:	05 00 e9 00 00       	add    $0xe900,%eax
    8a47:	8b 50 0c             	mov    0xc(%eax),%edx
    8a4a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8a4d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8a53:	83 c0 7c             	add    $0x7c,%eax
    8a56:	05 00 e9 00 00       	add    $0xe900,%eax
    8a5b:	8b 40 0c             	mov    0xc(%eax),%eax
    8a5e:	29 c2                	sub    %eax,%edx
    8a60:	89 d0                	mov    %edx,%eax
    8a62:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    8a65:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8a68:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8a6e:	83 c0 7c             	add    $0x7c,%eax
    8a71:	05 00 e9 00 00       	add    $0xe900,%eax
    8a76:	8b 50 0c             	mov    0xc(%eax),%edx
    8a79:	89 d0                	mov    %edx,%eax
    8a7b:	01 c0                	add    %eax,%eax
    8a7d:	01 c2                	add    %eax,%edx
    8a7f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8a82:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8a86:	01 d0                	add    %edx,%eax
    8a88:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    8a8b:	eb 30                	jmp    8abd <III_stereo+0x413>
               {  is_pos[i] = is_pos[sfb];
    8a8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a90:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    8a97:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8a9a:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    8aa1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8aa4:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    8aab:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8aae:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    8ab5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    8ab9:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    8abd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    8ac1:	7f ca                	jg     8a8d <III_stereo+0x3e3>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    8ac3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8ac7:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8acb:	0f 8e c4 fc ff ff    	jle    8795 <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    8ad1:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    8ad5:	0f 8f 93 01 00 00    	jg     8c6e <III_stereo+0x5c4>
             {  i = 2;
    8adb:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    8ae2:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    8ae9:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    8af0:	eb 63                	jmp    8b55 <III_stereo+0x4ab>
                {  if ( xr[1][i][ss] != 0.0 )
    8af2:	8b 45 08             	mov    0x8(%ebp),%eax
    8af5:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    8afb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8afe:	89 d0                	mov    %edx,%eax
    8b00:	c1 e0 03             	shl    $0x3,%eax
    8b03:	01 d0                	add    %edx,%eax
    8b05:	01 c0                	add    %eax,%eax
    8b07:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8b0a:	01 d0                	add    %edx,%eax
    8b0c:	dd 04 c1             	fldl   (%ecx,%eax,8)
    8b0f:	d9 ee                	fldz   
    8b11:	df e9                	fucomip %st(1),%st
    8b13:	7a 0a                	jp     8b1f <III_stereo+0x475>
    8b15:	d9 ee                	fldz   
    8b17:	df e9                	fucomip %st(1),%st
    8b19:	dd d8                	fstp   %st(0)
    8b1b:	74 23                	je     8b40 <III_stereo+0x496>
    8b1d:	eb 02                	jmp    8b21 <III_stereo+0x477>
    8b1f:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    8b21:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8b24:	89 d0                	mov    %edx,%eax
    8b26:	c1 e0 03             	shl    $0x3,%eax
    8b29:	01 d0                	add    %edx,%eax
    8b2b:	01 c0                	add    %eax,%eax
    8b2d:	89 c2                	mov    %eax,%edx
    8b2f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8b32:	01 d0                	add    %edx,%eax
    8b34:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    8b37:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    8b3e:	eb 15                	jmp    8b55 <III_stereo+0x4ab>
                   } else
                   {  ss--;
    8b40:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    8b44:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    8b48:	79 0b                	jns    8b55 <III_stereo+0x4ab>
                      {  i--;
    8b4a:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    8b4e:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    8b55:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    8b59:	79 97                	jns    8af2 <III_stereo+0x448>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    8b5b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    8b62:	eb 04                	jmp    8b68 <III_stereo+0x4be>
                   i++;
    8b64:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    8b68:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8b6b:	89 d0                	mov    %edx,%eax
    8b6d:	c1 e0 03             	shl    $0x3,%eax
    8b70:	01 d0                	add    %edx,%eax
    8b72:	c1 e0 02             	shl    $0x2,%eax
    8b75:	01 d0                	add    %edx,%eax
    8b77:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8b7a:	01 d0                	add    %edx,%eax
    8b7c:	8b 04 85 00 e9 00 00 	mov    0xe900(,%eax,4),%eax
    8b83:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    8b86:	7e dc                	jle    8b64 <III_stereo+0x4ba>
                   i++;
                sfb = i;
    8b88:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8b8b:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    8b8e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8b91:	89 d0                	mov    %edx,%eax
    8b93:	c1 e0 03             	shl    $0x3,%eax
    8b96:	01 d0                	add    %edx,%eax
    8b98:	c1 e0 02             	shl    $0x2,%eax
    8b9b:	01 d0                	add    %edx,%eax
    8b9d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8ba0:	01 d0                	add    %edx,%eax
    8ba2:	8b 04 85 00 e9 00 00 	mov    0xe900(,%eax,4),%eax
    8ba9:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    8bac:	e9 b3 00 00 00       	jmp    8c64 <III_stereo+0x5ba>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    8bb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8bb4:	8d 48 01             	lea    0x1(%eax),%ecx
    8bb7:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8bba:	89 d0                	mov    %edx,%eax
    8bbc:	c1 e0 03             	shl    $0x3,%eax
    8bbf:	01 d0                	add    %edx,%eax
    8bc1:	c1 e0 02             	shl    $0x2,%eax
    8bc4:	01 d0                	add    %edx,%eax
    8bc6:	01 c8                	add    %ecx,%eax
    8bc8:	8b 0c 85 00 e9 00 00 	mov    0xe900(,%eax,4),%ecx
    8bcf:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8bd2:	89 d0                	mov    %edx,%eax
    8bd4:	c1 e0 03             	shl    $0x3,%eax
    8bd7:	01 d0                	add    %edx,%eax
    8bd9:	c1 e0 02             	shl    $0x2,%eax
    8bdc:	01 d0                	add    %edx,%eax
    8bde:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8be1:	01 d0                	add    %edx,%eax
    8be3:	8b 04 85 00 e9 00 00 	mov    0xe900(,%eax,4),%eax
    8bea:	29 c1                	sub    %eax,%ecx
    8bec:	89 c8                	mov    %ecx,%eax
    8bee:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    8bf1:	eb 67                	jmp    8c5a <III_stereo+0x5b0>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    8bf3:	8b 45 10             	mov    0x10(%ebp),%eax
    8bf6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8bf9:	83 c2 3e             	add    $0x3e,%edx
    8bfc:	8b 14 90             	mov    (%eax,%edx,4),%edx
    8bff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8c02:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    8c09:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8c0c:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8c13:	83 f8 07             	cmp    $0x7,%eax
    8c16:	74 3a                	je     8c52 <III_stereo+0x5a8>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    8c18:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8c1b:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8c22:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    8c28:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    8c2e:	dd 05 c0 cf 00 00    	fldl   0xcfc0
    8c34:	de c9                	fmulp  %st,%st(1)
    8c36:	83 ec 08             	sub    $0x8,%esp
    8c39:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8c3d:	dd 1c 24             	fstpl  (%esp)
    8c40:	e8 d3 b3 ff ff       	call   4018 <tan>
    8c45:	83 c4 10             	add    $0x10,%esp
    8c48:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8c4b:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    8c52:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    8c56:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    8c5a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    8c5e:	7f 93                	jg     8bf3 <III_stereo+0x549>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    8c60:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8c64:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    8c68:	0f 8e 43 ff ff ff    	jle    8bb1 <III_stereo+0x507>
    8c6e:	e9 3a 03 00 00       	jmp    8fad <III_stereo+0x903>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    8c73:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8c7a:	e9 24 03 00 00       	jmp    8fa3 <III_stereo+0x8f9>
            {  int sfbcnt;
               sfbcnt = -1;
    8c7f:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    8c86:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    8c8d:	e9 0f 01 00 00       	jmp    8da1 <III_stereo+0x6f7>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    8c92:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8c95:	8d 48 01             	lea    0x1(%eax),%ecx
    8c98:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8c9b:	89 d0                	mov    %edx,%eax
    8c9d:	c1 e0 03             	shl    $0x3,%eax
    8ca0:	01 d0                	add    %edx,%eax
    8ca2:	c1 e0 02             	shl    $0x2,%eax
    8ca5:	01 d0                	add    %edx,%eax
    8ca7:	01 c8                	add    %ecx,%eax
    8ca9:	83 c0 14             	add    $0x14,%eax
    8cac:	8b 0c 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%ecx
    8cb3:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8cb6:	89 d0                	mov    %edx,%eax
    8cb8:	c1 e0 03             	shl    $0x3,%eax
    8cbb:	01 d0                	add    %edx,%eax
    8cbd:	c1 e0 02             	shl    $0x2,%eax
    8cc0:	01 d0                	add    %edx,%eax
    8cc2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8cc5:	01 d0                	add    %edx,%eax
    8cc7:	83 c0 14             	add    $0x14,%eax
    8cca:	8b 04 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%eax
    8cd1:	29 c1                	sub    %eax,%ecx
    8cd3:	89 c8                	mov    %ecx,%eax
    8cd5:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    8cd8:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8cdb:	89 d0                	mov    %edx,%eax
    8cdd:	c1 e0 03             	shl    $0x3,%eax
    8ce0:	01 d0                	add    %edx,%eax
    8ce2:	c1 e0 02             	shl    $0x2,%eax
    8ce5:	01 d0                	add    %edx,%eax
    8ce7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8cea:	01 d0                	add    %edx,%eax
    8cec:	83 c0 14             	add    $0x14,%eax
    8cef:	8b 14 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%edx
    8cf6:	89 d0                	mov    %edx,%eax
    8cf8:	01 c0                	add    %eax,%eax
    8cfa:	01 c2                	add    %eax,%edx
    8cfc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8cff:	83 c0 01             	add    $0x1,%eax
    8d02:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    8d06:	01 d0                	add    %edx,%eax
    8d08:	83 e8 01             	sub    $0x1,%eax
    8d0b:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    8d0e:	e9 80 00 00 00       	jmp    8d93 <III_stereo+0x6e9>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    8d13:	8b 45 08             	mov    0x8(%ebp),%eax
    8d16:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    8d1c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    8d1f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8d24:	89 c8                	mov    %ecx,%eax
    8d26:	f7 ea                	imul   %edx
    8d28:	c1 fa 02             	sar    $0x2,%edx
    8d2b:	89 c8                	mov    %ecx,%eax
    8d2d:	c1 f8 1f             	sar    $0x1f,%eax
    8d30:	89 d3                	mov    %edx,%ebx
    8d32:	29 c3                	sub    %eax,%ebx
    8d34:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    8d37:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8d3c:	89 c8                	mov    %ecx,%eax
    8d3e:	f7 ea                	imul   %edx
    8d40:	c1 fa 02             	sar    $0x2,%edx
    8d43:	89 c8                	mov    %ecx,%eax
    8d45:	c1 f8 1f             	sar    $0x1f,%eax
    8d48:	29 c2                	sub    %eax,%edx
    8d4a:	89 d0                	mov    %edx,%eax
    8d4c:	c1 e0 03             	shl    $0x3,%eax
    8d4f:	01 d0                	add    %edx,%eax
    8d51:	01 c0                	add    %eax,%eax
    8d53:	29 c1                	sub    %eax,%ecx
    8d55:	89 ca                	mov    %ecx,%edx
    8d57:	89 d8                	mov    %ebx,%eax
    8d59:	c1 e0 03             	shl    $0x3,%eax
    8d5c:	01 d8                	add    %ebx,%eax
    8d5e:	01 c0                	add    %eax,%eax
    8d60:	01 d0                	add    %edx,%eax
    8d62:	dd 04 c6             	fldl   (%esi,%eax,8)
    8d65:	d9 ee                	fldz   
    8d67:	df e9                	fucomip %st(1),%st
    8d69:	7a 0a                	jp     8d75 <III_stereo+0x6cb>
    8d6b:	d9 ee                	fldz   
    8d6d:	df e9                	fucomip %st(1),%st
    8d6f:	dd d8                	fstp   %st(0)
    8d71:	74 18                	je     8d8b <III_stereo+0x6e1>
    8d73:	eb 02                	jmp    8d77 <III_stereo+0x6cd>
    8d75:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    8d77:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8d7a:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    8d7d:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    8d84:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    8d8b:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    8d8f:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    8d93:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    8d97:	0f 8f 76 ff ff ff    	jg     8d13 <III_stereo+0x669>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    8d9d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    8da1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    8da5:	0f 89 e7 fe ff ff    	jns    8c92 <III_stereo+0x5e8>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    8dab:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8dae:	83 c0 01             	add    $0x1,%eax
    8db1:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    8db4:	e9 fa 00 00 00       	jmp    8eb3 <III_stereo+0x809>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    8db9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8dbc:	8d 48 01             	lea    0x1(%eax),%ecx
    8dbf:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8dc2:	89 d0                	mov    %edx,%eax
    8dc4:	c1 e0 03             	shl    $0x3,%eax
    8dc7:	01 d0                	add    %edx,%eax
    8dc9:	c1 e0 02             	shl    $0x2,%eax
    8dcc:	01 d0                	add    %edx,%eax
    8dce:	01 c8                	add    %ecx,%eax
    8dd0:	83 c0 14             	add    $0x14,%eax
    8dd3:	8b 0c 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%ecx
    8dda:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8ddd:	89 d0                	mov    %edx,%eax
    8ddf:	c1 e0 03             	shl    $0x3,%eax
    8de2:	01 d0                	add    %edx,%eax
    8de4:	c1 e0 02             	shl    $0x2,%eax
    8de7:	01 d0                	add    %edx,%eax
    8de9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8dec:	01 d0                	add    %edx,%eax
    8dee:	83 c0 14             	add    $0x14,%eax
    8df1:	8b 04 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%eax
    8df8:	29 c1                	sub    %eax,%ecx
    8dfa:	89 c8                	mov    %ecx,%eax
    8dfc:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    8dff:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8e02:	89 d0                	mov    %edx,%eax
    8e04:	c1 e0 03             	shl    $0x3,%eax
    8e07:	01 d0                	add    %edx,%eax
    8e09:	c1 e0 02             	shl    $0x2,%eax
    8e0c:	01 d0                	add    %edx,%eax
    8e0e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8e11:	01 d0                	add    %edx,%eax
    8e13:	83 c0 14             	add    $0x14,%eax
    8e16:	8b 14 85 0c e9 00 00 	mov    0xe90c(,%eax,4),%edx
    8e1d:	89 d0                	mov    %edx,%eax
    8e1f:	01 c0                	add    %eax,%eax
    8e21:	01 c2                	add    %eax,%edx
    8e23:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8e26:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8e2a:	01 d0                	add    %edx,%eax
    8e2c:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    8e2f:	eb 78                	jmp    8ea9 <III_stereo+0x7ff>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    8e31:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8e34:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8e37:	89 d0                	mov    %edx,%eax
    8e39:	01 c0                	add    %eax,%eax
    8e3b:	01 d0                	add    %edx,%eax
    8e3d:	c1 e0 02             	shl    $0x2,%eax
    8e40:	01 d0                	add    %edx,%eax
    8e42:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8e45:	01 d0                	add    %edx,%eax
    8e47:	83 c0 52             	add    $0x52,%eax
    8e4a:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    8e4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8e51:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    8e58:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8e5b:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8e62:	83 f8 07             	cmp    $0x7,%eax
    8e65:	74 3a                	je     8ea1 <III_stereo+0x7f7>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    8e67:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8e6a:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8e71:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    8e77:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    8e7d:	dd 05 c0 cf 00 00    	fldl   0xcfc0
    8e83:	de c9                	fmulp  %st,%st(1)
    8e85:	83 ec 08             	sub    $0x8,%esp
    8e88:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    8e8c:	dd 1c 24             	fstpl  (%esp)
    8e8f:	e8 84 b1 ff ff       	call   4018 <tan>
    8e94:	83 c4 10             	add    $0x10,%esp
    8e97:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8e9a:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    8ea1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    8ea5:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    8ea9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    8ead:	7f 82                	jg     8e31 <III_stereo+0x787>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    8eaf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    8eb3:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    8eb7:	0f 8e fc fe ff ff    	jle    8db9 <III_stereo+0x70f>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    8ebd:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8ec0:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8ec6:	83 c0 7c             	add    $0x7c,%eax
    8ec9:	05 00 e9 00 00       	add    $0xe900,%eax
    8ece:	8b 50 0c             	mov    0xc(%eax),%edx
    8ed1:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8ed4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8eda:	83 c0 78             	add    $0x78,%eax
    8edd:	05 00 e9 00 00       	add    $0xe900,%eax
    8ee2:	8b 40 0c             	mov    0xc(%eax),%eax
    8ee5:	29 c2                	sub    %eax,%edx
    8ee7:	89 d0                	mov    %edx,%eax
    8ee9:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    8eec:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8eef:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8ef5:	83 c0 78             	add    $0x78,%eax
    8ef8:	05 00 e9 00 00       	add    $0xe900,%eax
    8efd:	8b 50 0c             	mov    0xc(%eax),%edx
    8f00:	89 d0                	mov    %edx,%eax
    8f02:	01 c0                	add    %eax,%eax
    8f04:	01 c2                	add    %eax,%edx
    8f06:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8f09:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8f0d:	01 d0                	add    %edx,%eax
    8f0f:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    8f12:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8f15:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8f1b:	83 e8 80             	sub    $0xffffff80,%eax
    8f1e:	05 00 e9 00 00       	add    $0xe900,%eax
    8f23:	8b 50 0c             	mov    0xc(%eax),%edx
    8f26:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8f29:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8f2f:	83 c0 7c             	add    $0x7c,%eax
    8f32:	05 00 e9 00 00       	add    $0xe900,%eax
    8f37:	8b 40 0c             	mov    0xc(%eax),%eax
    8f3a:	29 c2                	sub    %eax,%edx
    8f3c:	89 d0                	mov    %edx,%eax
    8f3e:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    8f41:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8f44:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8f4a:	83 c0 7c             	add    $0x7c,%eax
    8f4d:	05 00 e9 00 00       	add    $0xe900,%eax
    8f52:	8b 50 0c             	mov    0xc(%eax),%edx
    8f55:	89 d0                	mov    %edx,%eax
    8f57:	01 c0                	add    %eax,%eax
    8f59:	01 c2                	add    %eax,%edx
    8f5b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8f5e:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8f62:	01 d0                	add    %edx,%eax
    8f64:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    8f67:	eb 30                	jmp    8f99 <III_stereo+0x8ef>
               {  is_pos[i] = is_pos[sfb];
    8f69:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8f6c:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    8f73:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f76:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    8f7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8f80:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    8f87:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f8a:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    8f91:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    8f95:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    8f99:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    8f9d:	7f ca                	jg     8f69 <III_stereo+0x8bf>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    8f9f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8fa3:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8fa7:	0f 8e d2 fc ff ff    	jle    8c7f <III_stereo+0x5d5>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    8fad:	e9 00 02 00 00       	jmp    91b2 <III_stereo+0xb08>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    8fb2:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    8fb9:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    8fc0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    8fc7:	eb 63                	jmp    902c <III_stereo+0x982>
         {  if ( xr[1][i][ss] != 0.0 )
    8fc9:	8b 45 08             	mov    0x8(%ebp),%eax
    8fcc:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    8fd2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8fd5:	89 d0                	mov    %edx,%eax
    8fd7:	c1 e0 03             	shl    $0x3,%eax
    8fda:	01 d0                	add    %edx,%eax
    8fdc:	01 c0                	add    %eax,%eax
    8fde:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8fe1:	01 d0                	add    %edx,%eax
    8fe3:	dd 04 c1             	fldl   (%ecx,%eax,8)
    8fe6:	d9 ee                	fldz   
    8fe8:	df e9                	fucomip %st(1),%st
    8fea:	7a 0a                	jp     8ff6 <III_stereo+0x94c>
    8fec:	d9 ee                	fldz   
    8fee:	df e9                	fucomip %st(1),%st
    8ff0:	dd d8                	fstp   %st(0)
    8ff2:	74 23                	je     9017 <III_stereo+0x96d>
    8ff4:	eb 02                	jmp    8ff8 <III_stereo+0x94e>
    8ff6:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    8ff8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8ffb:	89 d0                	mov    %edx,%eax
    8ffd:	c1 e0 03             	shl    $0x3,%eax
    9000:	01 d0                	add    %edx,%eax
    9002:	01 c0                	add    %eax,%eax
    9004:	89 c2                	mov    %eax,%edx
    9006:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9009:	01 d0                	add    %edx,%eax
    900b:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    900e:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    9015:	eb 15                	jmp    902c <III_stereo+0x982>
            } else
            {  ss--;
    9017:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    901b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    901f:	79 0b                	jns    902c <III_stereo+0x982>
               {  i--;
    9021:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    9025:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    902c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    9030:	79 97                	jns    8fc9 <III_stereo+0x91f>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    9032:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    9039:	eb 04                	jmp    903f <III_stereo+0x995>
            i++;
    903b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    903f:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9042:	89 d0                	mov    %edx,%eax
    9044:	c1 e0 03             	shl    $0x3,%eax
    9047:	01 d0                	add    %edx,%eax
    9049:	c1 e0 02             	shl    $0x2,%eax
    904c:	01 d0                	add    %edx,%eax
    904e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9051:	01 d0                	add    %edx,%eax
    9053:	8b 04 85 00 e9 00 00 	mov    0xe900(,%eax,4),%eax
    905a:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    905d:	7e dc                	jle    903b <III_stereo+0x991>
            i++;
         sfb = i;
    905f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9062:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    9065:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9068:	89 d0                	mov    %edx,%eax
    906a:	c1 e0 03             	shl    $0x3,%eax
    906d:	01 d0                	add    %edx,%eax
    906f:	c1 e0 02             	shl    $0x2,%eax
    9072:	01 d0                	add    %edx,%eax
    9074:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9077:	01 d0                	add    %edx,%eax
    9079:	8b 04 85 00 e9 00 00 	mov    0xe900(,%eax,4),%eax
    9080:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    9083:	e9 b3 00 00 00       	jmp    913b <III_stereo+0xa91>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    9088:	8b 45 f4             	mov    -0xc(%ebp),%eax
    908b:	8d 48 01             	lea    0x1(%eax),%ecx
    908e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9091:	89 d0                	mov    %edx,%eax
    9093:	c1 e0 03             	shl    $0x3,%eax
    9096:	01 d0                	add    %edx,%eax
    9098:	c1 e0 02             	shl    $0x2,%eax
    909b:	01 d0                	add    %edx,%eax
    909d:	01 c8                	add    %ecx,%eax
    909f:	8b 0c 85 00 e9 00 00 	mov    0xe900(,%eax,4),%ecx
    90a6:	8b 55 c8             	mov    -0x38(%ebp),%edx
    90a9:	89 d0                	mov    %edx,%eax
    90ab:	c1 e0 03             	shl    $0x3,%eax
    90ae:	01 d0                	add    %edx,%eax
    90b0:	c1 e0 02             	shl    $0x2,%eax
    90b3:	01 d0                	add    %edx,%eax
    90b5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    90b8:	01 d0                	add    %edx,%eax
    90ba:	8b 04 85 00 e9 00 00 	mov    0xe900(,%eax,4),%eax
    90c1:	29 c1                	sub    %eax,%ecx
    90c3:	89 c8                	mov    %ecx,%eax
    90c5:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    90c8:	eb 67                	jmp    9131 <III_stereo+0xa87>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    90ca:	8b 45 10             	mov    0x10(%ebp),%eax
    90cd:	8b 55 f4             	mov    -0xc(%ebp),%edx
    90d0:	83 c2 3e             	add    $0x3e,%edx
    90d3:	8b 14 90             	mov    (%eax,%edx,4),%edx
    90d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    90d9:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    90e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    90e3:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    90ea:	83 f8 07             	cmp    $0x7,%eax
    90ed:	74 3a                	je     9129 <III_stereo+0xa7f>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    90ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
    90f2:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    90f9:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    90ff:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9105:	dd 05 c0 cf 00 00    	fldl   0xcfc0
    910b:	de c9                	fmulp  %st,%st(1)
    910d:	83 ec 08             	sub    $0x8,%esp
    9110:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9114:	dd 1c 24             	fstpl  (%esp)
    9117:	e8 fc ae ff ff       	call   4018 <tan>
    911c:	83 c4 10             	add    $0x10,%esp
    911f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9122:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    9129:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    912d:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9131:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9135:	7f 93                	jg     90ca <III_stereo+0xa20>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    9137:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    913b:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    913f:	0f 8e 43 ff ff ff    	jle    9088 <III_stereo+0x9de>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    9145:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9148:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    914e:	83 c0 50             	add    $0x50,%eax
    9151:	05 00 e9 00 00       	add    $0xe900,%eax
    9156:	8b 00                	mov    (%eax),%eax
    9158:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    915b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    915e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9164:	83 c0 54             	add    $0x54,%eax
    9167:	05 00 e9 00 00       	add    $0xe900,%eax
    916c:	8b 00                	mov    (%eax),%eax
    916e:	ba 40 02 00 00       	mov    $0x240,%edx
    9173:	29 c2                	sub    %eax,%edx
    9175:	89 d0                	mov    %edx,%eax
    9177:	89 45 e8             	mov    %eax,-0x18(%ebp)
    917a:	eb 30                	jmp    91ac <III_stereo+0xb02>
         {  is_pos[i] = is_pos[sfb];
    917c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    917f:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    9186:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9189:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    9190:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9193:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    919a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    919d:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    91a4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    91a8:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    91ac:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    91b0:	7f ca                	jg     917c <III_stereo+0xad2>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    91b2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    91b9:	eb 55                	jmp    9210 <III_stereo+0xb66>
      for(sb=0;sb<SBLIMIT;sb++)
    91bb:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    91c2:	eb 42                	jmp    9206 <III_stereo+0xb5c>
         for(ss=0;ss<SSLIMIT;ss++)
    91c4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    91cb:	eb 2f                	jmp    91fc <III_stereo+0xb52>
            lr[ch][sb][ss] = 0;
    91cd:	8b 55 e0             	mov    -0x20(%ebp),%edx
    91d0:	89 d0                	mov    %edx,%eax
    91d2:	c1 e0 03             	shl    $0x3,%eax
    91d5:	01 d0                	add    %edx,%eax
    91d7:	c1 e0 09             	shl    $0x9,%eax
    91da:	89 c2                	mov    %eax,%edx
    91dc:	8b 45 0c             	mov    0xc(%ebp),%eax
    91df:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    91e2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    91e5:	89 d0                	mov    %edx,%eax
    91e7:	c1 e0 03             	shl    $0x3,%eax
    91ea:	01 d0                	add    %edx,%eax
    91ec:	01 c0                	add    %eax,%eax
    91ee:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    91f1:	01 d0                	add    %edx,%eax
    91f3:	d9 ee                	fldz   
    91f5:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    91f8:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    91fc:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    9200:	7e cb                	jle    91cd <III_stereo+0xb23>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    9202:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9206:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    920a:	7e b8                	jle    91c4 <III_stereo+0xb1a>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    920c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    9210:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    9214:	7e a5                	jle    91bb <III_stereo+0xb11>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    9216:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    921a:	0f 85 3b 02 00 00    	jne    945b <III_stereo+0xdb1>
      for(sb=0;sb<SBLIMIT;sb++)
    9220:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9227:	e9 23 02 00 00       	jmp    944f <III_stereo+0xda5>
         for(ss=0;ss<SSLIMIT;ss++) {
    922c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    9233:	e9 09 02 00 00       	jmp    9441 <III_stereo+0xd97>
            i = (sb*18)+ss;
    9238:	8b 55 e8             	mov    -0x18(%ebp),%edx
    923b:	89 d0                	mov    %edx,%eax
    923d:	c1 e0 03             	shl    $0x3,%eax
    9240:	01 d0                	add    %edx,%eax
    9242:	01 c0                	add    %eax,%eax
    9244:	89 c2                	mov    %eax,%edx
    9246:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9249:	01 d0                	add    %edx,%eax
    924b:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    924e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9251:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9258:	83 f8 07             	cmp    $0x7,%eax
    925b:	0f 85 2c 01 00 00    	jne    938d <III_stereo+0xce3>
               if ( ms_stereo ) {
    9261:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    9265:	0f 84 b5 00 00 00    	je     9320 <III_stereo+0xc76>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    926b:	8b 4d 08             	mov    0x8(%ebp),%ecx
    926e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9271:	89 d0                	mov    %edx,%eax
    9273:	c1 e0 03             	shl    $0x3,%eax
    9276:	01 d0                	add    %edx,%eax
    9278:	01 c0                	add    %eax,%eax
    927a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    927d:	01 d0                	add    %edx,%eax
    927f:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9282:	8b 45 08             	mov    0x8(%ebp),%eax
    9285:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    928b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    928e:	89 d0                	mov    %edx,%eax
    9290:	c1 e0 03             	shl    $0x3,%eax
    9293:	01 d0                	add    %edx,%eax
    9295:	01 c0                	add    %eax,%eax
    9297:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    929a:	01 d0                	add    %edx,%eax
    929c:	dd 04 c1             	fldl   (%ecx,%eax,8)
    929f:	de c1                	faddp  %st,%st(1)
    92a1:	dd 05 c8 cf 00 00    	fldl   0xcfc8
    92a7:	de f9                	fdivrp %st,%st(1)
    92a9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    92ac:	8b 55 e8             	mov    -0x18(%ebp),%edx
    92af:	89 d0                	mov    %edx,%eax
    92b1:	c1 e0 03             	shl    $0x3,%eax
    92b4:	01 d0                	add    %edx,%eax
    92b6:	01 c0                	add    %eax,%eax
    92b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    92bb:	01 d0                	add    %edx,%eax
    92bd:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    92c0:	8b 45 0c             	mov    0xc(%ebp),%eax
    92c3:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    92c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    92cc:	8b 55 e8             	mov    -0x18(%ebp),%edx
    92cf:	89 d0                	mov    %edx,%eax
    92d1:	c1 e0 03             	shl    $0x3,%eax
    92d4:	01 d0                	add    %edx,%eax
    92d6:	01 c0                	add    %eax,%eax
    92d8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    92db:	01 d0                	add    %edx,%eax
    92dd:	dd 04 c1             	fldl   (%ecx,%eax,8)
    92e0:	8b 45 08             	mov    0x8(%ebp),%eax
    92e3:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    92e9:	8b 55 e8             	mov    -0x18(%ebp),%edx
    92ec:	89 d0                	mov    %edx,%eax
    92ee:	c1 e0 03             	shl    $0x3,%eax
    92f1:	01 d0                	add    %edx,%eax
    92f3:	01 c0                	add    %eax,%eax
    92f5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    92f8:	01 d0                	add    %edx,%eax
    92fa:	dd 04 c1             	fldl   (%ecx,%eax,8)
    92fd:	de e9                	fsubrp %st,%st(1)
    92ff:	dd 05 c8 cf 00 00    	fldl   0xcfc8
    9305:	de f9                	fdivrp %st,%st(1)
    9307:	8b 55 e8             	mov    -0x18(%ebp),%edx
    930a:	89 d0                	mov    %edx,%eax
    930c:	c1 e0 03             	shl    $0x3,%eax
    930f:	01 d0                	add    %edx,%eax
    9311:	01 c0                	add    %eax,%eax
    9313:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9316:	01 d0                	add    %edx,%eax
    9318:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    931b:	e9 1d 01 00 00       	jmp    943d <III_stereo+0xd93>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    9320:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9323:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9326:	89 d0                	mov    %edx,%eax
    9328:	c1 e0 03             	shl    $0x3,%eax
    932b:	01 d0                	add    %edx,%eax
    932d:	01 c0                	add    %eax,%eax
    932f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9332:	01 d0                	add    %edx,%eax
    9334:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9337:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    933a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    933d:	89 d0                	mov    %edx,%eax
    933f:	c1 e0 03             	shl    $0x3,%eax
    9342:	01 d0                	add    %edx,%eax
    9344:	01 c0                	add    %eax,%eax
    9346:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9349:	01 d0                	add    %edx,%eax
    934b:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    934e:	8b 45 0c             	mov    0xc(%ebp),%eax
    9351:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9357:	8b 45 08             	mov    0x8(%ebp),%eax
    935a:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    9360:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9363:	89 d0                	mov    %edx,%eax
    9365:	c1 e0 03             	shl    $0x3,%eax
    9368:	01 d0                	add    %edx,%eax
    936a:	01 c0                	add    %eax,%eax
    936c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    936f:	01 d0                	add    %edx,%eax
    9371:	dd 04 c3             	fldl   (%ebx,%eax,8)
    9374:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9377:	89 d0                	mov    %edx,%eax
    9379:	c1 e0 03             	shl    $0x3,%eax
    937c:	01 d0                	add    %edx,%eax
    937e:	01 c0                	add    %eax,%eax
    9380:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9383:	01 d0                	add    %edx,%eax
    9385:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    9388:	e9 b0 00 00 00       	jmp    943d <III_stereo+0xd93>
               }
            }
            else if (i_stereo ) {
    938d:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    9391:	0f 84 94 00 00 00    	je     942b <III_stereo+0xd81>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    9397:	8b 4d 08             	mov    0x8(%ebp),%ecx
    939a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    939d:	89 d0                	mov    %edx,%eax
    939f:	c1 e0 03             	shl    $0x3,%eax
    93a2:	01 d0                	add    %edx,%eax
    93a4:	01 c0                	add    %eax,%eax
    93a6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    93a9:	01 d0                	add    %edx,%eax
    93ab:	dd 04 c1             	fldl   (%ecx,%eax,8)
    93ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
    93b1:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    93b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    93bb:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    93c2:	d9 e8                	fld1   
    93c4:	de c1                	faddp  %st,%st(1)
    93c6:	de f9                	fdivrp %st,%st(1)
    93c8:	de c9                	fmulp  %st,%st(1)
    93ca:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    93cd:	8b 55 e8             	mov    -0x18(%ebp),%edx
    93d0:	89 d0                	mov    %edx,%eax
    93d2:	c1 e0 03             	shl    $0x3,%eax
    93d5:	01 d0                	add    %edx,%eax
    93d7:	01 c0                	add    %eax,%eax
    93d9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    93dc:	01 d0                	add    %edx,%eax
    93de:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    93e1:	8b 45 0c             	mov    0xc(%ebp),%eax
    93e4:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    93ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
    93ed:	8b 55 e8             	mov    -0x18(%ebp),%edx
    93f0:	89 d0                	mov    %edx,%eax
    93f2:	c1 e0 03             	shl    $0x3,%eax
    93f5:	01 d0                	add    %edx,%eax
    93f7:	01 c0                	add    %eax,%eax
    93f9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    93fc:	01 d0                	add    %edx,%eax
    93fe:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9401:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9404:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    940b:	d9 e8                	fld1   
    940d:	de c1                	faddp  %st,%st(1)
    940f:	d9 e8                	fld1   
    9411:	de f1                	fdivp  %st,%st(1)
    9413:	de c9                	fmulp  %st,%st(1)
    9415:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9418:	89 d0                	mov    %edx,%eax
    941a:	c1 e0 03             	shl    $0x3,%eax
    941d:	01 d0                	add    %edx,%eax
    941f:	01 c0                	add    %eax,%eax
    9421:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9424:	01 d0                	add    %edx,%eax
    9426:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    9429:	eb 12                	jmp    943d <III_stereo+0xd93>
            }
            else {
               printf(0,"Error in streo processing\n");
    942b:	83 ec 08             	sub    $0x8,%esp
    942e:	68 40 bf 00 00       	push   $0xbf40
    9433:	6a 00                	push   $0x0
    9435:	e8 4a a7 ff ff       	call   3b84 <printf>
    943a:	83 c4 10             	add    $0x10,%esp
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    943d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9441:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    9445:	0f 8e ed fd ff ff    	jle    9238 <III_stereo+0xb8e>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    944b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    944f:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    9453:	0f 8e d3 fd ff ff    	jle    922c <III_stereo+0xb82>
    9459:	eb 54                	jmp    94af <III_stereo+0xe05>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    945b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9462:	eb 45                	jmp    94a9 <III_stereo+0xdff>
         for(ss=0;ss<SSLIMIT;ss++)
    9464:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    946b:	eb 32                	jmp    949f <III_stereo+0xdf5>
            lr[0][sb][ss] = xr[0][sb][ss];
    946d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9470:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9473:	89 d0                	mov    %edx,%eax
    9475:	c1 e0 03             	shl    $0x3,%eax
    9478:	01 d0                	add    %edx,%eax
    947a:	01 c0                	add    %eax,%eax
    947c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    947f:	01 d0                	add    %edx,%eax
    9481:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9484:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9487:	8b 55 e8             	mov    -0x18(%ebp),%edx
    948a:	89 d0                	mov    %edx,%eax
    948c:	c1 e0 03             	shl    $0x3,%eax
    948f:	01 d0                	add    %edx,%eax
    9491:	01 c0                	add    %eax,%eax
    9493:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9496:	01 d0                	add    %edx,%eax
    9498:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    949b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    949f:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    94a3:	7e c8                	jle    946d <III_stereo+0xdc3>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    94a5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    94a9:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    94ad:	7e b5                	jle    9464 <III_stereo+0xdba>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    94af:	8d 65 f8             	lea    -0x8(%ebp),%esp
    94b2:	5b                   	pop    %ebx
    94b3:	5e                   	pop    %esi
    94b4:	5d                   	pop    %ebp
    94b5:	c3                   	ret    

000094b6 <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    94b6:	55                   	push   %ebp
    94b7:	89 e5                	mov    %esp,%ebp
    94b9:	83 ec 38             	sub    $0x38,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    94bc:	a1 80 eb 00 00       	mov    0xeb80,%eax
    94c1:	85 c0                	test   %eax,%eax
    94c3:	74 72                	je     9537 <III_antialias+0x81>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    94c5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    94cc:	eb 59                	jmp    9527 <III_antialias+0x71>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    94ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
    94d1:	dd 04 c5 40 eb 00 00 	fldl   0xeb40(,%eax,8)
    94d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    94db:	dd 04 c5 40 eb 00 00 	fldl   0xeb40(,%eax,8)
    94e2:	de c9                	fmulp  %st,%st(1)
    94e4:	d9 e8                	fld1   
    94e6:	de c1                	faddp  %st,%st(1)
    94e8:	83 ec 08             	sub    $0x8,%esp
    94eb:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    94ef:	dd 1c 24             	fstpl  (%esp)
    94f2:	e8 e4 ac ff ff       	call   41db <sqrt>
    94f7:	83 c4 10             	add    $0x10,%esp
    94fa:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    94fd:	d9 e8                	fld1   
    94ff:	dc 75 e0             	fdivl  -0x20(%ebp)
    9502:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9505:	dd 1c c5 40 ec 00 00 	fstpl  0xec40(,%eax,8)
         ca[i] = Ci[i]/sq;
    950c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    950f:	dd 04 c5 40 eb 00 00 	fldl   0xeb40(,%eax,8)
    9516:	dc 75 e0             	fdivl  -0x20(%ebp)
    9519:	8b 45 e8             	mov    -0x18(%ebp),%eax
    951c:	dd 1c c5 80 ec 00 00 	fstpl  0xec80(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    9523:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9527:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    952b:	7e a1                	jle    94ce <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    952d:	c7 05 80 eb 00 00 00 	movl   $0x0,0xeb80
    9534:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    9537:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    953e:	eb 4c                	jmp    958c <III_antialias+0xd6>
       for(ss=0;ss<SSLIMIT;ss++)
    9540:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9547:	eb 39                	jmp    9582 <III_antialias+0xcc>
          hybridIn[sb][ss] = xr[sb][ss];
    9549:	8b 55 f0             	mov    -0x10(%ebp),%edx
    954c:	89 d0                	mov    %edx,%eax
    954e:	c1 e0 03             	shl    $0x3,%eax
    9551:	01 d0                	add    %edx,%eax
    9553:	c1 e0 04             	shl    $0x4,%eax
    9556:	89 c2                	mov    %eax,%edx
    9558:	8b 45 0c             	mov    0xc(%ebp),%eax
    955b:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    955e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9561:	89 d0                	mov    %edx,%eax
    9563:	c1 e0 03             	shl    $0x3,%eax
    9566:	01 d0                	add    %edx,%eax
    9568:	c1 e0 04             	shl    $0x4,%eax
    956b:	89 c2                	mov    %eax,%edx
    956d:	8b 45 08             	mov    0x8(%ebp),%eax
    9570:	01 c2                	add    %eax,%edx
    9572:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9575:	dd 04 c2             	fldl   (%edx,%eax,8)
    9578:	8b 45 f4             	mov    -0xc(%ebp),%eax
    957b:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    957e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9582:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9586:	7e c1                	jle    9549 <III_antialias+0x93>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    9588:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    958c:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    9590:	7e ae                	jle    9540 <III_antialias+0x8a>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    9592:	8b 45 10             	mov    0x10(%ebp),%eax
    9595:	8b 40 10             	mov    0x10(%eax),%eax
    9598:	85 c0                	test   %eax,%eax
    959a:	74 1a                	je     95b6 <III_antialias+0x100>
    959c:	8b 45 10             	mov    0x10(%ebp),%eax
    959f:	8b 40 14             	mov    0x14(%eax),%eax
    95a2:	83 f8 02             	cmp    $0x2,%eax
    95a5:	75 0f                	jne    95b6 <III_antialias+0x100>
       !gr_info->mixed_block_flag ) return;
    95a7:	8b 45 10             	mov    0x10(%ebp),%eax
    95aa:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    95ad:	85 c0                	test   %eax,%eax
    95af:	75 05                	jne    95b6 <III_antialias+0x100>
       !gr_info->mixed_block_flag ) return;
    95b1:	e9 1c 01 00 00       	jmp    96d2 <III_antialias+0x21c>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    95b6:	8b 45 10             	mov    0x10(%ebp),%eax
    95b9:	8b 40 10             	mov    0x10(%eax),%eax
    95bc:	85 c0                	test   %eax,%eax
    95be:	74 1e                	je     95de <III_antialias+0x128>
    95c0:	8b 45 10             	mov    0x10(%ebp),%eax
    95c3:	8b 40 18             	mov    0x18(%eax),%eax
    95c6:	85 c0                	test   %eax,%eax
    95c8:	74 14                	je     95de <III_antialias+0x128>
     (gr_info->block_type == 2))
    95ca:	8b 45 10             	mov    0x10(%ebp),%eax
    95cd:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    95d0:	83 f8 02             	cmp    $0x2,%eax
    95d3:	75 09                	jne    95de <III_antialias+0x128>
     (gr_info->block_type == 2))
      sblim = 1;
    95d5:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    95dc:	eb 07                	jmp    95e5 <III_antialias+0x12f>
   else
      sblim = SBLIMIT-1;
    95de:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    95e5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    95ec:	e9 d5 00 00 00       	jmp    96c6 <III_antialias+0x210>
      for(ss=0;ss<8;ss++) {
    95f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    95f8:	e9 bb 00 00 00       	jmp    96b8 <III_antialias+0x202>
         bu = xr[sb][17-ss];
    95fd:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9600:	89 d0                	mov    %edx,%eax
    9602:	c1 e0 03             	shl    $0x3,%eax
    9605:	01 d0                	add    %edx,%eax
    9607:	c1 e0 04             	shl    $0x4,%eax
    960a:	89 c2                	mov    %eax,%edx
    960c:	8b 45 08             	mov    0x8(%ebp),%eax
    960f:	01 c2                	add    %eax,%edx
    9611:	b8 11 00 00 00       	mov    $0x11,%eax
    9616:	2b 45 f4             	sub    -0xc(%ebp),%eax
    9619:	dd 04 c2             	fldl   (%edx,%eax,8)
    961c:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    961f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9622:	8d 50 01             	lea    0x1(%eax),%edx
    9625:	89 d0                	mov    %edx,%eax
    9627:	c1 e0 03             	shl    $0x3,%eax
    962a:	01 d0                	add    %edx,%eax
    962c:	c1 e0 04             	shl    $0x4,%eax
    962f:	89 c2                	mov    %eax,%edx
    9631:	8b 45 08             	mov    0x8(%ebp),%eax
    9634:	01 c2                	add    %eax,%edx
    9636:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9639:	dd 04 c2             	fldl   (%edx,%eax,8)
    963c:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    963f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9642:	89 d0                	mov    %edx,%eax
    9644:	c1 e0 03             	shl    $0x3,%eax
    9647:	01 d0                	add    %edx,%eax
    9649:	c1 e0 04             	shl    $0x4,%eax
    964c:	89 c2                	mov    %eax,%edx
    964e:	8b 45 0c             	mov    0xc(%ebp),%eax
    9651:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9654:	b8 11 00 00 00       	mov    $0x11,%eax
    9659:	2b 45 f4             	sub    -0xc(%ebp),%eax
    965c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    965f:	dd 04 d5 40 ec 00 00 	fldl   0xec40(,%edx,8)
    9666:	dc 4d d8             	fmull  -0x28(%ebp)
    9669:	8b 55 f4             	mov    -0xc(%ebp),%edx
    966c:	dd 04 d5 80 ec 00 00 	fldl   0xec80(,%edx,8)
    9673:	dc 4d d0             	fmull  -0x30(%ebp)
    9676:	de e9                	fsubrp %st,%st(1)
    9678:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    967b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    967e:	8d 50 01             	lea    0x1(%eax),%edx
    9681:	89 d0                	mov    %edx,%eax
    9683:	c1 e0 03             	shl    $0x3,%eax
    9686:	01 d0                	add    %edx,%eax
    9688:	c1 e0 04             	shl    $0x4,%eax
    968b:	89 c2                	mov    %eax,%edx
    968d:	8b 45 0c             	mov    0xc(%ebp),%eax
    9690:	01 c2                	add    %eax,%edx
    9692:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9695:	dd 04 c5 40 ec 00 00 	fldl   0xec40(,%eax,8)
    969c:	dc 4d d0             	fmull  -0x30(%ebp)
    969f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    96a2:	dd 04 c5 80 ec 00 00 	fldl   0xec80(,%eax,8)
    96a9:	dc 4d d8             	fmull  -0x28(%ebp)
    96ac:	de c1                	faddp  %st,%st(1)
    96ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    96b1:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    96b4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    96b8:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    96bc:	0f 8e 3b ff ff ff    	jle    95fd <III_antialias+0x147>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    96c2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    96c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    96c9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    96cc:	0f 8c 1f ff ff ff    	jl     95f1 <III_antialias+0x13b>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    96d2:	c9                   	leave  
    96d3:	c3                   	ret    

000096d4 <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    96d4:	55                   	push   %ebp
    96d5:	89 e5                	mov    %esp,%ebp
    96d7:	81 ec 98 00 00 00    	sub    $0x98,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    96dd:	a1 c0 ec 00 00       	mov    0xecc0,%eax
    96e2:	85 c0                	test   %eax,%eax
    96e4:	0f 85 9f 02 00 00    	jne    9989 <inv_mdct+0x2b5>

    /* type 0 */
      for(i=0;i<36;i++)
    96ea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    96f1:	eb 33                	jmp    9726 <inv_mdct+0x52>
         win[0][i] = sin( PI/36 *(i+0.5) );
    96f3:	db 45 f4             	fildl  -0xc(%ebp)
    96f6:	dd 05 d0 cf 00 00    	fldl   0xcfd0
    96fc:	de c1                	faddp  %st,%st(1)
    96fe:	dd 05 d8 cf 00 00    	fldl   0xcfd8
    9704:	de c9                	fmulp  %st,%st(1)
    9706:	83 ec 08             	sub    $0x8,%esp
    9709:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    970d:	dd 1c 24             	fstpl  (%esp)
    9710:	e8 38 a8 ff ff       	call   3f4d <sin>
    9715:	83 c4 10             	add    $0x10,%esp
    9718:	8b 45 f4             	mov    -0xc(%ebp),%eax
    971b:	dd 1c c5 00 ed 00 00 	fstpl  0xed00(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    9722:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9726:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    972a:	7e c7                	jle    96f3 <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    972c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9733:	eb 36                	jmp    976b <inv_mdct+0x97>
         win[1][i] = sin( PI/36 *(i+0.5) );
    9735:	db 45 f4             	fildl  -0xc(%ebp)
    9738:	dd 05 d0 cf 00 00    	fldl   0xcfd0
    973e:	de c1                	faddp  %st,%st(1)
    9740:	dd 05 d8 cf 00 00    	fldl   0xcfd8
    9746:	de c9                	fmulp  %st,%st(1)
    9748:	83 ec 08             	sub    $0x8,%esp
    974b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    974f:	dd 1c 24             	fstpl  (%esp)
    9752:	e8 f6 a7 ff ff       	call   3f4d <sin>
    9757:	83 c4 10             	add    $0x10,%esp
    975a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    975d:	83 c0 24             	add    $0x24,%eax
    9760:	dd 1c c5 00 ed 00 00 	fstpl  0xed00(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    9767:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    976b:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    976f:	7e c4                	jle    9735 <inv_mdct+0x61>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    9771:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    9778:	eb 13                	jmp    978d <inv_mdct+0xb9>
         win[1][i] = 1.0;
    977a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    977d:	83 c0 24             	add    $0x24,%eax
    9780:	d9 e8                	fld1   
    9782:	dd 1c c5 00 ed 00 00 	fstpl  0xed00(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    9789:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    978d:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    9791:	7e e7                	jle    977a <inv_mdct+0xa6>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    9793:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    979a:	eb 3e                	jmp    97da <inv_mdct+0x106>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    979c:	db 45 f4             	fildl  -0xc(%ebp)
    979f:	dd 05 d0 cf 00 00    	fldl   0xcfd0
    97a5:	de c1                	faddp  %st,%st(1)
    97a7:	dd 05 e0 cf 00 00    	fldl   0xcfe0
    97ad:	de e9                	fsubrp %st,%st(1)
    97af:	dd 05 c0 cf 00 00    	fldl   0xcfc0
    97b5:	de c9                	fmulp  %st,%st(1)
    97b7:	83 ec 08             	sub    $0x8,%esp
    97ba:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    97be:	dd 1c 24             	fstpl  (%esp)
    97c1:	e8 87 a7 ff ff       	call   3f4d <sin>
    97c6:	83 c4 10             	add    $0x10,%esp
    97c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97cc:	83 c0 24             	add    $0x24,%eax
    97cf:	dd 1c c5 00 ed 00 00 	fstpl  0xed00(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    97d6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    97da:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    97de:	7e bc                	jle    979c <inv_mdct+0xc8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    97e0:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    97e7:	eb 13                	jmp    97fc <inv_mdct+0x128>
         win[1][i] = 0.0;
    97e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97ec:	83 c0 24             	add    $0x24,%eax
    97ef:	d9 ee                	fldz   
    97f1:	dd 1c c5 00 ed 00 00 	fstpl  0xed00(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    97f8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    97fc:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9800:	7e e7                	jle    97e9 <inv_mdct+0x115>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    9802:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9809:	eb 13                	jmp    981e <inv_mdct+0x14a>
         win[3][i] = 0.0;
    980b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    980e:	83 c0 6c             	add    $0x6c,%eax
    9811:	d9 ee                	fldz   
    9813:	dd 1c c5 00 ed 00 00 	fstpl  0xed00(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    981a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    981e:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    9822:	7e e7                	jle    980b <inv_mdct+0x137>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    9824:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    982b:	eb 3e                	jmp    986b <inv_mdct+0x197>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    982d:	db 45 f4             	fildl  -0xc(%ebp)
    9830:	dd 05 d0 cf 00 00    	fldl   0xcfd0
    9836:	de c1                	faddp  %st,%st(1)
    9838:	dd 05 e8 cf 00 00    	fldl   0xcfe8
    983e:	de e9                	fsubrp %st,%st(1)
    9840:	dd 05 c0 cf 00 00    	fldl   0xcfc0
    9846:	de c9                	fmulp  %st,%st(1)
    9848:	83 ec 08             	sub    $0x8,%esp
    984b:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    984f:	dd 1c 24             	fstpl  (%esp)
    9852:	e8 f6 a6 ff ff       	call   3f4d <sin>
    9857:	83 c4 10             	add    $0x10,%esp
    985a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    985d:	83 c0 6c             	add    $0x6c,%eax
    9860:	dd 1c c5 00 ed 00 00 	fstpl  0xed00(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    9867:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    986b:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    986f:	7e bc                	jle    982d <inv_mdct+0x159>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    9871:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    9878:	eb 13                	jmp    988d <inv_mdct+0x1b9>
         win[3][i] =1.0;
    987a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    987d:	83 c0 6c             	add    $0x6c,%eax
    9880:	d9 e8                	fld1   
    9882:	dd 1c c5 00 ed 00 00 	fstpl  0xed00(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    9889:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    988d:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9891:	7e e7                	jle    987a <inv_mdct+0x1a6>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    9893:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    989a:	eb 36                	jmp    98d2 <inv_mdct+0x1fe>
         win[3][i] = sin( PI/36*(i+0.5) );
    989c:	db 45 f4             	fildl  -0xc(%ebp)
    989f:	dd 05 d0 cf 00 00    	fldl   0xcfd0
    98a5:	de c1                	faddp  %st,%st(1)
    98a7:	dd 05 d8 cf 00 00    	fldl   0xcfd8
    98ad:	de c9                	fmulp  %st,%st(1)
    98af:	83 ec 08             	sub    $0x8,%esp
    98b2:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    98b6:	dd 1c 24             	fstpl  (%esp)
    98b9:	e8 8f a6 ff ff       	call   3f4d <sin>
    98be:	83 c4 10             	add    $0x10,%esp
    98c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    98c4:	83 c0 6c             	add    $0x6c,%eax
    98c7:	dd 1c c5 00 ed 00 00 	fstpl  0xed00(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    98ce:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    98d2:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    98d6:	7e c4                	jle    989c <inv_mdct+0x1c8>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    98d8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    98df:	eb 36                	jmp    9917 <inv_mdct+0x243>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    98e1:	db 45 f4             	fildl  -0xc(%ebp)
    98e4:	dd 05 d0 cf 00 00    	fldl   0xcfd0
    98ea:	de c1                	faddp  %st,%st(1)
    98ec:	dd 05 c0 cf 00 00    	fldl   0xcfc0
    98f2:	de c9                	fmulp  %st,%st(1)
    98f4:	83 ec 08             	sub    $0x8,%esp
    98f7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    98fb:	dd 1c 24             	fstpl  (%esp)
    98fe:	e8 4a a6 ff ff       	call   3f4d <sin>
    9903:	83 c4 10             	add    $0x10,%esp
    9906:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9909:	83 c0 48             	add    $0x48,%eax
    990c:	dd 1c c5 00 ed 00 00 	fstpl  0xed00(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    9913:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9917:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    991b:	7e c4                	jle    98e1 <inv_mdct+0x20d>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    991d:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    9924:	eb 13                	jmp    9939 <inv_mdct+0x265>
         win[2][i] = 0.0 ;
    9926:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9929:	83 c0 48             	add    $0x48,%eax
    992c:	d9 ee                	fldz   
    992e:	dd 1c c5 00 ed 00 00 	fstpl  0xed00(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    9935:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9939:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    993d:	7e e7                	jle    9926 <inv_mdct+0x252>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    993f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9946:	eb 2b                	jmp    9973 <inv_mdct+0x29f>
         COS[i] = cos(PI/(2*36) * i);
    9948:	db 45 f4             	fildl  -0xc(%ebp)
    994b:	dd 05 f0 cf 00 00    	fldl   0xcff0
    9951:	de c9                	fmulp  %st,%st(1)
    9953:	83 ec 08             	sub    $0x8,%esp
    9956:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    995a:	dd 1c 24             	fstpl  (%esp)
    995d:	e8 8a a6 ff ff       	call   3fec <cos>
    9962:	83 c4 10             	add    $0x10,%esp
    9965:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9968:	dd 1c c5 80 f1 00 00 	fstpl  0xf180(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    996f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9973:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    997a:	7e cc                	jle    9948 <inv_mdct+0x274>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    997c:	a1 c0 ec 00 00       	mov    0xecc0,%eax
    9981:	83 c0 01             	add    $0x1,%eax
    9984:	a3 c0 ec 00 00       	mov    %eax,0xecc0
    }

    for(i=0;i<36;i++)
    9989:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9990:	eb 17                	jmp    99a9 <inv_mdct+0x2d5>
       out[i]=0;
    9992:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9995:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    999c:	8b 45 0c             	mov    0xc(%ebp),%eax
    999f:	01 d0                	add    %edx,%eax
    99a1:	d9 ee                	fldz   
    99a3:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    99a5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    99a9:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    99ad:	7e e3                	jle    9992 <inv_mdct+0x2be>
       out[i]=0;

    if(block_type == 2){
    99af:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    99b3:	0f 85 8f 01 00 00    	jne    9b48 <inv_mdct+0x474>
       N=12;
    99b9:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    99c0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    99c7:	e9 6d 01 00 00       	jmp    9b39 <inv_mdct+0x465>
          for(p= 0;p<N;p++){
    99cc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    99d3:	e9 e9 00 00 00       	jmp    9ac1 <inv_mdct+0x3ed>
             sum = 0.0;
    99d8:	d9 ee                	fldz   
    99da:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    99dd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    99e4:	e9 99 00 00 00       	jmp    9a82 <inv_mdct+0x3ae>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    99e9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    99ec:	89 d0                	mov    %edx,%eax
    99ee:	01 c0                	add    %eax,%eax
    99f0:	01 c2                	add    %eax,%edx
    99f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    99f5:	01 d0                	add    %edx,%eax
    99f7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    99fe:	8b 45 08             	mov    0x8(%ebp),%eax
    9a01:	01 d0                	add    %edx,%eax
    9a03:	dd 00                	fldl   (%eax)
    9a05:	dd 9d 70 ff ff ff    	fstpl  -0x90(%ebp)
    9a0b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9a0e:	01 c0                	add    %eax,%eax
    9a10:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    9a16:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    9a1c:	dd 05 f8 cf 00 00    	fldl   0xcff8
    9a22:	de f1                	fdivp  %st,%st(1)
    9a24:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9a27:	01 c0                	add    %eax,%eax
    9a29:	8d 50 01             	lea    0x1(%eax),%edx
    9a2c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9a2f:	89 c1                	mov    %eax,%ecx
    9a31:	c1 e9 1f             	shr    $0x1f,%ecx
    9a34:	01 c8                	add    %ecx,%eax
    9a36:	d1 f8                	sar    %eax
    9a38:	01 d0                	add    %edx,%eax
    9a3a:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    9a40:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    9a46:	de c9                	fmulp  %st,%st(1)
    9a48:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9a4b:	01 c0                	add    %eax,%eax
    9a4d:	83 c0 01             	add    $0x1,%eax
    9a50:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
    9a56:	db 85 6c ff ff ff    	fildl  -0x94(%ebp)
    9a5c:	de c9                	fmulp  %st,%st(1)
    9a5e:	83 ec 08             	sub    $0x8,%esp
    9a61:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9a65:	dd 1c 24             	fstpl  (%esp)
    9a68:	e8 7f a5 ff ff       	call   3fec <cos>
    9a6d:	83 c4 10             	add    $0x10,%esp
    9a70:	dc 8d 70 ff ff ff    	fmull  -0x90(%ebp)
    9a76:	dd 45 e0             	fldl   -0x20(%ebp)
    9a79:	de c1                	faddp  %st,%st(1)
    9a7b:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    9a7e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9a82:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9a85:	89 c2                	mov    %eax,%edx
    9a87:	c1 ea 1f             	shr    $0x1f,%edx
    9a8a:	01 d0                	add    %edx,%eax
    9a8c:	d1 f8                	sar    %eax
    9a8e:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    9a91:	0f 8f 52 ff ff ff    	jg     99e9 <inv_mdct+0x315>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    9a97:	8b 55 10             	mov    0x10(%ebp),%edx
    9a9a:	89 d0                	mov    %edx,%eax
    9a9c:	c1 e0 03             	shl    $0x3,%eax
    9a9f:	01 d0                	add    %edx,%eax
    9aa1:	c1 e0 02             	shl    $0x2,%eax
    9aa4:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9aa7:	01 d0                	add    %edx,%eax
    9aa9:	dd 04 c5 00 ed 00 00 	fldl   0xed00(,%eax,8)
    9ab0:	dc 4d e0             	fmull  -0x20(%ebp)
    9ab3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9ab6:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    9abd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9ac1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9ac4:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9ac7:	0f 8c 0b ff ff ff    	jl     99d8 <inv_mdct+0x304>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    9acd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9ad4:	eb 57                	jmp    9b2d <inv_mdct+0x459>
             out[6*i+p+6] += tmp[p];
    9ad6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9ad9:	89 d0                	mov    %edx,%eax
    9adb:	01 c0                	add    %eax,%eax
    9add:	01 d0                	add    %edx,%eax
    9adf:	01 c0                	add    %eax,%eax
    9ae1:	89 c2                	mov    %eax,%edx
    9ae3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9ae6:	01 d0                	add    %edx,%eax
    9ae8:	83 c0 06             	add    $0x6,%eax
    9aeb:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9af2:	8b 45 0c             	mov    0xc(%ebp),%eax
    9af5:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9af8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9afb:	89 d0                	mov    %edx,%eax
    9afd:	01 c0                	add    %eax,%eax
    9aff:	01 d0                	add    %edx,%eax
    9b01:	01 c0                	add    %eax,%eax
    9b03:	89 c2                	mov    %eax,%edx
    9b05:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9b08:	01 d0                	add    %edx,%eax
    9b0a:	83 c0 06             	add    $0x6,%eax
    9b0d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9b14:	8b 45 0c             	mov    0xc(%ebp),%eax
    9b17:	01 d0                	add    %edx,%eax
    9b19:	dd 00                	fldl   (%eax)
    9b1b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9b1e:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    9b25:	de c1                	faddp  %st,%st(1)
    9b27:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    9b29:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9b2d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9b30:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9b33:	7c a1                	jl     9ad6 <inv_mdct+0x402>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    9b35:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9b39:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    9b3d:	0f 8e 89 fe ff ff    	jle    99cc <inv_mdct+0x2f8>
    9b43:	e9 da 00 00 00       	jmp    9c22 <inv_mdct+0x54e>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    9b48:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    9b4f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9b56:	e9 bb 00 00 00       	jmp    9c16 <inv_mdct+0x542>
         sum = 0.0;
    9b5b:	d9 ee                	fldz   
    9b5d:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    9b60:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9b67:	eb 6a                	jmp    9bd3 <inv_mdct+0x4ff>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    9b69:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9b6c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9b73:	8b 45 08             	mov    0x8(%ebp),%eax
    9b76:	01 d0                	add    %edx,%eax
    9b78:	dd 00                	fldl   (%eax)
    9b7a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9b7d:	01 c0                	add    %eax,%eax
    9b7f:	8d 50 01             	lea    0x1(%eax),%edx
    9b82:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9b85:	89 c1                	mov    %eax,%ecx
    9b87:	c1 e9 1f             	shr    $0x1f,%ecx
    9b8a:	01 c8                	add    %ecx,%eax
    9b8c:	d1 f8                	sar    %eax
    9b8e:	01 c2                	add    %eax,%edx
    9b90:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9b93:	01 c0                	add    %eax,%eax
    9b95:	83 c0 01             	add    $0x1,%eax
    9b98:	89 d1                	mov    %edx,%ecx
    9b9a:	0f af c8             	imul   %eax,%ecx
    9b9d:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9ba2:	89 c8                	mov    %ecx,%eax
    9ba4:	f7 ea                	imul   %edx
    9ba6:	c1 fa 05             	sar    $0x5,%edx
    9ba9:	89 c8                	mov    %ecx,%eax
    9bab:	c1 f8 1f             	sar    $0x1f,%eax
    9bae:	29 c2                	sub    %eax,%edx
    9bb0:	89 d0                	mov    %edx,%eax
    9bb2:	c1 e0 03             	shl    $0x3,%eax
    9bb5:	01 d0                	add    %edx,%eax
    9bb7:	c1 e0 04             	shl    $0x4,%eax
    9bba:	29 c1                	sub    %eax,%ecx
    9bbc:	89 ca                	mov    %ecx,%edx
    9bbe:	dd 04 d5 80 f1 00 00 	fldl   0xf180(,%edx,8)
    9bc5:	de c9                	fmulp  %st,%st(1)
    9bc7:	dd 45 e0             	fldl   -0x20(%ebp)
    9bca:	de c1                	faddp  %st,%st(1)
    9bcc:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    9bcf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9bd3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9bd6:	89 c2                	mov    %eax,%edx
    9bd8:	c1 ea 1f             	shr    $0x1f,%edx
    9bdb:	01 d0                	add    %edx,%eax
    9bdd:	d1 f8                	sar    %eax
    9bdf:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    9be2:	7f 85                	jg     9b69 <inv_mdct+0x495>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    9be4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9be7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9bee:	8b 45 0c             	mov    0xc(%ebp),%eax
    9bf1:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9bf4:	8b 55 10             	mov    0x10(%ebp),%edx
    9bf7:	89 d0                	mov    %edx,%eax
    9bf9:	c1 e0 03             	shl    $0x3,%eax
    9bfc:	01 d0                	add    %edx,%eax
    9bfe:	c1 e0 02             	shl    $0x2,%eax
    9c01:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9c04:	01 d0                	add    %edx,%eax
    9c06:	dd 04 c5 00 ed 00 00 	fldl   0xed00(,%eax,8)
    9c0d:	dc 4d e0             	fmull  -0x20(%ebp)
    9c10:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    9c12:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9c16:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9c19:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9c1c:	0f 8c 39 ff ff ff    	jl     9b5b <inv_mdct+0x487>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    9c22:	c9                   	leave  
    9c23:	c3                   	ret    

00009c24 <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    9c24:	55                   	push   %ebp
    9c25:	89 e5                	mov    %esp,%ebp
    9c27:	53                   	push   %ebx
    9c28:	81 ec 44 01 00 00    	sub    $0x144,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    9c2e:	a1 84 eb 00 00       	mov    0xeb84,%eax
    9c33:	85 c0                	test   %eax,%eax
    9c35:	74 6f                	je     9ca6 <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    9c37:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9c3e:	eb 56                	jmp    9c96 <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    9c40:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9c47:	eb 43                	jmp    9c8c <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    9c49:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9c50:	eb 30                	jmp    9c82 <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    9c52:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9c55:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9c58:	89 c2                	mov    %eax,%edx
    9c5a:	c1 e2 03             	shl    $0x3,%edx
    9c5d:	01 c2                	add    %eax,%edx
    9c5f:	8d 04 12             	lea    (%edx,%edx,1),%eax
    9c62:	89 c2                	mov    %eax,%edx
    9c64:	89 c8                	mov    %ecx,%eax
    9c66:	c1 e0 03             	shl    $0x3,%eax
    9c69:	01 c8                	add    %ecx,%eax
    9c6b:	c1 e0 06             	shl    $0x6,%eax
    9c6e:	01 c2                	add    %eax,%edx
    9c70:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9c73:	01 d0                	add    %edx,%eax
    9c75:	d9 ee                	fldz   
    9c77:	dd 1c c5 00 f6 00 00 	fstpl  0xf600(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    9c7e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9c82:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    9c86:	7e ca                	jle    9c52 <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    9c88:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9c8c:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    9c90:	7e b7                	jle    9c49 <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    9c92:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9c96:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    9c9a:	7e a4                	jle    9c40 <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    9c9c:	c7 05 84 eb 00 00 00 	movl   $0x0,0xeb84
    9ca3:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9ca6:	8b 45 18             	mov    0x18(%ebp),%eax
    9ca9:	8b 40 10             	mov    0x10(%eax),%eax
    9cac:	85 c0                	test   %eax,%eax
    9cae:	74 10                	je     9cc0 <III_hybrid+0x9c>
    9cb0:	8b 45 18             	mov    0x18(%ebp),%eax
    9cb3:	8b 40 18             	mov    0x18(%eax),%eax
    9cb6:	85 c0                	test   %eax,%eax
    9cb8:	74 06                	je     9cc0 <III_hybrid+0x9c>
    9cba:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    9cbe:	7e 08                	jle    9cc8 <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    9cc0:	8b 45 18             	mov    0x18(%ebp),%eax
    9cc3:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9cc6:	eb 05                	jmp    9ccd <III_hybrid+0xa9>
    9cc8:	b8 00 00 00 00       	mov    $0x0,%eax
    9ccd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    9cd0:	83 ec 04             	sub    $0x4,%esp
    9cd3:	ff 75 e4             	pushl  -0x1c(%ebp)
    9cd6:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    9cdc:	50                   	push   %eax
    9cdd:	ff 75 08             	pushl  0x8(%ebp)
    9ce0:	e8 ef f9 ff ff       	call   96d4 <inv_mdct>
    9ce5:	83 c4 10             	add    $0x10,%esp

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    9ce8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9cef:	e9 83 00 00 00       	jmp    9d77 <III_hybrid+0x153>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    9cf4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9cf7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9cfe:	8b 45 0c             	mov    0xc(%ebp),%eax
    9d01:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9d04:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d07:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    9d0e:	8b 45 10             	mov    0x10(%ebp),%eax
    9d11:	8b 4d 14             	mov    0x14(%ebp),%ecx
    9d14:	89 c2                	mov    %eax,%edx
    9d16:	c1 e2 03             	shl    $0x3,%edx
    9d19:	01 c2                	add    %eax,%edx
    9d1b:	8d 04 12             	lea    (%edx,%edx,1),%eax
    9d1e:	89 c2                	mov    %eax,%edx
    9d20:	89 c8                	mov    %ecx,%eax
    9d22:	c1 e0 03             	shl    $0x3,%eax
    9d25:	01 c8                	add    %ecx,%eax
    9d27:	c1 e0 06             	shl    $0x6,%eax
    9d2a:	01 c2                	add    %eax,%edx
    9d2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d2f:	01 d0                	add    %edx,%eax
    9d31:	dd 04 c5 00 f6 00 00 	fldl   0xf600(,%eax,8)
    9d38:	de c1                	faddp  %st,%st(1)
    9d3a:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    9d3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d3f:	83 c0 12             	add    $0x12,%eax
    9d42:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    9d49:	8b 45 10             	mov    0x10(%ebp),%eax
    9d4c:	8b 4d 14             	mov    0x14(%ebp),%ecx
    9d4f:	89 c2                	mov    %eax,%edx
    9d51:	c1 e2 03             	shl    $0x3,%edx
    9d54:	01 c2                	add    %eax,%edx
    9d56:	8d 04 12             	lea    (%edx,%edx,1),%eax
    9d59:	89 c2                	mov    %eax,%edx
    9d5b:	89 c8                	mov    %ecx,%eax
    9d5d:	c1 e0 03             	shl    $0x3,%eax
    9d60:	01 c8                	add    %ecx,%eax
    9d62:	c1 e0 06             	shl    $0x6,%eax
    9d65:	01 c2                	add    %eax,%edx
    9d67:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d6a:	01 d0                	add    %edx,%eax
    9d6c:	dd 1c c5 00 f6 00 00 	fstpl  0xf600(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    9d73:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9d77:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9d7b:	0f 8e 73 ff ff ff    	jle    9cf4 <III_hybrid+0xd0>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    9d81:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    9d84:	c9                   	leave  
    9d85:	c3                   	ret    

00009d86 <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    9d86:	55                   	push   %ebp
    9d87:	89 e5                	mov    %esp,%ebp
    9d89:	57                   	push   %edi
    9d8a:	56                   	push   %esi
    9d8b:	53                   	push   %ebx
    9d8c:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    9d8f:	be 00 00 00 00       	mov    $0x0,%esi
    9d94:	e9 1a 01 00 00       	jmp    9eb3 <create_syn_filter+0x12d>
		for (k=0; k<32; k++) {
    9d99:	bb 00 00 00 00       	mov    $0x0,%ebx
    9d9e:	e9 04 01 00 00       	jmp    9ea7 <create_syn_filter+0x121>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    9da3:	89 f0                	mov    %esi,%eax
    9da5:	c1 e0 08             	shl    $0x8,%eax
    9da8:	89 c2                	mov    %eax,%edx
    9daa:	8b 45 08             	mov    0x8(%ebp),%eax
    9dad:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    9db0:	89 75 dc             	mov    %esi,-0x24(%ebp)
    9db3:	db 45 dc             	fildl  -0x24(%ebp)
    9db6:	dd 05 00 d0 00 00    	fldl   0xd000
    9dbc:	de c9                	fmulp  %st,%st(1)
    9dbe:	dd 05 08 d0 00 00    	fldl   0xd008
    9dc4:	de c1                	faddp  %st,%st(1)
    9dc6:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    9dc9:	83 c0 01             	add    $0x1,%eax
    9dcc:	89 45 dc             	mov    %eax,-0x24(%ebp)
    9dcf:	db 45 dc             	fildl  -0x24(%ebp)
    9dd2:	de c9                	fmulp  %st,%st(1)
    9dd4:	83 ec 08             	sub    $0x8,%esp
    9dd7:	8d 64 24 f8          	lea    -0x8(%esp),%esp
    9ddb:	dd 1c 24             	fstpl  (%esp)
    9dde:	e8 09 a2 ff ff       	call   3fec <cos>
    9de3:	83 c4 10             	add    $0x10,%esp
    9de6:	dd 05 10 d0 00 00    	fldl   0xd010
    9dec:	de c9                	fmulp  %st,%st(1)
    9dee:	dd 1c df             	fstpl  (%edi,%ebx,8)
    9df1:	dd 04 df             	fldl   (%edi,%ebx,8)
    9df4:	d9 ee                	fldz   
    9df6:	d9 c9                	fxch   %st(1)
    9df8:	df e9                	fucomip %st(1),%st
    9dfa:	dd d8                	fstp   %st(0)
    9dfc:	72 41                	jb     9e3f <create_syn_filter+0xb9>
				filter[i][k] = (int)(filter[i][k]+0.5);
    9dfe:	89 f0                	mov    %esi,%eax
    9e00:	c1 e0 08             	shl    $0x8,%eax
    9e03:	89 c2                	mov    %eax,%edx
    9e05:	8b 45 08             	mov    0x8(%ebp),%eax
    9e08:	01 c2                	add    %eax,%edx
    9e0a:	89 f0                	mov    %esi,%eax
    9e0c:	c1 e0 08             	shl    $0x8,%eax
    9e0f:	89 c1                	mov    %eax,%ecx
    9e11:	8b 45 08             	mov    0x8(%ebp),%eax
    9e14:	01 c8                	add    %ecx,%eax
    9e16:	dd 04 d8             	fldl   (%eax,%ebx,8)
    9e19:	dd 05 d0 cf 00 00    	fldl   0xcfd0
    9e1f:	de c1                	faddp  %st,%st(1)
    9e21:	d9 7d e6             	fnstcw -0x1a(%ebp)
    9e24:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    9e28:	b4 0c                	mov    $0xc,%ah
    9e2a:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    9e2e:	d9 6d e4             	fldcw  -0x1c(%ebp)
    9e31:	db 5d dc             	fistpl -0x24(%ebp)
    9e34:	d9 6d e6             	fldcw  -0x1a(%ebp)
    9e37:	db 45 dc             	fildl  -0x24(%ebp)
    9e3a:	dd 1c da             	fstpl  (%edx,%ebx,8)
    9e3d:	eb 3f                	jmp    9e7e <create_syn_filter+0xf8>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    9e3f:	89 f0                	mov    %esi,%eax
    9e41:	c1 e0 08             	shl    $0x8,%eax
    9e44:	89 c2                	mov    %eax,%edx
    9e46:	8b 45 08             	mov    0x8(%ebp),%eax
    9e49:	01 c2                	add    %eax,%edx
    9e4b:	89 f0                	mov    %esi,%eax
    9e4d:	c1 e0 08             	shl    $0x8,%eax
    9e50:	89 c1                	mov    %eax,%ecx
    9e52:	8b 45 08             	mov    0x8(%ebp),%eax
    9e55:	01 c8                	add    %ecx,%eax
    9e57:	dd 04 d8             	fldl   (%eax,%ebx,8)
    9e5a:	dd 05 d0 cf 00 00    	fldl   0xcfd0
    9e60:	de e9                	fsubrp %st,%st(1)
    9e62:	d9 7d e6             	fnstcw -0x1a(%ebp)
    9e65:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    9e69:	b4 0c                	mov    $0xc,%ah
    9e6b:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    9e6f:	d9 6d e4             	fldcw  -0x1c(%ebp)
    9e72:	db 5d dc             	fistpl -0x24(%ebp)
    9e75:	d9 6d e6             	fldcw  -0x1a(%ebp)
    9e78:	db 45 dc             	fildl  -0x24(%ebp)
    9e7b:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    9e7e:	89 f0                	mov    %esi,%eax
    9e80:	c1 e0 08             	shl    $0x8,%eax
    9e83:	89 c2                	mov    %eax,%edx
    9e85:	8b 45 08             	mov    0x8(%ebp),%eax
    9e88:	01 d0                	add    %edx,%eax
    9e8a:	89 f2                	mov    %esi,%edx
    9e8c:	89 d1                	mov    %edx,%ecx
    9e8e:	c1 e1 08             	shl    $0x8,%ecx
    9e91:	8b 55 08             	mov    0x8(%ebp),%edx
    9e94:	01 ca                	add    %ecx,%edx
    9e96:	dd 04 da             	fldl   (%edx,%ebx,8)
    9e99:	dd 05 18 d0 00 00    	fldl   0xd018
    9e9f:	de c9                	fmulp  %st,%st(1)
    9ea1:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    9ea4:	83 c3 01             	add    $0x1,%ebx
    9ea7:	83 fb 1f             	cmp    $0x1f,%ebx
    9eaa:	0f 8e f3 fe ff ff    	jle    9da3 <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    9eb0:	83 c6 01             	add    $0x1,%esi
    9eb3:	83 fe 3f             	cmp    $0x3f,%esi
    9eb6:	0f 8e dd fe ff ff    	jle    9d99 <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    9ebc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    9ebf:	5b                   	pop    %ebx
    9ec0:	5e                   	pop    %esi
    9ec1:	5f                   	pop    %edi
    9ec2:	5d                   	pop    %ebp
    9ec3:	c3                   	ret    

00009ec4 <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    9ec4:	55                   	push   %ebp
    9ec5:	89 e5                	mov    %esp,%ebp
    9ec7:	57                   	push   %edi
    9ec8:	56                   	push   %esi
    9ec9:	53                   	push   %ebx
    9eca:	81 ec 04 10 00 00    	sub    $0x1004,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    9ed0:	8d 85 f0 ef ff ff    	lea    -0x1010(%ebp),%eax
    9ed6:	bb 80 bf 00 00       	mov    $0xbf80,%ebx
    9edb:	ba 00 04 00 00       	mov    $0x400,%edx
    9ee0:	89 c7                	mov    %eax,%edi
    9ee2:	89 de                	mov    %ebx,%esi
    9ee4:	89 d1                	mov    %edx,%ecx
    9ee6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    9ee8:	8d 85 f0 ef ff ff    	lea    -0x1010(%ebp),%eax
    9eee:	89 45 08             	mov    %eax,0x8(%ebp)
}
    9ef1:	81 c4 04 10 00 00    	add    $0x1004,%esp
    9ef7:	5b                   	pop    %ebx
    9ef8:	5e                   	pop    %esi
    9ef9:	5f                   	pop    %edi
    9efa:	5d                   	pop    %ebp
    9efb:	c3                   	ret    

00009efc <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    9efc:	55                   	push   %ebp
    9efd:	89 e5                	mov    %esp,%ebp
    9eff:	57                   	push   %edi
    9f00:	56                   	push   %esi
    9f01:	53                   	push   %ebx
    9f02:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    9f05:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    9f0c:	a1 88 eb 00 00       	mov    0xeb88,%eax
    9f11:	85 c0                	test   %eax,%eax
    9f13:	74 7a                	je     9f8f <SubBandSynthesis+0x93>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    9f15:	83 ec 08             	sub    $0x8,%esp
    9f18:	68 80 cf 00 00       	push   $0xcf80
    9f1d:	68 00 40 00 00       	push   $0x4000
    9f22:	e8 af a7 ff ff       	call   46d6 <mem_alloc>
    9f27:	83 c4 10             	add    $0x10,%esp
    9f2a:	a3 00 1a 01 00       	mov    %eax,0x11a00
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    9f2f:	83 ec 08             	sub    $0x8,%esp
    9f32:	68 83 cf 00 00       	push   $0xcf83
    9f37:	68 00 40 00 00       	push   $0x4000
    9f3c:	e8 95 a7 ff ff       	call   46d6 <mem_alloc>
    9f41:	83 c4 10             	add    $0x10,%esp
    9f44:	a3 04 1a 01 00       	mov    %eax,0x11a04
		create_syn_filter(*filter);
    9f49:	a1 04 1a 01 00       	mov    0x11a04,%eax
    9f4e:	83 ec 0c             	sub    $0xc,%esp
    9f51:	50                   	push   %eax
    9f52:	e8 2f fe ff ff       	call   9d86 <create_syn_filter>
    9f57:	83 c4 10             	add    $0x10,%esp
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    9f5a:	83 ec 08             	sub    $0x8,%esp
    9f5d:	68 86 cf 00 00       	push   $0xcf86
    9f62:	68 00 10 00 00       	push   $0x1000
    9f67:	e8 6a a7 ff ff       	call   46d6 <mem_alloc>
    9f6c:	83 c4 10             	add    $0x10,%esp
    9f6f:	a3 08 1a 01 00       	mov    %eax,0x11a08
		read_syn_window(window);
    9f74:	a1 08 1a 01 00       	mov    0x11a08,%eax
    9f79:	83 ec 0c             	sub    $0xc,%esp
    9f7c:	50                   	push   %eax
    9f7d:	e8 42 ff ff ff       	call   9ec4 <read_syn_window>
    9f82:	83 c4 10             	add    $0x10,%esp
		init = 0;
    9f85:	c7 05 88 eb 00 00 00 	movl   $0x0,0xeb88
    9f8c:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    9f8f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9f92:	8b 04 85 8c eb 00 00 	mov    0xeb8c(,%eax,4),%eax
    9f99:	83 e8 40             	sub    $0x40,%eax
    9f9c:	25 ff 03 00 00       	and    $0x3ff,%eax
    9fa1:	89 c2                	mov    %eax,%edx
    9fa3:	8b 45 0c             	mov    0xc(%ebp),%eax
    9fa6:	89 14 85 8c eb 00 00 	mov    %edx,0xeb8c(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    9fad:	8b 15 00 1a 01 00    	mov    0x11a00,%edx
    9fb3:	8b 45 0c             	mov    0xc(%ebp),%eax
    9fb6:	8b 04 85 8c eb 00 00 	mov    0xeb8c(,%eax,4),%eax
    9fbd:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9fc0:	c1 e1 0a             	shl    $0xa,%ecx
    9fc3:	01 c8                	add    %ecx,%eax
    9fc5:	c1 e0 03             	shl    $0x3,%eax
    9fc8:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    9fcb:	bb 00 00 00 00       	mov    $0x0,%ebx
    9fd0:	eb 40                	jmp    a012 <SubBandSynthesis+0x116>
		sum = 0;
    9fd2:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    9fd4:	be 00 00 00 00       	mov    $0x0,%esi
    9fd9:	eb 26                	jmp    a001 <SubBandSynthesis+0x105>
			sum += bandPtr[k] * (*filter)[i][k];
    9fdb:	89 f0                	mov    %esi,%eax
    9fdd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9fe4:	8b 45 08             	mov    0x8(%ebp),%eax
    9fe7:	01 d0                	add    %edx,%eax
    9fe9:	dd 00                	fldl   (%eax)
    9feb:	a1 04 1a 01 00       	mov    0x11a04,%eax
    9ff0:	89 da                	mov    %ebx,%edx
    9ff2:	c1 e2 05             	shl    $0x5,%edx
    9ff5:	01 f2                	add    %esi,%edx
    9ff7:	dd 04 d0             	fldl   (%eax,%edx,8)
    9ffa:	de c9                	fmulp  %st,%st(1)
    9ffc:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    9ffe:	83 c6 01             	add    $0x1,%esi
    a001:	83 fe 1f             	cmp    $0x1f,%esi
    a004:	7e d5                	jle    9fdb <SubBandSynthesis+0xdf>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    a006:	89 d8                	mov    %ebx,%eax
    a008:	c1 e0 03             	shl    $0x3,%eax
    a00b:	01 f8                	add    %edi,%eax
    a00d:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    a00f:	83 c3 01             	add    $0x1,%ebx
    a012:	83 fb 3f             	cmp    $0x3f,%ebx
    a015:	7e bb                	jle    9fd2 <SubBandSynthesis+0xd6>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    a017:	bf 00 00 00 00       	mov    $0x0,%edi
    a01c:	e9 c7 00 00 00       	jmp    a0e8 <SubBandSynthesis+0x1ec>
		sum = 0;
    a021:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    a023:	bb 00 00 00 00       	mov    $0x0,%ebx
    a028:	eb 4c                	jmp    a076 <SubBandSynthesis+0x17a>
			k = j + (i<<5);
    a02a:	89 d8                	mov    %ebx,%eax
    a02c:	c1 e0 05             	shl    $0x5,%eax
    a02f:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a032:	a1 08 1a 01 00       	mov    0x11a08,%eax
    a037:	89 f2                	mov    %esi,%edx
    a039:	c1 e2 03             	shl    $0x3,%edx
    a03c:	01 d0                	add    %edx,%eax
    a03e:	dd 00                	fldl   (%eax)
    a040:	a1 00 1a 01 00       	mov    0x11a00,%eax
    a045:	8d 53 01             	lea    0x1(%ebx),%edx
    a048:	d1 fa                	sar    %edx
    a04a:	c1 e2 06             	shl    $0x6,%edx
    a04d:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    a050:	8b 55 0c             	mov    0xc(%ebp),%edx
    a053:	8b 14 95 8c eb 00 00 	mov    0xeb8c(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a05a:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    a05c:	89 d1                	mov    %edx,%ecx
    a05e:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a064:	8b 55 0c             	mov    0xc(%ebp),%edx
    a067:	c1 e2 0a             	shl    $0xa,%edx
    a06a:	01 ca                	add    %ecx,%edx
    a06c:	dd 04 d0             	fldl   (%eax,%edx,8)
    a06f:	de c9                	fmulp  %st,%st(1)
    a071:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    a073:	83 c3 01             	add    $0x1,%ebx
    a076:	83 fb 0f             	cmp    $0xf,%ebx
    a079:	7e af                	jle    a02a <SubBandSynthesis+0x12e>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    a07b:	dd 05 20 d0 00 00    	fldl   0xd020
    a081:	de c9                	fmulp  %st,%st(1)
    a083:	d9 7d d6             	fnstcw -0x2a(%ebp)
    a086:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    a08a:	b4 0c                	mov    $0xc,%ah
    a08c:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    a090:	d9 6d d4             	fldcw  -0x2c(%ebp)
    a093:	db 5d e0             	fistpl -0x20(%ebp)
    a096:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    a099:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    a0a0:	7e 15                	jle    a0b7 <SubBandSynthesis+0x1bb>
    a0a2:	89 f8                	mov    %edi,%eax
    a0a4:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a0a7:	8b 45 10             	mov    0x10(%ebp),%eax
    a0aa:	01 d0                	add    %edx,%eax
    a0ac:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    a0b1:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a0b5:	eb 2e                	jmp    a0e5 <SubBandSynthesis+0x1e9>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    a0b7:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    a0be:	7d 15                	jge    a0d5 <SubBandSynthesis+0x1d9>
    a0c0:	89 f8                	mov    %edi,%eax
    a0c2:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a0c5:	8b 45 10             	mov    0x10(%ebp),%eax
    a0c8:	01 d0                	add    %edx,%eax
    a0ca:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    a0cf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a0d3:	eb 10                	jmp    a0e5 <SubBandSynthesis+0x1e9>
			else                           samples[j] = foo;
    a0d5:	89 f8                	mov    %edi,%eax
    a0d7:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a0da:	8b 45 10             	mov    0x10(%ebp),%eax
    a0dd:	01 d0                	add    %edx,%eax
    a0df:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a0e2:	66 89 10             	mov    %dx,(%eax)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    a0e5:	83 c7 01             	add    $0x1,%edi
    a0e8:	83 ff 1f             	cmp    $0x1f,%edi
    a0eb:	0f 8e 30 ff ff ff    	jle    a021 <SubBandSynthesis+0x125>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    a0f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    a0f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a0f7:	5b                   	pop    %ebx
    a0f8:	5e                   	pop    %esi
    a0f9:	5f                   	pop    %edi
    a0fa:	5d                   	pop    %ebp
    a0fb:	c3                   	ret    

0000a0fc <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    a0fc:	55                   	push   %ebp
    a0fd:	89 e5                	mov    %esp,%ebp
    a0ff:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    a102:	8b 45 10             	mov    0x10(%ebp),%eax
    a105:	8b 40 08             	mov    0x8(%eax),%eax
    a108:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    a10b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    a112:	eb 75                	jmp    a189 <out_fifo+0x8d>
    a114:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    a11b:	eb 62                	jmp    a17f <out_fifo+0x83>
            (*psampFrames)++;
    a11d:	8b 45 14             	mov    0x14(%ebp),%eax
    a120:	8b 00                	mov    (%eax),%eax
    a122:	8d 50 01             	lea    0x1(%eax),%edx
    a125:	8b 45 14             	mov    0x14(%ebp),%eax
    a128:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    a12a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a131:	eb 40                	jmp    a173 <out_fifo+0x77>
                if (!(k%1600) && k) {
    a133:	8b 0d 0c 1a 01 00    	mov    0x11a0c,%ecx
    a139:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    a13e:	89 c8                	mov    %ecx,%eax
    a140:	f7 ea                	imul   %edx
    a142:	c1 fa 09             	sar    $0x9,%edx
    a145:	89 c8                	mov    %ecx,%eax
    a147:	c1 f8 1f             	sar    $0x1f,%eax
    a14a:	29 c2                	sub    %eax,%edx
    a14c:	89 d0                	mov    %edx,%eax
    a14e:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    a154:	29 c1                	sub    %eax,%ecx
    a156:	89 c8                	mov    %ecx,%eax
    a158:	85 c0                	test   %eax,%eax
    a15a:	75 13                	jne    a16f <out_fifo+0x73>
    a15c:	a1 0c 1a 01 00       	mov    0x11a0c,%eax
    a161:	85 c0                	test   %eax,%eax
    a163:	74 0a                	je     a16f <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    a165:	c7 05 0c 1a 01 00 00 	movl   $0x0,0x11a0c
    a16c:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    a16f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a173:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a176:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a179:	7c b8                	jl     a133 <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    a17b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    a17f:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    a183:	7e 98                	jle    a11d <out_fifo+0x21>
    a185:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    a189:	8b 45 fc             	mov    -0x4(%ebp),%eax
    a18c:	3b 45 0c             	cmp    0xc(%ebp),%eax
    a18f:	7c 83                	jl     a114 <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    a191:	c9                   	leave  
    a192:	c3                   	ret    

0000a193 <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    a193:	55                   	push   %ebp
    a194:	89 e5                	mov    %esp,%ebp
    a196:	83 ec 08             	sub    $0x8,%esp
    *old_crc = getbits(bs, 16);
    a199:	83 ec 08             	sub    $0x8,%esp
    a19c:	6a 10                	push   $0x10
    a19e:	ff 75 08             	pushl  0x8(%ebp)
    a1a1:	e8 14 a8 ff ff       	call   49ba <getbits>
    a1a6:	83 c4 10             	add    $0x10,%esp
    a1a9:	89 c2                	mov    %eax,%edx
    a1ab:	8b 45 0c             	mov    0xc(%ebp),%eax
    a1ae:	89 10                	mov    %edx,(%eax)
}
    a1b0:	c9                   	leave  
    a1b1:	c3                   	ret    

0000a1b2 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    a1b2:	55                   	push   %ebp
    a1b3:	89 e5                	mov    %esp,%ebp
    a1b5:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    a1b8:	8b 45 08             	mov    0x8(%ebp),%eax
    a1bb:	8b 40 0c             	mov    0xc(%eax),%eax
    a1be:	83 c0 1e             	add    $0x1e,%eax
    a1c1:	8b 14 85 80 e6 00 00 	mov    0xe680(,%eax,4),%edx
    a1c8:	89 d0                	mov    %edx,%eax
    a1ca:	c1 e0 03             	shl    $0x3,%eax
    a1cd:	01 d0                	add    %edx,%eax
    a1cf:	c1 e0 04             	shl    $0x4,%eax
    a1d2:	89 45 e8             	mov    %eax,-0x18(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
    a1d5:	db 45 e8             	fildl  -0x18(%ebp)
    a1d8:	8b 45 08             	mov    0x8(%ebp),%eax
    a1db:	8b 40 10             	mov    0x10(%eax),%eax
    a1de:	dd 04 c5 40 e7 00 00 	fldl   0xe740(,%eax,8)
    a1e5:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    a1e7:	d9 7d ee             	fnstcw -0x12(%ebp)
    a1ea:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
    a1ee:	b4 0c                	mov    $0xc,%ah
    a1f0:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    a1f4:	d9 6d ec             	fldcw  -0x14(%ebp)
    a1f7:	db 5d fc             	fistpl -0x4(%ebp)
    a1fa:	d9 6d ee             	fldcw  -0x12(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    a1fd:	8b 45 08             	mov    0x8(%ebp),%eax
    a200:	8b 40 14             	mov    0x14(%eax),%eax
    a203:	85 c0                	test   %eax,%eax
    a205:	74 04                	je     a20b <main_data_slots+0x59>
    a207:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    a20b:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    a20f:	8b 45 08             	mov    0x8(%ebp),%eax
    a212:	8b 40 08             	mov    0x8(%eax),%eax
    a215:	85 c0                	test   %eax,%eax
    a217:	74 04                	je     a21d <main_data_slots+0x6b>
		nSlots -= 2;
    a219:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    a21d:	8b 45 10             	mov    0x10(%ebp),%eax
    a220:	83 f8 01             	cmp    $0x1,%eax
    a223:	75 06                	jne    a22b <main_data_slots+0x79>
		nSlots -= 17;
    a225:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    a229:	eb 04                	jmp    a22f <main_data_slots+0x7d>
	else
		nSlots -=32;
    a22b:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    a22f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    a232:	c9                   	leave  
    a233:	c3                   	ret    
