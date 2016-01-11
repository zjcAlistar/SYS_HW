
_finder:     file format elf32-i386


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
       4:	83 ec 44             	sub    $0x44,%esp
	//int i;
	struct fileItem *temp = (struct fileItem *) malloc(sizeof(struct fileItem));
       7:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
       e:	e8 37 4a 00 00       	call   4a4a <malloc>
      13:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
      16:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
      1d:	e8 28 4a 00 00       	call   4a4a <malloc>
      22:	8b 55 f4             	mov    -0xc(%ebp),%edx
      25:	89 42 14             	mov    %eax,0x14(%edx)
	strcpy(temp->name, name);
      28:	8b 45 f4             	mov    -0xc(%ebp),%eax
      2b:	8b 40 14             	mov    0x14(%eax),%eax
      2e:	8b 55 1c             	mov    0x1c(%ebp),%edx
      31:	89 54 24 04          	mov    %edx,0x4(%esp)
      35:	89 04 24             	mov    %eax,(%esp)
      38:	e8 f6 42 00 00       	call   4333 <strcpy>
//    for (i = 0; name[i] != 0; i++)
//    	{
//    		printf(0, "%d : %c\n", i, name[i]);
//    	}
	//printf(0, "copying name\n");
	temp->st = st;
      3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
      40:	8b 55 08             	mov    0x8(%ebp),%edx
      43:	89 10                	mov    %edx,(%eax)
      45:	8b 55 0c             	mov    0xc(%ebp),%edx
      48:	89 50 04             	mov    %edx,0x4(%eax)
      4b:	8b 55 10             	mov    0x10(%ebp),%edx
      4e:	89 50 08             	mov    %edx,0x8(%eax)
      51:	8b 55 14             	mov    0x14(%ebp),%edx
      54:	89 50 0c             	mov    %edx,0xc(%eax)
      57:	8b 55 18             	mov    0x18(%ebp),%edx
      5a:	89 50 10             	mov    %edx,0x10(%eax)
	temp->pos = getPos(context, itemCounter);
      5d:	8b 15 a8 f7 00 00    	mov    0xf7a8,%edx
      63:	8b 5d f4             	mov    -0xc(%ebp),%ebx
      66:	8d 45 d8             	lea    -0x28(%ebp),%eax
      69:	89 54 24 10          	mov    %edx,0x10(%esp)
      6d:	8b 15 a0 2d 01 00    	mov    0x12da0,%edx
      73:	89 54 24 04          	mov    %edx,0x4(%esp)
      77:	8b 15 a4 2d 01 00    	mov    0x12da4,%edx
      7d:	89 54 24 08          	mov    %edx,0x8(%esp)
      81:	8b 15 a8 2d 01 00    	mov    0x12da8,%edx
      87:	89 54 24 0c          	mov    %edx,0xc(%esp)
      8b:	89 04 24             	mov    %eax,(%esp)
      8e:	e8 89 0d 00 00       	call   e1c <getPos>
      93:	83 ec 04             	sub    $0x4,%esp
      96:	8b 45 d8             	mov    -0x28(%ebp),%eax
      99:	89 43 18             	mov    %eax,0x18(%ebx)
      9c:	8b 45 dc             	mov    -0x24(%ebp),%eax
      9f:	89 43 1c             	mov    %eax,0x1c(%ebx)
      a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
      a5:	89 43 20             	mov    %eax,0x20(%ebx)
      a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      ab:	89 43 24             	mov    %eax,0x24(%ebx)
	temp->next = fileItemList;
      ae:	8b 15 a4 f7 00 00    	mov    0xf7a4,%edx
      b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
      b7:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
      ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
      bd:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
      c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
      c7:	a3 a4 f7 00 00       	mov    %eax,0xf7a4
}
      cc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      cf:	c9                   	leave  
      d0:	c3                   	ret    

000000d1 <freeFileItemList>:

void freeFileItemList() {
      d1:	55                   	push   %ebp
      d2:	89 e5                	mov    %esp,%ebp
      d4:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
      d7:	a1 a4 f7 00 00       	mov    0xf7a4,%eax
      dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
      df:	eb 28                	jmp    109 <freeFileItemList+0x38>
		temp = p;
      e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
      e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
      e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
      ea:	8b 40 2c             	mov    0x2c(%eax),%eax
      ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
		free(temp->name);
      f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
      f3:	8b 40 14             	mov    0x14(%eax),%eax
      f6:	89 04 24             	mov    %eax,(%esp)
      f9:	e8 13 48 00 00       	call   4911 <free>
		free(temp);
      fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
     101:	89 04 24             	mov    %eax,(%esp)
     104:	e8 08 48 00 00       	call   4911 <free>
}

void freeFileItemList() {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
     109:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     10d:	75 d2                	jne    e1 <freeFileItemList+0x10>
		temp = p;
		p = p->next;
		free(temp->name);
		free(temp);
	}
	fileItemList = 0;
     10f:	c7 05 a4 f7 00 00 00 	movl   $0x0,0xf7a4
     116:	00 00 00 
}
     119:	c9                   	leave  
     11a:	c3                   	ret    

0000011b <fmtname>:

// 文件信息相关操作
char* fmtname(char *path) {
     11b:	55                   	push   %ebp
     11c:	89 e5                	mov    %esp,%ebp
     11e:	83 ec 28             	sub    $0x28,%esp
	//static char buf[DIRSIZ+1];
	char *p;

	// Find first character after last slash.
	for (p = path + strlen(path); p >= path && *p != '/'; p--)
     121:	8b 45 08             	mov    0x8(%ebp),%eax
     124:	89 04 24             	mov    %eax,(%esp)
     127:	e8 76 42 00 00       	call   43a2 <strlen>
     12c:	8b 55 08             	mov    0x8(%ebp),%edx
     12f:	01 d0                	add    %edx,%eax
     131:	89 45 f4             	mov    %eax,-0xc(%ebp)
     134:	eb 04                	jmp    13a <fmtname+0x1f>
     136:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     13a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     13d:	3b 45 08             	cmp    0x8(%ebp),%eax
     140:	72 0a                	jb     14c <fmtname+0x31>
     142:	8b 45 f4             	mov    -0xc(%ebp),%eax
     145:	0f b6 00             	movzbl (%eax),%eax
     148:	3c 2f                	cmp    $0x2f,%al
     14a:	75 ea                	jne    136 <fmtname+0x1b>
		;
	p++;
     14c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

	return p;
     150:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     153:	c9                   	leave  
     154:	c3                   	ret    

00000155 <isListable>:

int isListable(char *name, short type) {
     155:	55                   	push   %ebp
     156:	89 e5                	mov    %esp,%ebp
     158:	83 ec 14             	sub    $0x14,%esp
     15b:	8b 45 0c             	mov    0xc(%ebp),%eax
     15e:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	char *p = name;
     162:	8b 45 08             	mov    0x8(%ebp),%eax
     165:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (*p == '.') return 0;
     168:	8b 45 fc             	mov    -0x4(%ebp),%eax
     16b:	0f b6 00             	movzbl (%eax),%eax
     16e:	3c 2e                	cmp    $0x2e,%al
     170:	75 07                	jne    179 <isListable+0x24>
     172:	b8 00 00 00 00       	mov    $0x0,%eax
     177:	eb 34                	jmp    1ad <isListable+0x58>
	if (type == T_DIR) return 1;
     179:	66 83 7d ec 01       	cmpw   $0x1,-0x14(%ebp)
     17e:	75 07                	jne    187 <isListable+0x32>
     180:	b8 01 00 00 00       	mov    $0x1,%eax
     185:	eb 26                	jmp    1ad <isListable+0x58>
	while (*p != 0) {
     187:	eb 15                	jmp    19e <isListable+0x49>
		if (*p == '.')
     189:	8b 45 fc             	mov    -0x4(%ebp),%eax
     18c:	0f b6 00             	movzbl (%eax),%eax
     18f:	3c 2e                	cmp    $0x2e,%al
     191:	75 07                	jne    19a <isListable+0x45>
			return 1;
     193:	b8 01 00 00 00       	mov    $0x1,%eax
     198:	eb 13                	jmp    1ad <isListable+0x58>
		p++;
     19a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)

int isListable(char *name, short type) {
	char *p = name;
	if (*p == '.') return 0;
	if (type == T_DIR) return 1;
	while (*p != 0) {
     19e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     1a1:	0f b6 00             	movzbl (%eax),%eax
     1a4:	84 c0                	test   %al,%al
     1a6:	75 e1                	jne    189 <isListable+0x34>
		if (*p == '.')
			return 1;
		p++;
	}
	return 0;
     1a8:	b8 00 00 00 00       	mov    $0x0,%eax
}
     1ad:	c9                   	leave  
     1ae:	c3                   	ret    

000001af <list>:

void list(char *path) {
     1af:	55                   	push   %ebp
     1b0:	89 e5                	mov    %esp,%ebp
     1b2:	57                   	push   %edi
     1b3:	56                   	push   %esi
     1b4:	53                   	push   %ebx
     1b5:	81 ec 7c 02 00 00    	sub    $0x27c,%esp
	char buf[512], *p;
	int fd;
	struct dirent de;
	struct stat st;

	itemCounter = 0;
     1bb:	c7 05 a8 f7 00 00 00 	movl   $0x0,0xf7a8
     1c2:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     1c5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     1cc:	00 
     1cd:	8b 45 08             	mov    0x8(%ebp),%eax
     1d0:	89 04 24             	mov    %eax,(%esp)
     1d3:	e8 de 43 00 00       	call   45b6 <open>
     1d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     1db:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     1df:	79 20                	jns    201 <list+0x52>
		printf(2, "ls: cannot open %s\n", path);
     1e1:	8b 45 08             	mov    0x8(%ebp),%eax
     1e4:	89 44 24 08          	mov    %eax,0x8(%esp)
     1e8:	c7 44 24 04 e0 ad 00 	movl   $0xade0,0x4(%esp)
     1ef:	00 
     1f0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     1f7:	e8 62 45 00 00       	call   475e <printf>
		return;
     1fc:	e9 8f 02 00 00       	jmp    490 <list+0x2e1>
	}

	if (fstat(fd, &st) < 0) {
     201:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     207:	89 44 24 04          	mov    %eax,0x4(%esp)
     20b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     20e:	89 04 24             	mov    %eax,(%esp)
     211:	e8 b8 43 00 00       	call   45ce <fstat>
     216:	85 c0                	test   %eax,%eax
     218:	79 2b                	jns    245 <list+0x96>
		printf(2, "ls: cannot stat %s\n", path);
     21a:	8b 45 08             	mov    0x8(%ebp),%eax
     21d:	89 44 24 08          	mov    %eax,0x8(%esp)
     221:	c7 44 24 04 f4 ad 00 	movl   $0xadf4,0x4(%esp)
     228:	00 
     229:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     230:	e8 29 45 00 00       	call   475e <printf>
		close(fd);
     235:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     238:	89 04 24             	mov    %eax,(%esp)
     23b:	e8 5e 43 00 00       	call   459e <close>
		return;
     240:	e9 4b 02 00 00       	jmp    490 <list+0x2e1>
	}

	switch (st.type) {
     245:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     24c:	98                   	cwtl   
     24d:	83 f8 01             	cmp    $0x1,%eax
     250:	74 53                	je     2a5 <list+0xf6>
     252:	83 f8 02             	cmp    $0x2,%eax
     255:	0f 85 2a 02 00 00    	jne    485 <list+0x2d6>
	case T_FILE:
		printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
     25b:	8b bd bc fd ff ff    	mov    -0x244(%ebp),%edi
     261:	8b b5 b4 fd ff ff    	mov    -0x24c(%ebp),%esi
     267:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     26e:	0f bf d8             	movswl %ax,%ebx
     271:	8b 45 08             	mov    0x8(%ebp),%eax
     274:	89 04 24             	mov    %eax,(%esp)
     277:	e8 9f fe ff ff       	call   11b <fmtname>
     27c:	89 7c 24 14          	mov    %edi,0x14(%esp)
     280:	89 74 24 10          	mov    %esi,0x10(%esp)
     284:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     288:	89 44 24 08          	mov    %eax,0x8(%esp)
     28c:	c7 44 24 04 08 ae 00 	movl   $0xae08,0x4(%esp)
     293:	00 
     294:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     29b:	e8 be 44 00 00       	call   475e <printf>
		break;
     2a0:	e9 e0 01 00 00       	jmp    485 <list+0x2d6>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     2a5:	8b 45 08             	mov    0x8(%ebp),%eax
     2a8:	89 04 24             	mov    %eax,(%esp)
     2ab:	e8 f2 40 00 00       	call   43a2 <strlen>
     2b0:	83 c0 10             	add    $0x10,%eax
     2b3:	3d 00 02 00 00       	cmp    $0x200,%eax
     2b8:	76 19                	jbe    2d3 <list+0x124>
			printf(1, "ls: path too long\n");
     2ba:	c7 44 24 04 15 ae 00 	movl   $0xae15,0x4(%esp)
     2c1:	00 
     2c2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     2c9:	e8 90 44 00 00       	call   475e <printf>
			break;
     2ce:	e9 b2 01 00 00       	jmp    485 <list+0x2d6>
		}
		strcpy(buf, path);
     2d3:	8b 45 08             	mov    0x8(%ebp),%eax
     2d6:	89 44 24 04          	mov    %eax,0x4(%esp)
     2da:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2e0:	89 04 24             	mov    %eax,(%esp)
     2e3:	e8 4b 40 00 00       	call   4333 <strcpy>
		p = buf + strlen(buf);
     2e8:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2ee:	89 04 24             	mov    %eax,(%esp)
     2f1:	e8 ac 40 00 00       	call   43a2 <strlen>
     2f6:	8d 95 d0 fd ff ff    	lea    -0x230(%ebp),%edx
     2fc:	01 d0                	add    %edx,%eax
     2fe:	89 45 e0             	mov    %eax,-0x20(%ebp)
		*p++ = '/';
     301:	8b 45 e0             	mov    -0x20(%ebp),%eax
     304:	8d 50 01             	lea    0x1(%eax),%edx
     307:	89 55 e0             	mov    %edx,-0x20(%ebp)
     30a:	c6 00 2f             	movb   $0x2f,(%eax)
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     30d:	e9 4c 01 00 00       	jmp    45e <list+0x2af>
			if (de.inum == 0)
     312:	0f b7 85 c0 fd ff ff 	movzwl -0x240(%ebp),%eax
     319:	66 85 c0             	test   %ax,%ax
     31c:	75 05                	jne    323 <list+0x174>
				continue;
     31e:	e9 3b 01 00 00       	jmp    45e <list+0x2af>
			memmove(p, de.name, DIRSIZ);
     323:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
     32a:	00 
     32b:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     331:	83 c0 02             	add    $0x2,%eax
     334:	89 44 24 04          	mov    %eax,0x4(%esp)
     338:	8b 45 e0             	mov    -0x20(%ebp),%eax
     33b:	89 04 24             	mov    %eax,(%esp)
     33e:	e8 ee 41 00 00       	call   4531 <memmove>
			p[DIRSIZ] = 0;
     343:	8b 45 e0             	mov    -0x20(%ebp),%eax
     346:	83 c0 0e             	add    $0xe,%eax
     349:	c6 00 00             	movb   $0x0,(%eax)
			if (stat(buf, &st) < 0) {
     34c:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     352:	89 44 24 04          	mov    %eax,0x4(%esp)
     356:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     35c:	89 04 24             	mov    %eax,(%esp)
     35f:	e8 32 41 00 00       	call   4496 <stat>
     364:	85 c0                	test   %eax,%eax
     366:	79 23                	jns    38b <list+0x1dc>
				printf(1, "ls: cannot stat %s\n", buf);
     368:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     36e:	89 44 24 08          	mov    %eax,0x8(%esp)
     372:	c7 44 24 04 f4 ad 00 	movl   $0xadf4,0x4(%esp)
     379:	00 
     37a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     381:	e8 d8 43 00 00       	call   475e <printf>
				continue;
     386:	e9 d3 00 00 00       	jmp    45e <list+0x2af>
			}
			if (isListable(fmtname(buf), st.type)) {
     38b:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     392:	0f bf d8             	movswl %ax,%ebx
     395:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     39b:	89 04 24             	mov    %eax,(%esp)
     39e:	e8 78 fd ff ff       	call   11b <fmtname>
     3a3:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     3a7:	89 04 24             	mov    %eax,(%esp)
     3aa:	e8 a6 fd ff ff       	call   155 <isListable>
     3af:	85 c0                	test   %eax,%eax
     3b1:	0f 84 a7 00 00 00    	je     45e <list+0x2af>
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
     3b7:	8b 15 a8 f7 00 00    	mov    0xf7a8,%edx
     3bd:	8d 45 d0             	lea    -0x30(%ebp),%eax
     3c0:	89 54 24 10          	mov    %edx,0x10(%esp)
     3c4:	8b 15 a0 2d 01 00    	mov    0x12da0,%edx
     3ca:	89 54 24 04          	mov    %edx,0x4(%esp)
     3ce:	8b 15 a4 2d 01 00    	mov    0x12da4,%edx
     3d4:	89 54 24 08          	mov    %edx,0x8(%esp)
     3d8:	8b 15 a8 2d 01 00    	mov    0x12da8,%edx
     3de:	89 54 24 0c          	mov    %edx,0xc(%esp)
     3e2:	89 04 24             	mov    %eax,(%esp)
     3e5:	e8 32 0a 00 00       	call   e1c <getPos>
     3ea:	83 ec 04             	sub    $0x4,%esp
     3ed:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     3f3:	89 04 24             	mov    %eax,(%esp)
     3f6:	e8 20 fd ff ff       	call   11b <fmtname>
     3fb:	8b 55 d0             	mov    -0x30(%ebp),%edx
     3fe:	89 54 24 18          	mov    %edx,0x18(%esp)
     402:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     405:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     409:	8b 55 d8             	mov    -0x28(%ebp),%edx
     40c:	89 54 24 20          	mov    %edx,0x20(%esp)
     410:	8b 55 dc             	mov    -0x24(%ebp),%edx
     413:	89 54 24 24          	mov    %edx,0x24(%esp)
     417:	89 44 24 14          	mov    %eax,0x14(%esp)
     41b:	8b 85 ac fd ff ff    	mov    -0x254(%ebp),%eax
     421:	89 04 24             	mov    %eax,(%esp)
     424:	8b 85 b0 fd ff ff    	mov    -0x250(%ebp),%eax
     42a:	89 44 24 04          	mov    %eax,0x4(%esp)
     42e:	8b 85 b4 fd ff ff    	mov    -0x24c(%ebp),%eax
     434:	89 44 24 08          	mov    %eax,0x8(%esp)
     438:	8b 85 b8 fd ff ff    	mov    -0x248(%ebp),%eax
     43e:	89 44 24 0c          	mov    %eax,0xc(%esp)
     442:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
     448:	89 44 24 10          	mov    %eax,0x10(%esp)
     44c:	e8 af fb ff ff       	call   0 <addFileItem>
				itemCounter++;
     451:	a1 a8 f7 00 00       	mov    0xf7a8,%eax
     456:	83 c0 01             	add    $0x1,%eax
     459:	a3 a8 f7 00 00       	mov    %eax,0xf7a8
			break;
		}
		strcpy(buf, path);
		p = buf + strlen(buf);
		*p++ = '/';
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     45e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
     465:	00 
     466:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     46c:	89 44 24 04          	mov    %eax,0x4(%esp)
     470:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     473:	89 04 24             	mov    %eax,(%esp)
     476:	e8 13 41 00 00       	call   458e <read>
     47b:	83 f8 10             	cmp    $0x10,%eax
     47e:	0f 84 8e fe ff ff    	je     312 <list+0x163>
			if (isListable(fmtname(buf), st.type)) {
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
				itemCounter++;
			}
		}
		break;
     484:	90                   	nop
	}
	close(fd);
     485:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     488:	89 04 24             	mov    %eax,(%esp)
     48b:	e8 0e 41 00 00       	call   459e <close>
}
     490:	8d 65 f4             	lea    -0xc(%ebp),%esp
     493:	5b                   	pop    %ebx
     494:	5e                   	pop    %esi
     495:	5f                   	pop    %edi
     496:	5d                   	pop    %ebp
     497:	c3                   	ret    

00000498 <drawItem>:
#define FILE_ICON_BIG 0
#define FILE_ICON_SMALL 1
#define FOLDER_ICON_BIG 2
#define FOLDER_ICON_SMALL 3

void drawItem(Context context, char *name, struct stat st, Rect rect, int chosen) {
     498:	55                   	push   %ebp
     499:	89 e5                	mov    %esp,%ebp
     49b:	53                   	push   %ebx
     49c:	83 ec 34             	sub    $0x34,%esp
	//cprintf("draw finder Item: type=%d counter=%d\n", type, n);
	unsigned short nameColor;
	if (chosen == 0) 
     49f:	83 7d 3c 00          	cmpl   $0x0,0x3c(%ebp)
     4a3:	75 08                	jne    4ad <drawItem+0x15>
		nameColor = 0x0;
     4a5:	66 c7 45 f6 00 00    	movw   $0x0,-0xa(%ebp)
     4ab:	eb 49                	jmp    4f6 <drawItem+0x5e>
	else 
	{
		nameColor = 0xFFFF;
     4ad:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
     4b3:	8b 45 38             	mov    0x38(%ebp),%eax
     4b6:	89 c3                	mov    %eax,%ebx
     4b8:	8b 45 34             	mov    0x34(%ebp),%eax
     4bb:	89 c1                	mov    %eax,%ecx
     4bd:	8b 45 30             	mov    0x30(%ebp),%eax
     4c0:	89 c2                	mov    %eax,%edx
     4c2:	8b 45 2c             	mov    0x2c(%ebp),%eax
     4c5:	c7 44 24 1c 10 21 00 	movl   $0x2110,0x1c(%esp)
     4cc:	00 
     4cd:	89 5c 24 18          	mov    %ebx,0x18(%esp)
     4d1:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     4d5:	89 54 24 10          	mov    %edx,0x10(%esp)
     4d9:	89 44 24 0c          	mov    %eax,0xc(%esp)
     4dd:	8b 45 08             	mov    0x8(%ebp),%eax
     4e0:	89 04 24             	mov    %eax,(%esp)
     4e3:	8b 45 0c             	mov    0xc(%ebp),%eax
     4e6:	89 44 24 04          	mov    %eax,0x4(%esp)
     4ea:	8b 45 10             	mov    0x10(%ebp),%eax
     4ed:	89 44 24 08          	mov    %eax,0x8(%esp)
     4f1:	e8 18 23 00 00       	call   280e <fill_rect>
	}
	if (style == ICON_STYLE) {
     4f6:	a1 e4 ee 00 00       	mov    0xeee4,%eax
     4fb:	83 f8 01             	cmp    $0x1,%eax
     4fe:	0f 85 13 01 00 00    	jne    617 <drawItem+0x17f>
		switch (st.type) {
     504:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     508:	98                   	cwtl   
     509:	83 f8 01             	cmp    $0x1,%eax
     50c:	74 53                	je     561 <drawItem+0xc9>
     50e:	83 f8 02             	cmp    $0x2,%eax
     511:	0f 85 93 00 00 00    	jne    5aa <drawItem+0x112>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     517:	8b 45 30             	mov    0x30(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     51a:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     51d:	8b 45 2c             	mov    0x2c(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     520:	83 c0 19             	add    $0x19,%eax
     523:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     527:	89 44 24 18          	mov    %eax,0x18(%esp)
     52b:	a1 28 ef 00 00       	mov    0xef28,%eax
     530:	89 44 24 0c          	mov    %eax,0xc(%esp)
     534:	a1 2c ef 00 00       	mov    0xef2c,%eax
     539:	89 44 24 10          	mov    %eax,0x10(%esp)
     53d:	a1 30 ef 00 00       	mov    0xef30,%eax
     542:	89 44 24 14          	mov    %eax,0x14(%esp)
     546:	8b 45 08             	mov    0x8(%ebp),%eax
     549:	89 04 24             	mov    %eax,(%esp)
     54c:	8b 45 0c             	mov    0xc(%ebp),%eax
     54f:	89 44 24 04          	mov    %eax,0x4(%esp)
     553:	8b 45 10             	mov    0x10(%ebp),%eax
     556:	89 44 24 08          	mov    %eax,0x8(%esp)
     55a:	e8 4e 29 00 00       	call   2ead <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     55f:	eb 49                	jmp    5aa <drawItem+0x112>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     561:	8b 45 30             	mov    0x30(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     564:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     567:	8b 45 2c             	mov    0x2c(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     56a:	83 c0 19             	add    $0x19,%eax
     56d:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     571:	89 44 24 18          	mov    %eax,0x18(%esp)
     575:	a1 90 ef 00 00       	mov    0xef90,%eax
     57a:	89 44 24 0c          	mov    %eax,0xc(%esp)
     57e:	a1 94 ef 00 00       	mov    0xef94,%eax
     583:	89 44 24 10          	mov    %eax,0x10(%esp)
     587:	a1 98 ef 00 00       	mov    0xef98,%eax
     58c:	89 44 24 14          	mov    %eax,0x14(%esp)
     590:	8b 45 08             	mov    0x8(%ebp),%eax
     593:	89 04 24             	mov    %eax,(%esp)
     596:	8b 45 0c             	mov    0xc(%ebp),%eax
     599:	89 44 24 04          	mov    %eax,0x4(%esp)
     59d:	8b 45 10             	mov    0x10(%ebp),%eax
     5a0:	89 44 24 08          	mov    %eax,0x8(%esp)
     5a4:	e8 04 29 00 00       	call   2ead <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     5a9:	90                   	nop
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
     5aa:	8b 45 14             	mov    0x14(%ebp),%eax
     5ad:	89 04 24             	mov    %eax,(%esp)
     5b0:	e8 ed 3d 00 00       	call   43a2 <strlen>
     5b5:	89 c2                	mov    %eax,%edx
     5b7:	b8 00 00 00 00       	mov    $0x0,%eax
     5bc:	29 d0                	sub    %edx,%eax
     5be:	c1 e0 02             	shl    $0x2,%eax
     5c1:	83 c0 30             	add    $0x30,%eax
     5c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
     5c7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     5cb:	79 07                	jns    5d4 <drawItem+0x13c>
			indent = 0;
     5cd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
     5d4:	8b 45 30             	mov    0x30(%ebp),%eax
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
			indent = 0;
		puts_str(context, name, nameColor, rect.start.x + indent,
     5d7:	8d 48 46             	lea    0x46(%eax),%ecx
     5da:	8b 55 2c             	mov    0x2c(%ebp),%edx
     5dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
     5e0:	01 c2                	add    %eax,%edx
     5e2:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     5e6:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     5ea:	89 54 24 14          	mov    %edx,0x14(%esp)
     5ee:	89 44 24 10          	mov    %eax,0x10(%esp)
     5f2:	8b 45 14             	mov    0x14(%ebp),%eax
     5f5:	89 44 24 0c          	mov    %eax,0xc(%esp)
     5f9:	8b 45 08             	mov    0x8(%ebp),%eax
     5fc:	89 04 24             	mov    %eax,(%esp)
     5ff:	8b 45 0c             	mov    0xc(%ebp),%eax
     602:	89 44 24 04          	mov    %eax,0x4(%esp)
     606:	8b 45 10             	mov    0x10(%ebp),%eax
     609:	89 44 24 08          	mov    %eax,0x8(%esp)
     60d:	e8 db 27 00 00       	call   2ded <puts_str>
     612:	e9 33 01 00 00       	jmp    74a <drawItem+0x2b2>
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
     617:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     61b:	98                   	cwtl   
     61c:	83 f8 01             	cmp    $0x1,%eax
     61f:	0f 84 a0 00 00 00    	je     6c5 <drawItem+0x22d>
     625:	83 f8 02             	cmp    $0x2,%eax
     628:	0f 85 e0 00 00 00    	jne    70e <drawItem+0x276>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     62e:	8b 45 30             	mov    0x30(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     631:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     634:	8b 45 2c             	mov    0x2c(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     637:	83 c0 08             	add    $0x8,%eax
     63a:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     63e:	89 44 24 18          	mov    %eax,0x18(%esp)
     642:	a1 5c ef 00 00       	mov    0xef5c,%eax
     647:	89 44 24 0c          	mov    %eax,0xc(%esp)
     64b:	a1 60 ef 00 00       	mov    0xef60,%eax
     650:	89 44 24 10          	mov    %eax,0x10(%esp)
     654:	a1 64 ef 00 00       	mov    0xef64,%eax
     659:	89 44 24 14          	mov    %eax,0x14(%esp)
     65d:	8b 45 08             	mov    0x8(%ebp),%eax
     660:	89 04 24             	mov    %eax,(%esp)
     663:	8b 45 0c             	mov    0xc(%ebp),%eax
     666:	89 44 24 04          	mov    %eax,0x4(%esp)
     66a:	8b 45 10             	mov    0x10(%ebp),%eax
     66d:	89 44 24 08          	mov    %eax,0x8(%esp)
     671:	e8 37 28 00 00       	call   2ead <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
     676:	8b 45 28             	mov    0x28(%ebp),%eax
     679:	89 04 24             	mov    %eax,(%esp)
     67c:	e8 cf 00 00 00       	call   750 <sizeFormat>
     681:	89 45 ec             	mov    %eax,-0x14(%ebp)
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
     684:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
     687:	8d 48 03             	lea    0x3(%eax),%ecx
     68a:	8b 45 2c             	mov    0x2c(%ebp),%eax
     68d:	8d 90 c8 00 00 00    	lea    0xc8(%eax),%edx
     693:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     697:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     69b:	89 54 24 14          	mov    %edx,0x14(%esp)
     69f:	89 44 24 10          	mov    %eax,0x10(%esp)
     6a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
     6a6:	89 44 24 0c          	mov    %eax,0xc(%esp)
     6aa:	8b 45 08             	mov    0x8(%ebp),%eax
     6ad:	89 04 24             	mov    %eax,(%esp)
     6b0:	8b 45 0c             	mov    0xc(%ebp),%eax
     6b3:	89 44 24 04          	mov    %eax,0x4(%esp)
     6b7:	8b 45 10             	mov    0x10(%ebp),%eax
     6ba:	89 44 24 08          	mov    %eax,0x8(%esp)
     6be:	e8 2a 27 00 00       	call   2ded <puts_str>
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     6c3:	eb 49                	jmp    70e <drawItem+0x276>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     6c5:	8b 45 30             	mov    0x30(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     6c8:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     6cb:	8b 45 2c             	mov    0x2c(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     6ce:	83 c0 08             	add    $0x8,%eax
     6d1:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     6d5:	89 44 24 18          	mov    %eax,0x18(%esp)
     6d9:	a1 c4 ef 00 00       	mov    0xefc4,%eax
     6de:	89 44 24 0c          	mov    %eax,0xc(%esp)
     6e2:	a1 c8 ef 00 00       	mov    0xefc8,%eax
     6e7:	89 44 24 10          	mov    %eax,0x10(%esp)
     6eb:	a1 cc ef 00 00       	mov    0xefcc,%eax
     6f0:	89 44 24 14          	mov    %eax,0x14(%esp)
     6f4:	8b 45 08             	mov    0x8(%ebp),%eax
     6f7:	89 04 24             	mov    %eax,(%esp)
     6fa:	8b 45 0c             	mov    0xc(%ebp),%eax
     6fd:	89 44 24 04          	mov    %eax,0x4(%esp)
     701:	8b 45 10             	mov    0x10(%ebp),%eax
     704:	89 44 24 08          	mov    %eax,0x8(%esp)
     708:	e8 a0 27 00 00       	call   2ead <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     70d:	90                   	nop
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
				rect.start.y + LIST_ITEM_OFFSET_Y);
     70e:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
     711:	8d 48 03             	lea    0x3(%eax),%ecx
     714:	8b 45 2c             	mov    0x2c(%ebp),%eax
     717:	8d 50 28             	lea    0x28(%eax),%edx
     71a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     71e:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     722:	89 54 24 14          	mov    %edx,0x14(%esp)
     726:	89 44 24 10          	mov    %eax,0x10(%esp)
     72a:	8b 45 14             	mov    0x14(%ebp),%eax
     72d:	89 44 24 0c          	mov    %eax,0xc(%esp)
     731:	8b 45 08             	mov    0x8(%ebp),%eax
     734:	89 04 24             	mov    %eax,(%esp)
     737:	8b 45 0c             	mov    0xc(%ebp),%eax
     73a:	89 44 24 04          	mov    %eax,0x4(%esp)
     73e:	8b 45 10             	mov    0x10(%ebp),%eax
     741:	89 44 24 08          	mov    %eax,0x8(%esp)
     745:	e8 a3 26 00 00       	call   2ded <puts_str>
				rect.start.y + LIST_ITEM_OFFSET_Y);
	}
}
     74a:	83 c4 34             	add    $0x34,%esp
     74d:	5b                   	pop    %ebx
     74e:	5d                   	pop    %ebp
     74f:	c3                   	ret    

00000750 <sizeFormat>:

char *sizeFormat(uint size){
     750:	55                   	push   %ebp
     751:	89 e5                	mov    %esp,%ebp
     753:	53                   	push   %ebx
     754:	83 ec 24             	sub    $0x24,%esp
	char* result = (char *) malloc(12 * sizeof(char));
     757:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     75e:	e8 e7 42 00 00       	call   4a4a <malloc>
     763:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int n = 0;
     766:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (size > 0x400) 
     76d:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
     774:	0f 86 8b 00 00 00    	jbe    805 <sizeFormat+0xb5>
	{
		size = size / (0x400);
     77a:	8b 45 08             	mov    0x8(%ebp),%eax
     77d:	c1 e8 0a             	shr    $0xa,%eax
     780:	89 45 08             	mov    %eax,0x8(%ebp)
		do{
			result[n++] = (size % 10) + '0';
     783:	8b 45 f4             	mov    -0xc(%ebp),%eax
     786:	8d 50 01             	lea    0x1(%eax),%edx
     789:	89 55 f4             	mov    %edx,-0xc(%ebp)
     78c:	89 c2                	mov    %eax,%edx
     78e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     791:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     794:	8b 4d 08             	mov    0x8(%ebp),%ecx
     797:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     79c:	89 c8                	mov    %ecx,%eax
     79e:	f7 e2                	mul    %edx
     7a0:	c1 ea 03             	shr    $0x3,%edx
     7a3:	89 d0                	mov    %edx,%eax
     7a5:	c1 e0 02             	shl    $0x2,%eax
     7a8:	01 d0                	add    %edx,%eax
     7aa:	01 c0                	add    %eax,%eax
     7ac:	29 c1                	sub    %eax,%ecx
     7ae:	89 ca                	mov    %ecx,%edx
     7b0:	89 d0                	mov    %edx,%eax
     7b2:	83 c0 30             	add    $0x30,%eax
     7b5:	88 03                	mov    %al,(%ebx)
			size /= 10;
     7b7:	8b 45 08             	mov    0x8(%ebp),%eax
     7ba:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     7bf:	f7 e2                	mul    %edx
     7c1:	89 d0                	mov    %edx,%eax
     7c3:	c1 e8 03             	shr    $0x3,%eax
     7c6:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     7c9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     7cd:	75 b4                	jne    783 <sizeFormat+0x33>
		result[n++] = 'K';
     7cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7d2:	8d 50 01             	lea    0x1(%eax),%edx
     7d5:	89 55 f4             	mov    %edx,-0xc(%ebp)
     7d8:	89 c2                	mov    %eax,%edx
     7da:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7dd:	01 d0                	add    %edx,%eax
     7df:	c6 00 4b             	movb   $0x4b,(%eax)
		result[n++] = 'b';
     7e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7e5:	8d 50 01             	lea    0x1(%eax),%edx
     7e8:	89 55 f4             	mov    %edx,-0xc(%ebp)
     7eb:	89 c2                	mov    %eax,%edx
     7ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7f0:	01 d0                	add    %edx,%eax
     7f2:	c6 00 62             	movb   $0x62,(%eax)
		result[n] = 0;
     7f5:	8b 55 f4             	mov    -0xc(%ebp),%edx
     7f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7fb:	01 d0                	add    %edx,%eax
     7fd:	c6 00 00             	movb   $0x0,(%eax)
     800:	e9 a3 00 00 00       	jmp    8a8 <sizeFormat+0x158>
	}
	else 
	{
		do{
			result[n++] = (size % 10) + '0';
     805:	8b 45 f4             	mov    -0xc(%ebp),%eax
     808:	8d 50 01             	lea    0x1(%eax),%edx
     80b:	89 55 f4             	mov    %edx,-0xc(%ebp)
     80e:	89 c2                	mov    %eax,%edx
     810:	8b 45 f0             	mov    -0x10(%ebp),%eax
     813:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     816:	8b 4d 08             	mov    0x8(%ebp),%ecx
     819:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     81e:	89 c8                	mov    %ecx,%eax
     820:	f7 e2                	mul    %edx
     822:	c1 ea 03             	shr    $0x3,%edx
     825:	89 d0                	mov    %edx,%eax
     827:	c1 e0 02             	shl    $0x2,%eax
     82a:	01 d0                	add    %edx,%eax
     82c:	01 c0                	add    %eax,%eax
     82e:	29 c1                	sub    %eax,%ecx
     830:	89 ca                	mov    %ecx,%edx
     832:	89 d0                	mov    %edx,%eax
     834:	83 c0 30             	add    $0x30,%eax
     837:	88 03                	mov    %al,(%ebx)
			size /= 10;
     839:	8b 45 08             	mov    0x8(%ebp),%eax
     83c:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     841:	f7 e2                	mul    %edx
     843:	89 d0                	mov    %edx,%eax
     845:	c1 e8 03             	shr    $0x3,%eax
     848:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     84b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     84f:	75 b4                	jne    805 <sizeFormat+0xb5>
		result[n++] = 'b';
     851:	8b 45 f4             	mov    -0xc(%ebp),%eax
     854:	8d 50 01             	lea    0x1(%eax),%edx
     857:	89 55 f4             	mov    %edx,-0xc(%ebp)
     85a:	89 c2                	mov    %eax,%edx
     85c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     85f:	01 d0                	add    %edx,%eax
     861:	c6 00 62             	movb   $0x62,(%eax)
		result[n++] = 'y';
     864:	8b 45 f4             	mov    -0xc(%ebp),%eax
     867:	8d 50 01             	lea    0x1(%eax),%edx
     86a:	89 55 f4             	mov    %edx,-0xc(%ebp)
     86d:	89 c2                	mov    %eax,%edx
     86f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     872:	01 d0                	add    %edx,%eax
     874:	c6 00 79             	movb   $0x79,(%eax)
		result[n++] = 't';
     877:	8b 45 f4             	mov    -0xc(%ebp),%eax
     87a:	8d 50 01             	lea    0x1(%eax),%edx
     87d:	89 55 f4             	mov    %edx,-0xc(%ebp)
     880:	89 c2                	mov    %eax,%edx
     882:	8b 45 f0             	mov    -0x10(%ebp),%eax
     885:	01 d0                	add    %edx,%eax
     887:	c6 00 74             	movb   $0x74,(%eax)
		result[n++] = 'e';
     88a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     88d:	8d 50 01             	lea    0x1(%eax),%edx
     890:	89 55 f4             	mov    %edx,-0xc(%ebp)
     893:	89 c2                	mov    %eax,%edx
     895:	8b 45 f0             	mov    -0x10(%ebp),%eax
     898:	01 d0                	add    %edx,%eax
     89a:	c6 00 65             	movb   $0x65,(%eax)
		result[n] = 0;
     89d:	8b 55 f4             	mov    -0xc(%ebp),%edx
     8a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8a3:	01 d0                	add    %edx,%eax
     8a5:	c6 00 00             	movb   $0x0,(%eax)
	}
	return result;
     8a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     8ab:	83 c4 24             	add    $0x24,%esp
     8ae:	5b                   	pop    %ebx
     8af:	5d                   	pop    %ebp
     8b0:	c3                   	ret    

000008b1 <drawFinderWnd>:
		7 * BUTTON_WIDTH + 200, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "trash.bmp",
		8 * BUTTON_WIDTH + 200, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) } };

void drawFinderWnd(Context context) {
     8b1:	55                   	push   %ebp
     8b2:	89 e5                	mov    %esp,%ebp
     8b4:	83 ec 28             	sub    $0x28,%esp
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
     8b7:	8b 45 0c             	mov    0xc(%ebp),%eax
     8ba:	83 e8 01             	sub    $0x1,%eax
     8bd:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     8c4:	00 
     8c5:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     8cc:	00 
     8cd:	89 44 24 14          	mov    %eax,0x14(%esp)
     8d1:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     8d8:	00 
     8d9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     8e0:	00 
     8e1:	8b 45 08             	mov    0x8(%ebp),%eax
     8e4:	89 04 24             	mov    %eax,(%esp)
     8e7:	8b 45 0c             	mov    0xc(%ebp),%eax
     8ea:	89 44 24 04          	mov    %eax,0x4(%esp)
     8ee:	8b 45 10             	mov    0x10(%ebp),%eax
     8f1:	89 44 24 08          	mov    %eax,0x8(%esp)
     8f5:	e8 89 26 00 00       	call   2f83 <draw_line>
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
     8fa:	8b 45 10             	mov    0x10(%ebp),%eax

void drawFinderWnd(Context context) {
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
     8fd:	8d 48 ff             	lea    -0x1(%eax),%ecx
     900:	8b 45 0c             	mov    0xc(%ebp),%eax
     903:	8d 50 ff             	lea    -0x1(%eax),%edx
     906:	8b 45 0c             	mov    0xc(%ebp),%eax
     909:	83 e8 01             	sub    $0x1,%eax
     90c:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     913:	00 
     914:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     918:	89 54 24 14          	mov    %edx,0x14(%esp)
     91c:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     923:	00 
     924:	89 44 24 0c          	mov    %eax,0xc(%esp)
     928:	8b 45 08             	mov    0x8(%ebp),%eax
     92b:	89 04 24             	mov    %eax,(%esp)
     92e:	8b 45 0c             	mov    0xc(%ebp),%eax
     931:	89 44 24 04          	mov    %eax,0x4(%esp)
     935:	8b 45 10             	mov    0x10(%ebp),%eax
     938:	89 44 24 08          	mov    %eax,0x8(%esp)
     93c:	e8 42 26 00 00       	call   2f83 <draw_line>
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     941:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     944:	8d 48 ff             	lea    -0x1(%eax),%ecx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     947:	8b 45 0c             	mov    0xc(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     94a:	8d 50 ff             	lea    -0x1(%eax),%edx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     94d:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     950:	83 e8 01             	sub    $0x1,%eax
     953:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     95a:	00 
     95b:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     95f:	89 54 24 14          	mov    %edx,0x14(%esp)
     963:	89 44 24 10          	mov    %eax,0x10(%esp)
     967:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     96e:	00 
     96f:	8b 45 08             	mov    0x8(%ebp),%eax
     972:	89 04 24             	mov    %eax,(%esp)
     975:	8b 45 0c             	mov    0xc(%ebp),%eax
     978:	89 44 24 04          	mov    %eax,0x4(%esp)
     97c:	8b 45 10             	mov    0x10(%ebp),%eax
     97f:	89 44 24 08          	mov    %eax,0x8(%esp)
     983:	e8 fb 25 00 00       	call   2f83 <draw_line>
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0, context.height - 1, 0, 0, BORDERLINE_COLOR);
     988:	8b 45 10             	mov    0x10(%ebp),%eax
     98b:	83 e8 01             	sub    $0x1,%eax
     98e:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     995:	00 
     996:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     99d:	00 
     99e:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
     9a5:	00 
     9a6:	89 44 24 10          	mov    %eax,0x10(%esp)
     9aa:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     9b1:	00 
     9b2:	8b 45 08             	mov    0x8(%ebp),%eax
     9b5:	89 04 24             	mov    %eax,(%esp)
     9b8:	8b 45 0c             	mov    0xc(%ebp),%eax
     9bb:	89 44 24 04          	mov    %eax,0x4(%esp)
     9bf:	8b 45 10             	mov    0x10(%ebp),%eax
     9c2:	89 44 24 08          	mov    %eax,0x8(%esp)
     9c6:	e8 b8 25 00 00       	call   2f83 <draw_line>
	fill_rect(context, 1, 1, context.width - 2, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT,
     9cb:	8b 45 0c             	mov    0xc(%ebp),%eax
     9ce:	83 e8 02             	sub    $0x2,%eax
     9d1:	c7 44 24 1c 18 c6 00 	movl   $0xc618,0x1c(%esp)
     9d8:	00 
     9d9:	c7 44 24 18 46 00 00 	movl   $0x46,0x18(%esp)
     9e0:	00 
     9e1:	89 44 24 14          	mov    %eax,0x14(%esp)
     9e5:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     9ec:	00 
     9ed:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     9f4:	00 
     9f5:	8b 45 08             	mov    0x8(%ebp),%eax
     9f8:	89 04 24             	mov    %eax,(%esp)
     9fb:	8b 45 0c             	mov    0xc(%ebp),%eax
     9fe:	89 44 24 04          	mov    %eax,0x4(%esp)
     a02:	8b 45 10             	mov    0x10(%ebp),%eax
     a05:	89 44 24 08          	mov    %eax,0x8(%esp)
     a09:	e8 00 1e 00 00       	call   280e <fill_rect>
			TOOLSBAR_COLOR);
	puts_str(context, "Finder", 0, WINDOW_WIDTH / 2, 3);
     a0e:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
     a15:	00 
     a16:	c7 44 24 14 2c 01 00 	movl   $0x12c,0x14(%esp)
     a1d:	00 
     a1e:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     a25:	00 
     a26:	c7 44 24 0c 28 ae 00 	movl   $0xae28,0xc(%esp)
     a2d:	00 
     a2e:	8b 45 08             	mov    0x8(%ebp),%eax
     a31:	89 04 24             	mov    %eax,(%esp)
     a34:	8b 45 0c             	mov    0xc(%ebp),%eax
     a37:	89 44 24 04          	mov    %eax,0x4(%esp)
     a3b:	8b 45 10             	mov    0x10(%ebp),%eax
     a3e:	89 44 24 08          	mov    %eax,0x8(%esp)
     a42:	e8 a6 23 00 00       	call   2ded <puts_str>
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     a47:	c7 44 24 10 0c 00 00 	movl   $0xc,0x10(%esp)
     a4e:	00 
     a4f:	c7 44 24 0c e0 ef 00 	movl   $0xefe0,0xc(%esp)
     a56:	00 
     a57:	8b 45 08             	mov    0x8(%ebp),%eax
     a5a:	89 04 24             	mov    %eax,(%esp)
     a5d:	8b 45 0c             	mov    0xc(%ebp),%eax
     a60:	89 44 24 04          	mov    %eax,0x4(%esp)
     a64:	8b 45 10             	mov    0x10(%ebp),%eax
     a67:	89 44 24 08          	mov    %eax,0x8(%esp)
     a6b:	e8 ee 28 00 00       	call   335e <draw_iconlist>


}
     a70:	c9                   	leave  
     a71:	c3                   	ret    

00000a72 <drawFinderContent>:

void drawFinderContent(Context context) {
     a72:	55                   	push   %ebp
     a73:	89 e5                	mov    %esp,%ebp
     a75:	83 ec 58             	sub    $0x58,%esp
	struct fileItem *p;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
     a78:	c7 45 f0 46 00 00 00 	movl   $0x46,-0x10(%ebp)
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
     a7f:	a1 e4 ee 00 00       	mov    0xeee4,%eax
     a84:	83 f8 02             	cmp    $0x2,%eax
     a87:	75 04                	jne    a8d <drawFinderContent+0x1b>
     a89:	83 45 f0 1c          	addl   $0x1c,-0x10(%ebp)
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
     a8d:	8b 45 10             	mov    0x10(%ebp),%eax
     a90:	83 e8 48             	sub    $0x48,%eax
	struct fileItem *p;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
     a93:	89 c1                	mov    %eax,%ecx
     a95:	8b 45 0c             	mov    0xc(%ebp),%eax
     a98:	83 e8 02             	sub    $0x2,%eax
     a9b:	89 c2                	mov    %eax,%edx
     a9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     aa0:	c7 44 24 1c ff ff 00 	movl   $0xffff,0x1c(%esp)
     aa7:	00 
     aa8:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     aac:	89 54 24 14          	mov    %edx,0x14(%esp)
     ab0:	89 44 24 10          	mov    %eax,0x10(%esp)
     ab4:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     abb:	00 
     abc:	8b 45 08             	mov    0x8(%ebp),%eax
     abf:	89 04 24             	mov    %eax,(%esp)
     ac2:	8b 45 0c             	mov    0xc(%ebp),%eax
     ac5:	89 44 24 04          	mov    %eax,0x4(%esp)
     ac9:	8b 45 10             	mov    0x10(%ebp),%eax
     acc:	89 44 24 08          	mov    %eax,0x8(%esp)
     ad0:	e8 39 1d 00 00       	call   280e <fill_rect>
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     ad5:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     ad8:	8d 48 ff             	lea    -0x1(%eax),%ecx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     adb:	8b 45 0c             	mov    0xc(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     ade:	8d 50 ff             	lea    -0x1(%eax),%edx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     ae1:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     ae4:	83 e8 01             	sub    $0x1,%eax
     ae7:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     aee:	00 
     aef:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     af3:	89 54 24 14          	mov    %edx,0x14(%esp)
     af7:	89 44 24 10          	mov    %eax,0x10(%esp)
     afb:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     b02:	00 
     b03:	8b 45 08             	mov    0x8(%ebp),%eax
     b06:	89 04 24             	mov    %eax,(%esp)
     b09:	8b 45 0c             	mov    0xc(%ebp),%eax
     b0c:	89 44 24 04          	mov    %eax,0x4(%esp)
     b10:	8b 45 10             	mov    0x10(%ebp),%eax
     b13:	89 44 24 08          	mov    %eax,0x8(%esp)
     b17:	e8 67 24 00 00       	call   2f83 <draw_line>
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);

	//printf(0, "listing complete!\n");
	//printItemList();
	p = fileItemList;
     b1c:	a1 a4 f7 00 00       	mov    0xf7a4,%eax
     b21:	89 45 f4             	mov    %eax,-0xc(%ebp)
	itemCounter = 0;
     b24:	c7 05 a8 f7 00 00 00 	movl   $0x0,0xf7a8
     b2b:	00 00 00 
	while (p != 0) {
     b2e:	eb 7a                	jmp    baa <drawFinderContent+0x138>
		//printf(0, "draw item\n");
		drawItem(context, p->name, p->st, p->pos, p->chosen);
     b30:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b33:	8b 40 28             	mov    0x28(%eax),%eax
     b36:	8b 55 f4             	mov    -0xc(%ebp),%edx
     b39:	8b 52 14             	mov    0x14(%edx),%edx
     b3c:	89 44 24 34          	mov    %eax,0x34(%esp)
     b40:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b43:	8b 48 18             	mov    0x18(%eax),%ecx
     b46:	89 4c 24 24          	mov    %ecx,0x24(%esp)
     b4a:	8b 48 1c             	mov    0x1c(%eax),%ecx
     b4d:	89 4c 24 28          	mov    %ecx,0x28(%esp)
     b51:	8b 48 20             	mov    0x20(%eax),%ecx
     b54:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
     b58:	8b 40 24             	mov    0x24(%eax),%eax
     b5b:	89 44 24 30          	mov    %eax,0x30(%esp)
     b5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b62:	8b 08                	mov    (%eax),%ecx
     b64:	89 4c 24 10          	mov    %ecx,0x10(%esp)
     b68:	8b 48 04             	mov    0x4(%eax),%ecx
     b6b:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     b6f:	8b 48 08             	mov    0x8(%eax),%ecx
     b72:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     b76:	8b 48 0c             	mov    0xc(%eax),%ecx
     b79:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
     b7d:	8b 40 10             	mov    0x10(%eax),%eax
     b80:	89 44 24 20          	mov    %eax,0x20(%esp)
     b84:	89 54 24 0c          	mov    %edx,0xc(%esp)
     b88:	8b 45 08             	mov    0x8(%ebp),%eax
     b8b:	89 04 24             	mov    %eax,(%esp)
     b8e:	8b 45 0c             	mov    0xc(%ebp),%eax
     b91:	89 44 24 04          	mov    %eax,0x4(%esp)
     b95:	8b 45 10             	mov    0x10(%ebp),%eax
     b98:	89 44 24 08          	mov    %eax,0x8(%esp)
     b9c:	e8 f7 f8 ff ff       	call   498 <drawItem>
		p = p->next;
     ba1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ba4:	8b 40 2c             	mov    0x2c(%eax),%eax
     ba7:	89 45 f4             	mov    %eax,-0xc(%ebp)

	//printf(0, "listing complete!\n");
	//printItemList();
	p = fileItemList;
	itemCounter = 0;
	while (p != 0) {
     baa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     bae:	75 80                	jne    b30 <drawFinderContent+0xbe>
		//printf(0, "draw item\n");
		drawItem(context, p->name, p->st, p->pos, p->chosen);
		p = p->next;
	}

	if (style == LIST_STYLE)
     bb0:	a1 e4 ee 00 00       	mov    0xeee4,%eax
     bb5:	83 f8 02             	cmp    $0x2,%eax
     bb8:	0f 85 39 01 00 00    	jne    cf7 <drawFinderContent+0x285>
		{
			fill_rect(context, 1, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_FILENAME - 2, TAGBAR_HEIGHT, TAGBAR_COLOR);
     bbe:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     bc5:	00 
     bc6:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     bcd:	00 
     bce:	c7 44 24 14 26 00 00 	movl   $0x26,0x14(%esp)
     bd5:	00 
     bd6:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     bdd:	00 
     bde:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     be5:	00 
     be6:	8b 45 08             	mov    0x8(%ebp),%eax
     be9:	89 04 24             	mov    %eax,(%esp)
     bec:	8b 45 0c             	mov    0xc(%ebp),%eax
     bef:	89 44 24 04          	mov    %eax,0x4(%esp)
     bf3:	8b 45 10             	mov    0x10(%ebp),%eax
     bf6:	89 44 24 08          	mov    %eax,0x8(%esp)
     bfa:	e8 0f 1c 00 00       	call   280e <fill_rect>
			fill_rect(context, LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     bff:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     c06:	00 
     c07:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     c0e:	00 
     c0f:	c7 44 24 14 9f 00 00 	movl   $0x9f,0x14(%esp)
     c16:	00 
     c17:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     c1e:	00 
     c1f:	c7 44 24 0c 28 00 00 	movl   $0x28,0xc(%esp)
     c26:	00 
     c27:	8b 45 08             	mov    0x8(%ebp),%eax
     c2a:	89 04 24             	mov    %eax,(%esp)
     c2d:	8b 45 0c             	mov    0xc(%ebp),%eax
     c30:	89 44 24 04          	mov    %eax,0x4(%esp)
     c34:	8b 45 10             	mov    0x10(%ebp),%eax
     c37:	89 44 24 08          	mov    %eax,0x8(%esp)
     c3b:	e8 ce 1b 00 00       	call   280e <fill_rect>
			fill_rect(context, LIST_ITEM_SIZE, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, context.width - LIST_ITEM_SIZE - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     c40:	8b 45 0c             	mov    0xc(%ebp),%eax
     c43:	2d c9 00 00 00       	sub    $0xc9,%eax
     c48:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     c4f:	00 
     c50:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     c57:	00 
     c58:	89 44 24 14          	mov    %eax,0x14(%esp)
     c5c:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     c63:	00 
     c64:	c7 44 24 0c c8 00 00 	movl   $0xc8,0xc(%esp)
     c6b:	00 
     c6c:	8b 45 08             	mov    0x8(%ebp),%eax
     c6f:	89 04 24             	mov    %eax,(%esp)
     c72:	8b 45 0c             	mov    0xc(%ebp),%eax
     c75:	89 44 24 04          	mov    %eax,0x4(%esp)
     c79:	8b 45 10             	mov    0x10(%ebp),%eax
     c7c:	89 44 24 08          	mov    %eax,0x8(%esp)
     c80:	e8 89 1b 00 00       	call   280e <fill_rect>
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     c85:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     c8c:	00 
     c8d:	c7 44 24 14 2b 00 00 	movl   $0x2b,0x14(%esp)
     c94:	00 
     c95:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     c9c:	00 
     c9d:	c7 44 24 0c 2f ae 00 	movl   $0xae2f,0xc(%esp)
     ca4:	00 
     ca5:	8b 45 08             	mov    0x8(%ebp),%eax
     ca8:	89 04 24             	mov    %eax,(%esp)
     cab:	8b 45 0c             	mov    0xc(%ebp),%eax
     cae:	89 44 24 04          	mov    %eax,0x4(%esp)
     cb2:	8b 45 10             	mov    0x10(%ebp),%eax
     cb5:	89 44 24 08          	mov    %eax,0x8(%esp)
     cb9:	e8 2f 21 00 00       	call   2ded <puts_str>
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     cbe:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     cc5:	00 
     cc6:	c7 44 24 14 cb 00 00 	movl   $0xcb,0x14(%esp)
     ccd:	00 
     cce:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     cd5:	00 
     cd6:	c7 44 24 0c 34 ae 00 	movl   $0xae34,0xc(%esp)
     cdd:	00 
     cde:	8b 45 08             	mov    0x8(%ebp),%eax
     ce1:	89 04 24             	mov    %eax,(%esp)
     ce4:	8b 45 0c             	mov    0xc(%ebp),%eax
     ce7:	89 44 24 04          	mov    %eax,0x4(%esp)
     ceb:	8b 45 10             	mov    0x10(%ebp),%eax
     cee:	89 44 24 08          	mov    %eax,0x8(%esp)
     cf2:	e8 f6 20 00 00       	call   2ded <puts_str>
		}
}
     cf7:	c9                   	leave  
     cf8:	c3                   	ret    

00000cf9 <int2str>:

char * int2str(int i)
{
     cf9:	55                   	push   %ebp
     cfa:	89 e5                	mov    %esp,%ebp
     cfc:	53                   	push   %ebx
     cfd:	83 ec 24             	sub    $0x24,%esp
	int j;
	int n = 0;
     d00:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	char *result = (char *)malloc(4*sizeof(char));
     d07:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     d0e:	e8 37 3d 00 00       	call   4a4a <malloc>
     d13:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
     d16:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     d1d:	e8 28 3d 00 00       	call   4a4a <malloc>
     d22:	89 45 e8             	mov    %eax,-0x18(%ebp)
	do{
		result[n++] = (i % 10) + '0';
     d25:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d28:	8d 50 01             	lea    0x1(%eax),%edx
     d2b:	89 55 f0             	mov    %edx,-0x10(%ebp)
     d2e:	89 c2                	mov    %eax,%edx
     d30:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d33:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     d36:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d39:	ba 67 66 66 66       	mov    $0x66666667,%edx
     d3e:	89 c8                	mov    %ecx,%eax
     d40:	f7 ea                	imul   %edx
     d42:	c1 fa 02             	sar    $0x2,%edx
     d45:	89 c8                	mov    %ecx,%eax
     d47:	c1 f8 1f             	sar    $0x1f,%eax
     d4a:	29 c2                	sub    %eax,%edx
     d4c:	89 d0                	mov    %edx,%eax
     d4e:	c1 e0 02             	shl    $0x2,%eax
     d51:	01 d0                	add    %edx,%eax
     d53:	01 c0                	add    %eax,%eax
     d55:	29 c1                	sub    %eax,%ecx
     d57:	89 ca                	mov    %ecx,%edx
     d59:	89 d0                	mov    %edx,%eax
     d5b:	83 c0 30             	add    $0x30,%eax
     d5e:	88 03                	mov    %al,(%ebx)
		i /= 10;
     d60:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d63:	ba 67 66 66 66       	mov    $0x66666667,%edx
     d68:	89 c8                	mov    %ecx,%eax
     d6a:	f7 ea                	imul   %edx
     d6c:	c1 fa 02             	sar    $0x2,%edx
     d6f:	89 c8                	mov    %ecx,%eax
     d71:	c1 f8 1f             	sar    $0x1f,%eax
     d74:	29 c2                	sub    %eax,%edx
     d76:	89 d0                	mov    %edx,%eax
     d78:	89 45 08             	mov    %eax,0x8(%ebp)
	}while (i!=0);
     d7b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     d7f:	75 a4                	jne    d25 <int2str+0x2c>
	result[n] = 0;
     d81:	8b 55 f0             	mov    -0x10(%ebp),%edx
     d84:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d87:	01 d0                	add    %edx,%eax
     d89:	c6 00 00             	movb   $0x0,(%eax)

	for (j = 0; j < n; j++)
     d8c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     d93:	eb 21                	jmp    db6 <int2str+0xbd>
	{
		temp[j] = result[n-1-j];
     d95:	8b 55 f4             	mov    -0xc(%ebp),%edx
     d98:	8b 45 e8             	mov    -0x18(%ebp),%eax
     d9b:	01 c2                	add    %eax,%edx
     d9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     da0:	83 e8 01             	sub    $0x1,%eax
     da3:	2b 45 f4             	sub    -0xc(%ebp),%eax
     da6:	89 c1                	mov    %eax,%ecx
     da8:	8b 45 ec             	mov    -0x14(%ebp),%eax
     dab:	01 c8                	add    %ecx,%eax
     dad:	0f b6 00             	movzbl (%eax),%eax
     db0:	88 02                	mov    %al,(%edx)
		result[n++] = (i % 10) + '0';
		i /= 10;
	}while (i!=0);
	result[n] = 0;

	for (j = 0; j < n; j++)
     db2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     db6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     db9:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     dbc:	7c d7                	jl     d95 <int2str+0x9c>
	{
		temp[j] = result[n-1-j];
	}
	temp[n] = 0;
     dbe:	8b 55 f0             	mov    -0x10(%ebp),%edx
     dc1:	8b 45 e8             	mov    -0x18(%ebp),%eax
     dc4:	01 d0                	add    %edx,%eax
     dc6:	c6 00 00             	movb   $0x0,(%eax)
	free(result);
     dc9:	8b 45 ec             	mov    -0x14(%ebp),%eax
     dcc:	89 04 24             	mov    %eax,(%esp)
     dcf:	e8 3d 3b 00 00       	call   4911 <free>
	return temp;
     dd4:	8b 45 e8             	mov    -0x18(%ebp),%eax
}
     dd7:	83 c4 24             	add    $0x24,%esp
     dda:	5b                   	pop    %ebx
     ddb:	5d                   	pop    %ebp
     ddc:	c3                   	ret    

00000ddd <printItemList>:

void printItemList() {
     ddd:	55                   	push   %ebp
     dde:	89 e5                	mov    %esp,%ebp
     de0:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *p;
	p = fileItemList;
     de3:	a1 a4 f7 00 00       	mov    0xf7a4,%eax
     de8:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     deb:	eb 27                	jmp    e14 <printItemList+0x37>
		printf(0, "%s\n", p->name);
     ded:	8b 45 f4             	mov    -0xc(%ebp),%eax
     df0:	8b 40 14             	mov    0x14(%eax),%eax
     df3:	89 44 24 08          	mov    %eax,0x8(%esp)
     df7:	c7 44 24 04 39 ae 00 	movl   $0xae39,0x4(%esp)
     dfe:	00 
     dff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e06:	e8 53 39 00 00       	call   475e <printf>
		p = p->next;
     e0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e0e:	8b 40 2c             	mov    0x2c(%eax),%eax
     e11:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void printItemList() {
	struct fileItem *p;
	p = fileItemList;
	while (p != 0) {
     e14:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e18:	75 d3                	jne    ded <printItemList+0x10>
		printf(0, "%s\n", p->name);
		p = p->next;
	}
}
     e1a:	c9                   	leave  
     e1b:	c3                   	ret    

00000e1c <getPos>:

Rect getPos(Context context, int n) {
     e1c:	55                   	push   %ebp
     e1d:	89 e5                	mov    %esp,%ebp
     e1f:	83 ec 48             	sub    $0x48,%esp
	if (style == ICON_STYLE) {
     e22:	a1 e4 ee 00 00       	mov    0xeee4,%eax
     e27:	83 f8 01             	cmp    $0x1,%eax
     e2a:	0f 85 80 00 00 00    	jne    eb0 <getPos+0x94>
		int m = context.width / (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
     e30:	8b 4d 10             	mov    0x10(%ebp),%ecx
     e33:	ba 7f e0 07 7e       	mov    $0x7e07e07f,%edx
     e38:	89 c8                	mov    %ecx,%eax
     e3a:	f7 ea                	imul   %edx
     e3c:	c1 fa 06             	sar    $0x6,%edx
     e3f:	89 c8                	mov    %ecx,%eax
     e41:	c1 f8 1f             	sar    $0x1f,%eax
     e44:	29 c2                	sub    %eax,%edx
     e46:	89 d0                	mov    %edx,%eax
     e48:	89 45 f4             	mov    %eax,-0xc(%ebp)
		int r = n / m;
     e4b:	8b 45 18             	mov    0x18(%ebp),%eax
     e4e:	99                   	cltd   
     e4f:	f7 7d f4             	idivl  -0xc(%ebp)
     e52:	89 45 f0             	mov    %eax,-0x10(%ebp)
		int c = n % m;
     e55:	8b 45 18             	mov    0x18(%ebp),%eax
     e58:	99                   	cltd   
     e59:	f7 7d f4             	idivl  -0xc(%ebp)
     e5c:	89 55 ec             	mov    %edx,-0x14(%ebp)
		int y_top = r * (ICON_ITEM_HEIGHT + ICON_ITEM_GAP_Y)+ TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + ICON_ITEM_GAP_Y;
     e5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e62:	6b c0 73             	imul   $0x73,%eax,%eax
     e65:	83 c0 5a             	add    $0x5a,%eax
     e68:	89 45 e8             	mov    %eax,-0x18(%ebp)
		int x_left = c * (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
     e6b:	8b 45 ec             	mov    -0x14(%ebp),%eax
     e6e:	01 c0                	add    %eax,%eax
     e70:	89 c2                	mov    %eax,%edx
     e72:	c1 e2 06             	shl    $0x6,%edx
     e75:	01 d0                	add    %edx,%eax
     e77:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		return initRect(x_left, y_top + scrollOffset, ICON_ITEM_WIDTH,
     e7a:	8b 15 a0 f7 00 00    	mov    0xf7a0,%edx
     e80:	8b 45 e8             	mov    -0x18(%ebp),%eax
     e83:	01 c2                	add    %eax,%edx
     e85:	8b 45 08             	mov    0x8(%ebp),%eax
     e88:	c7 44 24 10 5f 00 00 	movl   $0x5f,0x10(%esp)
     e8f:	00 
     e90:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
     e97:	00 
     e98:	89 54 24 08          	mov    %edx,0x8(%esp)
     e9c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     e9f:	89 54 24 04          	mov    %edx,0x4(%esp)
     ea3:	89 04 24             	mov    %eax,(%esp)
     ea6:	e8 ad 2d 00 00       	call   3c58 <initRect>
     eab:	83 ec 04             	sub    $0x4,%esp
     eae:	eb 3d                	jmp    eed <getPos+0xd1>
				ICON_ITEM_HEIGHT);
	} else {
		return initRect(0, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT + n * (LIST_ITEM_HEIGHT + LIST_ITEM_GAP) + scrollOffset, context.width,
     eb0:	8b 4d 10             	mov    0x10(%ebp),%ecx
     eb3:	8b 55 18             	mov    0x18(%ebp),%edx
     eb6:	89 d0                	mov    %edx,%eax
     eb8:	c1 e0 05             	shl    $0x5,%eax
     ebb:	29 d0                	sub    %edx,%eax
     ebd:	8d 50 62             	lea    0x62(%eax),%edx
     ec0:	a1 a0 f7 00 00       	mov    0xf7a0,%eax
     ec5:	01 c2                	add    %eax,%edx
     ec7:	8b 45 08             	mov    0x8(%ebp),%eax
     eca:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
     ed1:	00 
     ed2:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     ed6:	89 54 24 08          	mov    %edx,0x8(%esp)
     eda:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     ee1:	00 
     ee2:	89 04 24             	mov    %eax,(%esp)
     ee5:	e8 6e 2d 00 00       	call   3c58 <initRect>
     eea:	83 ec 04             	sub    $0x4,%esp
				LIST_ITEM_HEIGHT);
	}
}
     eed:	8b 45 08             	mov    0x8(%ebp),%eax
     ef0:	c9                   	leave  
     ef1:	c2 04 00             	ret    $0x4

00000ef4 <addItemEvent>:

// 事件处理相关操作
void addItemEvent(ClickableManager *cm, struct fileItem item) {
     ef4:	55                   	push   %ebp
     ef5:	89 e5                	mov    %esp,%ebp
     ef7:	83 ec 28             	sub    $0x28,%esp
	if (style == ICON_STYLE) {
     efa:	a1 e4 ee 00 00       	mov    0xeee4,%eax
     eff:	83 f8 01             	cmp    $0x1,%eax
     f02:	75 0d                	jne    f11 <addItemEvent+0x1d>
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)
     f04:	8b 45 28             	mov    0x28(%ebp),%eax
     f07:	83 f8 45             	cmp    $0x45,%eax
     f0a:	7f 12                	jg     f1e <addItemEvent+0x2a>
			return;
     f0c:	e9 e0 00 00 00       	jmp    ff1 <addItemEvent+0xfd>
	} else {
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)
     f11:	8b 45 28             	mov    0x28(%ebp),%eax
     f14:	83 f8 61             	cmp    $0x61,%eax
     f17:	7f 05                	jg     f1e <addItemEvent+0x2a>
			return;
     f19:	e9 d3 00 00 00       	jmp    ff1 <addItemEvent+0xfd>
	}
	switch (item.st.type) {
     f1e:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
     f22:	98                   	cwtl   
     f23:	83 f8 01             	cmp    $0x1,%eax
     f26:	74 45                	je     f6d <addItemEvent+0x79>
     f28:	83 f8 02             	cmp    $0x2,%eax
     f2b:	0f 85 ac 00 00 00    	jne    fdd <addItemEvent+0xe9>
	case T_FILE:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     f31:	c7 44 24 18 9a 1f 00 	movl   $0x1f9a,0x18(%esp)
     f38:	00 
     f39:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
     f40:	00 
     f41:	8b 45 24             	mov    0x24(%ebp),%eax
     f44:	89 44 24 04          	mov    %eax,0x4(%esp)
     f48:	8b 45 28             	mov    0x28(%ebp),%eax
     f4b:	89 44 24 08          	mov    %eax,0x8(%esp)
     f4f:	8b 45 2c             	mov    0x2c(%ebp),%eax
     f52:	89 44 24 0c          	mov    %eax,0xc(%esp)
     f56:	8b 45 30             	mov    0x30(%ebp),%eax
     f59:	89 44 24 10          	mov    %eax,0x10(%esp)
     f5d:	8b 45 08             	mov    0x8(%ebp),%eax
     f60:	89 04 24             	mov    %eax,(%esp)
     f63:	e8 dc 2d 00 00       	call   3d44 <createClickable>
		break;
     f68:	e9 84 00 00 00       	jmp    ff1 <addItemEvent+0xfd>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     f6d:	c7 44 24 18 9a 1f 00 	movl   $0x1f9a,0x18(%esp)
     f74:	00 
     f75:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
     f7c:	00 
     f7d:	8b 45 24             	mov    0x24(%ebp),%eax
     f80:	89 44 24 04          	mov    %eax,0x4(%esp)
     f84:	8b 45 28             	mov    0x28(%ebp),%eax
     f87:	89 44 24 08          	mov    %eax,0x8(%esp)
     f8b:	8b 45 2c             	mov    0x2c(%ebp),%eax
     f8e:	89 44 24 0c          	mov    %eax,0xc(%esp)
     f92:	8b 45 30             	mov    0x30(%ebp),%eax
     f95:	89 44 24 10          	mov    %eax,0x10(%esp)
     f99:	8b 45 08             	mov    0x8(%ebp),%eax
     f9c:	89 04 24             	mov    %eax,(%esp)
     f9f:	e8 a0 2d 00 00       	call   3d44 <createClickable>
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_enterDir);
     fa4:	c7 44 24 18 30 16 00 	movl   $0x1630,0x18(%esp)
     fab:	00 
     fac:	c7 44 24 14 04 00 00 	movl   $0x4,0x14(%esp)
     fb3:	00 
     fb4:	8b 45 24             	mov    0x24(%ebp),%eax
     fb7:	89 44 24 04          	mov    %eax,0x4(%esp)
     fbb:	8b 45 28             	mov    0x28(%ebp),%eax
     fbe:	89 44 24 08          	mov    %eax,0x8(%esp)
     fc2:	8b 45 2c             	mov    0x2c(%ebp),%eax
     fc5:	89 44 24 0c          	mov    %eax,0xc(%esp)
     fc9:	8b 45 30             	mov    0x30(%ebp),%eax
     fcc:	89 44 24 10          	mov    %eax,0x10(%esp)
     fd0:	8b 45 08             	mov    0x8(%ebp),%eax
     fd3:	89 04 24             	mov    %eax,(%esp)
     fd6:	e8 69 2d 00 00       	call   3d44 <createClickable>
		break;
     fdb:	eb 14                	jmp    ff1 <addItemEvent+0xfd>
	default:
		printf(0, "unknown file type!");
     fdd:	c7 44 24 04 3d ae 00 	movl   $0xae3d,0x4(%esp)
     fe4:	00 
     fe5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     fec:	e8 6d 37 00 00       	call   475e <printf>
	}
}
     ff1:	c9                   	leave  
     ff2:	c3                   	ret    

00000ff3 <addListEvent>:

void addListEvent(ClickableManager *cm) {
     ff3:	55                   	push   %ebp
     ff4:	89 e5                	mov    %esp,%ebp
     ff6:	83 ec 58             	sub    $0x58,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
     ff9:	a1 a4 f7 00 00       	mov    0xf7a4,%eax
     ffe:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    1001:	eb 70                	jmp    1073 <addListEvent+0x80>
		temp = p;
    1003:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1006:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
    1009:	8b 45 f4             	mov    -0xc(%ebp),%eax
    100c:	8b 40 2c             	mov    0x2c(%eax),%eax
    100f:	89 45 f4             	mov    %eax,-0xc(%ebp)
		addItemEvent(cm, *temp);
    1012:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1015:	8b 10                	mov    (%eax),%edx
    1017:	89 54 24 04          	mov    %edx,0x4(%esp)
    101b:	8b 50 04             	mov    0x4(%eax),%edx
    101e:	89 54 24 08          	mov    %edx,0x8(%esp)
    1022:	8b 50 08             	mov    0x8(%eax),%edx
    1025:	89 54 24 0c          	mov    %edx,0xc(%esp)
    1029:	8b 50 0c             	mov    0xc(%eax),%edx
    102c:	89 54 24 10          	mov    %edx,0x10(%esp)
    1030:	8b 50 10             	mov    0x10(%eax),%edx
    1033:	89 54 24 14          	mov    %edx,0x14(%esp)
    1037:	8b 50 14             	mov    0x14(%eax),%edx
    103a:	89 54 24 18          	mov    %edx,0x18(%esp)
    103e:	8b 50 18             	mov    0x18(%eax),%edx
    1041:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    1045:	8b 50 1c             	mov    0x1c(%eax),%edx
    1048:	89 54 24 20          	mov    %edx,0x20(%esp)
    104c:	8b 50 20             	mov    0x20(%eax),%edx
    104f:	89 54 24 24          	mov    %edx,0x24(%esp)
    1053:	8b 50 24             	mov    0x24(%eax),%edx
    1056:	89 54 24 28          	mov    %edx,0x28(%esp)
    105a:	8b 50 28             	mov    0x28(%eax),%edx
    105d:	89 54 24 2c          	mov    %edx,0x2c(%esp)
    1061:	8b 40 2c             	mov    0x2c(%eax),%eax
    1064:	89 44 24 30          	mov    %eax,0x30(%esp)
    1068:	8b 45 08             	mov    0x8(%ebp),%eax
    106b:	89 04 24             	mov    %eax,(%esp)
    106e:	e8 81 fe ff ff       	call   ef4 <addItemEvent>
}

void addListEvent(ClickableManager *cm) {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
    1073:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1077:	75 8a                	jne    1003 <addListEvent+0x10>
		temp = p;
		p = p->next;
		addItemEvent(cm, *temp);
	}
}
    1079:	c9                   	leave  
    107a:	c3                   	ret    

0000107b <addWndEvent>:

Handler wndEvents[] = { h_closeWnd, h_empty, h_chvm2, h_chvm1, h_newFolder,
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_copyFile, h_pasteFile };

void addWndEvent(ClickableManager *cm) {
    107b:	55                   	push   %ebp
    107c:	89 e5                	mov    %esp,%ebp
    107e:	57                   	push   %edi
    107f:	56                   	push   %esi
    1080:	53                   	push   %ebx
    1081:	83 ec 4c             	sub    $0x4c,%esp
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
    1084:	c7 45 e0 0c 00 00 00 	movl   $0xc,-0x20(%ebp)
	for (i = 0; i < n; i++) {
    108b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1092:	e9 96 00 00 00       	jmp    112d <addWndEvent+0xb2>
		createClickable(cm,
    1097:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    109a:	8b 1c 85 60 f2 00 00 	mov    0xf260(,%eax,4),%ebx
    10a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10a4:	6b c0 34             	imul   $0x34,%eax,%eax
    10a7:	05 00 f0 00 00       	add    $0xf000,%eax
    10ac:	8b 78 10             	mov    0x10(%eax),%edi
    10af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10b2:	6b c0 34             	imul   $0x34,%eax,%eax
    10b5:	05 00 f0 00 00       	add    $0xf000,%eax
    10ba:	8b 70 0c             	mov    0xc(%eax),%esi
    10bd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10c0:	6b c0 34             	imul   $0x34,%eax,%eax
    10c3:	05 00 f0 00 00       	add    $0xf000,%eax
    10c8:	8b 48 04             	mov    0x4(%eax),%ecx
    10cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10ce:	6b c0 34             	imul   $0x34,%eax,%eax
    10d1:	05 00 f0 00 00       	add    $0xf000,%eax
    10d6:	8b 10                	mov    (%eax),%edx
    10d8:	8d 45 d0             	lea    -0x30(%ebp),%eax
    10db:	89 7c 24 10          	mov    %edi,0x10(%esp)
    10df:	89 74 24 0c          	mov    %esi,0xc(%esp)
    10e3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    10e7:	89 54 24 04          	mov    %edx,0x4(%esp)
    10eb:	89 04 24             	mov    %eax,(%esp)
    10ee:	e8 65 2b 00 00       	call   3c58 <initRect>
    10f3:	83 ec 04             	sub    $0x4,%esp
    10f6:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    10fa:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    1101:	00 
    1102:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1105:	89 44 24 04          	mov    %eax,0x4(%esp)
    1109:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    110c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1110:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1113:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1117:	8b 45 dc             	mov    -0x24(%ebp),%eax
    111a:	89 44 24 10          	mov    %eax,0x10(%esp)
    111e:	8b 45 08             	mov    0x8(%ebp),%eax
    1121:	89 04 24             	mov    %eax,(%esp)
    1124:	e8 1b 2c 00 00       	call   3d44 <createClickable>
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_copyFile, h_pasteFile };

void addWndEvent(ClickableManager *cm) {
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
	for (i = 0; i < n; i++) {
    1129:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    112d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1130:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    1133:	0f 8c 5e ff ff ff    	jl     1097 <addWndEvent+0x1c>
		createClickable(cm,
				initRect(wndRes[i].position_x, wndRes[i].position_y,
						wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
				wndEvents[i]);
	}
}
    1139:	8d 65 f4             	lea    -0xc(%ebp),%esp
    113c:	5b                   	pop    %ebx
    113d:	5e                   	pop    %esi
    113e:	5f                   	pop    %edi
    113f:	5d                   	pop    %ebp
    1140:	c3                   	ret    

00001141 <getFileItem>:

struct fileItem * getFileItem(Point point) {
    1141:	55                   	push   %ebp
    1142:	89 e5                	mov    %esp,%ebp
    1144:	83 ec 38             	sub    $0x38,%esp
	struct fileItem *p = fileItemList;
    1147:	a1 a4 f7 00 00       	mov    0xf7a4,%eax
    114c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    114f:	eb 43                	jmp    1194 <getFileItem+0x53>
		if (isIn(point, p->pos)) {
    1151:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1154:	8b 50 18             	mov    0x18(%eax),%edx
    1157:	89 54 24 08          	mov    %edx,0x8(%esp)
    115b:	8b 50 1c             	mov    0x1c(%eax),%edx
    115e:	89 54 24 0c          	mov    %edx,0xc(%esp)
    1162:	8b 50 20             	mov    0x20(%eax),%edx
    1165:	89 54 24 10          	mov    %edx,0x10(%esp)
    1169:	8b 40 24             	mov    0x24(%eax),%eax
    116c:	89 44 24 14          	mov    %eax,0x14(%esp)
    1170:	8b 45 08             	mov    0x8(%ebp),%eax
    1173:	8b 55 0c             	mov    0xc(%ebp),%edx
    1176:	89 04 24             	mov    %eax,(%esp)
    1179:	89 54 24 04          	mov    %edx,0x4(%esp)
    117d:	e8 31 2b 00 00       	call   3cb3 <isIn>
    1182:	85 c0                	test   %eax,%eax
    1184:	74 05                	je     118b <getFileItem+0x4a>
			return p;
    1186:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1189:	eb 14                	jmp    119f <getFileItem+0x5e>
		}
		p = p->next;
    118b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    118e:	8b 40 2c             	mov    0x2c(%eax),%eax
    1191:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
}

struct fileItem * getFileItem(Point point) {
	struct fileItem *p = fileItemList;
	while (p != 0) {
    1194:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1198:	75 b7                	jne    1151 <getFileItem+0x10>
		if (isIn(point, p->pos)) {
			return p;
		}
		p = p->next;
	}
	return 0;
    119a:	b8 00 00 00 00       	mov    $0x0,%eax
}
    119f:	c9                   	leave  
    11a0:	c3                   	ret    

000011a1 <scrollDown>:

void scrollDown() {
    11a1:	55                   	push   %ebp
    11a2:	89 e5                	mov    %esp,%ebp
    11a4:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    11a7:	a1 a4 f7 00 00       	mov    0xf7a4,%eax
    11ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// while (q != 0)
	// {
	// 	p = q;
	// 	q = q->next;
	// }
	if (style == ICON_STYLE){
    11af:	a1 e4 ee 00 00       	mov    0xeee4,%eax
    11b4:	83 f8 01             	cmp    $0x1,%eax
    11b7:	75 44                	jne    11fd <scrollDown+0x5c>
		if(q->pos.start.y > (WINDOW_HEIGHT - ICON_ITEM_HEIGHT)){
    11b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11bc:	8b 40 1c             	mov    0x1c(%eax),%eax
    11bf:	3d 63 01 00 00       	cmp    $0x163,%eax
    11c4:	7e 79                	jle    123f <scrollDown+0x9e>
			if(q->pos.start.y > WINDOW_HEIGHT){
    11c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11c9:	8b 40 1c             	mov    0x1c(%eax),%eax
    11cc:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    11d1:	7e 0f                	jle    11e2 <scrollDown+0x41>
				scrollOffset -= SCROLL_UNIT;
    11d3:	a1 a0 f7 00 00       	mov    0xf7a0,%eax
    11d8:	83 e8 1e             	sub    $0x1e,%eax
    11db:	a3 a0 f7 00 00       	mov    %eax,0xf7a0
    11e0:	eb 5d                	jmp    123f <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - ICON_ITEM_HEIGHT));
    11e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11e5:	8b 40 1c             	mov    0x1c(%eax),%eax
    11e8:	ba 63 01 00 00       	mov    $0x163,%edx
    11ed:	29 c2                	sub    %eax,%edx
    11ef:	a1 a0 f7 00 00       	mov    0xf7a0,%eax
    11f4:	01 d0                	add    %edx,%eax
    11f6:	a3 a0 f7 00 00       	mov    %eax,0xf7a0
    11fb:	eb 42                	jmp    123f <scrollDown+0x9e>
			}
		}
	}
	else{
		if(q->pos.start.y > (WINDOW_HEIGHT - LIST_ITEM_HEIGHT)){
    11fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1200:	8b 40 1c             	mov    0x1c(%eax),%eax
    1203:	3d a4 01 00 00       	cmp    $0x1a4,%eax
    1208:	7e 35                	jle    123f <scrollDown+0x9e>
			if(q->pos.start.y > WINDOW_HEIGHT){
    120a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    120d:	8b 40 1c             	mov    0x1c(%eax),%eax
    1210:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    1215:	7e 0f                	jle    1226 <scrollDown+0x85>
				scrollOffset -= SCROLL_UNIT;
    1217:	a1 a0 f7 00 00       	mov    0xf7a0,%eax
    121c:	83 e8 1e             	sub    $0x1e,%eax
    121f:	a3 a0 f7 00 00       	mov    %eax,0xf7a0
    1224:	eb 19                	jmp    123f <scrollDown+0x9e>
			}
			else{
				scrollOffset -= (q->pos.start.y - (WINDOW_HEIGHT - LIST_ITEM_HEIGHT));
    1226:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1229:	8b 40 1c             	mov    0x1c(%eax),%eax
    122c:	ba a4 01 00 00       	mov    $0x1a4,%edx
    1231:	29 c2                	sub    %eax,%edx
    1233:	a1 a0 f7 00 00       	mov    0xf7a0,%eax
    1238:	01 d0                	add    %edx,%eax
    123a:	a3 a0 f7 00 00       	mov    %eax,0xf7a0
			}
		}
	}
	//printf(0, "tryingToScrollDown, current Offset %d\n", scrollOffset);
	printf(0, "scrollDown, current Offset %d\n", scrollOffset);
    123f:	a1 a0 f7 00 00       	mov    0xf7a0,%eax
    1244:	89 44 24 08          	mov    %eax,0x8(%esp)
    1248:	c7 44 24 04 50 ae 00 	movl   $0xae50,0x4(%esp)
    124f:	00 
    1250:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1257:	e8 02 35 00 00       	call   475e <printf>
}
    125c:	c9                   	leave  
    125d:	c3                   	ret    

0000125e <h_scrollDown>:

void h_scrollDown(Point p) {
    125e:	55                   	push   %ebp
    125f:	89 e5                	mov    %esp,%ebp
    1261:	83 ec 38             	sub    $0x38,%esp
	scrollDown();
    1264:	e8 38 ff ff ff       	call   11a1 <scrollDown>
	freeFileItemList();
    1269:	e8 63 ee ff ff       	call   d1 <freeFileItemList>
	list(".");
    126e:	c7 04 24 6f ae 00 00 	movl   $0xae6f,(%esp)
    1275:	e8 35 ef ff ff       	call   1af <list>
	drawFinderContent(context);
    127a:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    127f:	89 04 24             	mov    %eax,(%esp)
    1282:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    1287:	89 44 24 04          	mov    %eax,0x4(%esp)
    128b:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    1290:	89 44 24 08          	mov    %eax,0x8(%esp)
    1294:	e8 d9 f7 ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    1299:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    129e:	89 04 24             	mov    %eax,(%esp)
    12a1:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    12a6:	89 44 24 04          	mov    %eax,0x4(%esp)
    12aa:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    12af:	89 44 24 08          	mov    %eax,0x8(%esp)
    12b3:	e8 f9 f5 ff ff       	call   8b1 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    12b8:	8d 45 e8             	lea    -0x18(%ebp),%eax
    12bb:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    12c2:	00 
    12c3:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    12ca:	00 
    12cb:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    12d2:	00 
    12d3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    12da:	00 
    12db:	89 04 24             	mov    %eax,(%esp)
    12de:	e8 75 29 00 00       	call   3c58 <initRect>
    12e3:	83 ec 04             	sub    $0x4,%esp
    12e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    12e9:	89 44 24 04          	mov    %eax,0x4(%esp)
    12ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12f0:	89 44 24 08          	mov    %eax,0x8(%esp)
    12f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12f7:	89 44 24 0c          	mov    %eax,0xc(%esp)
    12fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12fe:	89 44 24 10          	mov    %eax,0x10(%esp)
    1302:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    1309:	e8 4d 2b 00 00       	call   3e5b <deleteClickable>
	addWndEvent(&cm);
    130e:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    1315:	e8 61 fd ff ff       	call   107b <addWndEvent>
	addListEvent(&cm);
    131a:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    1321:	e8 cd fc ff ff       	call   ff3 <addListEvent>
}
    1326:	c9                   	leave  
    1327:	c3                   	ret    

00001328 <scrollUp>:

void scrollUp() {
    1328:	55                   	push   %ebp
    1329:	89 e5                	mov    %esp,%ebp
    132b:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    132e:	a1 a4 f7 00 00       	mov    0xf7a4,%eax
    1333:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p;
	while (q != 0)
    1336:	eb 0f                	jmp    1347 <scrollUp+0x1f>
	{
		p = q;
    1338:	8b 45 f4             	mov    -0xc(%ebp),%eax
    133b:	89 45 f0             	mov    %eax,-0x10(%ebp)
		q = q->next;
    133e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1341:	8b 40 2c             	mov    0x2c(%eax),%eax
    1344:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void scrollUp() {
	struct fileItem *q = fileItemList;
	struct fileItem *p;
	while (q != 0)
    1347:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    134b:	75 eb                	jne    1338 <scrollUp+0x10>
	{
		p = q;
		q = q->next;
	}
	if (style == ICON_STYLE){
    134d:	a1 e4 ee 00 00       	mov    0xeee4,%eax
    1352:	83 f8 01             	cmp    $0x1,%eax
    1355:	75 40                	jne    1397 <scrollUp+0x6f>
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)){
    1357:	8b 45 f0             	mov    -0x10(%ebp),%eax
    135a:	8b 40 1c             	mov    0x1c(%eax),%eax
    135d:	83 f8 45             	cmp    $0x45,%eax
    1360:	7f 73                	jg     13d5 <scrollUp+0xad>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - ICON_ITEM_HEIGHT)){
    1362:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1365:	8b 40 1c             	mov    0x1c(%eax),%eax
    1368:	83 f8 e7             	cmp    $0xffffffe7,%eax
    136b:	7d 0f                	jge    137c <scrollUp+0x54>
				scrollOffset += SCROLL_UNIT;
    136d:	a1 a0 f7 00 00       	mov    0xf7a0,%eax
    1372:	83 c0 1e             	add    $0x1e,%eax
    1375:	a3 a0 f7 00 00       	mov    %eax,0xf7a0
    137a:	eb 59                	jmp    13d5 <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT));
    137c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    137f:	8b 40 1c             	mov    0x1c(%eax),%eax
    1382:	ba 46 00 00 00       	mov    $0x46,%edx
    1387:	29 c2                	sub    %eax,%edx
    1389:	a1 a0 f7 00 00       	mov    0xf7a0,%eax
    138e:	01 d0                	add    %edx,%eax
    1390:	a3 a0 f7 00 00       	mov    %eax,0xf7a0
    1395:	eb 3e                	jmp    13d5 <scrollUp+0xad>
			}
		}
	}
	else{
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)){
    1397:	8b 45 f0             	mov    -0x10(%ebp),%eax
    139a:	8b 40 1c             	mov    0x1c(%eax),%eax
    139d:	83 f8 61             	cmp    $0x61,%eax
    13a0:	7f 33                	jg     13d5 <scrollUp+0xad>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - LIST_ITEM_HEIGHT)){
    13a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    13a5:	8b 40 1c             	mov    0x1c(%eax),%eax
    13a8:	83 f8 43             	cmp    $0x43,%eax
    13ab:	7f 0f                	jg     13bc <scrollUp+0x94>
				scrollOffset += SCROLL_UNIT;
    13ad:	a1 a0 f7 00 00       	mov    0xf7a0,%eax
    13b2:	83 c0 1e             	add    $0x1e,%eax
    13b5:	a3 a0 f7 00 00       	mov    %eax,0xf7a0
    13ba:	eb 19                	jmp    13d5 <scrollUp+0xad>
			}
			else{
				scrollOffset += -(p->pos.start.y - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT));
    13bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    13bf:	8b 40 1c             	mov    0x1c(%eax),%eax
    13c2:	ba 62 00 00 00       	mov    $0x62,%edx
    13c7:	29 c2                	sub    %eax,%edx
    13c9:	a1 a0 f7 00 00       	mov    0xf7a0,%eax
    13ce:	01 d0                	add    %edx,%eax
    13d0:	a3 a0 f7 00 00       	mov    %eax,0xf7a0
			}
		}
	}
	//printf(0, "tryingToScrollUp, current Offset %d\n", scrollOffset);
	printf(0, "scrollUp, current Offset %d\n", scrollOffset);
    13d5:	a1 a0 f7 00 00       	mov    0xf7a0,%eax
    13da:	89 44 24 08          	mov    %eax,0x8(%esp)
    13de:	c7 44 24 04 71 ae 00 	movl   $0xae71,0x4(%esp)
    13e5:	00 
    13e6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    13ed:	e8 6c 33 00 00       	call   475e <printf>
}
    13f2:	c9                   	leave  
    13f3:	c3                   	ret    

000013f4 <h_scrollUp>:

void h_scrollUp(Point p) {
    13f4:	55                   	push   %ebp
    13f5:	89 e5                	mov    %esp,%ebp
    13f7:	83 ec 38             	sub    $0x38,%esp
	scrollUp();
    13fa:	e8 29 ff ff ff       	call   1328 <scrollUp>
	freeFileItemList();
    13ff:	e8 cd ec ff ff       	call   d1 <freeFileItemList>
	list(".");
    1404:	c7 04 24 6f ae 00 00 	movl   $0xae6f,(%esp)
    140b:	e8 9f ed ff ff       	call   1af <list>
	drawFinderContent(context);
    1410:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    1415:	89 04 24             	mov    %eax,(%esp)
    1418:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    141d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1421:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    1426:	89 44 24 08          	mov    %eax,0x8(%esp)
    142a:	e8 43 f6 ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    142f:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    1434:	89 04 24             	mov    %eax,(%esp)
    1437:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    143c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1440:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    1445:	89 44 24 08          	mov    %eax,0x8(%esp)
    1449:	e8 63 f4 ff ff       	call   8b1 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    144e:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1451:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1458:	00 
    1459:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1460:	00 
    1461:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1468:	00 
    1469:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1470:	00 
    1471:	89 04 24             	mov    %eax,(%esp)
    1474:	e8 df 27 00 00       	call   3c58 <initRect>
    1479:	83 ec 04             	sub    $0x4,%esp
    147c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    147f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1483:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1486:	89 44 24 08          	mov    %eax,0x8(%esp)
    148a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    148d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1491:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1494:	89 44 24 10          	mov    %eax,0x10(%esp)
    1498:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    149f:	e8 b7 29 00 00       	call   3e5b <deleteClickable>
	addWndEvent(&cm);
    14a4:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    14ab:	e8 cb fb ff ff       	call   107b <addWndEvent>
	addListEvent(&cm);
    14b0:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    14b7:	e8 37 fb ff ff       	call   ff3 <addListEvent>
}
    14bc:	c9                   	leave  
    14bd:	c3                   	ret    

000014be <updatePath>:

void updatePath(char *name) {
    14be:	55                   	push   %ebp
    14bf:	89 e5                	mov    %esp,%ebp
    14c1:	83 ec 28             	sub    $0x28,%esp
    //printf(2, "cd success\r\n");
    int n = strlen(name);
    14c4:	8b 45 08             	mov    0x8(%ebp),%eax
    14c7:	89 04 24             	mov    %eax,(%esp)
    14ca:	e8 d3 2e 00 00       	call   43a2 <strlen>
    14cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
    int i;
    if (n == 2 && name[0] == '.' && name[1] == '.')
    14d2:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    14d6:	0f 85 84 00 00 00    	jne    1560 <updatePath+0xa2>
    14dc:	8b 45 08             	mov    0x8(%ebp),%eax
    14df:	0f b6 00             	movzbl (%eax),%eax
    14e2:	3c 2e                	cmp    $0x2e,%al
    14e4:	75 7a                	jne    1560 <updatePath+0xa2>
    14e6:	8b 45 08             	mov    0x8(%ebp),%eax
    14e9:	83 c0 01             	add    $0x1,%eax
    14ec:	0f b6 00             	movzbl (%eax),%eax
    14ef:	3c 2e                	cmp    $0x2e,%al
    14f1:	75 6d                	jne    1560 <updatePath+0xa2>
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    14f3:	c7 04 24 c0 2d 01 00 	movl   $0x12dc0,(%esp)
    14fa:	e8 a3 2e 00 00       	call   43a2 <strlen>
    14ff:	83 f8 01             	cmp    $0x1,%eax
    1502:	75 0b                	jne    150f <updatePath+0x51>
    1504:	0f b6 05 c0 2d 01 00 	movzbl 0x12dc0,%eax
    150b:	3c 2f                	cmp    $0x2f,%al
    150d:	74 4f                	je     155e <updatePath+0xa0>
        {
            int tmpn = strlen(currentPath);
    150f:	c7 04 24 c0 2d 01 00 	movl   $0x12dc0,(%esp)
    1516:	e8 87 2e 00 00       	call   43a2 <strlen>
    151b:	89 45 ec             	mov    %eax,-0x14(%ebp)
            currentPath[tmpn - 1] = '\0';
    151e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1521:	83 e8 01             	sub    $0x1,%eax
    1524:	c6 80 c0 2d 01 00 00 	movb   $0x0,0x12dc0(%eax)
            for (i = tmpn - 2; i > 0; i--)
    152b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    152e:	83 e8 02             	sub    $0x2,%eax
    1531:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1534:	eb 22                	jmp    1558 <updatePath+0x9a>
            {
                if (currentPath[i] != '/')
    1536:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1539:	05 c0 2d 01 00       	add    $0x12dc0,%eax
    153e:	0f b6 00             	movzbl (%eax),%eax
    1541:	3c 2f                	cmp    $0x2f,%al
    1543:	74 11                	je     1556 <updatePath+0x98>
                    currentPath[i] = '\0';
    1545:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1548:	05 c0 2d 01 00       	add    $0x12dc0,%eax
    154d:	c6 00 00             	movb   $0x0,(%eax)
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
        {
            int tmpn = strlen(currentPath);
            currentPath[tmpn - 1] = '\0';
            for (i = tmpn - 2; i > 0; i--)
    1550:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    1554:	eb 02                	jmp    1558 <updatePath+0x9a>
            {
                if (currentPath[i] != '/')
                    currentPath[i] = '\0';
                else
                    break;
    1556:	eb 06                	jmp    155e <updatePath+0xa0>
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
        {
            int tmpn = strlen(currentPath);
            currentPath[tmpn - 1] = '\0';
            for (i = tmpn - 2; i > 0; i--)
    1558:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    155c:	7f d8                	jg     1536 <updatePath+0x78>
    //printf(2, "cd success\r\n");
    int n = strlen(name);
    int i;
    if (n == 2 && name[0] == '.' && name[1] == '.')
    {
        if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    155e:	eb 4e                	jmp    15ae <updatePath+0xf0>
            }
        }
    }
    else
    {
        int tmpn = strlen(currentPath);
    1560:	c7 04 24 c0 2d 01 00 	movl   $0x12dc0,(%esp)
    1567:	e8 36 2e 00 00       	call   43a2 <strlen>
    156c:	89 45 e8             	mov    %eax,-0x18(%ebp)
        strcpy(currentPath + tmpn, name);
    156f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1572:	8d 90 c0 2d 01 00    	lea    0x12dc0(%eax),%edx
    1578:	8b 45 08             	mov    0x8(%ebp),%eax
    157b:	89 44 24 04          	mov    %eax,0x4(%esp)
    157f:	89 14 24             	mov    %edx,(%esp)
    1582:	e8 ac 2d 00 00       	call   4333 <strcpy>
        tmpn = strlen(currentPath);
    1587:	c7 04 24 c0 2d 01 00 	movl   $0x12dc0,(%esp)
    158e:	e8 0f 2e 00 00       	call   43a2 <strlen>
    1593:	89 45 e8             	mov    %eax,-0x18(%ebp)
        currentPath[tmpn] = '/';
    1596:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1599:	05 c0 2d 01 00       	add    $0x12dc0,%eax
    159e:	c6 00 2f             	movb   $0x2f,(%eax)
        currentPath[tmpn + 1] = '\0';
    15a1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15a4:	83 c0 01             	add    $0x1,%eax
    15a7:	c6 80 c0 2d 01 00 00 	movb   $0x0,0x12dc0(%eax)
    }
}
    15ae:	c9                   	leave  
    15af:	c3                   	ret    

000015b0 <enterDir>:

// Handlers
void enterDir(char *name) {
    15b0:	55                   	push   %ebp
    15b1:	89 e5                	mov    %esp,%ebp
    15b3:	83 ec 18             	sub    $0x18,%esp
	scrollOffset = 0;
    15b6:	c7 05 a0 f7 00 00 00 	movl   $0x0,0xf7a0
    15bd:	00 00 00 
	printf(0, "entering : %s\n", name);
    15c0:	8b 45 08             	mov    0x8(%ebp),%eax
    15c3:	89 44 24 08          	mov    %eax,0x8(%esp)
    15c7:	c7 44 24 04 8e ae 00 	movl   $0xae8e,0x4(%esp)
    15ce:	00 
    15cf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    15d6:	e8 83 31 00 00       	call   475e <printf>
	if (chdir(name) < 0)
    15db:	8b 45 08             	mov    0x8(%ebp),%eax
    15de:	89 04 24             	mov    %eax,(%esp)
    15e1:	e8 00 30 00 00       	call   45e6 <chdir>
    15e6:	85 c0                	test   %eax,%eax
    15e8:	79 1d                	jns    1607 <enterDir+0x57>
		printf(2, "cannot cd %s\n", name);
    15ea:	8b 45 08             	mov    0x8(%ebp),%eax
    15ed:	89 44 24 08          	mov    %eax,0x8(%esp)
    15f1:	c7 44 24 04 9d ae 00 	movl   $0xae9d,0x4(%esp)
    15f8:	00 
    15f9:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1600:	e8 59 31 00 00       	call   475e <printf>
    1605:	eb 0b                	jmp    1612 <enterDir+0x62>
	else
		updatePath(name);
    1607:	8b 45 08             	mov    0x8(%ebp),%eax
    160a:	89 04 24             	mov    %eax,(%esp)
    160d:	e8 ac fe ff ff       	call   14be <updatePath>
	printf(0, "currentPath: %s", currentPath);
    1612:	c7 44 24 08 c0 2d 01 	movl   $0x12dc0,0x8(%esp)
    1619:	00 
    161a:	c7 44 24 04 ab ae 00 	movl   $0xaeab,0x4(%esp)
    1621:	00 
    1622:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1629:	e8 30 31 00 00       	call   475e <printf>
}
    162e:	c9                   	leave  
    162f:	c3                   	ret    

00001630 <h_enterDir>:

void h_enterDir(Point p) {
    1630:	55                   	push   %ebp
    1631:	89 e5                	mov    %esp,%ebp
    1633:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *temp = getFileItem(p);
    1636:	8b 45 08             	mov    0x8(%ebp),%eax
    1639:	8b 55 0c             	mov    0xc(%ebp),%edx
    163c:	89 04 24             	mov    %eax,(%esp)
    163f:	89 54 24 04          	mov    %edx,0x4(%esp)
    1643:	e8 f9 fa ff ff       	call   1141 <getFileItem>
    1648:	89 45 f4             	mov    %eax,-0xc(%ebp)
	enterDir(temp->name);
    164b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    164e:	8b 40 14             	mov    0x14(%eax),%eax
    1651:	89 04 24             	mov    %eax,(%esp)
    1654:	e8 57 ff ff ff       	call   15b0 <enterDir>
	freeFileItemList();
    1659:	e8 73 ea ff ff       	call   d1 <freeFileItemList>
	list(".");
    165e:	c7 04 24 6f ae 00 00 	movl   $0xae6f,(%esp)
    1665:	e8 45 eb ff ff       	call   1af <list>
	drawFinderContent(context);
    166a:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    166f:	89 04 24             	mov    %eax,(%esp)
    1672:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    1677:	89 44 24 04          	mov    %eax,0x4(%esp)
    167b:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    1680:	89 44 24 08          	mov    %eax,0x8(%esp)
    1684:	e8 e9 f3 ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    1689:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    168e:	89 04 24             	mov    %eax,(%esp)
    1691:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    1696:	89 44 24 04          	mov    %eax,0x4(%esp)
    169a:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    169f:	89 44 24 08          	mov    %eax,0x8(%esp)
    16a3:	e8 09 f2 ff ff       	call   8b1 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    16a8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    16ab:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    16b2:	00 
    16b3:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    16ba:	00 
    16bb:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    16c2:	00 
    16c3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    16ca:	00 
    16cb:	89 04 24             	mov    %eax,(%esp)
    16ce:	e8 85 25 00 00       	call   3c58 <initRect>
    16d3:	83 ec 04             	sub    $0x4,%esp
    16d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16d9:	89 44 24 04          	mov    %eax,0x4(%esp)
    16dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16e0:	89 44 24 08          	mov    %eax,0x8(%esp)
    16e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    16e7:	89 44 24 0c          	mov    %eax,0xc(%esp)
    16eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    16ee:	89 44 24 10          	mov    %eax,0x10(%esp)
    16f2:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    16f9:	e8 5d 27 00 00       	call   3e5b <deleteClickable>
	addWndEvent(&cm);
    16fe:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    1705:	e8 71 f9 ff ff       	call   107b <addWndEvent>
	addListEvent(&cm);
    170a:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    1711:	e8 dd f8 ff ff       	call   ff3 <addListEvent>
}
    1716:	c9                   	leave  
    1717:	c3                   	ret    

00001718 <newFile>:

void newFile(char *name) {
    1718:	55                   	push   %ebp
    1719:	89 e5                	mov    %esp,%ebp
    171b:	83 ec 28             	sub    $0x28,%esp
	int fd;
	int n = strlen(name);
    171e:	8b 45 08             	mov    0x8(%ebp),%eax
    1721:	89 04 24             	mov    %eax,(%esp)
    1724:	e8 79 2c 00 00       	call   43a2 <strlen>
    1729:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 8;
    172c:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
	int counter;
	while ((fd = open(name, 0)) > 0)
    1733:	eb 60                	jmp    1795 <newFile+0x7d>
	{
		n = strlen(name);
    1735:	8b 45 08             	mov    0x8(%ebp),%eax
    1738:	89 04 24             	mov    %eax,(%esp)
    173b:	e8 62 2c 00 00       	call   43a2 <strlen>
    1740:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    1743:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1746:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1749:	75 09                	jne    1754 <newFile+0x3c>
		{
			counter = 1;
    174b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1752:	eb 17                	jmp    176b <newFile+0x53>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    1754:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1757:	8b 45 08             	mov    0x8(%ebp),%eax
    175a:	01 d0                	add    %edx,%eax
    175c:	89 04 24             	mov    %eax,(%esp)
    175f:	e8 80 2d 00 00       	call   44e4 <atoi>
    1764:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    1767:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    176b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    176e:	89 04 24             	mov    %eax,(%esp)
    1771:	e8 83 f5 ff ff       	call   cf9 <int2str>
    1776:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1779:	8b 55 08             	mov    0x8(%ebp),%edx
    177c:	01 ca                	add    %ecx,%edx
    177e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1782:	89 14 24             	mov    %edx,(%esp)
    1785:	e8 a9 2b 00 00       	call   4333 <strcpy>
		close(fd);
    178a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    178d:	89 04 24             	mov    %eax,(%esp)
    1790:	e8 09 2e 00 00       	call   459e <close>
void newFile(char *name) {
	int fd;
	int n = strlen(name);
	int baseLen = 8;
	int counter;
	while ((fd = open(name, 0)) > 0)
    1795:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    179c:	00 
    179d:	8b 45 08             	mov    0x8(%ebp),%eax
    17a0:	89 04 24             	mov    %eax,(%esp)
    17a3:	e8 0e 2e 00 00       	call   45b6 <open>
    17a8:	89 45 e8             	mov    %eax,-0x18(%ebp)
    17ab:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    17af:	7f 84                	jg     1735 <newFile+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		close(fd);
	}
	if ((fd = open(name, O_CREATE)) < 0) {
    17b1:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    17b8:	00 
    17b9:	8b 45 08             	mov    0x8(%ebp),%eax
    17bc:	89 04 24             	mov    %eax,(%esp)
    17bf:	e8 f2 2d 00 00       	call   45b6 <open>
    17c4:	89 45 e8             	mov    %eax,-0x18(%ebp)
    17c7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    17cb:	79 20                	jns    17ed <newFile+0xd5>
		printf(0, "cat: cannot open %s\n", name);
    17cd:	8b 45 08             	mov    0x8(%ebp),%eax
    17d0:	89 44 24 08          	mov    %eax,0x8(%esp)
    17d4:	c7 44 24 04 bb ae 00 	movl   $0xaebb,0x4(%esp)
    17db:	00 
    17dc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    17e3:	e8 76 2f 00 00       	call   475e <printf>
		exit();
    17e8:	e8 89 2d 00 00       	call   4576 <exit>
	}
	close(fd);
    17ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17f0:	89 04 24             	mov    %eax,(%esp)
    17f3:	e8 a6 2d 00 00       	call   459e <close>
}
    17f8:	c9                   	leave  
    17f9:	c3                   	ret    

000017fa <h_newFile>:

void h_newFile(Point p) {
    17fa:	55                   	push   %ebp
    17fb:	89 e5                	mov    %esp,%ebp
    17fd:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "file.txt";
    1800:	c7 45 c8 66 69 6c 65 	movl   $0x656c6966,-0x38(%ebp)
    1807:	c7 45 cc 2e 74 78 74 	movl   $0x7478742e,-0x34(%ebp)
    180e:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    1815:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    181c:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1823:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    182a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1831:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFile(nf);
    1838:	8d 45 c8             	lea    -0x38(%ebp),%eax
    183b:	89 04 24             	mov    %eax,(%esp)
    183e:	e8 d5 fe ff ff       	call   1718 <newFile>
	freeFileItemList();
    1843:	e8 89 e8 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1848:	c7 04 24 6f ae 00 00 	movl   $0xae6f,(%esp)
    184f:	e8 5b e9 ff ff       	call   1af <list>
	drawFinderContent(context);
    1854:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    1859:	89 04 24             	mov    %eax,(%esp)
    185c:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    1861:	89 44 24 04          	mov    %eax,0x4(%esp)
    1865:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    186a:	89 44 24 08          	mov    %eax,0x8(%esp)
    186e:	e8 ff f1 ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    1873:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    1878:	89 04 24             	mov    %eax,(%esp)
    187b:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    1880:	89 44 24 04          	mov    %eax,0x4(%esp)
    1884:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    1889:	89 44 24 08          	mov    %eax,0x8(%esp)
    188d:	e8 1f f0 ff ff       	call   8b1 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1892:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1895:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    189c:	00 
    189d:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    18a4:	00 
    18a5:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    18ac:	00 
    18ad:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    18b4:	00 
    18b5:	89 04 24             	mov    %eax,(%esp)
    18b8:	e8 9b 23 00 00       	call   3c58 <initRect>
    18bd:	83 ec 04             	sub    $0x4,%esp
    18c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18c3:	89 44 24 04          	mov    %eax,0x4(%esp)
    18c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18ca:	89 44 24 08          	mov    %eax,0x8(%esp)
    18ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18d1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    18d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18d8:	89 44 24 10          	mov    %eax,0x10(%esp)
    18dc:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    18e3:	e8 73 25 00 00       	call   3e5b <deleteClickable>
	addWndEvent(&cm);
    18e8:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    18ef:	e8 87 f7 ff ff       	call   107b <addWndEvent>
	addListEvent(&cm);
    18f4:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    18fb:	e8 f3 f6 ff ff       	call   ff3 <addListEvent>
}
    1900:	c9                   	leave  
    1901:	c3                   	ret    

00001902 <newFolder>:

void newFolder(char *name) {
    1902:	55                   	push   %ebp
    1903:	89 e5                	mov    %esp,%ebp
    1905:	83 ec 28             	sub    $0x28,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
    1908:	8b 45 08             	mov    0x8(%ebp),%eax
    190b:	89 04 24             	mov    %eax,(%esp)
    190e:	e8 8f 2a 00 00       	call   43a2 <strlen>
    1913:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 9;
    1916:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%ebp)
	int counter;
	while (mkdir(name) < 0) {
    191d:	eb 55                	jmp    1974 <newFolder+0x72>
		n = strlen(name);
    191f:	8b 45 08             	mov    0x8(%ebp),%eax
    1922:	89 04 24             	mov    %eax,(%esp)
    1925:	e8 78 2a 00 00       	call   43a2 <strlen>
    192a:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    192d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1930:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1933:	75 09                	jne    193e <newFolder+0x3c>
		{
			counter = 1;
    1935:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    193c:	eb 17                	jmp    1955 <newFolder+0x53>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    193e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1941:	8b 45 08             	mov    0x8(%ebp),%eax
    1944:	01 d0                	add    %edx,%eax
    1946:	89 04 24             	mov    %eax,(%esp)
    1949:	e8 96 2b 00 00       	call   44e4 <atoi>
    194e:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    1951:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    1955:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1958:	89 04 24             	mov    %eax,(%esp)
    195b:	e8 99 f3 ff ff       	call   cf9 <int2str>
    1960:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1963:	8b 55 08             	mov    0x8(%ebp),%edx
    1966:	01 ca                	add    %ecx,%edx
    1968:	89 44 24 04          	mov    %eax,0x4(%esp)
    196c:	89 14 24             	mov    %edx,(%esp)
    196f:	e8 bf 29 00 00       	call   4333 <strcpy>
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    1974:	8b 45 08             	mov    0x8(%ebp),%eax
    1977:	89 04 24             	mov    %eax,(%esp)
    197a:	e8 5f 2c 00 00       	call   45de <mkdir>
    197f:	85 c0                	test   %eax,%eax
    1981:	78 9c                	js     191f <newFolder+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		//printf(0, "mkdir: %s failed to create\n", newfolder);
	}
}
    1983:	c9                   	leave  
    1984:	c3                   	ret    

00001985 <h_newFolder>:

void h_newFolder(Point p) {
    1985:	55                   	push   %ebp
    1986:	89 e5                	mov    %esp,%ebp
    1988:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "newFolder";
    198b:	c7 45 c8 6e 65 77 46 	movl   $0x4677656e,-0x38(%ebp)
    1992:	c7 45 cc 6f 6c 64 65 	movl   $0x65646c6f,-0x34(%ebp)
    1999:	c7 45 d0 72 00 00 00 	movl   $0x72,-0x30(%ebp)
    19a0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    19a7:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    19ae:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    19b5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    19bc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFolder(nf);
    19c3:	8d 45 c8             	lea    -0x38(%ebp),%eax
    19c6:	89 04 24             	mov    %eax,(%esp)
    19c9:	e8 34 ff ff ff       	call   1902 <newFolder>
	freeFileItemList();
    19ce:	e8 fe e6 ff ff       	call   d1 <freeFileItemList>
	printf(0, "new folder!\n");
    19d3:	c7 44 24 04 d0 ae 00 	movl   $0xaed0,0x4(%esp)
    19da:	00 
    19db:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    19e2:	e8 77 2d 00 00       	call   475e <printf>
	list(".");
    19e7:	c7 04 24 6f ae 00 00 	movl   $0xae6f,(%esp)
    19ee:	e8 bc e7 ff ff       	call   1af <list>
	printItemList();
    19f3:	e8 e5 f3 ff ff       	call   ddd <printItemList>
	drawFinderContent(context);
    19f8:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    19fd:	89 04 24             	mov    %eax,(%esp)
    1a00:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    1a05:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a09:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    1a0e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a12:	e8 5b f0 ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    1a17:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    1a1c:	89 04 24             	mov    %eax,(%esp)
    1a1f:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    1a24:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a28:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    1a2d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a31:	e8 7b ee ff ff       	call   8b1 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1a36:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1a39:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1a40:	00 
    1a41:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1a48:	00 
    1a49:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1a50:	00 
    1a51:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1a58:	00 
    1a59:	89 04 24             	mov    %eax,(%esp)
    1a5c:	e8 f7 21 00 00       	call   3c58 <initRect>
    1a61:	83 ec 04             	sub    $0x4,%esp
    1a64:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a67:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a6b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a6e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a72:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a75:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1a79:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a7c:	89 44 24 10          	mov    %eax,0x10(%esp)
    1a80:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    1a87:	e8 cf 23 00 00       	call   3e5b <deleteClickable>
	addWndEvent(&cm);
    1a8c:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    1a93:	e8 e3 f5 ff ff       	call   107b <addWndEvent>
	addListEvent(&cm);
    1a98:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    1a9f:	e8 4f f5 ff ff       	call   ff3 <addListEvent>
}
    1aa4:	c9                   	leave  
    1aa5:	c3                   	ret    

00001aa6 <deleteFile>:

void deleteFile(char *name)
{
    1aa6:	55                   	push   %ebp
    1aa7:	89 e5                	mov    %esp,%ebp
    1aa9:	83 ec 28             	sub    $0x28,%esp
	printf(0, "currently having sex with %s\n", name);
    1aac:	8b 45 08             	mov    0x8(%ebp),%eax
    1aaf:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ab3:	c7 44 24 04 dd ae 00 	movl   $0xaedd,0x4(%esp)
    1aba:	00 
    1abb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ac2:	e8 97 2c 00 00       	call   475e <printf>
	if(unlink(name) < 0){
    1ac7:	8b 45 08             	mov    0x8(%ebp),%eax
    1aca:	89 04 24             	mov    %eax,(%esp)
    1acd:	e8 f4 2a 00 00       	call   45c6 <unlink>
    1ad2:	85 c0                	test   %eax,%eax
    1ad4:	0f 89 9c 00 00 00    	jns    1b76 <deleteFile+0xd0>
		if (chdir(name) < 0){
    1ada:	8b 45 08             	mov    0x8(%ebp),%eax
    1add:	89 04 24             	mov    %eax,(%esp)
    1ae0:	e8 01 2b 00 00       	call   45e6 <chdir>
    1ae5:	85 c0                	test   %eax,%eax
    1ae7:	79 1d                	jns    1b06 <deleteFile+0x60>
			printf(2, "rm: %s failed to delete\n", name);
    1ae9:	8b 45 08             	mov    0x8(%ebp),%eax
    1aec:	89 44 24 08          	mov    %eax,0x8(%esp)
    1af0:	c7 44 24 04 fb ae 00 	movl   $0xaefb,0x4(%esp)
    1af7:	00 
    1af8:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1aff:	e8 5a 2c 00 00       	call   475e <printf>
    1b04:	eb 70                	jmp    1b76 <deleteFile+0xd0>
		}
		else{
			freeFileItemList();
    1b06:	e8 c6 e5 ff ff       	call   d1 <freeFileItemList>
			list(".");
    1b0b:	c7 04 24 6f ae 00 00 	movl   $0xae6f,(%esp)
    1b12:	e8 98 e6 ff ff       	call   1af <list>
			struct fileItem *p;
			p = fileItemList;
    1b17:	a1 a4 f7 00 00       	mov    0xf7a4,%eax
    1b1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
			while (p != 0) {
    1b1f:	eb 27                	jmp    1b48 <deleteFile+0xa2>
				deleteFile(p->name);
    1b21:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b24:	8b 40 14             	mov    0x14(%eax),%eax
    1b27:	89 04 24             	mov    %eax,(%esp)
    1b2a:	e8 77 ff ff ff       	call   1aa6 <deleteFile>
				freeFileItemList();
    1b2f:	e8 9d e5 ff ff       	call   d1 <freeFileItemList>
				list(".");
    1b34:	c7 04 24 6f ae 00 00 	movl   $0xae6f,(%esp)
    1b3b:	e8 6f e6 ff ff       	call   1af <list>
				p = fileItemList;
    1b40:	a1 a4 f7 00 00       	mov    0xf7a4,%eax
    1b45:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else{
			freeFileItemList();
			list(".");
			struct fileItem *p;
			p = fileItemList;
			while (p != 0) {
    1b48:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1b4c:	75 d3                	jne    1b21 <deleteFile+0x7b>
				deleteFile(p->name);
				freeFileItemList();
				list(".");
				p = fileItemList;
			}
			chdir("..");
    1b4e:	c7 04 24 14 af 00 00 	movl   $0xaf14,(%esp)
    1b55:	e8 8c 2a 00 00       	call   45e6 <chdir>
			freeFileItemList();
    1b5a:	e8 72 e5 ff ff       	call   d1 <freeFileItemList>
			list(".");
    1b5f:	c7 04 24 6f ae 00 00 	movl   $0xae6f,(%esp)
    1b66:	e8 44 e6 ff ff       	call   1af <list>
			unlink(name);
    1b6b:	8b 45 08             	mov    0x8(%ebp),%eax
    1b6e:	89 04 24             	mov    %eax,(%esp)
    1b71:	e8 50 2a 00 00       	call   45c6 <unlink>
		}
	}
}
    1b76:	c9                   	leave  
    1b77:	c3                   	ret    

00001b78 <h_deleteFile>:
void h_deleteFile(Point p) {
    1b78:	55                   	push   %ebp
    1b79:	89 e5                	mov    %esp,%ebp
    1b7b:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *q = fileItemList;
    1b7e:	a1 a4 f7 00 00       	mov    0xf7a4,%eax
    1b83:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
    1b86:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    1b8d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1b90:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1b93:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b96:	89 45 ec             	mov    %eax,-0x14(%ebp)
	printf(0, "hi1\n");
    1b99:	c7 44 24 04 17 af 00 	movl   $0xaf17,0x4(%esp)
    1ba0:	00 
    1ba1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ba8:	e8 b1 2b 00 00       	call   475e <printf>
	while (q != 0)
    1bad:	e9 8d 00 00 00       	jmp    1c3f <h_deleteFile+0xc7>
	{
		printf(0, "hi2\n");
    1bb2:	c7 44 24 04 1c af 00 	movl   $0xaf1c,0x4(%esp)
    1bb9:	00 
    1bba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1bc1:	e8 98 2b 00 00       	call   475e <printf>
		if (q->chosen)
    1bc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bc9:	8b 40 28             	mov    0x28(%eax),%eax
    1bcc:	85 c0                	test   %eax,%eax
    1bce:	74 66                	je     1c36 <h_deleteFile+0xbe>
		{
			p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
    1bd0:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
    1bd7:	e8 6e 2e 00 00       	call   4a4a <malloc>
    1bdc:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    1bdf:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    1be6:	e8 5f 2e 00 00       	call   4a4a <malloc>
    1beb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1bee:	89 42 14             	mov    %eax,0x14(%edx)
			strcpy(p1->name, q->name);
    1bf1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bf4:	8b 50 14             	mov    0x14(%eax),%edx
    1bf7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1bfa:	8b 40 14             	mov    0x14(%eax),%eax
    1bfd:	89 54 24 04          	mov    %edx,0x4(%esp)
    1c01:	89 04 24             	mov    %eax,(%esp)
    1c04:	e8 2a 27 00 00       	call   4333 <strcpy>
			if(head == 0)
    1c09:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c0d:	75 0e                	jne    1c1d <h_deleteFile+0xa5>
			{
				head = p1;
    1c0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c12:	89 45 ec             	mov    %eax,-0x14(%ebp)
				p2 = p1;
    1c15:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c18:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1c1b:	eb 0f                	jmp    1c2c <h_deleteFile+0xb4>
			} else {
				p2->next = p1;
    1c1d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1c20:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1c23:	89 50 2c             	mov    %edx,0x2c(%eax)
				p2 = p1;
    1c26:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c29:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}
			p1->next = 0;
    1c2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c2f:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
		}
		q = q->next;
    1c36:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c39:	8b 40 2c             	mov    0x2c(%eax),%eax
    1c3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
void h_deleteFile(Point p) {
	struct fileItem *q = fileItemList;
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
	printf(0, "hi1\n");
	while (q != 0)
    1c3f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1c43:	0f 85 69 ff ff ff    	jne    1bb2 <h_deleteFile+0x3a>
			}
			p1->next = 0;
		}
		q = q->next;
	}
	p1 = head;
    1c49:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1c4c:	89 45 f0             	mov    %eax,-0x10(%ebp)
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
    1c4f:	c7 44 24 04 24 af 00 	movl   $0xaf24,0x4(%esp)
    1c56:	00 
    1c57:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c5e:	e8 fb 2a 00 00       	call   475e <printf>
	while (p1 != 0)
    1c63:	eb 17                	jmp    1c7c <h_deleteFile+0x104>
	{
		deleteFile(p1->name);
    1c65:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c68:	8b 40 14             	mov    0x14(%eax),%eax
    1c6b:	89 04 24             	mov    %eax,(%esp)
    1c6e:	e8 33 fe ff ff       	call   1aa6 <deleteFile>
		p1 = p1->next;
    1c73:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c76:	8b 40 2c             	mov    0x2c(%eax),%eax
    1c79:	89 45 f0             	mov    %eax,-0x10(%ebp)
		}
		q = q->next;
	}
	p1 = head;
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
	while (p1 != 0)
    1c7c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1c80:	75 e3                	jne    1c65 <h_deleteFile+0xed>
	{
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
    1c82:	c7 44 24 04 8c af 00 	movl   $0xaf8c,0x4(%esp)
    1c89:	00 
    1c8a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c91:	e8 c8 2a 00 00       	call   475e <printf>
	p1 = head;
    1c96:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1c99:	89 45 f0             	mov    %eax,-0x10(%ebp)
	while (p1 != 0) {
    1c9c:	eb 46                	jmp    1ce4 <h_deleteFile+0x16c>
		p2 = p1;
    1c9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ca1:	89 45 e8             	mov    %eax,-0x18(%ebp)
		printf(0, "freeing %s\n", p2->name);
    1ca4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ca7:	8b 40 14             	mov    0x14(%eax),%eax
    1caa:	89 44 24 08          	mov    %eax,0x8(%esp)
    1cae:	c7 44 24 04 a2 af 00 	movl   $0xafa2,0x4(%esp)
    1cb5:	00 
    1cb6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1cbd:	e8 9c 2a 00 00       	call   475e <printf>
		p1 = p1->next;
    1cc2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1cc5:	8b 40 2c             	mov    0x2c(%eax),%eax
    1cc8:	89 45 f0             	mov    %eax,-0x10(%ebp)
		free(p2->name);
    1ccb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1cce:	8b 40 14             	mov    0x14(%eax),%eax
    1cd1:	89 04 24             	mov    %eax,(%esp)
    1cd4:	e8 38 2c 00 00       	call   4911 <free>
		free(p2);
    1cd9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1cdc:	89 04 24             	mov    %eax,(%esp)
    1cdf:	e8 2d 2c 00 00       	call   4911 <free>
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
	p1 = head;
	while (p1 != 0) {
    1ce4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1ce8:	75 b4                	jne    1c9e <h_deleteFile+0x126>
		printf(0, "freeing %s\n", p2->name);
		p1 = p1->next;
		free(p2->name);
		free(p2);
	}
	printf(0, "done freeing!~~~\n");
    1cea:	c7 44 24 04 ae af 00 	movl   $0xafae,0x4(%esp)
    1cf1:	00 
    1cf2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1cf9:	e8 60 2a 00 00       	call   475e <printf>
	freeFileItemList();
    1cfe:	e8 ce e3 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1d03:	c7 04 24 6f ae 00 00 	movl   $0xae6f,(%esp)
    1d0a:	e8 a0 e4 ff ff       	call   1af <list>
	printItemList();
    1d0f:	e8 c9 f0 ff ff       	call   ddd <printItemList>
	drawFinderContent(context);
    1d14:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    1d19:	89 04 24             	mov    %eax,(%esp)
    1d1c:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    1d21:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d25:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    1d2a:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d2e:	e8 3f ed ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    1d33:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    1d38:	89 04 24             	mov    %eax,(%esp)
    1d3b:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    1d40:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d44:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    1d49:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d4d:	e8 5f eb ff ff       	call   8b1 <drawFinderWnd>
		deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1d52:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1d55:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1d5c:	00 
    1d5d:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1d64:	00 
    1d65:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1d6c:	00 
    1d6d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1d74:	00 
    1d75:	89 04 24             	mov    %eax,(%esp)
    1d78:	e8 db 1e 00 00       	call   3c58 <initRect>
    1d7d:	83 ec 04             	sub    $0x4,%esp
    1d80:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1d83:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d87:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1d8a:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d8e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1d91:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1d95:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1d98:	89 44 24 10          	mov    %eax,0x10(%esp)
    1d9c:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    1da3:	e8 b3 20 00 00       	call   3e5b <deleteClickable>
		addWndEvent(&cm);
    1da8:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    1daf:	e8 c7 f2 ff ff       	call   107b <addWndEvent>
		addListEvent(&cm);
    1db4:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    1dbb:	e8 33 f2 ff ff       	call   ff3 <addListEvent>
}
    1dc0:	c9                   	leave  
    1dc1:	c3                   	ret    

00001dc2 <copyFile>:

void copyFile(){
    1dc2:	55                   	push   %ebp
    1dc3:	89 e5                	mov    %esp,%ebp
    1dc5:	56                   	push   %esi
    1dc6:	53                   	push   %ebx
    1dc7:	83 ec 20             	sub    $0x20,%esp
	int fd;
	struct fileItem *p = fileItemList;
    1dca:	a1 a4 f7 00 00       	mov    0xf7a4,%eax
    1dcf:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0){
    1dd2:	e9 0f 01 00 00       	jmp    1ee6 <copyFile+0x124>
		if (p->chosen == 1){
    1dd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1dda:	8b 40 28             	mov    0x28(%eax),%eax
    1ddd:	83 f8 01             	cmp    $0x1,%eax
    1de0:	0f 85 f7 00 00 00    	jne    1edd <copyFile+0x11b>
			if(lenOfWaited >= MAX_COPY_SIZE){
    1de6:	a1 d4 2e 01 00       	mov    0x12ed4,%eax
    1deb:	83 f8 07             	cmp    $0x7,%eax
    1dee:	7e 22                	jle    1e12 <copyFile+0x50>
				printf(0, "Too Much Files To Copy %d\n", lenOfWaited);
    1df0:	a1 d4 2e 01 00       	mov    0x12ed4,%eax
    1df5:	89 44 24 08          	mov    %eax,0x8(%esp)
    1df9:	c7 44 24 04 c0 af 00 	movl   $0xafc0,0x4(%esp)
    1e00:	00 
    1e01:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1e08:	e8 51 29 00 00       	call   475e <printf>
    1e0d:	e9 cb 00 00 00       	jmp    1edd <copyFile+0x11b>
			}
			else{
				if((fd = open(p->name, O_RDONLY)) >= 0){
    1e12:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e15:	8b 40 14             	mov    0x14(%eax),%eax
    1e18:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1e1f:	00 
    1e20:	89 04 24             	mov    %eax,(%esp)
    1e23:	e8 8e 27 00 00       	call   45b6 <open>
    1e28:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1e2b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1e2f:	0f 88 8a 00 00 00    	js     1ebf <copyFile+0xfd>
					strcpy(filesWaited[lenOfWaited], currentPath);
    1e35:	a1 d4 2e 01 00       	mov    0x12ed4,%eax
    1e3a:	c1 e0 08             	shl    $0x8,%eax
    1e3d:	05 a0 25 01 00       	add    $0x125a0,%eax
    1e42:	c7 44 24 04 c0 2d 01 	movl   $0x12dc0,0x4(%esp)
    1e49:	00 
    1e4a:	89 04 24             	mov    %eax,(%esp)
    1e4d:	e8 e1 24 00 00       	call   4333 <strcpy>
					strcpy(filesWaited[lenOfWaited] + strlen(currentPath), p->name);
    1e52:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e55:	8b 58 14             	mov    0x14(%eax),%ebx
    1e58:	a1 d4 2e 01 00       	mov    0x12ed4,%eax
    1e5d:	c1 e0 08             	shl    $0x8,%eax
    1e60:	8d b0 a0 25 01 00    	lea    0x125a0(%eax),%esi
    1e66:	c7 04 24 c0 2d 01 00 	movl   $0x12dc0,(%esp)
    1e6d:	e8 30 25 00 00       	call   43a2 <strlen>
    1e72:	01 f0                	add    %esi,%eax
    1e74:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1e78:	89 04 24             	mov    %eax,(%esp)
    1e7b:	e8 b3 24 00 00       	call   4333 <strcpy>
					printf(0, "Open File %s Succeed\n", filesWaited[lenOfWaited]);
    1e80:	a1 d4 2e 01 00       	mov    0x12ed4,%eax
    1e85:	c1 e0 08             	shl    $0x8,%eax
    1e88:	05 a0 25 01 00       	add    $0x125a0,%eax
    1e8d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1e91:	c7 44 24 04 db af 00 	movl   $0xafdb,0x4(%esp)
    1e98:	00 
    1e99:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ea0:	e8 b9 28 00 00       	call   475e <printf>
					lenOfWaited++;
    1ea5:	a1 d4 2e 01 00       	mov    0x12ed4,%eax
    1eaa:	83 c0 01             	add    $0x1,%eax
    1ead:	a3 d4 2e 01 00       	mov    %eax,0x12ed4
					close(fd);
    1eb2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1eb5:	89 04 24             	mov    %eax,(%esp)
    1eb8:	e8 e1 26 00 00       	call   459e <close>
    1ebd:	eb 1e                	jmp    1edd <copyFile+0x11b>
				}
				else{
					printf(0, "Open File %s Failed\n", p->name);
    1ebf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ec2:	8b 40 14             	mov    0x14(%eax),%eax
    1ec5:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ec9:	c7 44 24 04 f1 af 00 	movl   $0xaff1,0x4(%esp)
    1ed0:	00 
    1ed1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ed8:	e8 81 28 00 00       	call   475e <printf>
				}
			}
		}
		p = p->next;
    1edd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ee0:	8b 40 2c             	mov    0x2c(%eax),%eax
    1ee3:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void copyFile(){
	int fd;
	struct fileItem *p = fileItemList;
	while(p != 0){
    1ee6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1eea:	0f 85 e7 fe ff ff    	jne    1dd7 <copyFile+0x15>
				}
			}
		}
		p = p->next;
	}
}
    1ef0:	83 c4 20             	add    $0x20,%esp
    1ef3:	5b                   	pop    %ebx
    1ef4:	5e                   	pop    %esi
    1ef5:	5d                   	pop    %ebp
    1ef6:	c3                   	ret    

00001ef7 <h_copyFile>:

void h_copyFile(Point p){
    1ef7:	55                   	push   %ebp
    1ef8:	89 e5                	mov    %esp,%ebp
    1efa:	83 ec 08             	sub    $0x8,%esp
	lenOfWaited = 0;
    1efd:	c7 05 d4 2e 01 00 00 	movl   $0x0,0x12ed4
    1f04:	00 00 00 
	copyFile();
    1f07:	e8 b6 fe ff ff       	call   1dc2 <copyFile>
}
    1f0c:	c9                   	leave  
    1f0d:	c3                   	ret    

00001f0e <h_pasteFile>:

void h_pasteFile(Point p){
    1f0e:	55                   	push   %ebp
    1f0f:	89 e5                	mov    %esp,%ebp
    1f11:	83 ec 28             	sub    $0x28,%esp
	int i, fd;
	for(i = 0; i < lenOfWaited; i++){
    1f14:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1f1b:	eb 71                	jmp    1f8e <h_pasteFile+0x80>
		printf(0, "this is NO %d file names %s\n", i, filesWaited[i]);
    1f1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f20:	c1 e0 08             	shl    $0x8,%eax
    1f23:	05 a0 25 01 00       	add    $0x125a0,%eax
    1f28:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1f2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f2f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f33:	c7 44 24 04 06 b0 00 	movl   $0xb006,0x4(%esp)
    1f3a:	00 
    1f3b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1f42:	e8 17 28 00 00       	call   475e <printf>
		fd = open(filesWaited[i], O_RDONLY);
    1f47:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f4a:	c1 e0 08             	shl    $0x8,%eax
    1f4d:	05 a0 25 01 00       	add    $0x125a0,%eax
    1f52:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1f59:	00 
    1f5a:	89 04 24             	mov    %eax,(%esp)
    1f5d:	e8 54 26 00 00       	call   45b6 <open>
    1f62:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if(fd > 0)
    1f65:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1f69:	7e 14                	jle    1f7f <h_pasteFile+0x71>
			printf(0, "fileopensucceededededed~\n");
    1f6b:	c7 44 24 04 23 b0 00 	movl   $0xb023,0x4(%esp)
    1f72:	00 
    1f73:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1f7a:	e8 df 27 00 00       	call   475e <printf>
		close(fd);
    1f7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1f82:	89 04 24             	mov    %eax,(%esp)
    1f85:	e8 14 26 00 00       	call   459e <close>
	copyFile();
}

void h_pasteFile(Point p){
	int i, fd;
	for(i = 0; i < lenOfWaited; i++){
    1f8a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1f8e:	a1 d4 2e 01 00       	mov    0x12ed4,%eax
    1f93:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1f96:	7c 85                	jl     1f1d <h_pasteFile+0xf>
		fd = open(filesWaited[i], O_RDONLY);
		if(fd > 0)
			printf(0, "fileopensucceededededed~\n");
		close(fd);
	}
}
    1f98:	c9                   	leave  
    1f99:	c3                   	ret    

00001f9a <h_chooseFile>:

void h_chooseFile(Point p) {
    1f9a:	55                   	push   %ebp
    1f9b:	89 e5                	mov    %esp,%ebp
    1f9d:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = getFileItem(p);
    1fa0:	8b 45 08             	mov    0x8(%ebp),%eax
    1fa3:	8b 55 0c             	mov    0xc(%ebp),%edx
    1fa6:	89 04 24             	mov    %eax,(%esp)
    1fa9:	89 54 24 04          	mov    %edx,0x4(%esp)
    1fad:	e8 8f f1 ff ff       	call   1141 <getFileItem>
    1fb2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (temp->chosen != 0)
    1fb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1fb8:	8b 40 28             	mov    0x28(%eax),%eax
    1fbb:	85 c0                	test   %eax,%eax
    1fbd:	74 20                	je     1fdf <h_chooseFile+0x45>
	{
		printf(0, "chooseFile!\n");
    1fbf:	c7 44 24 04 3d b0 00 	movl   $0xb03d,0x4(%esp)
    1fc6:	00 
    1fc7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1fce:	e8 8b 27 00 00       	call   475e <printf>
		temp->chosen = 0;
    1fd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1fd6:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    1fdd:	eb 1e                	jmp    1ffd <h_chooseFile+0x63>
	}
	else
	{
		printf(0, "unchooseFile!\n");
    1fdf:	c7 44 24 04 4a b0 00 	movl   $0xb04a,0x4(%esp)
    1fe6:	00 
    1fe7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1fee:	e8 6b 27 00 00       	call   475e <printf>
		temp->chosen = 1;
    1ff3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ff6:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    1ffd:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    2002:	89 04 24             	mov    %eax,(%esp)
    2005:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    200a:	89 44 24 04          	mov    %eax,0x4(%esp)
    200e:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    2013:	89 44 24 08          	mov    %eax,0x8(%esp)
    2017:	e8 56 ea ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    201c:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    2021:	89 04 24             	mov    %eax,(%esp)
    2024:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    2029:	89 44 24 04          	mov    %eax,0x4(%esp)
    202d:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    2032:	89 44 24 08          	mov    %eax,0x8(%esp)
    2036:	e8 76 e8 ff ff       	call   8b1 <drawFinderWnd>
}
    203b:	c9                   	leave  
    203c:	c3                   	ret    

0000203d <h_closeWnd>:

void h_closeWnd(Point p) {
    203d:	55                   	push   %ebp
    203e:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    2040:	c7 05 e0 ee 00 00 00 	movl   $0x0,0xeee0
    2047:	00 00 00 
}
    204a:	5d                   	pop    %ebp
    204b:	c3                   	ret    

0000204c <h_chvm1>:

void h_chvm1(Point p) {
    204c:	55                   	push   %ebp
    204d:	89 e5                	mov    %esp,%ebp
    204f:	83 ec 38             	sub    $0x38,%esp
	style = ICON_STYLE;
    2052:	c7 05 e4 ee 00 00 01 	movl   $0x1,0xeee4
    2059:	00 00 00 
	freeFileItemList();
    205c:	e8 70 e0 ff ff       	call   d1 <freeFileItemList>
		list(".");
    2061:	c7 04 24 6f ae 00 00 	movl   $0xae6f,(%esp)
    2068:	e8 42 e1 ff ff       	call   1af <list>
		drawFinderContent(context);
    206d:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    2072:	89 04 24             	mov    %eax,(%esp)
    2075:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    207a:	89 44 24 04          	mov    %eax,0x4(%esp)
    207e:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    2083:	89 44 24 08          	mov    %eax,0x8(%esp)
    2087:	e8 e6 e9 ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    208c:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    2091:	89 04 24             	mov    %eax,(%esp)
    2094:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    2099:	89 44 24 04          	mov    %eax,0x4(%esp)
    209d:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    20a2:	89 44 24 08          	mov    %eax,0x8(%esp)
    20a6:	e8 06 e8 ff ff       	call   8b1 <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    20ab:	8d 45 e8             	lea    -0x18(%ebp),%eax
    20ae:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    20b5:	00 
    20b6:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    20bd:	00 
    20be:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    20c5:	00 
    20c6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    20cd:	00 
    20ce:	89 04 24             	mov    %eax,(%esp)
    20d1:	e8 82 1b 00 00       	call   3c58 <initRect>
    20d6:	83 ec 04             	sub    $0x4,%esp
    20d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    20dc:	89 44 24 04          	mov    %eax,0x4(%esp)
    20e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    20e3:	89 44 24 08          	mov    %eax,0x8(%esp)
    20e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    20ea:	89 44 24 0c          	mov    %eax,0xc(%esp)
    20ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20f1:	89 44 24 10          	mov    %eax,0x10(%esp)
    20f5:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    20fc:	e8 5a 1d 00 00       	call   3e5b <deleteClickable>
			addWndEvent(&cm);
    2101:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    2108:	e8 6e ef ff ff       	call   107b <addWndEvent>
			addListEvent(&cm);
    210d:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    2114:	e8 da ee ff ff       	call   ff3 <addListEvent>
}
    2119:	c9                   	leave  
    211a:	c3                   	ret    

0000211b <h_chvm2>:

void h_chvm2(Point p) {
    211b:	55                   	push   %ebp
    211c:	89 e5                	mov    %esp,%ebp
    211e:	83 ec 38             	sub    $0x38,%esp
	style = LIST_STYLE;
    2121:	c7 05 e4 ee 00 00 02 	movl   $0x2,0xeee4
    2128:	00 00 00 
	freeFileItemList();
    212b:	e8 a1 df ff ff       	call   d1 <freeFileItemList>
		list(".");
    2130:	c7 04 24 6f ae 00 00 	movl   $0xae6f,(%esp)
    2137:	e8 73 e0 ff ff       	call   1af <list>
		drawFinderContent(context);
    213c:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    2141:	89 04 24             	mov    %eax,(%esp)
    2144:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    2149:	89 44 24 04          	mov    %eax,0x4(%esp)
    214d:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    2152:	89 44 24 08          	mov    %eax,0x8(%esp)
    2156:	e8 17 e9 ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    215b:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    2160:	89 04 24             	mov    %eax,(%esp)
    2163:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    2168:	89 44 24 04          	mov    %eax,0x4(%esp)
    216c:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    2171:	89 44 24 08          	mov    %eax,0x8(%esp)
    2175:	e8 37 e7 ff ff       	call   8b1 <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    217a:	8d 45 e8             	lea    -0x18(%ebp),%eax
    217d:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    2184:	00 
    2185:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    218c:	00 
    218d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2194:	00 
    2195:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    219c:	00 
    219d:	89 04 24             	mov    %eax,(%esp)
    21a0:	e8 b3 1a 00 00       	call   3c58 <initRect>
    21a5:	83 ec 04             	sub    $0x4,%esp
    21a8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    21ab:	89 44 24 04          	mov    %eax,0x4(%esp)
    21af:	8b 45 ec             	mov    -0x14(%ebp),%eax
    21b2:	89 44 24 08          	mov    %eax,0x8(%esp)
    21b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    21b9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    21bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    21c0:	89 44 24 10          	mov    %eax,0x10(%esp)
    21c4:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    21cb:	e8 8b 1c 00 00       	call   3e5b <deleteClickable>
			addWndEvent(&cm);
    21d0:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    21d7:	e8 9f ee ff ff       	call   107b <addWndEvent>
			addListEvent(&cm);
    21dc:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    21e3:	e8 0b ee ff ff       	call   ff3 <addListEvent>
}
    21e8:	c9                   	leave  
    21e9:	c3                   	ret    

000021ea <h_goUp>:

void h_goUp(Point p) {
    21ea:	55                   	push   %ebp
    21eb:	89 e5                	mov    %esp,%ebp
    21ed:	83 ec 38             	sub    $0x38,%esp
	enterDir("..");
    21f0:	c7 04 24 14 af 00 00 	movl   $0xaf14,(%esp)
    21f7:	e8 b4 f3 ff ff       	call   15b0 <enterDir>
	freeFileItemList();
    21fc:	e8 d0 de ff ff       	call   d1 <freeFileItemList>
	list(".");
    2201:	c7 04 24 6f ae 00 00 	movl   $0xae6f,(%esp)
    2208:	e8 a2 df ff ff       	call   1af <list>
	drawFinderContent(context);
    220d:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    2212:	89 04 24             	mov    %eax,(%esp)
    2215:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    221a:	89 44 24 04          	mov    %eax,0x4(%esp)
    221e:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    2223:	89 44 24 08          	mov    %eax,0x8(%esp)
    2227:	e8 46 e8 ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    222c:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    2231:	89 04 24             	mov    %eax,(%esp)
    2234:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    2239:	89 44 24 04          	mov    %eax,0x4(%esp)
    223d:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    2242:	89 44 24 08          	mov    %eax,0x8(%esp)
    2246:	e8 66 e6 ff ff       	call   8b1 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    224b:	8d 45 e8             	lea    -0x18(%ebp),%eax
    224e:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    2255:	00 
    2256:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    225d:	00 
    225e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2265:	00 
    2266:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    226d:	00 
    226e:	89 04 24             	mov    %eax,(%esp)
    2271:	e8 e2 19 00 00       	call   3c58 <initRect>
    2276:	83 ec 04             	sub    $0x4,%esp
    2279:	8b 45 e8             	mov    -0x18(%ebp),%eax
    227c:	89 44 24 04          	mov    %eax,0x4(%esp)
    2280:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2283:	89 44 24 08          	mov    %eax,0x8(%esp)
    2287:	8b 45 f0             	mov    -0x10(%ebp),%eax
    228a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    228e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2291:	89 44 24 10          	mov    %eax,0x10(%esp)
    2295:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    229c:	e8 ba 1b 00 00       	call   3e5b <deleteClickable>
	addWndEvent(&cm);
    22a1:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    22a8:	e8 ce ed ff ff       	call   107b <addWndEvent>
	addListEvent(&cm);
    22ad:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    22b4:	e8 3a ed ff ff       	call   ff3 <addListEvent>
}
    22b9:	c9                   	leave  
    22ba:	c3                   	ret    

000022bb <h_empty>:

void h_empty(Point p) {
    22bb:	55                   	push   %ebp
    22bc:	89 e5                	mov    %esp,%ebp

}
    22be:	5d                   	pop    %ebp
    22bf:	c3                   	ret    

000022c0 <main>:

int main(int argc, char *argv[]) {
    22c0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    22c4:	83 e4 f0             	and    $0xfffffff0,%esp
    22c7:	ff 71 fc             	pushl  -0x4(%ecx)
    22ca:	55                   	push   %ebp
    22cb:	89 e5                	mov    %esp,%ebp
    22cd:	56                   	push   %esi
    22ce:	53                   	push   %ebx
    22cf:	51                   	push   %ecx
    22d0:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
	int winid;
	struct Msg msg;

	Point p;

	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    22d6:	c7 44 24 08 c2 01 00 	movl   $0x1c2,0x8(%esp)
    22dd:	00 
    22de:	c7 44 24 04 58 02 00 	movl   $0x258,0x4(%esp)
    22e5:	00 
    22e6:	c7 04 24 a0 2d 01 00 	movl   $0x12da0,(%esp)
    22ed:	e8 30 04 00 00       	call   2722 <init_context>
    22f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    22f5:	8d 45 88             	lea    -0x78(%ebp),%eax
    22f8:	8b 15 a0 2d 01 00    	mov    0x12da0,%edx
    22fe:	89 54 24 04          	mov    %edx,0x4(%esp)
    2302:	8b 15 a4 2d 01 00    	mov    0x12da4,%edx
    2308:	89 54 24 08          	mov    %edx,0x8(%esp)
    230c:	8b 15 a8 2d 01 00    	mov    0x12da8,%edx
    2312:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2316:	89 04 24             	mov    %eax,(%esp)
    2319:	e8 d8 19 00 00       	call   3cf6 <initClickManager>
    231e:	83 ec 04             	sub    $0x4,%esp
    2321:	8b 45 88             	mov    -0x78(%ebp),%eax
    2324:	a3 c0 2e 01 00       	mov    %eax,0x12ec0
    2329:	8b 45 8c             	mov    -0x74(%ebp),%eax
    232c:	a3 c4 2e 01 00       	mov    %eax,0x12ec4
    2331:	8b 45 90             	mov    -0x70(%ebp),%eax
    2334:	a3 c8 2e 01 00       	mov    %eax,0x12ec8
    2339:	8b 45 94             	mov    -0x6c(%ebp),%eax
    233c:	a3 cc 2e 01 00       	mov    %eax,0x12ecc
    2341:	8b 45 98             	mov    -0x68(%ebp),%eax
    2344:	a3 d0 2e 01 00       	mov    %eax,0x12ed0
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    2349:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    2350:	00 
    2351:	c7 04 24 e0 ef 00 00 	movl   $0xefe0,(%esp)
    2358:	e8 bf 0f 00 00       	call   331c <load_iconlist>
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    235d:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    2364:	00 
    2365:	c7 04 24 00 ef 00 00 	movl   $0xef00,(%esp)
    236c:	e8 ab 0f 00 00       	call   331c <load_iconlist>
	//testHandlers();
	strcpy(currentPath, "/");
    2371:	c7 44 24 04 59 b0 00 	movl   $0xb059,0x4(%esp)
    2378:	00 
    2379:	c7 04 24 c0 2d 01 00 	movl   $0x12dc0,(%esp)
    2380:	e8 ae 1f 00 00       	call   4333 <strcpy>
	mkdir("userfolder");
    2385:	c7 04 24 5b b0 00 00 	movl   $0xb05b,(%esp)
    238c:	e8 4d 22 00 00       	call   45de <mkdir>
	enterDir("userfolder");
    2391:	c7 04 24 5b b0 00 00 	movl   $0xb05b,(%esp)
    2398:	e8 13 f2 ff ff       	call   15b0 <enterDir>
	freeFileItemList();
    239d:	e8 2f dd ff ff       	call   d1 <freeFileItemList>
	list(".");
    23a2:	c7 04 24 6f ae 00 00 	movl   $0xae6f,(%esp)
    23a9:	e8 01 de ff ff       	call   1af <list>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    23ae:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    23b1:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    23b8:	00 
    23b9:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    23c0:	00 
    23c1:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    23c8:	00 
    23c9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    23d0:	00 
    23d1:	89 04 24             	mov    %eax,(%esp)
    23d4:	e8 7f 18 00 00       	call   3c58 <initRect>
    23d9:	83 ec 04             	sub    $0x4,%esp
    23dc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    23df:	89 44 24 04          	mov    %eax,0x4(%esp)
    23e3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    23e6:	89 44 24 08          	mov    %eax,0x8(%esp)
    23ea:	8b 45 dc             	mov    -0x24(%ebp),%eax
    23ed:	89 44 24 0c          	mov    %eax,0xc(%esp)
    23f1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    23f4:	89 44 24 10          	mov    %eax,0x10(%esp)
    23f8:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    23ff:	e8 57 1a 00 00       	call   3e5b <deleteClickable>
	addWndEvent(&cm);
    2404:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    240b:	e8 6b ec ff ff       	call   107b <addWndEvent>
	addListEvent(&cm);
    2410:	c7 04 24 c0 2e 01 00 	movl   $0x12ec0,(%esp)
    2417:	e8 d7 eb ff ff       	call   ff3 <addListEvent>
	lenOfWaited = 0;
    241c:	c7 05 d4 2e 01 00 00 	movl   $0x0,0x12ed4
    2423:	00 00 00 
	while (isRun) {
    2426:	e9 c7 01 00 00       	jmp    25f2 <main+0x332>
		getMsg(&msg);
    242b:	8d 45 bc             	lea    -0x44(%ebp),%eax
    242e:	89 04 24             	mov    %eax,(%esp)
    2431:	e8 e0 21 00 00       	call   4616 <getMsg>
		switch (msg.msg_type) {
    2436:	8b 45 bc             	mov    -0x44(%ebp),%eax
    2439:	83 f8 08             	cmp    $0x8,%eax
    243c:	0f 87 af 01 00 00    	ja     25f1 <main+0x331>
    2442:	8b 04 85 68 b0 00 00 	mov    0xb068(,%eax,4),%eax
    2449:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    244b:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    244e:	8b 55 c0             	mov    -0x40(%ebp),%edx
    2451:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    2454:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2458:	89 54 24 04          	mov    %edx,0x4(%esp)
    245c:	89 04 24             	mov    %eax,(%esp)
    245f:	e8 cd 17 00 00       	call   3c31 <initPoint>
    2464:	83 ec 04             	sub    $0x4,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    2467:	8b 0d c4 2e 01 00    	mov    0x12ec4,%ecx
    246d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    2470:	8b 55 b8             	mov    -0x48(%ebp),%edx
    2473:	89 44 24 04          	mov    %eax,0x4(%esp)
    2477:	89 54 24 08          	mov    %edx,0x8(%esp)
    247b:	89 0c 24             	mov    %ecx,(%esp)
    247e:	e8 b8 1a 00 00       	call   3f3b <executeHandler>
    2483:	85 c0                	test   %eax,%eax
    2485:	74 19                	je     24a0 <main+0x1e0>
				updateWindow(winid, context.addr);
    2487:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    248c:	89 44 24 04          	mov    %eax,0x4(%esp)
    2490:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2493:	89 04 24             	mov    %eax,(%esp)
    2496:	e8 93 21 00 00       	call   462e <updateWindow>
			}
			break;
    249b:	e9 52 01 00 00       	jmp    25f2 <main+0x332>
    24a0:	e9 4d 01 00 00       	jmp    25f2 <main+0x332>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderContent(context);
    24a5:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    24aa:	89 04 24             	mov    %eax,(%esp)
    24ad:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    24b2:	89 44 24 04          	mov    %eax,0x4(%esp)
    24b6:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    24bb:	89 44 24 08          	mov    %eax,0x8(%esp)
    24bf:	e8 ae e5 ff ff       	call   a72 <drawFinderContent>
			drawFinderWnd(context);
    24c4:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    24c9:	89 04 24             	mov    %eax,(%esp)
    24cc:	a1 a4 2d 01 00       	mov    0x12da4,%eax
    24d1:	89 44 24 04          	mov    %eax,0x4(%esp)
    24d5:	a1 a8 2d 01 00       	mov    0x12da8,%eax
    24da:	89 44 24 08          	mov    %eax,0x8(%esp)
    24de:	e8 ce e3 ff ff       	call   8b1 <drawFinderWnd>
			updateWindow(winid, context.addr);
    24e3:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    24e8:	89 44 24 04          	mov    %eax,0x4(%esp)
    24ec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    24ef:	89 04 24             	mov    %eax,(%esp)
    24f2:	e8 37 21 00 00       	call   462e <updateWindow>
			break;
    24f7:	e9 f6 00 00 00       	jmp    25f2 <main+0x332>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    24fc:	8b 75 cc             	mov    -0x34(%ebp),%esi
    24ff:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    2502:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    2505:	8b 55 c0             	mov    -0x40(%ebp),%edx
    2508:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    250d:	89 74 24 14          	mov    %esi,0x14(%esp)
    2511:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    2515:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    2519:	89 54 24 08          	mov    %edx,0x8(%esp)
    251d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2521:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2524:	89 04 24             	mov    %eax,(%esp)
    2527:	e8 0a 21 00 00       	call   4636 <updatePartialWindow>
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    252c:	e9 c1 00 00 00       	jmp    25f2 <main+0x332>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2531:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    2534:	8b 55 c0             	mov    -0x40(%ebp),%edx
    2537:	8d 45 80             	lea    -0x80(%ebp),%eax
    253a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    253e:	89 54 24 04          	mov    %edx,0x4(%esp)
    2542:	89 04 24             	mov    %eax,(%esp)
    2545:	e8 e7 16 00 00       	call   3c31 <initPoint>
    254a:	83 ec 04             	sub    $0x4,%esp
    254d:	8b 45 80             	mov    -0x80(%ebp),%eax
    2550:	8b 55 84             	mov    -0x7c(%ebp),%edx
    2553:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    2556:	89 55 b8             	mov    %edx,-0x48(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.left_click, p)) {
    2559:	8b 0d c0 2e 01 00    	mov    0x12ec0,%ecx
    255f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    2562:	8b 55 b8             	mov    -0x48(%ebp),%edx
    2565:	89 44 24 04          	mov    %eax,0x4(%esp)
    2569:	89 54 24 08          	mov    %edx,0x8(%esp)
    256d:	89 0c 24             	mov    %ecx,(%esp)
    2570:	e8 c6 19 00 00       	call   3f3b <executeHandler>
    2575:	85 c0                	test   %eax,%eax
    2577:	74 16                	je     258f <main+0x2cf>

				updateWindow(winid, context.addr);
    2579:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    257e:	89 44 24 04          	mov    %eax,0x4(%esp)
    2582:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2585:	89 04 24             	mov    %eax,(%esp)
    2588:	e8 a1 20 00 00       	call   462e <updateWindow>
			}
			break;
    258d:	eb 63                	jmp    25f2 <main+0x332>
    258f:	eb 61                	jmp    25f2 <main+0x332>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2591:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    2594:	8b 55 c0             	mov    -0x40(%ebp),%edx
    2597:	8d 45 80             	lea    -0x80(%ebp),%eax
    259a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    259e:	89 54 24 04          	mov    %edx,0x4(%esp)
    25a2:	89 04 24             	mov    %eax,(%esp)
    25a5:	e8 87 16 00 00       	call   3c31 <initPoint>
    25aa:	83 ec 04             	sub    $0x4,%esp
    25ad:	8b 45 80             	mov    -0x80(%ebp),%eax
    25b0:	8b 55 84             	mov    -0x7c(%ebp),%edx
    25b3:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    25b6:	89 55 b8             	mov    %edx,-0x48(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    25b9:	8b 0d c8 2e 01 00    	mov    0x12ec8,%ecx
    25bf:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    25c2:	8b 55 b8             	mov    -0x48(%ebp),%edx
    25c5:	89 44 24 04          	mov    %eax,0x4(%esp)
    25c9:	89 54 24 08          	mov    %edx,0x8(%esp)
    25cd:	89 0c 24             	mov    %ecx,(%esp)
    25d0:	e8 66 19 00 00       	call   3f3b <executeHandler>
    25d5:	85 c0                	test   %eax,%eax
    25d7:	74 16                	je     25ef <main+0x32f>
				updateWindow(winid, context.addr);
    25d9:	a1 a0 2d 01 00       	mov    0x12da0,%eax
    25de:	89 44 24 04          	mov    %eax,0x4(%esp)
    25e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    25e5:	89 04 24             	mov    %eax,(%esp)
    25e8:	e8 41 20 00 00       	call   462e <updateWindow>
			}
			break;
    25ed:	eb 03                	jmp    25f2 <main+0x332>
    25ef:	eb 01                	jmp    25f2 <main+0x332>
		default:
			break;
    25f1:	90                   	nop
	list(".");
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	lenOfWaited = 0;
	while (isRun) {
    25f2:	a1 e0 ee 00 00       	mov    0xeee0,%eax
    25f7:	85 c0                	test   %eax,%eax
    25f9:	0f 85 2c fe ff ff    	jne    242b <main+0x16b>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    25ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2602:	89 44 24 04          	mov    %eax,0x4(%esp)
    2606:	c7 04 24 a0 2d 01 00 	movl   $0x12da0,(%esp)
    260d:	e8 93 01 00 00       	call   27a5 <free_context>
	exit();
    2612:	e8 5f 1f 00 00       	call   4576 <exit>

00002617 <testHandlers>:
}

void testHandlers() {
    2617:	55                   	push   %ebp
    2618:	89 e5                	mov    %esp,%ebp
    261a:	83 ec 18             	sub    $0x18,%esp

	list(".");
    261d:	c7 04 24 6f ae 00 00 	movl   $0xae6f,(%esp)
    2624:	e8 86 db ff ff       	call   1af <list>
	printf(0, "original list:\n");
    2629:	c7 44 24 04 8c b0 00 	movl   $0xb08c,0x4(%esp)
    2630:	00 
    2631:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2638:	e8 21 21 00 00       	call   475e <printf>
	printItemList();
    263d:	e8 9b e7 ff ff       	call   ddd <printItemList>
	printf(0, "\n");
    2642:	c7 44 24 04 9c b0 00 	movl   $0xb09c,0x4(%esp)
    2649:	00 
    264a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2651:	e8 08 21 00 00       	call   475e <printf>
	printf(0, "new a folder:\n");
    2656:	c7 44 24 04 9e b0 00 	movl   $0xb09e,0x4(%esp)
    265d:	00 
    265e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2665:	e8 f4 20 00 00       	call   475e <printf>
	newFolder("newfolder");
    266a:	c7 04 24 ad b0 00 00 	movl   $0xb0ad,(%esp)
    2671:	e8 8c f2 ff ff       	call   1902 <newFolder>
	freeFileItemList();
    2676:	e8 56 da ff ff       	call   d1 <freeFileItemList>
	list(".");
    267b:	c7 04 24 6f ae 00 00 	movl   $0xae6f,(%esp)
    2682:	e8 28 db ff ff       	call   1af <list>
	printItemList();
    2687:	e8 51 e7 ff ff       	call   ddd <printItemList>
	printf(0, "\n");
    268c:	c7 44 24 04 9c b0 00 	movl   $0xb09c,0x4(%esp)
    2693:	00 
    2694:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    269b:	e8 be 20 00 00       	call   475e <printf>
	printf(0, "enter new folder:\n");
    26a0:	c7 44 24 04 b7 b0 00 	movl   $0xb0b7,0x4(%esp)
    26a7:	00 
    26a8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26af:	e8 aa 20 00 00       	call   475e <printf>
	enterDir("newfolder");
    26b4:	c7 04 24 ad b0 00 00 	movl   $0xb0ad,(%esp)
    26bb:	e8 f0 ee ff ff       	call   15b0 <enterDir>
	freeFileItemList();
    26c0:	e8 0c da ff ff       	call   d1 <freeFileItemList>
	list(".");
    26c5:	c7 04 24 6f ae 00 00 	movl   $0xae6f,(%esp)
    26cc:	e8 de da ff ff       	call   1af <list>
	printItemList();
    26d1:	e8 07 e7 ff ff       	call   ddd <printItemList>
	printf(0, "\n");
    26d6:	c7 44 24 04 9c b0 00 	movl   $0xb09c,0x4(%esp)
    26dd:	00 
    26de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26e5:	e8 74 20 00 00       	call   475e <printf>
	printf(0, "new a file:\n");
    26ea:	c7 44 24 04 ca b0 00 	movl   $0xb0ca,0x4(%esp)
    26f1:	00 
    26f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26f9:	e8 60 20 00 00       	call   475e <printf>
	newFile("newfile.txt");
    26fe:	c7 04 24 d7 b0 00 00 	movl   $0xb0d7,(%esp)
    2705:	e8 0e f0 ff ff       	call   1718 <newFile>
	freeFileItemList();
    270a:	e8 c2 d9 ff ff       	call   d1 <freeFileItemList>
	list(".");
    270f:	c7 04 24 6f ae 00 00 	movl   $0xae6f,(%esp)
    2716:	e8 94 da ff ff       	call   1af <list>
	printItemList();
    271b:	e8 bd e6 ff ff       	call   ddd <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    2720:	c9                   	leave  
    2721:	c3                   	ret    

00002722 <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    2722:	55                   	push   %ebp
    2723:	89 e5                	mov    %esp,%ebp
    2725:	83 ec 18             	sub    $0x18,%esp
    context_ptr->width = width;
    2728:	8b 45 08             	mov    0x8(%ebp),%eax
    272b:	8b 55 0c             	mov    0xc(%ebp),%edx
    272e:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    2731:	8b 45 08             	mov    0x8(%ebp),%eax
    2734:	8b 55 10             	mov    0x10(%ebp),%edx
    2737:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    273a:	8b 55 0c             	mov    0xc(%ebp),%edx
    273d:	8b 45 10             	mov    0x10(%ebp),%eax
    2740:	0f af c2             	imul   %edx,%eax
    2743:	01 c0                	add    %eax,%eax
    2745:	89 04 24             	mov    %eax,(%esp)
    2748:	e8 fd 22 00 00       	call   4a4a <malloc>
    274d:	8b 55 08             	mov    0x8(%ebp),%edx
    2750:	89 02                	mov    %eax,(%edx)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    2752:	8b 55 0c             	mov    0xc(%ebp),%edx
    2755:	8b 45 10             	mov    0x10(%ebp),%eax
    2758:	0f af c2             	imul   %edx,%eax
    275b:	8d 14 00             	lea    (%eax,%eax,1),%edx
    275e:	8b 45 08             	mov    0x8(%ebp),%eax
    2761:	8b 00                	mov    (%eax),%eax
    2763:	89 54 24 08          	mov    %edx,0x8(%esp)
    2767:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    276e:	00 
    276f:	89 04 24             	mov    %eax,(%esp)
    2772:	e8 52 1c 00 00       	call   43c9 <memset>
    initializeASCII();
    2777:	e8 93 01 00 00       	call   290f <initializeASCII>
    initializeGBK();
    277c:	e8 17 03 00 00       	call   2a98 <initializeGBK>
    return createWindow(0, 0, width, height);
    2781:	8b 45 10             	mov    0x10(%ebp),%eax
    2784:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2788:	8b 45 0c             	mov    0xc(%ebp),%eax
    278b:	89 44 24 08          	mov    %eax,0x8(%esp)
    278f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2796:	00 
    2797:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    279e:	e8 7b 1e 00 00       	call   461e <createWindow>
}
    27a3:	c9                   	leave  
    27a4:	c3                   	ret    

000027a5 <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    27a5:	55                   	push   %ebp
    27a6:	89 e5                	mov    %esp,%ebp
    27a8:	83 ec 18             	sub    $0x18,%esp
    free(context_ptr->addr);
    27ab:	8b 45 08             	mov    0x8(%ebp),%eax
    27ae:	8b 00                	mov    (%eax),%eax
    27b0:	89 04 24             	mov    %eax,(%esp)
    27b3:	e8 59 21 00 00       	call   4911 <free>
    freeASCII();
    27b8:	e8 c6 02 00 00       	call   2a83 <freeASCII>
    freeGBK();
    27bd:	e8 7e 03 00 00       	call   2b40 <freeGBK>
    destroyWindow(winid);
    27c2:	8b 45 0c             	mov    0xc(%ebp),%eax
    27c5:	89 04 24             	mov    %eax,(%esp)
    27c8:	e8 59 1e 00 00       	call   4626 <destroyWindow>
}
    27cd:	c9                   	leave  
    27ce:	c3                   	ret    

000027cf <draw_point>:
*             then do nothing!
*/

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    27cf:	55                   	push   %ebp
    27d0:	89 e5                	mov    %esp,%ebp
    27d2:	83 ec 04             	sub    $0x4,%esp
    27d5:	8b 45 1c             	mov    0x1c(%ebp),%eax
    27d8:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width) 
    27dc:	8b 45 0c             	mov    0xc(%ebp),%eax
    27df:	3b 45 14             	cmp    0x14(%ebp),%eax
    27e2:	77 02                	ja     27e6 <draw_point+0x17>
    return;
    27e4:	eb 26                	jmp    280c <draw_point+0x3d>
  if(y >= c.height)
    27e6:	8b 45 10             	mov    0x10(%ebp),%eax
    27e9:	3b 45 18             	cmp    0x18(%ebp),%eax
    27ec:	77 02                	ja     27f0 <draw_point+0x21>
    return;
    27ee:	eb 1c                	jmp    280c <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    27f0:	8b 55 08             	mov    0x8(%ebp),%edx
    27f3:	8b 45 0c             	mov    0xc(%ebp),%eax
    27f6:	0f af 45 18          	imul   0x18(%ebp),%eax
    27fa:	89 c1                	mov    %eax,%ecx
    27fc:	8b 45 14             	mov    0x14(%ebp),%eax
    27ff:	01 c8                	add    %ecx,%eax
    2801:	01 c0                	add    %eax,%eax
    2803:	01 c2                	add    %eax,%edx
    2805:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    2809:	66 89 02             	mov    %ax,(%edx)
}
    280c:	c9                   	leave  
    280d:	c3                   	ret    

0000280e <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    280e:	55                   	push   %ebp
    280f:	89 e5                	mov    %esp,%ebp
    2811:	83 ec 2c             	sub    $0x2c,%esp
    2814:	8b 45 24             	mov    0x24(%ebp),%eax
    2817:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    281b:	8b 45 1c             	mov    0x1c(%ebp),%eax
    281e:	8b 55 14             	mov    0x14(%ebp),%edx
    2821:	01 c2                	add    %eax,%edx
    2823:	8b 45 0c             	mov    0xc(%ebp),%eax
    2826:	39 c2                	cmp    %eax,%edx
    2828:	0f 46 c2             	cmovbe %edx,%eax
    282b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height; 
    282e:	8b 45 20             	mov    0x20(%ebp),%eax
    2831:	8b 55 18             	mov    0x18(%ebp),%edx
    2834:	01 c2                	add    %eax,%edx
    2836:	8b 45 10             	mov    0x10(%ebp),%eax
    2839:	39 c2                	cmp    %eax,%edx
    283b:	0f 46 c2             	cmovbe %edx,%eax
    283e:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    2841:	8b 45 18             	mov    0x18(%ebp),%eax
    2844:	89 45 f8             	mov    %eax,-0x8(%ebp)
    2847:	eb 47                	jmp    2890 <fill_rect+0x82>
	{
		for (x = bx; x < mx; x++)
    2849:	8b 45 14             	mov    0x14(%ebp),%eax
    284c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    284f:	eb 33                	jmp    2884 <fill_rect+0x76>
		{
			draw_point(c, x, y, color);
    2851:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    2855:	8b 55 f8             	mov    -0x8(%ebp),%edx
    2858:	8b 45 fc             	mov    -0x4(%ebp),%eax
    285b:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    285f:	89 54 24 10          	mov    %edx,0x10(%esp)
    2863:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2867:	8b 45 08             	mov    0x8(%ebp),%eax
    286a:	89 04 24             	mov    %eax,(%esp)
    286d:	8b 45 0c             	mov    0xc(%ebp),%eax
    2870:	89 44 24 04          	mov    %eax,0x4(%esp)
    2874:	8b 45 10             	mov    0x10(%ebp),%eax
    2877:	89 44 24 08          	mov    %eax,0x8(%esp)
    287b:	e8 4f ff ff ff       	call   27cf <draw_point>
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    2880:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    2884:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2887:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    288a:	7c c5                	jl     2851 <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
    288c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2890:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2893:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    2896:	7c b1                	jl     2849 <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    2898:	c9                   	leave  
    2899:	c3                   	ret    

0000289a <printBinary>:

void printBinary(char c)
{
    289a:	55                   	push   %ebp
    289b:	89 e5                	mov    %esp,%ebp
    289d:	83 ec 28             	sub    $0x28,%esp
    28a0:	8b 45 08             	mov    0x8(%ebp),%eax
    28a3:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    28a6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    28ad:	eb 44                	jmp    28f3 <printBinary+0x59>
	{
		if(((c << i) & 0x80) != 0)
    28af:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    28b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28b6:	89 c1                	mov    %eax,%ecx
    28b8:	d3 e2                	shl    %cl,%edx
    28ba:	89 d0                	mov    %edx,%eax
    28bc:	25 80 00 00 00       	and    $0x80,%eax
    28c1:	85 c0                	test   %eax,%eax
    28c3:	74 16                	je     28db <printBinary+0x41>
		{
			printf(0, "1");
    28c5:	c7 44 24 04 e3 b0 00 	movl   $0xb0e3,0x4(%esp)
    28cc:	00 
    28cd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    28d4:	e8 85 1e 00 00       	call   475e <printf>
    28d9:	eb 14                	jmp    28ef <printBinary+0x55>
		}
		else
		{
			printf(0, "0");
    28db:	c7 44 24 04 e5 b0 00 	movl   $0xb0e5,0x4(%esp)
    28e2:	00 
    28e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    28ea:	e8 6f 1e 00 00       	call   475e <printf>
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    28ef:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    28f3:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    28f7:	7e b6                	jle    28af <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    28f9:	c7 44 24 04 e7 b0 00 	movl   $0xb0e7,0x4(%esp)
    2900:	00 
    2901:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2908:	e8 51 1e 00 00       	call   475e <printf>
}
    290d:	c9                   	leave  
    290e:	c3                   	ret    

0000290f <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    290f:	55                   	push   %ebp
    2910:	89 e5                	mov    %esp,%ebp
    2912:	56                   	push   %esi
    2913:	53                   	push   %ebx
    2914:	83 ec 30             	sub    $0x30,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    2917:	c7 44 24 04 e9 b0 00 	movl   $0xb0e9,0x4(%esp)
    291e:	00 
    291f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2926:	e8 33 1e 00 00       	call   475e <printf>
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    292b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2932:	00 
    2933:	c7 04 24 fc b0 00 00 	movl   $0xb0fc,(%esp)
    293a:	e8 77 1c 00 00       	call   45b6 <open>
    293f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2942:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2946:	79 21                	jns    2969 <initializeASCII+0x5a>
	  printf(0,"cannot open %s\n", HANKAKU);
    2948:	c7 44 24 08 fc b0 00 	movl   $0xb0fc,0x8(%esp)
    294f:	00 
    2950:	c7 44 24 04 08 b1 00 	movl   $0xb108,0x4(%esp)
    2957:	00 
    2958:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    295f:	e8 fa 1d 00 00       	call   475e <printf>
	  return;
    2964:	e9 13 01 00 00       	jmp    2a7c <initializeASCII+0x16d>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    2969:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2970:	e8 d5 20 00 00       	call   4a4a <malloc>
    2975:	a3 e0 2e 01 00       	mov    %eax,0x12ee0
	for (i = 0; i < ASCII_NUM; i++)
    297a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2981:	eb 12                	jmp    2995 <initializeASCII+0x86>
	{
		hankaku[i] = 0;
    2983:	8b 15 e0 2e 01 00    	mov    0x12ee0,%edx
    2989:	8b 45 f4             	mov    -0xc(%ebp),%eax
    298c:	01 d0                	add    %edx,%eax
    298e:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    2991:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2995:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    299c:	7e e5                	jle    2983 <initializeASCII+0x74>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    299e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    29a5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    29ac:	e9 84 00 00 00       	jmp    2a35 <initializeASCII+0x126>
	{
		for (i = 0; i < n; i++){
    29b1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    29b8:	eb 73                	jmp    2a2d <initializeASCII+0x11e>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    29ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29bd:	05 00 2f 01 00       	add    $0x12f00,%eax
    29c2:	0f b6 00             	movzbl (%eax),%eax
    29c5:	3c 2a                	cmp    $0x2a,%al
    29c7:	74 0f                	je     29d8 <initializeASCII+0xc9>
    29c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29cc:	05 00 2f 01 00       	add    $0x12f00,%eax
    29d1:	0f b6 00             	movzbl (%eax),%eax
    29d4:	3c 2e                	cmp    $0x2e,%al
    29d6:	75 51                	jne    2a29 <initializeASCII+0x11a>
			{
				if (buf[i] == '*')
    29d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29db:	05 00 2f 01 00       	add    $0x12f00,%eax
    29e0:	0f b6 00             	movzbl (%eax),%eax
    29e3:	3c 2a                	cmp    $0x2a,%al
    29e5:	75 2d                	jne    2a14 <initializeASCII+0x105>
				{
					hankaku[y] |= (0x80 >> x);
    29e7:	8b 15 e0 2e 01 00    	mov    0x12ee0,%edx
    29ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29f0:	01 c2                	add    %eax,%edx
    29f2:	8b 0d e0 2e 01 00    	mov    0x12ee0,%ecx
    29f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29fb:	01 c8                	add    %ecx,%eax
    29fd:	0f b6 00             	movzbl (%eax),%eax
    2a00:	89 c3                	mov    %eax,%ebx
    2a02:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2a05:	be 80 00 00 00       	mov    $0x80,%esi
    2a0a:	89 c1                	mov    %eax,%ecx
    2a0c:	d3 fe                	sar    %cl,%esi
    2a0e:	89 f0                	mov    %esi,%eax
    2a10:	09 d8                	or     %ebx,%eax
    2a12:	88 02                	mov    %al,(%edx)
				}
				x ++;
    2a14:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    2a18:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    2a1c:	7e 0b                	jle    2a29 <initializeASCII+0x11a>
				{
					x = 0;
    2a1e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    2a25:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    2a29:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2a2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a30:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    2a33:	7c 85                	jl     29ba <initializeASCII+0xab>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    2a35:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    2a3c:	00 
    2a3d:	c7 44 24 04 00 2f 01 	movl   $0x12f00,0x4(%esp)
    2a44:	00 
    2a45:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2a48:	89 04 24             	mov    %eax,(%esp)
    2a4b:	e8 3e 1b 00 00       	call   458e <read>
    2a50:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2a53:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2a57:	0f 8f 54 ff ff ff    	jg     29b1 <initializeASCII+0xa2>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    2a5d:	c7 44 24 04 18 b1 00 	movl   $0xb118,0x4(%esp)
    2a64:	00 
    2a65:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2a6c:	e8 ed 1c 00 00       	call   475e <printf>
	close(fd);
    2a71:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2a74:	89 04 24             	mov    %eax,(%esp)
    2a77:	e8 22 1b 00 00       	call   459e <close>
}
    2a7c:	83 c4 30             	add    $0x30,%esp
    2a7f:	5b                   	pop    %ebx
    2a80:	5e                   	pop    %esi
    2a81:	5d                   	pop    %ebp
    2a82:	c3                   	ret    

00002a83 <freeASCII>:

void freeASCII(){
    2a83:	55                   	push   %ebp
    2a84:	89 e5                	mov    %esp,%ebp
    2a86:	83 ec 18             	sub    $0x18,%esp
	free(hankaku);
    2a89:	a1 e0 2e 01 00       	mov    0x12ee0,%eax
    2a8e:	89 04 24             	mov    %eax,(%esp)
    2a91:	e8 7b 1e 00 00       	call   4911 <free>
}
    2a96:	c9                   	leave  
    2a97:	c3                   	ret    

00002a98 <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    2a98:	55                   	push   %ebp
    2a99:	89 e5                	mov    %esp,%ebp
    2a9b:	83 ec 28             	sub    $0x28,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    2a9e:	c7 44 24 04 35 b1 00 	movl   $0xb135,0x4(%esp)
    2aa5:	00 
    2aa6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2aad:	e8 ac 1c 00 00       	call   475e <printf>
	if((fd = open(HZK16, 0)) < 0){
    2ab2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2ab9:	00 
    2aba:	c7 04 24 46 b1 00 00 	movl   $0xb146,(%esp)
    2ac1:	e8 f0 1a 00 00       	call   45b6 <open>
    2ac6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2ac9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2acd:	79 1e                	jns    2aed <initializeGBK+0x55>
		printf(0,"cannot open %s\n", HZK16);
    2acf:	c7 44 24 08 46 b1 00 	movl   $0xb146,0x8(%esp)
    2ad6:	00 
    2ad7:	c7 44 24 04 08 b1 00 	movl   $0xb108,0x4(%esp)
    2ade:	00 
    2adf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ae6:	e8 73 1c 00 00       	call   475e <printf>
		return;
    2aeb:	eb 51                	jmp    2b3e <initializeGBK+0xa6>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    2aed:	c7 04 24 78 69 00 00 	movl   $0x6978,(%esp)
    2af4:	e8 51 1f 00 00       	call   4a4a <malloc>
    2af9:	a3 e4 2e 01 00       	mov    %eax,0x12ee4
	fontFile.size = read(fd, fontFile.buf, 27000);
    2afe:	a1 e4 2e 01 00       	mov    0x12ee4,%eax
    2b03:	c7 44 24 08 78 69 00 	movl   $0x6978,0x8(%esp)
    2b0a:	00 
    2b0b:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b12:	89 04 24             	mov    %eax,(%esp)
    2b15:	e8 74 1a 00 00       	call   458e <read>
    2b1a:	a3 e8 2e 01 00       	mov    %eax,0x12ee8
	printf(0,"initialzing gbk complete!\n");
    2b1f:	c7 44 24 04 50 b1 00 	movl   $0xb150,0x4(%esp)
    2b26:	00 
    2b27:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b2e:	e8 2b 1c 00 00       	call   475e <printf>
	close(fd);
    2b33:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b36:	89 04 24             	mov    %eax,(%esp)
    2b39:	e8 60 1a 00 00       	call   459e <close>
}
    2b3e:	c9                   	leave  
    2b3f:	c3                   	ret    

00002b40 <freeGBK>:

void freeGBK(){
    2b40:	55                   	push   %ebp
    2b41:	89 e5                	mov    %esp,%ebp
    2b43:	83 ec 18             	sub    $0x18,%esp
	free(fontFile.buf);
    2b46:	a1 e4 2e 01 00       	mov    0x12ee4,%eax
    2b4b:	89 04 24             	mov    %eax,(%esp)
    2b4e:	e8 be 1d 00 00       	call   4911 <free>
}
    2b53:	c9                   	leave  
    2b54:	c3                   	ret    

00002b55 <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    2b55:	55                   	push   %ebp
    2b56:	89 e5                	mov    %esp,%ebp
    2b58:	53                   	push   %ebx
    2b59:	83 ec 30             	sub    $0x30,%esp
    2b5c:	8b 55 14             	mov    0x14(%ebp),%edx
    2b5f:	8b 45 18             	mov    0x18(%ebp),%eax
    2b62:	88 55 e8             	mov    %dl,-0x18(%ebp)
    2b65:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    2b69:	8b 45 20             	mov    0x20(%ebp),%eax
    2b6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2b6f:	eb 7f                	jmp    2bf0 <put_ascii+0x9b>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    2b71:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2b78:	eb 6c                	jmp    2be6 <put_ascii+0x91>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    2b7a:	a1 e0 2e 01 00       	mov    0x12ee0,%eax
    2b7f:	0f b6 55 e8          	movzbl -0x18(%ebp),%edx
    2b83:	c1 e2 04             	shl    $0x4,%edx
    2b86:	89 d1                	mov    %edx,%ecx
    2b88:	8b 55 20             	mov    0x20(%ebp),%edx
    2b8b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    2b8e:	29 d3                	sub    %edx,%ebx
    2b90:	89 da                	mov    %ebx,%edx
    2b92:	01 ca                	add    %ecx,%edx
    2b94:	01 d0                	add    %edx,%eax
    2b96:	0f b6 00             	movzbl (%eax),%eax
    2b99:	0f b6 d0             	movzbl %al,%edx
    2b9c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2b9f:	89 c1                	mov    %eax,%ecx
    2ba1:	d3 e2                	shl    %cl,%edx
    2ba3:	89 d0                	mov    %edx,%eax
    2ba5:	25 80 00 00 00       	and    $0x80,%eax
    2baa:	85 c0                	test   %eax,%eax
    2bac:	74 34                	je     2be2 <put_ascii+0x8d>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    2bae:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    2bb2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2bb5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2bb8:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2bbb:	01 d8                	add    %ebx,%eax
    2bbd:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2bc1:	89 54 24 10          	mov    %edx,0x10(%esp)
    2bc5:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2bc9:	8b 45 08             	mov    0x8(%ebp),%eax
    2bcc:	89 04 24             	mov    %eax,(%esp)
    2bcf:	8b 45 0c             	mov    0xc(%ebp),%eax
    2bd2:	89 44 24 04          	mov    %eax,0x4(%esp)
    2bd6:	8b 45 10             	mov    0x10(%ebp),%eax
    2bd9:	89 44 24 08          	mov    %eax,0x8(%esp)
    2bdd:	e8 ed fb ff ff       	call   27cf <draw_point>
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    2be2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2be6:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2bea:	7e 8e                	jle    2b7a <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    2bec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2bf0:	8b 45 20             	mov    0x20(%ebp),%eax
    2bf3:	83 c0 10             	add    $0x10,%eax
    2bf6:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2bf9:	0f 8f 72 ff ff ff    	jg     2b71 <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    2bff:	83 c4 30             	add    $0x30,%esp
    2c02:	5b                   	pop    %ebx
    2c03:	5d                   	pop    %ebp
    2c04:	c3                   	ret    

00002c05 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    2c05:	55                   	push   %ebp
    2c06:	89 e5                	mov    %esp,%ebp
    2c08:	53                   	push   %ebx
    2c09:	83 ec 34             	sub    $0x34,%esp
    2c0c:	8b 55 14             	mov    0x14(%ebp),%edx
    2c0f:	8b 45 18             	mov    0x18(%ebp),%eax
    2c12:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    2c16:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    2c1a:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    2c1e:	0f b6 c0             	movzbl %al,%eax
    2c21:	3d a0 00 00 00       	cmp    $0xa0,%eax
    2c26:	0f 8e 40 01 00 00    	jle    2d6c <put_gbk+0x167>
    2c2c:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2c30:	66 c1 f8 08          	sar    $0x8,%ax
    2c34:	98                   	cwtl   
    2c35:	0f b6 c0             	movzbl %al,%eax
    2c38:	3d a0 00 00 00       	cmp    $0xa0,%eax
    2c3d:	0f 8e 29 01 00 00    	jle    2d6c <put_gbk+0x167>
		hzk16Base = fontFile.buf;
    2c43:	a1 e4 2e 01 00       	mov    0x12ee4,%eax
    2c48:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    2c4b:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    2c4f:	0f b6 c0             	movzbl %al,%eax
    2c52:	2d a1 00 00 00       	sub    $0xa1,%eax
    2c57:	6b c0 5e             	imul   $0x5e,%eax,%eax
    2c5a:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    2c5e:	66 c1 fa 08          	sar    $0x8,%dx
    2c62:	0f bf d2             	movswl %dx,%edx
    2c65:	0f b6 d2             	movzbl %dl,%edx
    2c68:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    2c6e:	01 d0                	add    %edx,%eax
    2c70:	c1 e0 05             	shl    $0x5,%eax
    2c73:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    2c76:	8b 45 20             	mov    0x20(%ebp),%eax
    2c79:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2c7c:	e9 da 00 00 00       	jmp    2d5b <put_gbk+0x156>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2c81:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2c88:	eb 58                	jmp    2ce2 <put_gbk+0xdd>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    2c8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2c8d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2c90:	01 d0                	add    %edx,%eax
    2c92:	0f b6 00             	movzbl (%eax),%eax
    2c95:	0f b6 d0             	movzbl %al,%edx
    2c98:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2c9b:	89 c1                	mov    %eax,%ecx
    2c9d:	d3 e2                	shl    %cl,%edx
    2c9f:	89 d0                	mov    %edx,%eax
    2ca1:	25 80 00 00 00       	and    $0x80,%eax
    2ca6:	85 c0                	test   %eax,%eax
    2ca8:	74 34                	je     2cde <put_gbk+0xd9>
					draw_point(c, x + tmpX, tmpY, colorNum);
    2caa:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    2cae:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2cb1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2cb4:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2cb7:	01 d8                	add    %ebx,%eax
    2cb9:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2cbd:	89 54 24 10          	mov    %edx,0x10(%esp)
    2cc1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2cc5:	8b 45 08             	mov    0x8(%ebp),%eax
    2cc8:	89 04 24             	mov    %eax,(%esp)
    2ccb:	8b 45 0c             	mov    0xc(%ebp),%eax
    2cce:	89 44 24 04          	mov    %eax,0x4(%esp)
    2cd2:	8b 45 10             	mov    0x10(%ebp),%eax
    2cd5:	89 44 24 08          	mov    %eax,0x8(%esp)
    2cd9:	e8 f1 fa ff ff       	call   27cf <draw_point>
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2cde:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2ce2:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2ce6:	7e a2                	jle    2c8a <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    2ce8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2cec:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2cf3:	eb 58                	jmp    2d4d <put_gbk+0x148>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    2cf5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2cf8:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2cfb:	01 d0                	add    %edx,%eax
    2cfd:	0f b6 00             	movzbl (%eax),%eax
    2d00:	0f b6 d0             	movzbl %al,%edx
    2d03:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2d06:	89 c1                	mov    %eax,%ecx
    2d08:	d3 e2                	shl    %cl,%edx
    2d0a:	89 d0                	mov    %edx,%eax
    2d0c:	25 80 00 00 00       	and    $0x80,%eax
    2d11:	85 c0                	test   %eax,%eax
    2d13:	74 34                	je     2d49 <put_gbk+0x144>
					draw_point(c, x + tmpX, tmpY, colorNum);
    2d15:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    2d19:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2d1c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2d1f:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2d22:	01 d8                	add    %ebx,%eax
    2d24:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2d28:	89 54 24 10          	mov    %edx,0x10(%esp)
    2d2c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2d30:	8b 45 08             	mov    0x8(%ebp),%eax
    2d33:	89 04 24             	mov    %eax,(%esp)
    2d36:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d39:	89 44 24 04          	mov    %eax,0x4(%esp)
    2d3d:	8b 45 10             	mov    0x10(%ebp),%eax
    2d40:	89 44 24 08          	mov    %eax,0x8(%esp)
    2d44:	e8 86 fa ff ff       	call   27cf <draw_point>
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2d49:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2d4d:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2d51:	7e a2                	jle    2cf5 <put_gbk+0xf0>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    2d53:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    2d57:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2d5b:	8b 45 20             	mov    0x20(%ebp),%eax
    2d5e:	83 c0 10             	add    $0x10,%eax
    2d61:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2d64:	0f 8f 17 ff ff ff    	jg     2c81 <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    2d6a:	eb 7b                	jmp    2de7 <put_gbk+0x1e2>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    2d6c:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2d70:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2d74:	0f b6 c0             	movzbl %al,%eax
    2d77:	8b 4d 20             	mov    0x20(%ebp),%ecx
    2d7a:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2d7e:	8b 4d 1c             	mov    0x1c(%ebp),%ecx
    2d81:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2d85:	89 54 24 10          	mov    %edx,0x10(%esp)
    2d89:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2d8d:	8b 45 08             	mov    0x8(%ebp),%eax
    2d90:	89 04 24             	mov    %eax,(%esp)
    2d93:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d96:	89 44 24 04          	mov    %eax,0x4(%esp)
    2d9a:	8b 45 10             	mov    0x10(%ebp),%eax
    2d9d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2da1:	e8 af fd ff ff       	call   2b55 <put_ascii>
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    2da6:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2da9:	8d 58 08             	lea    0x8(%eax),%ebx
    2dac:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2db0:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2db4:	66 c1 f8 08          	sar    $0x8,%ax
    2db8:	0f b6 c0             	movzbl %al,%eax
    2dbb:	8b 4d 20             	mov    0x20(%ebp),%ecx
    2dbe:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2dc2:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    2dc6:	89 54 24 10          	mov    %edx,0x10(%esp)
    2dca:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2dce:	8b 45 08             	mov    0x8(%ebp),%eax
    2dd1:	89 04 24             	mov    %eax,(%esp)
    2dd4:	8b 45 0c             	mov    0xc(%ebp),%eax
    2dd7:	89 44 24 04          	mov    %eax,0x4(%esp)
    2ddb:	8b 45 10             	mov    0x10(%ebp),%eax
    2dde:	89 44 24 08          	mov    %eax,0x8(%esp)
    2de2:	e8 6e fd ff ff       	call   2b55 <put_ascii>
	}
}
    2de7:	83 c4 34             	add    $0x34,%esp
    2dea:	5b                   	pop    %ebx
    2deb:	5d                   	pop    %ebp
    2dec:	c3                   	ret    

00002ded <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    2ded:	55                   	push   %ebp
    2dee:	89 e5                	mov    %esp,%ebp
    2df0:	83 ec 38             	sub    $0x38,%esp
    2df3:	8b 45 18             	mov    0x18(%ebp),%eax
    2df6:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    2dfa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    2e01:	8b 45 14             	mov    0x14(%ebp),%eax
    2e04:	89 04 24             	mov    %eax,(%esp)
    2e07:	e8 96 15 00 00       	call   43a2 <strlen>
    2e0c:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    2e0f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2e16:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2e19:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2e1c:	eb 49                	jmp    2e67 <puts_str+0x7a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    2e1e:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2e22:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2e25:	8b 45 14             	mov    0x14(%ebp),%eax
    2e28:	01 c8                	add    %ecx,%eax
    2e2a:	0f b6 00             	movzbl (%eax),%eax
    2e2d:	0f b6 c0             	movzbl %al,%eax
    2e30:	8b 4d 20             	mov    0x20(%ebp),%ecx
    2e33:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2e37:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    2e3a:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2e3e:	89 54 24 10          	mov    %edx,0x10(%esp)
    2e42:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2e46:	8b 45 08             	mov    0x8(%ebp),%eax
    2e49:	89 04 24             	mov    %eax,(%esp)
    2e4c:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e4f:	89 44 24 04          	mov    %eax,0x4(%esp)
    2e53:	8b 45 10             	mov    0x10(%ebp),%eax
    2e56:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e5a:	e8 f6 fc ff ff       	call   2b55 <put_ascii>
			xTmp += 8;
    2e5f:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    2e63:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    2e67:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e6a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    2e6d:	72 af                	jb     2e1e <puts_str+0x31>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    2e6f:	c9                   	leave  
    2e70:	c3                   	ret    

00002e71 <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    2e71:	55                   	push   %ebp
    2e72:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    2e74:	8b 45 10             	mov    0x10(%ebp),%eax
    2e77:	8d 50 07             	lea    0x7(%eax),%edx
    2e7a:	85 c0                	test   %eax,%eax
    2e7c:	0f 48 c2             	cmovs  %edx,%eax
    2e7f:	c1 f8 03             	sar    $0x3,%eax
    2e82:	89 c2                	mov    %eax,%edx
    2e84:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e87:	8d 48 03             	lea    0x3(%eax),%ecx
    2e8a:	85 c0                	test   %eax,%eax
    2e8c:	0f 48 c1             	cmovs  %ecx,%eax
    2e8f:	c1 f8 02             	sar    $0x2,%eax
    2e92:	c1 e0 05             	shl    $0x5,%eax
    2e95:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    2e98:	8b 45 08             	mov    0x8(%ebp),%eax
    2e9b:	8d 50 07             	lea    0x7(%eax),%edx
    2e9e:	85 c0                	test   %eax,%eax
    2ea0:	0f 48 c2             	cmovs  %edx,%eax
    2ea3:	c1 f8 03             	sar    $0x3,%eax
    2ea6:	c1 e0 0b             	shl    $0xb,%eax
    2ea9:	01 c8                	add    %ecx,%eax
}
    2eab:	5d                   	pop    %ebp
    2eac:	c3                   	ret    

00002ead <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    2ead:	55                   	push   %ebp
    2eae:	89 e5                	mov    %esp,%ebp
    2eb0:	53                   	push   %ebx
    2eb1:	83 ec 28             	sub    $0x28,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    2eb4:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2ebb:	e9 b1 00 00 00       	jmp    2f71 <draw_picture+0xc4>
	{
		for (j = 0; j < pic.width; j++)
    2ec0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2ec7:	e9 95 00 00 00       	jmp    2f61 <draw_picture+0xb4>
		{
			rgb = pic.data[i*pic.width+j];
    2ecc:	8b 55 14             	mov    0x14(%ebp),%edx
    2ecf:	8b 45 18             	mov    0x18(%ebp),%eax
    2ed2:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    2ed6:	89 c1                	mov    %eax,%ecx
    2ed8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2edb:	01 c8                	add    %ecx,%eax
    2edd:	c1 e0 02             	shl    $0x2,%eax
    2ee0:	01 d0                	add    %edx,%eax
    2ee2:	8b 00                	mov    (%eax),%eax
    2ee4:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    2ee7:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    2eeb:	3c 01                	cmp    $0x1,%al
    2eed:	75 02                	jne    2ef1 <draw_picture+0x44>
    2eef:	eb 6c                	jmp    2f5d <draw_picture+0xb0>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    2ef1:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    2ef5:	0f b6 c8             	movzbl %al,%ecx
    2ef8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    2efc:	0f b6 d0             	movzbl %al,%edx
    2eff:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    2f03:	0f b6 c0             	movzbl %al,%eax
    2f06:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2f0a:	89 54 24 04          	mov    %edx,0x4(%esp)
    2f0e:	89 04 24             	mov    %eax,(%esp)
    2f11:	e8 5b ff ff ff       	call   2e71 <_RGB16BIT565>
    2f16:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    2f1a:	0f b7 4d f2          	movzwl -0xe(%ebp),%ecx
    2f1e:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2f21:	83 e8 01             	sub    $0x1,%eax
    2f24:	2b 45 f8             	sub    -0x8(%ebp),%eax
    2f27:	89 c2                	mov    %eax,%edx
    2f29:	8b 45 24             	mov    0x24(%ebp),%eax
    2f2c:	01 d0                	add    %edx,%eax
    2f2e:	89 c2                	mov    %eax,%edx
    2f30:	8b 45 20             	mov    0x20(%ebp),%eax
    2f33:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    2f36:	01 d8                	add    %ebx,%eax
    2f38:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2f3c:	89 54 24 10          	mov    %edx,0x10(%esp)
    2f40:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2f44:	8b 45 08             	mov    0x8(%ebp),%eax
    2f47:	89 04 24             	mov    %eax,(%esp)
    2f4a:	8b 45 0c             	mov    0xc(%ebp),%eax
    2f4d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2f51:	8b 45 10             	mov    0x10(%ebp),%eax
    2f54:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f58:	e8 72 f8 ff ff       	call   27cf <draw_point>
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    2f5d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2f61:	8b 45 18             	mov    0x18(%ebp),%eax
    2f64:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2f67:	0f 8f 5f ff ff ff    	jg     2ecc <draw_picture+0x1f>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    2f6d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2f71:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2f74:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    2f77:	0f 8f 43 ff ff ff    	jg     2ec0 <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    2f7d:	83 c4 28             	add    $0x28,%esp
    2f80:	5b                   	pop    %ebx
    2f81:	5d                   	pop    %ebp
    2f82:	c3                   	ret    

00002f83 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    2f83:	55                   	push   %ebp
    2f84:	89 e5                	mov    %esp,%ebp
    2f86:	83 ec 3c             	sub    $0x3c,%esp
    2f89:	8b 45 24             	mov    0x24(%ebp),%eax
    2f8c:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    2f90:	8b 45 14             	mov    0x14(%ebp),%eax
    2f93:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2f96:	29 c2                	sub    %eax,%edx
    2f98:	89 d0                	mov    %edx,%eax
    2f9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    2f9d:	8b 45 18             	mov    0x18(%ebp),%eax
    2fa0:	8b 55 20             	mov    0x20(%ebp),%edx
    2fa3:	29 c2                	sub    %eax,%edx
    2fa5:	89 d0                	mov    %edx,%eax
    2fa7:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    2faa:	8b 45 14             	mov    0x14(%ebp),%eax
    2fad:	c1 e0 0a             	shl    $0xa,%eax
    2fb0:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    2fb3:	8b 45 18             	mov    0x18(%ebp),%eax
    2fb6:	c1 e0 0a             	shl    $0xa,%eax
    2fb9:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    2fbc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2fbf:	c1 f8 1f             	sar    $0x1f,%eax
    2fc2:	31 45 fc             	xor    %eax,-0x4(%ebp)
    2fc5:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    2fc8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2fcb:	c1 f8 1f             	sar    $0x1f,%eax
    2fce:	31 45 f8             	xor    %eax,-0x8(%ebp)
    2fd1:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    2fd4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2fd7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    2fda:	7c 57                	jl     3033 <draw_line+0xb0>
		len = dx + 1;
    2fdc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2fdf:	83 c0 01             	add    $0x1,%eax
    2fe2:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    2fe5:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2fe8:	3b 45 14             	cmp    0x14(%ebp),%eax
    2feb:	7e 07                	jle    2ff4 <draw_line+0x71>
    2fed:	b8 00 04 00 00       	mov    $0x400,%eax
    2ff2:	eb 05                	jmp    2ff9 <draw_line+0x76>
    2ff4:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    2ff9:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    2ffc:	8b 45 20             	mov    0x20(%ebp),%eax
    2fff:	3b 45 18             	cmp    0x18(%ebp),%eax
    3002:	7c 16                	jl     301a <draw_line+0x97>
    3004:	8b 45 18             	mov    0x18(%ebp),%eax
    3007:	8b 55 20             	mov    0x20(%ebp),%edx
    300a:	29 c2                	sub    %eax,%edx
    300c:	89 d0                	mov    %edx,%eax
    300e:	83 c0 01             	add    $0x1,%eax
    3011:	c1 e0 0a             	shl    $0xa,%eax
    3014:	99                   	cltd   
    3015:	f7 7d ec             	idivl  -0x14(%ebp)
    3018:	eb 14                	jmp    302e <draw_line+0xab>
    301a:	8b 45 18             	mov    0x18(%ebp),%eax
    301d:	8b 55 20             	mov    0x20(%ebp),%edx
    3020:	29 c2                	sub    %eax,%edx
    3022:	89 d0                	mov    %edx,%eax
    3024:	83 e8 01             	sub    $0x1,%eax
    3027:	c1 e0 0a             	shl    $0xa,%eax
    302a:	99                   	cltd   
    302b:	f7 7d ec             	idivl  -0x14(%ebp)
    302e:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3031:	eb 55                	jmp    3088 <draw_line+0x105>
	}
	else {
		len = dy + 1;
    3033:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3036:	83 c0 01             	add    $0x1,%eax
    3039:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    303c:	8b 45 20             	mov    0x20(%ebp),%eax
    303f:	3b 45 18             	cmp    0x18(%ebp),%eax
    3042:	7e 07                	jle    304b <draw_line+0xc8>
    3044:	b8 00 04 00 00       	mov    $0x400,%eax
    3049:	eb 05                	jmp    3050 <draw_line+0xcd>
    304b:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    3050:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    3053:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3056:	3b 45 14             	cmp    0x14(%ebp),%eax
    3059:	7c 16                	jl     3071 <draw_line+0xee>
    305b:	8b 45 14             	mov    0x14(%ebp),%eax
    305e:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3061:	29 c2                	sub    %eax,%edx
    3063:	89 d0                	mov    %edx,%eax
    3065:	83 c0 01             	add    $0x1,%eax
    3068:	c1 e0 0a             	shl    $0xa,%eax
    306b:	99                   	cltd   
    306c:	f7 7d ec             	idivl  -0x14(%ebp)
    306f:	eb 14                	jmp    3085 <draw_line+0x102>
    3071:	8b 45 14             	mov    0x14(%ebp),%eax
    3074:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3077:	29 c2                	sub    %eax,%edx
    3079:	89 d0                	mov    %edx,%eax
    307b:	83 e8 01             	sub    $0x1,%eax
    307e:	c1 e0 0a             	shl    $0xa,%eax
    3081:	99                   	cltd   
    3082:	f7 7d ec             	idivl  -0x14(%ebp)
    3085:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    3088:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    308f:	eb 47                	jmp    30d8 <draw_line+0x155>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    3091:	0f b7 4d dc          	movzwl -0x24(%ebp),%ecx
    3095:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3098:	c1 f8 0a             	sar    $0xa,%eax
    309b:	89 c2                	mov    %eax,%edx
    309d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30a0:	c1 f8 0a             	sar    $0xa,%eax
    30a3:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    30a7:	89 54 24 10          	mov    %edx,0x10(%esp)
    30ab:	89 44 24 0c          	mov    %eax,0xc(%esp)
    30af:	8b 45 08             	mov    0x8(%ebp),%eax
    30b2:	89 04 24             	mov    %eax,(%esp)
    30b5:	8b 45 0c             	mov    0xc(%ebp),%eax
    30b8:	89 44 24 04          	mov    %eax,0x4(%esp)
    30bc:	8b 45 10             	mov    0x10(%ebp),%eax
    30bf:	89 44 24 08          	mov    %eax,0x8(%esp)
    30c3:	e8 07 f7 ff ff       	call   27cf <draw_point>
		y += dy;
    30c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    30cb:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    30ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
    30d1:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    30d4:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    30d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    30db:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    30de:	7c b1                	jl     3091 <draw_line+0x10e>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    30e0:	c9                   	leave  
    30e1:	c3                   	ret    

000030e2 <draw_window>:

void
draw_window(Context c, char *title)
{
    30e2:	55                   	push   %ebp
    30e3:	89 e5                	mov    %esp,%ebp
    30e5:	83 ec 38             	sub    $0x38,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    30e8:	8b 45 0c             	mov    0xc(%ebp),%eax
    30eb:	83 e8 01             	sub    $0x1,%eax
    30ee:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    30f5:	00 
    30f6:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    30fd:	00 
    30fe:	89 44 24 14          	mov    %eax,0x14(%esp)
    3102:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    3109:	00 
    310a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    3111:	00 
    3112:	8b 45 08             	mov    0x8(%ebp),%eax
    3115:	89 04 24             	mov    %eax,(%esp)
    3118:	8b 45 0c             	mov    0xc(%ebp),%eax
    311b:	89 44 24 04          	mov    %eax,0x4(%esp)
    311f:	8b 45 10             	mov    0x10(%ebp),%eax
    3122:	89 44 24 08          	mov    %eax,0x8(%esp)
    3126:	e8 58 fe ff ff       	call   2f83 <draw_line>
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    312b:	8b 45 10             	mov    0x10(%ebp),%eax
    312e:	8d 48 ff             	lea    -0x1(%eax),%ecx
    3131:	8b 45 0c             	mov    0xc(%ebp),%eax
    3134:	8d 50 ff             	lea    -0x1(%eax),%edx
    3137:	8b 45 0c             	mov    0xc(%ebp),%eax
    313a:	83 e8 01             	sub    $0x1,%eax
    313d:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    3144:	00 
    3145:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    3149:	89 54 24 14          	mov    %edx,0x14(%esp)
    314d:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    3154:	00 
    3155:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3159:	8b 45 08             	mov    0x8(%ebp),%eax
    315c:	89 04 24             	mov    %eax,(%esp)
    315f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3162:	89 44 24 04          	mov    %eax,0x4(%esp)
    3166:	8b 45 10             	mov    0x10(%ebp),%eax
    3169:	89 44 24 08          	mov    %eax,0x8(%esp)
    316d:	e8 11 fe ff ff       	call   2f83 <draw_line>
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    3172:	8b 45 10             	mov    0x10(%ebp),%eax
    3175:	8d 48 ff             	lea    -0x1(%eax),%ecx
    3178:	8b 45 10             	mov    0x10(%ebp),%eax
    317b:	8d 50 ff             	lea    -0x1(%eax),%edx
    317e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3181:	83 e8 01             	sub    $0x1,%eax
    3184:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    318b:	00 
    318c:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    3190:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    3197:	00 
    3198:	89 54 24 10          	mov    %edx,0x10(%esp)
    319c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    31a0:	8b 45 08             	mov    0x8(%ebp),%eax
    31a3:	89 04 24             	mov    %eax,(%esp)
    31a6:	8b 45 0c             	mov    0xc(%ebp),%eax
    31a9:	89 44 24 04          	mov    %eax,0x4(%esp)
    31ad:	8b 45 10             	mov    0x10(%ebp),%eax
    31b0:	89 44 24 08          	mov    %eax,0x8(%esp)
    31b4:	e8 ca fd ff ff       	call   2f83 <draw_line>
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    31b9:	8b 45 10             	mov    0x10(%ebp),%eax
    31bc:	83 e8 01             	sub    $0x1,%eax
    31bf:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    31c6:	00 
    31c7:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    31ce:	00 
    31cf:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    31d6:	00 
    31d7:	89 44 24 10          	mov    %eax,0x10(%esp)
    31db:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    31e2:	00 
    31e3:	8b 45 08             	mov    0x8(%ebp),%eax
    31e6:	89 04 24             	mov    %eax,(%esp)
    31e9:	8b 45 0c             	mov    0xc(%ebp),%eax
    31ec:	89 44 24 04          	mov    %eax,0x4(%esp)
    31f0:	8b 45 10             	mov    0x10(%ebp),%eax
    31f3:	89 44 24 08          	mov    %eax,0x8(%esp)
    31f7:	e8 87 fd ff ff       	call   2f83 <draw_line>
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    31fc:	8b 45 0c             	mov    0xc(%ebp),%eax
    31ff:	83 e8 02             	sub    $0x2,%eax
    3202:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    3209:	00 
    320a:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    3211:	00 
    3212:	89 44 24 14          	mov    %eax,0x14(%esp)
    3216:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    321d:	00 
    321e:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    3225:	00 
    3226:	8b 45 08             	mov    0x8(%ebp),%eax
    3229:	89 04 24             	mov    %eax,(%esp)
    322c:	8b 45 0c             	mov    0xc(%ebp),%eax
    322f:	89 44 24 04          	mov    %eax,0x4(%esp)
    3233:	8b 45 10             	mov    0x10(%ebp),%eax
    3236:	89 44 24 08          	mov    %eax,0x8(%esp)
    323a:	e8 cf f5 ff ff       	call   280e <fill_rect>
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    323f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3242:	83 e8 02             	sub    $0x2,%eax
    3245:	89 c2                	mov    %eax,%edx
    3247:	8b 45 10             	mov    0x10(%ebp),%eax
    324a:	83 e8 15             	sub    $0x15,%eax
    324d:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    3254:	00 
    3255:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    325c:	00 
    325d:	89 54 24 14          	mov    %edx,0x14(%esp)
    3261:	89 44 24 10          	mov    %eax,0x10(%esp)
    3265:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    326c:	00 
    326d:	8b 45 08             	mov    0x8(%ebp),%eax
    3270:	89 04 24             	mov    %eax,(%esp)
    3273:	8b 45 0c             	mov    0xc(%ebp),%eax
    3276:	89 44 24 04          	mov    %eax,0x4(%esp)
    327a:	8b 45 10             	mov    0x10(%ebp),%eax
    327d:	89 44 24 08          	mov    %eax,0x8(%esp)
    3281:	e8 88 f5 ff ff       	call   280e <fill_rect>

  loadBitmap(&pic, "close.bmp");
    3286:	c7 44 24 04 6b b1 00 	movl   $0xb16b,0x4(%esp)
    328d:	00 
    328e:	8d 45 ec             	lea    -0x14(%ebp),%eax
    3291:	89 04 24             	mov    %eax,(%esp)
    3294:	e8 44 01 00 00       	call   33dd <loadBitmap>
  draw_picture(c, pic, 3, 3);
    3299:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
    32a0:	00 
    32a1:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
    32a8:	00 
    32a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    32ac:	89 44 24 0c          	mov    %eax,0xc(%esp)
    32b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32b3:	89 44 24 10          	mov    %eax,0x10(%esp)
    32b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32ba:	89 44 24 14          	mov    %eax,0x14(%esp)
    32be:	8b 45 08             	mov    0x8(%ebp),%eax
    32c1:	89 04 24             	mov    %eax,(%esp)
    32c4:	8b 45 0c             	mov    0xc(%ebp),%eax
    32c7:	89 44 24 04          	mov    %eax,0x4(%esp)
    32cb:	8b 45 10             	mov    0x10(%ebp),%eax
    32ce:	89 44 24 08          	mov    %eax,0x8(%esp)
    32d2:	e8 d6 fb ff ff       	call   2ead <draw_picture>
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    32d7:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
    32de:	00 
    32df:	c7 44 24 14 19 00 00 	movl   $0x19,0x14(%esp)
    32e6:	00 
    32e7:	c7 44 24 10 ff ff 00 	movl   $0xffff,0x10(%esp)
    32ee:	00 
    32ef:	8b 45 14             	mov    0x14(%ebp),%eax
    32f2:	89 44 24 0c          	mov    %eax,0xc(%esp)
    32f6:	8b 45 08             	mov    0x8(%ebp),%eax
    32f9:	89 04 24             	mov    %eax,(%esp)
    32fc:	8b 45 0c             	mov    0xc(%ebp),%eax
    32ff:	89 44 24 04          	mov    %eax,0x4(%esp)
    3303:	8b 45 10             	mov    0x10(%ebp),%eax
    3306:	89 44 24 08          	mov    %eax,0x8(%esp)
    330a:	e8 de fa ff ff       	call   2ded <puts_str>
  freepic(&pic);
    330f:	8d 45 ec             	lea    -0x14(%ebp),%eax
    3312:	89 04 24             	mov    %eax,(%esp)
    3315:	e8 6f 06 00 00       	call   3989 <freepic>
}
    331a:	c9                   	leave  
    331b:	c3                   	ret    

0000331c <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    331c:	55                   	push   %ebp
    331d:	89 e5                	mov    %esp,%ebp
    331f:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < len; i++)
    3322:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3329:	eb 29                	jmp    3354 <load_iconlist+0x38>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    332b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    332e:	6b d0 34             	imul   $0x34,%eax,%edx
    3331:	8b 45 08             	mov    0x8(%ebp),%eax
    3334:	01 d0                	add    %edx,%eax
    3336:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3339:	6b ca 34             	imul   $0x34,%edx,%ecx
    333c:	8b 55 08             	mov    0x8(%ebp),%edx
    333f:	01 ca                	add    %ecx,%edx
    3341:	83 c2 28             	add    $0x28,%edx
    3344:	89 44 24 04          	mov    %eax,0x4(%esp)
    3348:	89 14 24             	mov    %edx,(%esp)
    334b:	e8 8d 00 00 00       	call   33dd <loadBitmap>
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    3350:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3354:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3357:	3b 45 0c             	cmp    0xc(%ebp),%eax
    335a:	7c cf                	jl     332b <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    335c:	c9                   	leave  
    335d:	c3                   	ret    

0000335e <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    335e:	55                   	push   %ebp
    335f:	89 e5                	mov    %esp,%ebp
    3361:	53                   	push   %ebx
    3362:	83 ec 30             	sub    $0x30,%esp
    int i;
    for (i = 0; i < len; i++)
    3365:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    336c:	eb 61                	jmp    33cf <draw_iconlist+0x71>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    336e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3371:	6b d0 34             	imul   $0x34,%eax,%edx
    3374:	8b 45 14             	mov    0x14(%ebp),%eax
    3377:	01 d0                	add    %edx,%eax
    3379:	8b 48 24             	mov    0x24(%eax),%ecx
    337c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    337f:	6b d0 34             	imul   $0x34,%eax,%edx
    3382:	8b 45 14             	mov    0x14(%ebp),%eax
    3385:	01 d0                	add    %edx,%eax
    3387:	8b 50 20             	mov    0x20(%eax),%edx
    338a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    338d:	6b d8 34             	imul   $0x34,%eax,%ebx
    3390:	8b 45 14             	mov    0x14(%ebp),%eax
    3393:	01 d8                	add    %ebx,%eax
    3395:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    3399:	89 54 24 18          	mov    %edx,0x18(%esp)
    339d:	8b 50 28             	mov    0x28(%eax),%edx
    33a0:	89 54 24 0c          	mov    %edx,0xc(%esp)
    33a4:	8b 50 2c             	mov    0x2c(%eax),%edx
    33a7:	89 54 24 10          	mov    %edx,0x10(%esp)
    33ab:	8b 40 30             	mov    0x30(%eax),%eax
    33ae:	89 44 24 14          	mov    %eax,0x14(%esp)
    33b2:	8b 45 08             	mov    0x8(%ebp),%eax
    33b5:	89 04 24             	mov    %eax,(%esp)
    33b8:	8b 45 0c             	mov    0xc(%ebp),%eax
    33bb:	89 44 24 04          	mov    %eax,0x4(%esp)
    33bf:	8b 45 10             	mov    0x10(%ebp),%eax
    33c2:	89 44 24 08          	mov    %eax,0x8(%esp)
    33c6:	e8 e2 fa ff ff       	call   2ead <draw_picture>
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    33cb:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    33cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    33d2:	3b 45 18             	cmp    0x18(%ebp),%eax
    33d5:	7c 97                	jl     336e <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    33d7:	83 c4 30             	add    $0x30,%esp
    33da:	5b                   	pop    %ebx
    33db:	5d                   	pop    %ebp
    33dc:	c3                   	ret    

000033dd <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    33dd:	55                   	push   %ebp
    33de:	89 e5                	mov    %esp,%ebp
    33e0:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    33e6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    33ed:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    33f4:	00 
    33f5:	8b 45 0c             	mov    0xc(%ebp),%eax
    33f8:	89 04 24             	mov    %eax,(%esp)
    33fb:	e8 b6 11 00 00       	call   45b6 <open>
    3400:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3403:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3407:	79 20                	jns    3429 <loadBitmap+0x4c>
		printf(0, "cannot open %s\n", pic_name);
    3409:	8b 45 0c             	mov    0xc(%ebp),%eax
    340c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3410:	c7 44 24 04 78 b1 00 	movl   $0xb178,0x4(%esp)
    3417:	00 
    3418:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    341f:	e8 3a 13 00 00       	call   475e <printf>
		return;
    3424:	e9 ef 02 00 00       	jmp    3718 <loadBitmap+0x33b>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    3429:	8b 45 0c             	mov    0xc(%ebp),%eax
    342c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3430:	c7 44 24 04 88 b1 00 	movl   $0xb188,0x4(%esp)
    3437:	00 
    3438:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    343f:	e8 1a 13 00 00       	call   475e <printf>
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    3444:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    344b:	e8 fa 15 00 00       	call   4a4a <malloc>
    3450:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    3453:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
    345a:	00 
    345b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    345e:	89 44 24 04          	mov    %eax,0x4(%esp)
    3462:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3465:	89 04 24             	mov    %eax,(%esp)
    3468:	e8 21 11 00 00       	call   458e <read>
    346d:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    3470:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3473:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    3476:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3479:	0f b7 00             	movzwl (%eax),%eax
    347c:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    3480:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    3484:	66 3d 42 4d          	cmp    $0x4d42,%ax
    3488:	74 19                	je     34a3 <loadBitmap+0xc6>
		printf(0, "file is not .bmp file!");
    348a:	c7 44 24 04 9c b1 00 	movl   $0xb19c,0x4(%esp)
    3491:	00 
    3492:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3499:	e8 c0 12 00 00       	call   475e <printf>
		return;
    349e:	e9 75 02 00 00       	jmp    3718 <loadBitmap+0x33b>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    34a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    34a6:	83 c0 02             	add    $0x2,%eax
    34a9:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    34ac:	8b 45 d8             	mov    -0x28(%ebp),%eax
    34af:	8b 00                	mov    (%eax),%eax
    34b1:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    34b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    34b7:	83 c0 06             	add    $0x6,%eax
    34ba:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    34bd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    34c0:	0f b7 00             	movzwl (%eax),%eax
    34c3:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    34c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    34ca:	83 c0 08             	add    $0x8,%eax
    34cd:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    34d0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    34d3:	0f b7 00             	movzwl (%eax),%eax
    34d6:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    34da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    34dd:	83 c0 0a             	add    $0xa,%eax
    34e0:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    34e3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    34e6:	8b 00                	mov    (%eax),%eax
    34e8:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    34eb:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    34f2:	00 
    34f3:	8d 45 84             	lea    -0x7c(%ebp),%eax
    34f6:	89 44 24 04          	mov    %eax,0x4(%esp)
    34fa:	8b 45 e8             	mov    -0x18(%ebp),%eax
    34fd:	89 04 24             	mov    %eax,(%esp)
    3500:	e8 89 10 00 00       	call   458e <read>
	width = bitInfoHead.biWidth;
    3505:	8b 45 88             	mov    -0x78(%ebp),%eax
    3508:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    350b:	8b 45 8c             	mov    -0x74(%ebp),%eax
    350e:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    3511:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3514:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    3518:	c1 e0 02             	shl    $0x2,%eax
    351b:	89 44 24 10          	mov    %eax,0x10(%esp)
    351f:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3522:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3526:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3529:	89 44 24 08          	mov    %eax,0x8(%esp)
    352d:	c7 44 24 04 b4 b1 00 	movl   $0xb1b4,0x4(%esp)
    3534:	00 
    3535:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    353c:	e8 1d 12 00 00       	call   475e <printf>
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    3541:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    3545:	75 14                	jne    355b <loadBitmap+0x17e>
		printf(0, "0");
    3547:	c7 44 24 04 d9 b1 00 	movl   $0xb1d9,0x4(%esp)
    354e:	00 
    354f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3556:	e8 03 12 00 00       	call   475e <printf>
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    355b:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    355f:	0f b7 c0             	movzwl %ax,%eax
    3562:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    3566:	83 c0 1f             	add    $0x1f,%eax
    3569:	8d 50 1f             	lea    0x1f(%eax),%edx
    356c:	85 c0                	test   %eax,%eax
    356e:	0f 48 c2             	cmovs  %edx,%eax
    3571:	c1 f8 05             	sar    $0x5,%eax
    3574:	c1 e0 02             	shl    $0x2,%eax
    3577:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    357a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    357d:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3581:	89 04 24             	mov    %eax,(%esp)
    3584:	e8 c1 14 00 00       	call   4a4a <malloc>
    3589:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    358c:	8b 55 d0             	mov    -0x30(%ebp),%edx
    358f:	8b 45 cc             	mov    -0x34(%ebp),%eax
    3592:	0f af c2             	imul   %edx,%eax
    3595:	89 44 24 08          	mov    %eax,0x8(%esp)
    3599:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    35a0:	00 
    35a1:	8b 45 c8             	mov    -0x38(%ebp),%eax
    35a4:	89 04 24             	mov    %eax,(%esp)
    35a7:	e8 1d 0e 00 00       	call   43c9 <memset>
	long nData = height * l_width;
    35ac:	8b 45 d0             	mov    -0x30(%ebp),%eax
    35af:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    35b3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    35b6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    35b9:	89 44 24 08          	mov    %eax,0x8(%esp)
    35bd:	8b 45 c8             	mov    -0x38(%ebp),%eax
    35c0:	89 44 24 04          	mov    %eax,0x4(%esp)
    35c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    35c7:	89 04 24             	mov    %eax,(%esp)
    35ca:	e8 bf 0f 00 00       	call   458e <read>

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    35cf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    35d2:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    35d6:	c1 e0 02             	shl    $0x2,%eax
    35d9:	89 04 24             	mov    %eax,(%esp)
    35dc:	e8 69 14 00 00       	call   4a4a <malloc>
    35e1:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    35e4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    35e7:	8b 45 d0             	mov    -0x30(%ebp),%eax
    35ea:	0f af c2             	imul   %edx,%eax
    35ed:	c1 e0 02             	shl    $0x2,%eax
    35f0:	89 44 24 08          	mov    %eax,0x8(%esp)
    35f4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    35fb:	00 
    35fc:	8b 45 c0             	mov    -0x40(%ebp),%eax
    35ff:	89 04 24             	mov    %eax,(%esp)
    3602:	e8 c2 0d 00 00       	call   43c9 <memset>
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    3607:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    360b:	66 83 f8 17          	cmp    $0x17,%ax
    360f:	77 19                	ja     362a <loadBitmap+0x24d>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    3611:	c7 44 24 04 dc b1 00 	movl   $0xb1dc,0x4(%esp)
    3618:	00 
    3619:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3620:	e8 39 11 00 00       	call   475e <printf>
		return;
    3625:	e9 ee 00 00 00       	jmp    3718 <loadBitmap+0x33b>
	} else	//位图为24位真彩色
	{
		index = 0;
    362a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    3631:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3638:	e9 94 00 00 00       	jmp    36d1 <loadBitmap+0x2f4>
			for (j = 0; j < width; j++) {
    363d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3644:	eb 7b                	jmp    36c1 <loadBitmap+0x2e4>
				k = i * l_width + j * 3;
    3646:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3649:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    364d:	89 c1                	mov    %eax,%ecx
    364f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3652:	89 d0                	mov    %edx,%eax
    3654:	01 c0                	add    %eax,%eax
    3656:	01 d0                	add    %edx,%eax
    3658:	01 c8                	add    %ecx,%eax
    365a:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    365d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3660:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3667:	8b 45 c0             	mov    -0x40(%ebp),%eax
    366a:	01 c2                	add    %eax,%edx
    366c:	8b 45 bc             	mov    -0x44(%ebp),%eax
    366f:	8d 48 02             	lea    0x2(%eax),%ecx
    3672:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3675:	01 c8                	add    %ecx,%eax
    3677:	0f b6 00             	movzbl (%eax),%eax
    367a:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    367d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3680:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3687:	8b 45 c0             	mov    -0x40(%ebp),%eax
    368a:	01 c2                	add    %eax,%edx
    368c:	8b 45 bc             	mov    -0x44(%ebp),%eax
    368f:	8d 48 01             	lea    0x1(%eax),%ecx
    3692:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3695:	01 c8                	add    %ecx,%eax
    3697:	0f b6 00             	movzbl (%eax),%eax
    369a:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    369d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    36a0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    36a7:	8b 45 c0             	mov    -0x40(%ebp),%eax
    36aa:	01 c2                	add    %eax,%edx
    36ac:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    36af:	8b 45 c8             	mov    -0x38(%ebp),%eax
    36b2:	01 c8                	add    %ecx,%eax
    36b4:	0f b6 00             	movzbl (%eax),%eax
    36b7:	88 02                	mov    %al,(%edx)
				index++;
    36b9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    36bd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    36c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    36c4:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    36c7:	0f 8c 79 ff ff ff    	jl     3646 <loadBitmap+0x269>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    36cd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    36d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36d4:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    36d7:	0f 8c 60 ff ff ff    	jl     363d <loadBitmap+0x260>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    36dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    36e0:	89 04 24             	mov    %eax,(%esp)
    36e3:	e8 b6 0e 00 00       	call   459e <close>

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    36e8:	8b 45 08             	mov    0x8(%ebp),%eax
    36eb:	8b 55 c0             	mov    -0x40(%ebp),%edx
    36ee:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    36f0:	8b 45 08             	mov    0x8(%ebp),%eax
    36f3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    36f6:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    36f9:	8b 45 08             	mov    0x8(%ebp),%eax
    36fc:	8b 55 d0             	mov    -0x30(%ebp),%edx
    36ff:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    3702:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3705:	89 04 24             	mov    %eax,(%esp)
    3708:	e8 04 12 00 00       	call   4911 <free>
	free(BmpFileHeader);
    370d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3710:	89 04 24             	mov    %eax,(%esp)
    3713:	e8 f9 11 00 00       	call   4911 <free>
	//printf("\n");
}
    3718:	c9                   	leave  
    3719:	c3                   	ret    

0000371a <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    371a:	55                   	push   %ebp
    371b:	89 e5                	mov    %esp,%ebp
    371d:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图文件头:\n");
    3720:	c7 44 24 04 fc b1 00 	movl   $0xb1fc,0x4(%esp)
    3727:	00 
    3728:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    372f:	e8 2a 10 00 00       	call   475e <printf>
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    3734:	8b 45 08             	mov    0x8(%ebp),%eax
    3737:	0f b7 00             	movzwl (%eax),%eax
    373a:	0f b7 c0             	movzwl %ax,%eax
    373d:	89 44 24 08          	mov    %eax,0x8(%esp)
    3741:	c7 44 24 04 0e b2 00 	movl   $0xb20e,0x4(%esp)
    3748:	00 
    3749:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3750:	e8 09 10 00 00       	call   475e <printf>
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    3755:	8b 45 08             	mov    0x8(%ebp),%eax
    3758:	8b 40 04             	mov    0x4(%eax),%eax
    375b:	89 44 24 08          	mov    %eax,0x8(%esp)
    375f:	c7 44 24 04 2c b2 00 	movl   $0xb22c,0x4(%esp)
    3766:	00 
    3767:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    376e:	e8 eb 0f 00 00       	call   475e <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    3773:	8b 45 08             	mov    0x8(%ebp),%eax
    3776:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    377a:	0f b7 c0             	movzwl %ax,%eax
    377d:	89 44 24 08          	mov    %eax,0x8(%esp)
    3781:	c7 44 24 04 3d b2 00 	movl   $0xb23d,0x4(%esp)
    3788:	00 
    3789:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3790:	e8 c9 0f 00 00       	call   475e <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    3795:	8b 45 08             	mov    0x8(%ebp),%eax
    3798:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    379c:	0f b7 c0             	movzwl %ax,%eax
    379f:	89 44 24 08          	mov    %eax,0x8(%esp)
    37a3:	c7 44 24 04 3d b2 00 	movl   $0xb23d,0x4(%esp)
    37aa:	00 
    37ab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    37b2:	e8 a7 0f 00 00       	call   475e <printf>
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    37b7:	8b 45 08             	mov    0x8(%ebp),%eax
    37ba:	8b 40 0c             	mov    0xc(%eax),%eax
    37bd:	89 44 24 08          	mov    %eax,0x8(%esp)
    37c1:	c7 44 24 04 4c b2 00 	movl   $0xb24c,0x4(%esp)
    37c8:	00 
    37c9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    37d0:	e8 89 0f 00 00       	call   475e <printf>
}
    37d5:	c9                   	leave  
    37d6:	c3                   	ret    

000037d7 <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    37d7:	55                   	push   %ebp
    37d8:	89 e5                	mov    %esp,%ebp
    37da:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图信息头:\n");
    37dd:	c7 44 24 04 75 b2 00 	movl   $0xb275,0x4(%esp)
    37e4:	00 
    37e5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    37ec:	e8 6d 0f 00 00       	call   475e <printf>
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    37f1:	8b 45 08             	mov    0x8(%ebp),%eax
    37f4:	8b 00                	mov    (%eax),%eax
    37f6:	89 44 24 08          	mov    %eax,0x8(%esp)
    37fa:	c7 44 24 04 87 b2 00 	movl   $0xb287,0x4(%esp)
    3801:	00 
    3802:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3809:	e8 50 0f 00 00       	call   475e <printf>
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    380e:	8b 45 08             	mov    0x8(%ebp),%eax
    3811:	8b 40 04             	mov    0x4(%eax),%eax
    3814:	89 44 24 08          	mov    %eax,0x8(%esp)
    3818:	c7 44 24 04 9e b2 00 	movl   $0xb29e,0x4(%esp)
    381f:	00 
    3820:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3827:	e8 32 0f 00 00       	call   475e <printf>
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    382c:	8b 45 08             	mov    0x8(%ebp),%eax
    382f:	8b 40 08             	mov    0x8(%eax),%eax
    3832:	89 44 24 08          	mov    %eax,0x8(%esp)
    3836:	c7 44 24 04 ac b2 00 	movl   $0xb2ac,0x4(%esp)
    383d:	00 
    383e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3845:	e8 14 0f 00 00       	call   475e <printf>
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    384a:	8b 45 08             	mov    0x8(%ebp),%eax
    384d:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    3851:	0f b7 c0             	movzwl %ax,%eax
    3854:	89 44 24 08          	mov    %eax,0x8(%esp)
    3858:	c7 44 24 04 ba b2 00 	movl   $0xb2ba,0x4(%esp)
    385f:	00 
    3860:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3867:	e8 f2 0e 00 00       	call   475e <printf>
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    386c:	8b 45 08             	mov    0x8(%ebp),%eax
    386f:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    3873:	0f b7 c0             	movzwl %ax,%eax
    3876:	89 44 24 08          	mov    %eax,0x8(%esp)
    387a:	c7 44 24 04 d0 b2 00 	movl   $0xb2d0,0x4(%esp)
    3881:	00 
    3882:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3889:	e8 d0 0e 00 00       	call   475e <printf>
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    388e:	8b 45 08             	mov    0x8(%ebp),%eax
    3891:	8b 40 10             	mov    0x10(%eax),%eax
    3894:	89 44 24 08          	mov    %eax,0x8(%esp)
    3898:	c7 44 24 04 f1 b2 00 	movl   $0xb2f1,0x4(%esp)
    389f:	00 
    38a0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    38a7:	e8 b2 0e 00 00       	call   475e <printf>
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    38ac:	8b 45 08             	mov    0x8(%ebp),%eax
    38af:	8b 40 14             	mov    0x14(%eax),%eax
    38b2:	89 44 24 08          	mov    %eax,0x8(%esp)
    38b6:	c7 44 24 04 04 b3 00 	movl   $0xb304,0x4(%esp)
    38bd:	00 
    38be:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    38c5:	e8 94 0e 00 00       	call   475e <printf>
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    38ca:	8b 45 08             	mov    0x8(%ebp),%eax
    38cd:	8b 40 18             	mov    0x18(%eax),%eax
    38d0:	89 44 24 08          	mov    %eax,0x8(%esp)
    38d4:	c7 44 24 04 38 b3 00 	movl   $0xb338,0x4(%esp)
    38db:	00 
    38dc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    38e3:	e8 76 0e 00 00       	call   475e <printf>
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    38e8:	8b 45 08             	mov    0x8(%ebp),%eax
    38eb:	8b 40 1c             	mov    0x1c(%eax),%eax
    38ee:	89 44 24 08          	mov    %eax,0x8(%esp)
    38f2:	c7 44 24 04 4d b3 00 	movl   $0xb34d,0x4(%esp)
    38f9:	00 
    38fa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3901:	e8 58 0e 00 00       	call   475e <printf>
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    3906:	8b 45 08             	mov    0x8(%ebp),%eax
    3909:	8b 40 20             	mov    0x20(%eax),%eax
    390c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3910:	c7 44 24 04 62 b3 00 	movl   $0xb362,0x4(%esp)
    3917:	00 
    3918:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    391f:	e8 3a 0e 00 00       	call   475e <printf>
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    3924:	8b 45 08             	mov    0x8(%ebp),%eax
    3927:	8b 40 24             	mov    0x24(%eax),%eax
    392a:	89 44 24 08          	mov    %eax,0x8(%esp)
    392e:	c7 44 24 04 79 b3 00 	movl   $0xb379,0x4(%esp)
    3935:	00 
    3936:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    393d:	e8 1c 0e 00 00       	call   475e <printf>
}
    3942:	c9                   	leave  
    3943:	c3                   	ret    

00003944 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    3944:	55                   	push   %ebp
    3945:	89 e5                	mov    %esp,%ebp
    3947:	83 ec 28             	sub    $0x28,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    394a:	8b 45 08             	mov    0x8(%ebp),%eax
    394d:	0f b6 00             	movzbl (%eax),%eax
    3950:	0f b6 c8             	movzbl %al,%ecx
    3953:	8b 45 08             	mov    0x8(%ebp),%eax
    3956:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    395a:	0f b6 d0             	movzbl %al,%edx
    395d:	8b 45 08             	mov    0x8(%ebp),%eax
    3960:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    3964:	0f b6 c0             	movzbl %al,%eax
    3967:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    396b:	89 54 24 0c          	mov    %edx,0xc(%esp)
    396f:	89 44 24 08          	mov    %eax,0x8(%esp)
    3973:	c7 44 24 04 8d b3 00 	movl   $0xb38d,0x4(%esp)
    397a:	00 
    397b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3982:	e8 d7 0d 00 00       	call   475e <printf>
}
    3987:	c9                   	leave  
    3988:	c3                   	ret    

00003989 <freepic>:

void freepic(PICNODE *pic) {
    3989:	55                   	push   %ebp
    398a:	89 e5                	mov    %esp,%ebp
    398c:	83 ec 18             	sub    $0x18,%esp
	free(pic->data);
    398f:	8b 45 08             	mov    0x8(%ebp),%eax
    3992:	8b 00                	mov    (%eax),%eax
    3994:	89 04 24             	mov    %eax,(%esp)
    3997:	e8 75 0f 00 00       	call   4911 <free>
}
    399c:	c9                   	leave  
    399d:	c3                   	ret    

0000399e <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    399e:	55                   	push   %ebp
    399f:	89 e5                	mov    %esp,%ebp
    39a1:	53                   	push   %ebx
    39a2:	81 ec 84 00 00 00    	sub    $0x84,%esp
	int W = 15;
    39a8:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    39af:	8d 45 dc             	lea    -0x24(%ebp),%eax
    39b2:	8b 55 ec             	mov    -0x14(%ebp),%edx
    39b5:	89 54 24 10          	mov    %edx,0x10(%esp)
    39b9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    39bc:	89 54 24 0c          	mov    %edx,0xc(%esp)
    39c0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    39c7:	00 
    39c8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    39cf:	00 
    39d0:	89 04 24             	mov    %eax,(%esp)
    39d3:	e8 80 02 00 00       	call   3c58 <initRect>
    39d8:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    39db:	8b 45 08             	mov    0x8(%ebp),%eax
    39de:	8b 40 04             	mov    0x4(%eax),%eax
    39e1:	2b 45 ec             	sub    -0x14(%ebp),%eax
    39e4:	89 c2                	mov    %eax,%edx
    39e6:	8d 45 cc             	lea    -0x34(%ebp),%eax
    39e9:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    39ec:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    39f0:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    39f3:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    39f7:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    39fe:	00 
    39ff:	89 54 24 04          	mov    %edx,0x4(%esp)
    3a03:	89 04 24             	mov    %eax,(%esp)
    3a06:	e8 4d 02 00 00       	call   3c58 <initRect>
    3a0b:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    3a0e:	8b 45 08             	mov    0x8(%ebp),%eax
    3a11:	8b 40 08             	mov    0x8(%eax),%eax
    3a14:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3a17:	89 c1                	mov    %eax,%ecx
    3a19:	8b 45 08             	mov    0x8(%ebp),%eax
    3a1c:	8b 40 04             	mov    0x4(%eax),%eax
    3a1f:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3a22:	89 c2                	mov    %eax,%edx
    3a24:	8d 45 bc             	lea    -0x44(%ebp),%eax
    3a27:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    3a2a:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    3a2e:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    3a31:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    3a35:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    3a39:	89 54 24 04          	mov    %edx,0x4(%esp)
    3a3d:	89 04 24             	mov    %eax,(%esp)
    3a40:	e8 13 02 00 00       	call   3c58 <initRect>
    3a45:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    3a48:	8b 45 08             	mov    0x8(%ebp),%eax
    3a4b:	8b 40 08             	mov    0x8(%eax),%eax
    3a4e:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3a51:	89 c2                	mov    %eax,%edx
    3a53:	8d 45 ac             	lea    -0x54(%ebp),%eax
    3a56:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    3a59:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    3a5d:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    3a60:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    3a64:	89 54 24 08          	mov    %edx,0x8(%esp)
    3a68:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3a6f:	00 
    3a70:	89 04 24             	mov    %eax,(%esp)
    3a73:	e8 e0 01 00 00       	call   3c58 <initRect>
    3a78:	83 ec 04             	sub    $0x4,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    3a7b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3a82:	e9 96 01 00 00       	jmp    3c1d <set_icon_alpha+0x27f>
		for (j = 0; j < pic->height; j++) {
    3a87:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3a8e:	e9 77 01 00 00       	jmp    3c0a <set_icon_alpha+0x26c>
			p = initPoint(i, j);
    3a93:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3a96:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3a99:	89 54 24 08          	mov    %edx,0x8(%esp)
    3a9d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3aa0:	89 54 24 04          	mov    %edx,0x4(%esp)
    3aa4:	89 04 24             	mov    %eax,(%esp)
    3aa7:	e8 85 01 00 00       	call   3c31 <initPoint>
    3aac:	83 ec 04             	sub    $0x4,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    3aaf:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3ab2:	89 44 24 08          	mov    %eax,0x8(%esp)
    3ab6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3ab9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3abd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3ac0:	89 44 24 10          	mov    %eax,0x10(%esp)
    3ac4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3ac7:	89 44 24 14          	mov    %eax,0x14(%esp)
    3acb:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    3ace:	8b 55 a8             	mov    -0x58(%ebp),%edx
    3ad1:	89 04 24             	mov    %eax,(%esp)
    3ad4:	89 54 24 04          	mov    %edx,0x4(%esp)
    3ad8:	e8 d6 01 00 00       	call   3cb3 <isIn>
    3add:	85 c0                	test   %eax,%eax
    3adf:	0f 85 9a 00 00 00    	jne    3b7f <set_icon_alpha+0x1e1>
    3ae5:	8b 45 cc             	mov    -0x34(%ebp),%eax
    3ae8:	89 44 24 08          	mov    %eax,0x8(%esp)
    3aec:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3aef:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3af3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3af6:	89 44 24 10          	mov    %eax,0x10(%esp)
    3afa:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3afd:	89 44 24 14          	mov    %eax,0x14(%esp)
    3b01:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    3b04:	8b 55 a8             	mov    -0x58(%ebp),%edx
    3b07:	89 04 24             	mov    %eax,(%esp)
    3b0a:	89 54 24 04          	mov    %edx,0x4(%esp)
    3b0e:	e8 a0 01 00 00       	call   3cb3 <isIn>
    3b13:	85 c0                	test   %eax,%eax
    3b15:	75 68                	jne    3b7f <set_icon_alpha+0x1e1>
    3b17:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3b1a:	89 44 24 08          	mov    %eax,0x8(%esp)
    3b1e:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3b21:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3b25:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3b28:	89 44 24 10          	mov    %eax,0x10(%esp)
    3b2c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3b2f:	89 44 24 14          	mov    %eax,0x14(%esp)
    3b33:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    3b36:	8b 55 a8             	mov    -0x58(%ebp),%edx
    3b39:	89 04 24             	mov    %eax,(%esp)
    3b3c:	89 54 24 04          	mov    %edx,0x4(%esp)
    3b40:	e8 6e 01 00 00       	call   3cb3 <isIn>
    3b45:	85 c0                	test   %eax,%eax
    3b47:	75 36                	jne    3b7f <set_icon_alpha+0x1e1>
    3b49:	8b 45 ac             	mov    -0x54(%ebp),%eax
    3b4c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3b50:	8b 45 b0             	mov    -0x50(%ebp),%eax
    3b53:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3b57:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    3b5a:	89 44 24 10          	mov    %eax,0x10(%esp)
    3b5e:	8b 45 b8             	mov    -0x48(%ebp),%eax
    3b61:	89 44 24 14          	mov    %eax,0x14(%esp)
    3b65:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    3b68:	8b 55 a8             	mov    -0x58(%ebp),%edx
    3b6b:	89 04 24             	mov    %eax,(%esp)
    3b6e:	89 54 24 04          	mov    %edx,0x4(%esp)
    3b72:	e8 3c 01 00 00       	call   3cb3 <isIn>
    3b77:	85 c0                	test   %eax,%eax
    3b79:	0f 84 87 00 00 00    	je     3c06 <set_icon_alpha+0x268>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    3b7f:	8b 45 08             	mov    0x8(%ebp),%eax
    3b82:	8b 10                	mov    (%eax),%edx
    3b84:	8b 45 08             	mov    0x8(%ebp),%eax
    3b87:	8b 40 04             	mov    0x4(%eax),%eax
    3b8a:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3b8e:	89 c1                	mov    %eax,%ecx
    3b90:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b93:	01 c8                	add    %ecx,%eax
    3b95:	c1 e0 02             	shl    $0x2,%eax
    3b98:	01 d0                	add    %edx,%eax
    3b9a:	0f b6 00             	movzbl (%eax),%eax
    3b9d:	3c ff                	cmp    $0xff,%al
    3b9f:	75 65                	jne    3c06 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    3ba1:	8b 45 08             	mov    0x8(%ebp),%eax
    3ba4:	8b 10                	mov    (%eax),%edx
    3ba6:	8b 45 08             	mov    0x8(%ebp),%eax
    3ba9:	8b 40 04             	mov    0x4(%eax),%eax
    3bac:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3bb0:	89 c1                	mov    %eax,%ecx
    3bb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3bb5:	01 c8                	add    %ecx,%eax
    3bb7:	c1 e0 02             	shl    $0x2,%eax
    3bba:	01 d0                	add    %edx,%eax
    3bbc:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    3bc0:	3c ff                	cmp    $0xff,%al
    3bc2:	75 42                	jne    3c06 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    3bc4:	8b 45 08             	mov    0x8(%ebp),%eax
    3bc7:	8b 10                	mov    (%eax),%edx
    3bc9:	8b 45 08             	mov    0x8(%ebp),%eax
    3bcc:	8b 40 04             	mov    0x4(%eax),%eax
    3bcf:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3bd3:	89 c1                	mov    %eax,%ecx
    3bd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3bd8:	01 c8                	add    %ecx,%eax
    3bda:	c1 e0 02             	shl    $0x2,%eax
    3bdd:	01 d0                	add    %edx,%eax
    3bdf:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    3be3:	3c ff                	cmp    $0xff,%al
    3be5:	75 1f                	jne    3c06 <set_icon_alpha+0x268>
					pic->data[j * pic->width + i].rgbReserved = 1;
    3be7:	8b 45 08             	mov    0x8(%ebp),%eax
    3bea:	8b 10                	mov    (%eax),%edx
    3bec:	8b 45 08             	mov    0x8(%ebp),%eax
    3bef:	8b 40 04             	mov    0x4(%eax),%eax
    3bf2:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3bf6:	89 c1                	mov    %eax,%ecx
    3bf8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3bfb:	01 c8                	add    %ecx,%eax
    3bfd:	c1 e0 02             	shl    $0x2,%eax
    3c00:	01 d0                	add    %edx,%eax
    3c02:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    3c06:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3c0a:	8b 45 08             	mov    0x8(%ebp),%eax
    3c0d:	8b 40 08             	mov    0x8(%eax),%eax
    3c10:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3c13:	0f 8f 7a fe ff ff    	jg     3a93 <set_icon_alpha+0xf5>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    3c19:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3c1d:	8b 45 08             	mov    0x8(%ebp),%eax
    3c20:	8b 40 04             	mov    0x4(%eax),%eax
    3c23:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3c26:	0f 8f 5b fe ff ff    	jg     3a87 <set_icon_alpha+0xe9>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    3c2c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3c2f:	c9                   	leave  
    3c30:	c3                   	ret    

00003c31 <initPoint>:
#include "context.h"
#include "message.h"
#include "types.h"
#include "user.h"
Point initPoint(int x, int y)
{
    3c31:	55                   	push   %ebp
    3c32:	89 e5                	mov    %esp,%ebp
    3c34:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    3c37:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c3a:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    3c3d:	8b 45 10             	mov    0x10(%ebp),%eax
    3c40:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    3c43:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3c46:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3c49:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3c4c:	89 01                	mov    %eax,(%ecx)
    3c4e:	89 51 04             	mov    %edx,0x4(%ecx)
}
    3c51:	8b 45 08             	mov    0x8(%ebp),%eax
    3c54:	c9                   	leave  
    3c55:	c2 04 00             	ret    $0x4

00003c58 <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    3c58:	55                   	push   %ebp
    3c59:	89 e5                	mov    %esp,%ebp
    3c5b:	83 ec 24             	sub    $0x24,%esp
	Rect r;
	r.start = initPoint(x, y);
    3c5e:	8d 45 e8             	lea    -0x18(%ebp),%eax
    3c61:	8b 55 10             	mov    0x10(%ebp),%edx
    3c64:	89 54 24 08          	mov    %edx,0x8(%esp)
    3c68:	8b 55 0c             	mov    0xc(%ebp),%edx
    3c6b:	89 54 24 04          	mov    %edx,0x4(%esp)
    3c6f:	89 04 24             	mov    %eax,(%esp)
    3c72:	e8 ba ff ff ff       	call   3c31 <initPoint>
    3c77:	83 ec 04             	sub    $0x4,%esp
    3c7a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3c7d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3c80:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3c83:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    3c86:	8b 45 14             	mov    0x14(%ebp),%eax
    3c89:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    3c8c:	8b 45 18             	mov    0x18(%ebp),%eax
    3c8f:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    3c92:	8b 45 08             	mov    0x8(%ebp),%eax
    3c95:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3c98:	89 10                	mov    %edx,(%eax)
    3c9a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3c9d:	89 50 04             	mov    %edx,0x4(%eax)
    3ca0:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3ca3:	89 50 08             	mov    %edx,0x8(%eax)
    3ca6:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3ca9:	89 50 0c             	mov    %edx,0xc(%eax)
}
    3cac:	8b 45 08             	mov    0x8(%ebp),%eax
    3caf:	c9                   	leave  
    3cb0:	c2 04 00             	ret    $0x4

00003cb3 <isIn>:

int isIn(Point p, Rect r)
{
    3cb3:	55                   	push   %ebp
    3cb4:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    3cb6:	8b 55 08             	mov    0x8(%ebp),%edx
    3cb9:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    3cbc:	39 c2                	cmp    %eax,%edx
    3cbe:	7c 2f                	jl     3cef <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    3cc0:	8b 45 08             	mov    0x8(%ebp),%eax
    3cc3:	8b 4d 10             	mov    0x10(%ebp),%ecx
    3cc6:	8b 55 18             	mov    0x18(%ebp),%edx
    3cc9:	01 ca                	add    %ecx,%edx
    3ccb:	39 d0                	cmp    %edx,%eax
    3ccd:	7d 20                	jge    3cef <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    3ccf:	8b 55 0c             	mov    0xc(%ebp),%edx
    3cd2:	8b 45 14             	mov    0x14(%ebp),%eax
    3cd5:	39 c2                	cmp    %eax,%edx
    3cd7:	7c 16                	jl     3cef <isIn+0x3c>
    3cd9:	8b 45 0c             	mov    0xc(%ebp),%eax
    3cdc:	8b 4d 14             	mov    0x14(%ebp),%ecx
    3cdf:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3ce2:	01 ca                	add    %ecx,%edx
    3ce4:	39 d0                	cmp    %edx,%eax
    3ce6:	7d 07                	jge    3cef <isIn+0x3c>
    3ce8:	b8 01 00 00 00       	mov    $0x1,%eax
    3ced:	eb 05                	jmp    3cf4 <isIn+0x41>
    3cef:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3cf4:	5d                   	pop    %ebp
    3cf5:	c3                   	ret    

00003cf6 <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    3cf6:	55                   	push   %ebp
    3cf7:	89 e5                	mov    %esp,%ebp
    3cf9:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    3cfc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    3d03:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    3d0a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    3d11:	8b 45 10             	mov    0x10(%ebp),%eax
    3d14:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    3d17:	8b 45 14             	mov    0x14(%ebp),%eax
    3d1a:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    3d1d:	8b 45 08             	mov    0x8(%ebp),%eax
    3d20:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3d23:	89 10                	mov    %edx,(%eax)
    3d25:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3d28:	89 50 04             	mov    %edx,0x4(%eax)
    3d2b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3d2e:	89 50 08             	mov    %edx,0x8(%eax)
    3d31:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3d34:	89 50 0c             	mov    %edx,0xc(%eax)
    3d37:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3d3a:	89 50 10             	mov    %edx,0x10(%eax)
}
    3d3d:	8b 45 08             	mov    0x8(%ebp),%eax
    3d40:	c9                   	leave  
    3d41:	c2 04 00             	ret    $0x4

00003d44 <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    3d44:	55                   	push   %ebp
    3d45:	89 e5                	mov    %esp,%ebp
    3d47:	83 ec 28             	sub    $0x28,%esp
	switch (MsgType)
    3d4a:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3d4d:	83 f8 03             	cmp    $0x3,%eax
    3d50:	74 72                	je     3dc4 <createClickable+0x80>
    3d52:	83 f8 04             	cmp    $0x4,%eax
    3d55:	74 0a                	je     3d61 <createClickable+0x1d>
    3d57:	83 f8 02             	cmp    $0x2,%eax
    3d5a:	74 38                	je     3d94 <createClickable+0x50>
    3d5c:	e9 96 00 00 00       	jmp    3df7 <createClickable+0xb3>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    3d61:	8b 45 08             	mov    0x8(%ebp),%eax
    3d64:	8d 50 04             	lea    0x4(%eax),%edx
    3d67:	8b 45 20             	mov    0x20(%ebp),%eax
    3d6a:	89 44 24 14          	mov    %eax,0x14(%esp)
    3d6e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d71:	89 44 24 04          	mov    %eax,0x4(%esp)
    3d75:	8b 45 10             	mov    0x10(%ebp),%eax
    3d78:	89 44 24 08          	mov    %eax,0x8(%esp)
    3d7c:	8b 45 14             	mov    0x14(%ebp),%eax
    3d7f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3d83:	8b 45 18             	mov    0x18(%ebp),%eax
    3d86:	89 44 24 10          	mov    %eax,0x10(%esp)
    3d8a:	89 14 24             	mov    %edx,(%esp)
    3d8d:	e8 7c 00 00 00       	call   3e0e <addClickable>
	        break;
    3d92:	eb 78                	jmp    3e0c <createClickable+0xc8>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    3d94:	8b 45 08             	mov    0x8(%ebp),%eax
    3d97:	8b 55 20             	mov    0x20(%ebp),%edx
    3d9a:	89 54 24 14          	mov    %edx,0x14(%esp)
    3d9e:	8b 55 0c             	mov    0xc(%ebp),%edx
    3da1:	89 54 24 04          	mov    %edx,0x4(%esp)
    3da5:	8b 55 10             	mov    0x10(%ebp),%edx
    3da8:	89 54 24 08          	mov    %edx,0x8(%esp)
    3dac:	8b 55 14             	mov    0x14(%ebp),%edx
    3daf:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3db3:	8b 55 18             	mov    0x18(%ebp),%edx
    3db6:	89 54 24 10          	mov    %edx,0x10(%esp)
    3dba:	89 04 24             	mov    %eax,(%esp)
    3dbd:	e8 4c 00 00 00       	call   3e0e <addClickable>
	    	break;
    3dc2:	eb 48                	jmp    3e0c <createClickable+0xc8>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    3dc4:	8b 45 08             	mov    0x8(%ebp),%eax
    3dc7:	8d 50 08             	lea    0x8(%eax),%edx
    3dca:	8b 45 20             	mov    0x20(%ebp),%eax
    3dcd:	89 44 24 14          	mov    %eax,0x14(%esp)
    3dd1:	8b 45 0c             	mov    0xc(%ebp),%eax
    3dd4:	89 44 24 04          	mov    %eax,0x4(%esp)
    3dd8:	8b 45 10             	mov    0x10(%ebp),%eax
    3ddb:	89 44 24 08          	mov    %eax,0x8(%esp)
    3ddf:	8b 45 14             	mov    0x14(%ebp),%eax
    3de2:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3de6:	8b 45 18             	mov    0x18(%ebp),%eax
    3de9:	89 44 24 10          	mov    %eax,0x10(%esp)
    3ded:	89 14 24             	mov    %edx,(%esp)
    3df0:	e8 19 00 00 00       	call   3e0e <addClickable>
	    	break;
    3df5:	eb 15                	jmp    3e0c <createClickable+0xc8>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    3df7:	c7 44 24 04 9c b3 00 	movl   $0xb39c,0x4(%esp)
    3dfe:	00 
    3dff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e06:	e8 53 09 00 00       	call   475e <printf>
	    	break;
    3e0b:	90                   	nop
	}
}
    3e0c:	c9                   	leave  
    3e0d:	c3                   	ret    

00003e0e <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    3e0e:	55                   	push   %ebp
    3e0f:	89 e5                	mov    %esp,%ebp
    3e11:	83 ec 28             	sub    $0x28,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    3e14:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
    3e1b:	e8 2a 0c 00 00       	call   4a4a <malloc>
    3e20:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    3e23:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e26:	8b 55 0c             	mov    0xc(%ebp),%edx
    3e29:	89 10                	mov    %edx,(%eax)
    3e2b:	8b 55 10             	mov    0x10(%ebp),%edx
    3e2e:	89 50 04             	mov    %edx,0x4(%eax)
    3e31:	8b 55 14             	mov    0x14(%ebp),%edx
    3e34:	89 50 08             	mov    %edx,0x8(%eax)
    3e37:	8b 55 18             	mov    0x18(%ebp),%edx
    3e3a:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    3e3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e40:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3e43:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    3e46:	8b 45 08             	mov    0x8(%ebp),%eax
    3e49:	8b 10                	mov    (%eax),%edx
    3e4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e4e:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    3e51:	8b 45 08             	mov    0x8(%ebp),%eax
    3e54:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3e57:	89 10                	mov    %edx,(%eax)
}
    3e59:	c9                   	leave  
    3e5a:	c3                   	ret    

00003e5b <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    3e5b:	55                   	push   %ebp
    3e5c:	89 e5                	mov    %esp,%ebp
    3e5e:	83 ec 38             	sub    $0x38,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    3e61:	8b 45 08             	mov    0x8(%ebp),%eax
    3e64:	8b 00                	mov    (%eax),%eax
    3e66:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3e69:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3e6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    3e6f:	e9 bb 00 00 00       	jmp    3f2f <deleteClickable+0xd4>
	{
		if (isIn(cur->area.start, region))
    3e74:	8b 45 0c             	mov    0xc(%ebp),%eax
    3e77:	89 44 24 08          	mov    %eax,0x8(%esp)
    3e7b:	8b 45 10             	mov    0x10(%ebp),%eax
    3e7e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3e82:	8b 45 14             	mov    0x14(%ebp),%eax
    3e85:	89 44 24 10          	mov    %eax,0x10(%esp)
    3e89:	8b 45 18             	mov    0x18(%ebp),%eax
    3e8c:	89 44 24 14          	mov    %eax,0x14(%esp)
    3e90:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3e93:	8b 50 04             	mov    0x4(%eax),%edx
    3e96:	8b 00                	mov    (%eax),%eax
    3e98:	89 04 24             	mov    %eax,(%esp)
    3e9b:	89 54 24 04          	mov    %edx,0x4(%esp)
    3e9f:	e8 0f fe ff ff       	call   3cb3 <isIn>
    3ea4:	85 c0                	test   %eax,%eax
    3ea6:	74 60                	je     3f08 <deleteClickable+0xad>
		{
			//如果当前指针指向头部
			if (cur == *head)
    3ea8:	8b 45 08             	mov    0x8(%ebp),%eax
    3eab:	8b 00                	mov    (%eax),%eax
    3ead:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3eb0:	75 2e                	jne    3ee0 <deleteClickable+0x85>
			{
				//删除头节点
				temp = *head;
    3eb2:	8b 45 08             	mov    0x8(%ebp),%eax
    3eb5:	8b 00                	mov    (%eax),%eax
    3eb7:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    3eba:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ebd:	8b 50 14             	mov    0x14(%eax),%edx
    3ec0:	8b 45 08             	mov    0x8(%ebp),%eax
    3ec3:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    3ec5:	8b 45 08             	mov    0x8(%ebp),%eax
    3ec8:	8b 00                	mov    (%eax),%eax
    3eca:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3ecd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ed0:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    3ed3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3ed6:	89 04 24             	mov    %eax,(%esp)
    3ed9:	e8 33 0a 00 00       	call   4911 <free>
    3ede:	eb 4f                	jmp    3f2f <deleteClickable+0xd4>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    3ee0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ee3:	8b 50 14             	mov    0x14(%eax),%edx
    3ee6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ee9:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    3eec:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3eef:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    3ef2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ef5:	8b 40 14             	mov    0x14(%eax),%eax
    3ef8:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    3efb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3efe:	89 04 24             	mov    %eax,(%esp)
    3f01:	e8 0b 0a 00 00       	call   4911 <free>
    3f06:	eb 27                	jmp    3f2f <deleteClickable+0xd4>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    3f08:	8b 45 08             	mov    0x8(%ebp),%eax
    3f0b:	8b 00                	mov    (%eax),%eax
    3f0d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3f10:	75 0b                	jne    3f1d <deleteClickable+0xc2>
			{
				cur = cur->next;
    3f12:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3f15:	8b 40 14             	mov    0x14(%eax),%eax
    3f18:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3f1b:	eb 12                	jmp    3f2f <deleteClickable+0xd4>
			}
			else
			{
				cur = cur->next;
    3f1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3f20:	8b 40 14             	mov    0x14(%eax),%eax
    3f23:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    3f26:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f29:	8b 40 14             	mov    0x14(%eax),%eax
    3f2c:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    3f2f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3f33:	0f 85 3b ff ff ff    	jne    3e74 <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    3f39:	c9                   	leave  
    3f3a:	c3                   	ret    

00003f3b <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    3f3b:	55                   	push   %ebp
    3f3c:	89 e5                	mov    %esp,%ebp
    3f3e:	83 ec 38             	sub    $0x38,%esp
	Clickable *cur = head;
    3f41:	8b 45 08             	mov    0x8(%ebp),%eax
    3f44:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    3f47:	eb 59                	jmp    3fa2 <executeHandler+0x67>
	{
		if (isIn(click, cur->area))
    3f49:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f4c:	8b 10                	mov    (%eax),%edx
    3f4e:	89 54 24 08          	mov    %edx,0x8(%esp)
    3f52:	8b 50 04             	mov    0x4(%eax),%edx
    3f55:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3f59:	8b 50 08             	mov    0x8(%eax),%edx
    3f5c:	89 54 24 10          	mov    %edx,0x10(%esp)
    3f60:	8b 40 0c             	mov    0xc(%eax),%eax
    3f63:	89 44 24 14          	mov    %eax,0x14(%esp)
    3f67:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f6a:	8b 55 10             	mov    0x10(%ebp),%edx
    3f6d:	89 04 24             	mov    %eax,(%esp)
    3f70:	89 54 24 04          	mov    %edx,0x4(%esp)
    3f74:	e8 3a fd ff ff       	call   3cb3 <isIn>
    3f79:	85 c0                	test   %eax,%eax
    3f7b:	74 1c                	je     3f99 <executeHandler+0x5e>
		{
			cur->handler(click);
    3f7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f80:	8b 48 10             	mov    0x10(%eax),%ecx
    3f83:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f86:	8b 55 10             	mov    0x10(%ebp),%edx
    3f89:	89 04 24             	mov    %eax,(%esp)
    3f8c:	89 54 24 04          	mov    %edx,0x4(%esp)
    3f90:	ff d1                	call   *%ecx
			return 1;
    3f92:	b8 01 00 00 00       	mov    $0x1,%eax
    3f97:	eb 28                	jmp    3fc1 <executeHandler+0x86>
		}
		cur = cur->next;
    3f99:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f9c:	8b 40 14             	mov    0x14(%eax),%eax
    3f9f:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    3fa2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3fa6:	75 a1                	jne    3f49 <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	printf(0, "execute: none!\n");
    3fa8:	c7 44 24 04 ca b3 00 	movl   $0xb3ca,0x4(%esp)
    3faf:	00 
    3fb0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3fb7:	e8 a2 07 00 00       	call   475e <printf>
	return 0;
    3fbc:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3fc1:	c9                   	leave  
    3fc2:	c3                   	ret    

00003fc3 <printClickable>:

void printClickable(Clickable *c)
{
    3fc3:	55                   	push   %ebp
    3fc4:	89 e5                	mov    %esp,%ebp
    3fc6:	53                   	push   %ebx
    3fc7:	83 ec 24             	sub    $0x24,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    3fca:	8b 45 08             	mov    0x8(%ebp),%eax
    3fcd:	8b 58 0c             	mov    0xc(%eax),%ebx
    3fd0:	8b 45 08             	mov    0x8(%ebp),%eax
    3fd3:	8b 48 08             	mov    0x8(%eax),%ecx
    3fd6:	8b 45 08             	mov    0x8(%ebp),%eax
    3fd9:	8b 50 04             	mov    0x4(%eax),%edx
    3fdc:	8b 45 08             	mov    0x8(%ebp),%eax
    3fdf:	8b 00                	mov    (%eax),%eax
    3fe1:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    3fe5:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    3fe9:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3fed:	89 44 24 08          	mov    %eax,0x8(%esp)
    3ff1:	c7 44 24 04 da b3 00 	movl   $0xb3da,0x4(%esp)
    3ff8:	00 
    3ff9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4000:	e8 59 07 00 00       	call   475e <printf>
}
    4005:	83 c4 24             	add    $0x24,%esp
    4008:	5b                   	pop    %ebx
    4009:	5d                   	pop    %ebp
    400a:	c3                   	ret    

0000400b <printClickableList>:

void printClickableList(Clickable *head)
{
    400b:	55                   	push   %ebp
    400c:	89 e5                	mov    %esp,%ebp
    400e:	83 ec 28             	sub    $0x28,%esp
	Clickable *cur = head;
    4011:	8b 45 08             	mov    0x8(%ebp),%eax
    4014:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    4017:	c7 44 24 04 ec b3 00 	movl   $0xb3ec,0x4(%esp)
    401e:	00 
    401f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4026:	e8 33 07 00 00       	call   475e <printf>
	while(cur != 0)
    402b:	eb 14                	jmp    4041 <printClickableList+0x36>
	{
		printClickable(cur);
    402d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4030:	89 04 24             	mov    %eax,(%esp)
    4033:	e8 8b ff ff ff       	call   3fc3 <printClickable>
		cur = cur->next;
    4038:	8b 45 f4             	mov    -0xc(%ebp),%eax
    403b:	8b 40 14             	mov    0x14(%eax),%eax
    403e:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    4041:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4045:	75 e6                	jne    402d <printClickableList+0x22>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    4047:	c7 44 24 04 fd b3 00 	movl   $0xb3fd,0x4(%esp)
    404e:	00 
    404f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4056:	e8 03 07 00 00       	call   475e <printf>
}
    405b:	c9                   	leave  
    405c:	c3                   	ret    

0000405d <testHanler>:

void testHanler(struct Point p)
{
    405d:	55                   	push   %ebp
    405e:	89 e5                	mov    %esp,%ebp
    4060:	83 ec 18             	sub    $0x18,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    4063:	8b 55 0c             	mov    0xc(%ebp),%edx
    4066:	8b 45 08             	mov    0x8(%ebp),%eax
    4069:	89 54 24 0c          	mov    %edx,0xc(%esp)
    406d:	89 44 24 08          	mov    %eax,0x8(%esp)
    4071:	c7 44 24 04 ff b3 00 	movl   $0xb3ff,0x4(%esp)
    4078:	00 
    4079:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4080:	e8 d9 06 00 00       	call   475e <printf>
}
    4085:	c9                   	leave  
    4086:	c3                   	ret    

00004087 <testClickable>:
void testClickable(struct Context c)
{
    4087:	55                   	push   %ebp
    4088:	89 e5                	mov    %esp,%ebp
    408a:	81 ec 98 00 00 00    	sub    $0x98,%esp
	ClickableManager cm = initClickManager(c);
    4090:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4093:	8b 55 08             	mov    0x8(%ebp),%edx
    4096:	89 54 24 04          	mov    %edx,0x4(%esp)
    409a:	8b 55 0c             	mov    0xc(%ebp),%edx
    409d:	89 54 24 08          	mov    %edx,0x8(%esp)
    40a1:	8b 55 10             	mov    0x10(%ebp),%edx
    40a4:	89 54 24 0c          	mov    %edx,0xc(%esp)
    40a8:	89 04 24             	mov    %eax,(%esp)
    40ab:	e8 46 fc ff ff       	call   3cf6 <initClickManager>
    40b0:	83 ec 04             	sub    $0x4,%esp

	Rect r1 = initRect(5,5,20,20);
    40b3:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    40b6:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    40bd:	00 
    40be:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    40c5:	00 
    40c6:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    40cd:	00 
    40ce:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    40d5:	00 
    40d6:	89 04 24             	mov    %eax,(%esp)
    40d9:	e8 7a fb ff ff       	call   3c58 <initRect>
    40de:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(20,20,20,20);
    40e1:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    40e4:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    40eb:	00 
    40ec:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    40f3:	00 
    40f4:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
    40fb:	00 
    40fc:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
    4103:	00 
    4104:	89 04 24             	mov    %eax,(%esp)
    4107:	e8 4c fb ff ff       	call   3c58 <initRect>
    410c:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(50,50,15,15);
    410f:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    4112:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
    4119:	00 
    411a:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%esp)
    4121:	00 
    4122:	c7 44 24 08 32 00 00 	movl   $0x32,0x8(%esp)
    4129:	00 
    412a:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
    4131:	00 
    4132:	89 04 24             	mov    %eax,(%esp)
    4135:	e8 1e fb ff ff       	call   3c58 <initRect>
    413a:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0,0,30,30);
    413d:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4140:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    4147:	00 
    4148:	c7 44 24 0c 1e 00 00 	movl   $0x1e,0xc(%esp)
    414f:	00 
    4150:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    4157:	00 
    4158:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    415f:	00 
    4160:	89 04 24             	mov    %eax,(%esp)
    4163:	e8 f0 fa ff ff       	call   3c58 <initRect>
    4168:	83 ec 04             	sub    $0x4,%esp
	Point p1 = initPoint(23, 23);
    416b:	8d 45 9c             	lea    -0x64(%ebp),%eax
    416e:	c7 44 24 08 17 00 00 	movl   $0x17,0x8(%esp)
    4175:	00 
    4176:	c7 44 24 04 17 00 00 	movl   $0x17,0x4(%esp)
    417d:	00 
    417e:	89 04 24             	mov    %eax,(%esp)
    4181:	e8 ab fa ff ff       	call   3c31 <initPoint>
    4186:	83 ec 04             	sub    $0x4,%esp
	Point p2 = initPoint(70, 70);
    4189:	8d 45 94             	lea    -0x6c(%ebp),%eax
    418c:	c7 44 24 08 46 00 00 	movl   $0x46,0x8(%esp)
    4193:	00 
    4194:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
    419b:	00 
    419c:	89 04 24             	mov    %eax,(%esp)
    419f:	e8 8d fa ff ff       	call   3c31 <initPoint>
    41a4:	83 ec 04             	sub    $0x4,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    41a7:	c7 44 24 18 5d 40 00 	movl   $0x405d,0x18(%esp)
    41ae:	00 
    41af:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    41b6:	00 
    41b7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    41ba:	89 44 24 04          	mov    %eax,0x4(%esp)
    41be:	8b 45 d8             	mov    -0x28(%ebp),%eax
    41c1:	89 44 24 08          	mov    %eax,0x8(%esp)
    41c5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    41c8:	89 44 24 0c          	mov    %eax,0xc(%esp)
    41cc:	8b 45 e0             	mov    -0x20(%ebp),%eax
    41cf:	89 44 24 10          	mov    %eax,0x10(%esp)
    41d3:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    41d6:	89 04 24             	mov    %eax,(%esp)
    41d9:	e8 66 fb ff ff       	call   3d44 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    41de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    41e1:	89 44 24 08          	mov    %eax,0x8(%esp)
    41e5:	c7 44 24 04 13 b4 00 	movl   $0xb413,0x4(%esp)
    41ec:	00 
    41ed:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    41f4:	e8 65 05 00 00       	call   475e <printf>
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    41f9:	c7 44 24 18 5d 40 00 	movl   $0x405d,0x18(%esp)
    4200:	00 
    4201:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    4208:	00 
    4209:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    420c:	89 44 24 04          	mov    %eax,0x4(%esp)
    4210:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4213:	89 44 24 08          	mov    %eax,0x8(%esp)
    4217:	8b 45 cc             	mov    -0x34(%ebp),%eax
    421a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    421e:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4221:	89 44 24 10          	mov    %eax,0x10(%esp)
    4225:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    4228:	89 04 24             	mov    %eax,(%esp)
    422b:	e8 14 fb ff ff       	call   3d44 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    4230:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4233:	89 44 24 08          	mov    %eax,0x8(%esp)
    4237:	c7 44 24 04 13 b4 00 	movl   $0xb413,0x4(%esp)
    423e:	00 
    423f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4246:	e8 13 05 00 00       	call   475e <printf>
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    424b:	c7 44 24 18 5d 40 00 	movl   $0x405d,0x18(%esp)
    4252:	00 
    4253:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    425a:	00 
    425b:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    425e:	89 44 24 04          	mov    %eax,0x4(%esp)
    4262:	8b 45 b8             	mov    -0x48(%ebp),%eax
    4265:	89 44 24 08          	mov    %eax,0x8(%esp)
    4269:	8b 45 bc             	mov    -0x44(%ebp),%eax
    426c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4270:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4273:	89 44 24 10          	mov    %eax,0x10(%esp)
    4277:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    427a:	89 04 24             	mov    %eax,(%esp)
    427d:	e8 c2 fa ff ff       	call   3d44 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    4282:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4285:	89 44 24 08          	mov    %eax,0x8(%esp)
    4289:	c7 44 24 04 13 b4 00 	movl   $0xb413,0x4(%esp)
    4290:	00 
    4291:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4298:	e8 c1 04 00 00       	call   475e <printf>
	printClickableList(cm.left_click);
    429d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    42a0:	89 04 24             	mov    %eax,(%esp)
    42a3:	e8 63 fd ff ff       	call   400b <printClickableList>
	executeHandler(cm.left_click, p1);
    42a8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    42ab:	8b 45 9c             	mov    -0x64(%ebp),%eax
    42ae:	8b 55 a0             	mov    -0x60(%ebp),%edx
    42b1:	89 44 24 04          	mov    %eax,0x4(%esp)
    42b5:	89 54 24 08          	mov    %edx,0x8(%esp)
    42b9:	89 0c 24             	mov    %ecx,(%esp)
    42bc:	e8 7a fc ff ff       	call   3f3b <executeHandler>
	executeHandler(cm.left_click, p2);
    42c1:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    42c4:	8b 45 94             	mov    -0x6c(%ebp),%eax
    42c7:	8b 55 98             	mov    -0x68(%ebp),%edx
    42ca:	89 44 24 04          	mov    %eax,0x4(%esp)
    42ce:	89 54 24 08          	mov    %edx,0x8(%esp)
    42d2:	89 0c 24             	mov    %ecx,(%esp)
    42d5:	e8 61 fc ff ff       	call   3f3b <executeHandler>
	deleteClickable(&cm.left_click, r4);
    42da:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    42dd:	89 44 24 04          	mov    %eax,0x4(%esp)
    42e1:	8b 45 a8             	mov    -0x58(%ebp),%eax
    42e4:	89 44 24 08          	mov    %eax,0x8(%esp)
    42e8:	8b 45 ac             	mov    -0x54(%ebp),%eax
    42eb:	89 44 24 0c          	mov    %eax,0xc(%esp)
    42ef:	8b 45 b0             	mov    -0x50(%ebp),%eax
    42f2:	89 44 24 10          	mov    %eax,0x10(%esp)
    42f6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    42f9:	89 04 24             	mov    %eax,(%esp)
    42fc:	e8 5a fb ff ff       	call   3e5b <deleteClickable>
	printClickableList(cm.left_click);
    4301:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4304:	89 04 24             	mov    %eax,(%esp)
    4307:	e8 ff fc ff ff       	call   400b <printClickableList>
}
    430c:	c9                   	leave  
    430d:	c3                   	ret    

0000430e <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    430e:	55                   	push   %ebp
    430f:	89 e5                	mov    %esp,%ebp
    4311:	57                   	push   %edi
    4312:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    4313:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4316:	8b 55 10             	mov    0x10(%ebp),%edx
    4319:	8b 45 0c             	mov    0xc(%ebp),%eax
    431c:	89 cb                	mov    %ecx,%ebx
    431e:	89 df                	mov    %ebx,%edi
    4320:	89 d1                	mov    %edx,%ecx
    4322:	fc                   	cld    
    4323:	f3 aa                	rep stos %al,%es:(%edi)
    4325:	89 ca                	mov    %ecx,%edx
    4327:	89 fb                	mov    %edi,%ebx
    4329:	89 5d 08             	mov    %ebx,0x8(%ebp)
    432c:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    432f:	5b                   	pop    %ebx
    4330:	5f                   	pop    %edi
    4331:	5d                   	pop    %ebp
    4332:	c3                   	ret    

00004333 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    4333:	55                   	push   %ebp
    4334:	89 e5                	mov    %esp,%ebp
    4336:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    4339:	8b 45 08             	mov    0x8(%ebp),%eax
    433c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    433f:	90                   	nop
    4340:	8b 45 08             	mov    0x8(%ebp),%eax
    4343:	8d 50 01             	lea    0x1(%eax),%edx
    4346:	89 55 08             	mov    %edx,0x8(%ebp)
    4349:	8b 55 0c             	mov    0xc(%ebp),%edx
    434c:	8d 4a 01             	lea    0x1(%edx),%ecx
    434f:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    4352:	0f b6 12             	movzbl (%edx),%edx
    4355:	88 10                	mov    %dl,(%eax)
    4357:	0f b6 00             	movzbl (%eax),%eax
    435a:	84 c0                	test   %al,%al
    435c:	75 e2                	jne    4340 <strcpy+0xd>
    ;
  return os;
    435e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4361:	c9                   	leave  
    4362:	c3                   	ret    

00004363 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    4363:	55                   	push   %ebp
    4364:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    4366:	eb 08                	jmp    4370 <strcmp+0xd>
    p++, q++;
    4368:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    436c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    4370:	8b 45 08             	mov    0x8(%ebp),%eax
    4373:	0f b6 00             	movzbl (%eax),%eax
    4376:	84 c0                	test   %al,%al
    4378:	74 10                	je     438a <strcmp+0x27>
    437a:	8b 45 08             	mov    0x8(%ebp),%eax
    437d:	0f b6 10             	movzbl (%eax),%edx
    4380:	8b 45 0c             	mov    0xc(%ebp),%eax
    4383:	0f b6 00             	movzbl (%eax),%eax
    4386:	38 c2                	cmp    %al,%dl
    4388:	74 de                	je     4368 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    438a:	8b 45 08             	mov    0x8(%ebp),%eax
    438d:	0f b6 00             	movzbl (%eax),%eax
    4390:	0f b6 d0             	movzbl %al,%edx
    4393:	8b 45 0c             	mov    0xc(%ebp),%eax
    4396:	0f b6 00             	movzbl (%eax),%eax
    4399:	0f b6 c0             	movzbl %al,%eax
    439c:	29 c2                	sub    %eax,%edx
    439e:	89 d0                	mov    %edx,%eax
}
    43a0:	5d                   	pop    %ebp
    43a1:	c3                   	ret    

000043a2 <strlen>:

uint
strlen(char *s)
{
    43a2:	55                   	push   %ebp
    43a3:	89 e5                	mov    %esp,%ebp
    43a5:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    43a8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    43af:	eb 04                	jmp    43b5 <strlen+0x13>
    43b1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    43b5:	8b 55 fc             	mov    -0x4(%ebp),%edx
    43b8:	8b 45 08             	mov    0x8(%ebp),%eax
    43bb:	01 d0                	add    %edx,%eax
    43bd:	0f b6 00             	movzbl (%eax),%eax
    43c0:	84 c0                	test   %al,%al
    43c2:	75 ed                	jne    43b1 <strlen+0xf>
    ;
  return n;
    43c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    43c7:	c9                   	leave  
    43c8:	c3                   	ret    

000043c9 <memset>:

void*
memset(void *dst, int c, uint n)
{
    43c9:	55                   	push   %ebp
    43ca:	89 e5                	mov    %esp,%ebp
    43cc:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    43cf:	8b 45 10             	mov    0x10(%ebp),%eax
    43d2:	89 44 24 08          	mov    %eax,0x8(%esp)
    43d6:	8b 45 0c             	mov    0xc(%ebp),%eax
    43d9:	89 44 24 04          	mov    %eax,0x4(%esp)
    43dd:	8b 45 08             	mov    0x8(%ebp),%eax
    43e0:	89 04 24             	mov    %eax,(%esp)
    43e3:	e8 26 ff ff ff       	call   430e <stosb>
  return dst;
    43e8:	8b 45 08             	mov    0x8(%ebp),%eax
}
    43eb:	c9                   	leave  
    43ec:	c3                   	ret    

000043ed <strchr>:

char*
strchr(const char *s, char c)
{
    43ed:	55                   	push   %ebp
    43ee:	89 e5                	mov    %esp,%ebp
    43f0:	83 ec 04             	sub    $0x4,%esp
    43f3:	8b 45 0c             	mov    0xc(%ebp),%eax
    43f6:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    43f9:	eb 14                	jmp    440f <strchr+0x22>
    if(*s == c)
    43fb:	8b 45 08             	mov    0x8(%ebp),%eax
    43fe:	0f b6 00             	movzbl (%eax),%eax
    4401:	3a 45 fc             	cmp    -0x4(%ebp),%al
    4404:	75 05                	jne    440b <strchr+0x1e>
      return (char*)s;
    4406:	8b 45 08             	mov    0x8(%ebp),%eax
    4409:	eb 13                	jmp    441e <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    440b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    440f:	8b 45 08             	mov    0x8(%ebp),%eax
    4412:	0f b6 00             	movzbl (%eax),%eax
    4415:	84 c0                	test   %al,%al
    4417:	75 e2                	jne    43fb <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    4419:	b8 00 00 00 00       	mov    $0x0,%eax
}
    441e:	c9                   	leave  
    441f:	c3                   	ret    

00004420 <gets>:

char*
gets(char *buf, int max)
{
    4420:	55                   	push   %ebp
    4421:	89 e5                	mov    %esp,%ebp
    4423:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4426:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    442d:	eb 4c                	jmp    447b <gets+0x5b>
    cc = read(0, &c, 1);
    442f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4436:	00 
    4437:	8d 45 ef             	lea    -0x11(%ebp),%eax
    443a:	89 44 24 04          	mov    %eax,0x4(%esp)
    443e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4445:	e8 44 01 00 00       	call   458e <read>
    444a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    444d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4451:	7f 02                	jg     4455 <gets+0x35>
      break;
    4453:	eb 31                	jmp    4486 <gets+0x66>
    buf[i++] = c;
    4455:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4458:	8d 50 01             	lea    0x1(%eax),%edx
    445b:	89 55 f4             	mov    %edx,-0xc(%ebp)
    445e:	89 c2                	mov    %eax,%edx
    4460:	8b 45 08             	mov    0x8(%ebp),%eax
    4463:	01 c2                	add    %eax,%edx
    4465:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4469:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    446b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    446f:	3c 0a                	cmp    $0xa,%al
    4471:	74 13                	je     4486 <gets+0x66>
    4473:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4477:	3c 0d                	cmp    $0xd,%al
    4479:	74 0b                	je     4486 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    447b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    447e:	83 c0 01             	add    $0x1,%eax
    4481:	3b 45 0c             	cmp    0xc(%ebp),%eax
    4484:	7c a9                	jl     442f <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    4486:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4489:	8b 45 08             	mov    0x8(%ebp),%eax
    448c:	01 d0                	add    %edx,%eax
    448e:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    4491:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4494:	c9                   	leave  
    4495:	c3                   	ret    

00004496 <stat>:

int
stat(char *n, struct stat *st)
{
    4496:	55                   	push   %ebp
    4497:	89 e5                	mov    %esp,%ebp
    4499:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    449c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    44a3:	00 
    44a4:	8b 45 08             	mov    0x8(%ebp),%eax
    44a7:	89 04 24             	mov    %eax,(%esp)
    44aa:	e8 07 01 00 00       	call   45b6 <open>
    44af:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    44b2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    44b6:	79 07                	jns    44bf <stat+0x29>
    return -1;
    44b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    44bd:	eb 23                	jmp    44e2 <stat+0x4c>
  r = fstat(fd, st);
    44bf:	8b 45 0c             	mov    0xc(%ebp),%eax
    44c2:	89 44 24 04          	mov    %eax,0x4(%esp)
    44c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44c9:	89 04 24             	mov    %eax,(%esp)
    44cc:	e8 fd 00 00 00       	call   45ce <fstat>
    44d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    44d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44d7:	89 04 24             	mov    %eax,(%esp)
    44da:	e8 bf 00 00 00       	call   459e <close>
  return r;
    44df:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    44e2:	c9                   	leave  
    44e3:	c3                   	ret    

000044e4 <atoi>:

int
atoi(const char *s)
{
    44e4:	55                   	push   %ebp
    44e5:	89 e5                	mov    %esp,%ebp
    44e7:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    44ea:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    44f1:	eb 25                	jmp    4518 <atoi+0x34>
    n = n*10 + *s++ - '0';
    44f3:	8b 55 fc             	mov    -0x4(%ebp),%edx
    44f6:	89 d0                	mov    %edx,%eax
    44f8:	c1 e0 02             	shl    $0x2,%eax
    44fb:	01 d0                	add    %edx,%eax
    44fd:	01 c0                	add    %eax,%eax
    44ff:	89 c1                	mov    %eax,%ecx
    4501:	8b 45 08             	mov    0x8(%ebp),%eax
    4504:	8d 50 01             	lea    0x1(%eax),%edx
    4507:	89 55 08             	mov    %edx,0x8(%ebp)
    450a:	0f b6 00             	movzbl (%eax),%eax
    450d:	0f be c0             	movsbl %al,%eax
    4510:	01 c8                	add    %ecx,%eax
    4512:	83 e8 30             	sub    $0x30,%eax
    4515:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    4518:	8b 45 08             	mov    0x8(%ebp),%eax
    451b:	0f b6 00             	movzbl (%eax),%eax
    451e:	3c 2f                	cmp    $0x2f,%al
    4520:	7e 0a                	jle    452c <atoi+0x48>
    4522:	8b 45 08             	mov    0x8(%ebp),%eax
    4525:	0f b6 00             	movzbl (%eax),%eax
    4528:	3c 39                	cmp    $0x39,%al
    452a:	7e c7                	jle    44f3 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    452c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    452f:	c9                   	leave  
    4530:	c3                   	ret    

00004531 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    4531:	55                   	push   %ebp
    4532:	89 e5                	mov    %esp,%ebp
    4534:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    4537:	8b 45 08             	mov    0x8(%ebp),%eax
    453a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    453d:	8b 45 0c             	mov    0xc(%ebp),%eax
    4540:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    4543:	eb 17                	jmp    455c <memmove+0x2b>
    *dst++ = *src++;
    4545:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4548:	8d 50 01             	lea    0x1(%eax),%edx
    454b:	89 55 fc             	mov    %edx,-0x4(%ebp)
    454e:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4551:	8d 4a 01             	lea    0x1(%edx),%ecx
    4554:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    4557:	0f b6 12             	movzbl (%edx),%edx
    455a:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    455c:	8b 45 10             	mov    0x10(%ebp),%eax
    455f:	8d 50 ff             	lea    -0x1(%eax),%edx
    4562:	89 55 10             	mov    %edx,0x10(%ebp)
    4565:	85 c0                	test   %eax,%eax
    4567:	7f dc                	jg     4545 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    4569:	8b 45 08             	mov    0x8(%ebp),%eax
}
    456c:	c9                   	leave  
    456d:	c3                   	ret    

0000456e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    456e:	b8 01 00 00 00       	mov    $0x1,%eax
    4573:	cd 40                	int    $0x40
    4575:	c3                   	ret    

00004576 <exit>:
SYSCALL(exit)
    4576:	b8 02 00 00 00       	mov    $0x2,%eax
    457b:	cd 40                	int    $0x40
    457d:	c3                   	ret    

0000457e <wait>:
SYSCALL(wait)
    457e:	b8 03 00 00 00       	mov    $0x3,%eax
    4583:	cd 40                	int    $0x40
    4585:	c3                   	ret    

00004586 <pipe>:
SYSCALL(pipe)
    4586:	b8 04 00 00 00       	mov    $0x4,%eax
    458b:	cd 40                	int    $0x40
    458d:	c3                   	ret    

0000458e <read>:
SYSCALL(read)
    458e:	b8 05 00 00 00       	mov    $0x5,%eax
    4593:	cd 40                	int    $0x40
    4595:	c3                   	ret    

00004596 <write>:
SYSCALL(write)
    4596:	b8 10 00 00 00       	mov    $0x10,%eax
    459b:	cd 40                	int    $0x40
    459d:	c3                   	ret    

0000459e <close>:
SYSCALL(close)
    459e:	b8 15 00 00 00       	mov    $0x15,%eax
    45a3:	cd 40                	int    $0x40
    45a5:	c3                   	ret    

000045a6 <kill>:
SYSCALL(kill)
    45a6:	b8 06 00 00 00       	mov    $0x6,%eax
    45ab:	cd 40                	int    $0x40
    45ad:	c3                   	ret    

000045ae <exec>:
SYSCALL(exec)
    45ae:	b8 07 00 00 00       	mov    $0x7,%eax
    45b3:	cd 40                	int    $0x40
    45b5:	c3                   	ret    

000045b6 <open>:
SYSCALL(open)
    45b6:	b8 0f 00 00 00       	mov    $0xf,%eax
    45bb:	cd 40                	int    $0x40
    45bd:	c3                   	ret    

000045be <mknod>:
SYSCALL(mknod)
    45be:	b8 11 00 00 00       	mov    $0x11,%eax
    45c3:	cd 40                	int    $0x40
    45c5:	c3                   	ret    

000045c6 <unlink>:
SYSCALL(unlink)
    45c6:	b8 12 00 00 00       	mov    $0x12,%eax
    45cb:	cd 40                	int    $0x40
    45cd:	c3                   	ret    

000045ce <fstat>:
SYSCALL(fstat)
    45ce:	b8 08 00 00 00       	mov    $0x8,%eax
    45d3:	cd 40                	int    $0x40
    45d5:	c3                   	ret    

000045d6 <link>:
SYSCALL(link)
    45d6:	b8 13 00 00 00       	mov    $0x13,%eax
    45db:	cd 40                	int    $0x40
    45dd:	c3                   	ret    

000045de <mkdir>:
SYSCALL(mkdir)
    45de:	b8 14 00 00 00       	mov    $0x14,%eax
    45e3:	cd 40                	int    $0x40
    45e5:	c3                   	ret    

000045e6 <chdir>:
SYSCALL(chdir)
    45e6:	b8 09 00 00 00       	mov    $0x9,%eax
    45eb:	cd 40                	int    $0x40
    45ed:	c3                   	ret    

000045ee <dup>:
SYSCALL(dup)
    45ee:	b8 0a 00 00 00       	mov    $0xa,%eax
    45f3:	cd 40                	int    $0x40
    45f5:	c3                   	ret    

000045f6 <getpid>:
SYSCALL(getpid)
    45f6:	b8 0b 00 00 00       	mov    $0xb,%eax
    45fb:	cd 40                	int    $0x40
    45fd:	c3                   	ret    

000045fe <sbrk>:
SYSCALL(sbrk)
    45fe:	b8 0c 00 00 00       	mov    $0xc,%eax
    4603:	cd 40                	int    $0x40
    4605:	c3                   	ret    

00004606 <sleep>:
SYSCALL(sleep)
    4606:	b8 0d 00 00 00       	mov    $0xd,%eax
    460b:	cd 40                	int    $0x40
    460d:	c3                   	ret    

0000460e <uptime>:
SYSCALL(uptime)
    460e:	b8 0e 00 00 00       	mov    $0xe,%eax
    4613:	cd 40                	int    $0x40
    4615:	c3                   	ret    

00004616 <getMsg>:
SYSCALL(getMsg)
    4616:	b8 16 00 00 00       	mov    $0x16,%eax
    461b:	cd 40                	int    $0x40
    461d:	c3                   	ret    

0000461e <createWindow>:
SYSCALL(createWindow)
    461e:	b8 17 00 00 00       	mov    $0x17,%eax
    4623:	cd 40                	int    $0x40
    4625:	c3                   	ret    

00004626 <destroyWindow>:
SYSCALL(destroyWindow)
    4626:	b8 18 00 00 00       	mov    $0x18,%eax
    462b:	cd 40                	int    $0x40
    462d:	c3                   	ret    

0000462e <updateWindow>:
SYSCALL(updateWindow)
    462e:	b8 19 00 00 00       	mov    $0x19,%eax
    4633:	cd 40                	int    $0x40
    4635:	c3                   	ret    

00004636 <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    4636:	b8 1a 00 00 00       	mov    $0x1a,%eax
    463b:	cd 40                	int    $0x40
    463d:	c3                   	ret    

0000463e <kwrite>:
SYSCALL(kwrite)
    463e:	b8 1c 00 00 00       	mov    $0x1c,%eax
    4643:	cd 40                	int    $0x40
    4645:	c3                   	ret    

00004646 <setSampleRate>:
SYSCALL(setSampleRate)
    4646:	b8 1b 00 00 00       	mov    $0x1b,%eax
    464b:	cd 40                	int    $0x40
    464d:	c3                   	ret    

0000464e <pause>:
SYSCALL(pause)
    464e:	b8 1d 00 00 00       	mov    $0x1d,%eax
    4653:	cd 40                	int    $0x40
    4655:	c3                   	ret    

00004656 <wavdecode>:
SYSCALL(wavdecode)
    4656:	b8 1e 00 00 00       	mov    $0x1e,%eax
    465b:	cd 40                	int    $0x40
    465d:	c3                   	ret    

0000465e <beginDecode>:
SYSCALL(beginDecode)
    465e:	b8 1f 00 00 00       	mov    $0x1f,%eax
    4663:	cd 40                	int    $0x40
    4665:	c3                   	ret    

00004666 <waitForDecode>:
SYSCALL(waitForDecode)
    4666:	b8 20 00 00 00       	mov    $0x20,%eax
    466b:	cd 40                	int    $0x40
    466d:	c3                   	ret    

0000466e <endDecode>:
SYSCALL(endDecode)
    466e:	b8 21 00 00 00       	mov    $0x21,%eax
    4673:	cd 40                	int    $0x40
    4675:	c3                   	ret    

00004676 <getCoreBuf>:
    4676:	b8 22 00 00 00       	mov    $0x22,%eax
    467b:	cd 40                	int    $0x40
    467d:	c3                   	ret    

0000467e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    467e:	55                   	push   %ebp
    467f:	89 e5                	mov    %esp,%ebp
    4681:	83 ec 18             	sub    $0x18,%esp
    4684:	8b 45 0c             	mov    0xc(%ebp),%eax
    4687:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    468a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4691:	00 
    4692:	8d 45 f4             	lea    -0xc(%ebp),%eax
    4695:	89 44 24 04          	mov    %eax,0x4(%esp)
    4699:	8b 45 08             	mov    0x8(%ebp),%eax
    469c:	89 04 24             	mov    %eax,(%esp)
    469f:	e8 f2 fe ff ff       	call   4596 <write>
}
    46a4:	c9                   	leave  
    46a5:	c3                   	ret    

000046a6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    46a6:	55                   	push   %ebp
    46a7:	89 e5                	mov    %esp,%ebp
    46a9:	56                   	push   %esi
    46aa:	53                   	push   %ebx
    46ab:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    46ae:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    46b5:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    46b9:	74 17                	je     46d2 <printint+0x2c>
    46bb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    46bf:	79 11                	jns    46d2 <printint+0x2c>
    neg = 1;
    46c1:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    46c8:	8b 45 0c             	mov    0xc(%ebp),%eax
    46cb:	f7 d8                	neg    %eax
    46cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
    46d0:	eb 06                	jmp    46d8 <printint+0x32>
  } else {
    x = xx;
    46d2:	8b 45 0c             	mov    0xc(%ebp),%eax
    46d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    46d8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    46df:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    46e2:	8d 41 01             	lea    0x1(%ecx),%eax
    46e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    46e8:	8b 5d 10             	mov    0x10(%ebp),%ebx
    46eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    46ee:	ba 00 00 00 00       	mov    $0x0,%edx
    46f3:	f7 f3                	div    %ebx
    46f5:	89 d0                	mov    %edx,%eax
    46f7:	0f b6 80 90 f2 00 00 	movzbl 0xf290(%eax),%eax
    46fe:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    4702:	8b 75 10             	mov    0x10(%ebp),%esi
    4705:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4708:	ba 00 00 00 00       	mov    $0x0,%edx
    470d:	f7 f6                	div    %esi
    470f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4712:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4716:	75 c7                	jne    46df <printint+0x39>
  if(neg)
    4718:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    471c:	74 10                	je     472e <printint+0x88>
    buf[i++] = '-';
    471e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4721:	8d 50 01             	lea    0x1(%eax),%edx
    4724:	89 55 f4             	mov    %edx,-0xc(%ebp)
    4727:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    472c:	eb 1f                	jmp    474d <printint+0xa7>
    472e:	eb 1d                	jmp    474d <printint+0xa7>
    putc(fd, buf[i]);
    4730:	8d 55 dc             	lea    -0x24(%ebp),%edx
    4733:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4736:	01 d0                	add    %edx,%eax
    4738:	0f b6 00             	movzbl (%eax),%eax
    473b:	0f be c0             	movsbl %al,%eax
    473e:	89 44 24 04          	mov    %eax,0x4(%esp)
    4742:	8b 45 08             	mov    0x8(%ebp),%eax
    4745:	89 04 24             	mov    %eax,(%esp)
    4748:	e8 31 ff ff ff       	call   467e <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    474d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    4751:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4755:	79 d9                	jns    4730 <printint+0x8a>
    putc(fd, buf[i]);
}
    4757:	83 c4 30             	add    $0x30,%esp
    475a:	5b                   	pop    %ebx
    475b:	5e                   	pop    %esi
    475c:	5d                   	pop    %ebp
    475d:	c3                   	ret    

0000475e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    475e:	55                   	push   %ebp
    475f:	89 e5                	mov    %esp,%ebp
    4761:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    4764:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    476b:	8d 45 0c             	lea    0xc(%ebp),%eax
    476e:	83 c0 04             	add    $0x4,%eax
    4771:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    4774:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    477b:	e9 7c 01 00 00       	jmp    48fc <printf+0x19e>
    c = fmt[i] & 0xff;
    4780:	8b 55 0c             	mov    0xc(%ebp),%edx
    4783:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4786:	01 d0                	add    %edx,%eax
    4788:	0f b6 00             	movzbl (%eax),%eax
    478b:	0f be c0             	movsbl %al,%eax
    478e:	25 ff 00 00 00       	and    $0xff,%eax
    4793:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    4796:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    479a:	75 2c                	jne    47c8 <printf+0x6a>
      if(c == '%'){
    479c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    47a0:	75 0c                	jne    47ae <printf+0x50>
        state = '%';
    47a2:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    47a9:	e9 4a 01 00 00       	jmp    48f8 <printf+0x19a>
      } else {
        putc(fd, c);
    47ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    47b1:	0f be c0             	movsbl %al,%eax
    47b4:	89 44 24 04          	mov    %eax,0x4(%esp)
    47b8:	8b 45 08             	mov    0x8(%ebp),%eax
    47bb:	89 04 24             	mov    %eax,(%esp)
    47be:	e8 bb fe ff ff       	call   467e <putc>
    47c3:	e9 30 01 00 00       	jmp    48f8 <printf+0x19a>
      }
    } else if(state == '%'){
    47c8:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    47cc:	0f 85 26 01 00 00    	jne    48f8 <printf+0x19a>
      if(c == 'd'){
    47d2:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    47d6:	75 2d                	jne    4805 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    47d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    47db:	8b 00                	mov    (%eax),%eax
    47dd:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    47e4:	00 
    47e5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    47ec:	00 
    47ed:	89 44 24 04          	mov    %eax,0x4(%esp)
    47f1:	8b 45 08             	mov    0x8(%ebp),%eax
    47f4:	89 04 24             	mov    %eax,(%esp)
    47f7:	e8 aa fe ff ff       	call   46a6 <printint>
        ap++;
    47fc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4800:	e9 ec 00 00 00       	jmp    48f1 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    4805:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    4809:	74 06                	je     4811 <printf+0xb3>
    480b:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    480f:	75 2d                	jne    483e <printf+0xe0>
        printint(fd, *ap, 16, 0);
    4811:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4814:	8b 00                	mov    (%eax),%eax
    4816:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    481d:	00 
    481e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    4825:	00 
    4826:	89 44 24 04          	mov    %eax,0x4(%esp)
    482a:	8b 45 08             	mov    0x8(%ebp),%eax
    482d:	89 04 24             	mov    %eax,(%esp)
    4830:	e8 71 fe ff ff       	call   46a6 <printint>
        ap++;
    4835:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4839:	e9 b3 00 00 00       	jmp    48f1 <printf+0x193>
      } else if(c == 's'){
    483e:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    4842:	75 45                	jne    4889 <printf+0x12b>
        s = (char*)*ap;
    4844:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4847:	8b 00                	mov    (%eax),%eax
    4849:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    484c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    4850:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4854:	75 09                	jne    485f <printf+0x101>
          s = "(null)";
    4856:	c7 45 f4 23 b4 00 00 	movl   $0xb423,-0xc(%ebp)
        while(*s != 0){
    485d:	eb 1e                	jmp    487d <printf+0x11f>
    485f:	eb 1c                	jmp    487d <printf+0x11f>
          putc(fd, *s);
    4861:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4864:	0f b6 00             	movzbl (%eax),%eax
    4867:	0f be c0             	movsbl %al,%eax
    486a:	89 44 24 04          	mov    %eax,0x4(%esp)
    486e:	8b 45 08             	mov    0x8(%ebp),%eax
    4871:	89 04 24             	mov    %eax,(%esp)
    4874:	e8 05 fe ff ff       	call   467e <putc>
          s++;
    4879:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    487d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4880:	0f b6 00             	movzbl (%eax),%eax
    4883:	84 c0                	test   %al,%al
    4885:	75 da                	jne    4861 <printf+0x103>
    4887:	eb 68                	jmp    48f1 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    4889:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    488d:	75 1d                	jne    48ac <printf+0x14e>
        putc(fd, *ap);
    488f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4892:	8b 00                	mov    (%eax),%eax
    4894:	0f be c0             	movsbl %al,%eax
    4897:	89 44 24 04          	mov    %eax,0x4(%esp)
    489b:	8b 45 08             	mov    0x8(%ebp),%eax
    489e:	89 04 24             	mov    %eax,(%esp)
    48a1:	e8 d8 fd ff ff       	call   467e <putc>
        ap++;
    48a6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    48aa:	eb 45                	jmp    48f1 <printf+0x193>
      } else if(c == '%'){
    48ac:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    48b0:	75 17                	jne    48c9 <printf+0x16b>
        putc(fd, c);
    48b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    48b5:	0f be c0             	movsbl %al,%eax
    48b8:	89 44 24 04          	mov    %eax,0x4(%esp)
    48bc:	8b 45 08             	mov    0x8(%ebp),%eax
    48bf:	89 04 24             	mov    %eax,(%esp)
    48c2:	e8 b7 fd ff ff       	call   467e <putc>
    48c7:	eb 28                	jmp    48f1 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    48c9:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    48d0:	00 
    48d1:	8b 45 08             	mov    0x8(%ebp),%eax
    48d4:	89 04 24             	mov    %eax,(%esp)
    48d7:	e8 a2 fd ff ff       	call   467e <putc>
        putc(fd, c);
    48dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    48df:	0f be c0             	movsbl %al,%eax
    48e2:	89 44 24 04          	mov    %eax,0x4(%esp)
    48e6:	8b 45 08             	mov    0x8(%ebp),%eax
    48e9:	89 04 24             	mov    %eax,(%esp)
    48ec:	e8 8d fd ff ff       	call   467e <putc>
      }
      state = 0;
    48f1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    48f8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    48fc:	8b 55 0c             	mov    0xc(%ebp),%edx
    48ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4902:	01 d0                	add    %edx,%eax
    4904:	0f b6 00             	movzbl (%eax),%eax
    4907:	84 c0                	test   %al,%al
    4909:	0f 85 71 fe ff ff    	jne    4780 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    490f:	c9                   	leave  
    4910:	c3                   	ret    

00004911 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4911:	55                   	push   %ebp
    4912:	89 e5                	mov    %esp,%ebp
    4914:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4917:	8b 45 08             	mov    0x8(%ebp),%eax
    491a:	83 e8 08             	sub    $0x8,%eax
    491d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4920:	a1 b4 f7 00 00       	mov    0xf7b4,%eax
    4925:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4928:	eb 24                	jmp    494e <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    492a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    492d:	8b 00                	mov    (%eax),%eax
    492f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4932:	77 12                	ja     4946 <free+0x35>
    4934:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4937:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    493a:	77 24                	ja     4960 <free+0x4f>
    493c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    493f:	8b 00                	mov    (%eax),%eax
    4941:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4944:	77 1a                	ja     4960 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4946:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4949:	8b 00                	mov    (%eax),%eax
    494b:	89 45 fc             	mov    %eax,-0x4(%ebp)
    494e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4951:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4954:	76 d4                	jbe    492a <free+0x19>
    4956:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4959:	8b 00                	mov    (%eax),%eax
    495b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    495e:	76 ca                	jbe    492a <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    4960:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4963:	8b 40 04             	mov    0x4(%eax),%eax
    4966:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    496d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4970:	01 c2                	add    %eax,%edx
    4972:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4975:	8b 00                	mov    (%eax),%eax
    4977:	39 c2                	cmp    %eax,%edx
    4979:	75 24                	jne    499f <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    497b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    497e:	8b 50 04             	mov    0x4(%eax),%edx
    4981:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4984:	8b 00                	mov    (%eax),%eax
    4986:	8b 40 04             	mov    0x4(%eax),%eax
    4989:	01 c2                	add    %eax,%edx
    498b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    498e:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    4991:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4994:	8b 00                	mov    (%eax),%eax
    4996:	8b 10                	mov    (%eax),%edx
    4998:	8b 45 f8             	mov    -0x8(%ebp),%eax
    499b:	89 10                	mov    %edx,(%eax)
    499d:	eb 0a                	jmp    49a9 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    499f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    49a2:	8b 10                	mov    (%eax),%edx
    49a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    49a7:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    49a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    49ac:	8b 40 04             	mov    0x4(%eax),%eax
    49af:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    49b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    49b9:	01 d0                	add    %edx,%eax
    49bb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    49be:	75 20                	jne    49e0 <free+0xcf>
    p->s.size += bp->s.size;
    49c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    49c3:	8b 50 04             	mov    0x4(%eax),%edx
    49c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    49c9:	8b 40 04             	mov    0x4(%eax),%eax
    49cc:	01 c2                	add    %eax,%edx
    49ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
    49d1:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    49d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    49d7:	8b 10                	mov    (%eax),%edx
    49d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    49dc:	89 10                	mov    %edx,(%eax)
    49de:	eb 08                	jmp    49e8 <free+0xd7>
  } else
    p->s.ptr = bp;
    49e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    49e3:	8b 55 f8             	mov    -0x8(%ebp),%edx
    49e6:	89 10                	mov    %edx,(%eax)
  freep = p;
    49e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    49eb:	a3 b4 f7 00 00       	mov    %eax,0xf7b4
}
    49f0:	c9                   	leave  
    49f1:	c3                   	ret    

000049f2 <morecore>:

static Header*
morecore(uint nu)
{
    49f2:	55                   	push   %ebp
    49f3:	89 e5                	mov    %esp,%ebp
    49f5:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    49f8:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    49ff:	77 07                	ja     4a08 <morecore+0x16>
    nu = 4096;
    4a01:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    4a08:	8b 45 08             	mov    0x8(%ebp),%eax
    4a0b:	c1 e0 03             	shl    $0x3,%eax
    4a0e:	89 04 24             	mov    %eax,(%esp)
    4a11:	e8 e8 fb ff ff       	call   45fe <sbrk>
    4a16:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    4a19:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4a1d:	75 07                	jne    4a26 <morecore+0x34>
    return 0;
    4a1f:	b8 00 00 00 00       	mov    $0x0,%eax
    4a24:	eb 22                	jmp    4a48 <morecore+0x56>
  hp = (Header*)p;
    4a26:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a29:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    4a2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4a2f:	8b 55 08             	mov    0x8(%ebp),%edx
    4a32:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    4a35:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4a38:	83 c0 08             	add    $0x8,%eax
    4a3b:	89 04 24             	mov    %eax,(%esp)
    4a3e:	e8 ce fe ff ff       	call   4911 <free>
  return freep;
    4a43:	a1 b4 f7 00 00       	mov    0xf7b4,%eax
}
    4a48:	c9                   	leave  
    4a49:	c3                   	ret    

00004a4a <malloc>:

void*
malloc(uint nbytes)
{
    4a4a:	55                   	push   %ebp
    4a4b:	89 e5                	mov    %esp,%ebp
    4a4d:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4a50:	8b 45 08             	mov    0x8(%ebp),%eax
    4a53:	83 c0 07             	add    $0x7,%eax
    4a56:	c1 e8 03             	shr    $0x3,%eax
    4a59:	83 c0 01             	add    $0x1,%eax
    4a5c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    4a5f:	a1 b4 f7 00 00       	mov    0xf7b4,%eax
    4a64:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4a67:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4a6b:	75 23                	jne    4a90 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    4a6d:	c7 45 f0 ac f7 00 00 	movl   $0xf7ac,-0x10(%ebp)
    4a74:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4a77:	a3 b4 f7 00 00       	mov    %eax,0xf7b4
    4a7c:	a1 b4 f7 00 00       	mov    0xf7b4,%eax
    4a81:	a3 ac f7 00 00       	mov    %eax,0xf7ac
    base.s.size = 0;
    4a86:	c7 05 b0 f7 00 00 00 	movl   $0x0,0xf7b0
    4a8d:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4a90:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4a93:	8b 00                	mov    (%eax),%eax
    4a95:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    4a98:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a9b:	8b 40 04             	mov    0x4(%eax),%eax
    4a9e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4aa1:	72 4d                	jb     4af0 <malloc+0xa6>
      if(p->s.size == nunits)
    4aa3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4aa6:	8b 40 04             	mov    0x4(%eax),%eax
    4aa9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4aac:	75 0c                	jne    4aba <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    4aae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4ab1:	8b 10                	mov    (%eax),%edx
    4ab3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4ab6:	89 10                	mov    %edx,(%eax)
    4ab8:	eb 26                	jmp    4ae0 <malloc+0x96>
      else {
        p->s.size -= nunits;
    4aba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4abd:	8b 40 04             	mov    0x4(%eax),%eax
    4ac0:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4ac3:	89 c2                	mov    %eax,%edx
    4ac5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4ac8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    4acb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4ace:	8b 40 04             	mov    0x4(%eax),%eax
    4ad1:	c1 e0 03             	shl    $0x3,%eax
    4ad4:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    4ad7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4ada:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4add:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    4ae0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4ae3:	a3 b4 f7 00 00       	mov    %eax,0xf7b4
      return (void*)(p + 1);
    4ae8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4aeb:	83 c0 08             	add    $0x8,%eax
    4aee:	eb 38                	jmp    4b28 <malloc+0xde>
    }
    if(p == freep)
    4af0:	a1 b4 f7 00 00       	mov    0xf7b4,%eax
    4af5:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    4af8:	75 1b                	jne    4b15 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    4afa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4afd:	89 04 24             	mov    %eax,(%esp)
    4b00:	e8 ed fe ff ff       	call   49f2 <morecore>
    4b05:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4b08:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4b0c:	75 07                	jne    4b15 <malloc+0xcb>
        return 0;
    4b0e:	b8 00 00 00 00       	mov    $0x0,%eax
    4b13:	eb 13                	jmp    4b28 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4b15:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4b18:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4b1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4b1e:	8b 00                	mov    (%eax),%eax
    4b20:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    4b23:	e9 70 ff ff ff       	jmp    4a98 <malloc+0x4e>
}
    4b28:	c9                   	leave  
    4b29:	c3                   	ret    

00004b2a <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    4b2a:	55                   	push   %ebp
    4b2b:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    4b2d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    4b31:	79 07                	jns    4b3a <abs+0x10>
		return x * -1;
    4b33:	8b 45 08             	mov    0x8(%ebp),%eax
    4b36:	f7 d8                	neg    %eax
    4b38:	eb 03                	jmp    4b3d <abs+0x13>
	else
		return x;
    4b3a:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4b3d:	5d                   	pop    %ebp
    4b3e:	c3                   	ret    

00004b3f <sin>:
double sin(double x)  
{  
    4b3f:	55                   	push   %ebp
    4b40:	89 e5                	mov    %esp,%ebp
    4b42:	83 ec 3c             	sub    $0x3c,%esp
    4b45:	8b 45 08             	mov    0x8(%ebp),%eax
    4b48:	89 45 c8             	mov    %eax,-0x38(%ebp)
    4b4b:	8b 45 0c             	mov    0xc(%ebp),%eax
    4b4e:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    4b51:	dd 45 c8             	fldl   -0x38(%ebp)
    4b54:	dd 5d f8             	fstpl  -0x8(%ebp)
    4b57:	d9 e8                	fld1   
    4b59:	dd 5d f0             	fstpl  -0x10(%ebp)
    4b5c:	dd 45 c8             	fldl   -0x38(%ebp)
    4b5f:	dd 5d e8             	fstpl  -0x18(%ebp)
    4b62:	dd 45 c8             	fldl   -0x38(%ebp)
    4b65:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    4b68:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    4b6f:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    4b76:	eb 50                	jmp    4bc8 <sin+0x89>
	{  
		n = n+1;  
    4b78:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    4b7c:	db 45 dc             	fildl  -0x24(%ebp)
    4b7f:	dc 4d f0             	fmull  -0x10(%ebp)
    4b82:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4b85:	83 c0 01             	add    $0x1,%eax
    4b88:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    4b8b:	db 45 c4             	fildl  -0x3c(%ebp)
    4b8e:	de c9                	fmulp  %st,%st(1)
    4b90:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    4b93:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    4b97:	dd 45 c8             	fldl   -0x38(%ebp)
    4b9a:	dc 4d c8             	fmull  -0x38(%ebp)
    4b9d:	dd 45 e8             	fldl   -0x18(%ebp)
    4ba0:	de c9                	fmulp  %st,%st(1)
    4ba2:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    4ba5:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    4ba8:	dd 45 e8             	fldl   -0x18(%ebp)
    4bab:	dc 75 f0             	fdivl  -0x10(%ebp)
    4bae:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    4bb1:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    4bb5:	7e 08                	jle    4bbf <sin+0x80>
    4bb7:	dd 45 f8             	fldl   -0x8(%ebp)
    4bba:	dc 45 e0             	faddl  -0x20(%ebp)
    4bbd:	eb 06                	jmp    4bc5 <sin+0x86>
    4bbf:	dd 45 f8             	fldl   -0x8(%ebp)
    4bc2:	dc 65 e0             	fsubl  -0x20(%ebp)
    4bc5:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    4bc8:	dd 45 e0             	fldl   -0x20(%ebp)
    4bcb:	dd 05 30 b4 00 00    	fldl   0xb430
    4bd1:	d9 c9                	fxch   %st(1)
    4bd3:	df e9                	fucomip %st(1),%st
    4bd5:	dd d8                	fstp   %st(0)
    4bd7:	77 9f                	ja     4b78 <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    4bd9:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    4bdc:	c9                   	leave  
    4bdd:	c3                   	ret    

00004bde <cos>:
double cos(double x)  
{  
    4bde:	55                   	push   %ebp
    4bdf:	89 e5                	mov    %esp,%ebp
    4be1:	83 ec 10             	sub    $0x10,%esp
    4be4:	8b 45 08             	mov    0x8(%ebp),%eax
    4be7:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4bea:	8b 45 0c             	mov    0xc(%ebp),%eax
    4bed:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    4bf0:	dd 05 38 b4 00 00    	fldl   0xb438
    4bf6:	dc 65 f8             	fsubl  -0x8(%ebp)
    4bf9:	dd 1c 24             	fstpl  (%esp)
    4bfc:	e8 3e ff ff ff       	call   4b3f <sin>
}  
    4c01:	c9                   	leave  
    4c02:	c3                   	ret    

00004c03 <tan>:
double tan(double x)  
{  
    4c03:	55                   	push   %ebp
    4c04:	89 e5                	mov    %esp,%ebp
    4c06:	83 ec 18             	sub    $0x18,%esp
    4c09:	8b 45 08             	mov    0x8(%ebp),%eax
    4c0c:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4c0f:	8b 45 0c             	mov    0xc(%ebp),%eax
    4c12:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    4c15:	dd 45 f8             	fldl   -0x8(%ebp)
    4c18:	dd 1c 24             	fstpl  (%esp)
    4c1b:	e8 1f ff ff ff       	call   4b3f <sin>
    4c20:	dd 5d f0             	fstpl  -0x10(%ebp)
    4c23:	dd 45 f8             	fldl   -0x8(%ebp)
    4c26:	dd 1c 24             	fstpl  (%esp)
    4c29:	e8 b0 ff ff ff       	call   4bde <cos>
    4c2e:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    4c31:	c9                   	leave  
    4c32:	c3                   	ret    

00004c33 <pow>:

double pow(double x, double y)
{
    4c33:	55                   	push   %ebp
    4c34:	89 e5                	mov    %esp,%ebp
    4c36:	83 ec 48             	sub    $0x48,%esp
    4c39:	8b 45 08             	mov    0x8(%ebp),%eax
    4c3c:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4c3f:	8b 45 0c             	mov    0xc(%ebp),%eax
    4c42:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4c45:	8b 45 10             	mov    0x10(%ebp),%eax
    4c48:	89 45 d8             	mov    %eax,-0x28(%ebp)
    4c4b:	8b 45 14             	mov    0x14(%ebp),%eax
    4c4e:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    4c51:	dd 45 e0             	fldl   -0x20(%ebp)
    4c54:	d9 ee                	fldz   
    4c56:	df e9                	fucomip %st(1),%st
    4c58:	dd d8                	fstp   %st(0)
    4c5a:	7a 28                	jp     4c84 <pow+0x51>
    4c5c:	dd 45 e0             	fldl   -0x20(%ebp)
    4c5f:	d9 ee                	fldz   
    4c61:	df e9                	fucomip %st(1),%st
    4c63:	dd d8                	fstp   %st(0)
    4c65:	75 1d                	jne    4c84 <pow+0x51>
    4c67:	dd 45 d8             	fldl   -0x28(%ebp)
    4c6a:	d9 ee                	fldz   
    4c6c:	df e9                	fucomip %st(1),%st
    4c6e:	dd d8                	fstp   %st(0)
    4c70:	7a 0b                	jp     4c7d <pow+0x4a>
    4c72:	dd 45 d8             	fldl   -0x28(%ebp)
    4c75:	d9 ee                	fldz   
    4c77:	df e9                	fucomip %st(1),%st
    4c79:	dd d8                	fstp   %st(0)
    4c7b:	74 07                	je     4c84 <pow+0x51>
    4c7d:	d9 ee                	fldz   
    4c7f:	e9 30 01 00 00       	jmp    4db4 <pow+0x181>
	else if(x==0 && y==0) return 1;
    4c84:	dd 45 e0             	fldl   -0x20(%ebp)
    4c87:	d9 ee                	fldz   
    4c89:	df e9                	fucomip %st(1),%st
    4c8b:	dd d8                	fstp   %st(0)
    4c8d:	7a 28                	jp     4cb7 <pow+0x84>
    4c8f:	dd 45 e0             	fldl   -0x20(%ebp)
    4c92:	d9 ee                	fldz   
    4c94:	df e9                	fucomip %st(1),%st
    4c96:	dd d8                	fstp   %st(0)
    4c98:	75 1d                	jne    4cb7 <pow+0x84>
    4c9a:	dd 45 d8             	fldl   -0x28(%ebp)
    4c9d:	d9 ee                	fldz   
    4c9f:	df e9                	fucomip %st(1),%st
    4ca1:	dd d8                	fstp   %st(0)
    4ca3:	7a 12                	jp     4cb7 <pow+0x84>
    4ca5:	dd 45 d8             	fldl   -0x28(%ebp)
    4ca8:	d9 ee                	fldz   
    4caa:	df e9                	fucomip %st(1),%st
    4cac:	dd d8                	fstp   %st(0)
    4cae:	75 07                	jne    4cb7 <pow+0x84>
    4cb0:	d9 e8                	fld1   
    4cb2:	e9 fd 00 00 00       	jmp    4db4 <pow+0x181>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    4cb7:	d9 ee                	fldz   
    4cb9:	dd 45 d8             	fldl   -0x28(%ebp)
    4cbc:	d9 c9                	fxch   %st(1)
    4cbe:	df e9                	fucomip %st(1),%st
    4cc0:	dd d8                	fstp   %st(0)
    4cc2:	76 1d                	jbe    4ce1 <pow+0xae>
    4cc4:	dd 45 d8             	fldl   -0x28(%ebp)
    4cc7:	d9 e0                	fchs   
    4cc9:	dd 5c 24 08          	fstpl  0x8(%esp)
    4ccd:	dd 45 e0             	fldl   -0x20(%ebp)
    4cd0:	dd 1c 24             	fstpl  (%esp)
    4cd3:	e8 5b ff ff ff       	call   4c33 <pow>
    4cd8:	d9 e8                	fld1   
    4cda:	de f1                	fdivp  %st,%st(1)
    4cdc:	e9 d3 00 00 00       	jmp    4db4 <pow+0x181>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    4ce1:	d9 ee                	fldz   
    4ce3:	dd 45 e0             	fldl   -0x20(%ebp)
    4ce6:	d9 c9                	fxch   %st(1)
    4ce8:	df e9                	fucomip %st(1),%st
    4cea:	dd d8                	fstp   %st(0)
    4cec:	76 40                	jbe    4d2e <pow+0xfb>
    4cee:	dd 45 d8             	fldl   -0x28(%ebp)
    4cf1:	d9 7d d6             	fnstcw -0x2a(%ebp)
    4cf4:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    4cf8:	b4 0c                	mov    $0xc,%ah
    4cfa:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    4cfe:	d9 6d d4             	fldcw  -0x2c(%ebp)
    4d01:	db 5d d0             	fistpl -0x30(%ebp)
    4d04:	d9 6d d6             	fldcw  -0x2a(%ebp)
    4d07:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4d0a:	89 45 d0             	mov    %eax,-0x30(%ebp)
    4d0d:	db 45 d0             	fildl  -0x30(%ebp)
    4d10:	dd 45 d8             	fldl   -0x28(%ebp)
    4d13:	de e1                	fsubp  %st,%st(1)
    4d15:	d9 ee                	fldz   
    4d17:	df e9                	fucomip %st(1),%st
    4d19:	7a 0a                	jp     4d25 <pow+0xf2>
    4d1b:	d9 ee                	fldz   
    4d1d:	df e9                	fucomip %st(1),%st
    4d1f:	dd d8                	fstp   %st(0)
    4d21:	74 0b                	je     4d2e <pow+0xfb>
    4d23:	eb 02                	jmp    4d27 <pow+0xf4>
    4d25:	dd d8                	fstp   %st(0)
    4d27:	d9 ee                	fldz   
    4d29:	e9 86 00 00 00       	jmp    4db4 <pow+0x181>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    4d2e:	d9 ee                	fldz   
    4d30:	dd 45 e0             	fldl   -0x20(%ebp)
    4d33:	d9 c9                	fxch   %st(1)
    4d35:	df e9                	fucomip %st(1),%st
    4d37:	dd d8                	fstp   %st(0)
    4d39:	76 63                	jbe    4d9e <pow+0x16b>
    4d3b:	dd 45 d8             	fldl   -0x28(%ebp)
    4d3e:	d9 7d d6             	fnstcw -0x2a(%ebp)
    4d41:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    4d45:	b4 0c                	mov    $0xc,%ah
    4d47:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    4d4b:	d9 6d d4             	fldcw  -0x2c(%ebp)
    4d4e:	db 5d d0             	fistpl -0x30(%ebp)
    4d51:	d9 6d d6             	fldcw  -0x2a(%ebp)
    4d54:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4d57:	89 45 d0             	mov    %eax,-0x30(%ebp)
    4d5a:	db 45 d0             	fildl  -0x30(%ebp)
    4d5d:	dd 45 d8             	fldl   -0x28(%ebp)
    4d60:	de e1                	fsubp  %st,%st(1)
    4d62:	d9 ee                	fldz   
    4d64:	df e9                	fucomip %st(1),%st
    4d66:	7a 34                	jp     4d9c <pow+0x169>
    4d68:	d9 ee                	fldz   
    4d6a:	df e9                	fucomip %st(1),%st
    4d6c:	dd d8                	fstp   %st(0)
    4d6e:	75 2e                	jne    4d9e <pow+0x16b>
	{
		double powint=1;
    4d70:	d9 e8                	fld1   
    4d72:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    4d75:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    4d7c:	eb 0d                	jmp    4d8b <pow+0x158>
    4d7e:	dd 45 f0             	fldl   -0x10(%ebp)
    4d81:	dc 4d e0             	fmull  -0x20(%ebp)
    4d84:	dd 5d f0             	fstpl  -0x10(%ebp)
    4d87:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    4d8b:	db 45 ec             	fildl  -0x14(%ebp)
    4d8e:	dd 45 d8             	fldl   -0x28(%ebp)
    4d91:	df e9                	fucomip %st(1),%st
    4d93:	dd d8                	fstp   %st(0)
    4d95:	73 e7                	jae    4d7e <pow+0x14b>
		return powint;
    4d97:	dd 45 f0             	fldl   -0x10(%ebp)
    4d9a:	eb 18                	jmp    4db4 <pow+0x181>
    4d9c:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    4d9e:	dd 45 e0             	fldl   -0x20(%ebp)
    4da1:	dd 1c 24             	fstpl  (%esp)
    4da4:	e8 36 00 00 00       	call   4ddf <ln>
    4da9:	dc 4d d8             	fmull  -0x28(%ebp)
    4dac:	dd 1c 24             	fstpl  (%esp)
    4daf:	e8 0e 02 00 00       	call   4fc2 <exp>
}
    4db4:	c9                   	leave  
    4db5:	c3                   	ret    

00004db6 <sqrt>:
// 求根
double sqrt(double x)
{
    4db6:	55                   	push   %ebp
    4db7:	89 e5                	mov    %esp,%ebp
    4db9:	83 ec 28             	sub    $0x28,%esp
    4dbc:	8b 45 08             	mov    0x8(%ebp),%eax
    4dbf:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4dc2:	8b 45 0c             	mov    0xc(%ebp),%eax
    4dc5:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    4dc8:	dd 05 40 b4 00 00    	fldl   0xb440
    4dce:	dd 5c 24 08          	fstpl  0x8(%esp)
    4dd2:	dd 45 f0             	fldl   -0x10(%ebp)
    4dd5:	dd 1c 24             	fstpl  (%esp)
    4dd8:	e8 56 fe ff ff       	call   4c33 <pow>
}
    4ddd:	c9                   	leave  
    4dde:	c3                   	ret    

00004ddf <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    4ddf:	55                   	push   %ebp
    4de0:	89 e5                	mov    %esp,%ebp
    4de2:	81 ec 88 00 00 00    	sub    $0x88,%esp
    4de8:	8b 45 08             	mov    0x8(%ebp),%eax
    4deb:	89 45 90             	mov    %eax,-0x70(%ebp)
    4dee:	8b 45 0c             	mov    0xc(%ebp),%eax
    4df1:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    4df4:	dd 45 90             	fldl   -0x70(%ebp)
    4df7:	d9 e8                	fld1   
    4df9:	de e9                	fsubrp %st,%st(1)
    4dfb:	dd 5d c0             	fstpl  -0x40(%ebp)
    4dfe:	d9 ee                	fldz   
    4e00:	dd 5d f0             	fstpl  -0x10(%ebp)
    4e03:	d9 ee                	fldz   
    4e05:	dd 5d b8             	fstpl  -0x48(%ebp)
    4e08:	d9 ee                	fldz   
    4e0a:	dd 5d b0             	fstpl  -0x50(%ebp)
    4e0d:	d9 ee                	fldz   
    4e0f:	dd 5d e8             	fstpl  -0x18(%ebp)
    4e12:	d9 e8                	fld1   
    4e14:	dd 5d e0             	fstpl  -0x20(%ebp)
    4e17:	d9 e8                	fld1   
    4e19:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    4e1c:	dd 45 90             	fldl   -0x70(%ebp)
    4e1f:	d9 e8                	fld1   
    4e21:	df e9                	fucomip %st(1),%st
    4e23:	dd d8                	fstp   %st(0)
    4e25:	7a 12                	jp     4e39 <ln+0x5a>
    4e27:	dd 45 90             	fldl   -0x70(%ebp)
    4e2a:	d9 e8                	fld1   
    4e2c:	df e9                	fucomip %st(1),%st
    4e2e:	dd d8                	fstp   %st(0)
    4e30:	75 07                	jne    4e39 <ln+0x5a>
    4e32:	d9 ee                	fldz   
    4e34:	e9 87 01 00 00       	jmp    4fc0 <ln+0x1e1>
	else if(x>2) return -ln(1/x);
    4e39:	dd 45 90             	fldl   -0x70(%ebp)
    4e3c:	dd 05 48 b4 00 00    	fldl   0xb448
    4e42:	d9 c9                	fxch   %st(1)
    4e44:	df e9                	fucomip %st(1),%st
    4e46:	dd d8                	fstp   %st(0)
    4e48:	76 14                	jbe    4e5e <ln+0x7f>
    4e4a:	d9 e8                	fld1   
    4e4c:	dc 75 90             	fdivl  -0x70(%ebp)
    4e4f:	dd 1c 24             	fstpl  (%esp)
    4e52:	e8 88 ff ff ff       	call   4ddf <ln>
    4e57:	d9 e0                	fchs   
    4e59:	e9 62 01 00 00       	jmp    4fc0 <ln+0x1e1>
	else if(x<.1)
    4e5e:	dd 05 50 b4 00 00    	fldl   0xb450
    4e64:	dd 45 90             	fldl   -0x70(%ebp)
    4e67:	d9 c9                	fxch   %st(1)
    4e69:	df e9                	fucomip %st(1),%st
    4e6b:	dd d8                	fstp   %st(0)
    4e6d:	76 59                	jbe    4ec8 <ln+0xe9>
	{
		double n=-1;
    4e6f:	d9 e8                	fld1   
    4e71:	d9 e0                	fchs   
    4e73:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    4e76:	dd 45 c8             	fldl   -0x38(%ebp)
    4e79:	dd 05 58 b4 00 00    	fldl   0xb458
    4e7f:	de e9                	fsubrp %st,%st(1)
    4e81:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    4e84:	dd 45 c8             	fldl   -0x38(%ebp)
    4e87:	dd 1c 24             	fstpl  (%esp)
    4e8a:	e8 33 01 00 00       	call   4fc2 <exp>
    4e8f:	dd 45 90             	fldl   -0x70(%ebp)
    4e92:	de f1                	fdivp  %st,%st(1)
    4e94:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    4e97:	dd 45 a0             	fldl   -0x60(%ebp)
    4e9a:	dd 05 48 b4 00 00    	fldl   0xb448
    4ea0:	d9 c9                	fxch   %st(1)
    4ea2:	df e9                	fucomip %st(1),%st
    4ea4:	dd d8                	fstp   %st(0)
    4ea6:	77 ce                	ja     4e76 <ln+0x97>
    4ea8:	d9 e8                	fld1   
    4eaa:	dd 45 a0             	fldl   -0x60(%ebp)
    4ead:	d9 c9                	fxch   %st(1)
    4eaf:	df e9                	fucomip %st(1),%st
    4eb1:	dd d8                	fstp   %st(0)
    4eb3:	77 c1                	ja     4e76 <ln+0x97>
		return ln(a)+n;
    4eb5:	dd 45 a0             	fldl   -0x60(%ebp)
    4eb8:	dd 1c 24             	fstpl  (%esp)
    4ebb:	e8 1f ff ff ff       	call   4ddf <ln>
    4ec0:	dc 45 c8             	faddl  -0x38(%ebp)
    4ec3:	e9 f8 00 00 00       	jmp    4fc0 <ln+0x1e1>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    4ec8:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    4ecf:	d9 e8                	fld1   
    4ed1:	dd 5d d8             	fstpl  -0x28(%ebp)
    4ed4:	e9 b6 00 00 00       	jmp    4f8f <ln+0x1b0>
	{
		ln_tmp=ln_px;
    4ed9:	dd 45 e8             	fldl   -0x18(%ebp)
    4edc:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    4edf:	dd 45 d8             	fldl   -0x28(%ebp)
    4ee2:	dc 4d c0             	fmull  -0x40(%ebp)
    4ee5:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    4ee8:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    4eec:	75 0d                	jne    4efb <ln+0x11c>
    4eee:	db 45 d4             	fildl  -0x2c(%ebp)
    4ef1:	dd 45 d8             	fldl   -0x28(%ebp)
    4ef4:	de f1                	fdivp  %st,%st(1)
    4ef6:	dd 5d d8             	fstpl  -0x28(%ebp)
    4ef9:	eb 13                	jmp    4f0e <ln+0x12f>
		else tmp=tmp/-l;
    4efb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4efe:	f7 d8                	neg    %eax
    4f00:	89 45 8c             	mov    %eax,-0x74(%ebp)
    4f03:	db 45 8c             	fildl  -0x74(%ebp)
    4f06:	dd 45 d8             	fldl   -0x28(%ebp)
    4f09:	de f1                	fdivp  %st,%st(1)
    4f0b:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    4f0e:	dd 45 f0             	fldl   -0x10(%ebp)
    4f11:	dc 45 d8             	faddl  -0x28(%ebp)
    4f14:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    4f17:	dd 45 d8             	fldl   -0x28(%ebp)
    4f1a:	d9 e0                	fchs   
    4f1c:	dc 4d c0             	fmull  -0x40(%ebp)
    4f1f:	db 45 d4             	fildl  -0x2c(%ebp)
    4f22:	de c9                	fmulp  %st,%st(1)
    4f24:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4f27:	83 c0 01             	add    $0x1,%eax
    4f2a:	89 45 8c             	mov    %eax,-0x74(%ebp)
    4f2d:	db 45 8c             	fildl  -0x74(%ebp)
    4f30:	de f9                	fdivrp %st,%st(1)
    4f32:	dc 45 f0             	faddl  -0x10(%ebp)
    4f35:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    4f38:	dd 45 d8             	fldl   -0x28(%ebp)
    4f3b:	dc 4d c0             	fmull  -0x40(%ebp)
    4f3e:	dc 4d c0             	fmull  -0x40(%ebp)
    4f41:	db 45 d4             	fildl  -0x2c(%ebp)
    4f44:	de c9                	fmulp  %st,%st(1)
    4f46:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4f49:	83 c0 02             	add    $0x2,%eax
    4f4c:	89 45 8c             	mov    %eax,-0x74(%ebp)
    4f4f:	db 45 8c             	fildl  -0x74(%ebp)
    4f52:	de f9                	fdivrp %st,%st(1)
    4f54:	dc 45 b8             	faddl  -0x48(%ebp)
    4f57:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    4f5a:	dd 45 b0             	fldl   -0x50(%ebp)
    4f5d:	dc 65 b8             	fsubl  -0x48(%ebp)
    4f60:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    4f63:	dd 45 a8             	fldl   -0x58(%ebp)
    4f66:	dc 4d a8             	fmull  -0x58(%ebp)
    4f69:	dd 45 b8             	fldl   -0x48(%ebp)
    4f6c:	d8 c0                	fadd   %st(0),%st
    4f6e:	dd 45 b0             	fldl   -0x50(%ebp)
    4f71:	de e1                	fsubp  %st,%st(1)
    4f73:	dc 45 f0             	faddl  -0x10(%ebp)
    4f76:	de f9                	fdivrp %st,%st(1)
    4f78:	dd 45 b0             	fldl   -0x50(%ebp)
    4f7b:	de e1                	fsubp  %st,%st(1)
    4f7d:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    4f80:	db 45 d4             	fildl  -0x2c(%ebp)
    4f83:	dd 45 d8             	fldl   -0x28(%ebp)
    4f86:	de c9                	fmulp  %st,%st(1)
    4f88:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    4f8b:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    4f8f:	dd 45 e8             	fldl   -0x18(%ebp)
    4f92:	dc 65 e0             	fsubl  -0x20(%ebp)
    4f95:	dd 05 60 b4 00 00    	fldl   0xb460
    4f9b:	d9 c9                	fxch   %st(1)
    4f9d:	df e9                	fucomip %st(1),%st
    4f9f:	dd d8                	fstp   %st(0)
    4fa1:	0f 87 32 ff ff ff    	ja     4ed9 <ln+0xfa>
    4fa7:	dd 45 e8             	fldl   -0x18(%ebp)
    4faa:	dc 65 e0             	fsubl  -0x20(%ebp)
    4fad:	dd 05 68 b4 00 00    	fldl   0xb468
    4fb3:	df e9                	fucomip %st(1),%st
    4fb5:	dd d8                	fstp   %st(0)
    4fb7:	0f 87 1c ff ff ff    	ja     4ed9 <ln+0xfa>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    4fbd:	dd 45 e8             	fldl   -0x18(%ebp)
}
    4fc0:	c9                   	leave  
    4fc1:	c3                   	ret    

00004fc2 <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    4fc2:	55                   	push   %ebp
    4fc3:	89 e5                	mov    %esp,%ebp
    4fc5:	83 ec 78             	sub    $0x78,%esp
    4fc8:	8b 45 08             	mov    0x8(%ebp),%eax
    4fcb:	89 45 a0             	mov    %eax,-0x60(%ebp)
    4fce:	8b 45 0c             	mov    0xc(%ebp),%eax
    4fd1:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    4fd4:	dd 45 a0             	fldl   -0x60(%ebp)
    4fd7:	dd 5d c0             	fstpl  -0x40(%ebp)
    4fda:	d9 ee                	fldz   
    4fdc:	dd 5d f0             	fstpl  -0x10(%ebp)
    4fdf:	d9 ee                	fldz   
    4fe1:	dd 5d b8             	fstpl  -0x48(%ebp)
    4fe4:	d9 ee                	fldz   
    4fe6:	dd 5d b0             	fstpl  -0x50(%ebp)
    4fe9:	d9 ee                	fldz   
    4feb:	dd 5d e8             	fstpl  -0x18(%ebp)
    4fee:	d9 e8                	fld1   
    4ff0:	dd 5d e0             	fstpl  -0x20(%ebp)
    4ff3:	d9 e8                	fld1   
    4ff5:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    4ff8:	dd 45 a0             	fldl   -0x60(%ebp)
    4ffb:	d9 ee                	fldz   
    4ffd:	df e9                	fucomip %st(1),%st
    4fff:	dd d8                	fstp   %st(0)
    5001:	7a 12                	jp     5015 <exp+0x53>
    5003:	dd 45 a0             	fldl   -0x60(%ebp)
    5006:	d9 ee                	fldz   
    5008:	df e9                	fucomip %st(1),%st
    500a:	dd d8                	fstp   %st(0)
    500c:	75 07                	jne    5015 <exp+0x53>
    500e:	d9 e8                	fld1   
    5010:	e9 08 01 00 00       	jmp    511d <exp+0x15b>
	if(x<0) return 1/exp(-x); 
    5015:	d9 ee                	fldz   
    5017:	dd 45 a0             	fldl   -0x60(%ebp)
    501a:	d9 c9                	fxch   %st(1)
    501c:	df e9                	fucomip %st(1),%st
    501e:	dd d8                	fstp   %st(0)
    5020:	76 16                	jbe    5038 <exp+0x76>
    5022:	dd 45 a0             	fldl   -0x60(%ebp)
    5025:	d9 e0                	fchs   
    5027:	dd 1c 24             	fstpl  (%esp)
    502a:	e8 93 ff ff ff       	call   4fc2 <exp>
    502f:	d9 e8                	fld1   
    5031:	de f1                	fdivp  %st,%st(1)
    5033:	e9 e5 00 00 00       	jmp    511d <exp+0x15b>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    5038:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    503f:	d9 e8                	fld1   
    5041:	dd 5d d0             	fstpl  -0x30(%ebp)
    5044:	e9 92 00 00 00       	jmp    50db <exp+0x119>
	{
		ex_tmp=ex_px;
    5049:	dd 45 e8             	fldl   -0x18(%ebp)
    504c:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    504f:	dd 45 d0             	fldl   -0x30(%ebp)
    5052:	dc 4d c0             	fmull  -0x40(%ebp)
    5055:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    5058:	db 45 cc             	fildl  -0x34(%ebp)
    505b:	dd 45 d0             	fldl   -0x30(%ebp)
    505e:	de f1                	fdivp  %st,%st(1)
    5060:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    5063:	dd 45 f0             	fldl   -0x10(%ebp)
    5066:	dc 45 d0             	faddl  -0x30(%ebp)
    5069:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    506c:	dd 45 d0             	fldl   -0x30(%ebp)
    506f:	dc 4d c0             	fmull  -0x40(%ebp)
    5072:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5075:	83 c0 01             	add    $0x1,%eax
    5078:	89 45 9c             	mov    %eax,-0x64(%ebp)
    507b:	db 45 9c             	fildl  -0x64(%ebp)
    507e:	de f9                	fdivrp %st,%st(1)
    5080:	dc 45 f0             	faddl  -0x10(%ebp)
    5083:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    5086:	dd 45 d0             	fldl   -0x30(%ebp)
    5089:	dc 4d c0             	fmull  -0x40(%ebp)
    508c:	dc 4d c0             	fmull  -0x40(%ebp)
    508f:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5092:	83 c0 01             	add    $0x1,%eax
    5095:	89 45 9c             	mov    %eax,-0x64(%ebp)
    5098:	db 45 9c             	fildl  -0x64(%ebp)
    509b:	de f9                	fdivrp %st,%st(1)
    509d:	8b 45 cc             	mov    -0x34(%ebp),%eax
    50a0:	83 c0 02             	add    $0x2,%eax
    50a3:	89 45 9c             	mov    %eax,-0x64(%ebp)
    50a6:	db 45 9c             	fildl  -0x64(%ebp)
    50a9:	de f9                	fdivrp %st,%st(1)
    50ab:	dc 45 b8             	faddl  -0x48(%ebp)
    50ae:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    50b1:	dd 45 b0             	fldl   -0x50(%ebp)
    50b4:	dc 65 b8             	fsubl  -0x48(%ebp)
    50b7:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    50ba:	dd 45 d8             	fldl   -0x28(%ebp)
    50bd:	dc 4d d8             	fmull  -0x28(%ebp)
    50c0:	dd 45 b8             	fldl   -0x48(%ebp)
    50c3:	d8 c0                	fadd   %st(0),%st
    50c5:	dd 45 b0             	fldl   -0x50(%ebp)
    50c8:	de e1                	fsubp  %st,%st(1)
    50ca:	dc 45 f0             	faddl  -0x10(%ebp)
    50cd:	de f9                	fdivrp %st,%st(1)
    50cf:	dd 45 b0             	fldl   -0x50(%ebp)
    50d2:	de e1                	fsubp  %st,%st(1)
    50d4:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    50d7:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    50db:	dd 45 e8             	fldl   -0x18(%ebp)
    50de:	dc 65 e0             	fsubl  -0x20(%ebp)
    50e1:	dd 05 70 b4 00 00    	fldl   0xb470
    50e7:	d9 c9                	fxch   %st(1)
    50e9:	df e9                	fucomip %st(1),%st
    50eb:	dd d8                	fstp   %st(0)
    50ed:	77 12                	ja     5101 <exp+0x13f>
    50ef:	dd 45 e8             	fldl   -0x18(%ebp)
    50f2:	dc 65 e0             	fsubl  -0x20(%ebp)
    50f5:	dd 05 78 b4 00 00    	fldl   0xb478
    50fb:	df e9                	fucomip %st(1),%st
    50fd:	dd d8                	fstp   %st(0)
    50ff:	76 15                	jbe    5116 <exp+0x154>
    5101:	dd 45 d8             	fldl   -0x28(%ebp)
    5104:	dd 05 70 b4 00 00    	fldl   0xb470
    510a:	d9 c9                	fxch   %st(1)
    510c:	df e9                	fucomip %st(1),%st
    510e:	dd d8                	fstp   %st(0)
    5110:	0f 87 33 ff ff ff    	ja     5049 <exp+0x87>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    5116:	dd 45 e8             	fldl   -0x18(%ebp)
    5119:	d9 e8                	fld1   
    511b:	de c1                	faddp  %st,%st(1)
    511d:	c9                   	leave  
    511e:	c3                   	ret    

0000511f <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    511f:	55                   	push   %ebp
    5120:	89 e5                	mov    %esp,%ebp
    5122:	83 ec 78             	sub    $0x78,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    5125:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    5129:	8b 45 08             	mov    0x8(%ebp),%eax
    512c:	89 44 24 04          	mov    %eax,0x4(%esp)
    5130:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5133:	89 04 24             	mov    %eax,(%esp)
    5136:	e8 f8 f1 ff ff       	call   4333 <strcpy>
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    513b:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    5142:	00 
    5143:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5146:	89 04 24             	mov    %eax,(%esp)
    5149:	e8 68 f4 ff ff       	call   45b6 <open>
    514e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5151:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    5155:	75 1b                	jne    5172 <OpenTableFile+0x53>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    5157:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    515a:	89 44 24 08          	mov    %eax,0x8(%esp)
    515e:	c7 44 24 04 ac b4 00 	movl   $0xb4ac,0x4(%esp)
    5165:	00 
    5166:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    516d:	e8 ec f5 ff ff       	call   475e <printf>
    }
    return f;
    5172:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    5175:	c9                   	leave  
    5176:	c3                   	ret    

00005177 <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    5177:	55                   	push   %ebp
    5178:	89 e5                	mov    %esp,%ebp
    517a:	57                   	push   %edi
    517b:	56                   	push   %esi
    517c:	53                   	push   %ebx
    517d:	83 ec 3c             	sub    $0x3c,%esp
	layer *info = fr_ps->header;
    5180:	8b 45 08             	mov    0x8(%ebp),%eax
    5183:	8b 00                	mov    (%eax),%eax
    5185:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    5188:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    518b:	8b 78 14             	mov    0x14(%eax),%edi
    518e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5191:	8b 70 10             	mov    0x10(%eax),%esi
    5194:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5197:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    519a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    519d:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    51a0:	85 c0                	test   %eax,%eax
    51a2:	0f 94 c0             	sete   %al
    51a5:	0f b6 c8             	movzbl %al,%ecx
    51a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    51ab:	8b 50 04             	mov    0x4(%eax),%edx
    51ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    51b1:	8b 00                	mov    (%eax),%eax
    51b3:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    51b7:	89 74 24 18          	mov    %esi,0x18(%esp)
    51bb:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    51bf:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    51c3:	89 54 24 0c          	mov    %edx,0xc(%esp)
    51c7:	89 44 24 08          	mov    %eax,0x8(%esp)
    51cb:	c7 44 24 04 cc b4 00 	movl   $0xb4cc,0x4(%esp)
    51d2:	00 
    51d3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    51da:	e8 7f f5 ff ff       	call   475e <printf>
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    51df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    51e2:	8b 78 2c             	mov    0x2c(%eax),%edi
    51e5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    51e8:	8b 70 28             	mov    0x28(%eax),%esi
    51eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    51ee:	8b 58 24             	mov    0x24(%eax),%ebx
    51f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    51f4:	8b 48 20             	mov    0x20(%eax),%ecx
    51f7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    51fa:	8b 50 1c             	mov    0x1c(%eax),%edx
    51fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5200:	8b 40 18             	mov    0x18(%eax),%eax
    5203:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    5207:	89 74 24 18          	mov    %esi,0x18(%esp)
    520b:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    520f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    5213:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5217:	89 44 24 08          	mov    %eax,0x8(%esp)
    521b:	c7 44 24 04 0c b5 00 	movl   $0xb50c,0x4(%esp)
    5222:	00 
    5223:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    522a:	e8 2f f5 ff ff       	call   475e <printf>
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    522f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5232:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5235:	8b 0c 85 c0 f3 00 00 	mov    0xf3c0(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    523c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    523f:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5242:	dd 04 c5 a0 f3 00 00 	fldl   0xf3a0(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    5249:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    524c:	8b 40 04             	mov    0x4(%eax),%eax
    524f:	8d 50 ff             	lea    -0x1(%eax),%edx
    5252:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5255:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5258:	89 d0                	mov    %edx,%eax
    525a:	c1 e0 04             	shl    $0x4,%eax
    525d:	29 d0                	sub    %edx,%eax
    525f:	01 d8                	add    %ebx,%eax
    5261:	8b 14 85 e0 f2 00 00 	mov    0xf2e0(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    5268:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    526b:	8b 40 04             	mov    0x4(%eax),%eax
    526e:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    5271:	8b 04 85 c0 f2 00 00 	mov    0xf2c0(,%eax,4),%eax
    5278:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    527c:	dd 5c 24 10          	fstpl  0x10(%esp)
    5280:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5284:	89 44 24 08          	mov    %eax,0x8(%esp)
    5288:	c7 44 24 04 34 b5 00 	movl   $0xb534,0x4(%esp)
    528f:	00 
    5290:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5297:	e8 c2 f4 ff ff       	call   475e <printf>
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    529c:	8b 45 08             	mov    0x8(%ebp),%eax
    529f:	8b 48 08             	mov    0x8(%eax),%ecx
    52a2:	8b 45 08             	mov    0x8(%ebp),%eax
    52a5:	8b 50 0c             	mov    0xc(%eax),%edx
    52a8:	8b 45 08             	mov    0x8(%ebp),%eax
    52ab:	8b 40 10             	mov    0x10(%eax),%eax
    52ae:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    52b2:	89 54 24 0c          	mov    %edx,0xc(%esp)
    52b6:	89 44 24 08          	mov    %eax,0x8(%esp)
    52ba:	c7 44 24 04 63 b5 00 	movl   $0xb563,0x4(%esp)
    52c1:	00 
    52c2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    52c9:	e8 90 f4 ff ff       	call   475e <printf>
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    52ce:	83 c4 3c             	add    $0x3c,%esp
    52d1:	5b                   	pop    %ebx
    52d2:	5e                   	pop    %esi
    52d3:	5f                   	pop    %edi
    52d4:	5d                   	pop    %ebp
    52d5:	c3                   	ret    

000052d6 <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    52d6:	55                   	push   %ebp
    52d7:	89 e5                	mov    %esp,%ebp
    52d9:	83 ec 28             	sub    $0x28,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    52dc:	8b 45 08             	mov    0x8(%ebp),%eax
    52df:	89 04 24             	mov    %eax,(%esp)
    52e2:	e8 63 f7 ff ff       	call   4a4a <malloc>
    52e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    52ea:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    52ee:	74 1c                	je     530c <mem_alloc+0x36>
		memset(ptr, 0, block);
    52f0:	8b 45 08             	mov    0x8(%ebp),%eax
    52f3:	89 44 24 08          	mov    %eax,0x8(%esp)
    52f7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    52fe:	00 
    52ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5302:	89 04 24             	mov    %eax,(%esp)
    5305:	e8 bf f0 ff ff       	call   43c9 <memset>
    530a:	eb 20                	jmp    532c <mem_alloc+0x56>
	else{
		printf(0, "Unable to allocate %s\n", item);
    530c:	8b 45 0c             	mov    0xc(%ebp),%eax
    530f:	89 44 24 08          	mov    %eax,0x8(%esp)
    5313:	c7 44 24 04 7d b5 00 	movl   $0xb57d,0x4(%esp)
    531a:	00 
    531b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5322:	e8 37 f4 ff ff       	call   475e <printf>
		exit();
    5327:	e8 4a f2 ff ff       	call   4576 <exit>
	}
	return ptr;
    532c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    532f:	c9                   	leave  
    5330:	c3                   	ret    

00005331 <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    5331:	55                   	push   %ebp
    5332:	89 e5                	mov    %esp,%ebp
    5334:	83 ec 18             	sub    $0x18,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    5337:	8b 45 0c             	mov    0xc(%ebp),%eax
    533a:	c7 44 24 04 94 b5 00 	movl   $0xb594,0x4(%esp)
    5341:	00 
    5342:	89 04 24             	mov    %eax,(%esp)
    5345:	e8 8c ff ff ff       	call   52d6 <mem_alloc>
    534a:	8b 55 08             	mov    0x8(%ebp),%edx
    534d:	89 42 04             	mov    %eax,0x4(%edx)
	bs->buf_size = size;
    5350:	8b 45 08             	mov    0x8(%ebp),%eax
    5353:	8b 55 0c             	mov    0xc(%ebp),%edx
    5356:	89 50 08             	mov    %edx,0x8(%eax)
}
    5359:	c9                   	leave  
    535a:	c3                   	ret    

0000535b <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    535b:	55                   	push   %ebp
    535c:	89 e5                	mov    %esp,%ebp
    535e:	83 ec 18             	sub    $0x18,%esp
	free(bs->buf);
    5361:	8b 45 08             	mov    0x8(%ebp),%eax
    5364:	8b 40 04             	mov    0x4(%eax),%eax
    5367:	89 04 24             	mov    %eax,(%esp)
    536a:	e8 a2 f5 ff ff       	call   4911 <free>
}
    536f:	c9                   	leave  
    5370:	c3                   	ret    

00005371 <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    5371:	55                   	push   %ebp
    5372:	89 e5                	mov    %esp,%ebp
    5374:	83 ec 18             	sub    $0x18,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    5377:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    537e:	00 
    537f:	8b 45 0c             	mov    0xc(%ebp),%eax
    5382:	89 04 24             	mov    %eax,(%esp)
    5385:	e8 2c f2 ff ff       	call   45b6 <open>
    538a:	8b 55 08             	mov    0x8(%ebp),%edx
    538d:	89 02                	mov    %eax,(%edx)
    538f:	8b 45 08             	mov    0x8(%ebp),%eax
    5392:	8b 00                	mov    (%eax),%eax
    5394:	83 f8 ff             	cmp    $0xffffffff,%eax
    5397:	75 20                	jne    53b9 <open_bit_stream_r+0x48>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    5399:	8b 45 0c             	mov    0xc(%ebp),%eax
    539c:	89 44 24 08          	mov    %eax,0x8(%esp)
    53a0:	c7 44 24 04 9b b5 00 	movl   $0xb59b,0x4(%esp)
    53a7:	00 
    53a8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    53af:	e8 aa f3 ff ff       	call   475e <printf>
		exit();
    53b4:	e8 bd f1 ff ff       	call   4576 <exit>
	}

	bs->format = BINARY;
    53b9:	8b 45 08             	mov    0x8(%ebp),%eax
    53bc:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    53c0:	8b 45 10             	mov    0x10(%ebp),%eax
    53c3:	89 44 24 04          	mov    %eax,0x4(%esp)
    53c7:	8b 45 08             	mov    0x8(%ebp),%eax
    53ca:	89 04 24             	mov    %eax,(%esp)
    53cd:	e8 5f ff ff ff       	call   5331 <alloc_buffer>
	bs->buf_byte_idx=0;
    53d2:	8b 45 08             	mov    0x8(%ebp),%eax
    53d5:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    53dc:	8b 45 08             	mov    0x8(%ebp),%eax
    53df:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    53e6:	8b 45 08             	mov    0x8(%ebp),%eax
    53e9:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    53f0:	8b 45 08             	mov    0x8(%ebp),%eax
    53f3:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    53fa:	8b 45 08             	mov    0x8(%ebp),%eax
    53fd:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    5404:	8b 45 08             	mov    0x8(%ebp),%eax
    5407:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    540e:	c9                   	leave  
    540f:	c3                   	ret    

00005410 <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    5410:	55                   	push   %ebp
    5411:	89 e5                	mov    %esp,%ebp
    5413:	83 ec 18             	sub    $0x18,%esp
	close(bs->pt);
    5416:	8b 45 08             	mov    0x8(%ebp),%eax
    5419:	8b 00                	mov    (%eax),%eax
    541b:	89 04 24             	mov    %eax,(%esp)
    541e:	e8 7b f1 ff ff       	call   459e <close>
	desalloc_buffer(bs);
    5423:	8b 45 08             	mov    0x8(%ebp),%eax
    5426:	89 04 24             	mov    %eax,(%esp)
    5429:	e8 2d ff ff ff       	call   535b <desalloc_buffer>
}
    542e:	c9                   	leave  
    542f:	c3                   	ret    

00005430 <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    5430:	55                   	push   %ebp
    5431:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    5433:	8b 45 08             	mov    0x8(%ebp),%eax
    5436:	8b 40 20             	mov    0x20(%eax),%eax
}
    5439:	5d                   	pop    %ebp
    543a:	c3                   	ret    

0000543b <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    543b:	55                   	push   %ebp
    543c:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    543e:	8b 45 08             	mov    0x8(%ebp),%eax
    5441:	8b 40 0c             	mov    0xc(%eax),%eax
}
    5444:	5d                   	pop    %ebp
    5445:	c3                   	ret    

00005446 <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    5446:	55                   	push   %ebp
    5447:	89 e5                	mov    %esp,%ebp
    5449:	56                   	push   %esi
    544a:	53                   	push   %ebx
    544b:	83 ec 10             	sub    $0x10,%esp
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    544e:	8b 45 08             	mov    0x8(%ebp),%eax
    5451:	8b 40 08             	mov    0x8(%eax),%eax
    5454:	8d 50 fe             	lea    -0x2(%eax),%edx
    5457:	8b 45 08             	mov    0x8(%ebp),%eax
    545a:	8b 40 10             	mov    0x10(%eax),%eax
    545d:	89 d3                	mov    %edx,%ebx
    545f:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    5461:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    5466:	eb 35                	jmp    549d <refill_buffer+0x57>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    5468:	8b 45 08             	mov    0x8(%ebp),%eax
    546b:	8b 50 04             	mov    0x4(%eax),%edx
    546e:	89 d8                	mov    %ebx,%eax
    5470:	8d 58 ff             	lea    -0x1(%eax),%ebx
    5473:	01 c2                	add    %eax,%edx
    5475:	8b 45 08             	mov    0x8(%ebp),%eax
    5478:	8b 00                	mov    (%eax),%eax
    547a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    5481:	00 
    5482:	89 54 24 04          	mov    %edx,0x4(%esp)
    5486:	89 04 24             	mov    %eax,(%esp)
    5489:	e8 00 f1 ff ff       	call   458e <read>
    548e:	89 c6                	mov    %eax,%esi
		if (!n)
    5490:	85 f6                	test   %esi,%esi
    5492:	75 09                	jne    549d <refill_buffer+0x57>
		bs->eob= i+1;
    5494:	8d 53 01             	lea    0x1(%ebx),%edx
    5497:	8b 45 08             	mov    0x8(%ebp),%eax
    549a:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    549d:	85 db                	test   %ebx,%ebx
    549f:	78 0a                	js     54ab <refill_buffer+0x65>
    54a1:	8b 45 08             	mov    0x8(%ebp),%eax
    54a4:	8b 40 1c             	mov    0x1c(%eax),%eax
    54a7:	85 c0                	test   %eax,%eax
    54a9:	74 bd                	je     5468 <refill_buffer+0x22>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    54ab:	83 c4 10             	add    $0x10,%esp
    54ae:	5b                   	pop    %ebx
    54af:	5e                   	pop    %esi
    54b0:	5d                   	pop    %ebp
    54b1:	c3                   	ret    

000054b2 <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    54b2:	55                   	push   %ebp
    54b3:	89 e5                	mov    %esp,%ebp
    54b5:	53                   	push   %ebx
    54b6:	83 ec 24             	sub    $0x24,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    54b9:	8b 45 08             	mov    0x8(%ebp),%eax
    54bc:	8b 40 0c             	mov    0xc(%eax),%eax
    54bf:	8d 50 01             	lea    0x1(%eax),%edx
    54c2:	8b 45 08             	mov    0x8(%ebp),%eax
    54c5:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    54c8:	8b 45 08             	mov    0x8(%ebp),%eax
    54cb:	8b 40 14             	mov    0x14(%eax),%eax
    54ce:	85 c0                	test   %eax,%eax
    54d0:	0f 85 9f 00 00 00    	jne    5575 <get1bit+0xc3>
        bs->buf_bit_idx = 8;
    54d6:	8b 45 08             	mov    0x8(%ebp),%eax
    54d9:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    54e0:	8b 45 08             	mov    0x8(%ebp),%eax
    54e3:	8b 40 10             	mov    0x10(%eax),%eax
    54e6:	8d 50 ff             	lea    -0x1(%eax),%edx
    54e9:	8b 45 08             	mov    0x8(%ebp),%eax
    54ec:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    54ef:	8b 45 08             	mov    0x8(%ebp),%eax
    54f2:	8b 40 10             	mov    0x10(%eax),%eax
    54f5:	83 f8 03             	cmp    $0x3,%eax
    54f8:	7e 10                	jle    550a <get1bit+0x58>
    54fa:	8b 45 08             	mov    0x8(%ebp),%eax
    54fd:	8b 50 10             	mov    0x10(%eax),%edx
    5500:	8b 45 08             	mov    0x8(%ebp),%eax
    5503:	8b 40 1c             	mov    0x1c(%eax),%eax
    5506:	39 c2                	cmp    %eax,%edx
    5508:	7d 6b                	jge    5575 <get1bit+0xc3>
             if (bs->eob)
    550a:	8b 45 08             	mov    0x8(%ebp),%eax
    550d:	8b 40 1c             	mov    0x1c(%eax),%eax
    5510:	85 c0                	test   %eax,%eax
    5512:	74 0c                	je     5520 <get1bit+0x6e>
                bs->eobs = TRUE;
    5514:	8b 45 08             	mov    0x8(%ebp),%eax
    5517:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    551e:	eb 55                	jmp    5575 <get1bit+0xc3>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    5520:	8b 45 08             	mov    0x8(%ebp),%eax
    5523:	8b 58 10             	mov    0x10(%eax),%ebx
    5526:	eb 2f                	jmp    5557 <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    5528:	8b 45 08             	mov    0x8(%ebp),%eax
    552b:	8b 50 04             	mov    0x4(%eax),%edx
    552e:	8b 45 08             	mov    0x8(%ebp),%eax
    5531:	8b 40 08             	mov    0x8(%eax),%eax
    5534:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5537:	8b 45 08             	mov    0x8(%ebp),%eax
    553a:	8b 40 10             	mov    0x10(%eax),%eax
    553d:	29 c1                	sub    %eax,%ecx
    553f:	89 c8                	mov    %ecx,%eax
    5541:	01 d8                	add    %ebx,%eax
    5543:	01 c2                	add    %eax,%edx
    5545:	8b 45 08             	mov    0x8(%ebp),%eax
    5548:	8b 48 04             	mov    0x4(%eax),%ecx
    554b:	89 d8                	mov    %ebx,%eax
    554d:	01 c8                	add    %ecx,%eax
    554f:	0f b6 00             	movzbl (%eax),%eax
    5552:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    5554:	83 eb 01             	sub    $0x1,%ebx
    5557:	85 db                	test   %ebx,%ebx
    5559:	79 cd                	jns    5528 <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    555b:	8b 45 08             	mov    0x8(%ebp),%eax
    555e:	89 04 24             	mov    %eax,(%esp)
    5561:	e8 e0 fe ff ff       	call   5446 <refill_buffer>
                bs->buf_byte_idx = bs->buf_size-1;
    5566:	8b 45 08             	mov    0x8(%ebp),%eax
    5569:	8b 40 08             	mov    0x8(%eax),%eax
    556c:	8d 50 ff             	lea    -0x1(%eax),%edx
    556f:	8b 45 08             	mov    0x8(%ebp),%eax
    5572:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    5575:	8b 45 08             	mov    0x8(%ebp),%eax
    5578:	8b 50 04             	mov    0x4(%eax),%edx
    557b:	8b 45 08             	mov    0x8(%ebp),%eax
    557e:	8b 40 10             	mov    0x10(%eax),%eax
    5581:	01 d0                	add    %edx,%eax
    5583:	0f b6 00             	movzbl (%eax),%eax
    5586:	0f b6 d0             	movzbl %al,%edx
    5589:	8b 45 08             	mov    0x8(%ebp),%eax
    558c:	8b 40 14             	mov    0x14(%eax),%eax
    558f:	83 e8 01             	sub    $0x1,%eax
    5592:	8b 04 85 e0 f3 00 00 	mov    0xf3e0(,%eax,4),%eax
    5599:	21 d0                	and    %edx,%eax
    559b:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    559e:	8b 45 08             	mov    0x8(%ebp),%eax
    55a1:	8b 40 14             	mov    0x14(%eax),%eax
    55a4:	83 e8 01             	sub    $0x1,%eax
    55a7:	89 c1                	mov    %eax,%ecx
    55a9:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    55ac:	8b 45 08             	mov    0x8(%ebp),%eax
    55af:	8b 40 14             	mov    0x14(%eax),%eax
    55b2:	8d 50 ff             	lea    -0x1(%eax),%edx
    55b5:	8b 45 08             	mov    0x8(%ebp),%eax
    55b8:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    55bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    55be:	83 c4 24             	add    $0x24,%esp
    55c1:	5b                   	pop    %ebx
    55c2:	5d                   	pop    %ebp
    55c3:	c3                   	ret    

000055c4 <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    55c4:	55                   	push   %ebp
    55c5:	89 e5                	mov    %esp,%ebp
    55c7:	57                   	push   %edi
    55c8:	56                   	push   %esi
    55c9:	53                   	push   %ebx
    55ca:	83 ec 2c             	sub    $0x2c,%esp
	unsigned long val=0;
    55cd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    55d4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    55d7:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    55db:	7e 1c                	jle    55f9 <getbits+0x35>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    55dd:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
    55e4:	00 
    55e5:	c7 44 24 04 b4 b5 00 	movl   $0xb5b4,0x4(%esp)
    55ec:	00 
    55ed:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    55f4:	e8 65 f1 ff ff       	call   475e <printf>

	bs->totbit += N;
    55f9:	8b 45 08             	mov    0x8(%ebp),%eax
    55fc:	8b 50 0c             	mov    0xc(%eax),%edx
    55ff:	8b 45 0c             	mov    0xc(%ebp),%eax
    5602:	01 c2                	add    %eax,%edx
    5604:	8b 45 08             	mov    0x8(%ebp),%eax
    5607:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    560a:	e9 0a 01 00 00       	jmp    5719 <getbits+0x155>
		if (!bs->buf_bit_idx) {
    560f:	8b 45 08             	mov    0x8(%ebp),%eax
    5612:	8b 40 14             	mov    0x14(%eax),%eax
    5615:	85 c0                	test   %eax,%eax
    5617:	0f 85 9f 00 00 00    	jne    56bc <getbits+0xf8>
			bs->buf_bit_idx = 8;
    561d:	8b 45 08             	mov    0x8(%ebp),%eax
    5620:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    5627:	8b 45 08             	mov    0x8(%ebp),%eax
    562a:	8b 40 10             	mov    0x10(%eax),%eax
    562d:	8d 50 ff             	lea    -0x1(%eax),%edx
    5630:	8b 45 08             	mov    0x8(%ebp),%eax
    5633:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    5636:	8b 45 08             	mov    0x8(%ebp),%eax
    5639:	8b 40 10             	mov    0x10(%eax),%eax
    563c:	83 f8 03             	cmp    $0x3,%eax
    563f:	7e 10                	jle    5651 <getbits+0x8d>
    5641:	8b 45 08             	mov    0x8(%ebp),%eax
    5644:	8b 50 10             	mov    0x10(%eax),%edx
    5647:	8b 45 08             	mov    0x8(%ebp),%eax
    564a:	8b 40 1c             	mov    0x1c(%eax),%eax
    564d:	39 c2                	cmp    %eax,%edx
    564f:	7d 6b                	jge    56bc <getbits+0xf8>
				if (bs->eob)
    5651:	8b 45 08             	mov    0x8(%ebp),%eax
    5654:	8b 40 1c             	mov    0x1c(%eax),%eax
    5657:	85 c0                	test   %eax,%eax
    5659:	74 0c                	je     5667 <getbits+0xa3>
					bs->eobs = TRUE;
    565b:	8b 45 08             	mov    0x8(%ebp),%eax
    565e:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    5665:	eb 55                	jmp    56bc <getbits+0xf8>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    5667:	8b 45 08             	mov    0x8(%ebp),%eax
    566a:	8b 70 10             	mov    0x10(%eax),%esi
    566d:	eb 2f                	jmp    569e <getbits+0xda>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    566f:	8b 45 08             	mov    0x8(%ebp),%eax
    5672:	8b 50 04             	mov    0x4(%eax),%edx
    5675:	8b 45 08             	mov    0x8(%ebp),%eax
    5678:	8b 40 08             	mov    0x8(%eax),%eax
    567b:	8d 48 ff             	lea    -0x1(%eax),%ecx
    567e:	8b 45 08             	mov    0x8(%ebp),%eax
    5681:	8b 40 10             	mov    0x10(%eax),%eax
    5684:	29 c1                	sub    %eax,%ecx
    5686:	89 c8                	mov    %ecx,%eax
    5688:	01 f0                	add    %esi,%eax
    568a:	01 c2                	add    %eax,%edx
    568c:	8b 45 08             	mov    0x8(%ebp),%eax
    568f:	8b 48 04             	mov    0x4(%eax),%ecx
    5692:	89 f0                	mov    %esi,%eax
    5694:	01 c8                	add    %ecx,%eax
    5696:	0f b6 00             	movzbl (%eax),%eax
    5699:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    569b:	83 ee 01             	sub    $0x1,%esi
    569e:	85 f6                	test   %esi,%esi
    56a0:	79 cd                	jns    566f <getbits+0xab>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    56a2:	8b 45 08             	mov    0x8(%ebp),%eax
    56a5:	89 04 24             	mov    %eax,(%esp)
    56a8:	e8 99 fd ff ff       	call   5446 <refill_buffer>
					bs->buf_byte_idx = bs->buf_size-1;
    56ad:	8b 45 08             	mov    0x8(%ebp),%eax
    56b0:	8b 40 08             	mov    0x8(%eax),%eax
    56b3:	8d 50 ff             	lea    -0x1(%eax),%edx
    56b6:	8b 45 08             	mov    0x8(%ebp),%eax
    56b9:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    56bc:	8b 45 08             	mov    0x8(%ebp),%eax
    56bf:	8b 40 14             	mov    0x14(%eax),%eax
    56c2:	39 d8                	cmp    %ebx,%eax
    56c4:	0f 4f c3             	cmovg  %ebx,%eax
    56c7:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    56c9:	8b 45 08             	mov    0x8(%ebp),%eax
    56cc:	8b 50 04             	mov    0x4(%eax),%edx
    56cf:	8b 45 08             	mov    0x8(%ebp),%eax
    56d2:	8b 40 10             	mov    0x10(%eax),%eax
    56d5:	01 d0                	add    %edx,%eax
    56d7:	0f b6 00             	movzbl (%eax),%eax
    56da:	0f b6 d0             	movzbl %al,%edx
    56dd:	8b 45 08             	mov    0x8(%ebp),%eax
    56e0:	8b 40 14             	mov    0x14(%eax),%eax
    56e3:	8b 04 85 00 f4 00 00 	mov    0xf400(,%eax,4),%eax
    56ea:	89 d7                	mov    %edx,%edi
    56ec:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    56ee:	8b 45 08             	mov    0x8(%ebp),%eax
    56f1:	8b 40 14             	mov    0x14(%eax),%eax
    56f4:	29 f0                	sub    %esi,%eax
    56f6:	89 c1                	mov    %eax,%ecx
    56f8:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    56fa:	89 d8                	mov    %ebx,%eax
    56fc:	29 f0                	sub    %esi,%eax
    56fe:	89 c1                	mov    %eax,%ecx
    5700:	d3 e7                	shl    %cl,%edi
    5702:	89 f8                	mov    %edi,%eax
    5704:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    5707:	8b 45 08             	mov    0x8(%ebp),%eax
    570a:	8b 40 14             	mov    0x14(%eax),%eax
    570d:	29 f0                	sub    %esi,%eax
    570f:	89 c2                	mov    %eax,%edx
    5711:	8b 45 08             	mov    0x8(%ebp),%eax
    5714:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    5717:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    5719:	85 db                	test   %ebx,%ebx
    571b:	0f 8f ee fe ff ff    	jg     560f <getbits+0x4b>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    5721:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    5724:	83 c4 2c             	add    $0x2c,%esp
    5727:	5b                   	pop    %ebx
    5728:	5e                   	pop    %esi
    5729:	5f                   	pop    %edi
    572a:	5d                   	pop    %ebp
    572b:	c3                   	ret    

0000572c <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    572c:	55                   	push   %ebp
    572d:	89 e5                	mov    %esp,%ebp
    572f:	83 ec 38             	sub    $0x38,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    5732:	db 45 10             	fildl  0x10(%ebp)
    5735:	dd 5c 24 08          	fstpl  0x8(%esp)
    5739:	dd 05 20 b6 00 00    	fldl   0xb620
    573f:	dd 1c 24             	fstpl  (%esp)
    5742:	e8 ec f4 ff ff       	call   4c33 <pow>
    5747:	d9 7d e6             	fnstcw -0x1a(%ebp)
    574a:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    574e:	b4 0c                	mov    $0xc,%ah
    5750:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    5754:	d9 6d e4             	fldcw  -0x1c(%ebp)
    5757:	db 5d e0             	fistpl -0x20(%ebp)
    575a:	d9 6d e6             	fldcw  -0x1a(%ebp)
    575d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5760:	83 e8 01             	sub    $0x1,%eax
    5763:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    5766:	8b 45 08             	mov    0x8(%ebp),%eax
    5769:	89 04 24             	mov    %eax,(%esp)
    576c:	e8 ca fc ff ff       	call   543b <sstell>
    5771:	83 e0 07             	and    $0x7,%eax
    5774:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    5777:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    577b:	74 17                	je     5794 <seek_sync+0x68>
		getbits(bs, (int)(ALIGNING-aligning));
    577d:	b8 08 00 00 00       	mov    $0x8,%eax
    5782:	2b 45 ec             	sub    -0x14(%ebp),%eax
    5785:	89 44 24 04          	mov    %eax,0x4(%esp)
    5789:	8b 45 08             	mov    0x8(%ebp),%eax
    578c:	89 04 24             	mov    %eax,(%esp)
    578f:	e8 30 fe ff ff       	call   55c4 <getbits>

	val = getbits(bs, N);
    5794:	8b 45 10             	mov    0x10(%ebp),%eax
    5797:	89 44 24 04          	mov    %eax,0x4(%esp)
    579b:	8b 45 08             	mov    0x8(%ebp),%eax
    579e:	89 04 24             	mov    %eax,(%esp)
    57a1:	e8 1e fe ff ff       	call   55c4 <getbits>
    57a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    57a9:	eb 1a                	jmp    57c5 <seek_sync+0x99>
		val <<= ALIGNING;
    57ab:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    57af:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    57b6:	00 
    57b7:	8b 45 08             	mov    0x8(%ebp),%eax
    57ba:	89 04 24             	mov    %eax,(%esp)
    57bd:	e8 02 fe ff ff       	call   55c4 <getbits>
    57c2:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    57c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    57c8:	23 45 f4             	and    -0xc(%ebp),%eax
    57cb:	3b 45 0c             	cmp    0xc(%ebp),%eax
    57ce:	74 0f                	je     57df <seek_sync+0xb3>
    57d0:	8b 45 08             	mov    0x8(%ebp),%eax
    57d3:	89 04 24             	mov    %eax,(%esp)
    57d6:	e8 55 fc ff ff       	call   5430 <end_bs>
    57db:	85 c0                	test   %eax,%eax
    57dd:	74 cc                	je     57ab <seek_sync+0x7f>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    57df:	8b 45 08             	mov    0x8(%ebp),%eax
    57e2:	89 04 24             	mov    %eax,(%esp)
    57e5:	e8 46 fc ff ff       	call   5430 <end_bs>
    57ea:	85 c0                	test   %eax,%eax
    57ec:	74 07                	je     57f5 <seek_sync+0xc9>
		return(0);
    57ee:	b8 00 00 00 00       	mov    $0x0,%eax
    57f3:	eb 05                	jmp    57fa <seek_sync+0xce>
	else
		return(1);
    57f5:	b8 01 00 00 00       	mov    $0x1,%eax
}
    57fa:	c9                   	leave  
    57fb:	c3                   	ret    

000057fc <js_bound>:

int js_bound(int lay, int m_ext)
{
    57fc:	55                   	push   %ebp
    57fd:	89 e5                	mov    %esp,%ebp
    57ff:	83 ec 18             	sub    $0x18,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    5802:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    5806:	7e 12                	jle    581a <js_bound+0x1e>
    5808:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    580c:	7f 0c                	jg     581a <js_bound+0x1e>
    580e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    5812:	78 06                	js     581a <js_bound+0x1e>
    5814:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    5818:	7e 27                	jle    5841 <js_bound+0x45>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    581a:	8b 45 0c             	mov    0xc(%ebp),%eax
    581d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5821:	8b 45 08             	mov    0x8(%ebp),%eax
    5824:	89 44 24 08          	mov    %eax,0x8(%esp)
    5828:	c7 44 24 04 e8 b5 00 	movl   $0xb5e8,0x4(%esp)
    582f:	00 
    5830:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5837:	e8 22 ef ff ff       	call   475e <printf>
        exit();
    583c:	e8 35 ed ff ff       	call   4576 <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    5841:	8b 45 08             	mov    0x8(%ebp),%eax
    5844:	83 e8 01             	sub    $0x1,%eax
    5847:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    584e:	8b 45 0c             	mov    0xc(%ebp),%eax
    5851:	01 d0                	add    %edx,%eax
    5853:	8b 04 85 40 f4 00 00 	mov    0xf440(,%eax,4),%eax
}
    585a:	c9                   	leave  
    585b:	c3                   	ret    

0000585c <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    585c:	55                   	push   %ebp
    585d:	89 e5                	mov    %esp,%ebp
    585f:	83 ec 28             	sub    $0x28,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    5862:	8b 45 08             	mov    0x8(%ebp),%eax
    5865:	8b 00                	mov    (%eax),%eax
    5867:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    586a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    586d:	8b 50 1c             	mov    0x1c(%eax),%edx
    5870:	8b 45 08             	mov    0x8(%ebp),%eax
    5873:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    5876:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5879:	8b 40 1c             	mov    0x1c(%eax),%eax
    587c:	83 f8 03             	cmp    $0x3,%eax
    587f:	75 07                	jne    5888 <hdr_to_frps+0x2c>
    5881:	b8 01 00 00 00       	mov    $0x1,%eax
    5886:	eb 05                	jmp    588d <hdr_to_frps+0x31>
    5888:	b8 02 00 00 00       	mov    $0x2,%eax
    588d:	8b 55 08             	mov    0x8(%ebp),%edx
    5890:	89 42 08             	mov    %eax,0x8(%edx)
	fr_ps->sblimit = SBLIMIT;
    5893:	8b 45 08             	mov    0x8(%ebp),%eax
    5896:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    589d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    58a0:	8b 40 1c             	mov    0x1c(%eax),%eax
    58a3:	83 f8 01             	cmp    $0x1,%eax
    58a6:	75 20                	jne    58c8 <hdr_to_frps+0x6c>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    58a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    58ab:	8b 50 20             	mov    0x20(%eax),%edx
    58ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    58b1:	8b 40 04             	mov    0x4(%eax),%eax
    58b4:	89 54 24 04          	mov    %edx,0x4(%esp)
    58b8:	89 04 24             	mov    %eax,(%esp)
    58bb:	e8 3c ff ff ff       	call   57fc <js_bound>
    58c0:	8b 55 08             	mov    0x8(%ebp),%edx
    58c3:	89 42 0c             	mov    %eax,0xc(%edx)
    58c6:	eb 0c                	jmp    58d4 <hdr_to_frps+0x78>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    58c8:	8b 45 08             	mov    0x8(%ebp),%eax
    58cb:	8b 50 10             	mov    0x10(%eax),%edx
    58ce:	8b 45 08             	mov    0x8(%ebp),%eax
    58d1:	89 50 0c             	mov    %edx,0xc(%eax)
}
    58d4:	c9                   	leave  
    58d5:	c3                   	ret    

000058d6 <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    58d6:	55                   	push   %ebp
    58d7:	89 e5                	mov    %esp,%ebp
    58d9:	83 ec 18             	sub    $0x18,%esp
	if (N != 8) {
    58dc:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    58e0:	74 19                	je     58fb <hputbuf+0x25>
		printf(0,"Not Supported yet!!\n");
    58e2:	c7 44 24 04 0b b6 00 	movl   $0xb60b,0x4(%esp)
    58e9:	00 
    58ea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    58f1:	e8 68 ee ff ff       	call   475e <printf>
		exit();
    58f6:	e8 7b ec ff ff       	call   4576 <exit>
	}
	getCoreBuf(1, val);
    58fb:	8b 45 08             	mov    0x8(%ebp),%eax
    58fe:	89 44 24 04          	mov    %eax,0x4(%esp)
    5902:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    5909:	e8 68 ed ff ff       	call   4676 <getCoreBuf>
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    590e:	c9                   	leave  
    590f:	c3                   	ret    

00005910 <hsstell>:

unsigned long hsstell()
{
    5910:	55                   	push   %ebp
    5911:	89 e5                	mov    %esp,%ebp
    5913:	83 ec 18             	sub    $0x18,%esp
	return getCoreBuf(2, 0);
    5916:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    591d:	00 
    591e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    5925:	e8 4c ed ff ff       	call   4676 <getCoreBuf>
//	return(totbit);
}
    592a:	c9                   	leave  
    592b:	c3                   	ret    

0000592c <hgetbits>:

unsigned long hgetbits(int N)
{
    592c:	55                   	push   %ebp
    592d:	89 e5                	mov    %esp,%ebp
    592f:	83 ec 18             	sub    $0x18,%esp

	return getCoreBuf(3, N);
    5932:	8b 45 08             	mov    0x8(%ebp),%eax
    5935:	89 44 24 04          	mov    %eax,0x4(%esp)
    5939:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    5940:	e8 31 ed ff ff       	call   4676 <getCoreBuf>
}
    5945:	c9                   	leave  
    5946:	c3                   	ret    

00005947 <hget1bit>:


unsigned int hget1bit()
{
    5947:	55                   	push   %ebp
    5948:	89 e5                	mov    %esp,%ebp
    594a:	83 ec 18             	sub    $0x18,%esp
	return(hgetbits(1));
    594d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    5954:	e8 d3 ff ff ff       	call   592c <hgetbits>
}
    5959:	c9                   	leave  
    595a:	c3                   	ret    

0000595b <rewindNbits>:


void rewindNbits(int N)
{
    595b:	55                   	push   %ebp
    595c:	89 e5                	mov    %esp,%ebp
    595e:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(4, N);
    5961:	8b 45 08             	mov    0x8(%ebp),%eax
    5964:	89 44 24 04          	mov    %eax,0x4(%esp)
    5968:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    596f:	e8 02 ed ff ff       	call   4676 <getCoreBuf>
}
    5974:	c9                   	leave  
    5975:	c3                   	ret    

00005976 <rewindNbytes>:


void rewindNbytes(int N)
{
    5976:	55                   	push   %ebp
    5977:	89 e5                	mov    %esp,%ebp
    5979:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(5, N);
    597c:	8b 45 08             	mov    0x8(%ebp),%eax
    597f:	89 44 24 04          	mov    %eax,0x4(%esp)
    5983:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    598a:	e8 e7 ec ff ff       	call   4676 <getCoreBuf>
}
    598f:	c9                   	leave  
    5990:	c3                   	ret    

00005991 <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    5991:	55                   	push   %ebp
    5992:	89 e5                	mov    %esp,%ebp
    5994:	57                   	push   %edi
    5995:	56                   	push   %esi
    5996:	53                   	push   %ebx
    5997:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    599d:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    59a1:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    59a5:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    59a9:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    59ad:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    59b1:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    59b5:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    59b9:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    59bd:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    59c1:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    59c5:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    59c9:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    59cd:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    59d1:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    59d5:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    59d9:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    59dd:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    59e1:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    59e5:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    59e9:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    59ed:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    59f1:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    59f5:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    59f9:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    59fd:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    5a01:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    5a05:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    5a09:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    5a0d:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    5a11:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    5a15:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    5a19:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    5a1d:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    5a21:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    5a25:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    5a29:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    5a2d:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    5a31:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    5a35:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    5a39:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    5a3d:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    5a41:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    5a45:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    5a49:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    5a4d:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    5a51:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    5a55:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    5a59:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    5a5d:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    5a61:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    5a65:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    5a69:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    5a6d:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    5a71:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    5a75:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    5a79:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    5a7d:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    5a81:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    5a85:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    5a89:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    5a8d:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    5a91:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    5a95:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    5a99:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    5a9d:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    5aa1:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    5aa5:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    5aa9:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    5aad:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    5ab1:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    5ab5:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    5ab9:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    5abd:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    5ac1:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    5ac5:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    5ac9:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    5acd:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    5ad1:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    5ad5:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    5ad9:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    5add:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    5ae1:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    5ae5:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    5aec:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    5af3:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    5afa:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    5b01:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    5b08:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    5b0f:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    5b16:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    5b1d:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    5b24:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    5b2b:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    5b32:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    5b39:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    5b40:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    5b47:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    5b4e:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    5b55:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    5b5c:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    5b63:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    5b6a:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    5b71:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    5b78:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    5b7f:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    5b86:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    5b8d:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    5b94:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    5b9b:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    5ba2:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    5ba9:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    5bad:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    5bb1:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    5bb5:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    5bb9:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    5bbd:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    5bc1:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    5bc5:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    5bc9:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    5bcd:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    5bd1:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    5bd5:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    5bd9:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    5bdd:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    5be1:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    5be5:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    5be9:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    5bed:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    5bf1:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    5bf5:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    5bf9:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    5bfd:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    5c01:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    5c05:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    5c09:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    5c0d:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    5c11:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    5c15:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    5c19:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    5c1d:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    5c21:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    5c25:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    5c29:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    5c2d:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    5c31:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    5c38:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    5c3f:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    5c46:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    5c4d:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    5c54:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    5c5b:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    5c62:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    5c69:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    5c70:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    5c77:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    5c7e:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    5c85:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    5c8c:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    5c93:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    5c9a:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    5ca1:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    5ca8:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    5caf:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    5cb6:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    5cbd:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    5cc4:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    5ccb:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    5cd2:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    5cd9:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    5ce0:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    5ce7:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    5cee:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    5cf5:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    5cfc:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    5d03:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    5d0a:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    5d11:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    5d18:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    5d1f:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    5d26:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    5d2d:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    5d34:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    5d3b:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    5d42:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    5d49:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    5d50:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    5d57:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    5d5e:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    5d65:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    5d6c:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    5d73:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    5d7a:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    5d81:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    5d88:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    5d8f:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    5d96:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    5d9d:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    5da4:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    5dab:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    5db2:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    5db9:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    5dc0:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    5dc7:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    5dce:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    5dd5:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    5ddc:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    5de3:	8d 95 98 fe ff ff    	lea    -0x168(%ebp),%edx
    5de9:	b8 40 b6 00 00       	mov    $0xb640,%eax
    5dee:	b9 23 00 00 00       	mov    $0x23,%ecx
    5df3:	89 d7                	mov    %edx,%edi
    5df5:	89 c6                	mov    %eax,%esi
    5df7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5df9:	89 f0                	mov    %esi,%eax
    5dfb:	89 fa                	mov    %edi,%edx
    5dfd:	0f b7 08             	movzwl (%eax),%ecx
    5e00:	66 89 0a             	mov    %cx,(%edx)
    5e03:	83 c2 02             	add    $0x2,%edx
    5e06:	83 c0 02             	add    $0x2,%eax

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    5e09:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    5e0f:	ba e0 b6 00 00       	mov    $0xb6e0,%edx
    5e14:	bb 8e 00 00 00       	mov    $0x8e,%ebx
    5e19:	89 c1                	mov    %eax,%ecx
    5e1b:	83 e1 02             	and    $0x2,%ecx
    5e1e:	85 c9                	test   %ecx,%ecx
    5e20:	74 0f                	je     5e31 <read_decoder_table+0x4a0>
    5e22:	0f b7 0a             	movzwl (%edx),%ecx
    5e25:	66 89 08             	mov    %cx,(%eax)
    5e28:	83 c0 02             	add    $0x2,%eax
    5e2b:	83 c2 02             	add    $0x2,%edx
    5e2e:	83 eb 02             	sub    $0x2,%ebx
    5e31:	89 d9                	mov    %ebx,%ecx
    5e33:	c1 e9 02             	shr    $0x2,%ecx
    5e36:	89 c7                	mov    %eax,%edi
    5e38:	89 d6                	mov    %edx,%esi
    5e3a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5e3c:	89 f2                	mov    %esi,%edx
    5e3e:	89 f8                	mov    %edi,%eax
    5e40:	b9 00 00 00 00       	mov    $0x0,%ecx
    5e45:	89 de                	mov    %ebx,%esi
    5e47:	83 e6 02             	and    $0x2,%esi
    5e4a:	85 f6                	test   %esi,%esi
    5e4c:	74 0b                	je     5e59 <read_decoder_table+0x4c8>
    5e4e:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    5e52:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    5e56:	83 c1 02             	add    $0x2,%ecx
    5e59:	83 e3 01             	and    $0x1,%ebx
    5e5c:	85 db                	test   %ebx,%ebx
    5e5e:	74 07                	je     5e67 <read_decoder_table+0x4d6>
    5e60:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    5e64:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    5e67:	8d 95 7c fd ff ff    	lea    -0x284(%ebp),%edx
    5e6d:	b8 80 b7 00 00       	mov    $0xb780,%eax
    5e72:	b9 23 00 00 00       	mov    $0x23,%ecx
    5e77:	89 d7                	mov    %edx,%edi
    5e79:	89 c6                	mov    %eax,%esi
    5e7b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5e7d:	89 f0                	mov    %esi,%eax
    5e7f:	89 fa                	mov    %edi,%edx
    5e81:	0f b7 08             	movzwl (%eax),%ecx
    5e84:	66 89 0a             	mov    %cx,(%edx)
    5e87:	83 c2 02             	add    $0x2,%edx
    5e8a:	83 c0 02             	add    $0x2,%eax

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    5e8d:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    5e93:	ba 20 b8 00 00       	mov    $0xb820,%edx
    5e98:	bb fe 00 00 00       	mov    $0xfe,%ebx
    5e9d:	89 c1                	mov    %eax,%ecx
    5e9f:	83 e1 02             	and    $0x2,%ecx
    5ea2:	85 c9                	test   %ecx,%ecx
    5ea4:	74 0f                	je     5eb5 <read_decoder_table+0x524>
    5ea6:	0f b7 0a             	movzwl (%edx),%ecx
    5ea9:	66 89 08             	mov    %cx,(%eax)
    5eac:	83 c0 02             	add    $0x2,%eax
    5eaf:	83 c2 02             	add    $0x2,%edx
    5eb2:	83 eb 02             	sub    $0x2,%ebx
    5eb5:	89 d9                	mov    %ebx,%ecx
    5eb7:	c1 e9 02             	shr    $0x2,%ecx
    5eba:	89 c7                	mov    %eax,%edi
    5ebc:	89 d6                	mov    %edx,%esi
    5ebe:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5ec0:	89 f2                	mov    %esi,%edx
    5ec2:	89 f8                	mov    %edi,%eax
    5ec4:	b9 00 00 00 00       	mov    $0x0,%ecx
    5ec9:	89 de                	mov    %ebx,%esi
    5ecb:	83 e6 02             	and    $0x2,%esi
    5ece:	85 f6                	test   %esi,%esi
    5ed0:	74 0b                	je     5edd <read_decoder_table+0x54c>
    5ed2:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    5ed6:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    5eda:	83 c1 02             	add    $0x2,%ecx
    5edd:	83 e3 01             	and    $0x1,%ebx
    5ee0:	85 db                	test   %ebx,%ebx
    5ee2:	74 07                	je     5eeb <read_decoder_table+0x55a>
    5ee4:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    5ee8:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    5eeb:	8d 95 80 fb ff ff    	lea    -0x480(%ebp),%edx
    5ef1:	b8 20 b9 00 00       	mov    $0xb920,%eax
    5ef6:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    5efb:	89 d7                	mov    %edx,%edi
    5efd:	89 c6                	mov    %eax,%esi
    5eff:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5f01:	89 f0                	mov    %esi,%eax
    5f03:	89 fa                	mov    %edi,%edx
    5f05:	0f b7 08             	movzwl (%eax),%ecx
    5f08:	66 89 0a             	mov    %cx,(%edx)
    5f0b:	83 c2 02             	add    $0x2,%edx
    5f0e:	83 c0 02             	add    $0x2,%eax

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    5f11:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    5f17:	ba 20 ba 00 00       	mov    $0xba20,%edx
    5f1c:	bb fe 00 00 00       	mov    $0xfe,%ebx
    5f21:	89 c1                	mov    %eax,%ecx
    5f23:	83 e1 02             	and    $0x2,%ecx
    5f26:	85 c9                	test   %ecx,%ecx
    5f28:	74 0f                	je     5f39 <read_decoder_table+0x5a8>
    5f2a:	0f b7 0a             	movzwl (%edx),%ecx
    5f2d:	66 89 08             	mov    %cx,(%eax)
    5f30:	83 c0 02             	add    $0x2,%eax
    5f33:	83 c2 02             	add    $0x2,%edx
    5f36:	83 eb 02             	sub    $0x2,%ebx
    5f39:	89 d9                	mov    %ebx,%ecx
    5f3b:	c1 e9 02             	shr    $0x2,%ecx
    5f3e:	89 c7                	mov    %eax,%edi
    5f40:	89 d6                	mov    %edx,%esi
    5f42:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5f44:	89 f2                	mov    %esi,%edx
    5f46:	89 f8                	mov    %edi,%eax
    5f48:	b9 00 00 00 00       	mov    $0x0,%ecx
    5f4d:	89 de                	mov    %ebx,%esi
    5f4f:	83 e6 02             	and    $0x2,%esi
    5f52:	85 f6                	test   %esi,%esi
    5f54:	74 0b                	je     5f61 <read_decoder_table+0x5d0>
    5f56:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    5f5a:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    5f5e:	83 c1 02             	add    $0x2,%ecx
    5f61:	83 e3 01             	and    $0x1,%ebx
    5f64:	85 db                	test   %ebx,%ebx
    5f66:	74 07                	je     5f6f <read_decoder_table+0x5de>
    5f68:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    5f6c:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    5f6f:	8d 95 84 f6 ff ff    	lea    -0x97c(%ebp),%edx
    5f75:	b8 20 bb 00 00       	mov    $0xbb20,%eax
    5f7a:	b9 ff 00 00 00       	mov    $0xff,%ecx
    5f7f:	89 d7                	mov    %edx,%edi
    5f81:	89 c6                	mov    %eax,%esi
    5f83:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5f85:	89 f0                	mov    %esi,%eax
    5f87:	89 fa                	mov    %edi,%edx
    5f89:	0f b7 08             	movzwl (%eax),%ecx
    5f8c:	66 89 0a             	mov    %cx,(%edx)
    5f8f:	83 c2 02             	add    $0x2,%edx
    5f92:	83 c0 02             	add    $0x2,%eax

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    5f95:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    5f9b:	ba 20 bf 00 00       	mov    $0xbf20,%edx
    5fa0:	bb fe 03 00 00       	mov    $0x3fe,%ebx
    5fa5:	89 c1                	mov    %eax,%ecx
    5fa7:	83 e1 02             	and    $0x2,%ecx
    5faa:	85 c9                	test   %ecx,%ecx
    5fac:	74 0f                	je     5fbd <read_decoder_table+0x62c>
    5fae:	0f b7 0a             	movzwl (%edx),%ecx
    5fb1:	66 89 08             	mov    %cx,(%eax)
    5fb4:	83 c0 02             	add    $0x2,%eax
    5fb7:	83 c2 02             	add    $0x2,%edx
    5fba:	83 eb 02             	sub    $0x2,%ebx
    5fbd:	89 d9                	mov    %ebx,%ecx
    5fbf:	c1 e9 02             	shr    $0x2,%ecx
    5fc2:	89 c7                	mov    %eax,%edi
    5fc4:	89 d6                	mov    %edx,%esi
    5fc6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5fc8:	89 f2                	mov    %esi,%edx
    5fca:	89 f8                	mov    %edi,%eax
    5fcc:	b9 00 00 00 00       	mov    $0x0,%ecx
    5fd1:	89 de                	mov    %ebx,%esi
    5fd3:	83 e6 02             	and    $0x2,%esi
    5fd6:	85 f6                	test   %esi,%esi
    5fd8:	74 0b                	je     5fe5 <read_decoder_table+0x654>
    5fda:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    5fde:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    5fe2:	83 c1 02             	add    $0x2,%ecx
    5fe5:	83 e3 01             	and    $0x1,%ebx
    5fe8:	85 db                	test   %ebx,%ebx
    5fea:	74 07                	je     5ff3 <read_decoder_table+0x662>
    5fec:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    5ff0:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    5ff3:	8d 95 88 ee ff ff    	lea    -0x1178(%ebp),%edx
    5ff9:	b8 20 c3 00 00       	mov    $0xc320,%eax
    5ffe:	b9 ff 00 00 00       	mov    $0xff,%ecx
    6003:	89 d7                	mov    %edx,%edi
    6005:	89 c6                	mov    %eax,%esi
    6007:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    6009:	89 f0                	mov    %esi,%eax
    600b:	89 fa                	mov    %edi,%edx
    600d:	0f b7 08             	movzwl (%eax),%ecx
    6010:	66 89 0a             	mov    %cx,(%edx)
    6013:	83 c2 02             	add    $0x2,%edx
    6016:	83 c0 02             	add    $0x2,%eax

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    6019:	8d 95 88 ea ff ff    	lea    -0x1578(%ebp),%edx
    601f:	bb 20 c7 00 00       	mov    $0xc720,%ebx
    6024:	b8 00 01 00 00       	mov    $0x100,%eax
    6029:	89 d7                	mov    %edx,%edi
    602b:	89 de                	mov    %ebx,%esi
    602d:	89 c1                	mov    %eax,%ecx
    602f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    6031:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    6038:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    603f:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    6046:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    604d:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    6054:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    605b:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    6062:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    6069:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    6070:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    6077:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    607e:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    6085:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    608c:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    6093:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    609a:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    60a1:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    60a8:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    60af:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    60b6:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    60bd:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    60c4:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    60cb:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    60d2:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    60d9:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    60e0:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    60e7:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    60ee:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    60f5:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    60fc:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    6103:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    610a:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    6111:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    6118:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    611f:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    6126:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    612d:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    6134:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    613b:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    6142:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    6149:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    6150:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    6157:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    615e:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    6165:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    616c:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    6173:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    617a:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    6181:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    6188:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    618f:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    6196:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    619d:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    61a4:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    61ab:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    61b2:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    61b9:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    61c0:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    61c7:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    61ce:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    61d5:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    61dc:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    61e3:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    61ea:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    61f1:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    61f8:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    61ff:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    6206:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    620d:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    6214:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    621b:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    6222:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    6229:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    6230:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    6237:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    623e:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    6245:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    624c:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    6253:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    625a:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    6261:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    6268:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    626f:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    6276:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    627d:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    6284:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    628b:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    6292:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    6299:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    62a0:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    62a7:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    62ae:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    62b5:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    62bc:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    62c3:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    62ca:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    62d1:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    62d8:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    62df:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    62e6:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    62ed:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    62f4:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    62fb:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    6302:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    6309:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    6310:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    6317:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    631e:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    6325:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    632c:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    6333:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    633a:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    6341:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    6348:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    634f:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    6356:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    635d:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    6364:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    636b:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    6372:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    6379:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    6380:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    6387:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    638e:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    6395:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    639c:	30 00 
    639e:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    63a5:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    63ac:	00 00 00 
    63af:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    63b6:	00 00 00 
    63b9:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    63c0:	00 00 00 
    63c3:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    63ca:	00 00 00 
    63cd:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    63d4:	ff ff ff 
    63d7:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    63de:	00 00 00 
    63e1:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    63e8:	00 00 00 
    63eb:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    63f2:	00 00 00 
    63f5:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    63fc:	00 00 00 
    63ff:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    6406:	31 00 
    6408:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    640f:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    6416:	00 00 00 
    6419:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    6420:	00 00 00 
    6423:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    642a:	00 00 00 
    642d:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    6434:	00 00 00 
    6437:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    643e:	ff ff ff 
    6441:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    6448:	00 00 00 
    644b:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    6452:	00 00 00 
    6455:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    6458:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    645e:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    6465:	00 00 00 
    6468:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    646f:	32 00 
    6471:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    6478:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    647f:	00 00 00 
    6482:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    6489:	00 00 00 
    648c:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    6493:	00 00 00 
    6496:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    649d:	00 00 00 
    64a0:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    64a7:	ff ff ff 
    64aa:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    64b1:	00 00 00 
    64b4:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    64bb:	00 00 00 
    64be:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    64c1:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    64c7:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    64ce:	00 00 00 
    64d1:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    64d8:	33 00 
    64da:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    64e1:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    64e8:	00 00 00 
    64eb:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    64f2:	00 00 00 
    64f5:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    64fc:	00 00 00 
    64ff:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    6506:	00 00 00 
    6509:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    6510:	ff ff ff 
    6513:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    651a:	00 00 00 
    651d:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    6524:	00 00 00 
    6527:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    652a:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    6530:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    6537:	00 00 00 
    653a:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    6541:	34 00 
    6543:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    654a:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    6551:	00 00 00 
    6554:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    655b:	00 00 00 
    655e:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    6565:	00 00 00 
    6568:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    656f:	00 00 00 
    6572:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    6579:	ff ff ff 
    657c:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    6583:	00 00 00 
    6586:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    658d:	00 00 00 
    6590:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    6597:	00 00 00 
    659a:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    65a1:	00 00 00 
    65a4:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    65ab:	35 00 
    65ad:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    65b4:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    65bb:	00 00 00 
    65be:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    65c5:	00 00 00 
    65c8:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    65cf:	00 00 00 
    65d2:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    65d9:	00 00 00 
    65dc:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    65e3:	ff ff ff 
    65e6:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    65ed:	00 00 00 
    65f0:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    65f7:	00 00 00 
    65fa:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    6600:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    6606:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    660d:	00 00 00 
    6610:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    6617:	36 00 
    6619:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    6620:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    6627:	00 00 00 
    662a:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    6631:	00 00 00 
    6634:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    663b:	00 00 00 
    663e:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    6645:	00 00 00 
    6648:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    664f:	ff ff ff 
    6652:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    6659:	00 00 00 
    665c:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    6663:	00 00 00 
    6666:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    666c:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    6672:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    6679:	00 00 00 
    667c:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    6683:	37 00 
    6685:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    668c:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    6693:	00 00 00 
    6696:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    669d:	00 00 00 
    66a0:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    66a7:	00 00 00 
    66aa:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    66b1:	00 00 00 
    66b4:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    66bb:	ff ff ff 
    66be:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    66c5:	00 00 00 
    66c8:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    66cf:	00 00 00 
    66d2:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    66d8:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    66de:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    66e5:	00 00 00 
    66e8:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    66ef:	38 00 
    66f1:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    66f8:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    66ff:	00 00 00 
    6702:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    6709:	00 00 00 
    670c:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    6713:	00 00 00 
    6716:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    671d:	00 00 00 
    6720:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    6727:	ff ff ff 
    672a:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    6731:	00 00 00 
    6734:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    673b:	00 00 00 
    673e:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    6744:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    674a:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    6751:	00 00 00 
    6754:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    675b:	39 00 
    675d:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    6764:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    676b:	00 00 00 
    676e:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    6775:	00 00 00 
    6778:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    677f:	00 00 00 
    6782:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    6789:	00 00 00 
    678c:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    6793:	ff ff ff 
    6796:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    679d:	00 00 00 
    67a0:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    67a7:	00 00 00 
    67aa:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    67b0:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    67b6:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    67bd:	00 00 00 
    67c0:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    67c7:	31 30 
    67c9:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    67d0:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    67d7:	00 00 00 
    67da:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    67e1:	00 00 00 
    67e4:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    67eb:	00 00 00 
    67ee:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    67f5:	00 00 00 
    67f8:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    67ff:	ff ff ff 
    6802:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    6809:	00 00 00 
    680c:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    6813:	00 00 00 
    6816:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    681c:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    6822:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    6829:	00 00 00 
    682c:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    6833:	31 31 
    6835:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    683c:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    6843:	00 00 00 
    6846:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    684d:	00 00 00 
    6850:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    6857:	00 00 00 
    685a:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    6861:	00 00 00 
    6864:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    686b:	ff ff ff 
    686e:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    6875:	00 00 00 
    6878:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    687f:	00 00 00 
    6882:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    6888:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    688e:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    6895:	00 00 00 
    6898:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    689f:	31 32 
    68a1:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    68a8:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    68af:	00 00 00 
    68b2:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    68b9:	00 00 00 
    68bc:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    68c3:	00 00 00 
    68c6:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    68cd:	00 00 00 
    68d0:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    68d7:	ff ff ff 
    68da:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    68e1:	00 00 00 
    68e4:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    68eb:	00 00 00 
    68ee:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    68f4:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    68fa:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    6901:	00 00 00 
    6904:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    690b:	31 33 
    690d:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    6914:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    691b:	00 00 00 
    691e:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    6925:	00 00 00 
    6928:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    692f:	00 00 00 
    6932:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    6939:	00 00 00 
    693c:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    6943:	ff ff ff 
    6946:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    694d:	00 00 00 
    6950:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    6957:	00 00 00 
    695a:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    6960:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    6966:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    696d:	01 00 00 
    6970:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    6977:	31 34 
    6979:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    6980:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    6987:	00 00 00 
    698a:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    6991:	00 00 00 
    6994:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    699b:	00 00 00 
    699e:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    69a5:	00 00 00 
    69a8:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    69af:	ff ff ff 
    69b2:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    69b9:	00 00 00 
    69bc:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    69c3:	00 00 00 
    69c6:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    69cd:	00 00 00 
    69d0:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    69d7:	00 00 00 
    69da:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    69e1:	31 35 
    69e3:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    69ea:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    69f1:	00 00 00 
    69f4:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    69fb:	00 00 00 
    69fe:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    6a05:	00 00 00 
    6a08:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    6a0f:	00 00 00 
    6a12:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    6a19:	ff ff ff 
    6a1c:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    6a23:	00 00 00 
    6a26:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    6a2d:	00 00 00 
    6a30:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    6a36:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    6a3c:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    6a43:	01 00 00 
    6a46:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    6a4d:	31 36 
    6a4f:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    6a56:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    6a5d:	00 00 00 
    6a60:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    6a67:	00 00 00 
    6a6a:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    6a71:	00 00 00 
    6a74:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    6a7b:	00 00 00 
    6a7e:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    6a85:	ff ff ff 
    6a88:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    6a8f:	00 00 00 
    6a92:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    6a99:	00 00 00 
    6a9c:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6aa2:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    6aa8:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    6aaf:	01 00 00 
    6ab2:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    6ab9:	31 37 
    6abb:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    6ac2:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    6ac9:	00 00 00 
    6acc:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    6ad3:	00 00 00 
    6ad6:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    6add:	00 00 00 
    6ae0:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    6ae7:	00 00 00 
    6aea:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    6af1:	00 00 00 
    6af4:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    6afb:	00 00 00 
    6afe:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    6b05:	00 00 00 
    6b08:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6b0e:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    6b14:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    6b1b:	01 00 00 
    6b1e:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    6b25:	31 38 
    6b27:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    6b2e:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    6b35:	00 00 00 
    6b38:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    6b3f:	00 00 00 
    6b42:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    6b49:	00 00 00 
    6b4c:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    6b53:	00 00 00 
    6b56:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    6b5d:	00 00 00 
    6b60:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    6b67:	00 00 00 
    6b6a:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    6b71:	00 00 00 
    6b74:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6b7a:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    6b80:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    6b87:	01 00 00 
    6b8a:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    6b91:	31 39 
    6b93:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    6b9a:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    6ba1:	00 00 00 
    6ba4:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    6bab:	00 00 00 
    6bae:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    6bb5:	00 00 00 
    6bb8:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    6bbf:	00 00 00 
    6bc2:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    6bc9:	00 00 00 
    6bcc:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    6bd3:	00 00 00 
    6bd6:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    6bdd:	00 00 00 
    6be0:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6be6:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    6bec:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    6bf3:	01 00 00 
    6bf6:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    6bfd:	32 30 
    6bff:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    6c06:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    6c0d:	00 00 00 
    6c10:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    6c17:	00 00 00 
    6c1a:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    6c21:	00 00 00 
    6c24:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    6c2b:	00 00 00 
    6c2e:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    6c35:	00 00 00 
    6c38:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    6c3f:	00 00 00 
    6c42:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    6c49:	00 00 00 
    6c4c:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6c52:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    6c58:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    6c5f:	01 00 00 
    6c62:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    6c69:	32 31 
    6c6b:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    6c72:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    6c79:	00 00 00 
    6c7c:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    6c83:	00 00 00 
    6c86:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    6c8d:	00 00 00 
    6c90:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    6c97:	00 00 00 
    6c9a:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    6ca1:	00 00 00 
    6ca4:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    6cab:	00 00 00 
    6cae:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    6cb5:	00 00 00 
    6cb8:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6cbe:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    6cc4:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    6ccb:	01 00 00 
    6cce:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    6cd5:	32 32 
    6cd7:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    6cde:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    6ce5:	00 00 00 
    6ce8:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    6cef:	00 00 00 
    6cf2:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    6cf9:	00 00 00 
    6cfc:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    6d03:	03 00 00 
    6d06:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    6d0d:	00 00 00 
    6d10:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    6d17:	00 00 00 
    6d1a:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    6d21:	00 00 00 
    6d24:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6d2a:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    6d30:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    6d37:	01 00 00 
    6d3a:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    6d41:	32 33 
    6d43:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    6d4a:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    6d51:	00 00 00 
    6d54:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    6d5b:	00 00 00 
    6d5e:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    6d65:	00 00 00 
    6d68:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    6d6f:	1f 00 00 
    6d72:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    6d79:	00 00 00 
    6d7c:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    6d83:	00 00 00 
    6d86:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    6d8d:	00 00 00 
    6d90:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6d96:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    6d9c:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    6da3:	01 00 00 
    6da6:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    6dad:	32 34 
    6daf:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    6db6:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    6dbd:	00 00 00 
    6dc0:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    6dc7:	00 00 00 
    6dca:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    6dd1:	00 00 00 
    6dd4:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    6ddb:	00 00 00 
    6dde:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    6de5:	ff ff ff 
    6de8:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    6def:	00 00 00 
    6df2:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    6df9:	00 00 00 
    6dfc:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6e02:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    6e08:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    6e0f:	02 00 00 
    6e12:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    6e19:	32 35 
    6e1b:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    6e22:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    6e29:	00 00 00 
    6e2c:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    6e33:	00 00 00 
    6e36:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    6e3d:	00 00 00 
    6e40:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    6e47:	00 00 00 
    6e4a:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    6e51:	00 00 00 
    6e54:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    6e5b:	00 00 00 
    6e5e:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    6e65:	00 00 00 
    6e68:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6e6e:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    6e74:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    6e7b:	02 00 00 
    6e7e:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    6e85:	32 36 
    6e87:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    6e8e:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    6e95:	00 00 00 
    6e98:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    6e9f:	00 00 00 
    6ea2:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    6ea9:	00 00 00 
    6eac:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    6eb3:	00 00 00 
    6eb6:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    6ebd:	00 00 00 
    6ec0:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    6ec7:	00 00 00 
    6eca:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    6ed1:	00 00 00 
    6ed4:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6eda:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    6ee0:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    6ee7:	02 00 00 
    6eea:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    6ef1:	32 37 
    6ef3:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    6efa:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    6f01:	00 00 00 
    6f04:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    6f0b:	00 00 00 
    6f0e:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    6f15:	00 00 00 
    6f18:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    6f1f:	00 00 00 
    6f22:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    6f29:	00 00 00 
    6f2c:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    6f33:	00 00 00 
    6f36:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    6f3d:	00 00 00 
    6f40:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6f46:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    6f4c:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    6f53:	02 00 00 
    6f56:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    6f5d:	32 38 
    6f5f:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    6f66:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    6f6d:	00 00 00 
    6f70:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    6f77:	00 00 00 
    6f7a:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    6f81:	00 00 00 
    6f84:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    6f8b:	00 00 00 
    6f8e:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    6f95:	00 00 00 
    6f98:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    6f9f:	00 00 00 
    6fa2:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    6fa9:	00 00 00 
    6fac:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6fb2:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    6fb8:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    6fbf:	02 00 00 
    6fc2:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    6fc9:	32 39 
    6fcb:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    6fd2:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    6fd9:	00 00 00 
    6fdc:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    6fe3:	00 00 00 
    6fe6:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    6fed:	00 00 00 
    6ff0:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    6ff7:	01 00 00 
    6ffa:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    7001:	00 00 00 
    7004:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    700b:	00 00 00 
    700e:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    7015:	00 00 00 
    7018:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    701e:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    7024:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    702b:	02 00 00 
    702e:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    7035:	33 30 
    7037:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    703e:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    7045:	00 00 00 
    7048:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    704f:	00 00 00 
    7052:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    7059:	00 00 00 
    705c:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    7063:	07 00 00 
    7066:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    706d:	00 00 00 
    7070:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    7077:	00 00 00 
    707a:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    7081:	00 00 00 
    7084:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    708a:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    7090:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    7097:	02 00 00 
    709a:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    70a1:	33 31 
    70a3:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    70aa:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    70b1:	00 00 00 
    70b4:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    70bb:	00 00 00 
    70be:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    70c5:	00 00 00 
    70c8:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    70cf:	1f 00 00 
    70d2:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    70d9:	00 00 00 
    70dc:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    70e3:	00 00 00 
    70e6:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    70ed:	00 00 00 
    70f0:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    70f6:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    70fc:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    7103:	02 00 00 
    7106:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    710d:	33 32 
    710f:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    7116:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    711d:	00 00 00 
    7120:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    7127:	00 00 00 
    712a:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    7131:	00 00 00 
    7134:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    713b:	00 00 00 
    713e:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    7145:	ff ff ff 
    7148:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    714f:	00 00 00 
    7152:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    7159:	00 00 00 
    715c:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    7162:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    7168:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    716f:	00 00 00 
    7172:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    7179:	33 33 
    717b:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    7182:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    7189:	00 00 00 
    718c:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    7193:	00 00 00 
    7196:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    719d:	00 00 00 
    71a0:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    71a7:	00 00 00 
    71aa:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    71b1:	ff ff ff 
    71b4:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    71bb:	00 00 00 
    71be:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    71c5:	00 00 00 
    71c8:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    71ce:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    71d4:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    71db:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    71de:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    71e4:	5b                   	pop    %ebx
    71e5:	5e                   	pop    %esi
    71e6:	5f                   	pop    %edi
    71e7:	5d                   	pop    %ebp
    71e8:	c3                   	ret    

000071e9 <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    71e9:	55                   	push   %ebp
    71ea:	89 e5                	mov    %esp,%ebp
    71ec:	53                   	push   %ebx
    71ed:	83 ec 24             	sub    $0x24,%esp
  HUFFBITS level;
  int point = 0;
    71f0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    71f7:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    71fe:	a1 70 f4 00 00       	mov    0xf470,%eax
    7203:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    7206:	8b 45 08             	mov    0x8(%ebp),%eax
    7209:	8b 40 20             	mov    0x20(%eax),%eax
    720c:	85 c0                	test   %eax,%eax
    720e:	75 0a                	jne    721a <huffman_decoder+0x31>
    7210:	b8 02 00 00 00       	mov    $0x2,%eax
    7215:	e9 0d 03 00 00       	jmp    7527 <huffman_decoder+0x33e>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    721a:	8b 45 08             	mov    0x8(%ebp),%eax
    721d:	8b 40 24             	mov    0x24(%eax),%eax
    7220:	85 c0                	test   %eax,%eax
    7222:	75 1d                	jne    7241 <huffman_decoder+0x58>
  {  *x = *y = 0;
    7224:	8b 45 10             	mov    0x10(%ebp),%eax
    7227:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    722d:	8b 45 10             	mov    0x10(%ebp),%eax
    7230:	8b 10                	mov    (%eax),%edx
    7232:	8b 45 0c             	mov    0xc(%ebp),%eax
    7235:	89 10                	mov    %edx,(%eax)
     return 0;
    7237:	b8 00 00 00 00       	mov    $0x0,%eax
    723c:	e9 e6 02 00 00       	jmp    7527 <huffman_decoder+0x33e>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    7241:	8b 45 08             	mov    0x8(%ebp),%eax
    7244:	8b 40 20             	mov    0x20(%eax),%eax
    7247:	8b 55 f0             	mov    -0x10(%ebp),%edx
    724a:	01 d2                	add    %edx,%edx
    724c:	01 d0                	add    %edx,%eax
    724e:	0f b6 00             	movzbl (%eax),%eax
    7251:	84 c0                	test   %al,%al
    7253:	75 46                	jne    729b <huffman_decoder+0xb2>
      *x = h->val[point][1] >> 4;
    7255:	8b 45 08             	mov    0x8(%ebp),%eax
    7258:	8b 40 20             	mov    0x20(%eax),%eax
    725b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    725e:	01 d2                	add    %edx,%edx
    7260:	01 d0                	add    %edx,%eax
    7262:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7266:	c0 e8 04             	shr    $0x4,%al
    7269:	0f b6 d0             	movzbl %al,%edx
    726c:	8b 45 0c             	mov    0xc(%ebp),%eax
    726f:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    7271:	8b 45 08             	mov    0x8(%ebp),%eax
    7274:	8b 40 20             	mov    0x20(%eax),%eax
    7277:	8b 55 f0             	mov    -0x10(%ebp),%edx
    727a:	01 d2                	add    %edx,%edx
    727c:	01 d0                	add    %edx,%eax
    727e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7282:	0f b6 c0             	movzbl %al,%eax
    7285:	83 e0 0f             	and    $0xf,%eax
    7288:	89 c2                	mov    %eax,%edx
    728a:	8b 45 10             	mov    0x10(%ebp),%eax
    728d:	89 10                	mov    %edx,(%eax)

      error = 0;
    728f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    7296:	e9 af 00 00 00       	jmp    734a <huffman_decoder+0x161>
    } 
    if (hget1bit()) {
    729b:	e8 a7 e6 ff ff       	call   5947 <hget1bit>
    72a0:	85 c0                	test   %eax,%eax
    72a2:	74 47                	je     72eb <huffman_decoder+0x102>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    72a4:	eb 17                	jmp    72bd <huffman_decoder+0xd4>
    72a6:	8b 45 08             	mov    0x8(%ebp),%eax
    72a9:	8b 40 20             	mov    0x20(%eax),%eax
    72ac:	8b 55 f0             	mov    -0x10(%ebp),%edx
    72af:	01 d2                	add    %edx,%edx
    72b1:	01 d0                	add    %edx,%eax
    72b3:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    72b7:	0f b6 c0             	movzbl %al,%eax
    72ba:	01 45 f0             	add    %eax,-0x10(%ebp)
    72bd:	8b 45 08             	mov    0x8(%ebp),%eax
    72c0:	8b 40 20             	mov    0x20(%eax),%eax
    72c3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    72c6:	01 d2                	add    %edx,%edx
    72c8:	01 d0                	add    %edx,%eax
    72ca:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    72ce:	3c f9                	cmp    $0xf9,%al
    72d0:	77 d4                	ja     72a6 <huffman_decoder+0xbd>
      point += h->val[point][1];
    72d2:	8b 45 08             	mov    0x8(%ebp),%eax
    72d5:	8b 40 20             	mov    0x20(%eax),%eax
    72d8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    72db:	01 d2                	add    %edx,%edx
    72dd:	01 d0                	add    %edx,%eax
    72df:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    72e3:	0f b6 c0             	movzbl %al,%eax
    72e6:	01 45 f0             	add    %eax,-0x10(%ebp)
    72e9:	eb 42                	jmp    732d <huffman_decoder+0x144>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    72eb:	eb 16                	jmp    7303 <huffman_decoder+0x11a>
    72ed:	8b 45 08             	mov    0x8(%ebp),%eax
    72f0:	8b 40 20             	mov    0x20(%eax),%eax
    72f3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    72f6:	01 d2                	add    %edx,%edx
    72f8:	01 d0                	add    %edx,%eax
    72fa:	0f b6 00             	movzbl (%eax),%eax
    72fd:	0f b6 c0             	movzbl %al,%eax
    7300:	01 45 f0             	add    %eax,-0x10(%ebp)
    7303:	8b 45 08             	mov    0x8(%ebp),%eax
    7306:	8b 40 20             	mov    0x20(%eax),%eax
    7309:	8b 55 f0             	mov    -0x10(%ebp),%edx
    730c:	01 d2                	add    %edx,%edx
    730e:	01 d0                	add    %edx,%eax
    7310:	0f b6 00             	movzbl (%eax),%eax
    7313:	3c f9                	cmp    $0xf9,%al
    7315:	77 d6                	ja     72ed <huffman_decoder+0x104>
      point += h->val[point][0];
    7317:	8b 45 08             	mov    0x8(%ebp),%eax
    731a:	8b 40 20             	mov    0x20(%eax),%eax
    731d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7320:	01 d2                	add    %edx,%edx
    7322:	01 d0                	add    %edx,%eax
    7324:	0f b6 00             	movzbl (%eax),%eax
    7327:	0f b6 c0             	movzbl %al,%eax
    732a:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    732d:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    7330:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    7334:	0f 85 07 ff ff ff    	jne    7241 <huffman_decoder+0x58>
    733a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    733d:	a1 24 31 01 00       	mov    0x13124,%eax
    7342:	39 c2                	cmp    %eax,%edx
    7344:	0f 82 f7 fe ff ff    	jb     7241 <huffman_decoder+0x58>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    734a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    734e:	74 24                	je     7374 <huffman_decoder+0x18b>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    7350:	8b 45 08             	mov    0x8(%ebp),%eax
    7353:	8b 40 04             	mov    0x4(%eax),%eax
    7356:	83 e8 01             	sub    $0x1,%eax
    7359:	01 c0                	add    %eax,%eax
    735b:	89 c2                	mov    %eax,%edx
    735d:	8b 45 0c             	mov    0xc(%ebp),%eax
    7360:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    7362:	8b 45 08             	mov    0x8(%ebp),%eax
    7365:	8b 40 08             	mov    0x8(%eax),%eax
    7368:	83 e8 01             	sub    $0x1,%eax
    736b:	01 c0                	add    %eax,%eax
    736d:	89 c2                	mov    %eax,%edx
    736f:	8b 45 10             	mov    0x10(%ebp),%eax
    7372:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    7374:	8b 45 08             	mov    0x8(%ebp),%eax
    7377:	0f b6 00             	movzbl (%eax),%eax
    737a:	3c 33                	cmp    $0x33,%al
    737c:	0f 85 ec 00 00 00    	jne    746e <huffman_decoder+0x285>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    7382:	8b 45 08             	mov    0x8(%ebp),%eax
    7385:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7389:	3c 32                	cmp    $0x32,%al
    738b:	74 0f                	je     739c <huffman_decoder+0x1b3>
    738d:	8b 45 08             	mov    0x8(%ebp),%eax
    7390:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    7394:	3c 33                	cmp    $0x33,%al
    7396:	0f 85 d2 00 00 00    	jne    746e <huffman_decoder+0x285>
     *v = (*y>>3) & 1;
    739c:	8b 45 10             	mov    0x10(%ebp),%eax
    739f:	8b 00                	mov    (%eax),%eax
    73a1:	c1 f8 03             	sar    $0x3,%eax
    73a4:	83 e0 01             	and    $0x1,%eax
    73a7:	89 c2                	mov    %eax,%edx
    73a9:	8b 45 14             	mov    0x14(%ebp),%eax
    73ac:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    73ae:	8b 45 10             	mov    0x10(%ebp),%eax
    73b1:	8b 00                	mov    (%eax),%eax
    73b3:	c1 f8 02             	sar    $0x2,%eax
    73b6:	83 e0 01             	and    $0x1,%eax
    73b9:	89 c2                	mov    %eax,%edx
    73bb:	8b 45 18             	mov    0x18(%ebp),%eax
    73be:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    73c0:	8b 45 10             	mov    0x10(%ebp),%eax
    73c3:	8b 00                	mov    (%eax),%eax
    73c5:	d1 f8                	sar    %eax
    73c7:	83 e0 01             	and    $0x1,%eax
    73ca:	89 c2                	mov    %eax,%edx
    73cc:	8b 45 0c             	mov    0xc(%ebp),%eax
    73cf:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    73d1:	8b 45 10             	mov    0x10(%ebp),%eax
    73d4:	8b 00                	mov    (%eax),%eax
    73d6:	83 e0 01             	and    $0x1,%eax
    73d9:	89 c2                	mov    %eax,%edx
    73db:	8b 45 10             	mov    0x10(%ebp),%eax
    73de:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    73e0:	8b 45 14             	mov    0x14(%ebp),%eax
    73e3:	8b 00                	mov    (%eax),%eax
    73e5:	85 c0                	test   %eax,%eax
    73e7:	74 18                	je     7401 <huffman_decoder+0x218>
        if (hget1bit() == 1) *v = -*v;
    73e9:	e8 59 e5 ff ff       	call   5947 <hget1bit>
    73ee:	83 f8 01             	cmp    $0x1,%eax
    73f1:	75 0e                	jne    7401 <huffman_decoder+0x218>
    73f3:	8b 45 14             	mov    0x14(%ebp),%eax
    73f6:	8b 00                	mov    (%eax),%eax
    73f8:	f7 d8                	neg    %eax
    73fa:	89 c2                	mov    %eax,%edx
    73fc:	8b 45 14             	mov    0x14(%ebp),%eax
    73ff:	89 10                	mov    %edx,(%eax)
     if (*w)
    7401:	8b 45 18             	mov    0x18(%ebp),%eax
    7404:	8b 00                	mov    (%eax),%eax
    7406:	85 c0                	test   %eax,%eax
    7408:	74 18                	je     7422 <huffman_decoder+0x239>
        if (hget1bit() == 1) *w = -*w;
    740a:	e8 38 e5 ff ff       	call   5947 <hget1bit>
    740f:	83 f8 01             	cmp    $0x1,%eax
    7412:	75 0e                	jne    7422 <huffman_decoder+0x239>
    7414:	8b 45 18             	mov    0x18(%ebp),%eax
    7417:	8b 00                	mov    (%eax),%eax
    7419:	f7 d8                	neg    %eax
    741b:	89 c2                	mov    %eax,%edx
    741d:	8b 45 18             	mov    0x18(%ebp),%eax
    7420:	89 10                	mov    %edx,(%eax)
     if (*x)
    7422:	8b 45 0c             	mov    0xc(%ebp),%eax
    7425:	8b 00                	mov    (%eax),%eax
    7427:	85 c0                	test   %eax,%eax
    7429:	74 18                	je     7443 <huffman_decoder+0x25a>
        if (hget1bit() == 1) *x = -*x;
    742b:	e8 17 e5 ff ff       	call   5947 <hget1bit>
    7430:	83 f8 01             	cmp    $0x1,%eax
    7433:	75 0e                	jne    7443 <huffman_decoder+0x25a>
    7435:	8b 45 0c             	mov    0xc(%ebp),%eax
    7438:	8b 00                	mov    (%eax),%eax
    743a:	f7 d8                	neg    %eax
    743c:	89 c2                	mov    %eax,%edx
    743e:	8b 45 0c             	mov    0xc(%ebp),%eax
    7441:	89 10                	mov    %edx,(%eax)
     if (*y)
    7443:	8b 45 10             	mov    0x10(%ebp),%eax
    7446:	8b 00                	mov    (%eax),%eax
    7448:	85 c0                	test   %eax,%eax
    744a:	74 1d                	je     7469 <huffman_decoder+0x280>
        if (hget1bit() == 1) *y = -*y;
    744c:	e8 f6 e4 ff ff       	call   5947 <hget1bit>
    7451:	83 f8 01             	cmp    $0x1,%eax
    7454:	75 13                	jne    7469 <huffman_decoder+0x280>
    7456:	8b 45 10             	mov    0x10(%ebp),%eax
    7459:	8b 00                	mov    (%eax),%eax
    745b:	f7 d8                	neg    %eax
    745d:	89 c2                	mov    %eax,%edx
    745f:	8b 45 10             	mov    0x10(%ebp),%eax
    7462:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    7464:	e9 bb 00 00 00       	jmp    7524 <huffman_decoder+0x33b>
    7469:	e9 b6 00 00 00       	jmp    7524 <huffman_decoder+0x33b>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    746e:	8b 45 08             	mov    0x8(%ebp),%eax
    7471:	8b 40 0c             	mov    0xc(%eax),%eax
    7474:	85 c0                	test   %eax,%eax
    7476:	74 30                	je     74a8 <huffman_decoder+0x2bf>
       if ((h->xlen-1) == *x) 
    7478:	8b 45 08             	mov    0x8(%ebp),%eax
    747b:	8b 40 04             	mov    0x4(%eax),%eax
    747e:	8d 50 ff             	lea    -0x1(%eax),%edx
    7481:	8b 45 0c             	mov    0xc(%ebp),%eax
    7484:	8b 00                	mov    (%eax),%eax
    7486:	39 c2                	cmp    %eax,%edx
    7488:	75 1e                	jne    74a8 <huffman_decoder+0x2bf>
         *x += hgetbits(h->linbits);
    748a:	8b 45 0c             	mov    0xc(%ebp),%eax
    748d:	8b 00                	mov    (%eax),%eax
    748f:	89 c3                	mov    %eax,%ebx
    7491:	8b 45 08             	mov    0x8(%ebp),%eax
    7494:	8b 40 0c             	mov    0xc(%eax),%eax
    7497:	89 04 24             	mov    %eax,(%esp)
    749a:	e8 8d e4 ff ff       	call   592c <hgetbits>
    749f:	01 d8                	add    %ebx,%eax
    74a1:	89 c2                	mov    %eax,%edx
    74a3:	8b 45 0c             	mov    0xc(%ebp),%eax
    74a6:	89 10                	mov    %edx,(%eax)
     if (*x)
    74a8:	8b 45 0c             	mov    0xc(%ebp),%eax
    74ab:	8b 00                	mov    (%eax),%eax
    74ad:	85 c0                	test   %eax,%eax
    74af:	74 18                	je     74c9 <huffman_decoder+0x2e0>
        if (hget1bit() == 1) *x = -*x;
    74b1:	e8 91 e4 ff ff       	call   5947 <hget1bit>
    74b6:	83 f8 01             	cmp    $0x1,%eax
    74b9:	75 0e                	jne    74c9 <huffman_decoder+0x2e0>
    74bb:	8b 45 0c             	mov    0xc(%ebp),%eax
    74be:	8b 00                	mov    (%eax),%eax
    74c0:	f7 d8                	neg    %eax
    74c2:	89 c2                	mov    %eax,%edx
    74c4:	8b 45 0c             	mov    0xc(%ebp),%eax
    74c7:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    74c9:	8b 45 08             	mov    0x8(%ebp),%eax
    74cc:	8b 40 0c             	mov    0xc(%eax),%eax
    74cf:	85 c0                	test   %eax,%eax
    74d1:	74 30                	je     7503 <huffman_decoder+0x31a>
       if ((h->ylen-1) == *y)
    74d3:	8b 45 08             	mov    0x8(%ebp),%eax
    74d6:	8b 40 08             	mov    0x8(%eax),%eax
    74d9:	8d 50 ff             	lea    -0x1(%eax),%edx
    74dc:	8b 45 10             	mov    0x10(%ebp),%eax
    74df:	8b 00                	mov    (%eax),%eax
    74e1:	39 c2                	cmp    %eax,%edx
    74e3:	75 1e                	jne    7503 <huffman_decoder+0x31a>
         *y += hgetbits(h->linbits);
    74e5:	8b 45 10             	mov    0x10(%ebp),%eax
    74e8:	8b 00                	mov    (%eax),%eax
    74ea:	89 c3                	mov    %eax,%ebx
    74ec:	8b 45 08             	mov    0x8(%ebp),%eax
    74ef:	8b 40 0c             	mov    0xc(%eax),%eax
    74f2:	89 04 24             	mov    %eax,(%esp)
    74f5:	e8 32 e4 ff ff       	call   592c <hgetbits>
    74fa:	01 d8                	add    %ebx,%eax
    74fc:	89 c2                	mov    %eax,%edx
    74fe:	8b 45 10             	mov    0x10(%ebp),%eax
    7501:	89 10                	mov    %edx,(%eax)
     if (*y)
    7503:	8b 45 10             	mov    0x10(%ebp),%eax
    7506:	8b 00                	mov    (%eax),%eax
    7508:	85 c0                	test   %eax,%eax
    750a:	74 18                	je     7524 <huffman_decoder+0x33b>
        if (hget1bit() == 1) *y = -*y;
    750c:	e8 36 e4 ff ff       	call   5947 <hget1bit>
    7511:	83 f8 01             	cmp    $0x1,%eax
    7514:	75 0e                	jne    7524 <huffman_decoder+0x33b>
    7516:	8b 45 10             	mov    0x10(%ebp),%eax
    7519:	8b 00                	mov    (%eax),%eax
    751b:	f7 d8                	neg    %eax
    751d:	89 c2                	mov    %eax,%edx
    751f:	8b 45 10             	mov    0x10(%ebp),%eax
    7522:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    7524:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    7527:	83 c4 24             	add    $0x24,%esp
    752a:	5b                   	pop    %ebx
    752b:	5d                   	pop    %ebp
    752c:	c3                   	ret    

0000752d <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    752d:	55                   	push   %ebp
    752e:	89 e5                	mov    %esp,%ebp
    7530:	83 ec 28             	sub    $0x28,%esp
    layer *hdr = fr_ps->header;
    7533:	8b 45 0c             	mov    0xc(%ebp),%eax
    7536:	8b 00                	mov    (%eax),%eax
    7538:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    753b:	8b 45 08             	mov    0x8(%ebp),%eax
    753e:	89 04 24             	mov    %eax,(%esp)
    7541:	e8 6c df ff ff       	call   54b2 <get1bit>
    7546:	89 c2                	mov    %eax,%edx
    7548:	8b 45 f4             	mov    -0xc(%ebp),%eax
    754b:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    754d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    7554:	00 
    7555:	8b 45 08             	mov    0x8(%ebp),%eax
    7558:	89 04 24             	mov    %eax,(%esp)
    755b:	e8 64 e0 ff ff       	call   55c4 <getbits>
    7560:	ba 04 00 00 00       	mov    $0x4,%edx
    7565:	29 c2                	sub    %eax,%edx
    7567:	89 d0                	mov    %edx,%eax
    7569:	89 c2                	mov    %eax,%edx
    756b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    756e:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    7571:	8b 45 08             	mov    0x8(%ebp),%eax
    7574:	89 04 24             	mov    %eax,(%esp)
    7577:	e8 36 df ff ff       	call   54b2 <get1bit>
    757c:	85 c0                	test   %eax,%eax
    757e:	0f 94 c0             	sete   %al
    7581:	0f b6 d0             	movzbl %al,%edx
    7584:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7587:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    758a:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    7591:	00 
    7592:	8b 45 08             	mov    0x8(%ebp),%eax
    7595:	89 04 24             	mov    %eax,(%esp)
    7598:	e8 27 e0 ff ff       	call   55c4 <getbits>
    759d:	89 c2                	mov    %eax,%edx
    759f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    75a2:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    75a5:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    75ac:	00 
    75ad:	8b 45 08             	mov    0x8(%ebp),%eax
    75b0:	89 04 24             	mov    %eax,(%esp)
    75b3:	e8 0c e0 ff ff       	call   55c4 <getbits>
    75b8:	89 c2                	mov    %eax,%edx
    75ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    75bd:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    75c0:	8b 45 08             	mov    0x8(%ebp),%eax
    75c3:	89 04 24             	mov    %eax,(%esp)
    75c6:	e8 e7 de ff ff       	call   54b2 <get1bit>
    75cb:	89 c2                	mov    %eax,%edx
    75cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    75d0:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    75d3:	8b 45 08             	mov    0x8(%ebp),%eax
    75d6:	89 04 24             	mov    %eax,(%esp)
    75d9:	e8 d4 de ff ff       	call   54b2 <get1bit>
    75de:	89 c2                	mov    %eax,%edx
    75e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    75e3:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    75e6:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    75ed:	00 
    75ee:	8b 45 08             	mov    0x8(%ebp),%eax
    75f1:	89 04 24             	mov    %eax,(%esp)
    75f4:	e8 cb df ff ff       	call   55c4 <getbits>
    75f9:	89 c2                	mov    %eax,%edx
    75fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    75fe:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    7601:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    7608:	00 
    7609:	8b 45 08             	mov    0x8(%ebp),%eax
    760c:	89 04 24             	mov    %eax,(%esp)
    760f:	e8 b0 df ff ff       	call   55c4 <getbits>
    7614:	89 c2                	mov    %eax,%edx
    7616:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7619:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    761c:	8b 45 08             	mov    0x8(%ebp),%eax
    761f:	89 04 24             	mov    %eax,(%esp)
    7622:	e8 8b de ff ff       	call   54b2 <get1bit>
    7627:	89 c2                	mov    %eax,%edx
    7629:	8b 45 f4             	mov    -0xc(%ebp),%eax
    762c:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    762f:	8b 45 08             	mov    0x8(%ebp),%eax
    7632:	89 04 24             	mov    %eax,(%esp)
    7635:	e8 78 de ff ff       	call   54b2 <get1bit>
    763a:	89 c2                	mov    %eax,%edx
    763c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    763f:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    7642:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    7649:	00 
    764a:	8b 45 08             	mov    0x8(%ebp),%eax
    764d:	89 04 24             	mov    %eax,(%esp)
    7650:	e8 6f df ff ff       	call   55c4 <getbits>
    7655:	89 c2                	mov    %eax,%edx
    7657:	8b 45 f4             	mov    -0xc(%ebp),%eax
    765a:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    765d:	c9                   	leave  
    765e:	c3                   	ret    

0000765f <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    765f:	55                   	push   %ebp
    7660:	89 e5                	mov    %esp,%ebp
    7662:	56                   	push   %esi
    7663:	53                   	push   %ebx
    7664:	83 ec 20             	sub    $0x20,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    7667:	8b 45 10             	mov    0x10(%ebp),%eax
    766a:	8b 40 08             	mov    0x8(%eax),%eax
    766d:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    7670:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    7677:	00 
    7678:	8b 45 08             	mov    0x8(%ebp),%eax
    767b:	89 04 24             	mov    %eax,(%esp)
    767e:	e8 41 df ff ff       	call   55c4 <getbits>
    7683:	8b 55 0c             	mov    0xc(%ebp),%edx
    7686:	89 02                	mov    %eax,(%edx)
	if (stereo == 1)
    7688:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    768c:	75 1b                	jne    76a9 <III_get_side_info+0x4a>
		si->private_bits = getbits(bs,5);
    768e:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    7695:	00 
    7696:	8b 45 08             	mov    0x8(%ebp),%eax
    7699:	89 04 24             	mov    %eax,(%esp)
    769c:	e8 23 df ff ff       	call   55c4 <getbits>
    76a1:	8b 55 0c             	mov    0xc(%ebp),%edx
    76a4:	89 42 04             	mov    %eax,0x4(%edx)
    76a7:	eb 19                	jmp    76c2 <III_get_side_info+0x63>
	else
		si->private_bits = getbits(bs,3);
    76a9:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    76b0:	00 
    76b1:	8b 45 08             	mov    0x8(%ebp),%eax
    76b4:	89 04 24             	mov    %eax,(%esp)
    76b7:	e8 08 df ff ff       	call   55c4 <getbits>
    76bc:	8b 55 0c             	mov    0xc(%ebp),%edx
    76bf:	89 42 04             	mov    %eax,0x4(%edx)

	for (ch=0; ch<stereo; ch++)
    76c2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    76c9:	eb 3d                	jmp    7708 <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    76cb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    76d2:	eb 2a                	jmp    76fe <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    76d4:	8b 45 08             	mov    0x8(%ebp),%eax
    76d7:	89 04 24             	mov    %eax,(%esp)
    76da:	e8 d3 dd ff ff       	call   54b2 <get1bit>
    76df:	89 c1                	mov    %eax,%ecx
    76e1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    76e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    76e7:	89 d0                	mov    %edx,%eax
    76e9:	c1 e0 02             	shl    $0x2,%eax
    76ec:	01 d0                	add    %edx,%eax
    76ee:	c1 e0 03             	shl    $0x3,%eax
    76f1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    76f4:	01 d0                	add    %edx,%eax
    76f6:	89 4c 83 08          	mov    %ecx,0x8(%ebx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    76fa:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    76fe:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    7702:	7e d0                	jle    76d4 <III_get_side_info+0x75>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    7704:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7708:	8b 45 f4             	mov    -0xc(%ebp),%eax
    770b:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    770e:	7c bb                	jl     76cb <III_get_side_info+0x6c>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    7710:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7717:	e9 c5 05 00 00       	jmp    7ce1 <III_get_side_info+0x682>
		for (ch=0; ch<stereo; ch++) {
    771c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7723:	e9 a9 05 00 00       	jmp    7cd1 <III_get_side_info+0x672>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    7728:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    772f:	00 
    7730:	8b 45 08             	mov    0x8(%ebp),%eax
    7733:	89 04 24             	mov    %eax,(%esp)
    7736:	e8 89 de ff ff       	call   55c4 <getbits>
    773b:	89 c3                	mov    %eax,%ebx
    773d:	8b 75 0c             	mov    0xc(%ebp),%esi
    7740:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7743:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7746:	89 c2                	mov    %eax,%edx
    7748:	c1 e2 03             	shl    $0x3,%edx
    774b:	01 c2                	add    %eax,%edx
    774d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7754:	89 c2                	mov    %eax,%edx
    7756:	89 c8                	mov    %ecx,%eax
    7758:	c1 e0 02             	shl    $0x2,%eax
    775b:	01 c8                	add    %ecx,%eax
    775d:	c1 e0 05             	shl    $0x5,%eax
    7760:	01 d0                	add    %edx,%eax
    7762:	01 f0                	add    %esi,%eax
    7764:	83 c0 18             	add    $0x18,%eax
    7767:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    7769:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    7770:	00 
    7771:	8b 45 08             	mov    0x8(%ebp),%eax
    7774:	89 04 24             	mov    %eax,(%esp)
    7777:	e8 48 de ff ff       	call   55c4 <getbits>
    777c:	89 c3                	mov    %eax,%ebx
    777e:	8b 75 0c             	mov    0xc(%ebp),%esi
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
    77a3:	01 f0                	add    %esi,%eax
    77a5:	83 c0 1c             	add    $0x1c,%eax
    77a8:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    77aa:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    77b1:	00 
    77b2:	8b 45 08             	mov    0x8(%ebp),%eax
    77b5:	89 04 24             	mov    %eax,(%esp)
    77b8:	e8 07 de ff ff       	call   55c4 <getbits>
    77bd:	89 c3                	mov    %eax,%ebx
    77bf:	8b 75 0c             	mov    0xc(%ebp),%esi
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
    77e4:	01 f0                	add    %esi,%eax
    77e6:	83 c0 20             	add    $0x20,%eax
    77e9:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    77eb:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    77f2:	00 
    77f3:	8b 45 08             	mov    0x8(%ebp),%eax
    77f6:	89 04 24             	mov    %eax,(%esp)
    77f9:	e8 c6 dd ff ff       	call   55c4 <getbits>
    77fe:	89 c3                	mov    %eax,%ebx
    7800:	8b 75 0c             	mov    0xc(%ebp),%esi
    7803:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7806:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7809:	89 c2                	mov    %eax,%edx
    780b:	c1 e2 03             	shl    $0x3,%edx
    780e:	01 c2                	add    %eax,%edx
    7810:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7817:	89 c2                	mov    %eax,%edx
    7819:	89 c8                	mov    %ecx,%eax
    781b:	c1 e0 02             	shl    $0x2,%eax
    781e:	01 c8                	add    %ecx,%eax
    7820:	c1 e0 05             	shl    $0x5,%eax
    7823:	01 d0                	add    %edx,%eax
    7825:	01 f0                	add    %esi,%eax
    7827:	83 c0 24             	add    $0x24,%eax
    782a:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    782c:	8b 45 08             	mov    0x8(%ebp),%eax
    782f:	89 04 24             	mov    %eax,(%esp)
    7832:	e8 7b dc ff ff       	call   54b2 <get1bit>
    7837:	89 c3                	mov    %eax,%ebx
    7839:	8b 75 0c             	mov    0xc(%ebp),%esi
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
    785e:	01 f0                	add    %esi,%eax
    7860:	83 c0 28             	add    $0x28,%eax
    7863:	89 18                	mov    %ebx,(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    7865:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7868:	8b 45 f0             	mov    -0x10(%ebp),%eax
    786b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    786e:	89 c2                	mov    %eax,%edx
    7870:	c1 e2 03             	shl    $0x3,%edx
    7873:	01 c2                	add    %eax,%edx
    7875:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    787c:	89 c2                	mov    %eax,%edx
    787e:	89 c8                	mov    %ecx,%eax
    7880:	c1 e0 02             	shl    $0x2,%eax
    7883:	01 c8                	add    %ecx,%eax
    7885:	c1 e0 05             	shl    $0x5,%eax
    7888:	01 d0                	add    %edx,%eax
    788a:	01 d8                	add    %ebx,%eax
    788c:	83 c0 28             	add    $0x28,%eax
    788f:	8b 00                	mov    (%eax),%eax
    7891:	85 c0                	test   %eax,%eax
    7893:	0f 84 82 02 00 00    	je     7b1b <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    7899:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    78a0:	00 
    78a1:	8b 45 08             	mov    0x8(%ebp),%eax
    78a4:	89 04 24             	mov    %eax,(%esp)
    78a7:	e8 18 dd ff ff       	call   55c4 <getbits>
    78ac:	89 c3                	mov    %eax,%ebx
    78ae:	8b 75 0c             	mov    0xc(%ebp),%esi
    78b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    78b4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    78b7:	89 c2                	mov    %eax,%edx
    78b9:	c1 e2 03             	shl    $0x3,%edx
    78bc:	01 c2                	add    %eax,%edx
    78be:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    78c5:	89 c2                	mov    %eax,%edx
    78c7:	89 c8                	mov    %ecx,%eax
    78c9:	c1 e0 02             	shl    $0x2,%eax
    78cc:	01 c8                	add    %ecx,%eax
    78ce:	c1 e0 05             	shl    $0x5,%eax
    78d1:	01 d0                	add    %edx,%eax
    78d3:	01 f0                	add    %esi,%eax
    78d5:	83 c0 2c             	add    $0x2c,%eax
    78d8:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    78da:	8b 45 08             	mov    0x8(%ebp),%eax
    78dd:	89 04 24             	mov    %eax,(%esp)
    78e0:	e8 cd db ff ff       	call   54b2 <get1bit>
    78e5:	89 c3                	mov    %eax,%ebx
    78e7:	8b 75 0c             	mov    0xc(%ebp),%esi
    78ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
    78ed:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    78f0:	89 c2                	mov    %eax,%edx
    78f2:	c1 e2 03             	shl    $0x3,%edx
    78f5:	01 c2                	add    %eax,%edx
    78f7:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    78fe:	89 c2                	mov    %eax,%edx
    7900:	89 c8                	mov    %ecx,%eax
    7902:	c1 e0 02             	shl    $0x2,%eax
    7905:	01 c8                	add    %ecx,%eax
    7907:	c1 e0 05             	shl    $0x5,%eax
    790a:	01 d0                	add    %edx,%eax
    790c:	01 f0                	add    %esi,%eax
    790e:	83 c0 30             	add    $0x30,%eax
    7911:	89 18                	mov    %ebx,(%eax)
				for (i=0; i<2; i++)
    7913:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    791a:	eb 46                	jmp    7962 <III_get_side_info+0x303>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    791c:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    7923:	00 
    7924:	8b 45 08             	mov    0x8(%ebp),%eax
    7927:	89 04 24             	mov    %eax,(%esp)
    792a:	e8 95 dc ff ff       	call   55c4 <getbits>
    792f:	89 c3                	mov    %eax,%ebx
    7931:	8b 75 0c             	mov    0xc(%ebp),%esi
    7934:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7937:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    793a:	89 c2                	mov    %eax,%edx
    793c:	c1 e2 03             	shl    $0x3,%edx
    793f:	01 c2                	add    %eax,%edx
    7941:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7944:	89 c2                	mov    %eax,%edx
    7946:	89 c8                	mov    %ecx,%eax
    7948:	c1 e0 02             	shl    $0x2,%eax
    794b:	01 c8                	add    %ecx,%eax
    794d:	c1 e0 03             	shl    $0x3,%eax
    7950:	01 c2                	add    %eax,%edx
    7952:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7955:	01 d0                	add    %edx,%eax
    7957:	83 c0 08             	add    $0x8,%eax
    795a:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    795e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7962:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    7966:	7e b4                	jle    791c <III_get_side_info+0x2bd>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    7968:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    796f:	eb 46                	jmp    79b7 <III_get_side_info+0x358>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    7971:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    7978:	00 
    7979:	8b 45 08             	mov    0x8(%ebp),%eax
    797c:	89 04 24             	mov    %eax,(%esp)
    797f:	e8 40 dc ff ff       	call   55c4 <getbits>
    7984:	89 c3                	mov    %eax,%ebx
    7986:	8b 75 0c             	mov    0xc(%ebp),%esi
    7989:	8b 45 f0             	mov    -0x10(%ebp),%eax
    798c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    798f:	89 c2                	mov    %eax,%edx
    7991:	c1 e2 03             	shl    $0x3,%edx
    7994:	01 c2                	add    %eax,%edx
    7996:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7999:	89 c2                	mov    %eax,%edx
    799b:	89 c8                	mov    %ecx,%eax
    799d:	c1 e0 02             	shl    $0x2,%eax
    79a0:	01 c8                	add    %ecx,%eax
    79a2:	c1 e0 03             	shl    $0x3,%eax
    79a5:	01 c2                	add    %eax,%edx
    79a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    79aa:	01 d0                	add    %edx,%eax
    79ac:	83 c0 0c             	add    $0xc,%eax
    79af:	89 5c 86 10          	mov    %ebx,0x10(%esi,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    79b3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    79b7:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    79bb:	7e b4                	jle    7971 <III_get_side_info+0x312>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    79bd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    79c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    79c3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    79c6:	89 c2                	mov    %eax,%edx
    79c8:	c1 e2 03             	shl    $0x3,%edx
    79cb:	01 c2                	add    %eax,%edx
    79cd:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    79d4:	89 c2                	mov    %eax,%edx
    79d6:	89 c8                	mov    %ecx,%eax
    79d8:	c1 e0 02             	shl    $0x2,%eax
    79db:	01 c8                	add    %ecx,%eax
    79dd:	c1 e0 05             	shl    $0x5,%eax
    79e0:	01 d0                	add    %edx,%eax
    79e2:	01 d8                	add    %ebx,%eax
    79e4:	83 c0 2c             	add    $0x2c,%eax
    79e7:	8b 00                	mov    (%eax),%eax
    79e9:	85 c0                	test   %eax,%eax
    79eb:	75 05                	jne    79f2 <III_get_side_info+0x393>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    79ed:	e8 84 cb ff ff       	call   4576 <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    79f2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    79f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    79f8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    79fb:	89 c2                	mov    %eax,%edx
    79fd:	c1 e2 03             	shl    $0x3,%edx
    7a00:	01 c2                	add    %eax,%edx
    7a02:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7a09:	89 c2                	mov    %eax,%edx
    7a0b:	89 c8                	mov    %ecx,%eax
    7a0d:	c1 e0 02             	shl    $0x2,%eax
    7a10:	01 c8                	add    %ecx,%eax
    7a12:	c1 e0 05             	shl    $0x5,%eax
    7a15:	01 d0                	add    %edx,%eax
    7a17:	01 d8                	add    %ebx,%eax
    7a19:	83 c0 2c             	add    $0x2c,%eax
    7a1c:	8b 00                	mov    (%eax),%eax
    7a1e:	83 f8 02             	cmp    $0x2,%eax
    7a21:	75 62                	jne    7a85 <III_get_side_info+0x426>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    7a23:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7a26:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7a29:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7a2c:	89 c2                	mov    %eax,%edx
    7a2e:	c1 e2 03             	shl    $0x3,%edx
    7a31:	01 c2                	add    %eax,%edx
    7a33:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7a3a:	89 c2                	mov    %eax,%edx
    7a3c:	89 c8                	mov    %ecx,%eax
    7a3e:	c1 e0 02             	shl    $0x2,%eax
    7a41:	01 c8                	add    %ecx,%eax
    7a43:	c1 e0 05             	shl    $0x5,%eax
    7a46:	01 d0                	add    %edx,%eax
    7a48:	01 d8                	add    %ebx,%eax
    7a4a:	83 c0 30             	add    $0x30,%eax
    7a4d:	8b 00                	mov    (%eax),%eax
    7a4f:	85 c0                	test   %eax,%eax
    7a51:	75 32                	jne    7a85 <III_get_side_info+0x426>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    7a53:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7a56:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7a59:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7a5c:	89 c2                	mov    %eax,%edx
    7a5e:	c1 e2 03             	shl    $0x3,%edx
    7a61:	01 c2                	add    %eax,%edx
    7a63:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7a6a:	89 c2                	mov    %eax,%edx
    7a6c:	89 c8                	mov    %ecx,%eax
    7a6e:	c1 e0 02             	shl    $0x2,%eax
    7a71:	01 c8                	add    %ecx,%eax
    7a73:	c1 e0 05             	shl    $0x5,%eax
    7a76:	01 d0                	add    %edx,%eax
    7a78:	01 d8                	add    %ebx,%eax
    7a7a:	83 c0 4c             	add    $0x4c,%eax
    7a7d:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
    7a83:	eb 30                	jmp    7ab5 <III_get_side_info+0x456>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    7a85:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7a88:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7a8b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7a8e:	89 c2                	mov    %eax,%edx
    7a90:	c1 e2 03             	shl    $0x3,%edx
    7a93:	01 c2                	add    %eax,%edx
    7a95:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7a9c:	89 c2                	mov    %eax,%edx
    7a9e:	89 c8                	mov    %ecx,%eax
    7aa0:	c1 e0 02             	shl    $0x2,%eax
    7aa3:	01 c8                	add    %ecx,%eax
    7aa5:	c1 e0 05             	shl    $0x5,%eax
    7aa8:	01 d0                	add    %edx,%eax
    7aaa:	01 d8                	add    %ebx,%eax
    7aac:	83 c0 4c             	add    $0x4c,%eax
    7aaf:	c7 00 07 00 00 00    	movl   $0x7,(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    7ab5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7ab8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7abb:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7abe:	89 c2                	mov    %eax,%edx
    7ac0:	c1 e2 03             	shl    $0x3,%edx
    7ac3:	01 c2                	add    %eax,%edx
    7ac5:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7acc:	89 c2                	mov    %eax,%edx
    7ace:	89 c8                	mov    %ecx,%eax
    7ad0:	c1 e0 02             	shl    $0x2,%eax
    7ad3:	01 c8                	add    %ecx,%eax
    7ad5:	c1 e0 05             	shl    $0x5,%eax
    7ad8:	01 d0                	add    %edx,%eax
    7ada:	01 d8                	add    %ebx,%eax
    7adc:	83 c0 4c             	add    $0x4c,%eax
    7adf:	8b 00                	mov    (%eax),%eax
    7ae1:	ba 14 00 00 00       	mov    $0x14,%edx
    7ae6:	89 d3                	mov    %edx,%ebx
    7ae8:	29 c3                	sub    %eax,%ebx
    7aea:	8b 75 0c             	mov    0xc(%ebp),%esi
    7aed:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7af0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7af3:	89 c2                	mov    %eax,%edx
    7af5:	c1 e2 03             	shl    $0x3,%edx
    7af8:	01 c2                	add    %eax,%edx
    7afa:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7b01:	89 c2                	mov    %eax,%edx
    7b03:	89 c8                	mov    %ecx,%eax
    7b05:	c1 e0 02             	shl    $0x2,%eax
    7b08:	01 c8                	add    %ecx,%eax
    7b0a:	c1 e0 05             	shl    $0x5,%eax
    7b0d:	01 d0                	add    %edx,%eax
    7b0f:	01 f0                	add    %esi,%eax
    7b11:	83 c0 50             	add    $0x50,%eax
    7b14:	89 18                	mov    %ebx,(%eax)
    7b16:	e9 07 01 00 00       	jmp    7c22 <III_get_side_info+0x5c3>
			}
			else {
				for (i=0; i<3; i++)
    7b1b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7b22:	eb 46                	jmp    7b6a <III_get_side_info+0x50b>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    7b24:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    7b2b:	00 
    7b2c:	8b 45 08             	mov    0x8(%ebp),%eax
    7b2f:	89 04 24             	mov    %eax,(%esp)
    7b32:	e8 8d da ff ff       	call   55c4 <getbits>
    7b37:	89 c3                	mov    %eax,%ebx
    7b39:	8b 75 0c             	mov    0xc(%ebp),%esi
    7b3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7b3f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7b42:	89 c2                	mov    %eax,%edx
    7b44:	c1 e2 03             	shl    $0x3,%edx
    7b47:	01 c2                	add    %eax,%edx
    7b49:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7b4c:	89 c2                	mov    %eax,%edx
    7b4e:	89 c8                	mov    %ecx,%eax
    7b50:	c1 e0 02             	shl    $0x2,%eax
    7b53:	01 c8                	add    %ecx,%eax
    7b55:	c1 e0 03             	shl    $0x3,%eax
    7b58:	01 c2                	add    %eax,%edx
    7b5a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7b5d:	01 d0                	add    %edx,%eax
    7b5f:	83 c0 08             	add    $0x8,%eax
    7b62:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    7b66:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7b6a:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7b6e:	7e b4                	jle    7b24 <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    7b70:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    7b77:	00 
    7b78:	8b 45 08             	mov    0x8(%ebp),%eax
    7b7b:	89 04 24             	mov    %eax,(%esp)
    7b7e:	e8 41 da ff ff       	call   55c4 <getbits>
    7b83:	89 c3                	mov    %eax,%ebx
    7b85:	8b 75 0c             	mov    0xc(%ebp),%esi
    7b88:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7b8b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7b8e:	89 c2                	mov    %eax,%edx
    7b90:	c1 e2 03             	shl    $0x3,%edx
    7b93:	01 c2                	add    %eax,%edx
    7b95:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7b9c:	89 c2                	mov    %eax,%edx
    7b9e:	89 c8                	mov    %ecx,%eax
    7ba0:	c1 e0 02             	shl    $0x2,%eax
    7ba3:	01 c8                	add    %ecx,%eax
    7ba5:	c1 e0 05             	shl    $0x5,%eax
    7ba8:	01 d0                	add    %edx,%eax
    7baa:	01 f0                	add    %esi,%eax
    7bac:	83 c0 4c             	add    $0x4c,%eax
    7baf:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    7bb1:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    7bb8:	00 
    7bb9:	8b 45 08             	mov    0x8(%ebp),%eax
    7bbc:	89 04 24             	mov    %eax,(%esp)
    7bbf:	e8 00 da ff ff       	call   55c4 <getbits>
    7bc4:	89 c3                	mov    %eax,%ebx
    7bc6:	8b 75 0c             	mov    0xc(%ebp),%esi
    7bc9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7bcc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7bcf:	89 c2                	mov    %eax,%edx
    7bd1:	c1 e2 03             	shl    $0x3,%edx
    7bd4:	01 c2                	add    %eax,%edx
    7bd6:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7bdd:	89 c2                	mov    %eax,%edx
    7bdf:	89 c8                	mov    %ecx,%eax
    7be1:	c1 e0 02             	shl    $0x2,%eax
    7be4:	01 c8                	add    %ecx,%eax
    7be6:	c1 e0 05             	shl    $0x5,%eax
    7be9:	01 d0                	add    %edx,%eax
    7beb:	01 f0                	add    %esi,%eax
    7bed:	83 c0 50             	add    $0x50,%eax
    7bf0:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    7bf2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7bf5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7bf8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7bfb:	89 c2                	mov    %eax,%edx
    7bfd:	c1 e2 03             	shl    $0x3,%edx
    7c00:	01 c2                	add    %eax,%edx
    7c02:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7c09:	89 c2                	mov    %eax,%edx
    7c0b:	89 c8                	mov    %ecx,%eax
    7c0d:	c1 e0 02             	shl    $0x2,%eax
    7c10:	01 c8                	add    %ecx,%eax
    7c12:	c1 e0 05             	shl    $0x5,%eax
    7c15:	01 d0                	add    %edx,%eax
    7c17:	01 d8                	add    %ebx,%eax
    7c19:	83 c0 2c             	add    $0x2c,%eax
    7c1c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    7c22:	8b 45 08             	mov    0x8(%ebp),%eax
    7c25:	89 04 24             	mov    %eax,(%esp)
    7c28:	e8 85 d8 ff ff       	call   54b2 <get1bit>
    7c2d:	89 c3                	mov    %eax,%ebx
    7c2f:	8b 75 0c             	mov    0xc(%ebp),%esi
    7c32:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7c35:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7c38:	89 c2                	mov    %eax,%edx
    7c3a:	c1 e2 03             	shl    $0x3,%edx
    7c3d:	01 c2                	add    %eax,%edx
    7c3f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7c46:	89 c2                	mov    %eax,%edx
    7c48:	89 c8                	mov    %ecx,%eax
    7c4a:	c1 e0 02             	shl    $0x2,%eax
    7c4d:	01 c8                	add    %ecx,%eax
    7c4f:	c1 e0 05             	shl    $0x5,%eax
    7c52:	01 d0                	add    %edx,%eax
    7c54:	01 f0                	add    %esi,%eax
    7c56:	83 c0 54             	add    $0x54,%eax
    7c59:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    7c5b:	8b 45 08             	mov    0x8(%ebp),%eax
    7c5e:	89 04 24             	mov    %eax,(%esp)
    7c61:	e8 4c d8 ff ff       	call   54b2 <get1bit>
    7c66:	89 c3                	mov    %eax,%ebx
    7c68:	8b 75 0c             	mov    0xc(%ebp),%esi
    7c6b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7c6e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7c71:	89 c2                	mov    %eax,%edx
    7c73:	c1 e2 03             	shl    $0x3,%edx
    7c76:	01 c2                	add    %eax,%edx
    7c78:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7c7f:	89 c2                	mov    %eax,%edx
    7c81:	89 c8                	mov    %ecx,%eax
    7c83:	c1 e0 02             	shl    $0x2,%eax
    7c86:	01 c8                	add    %ecx,%eax
    7c88:	c1 e0 05             	shl    $0x5,%eax
    7c8b:	01 d0                	add    %edx,%eax
    7c8d:	01 f0                	add    %esi,%eax
    7c8f:	83 c0 58             	add    $0x58,%eax
    7c92:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    7c94:	8b 45 08             	mov    0x8(%ebp),%eax
    7c97:	89 04 24             	mov    %eax,(%esp)
    7c9a:	e8 13 d8 ff ff       	call   54b2 <get1bit>
    7c9f:	89 c3                	mov    %eax,%ebx
    7ca1:	8b 75 0c             	mov    0xc(%ebp),%esi
    7ca4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7ca7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7caa:	89 c2                	mov    %eax,%edx
    7cac:	c1 e2 03             	shl    $0x3,%edx
    7caf:	01 c2                	add    %eax,%edx
    7cb1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7cb8:	89 c2                	mov    %eax,%edx
    7cba:	89 c8                	mov    %ecx,%eax
    7cbc:	c1 e0 02             	shl    $0x2,%eax
    7cbf:	01 c8                	add    %ecx,%eax
    7cc1:	c1 e0 05             	shl    $0x5,%eax
    7cc4:	01 d0                	add    %edx,%eax
    7cc6:	01 f0                	add    %esi,%eax
    7cc8:	83 c0 5c             	add    $0x5c,%eax
    7ccb:	89 18                	mov    %ebx,(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    7ccd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7cd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7cd4:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    7cd7:	0f 8c 4b fa ff ff    	jl     7728 <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    7cdd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7ce1:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7ce5:	0f 8e 31 fa ff ff    	jle    771c <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    7ceb:	83 c4 20             	add    $0x20,%esp
    7cee:	5b                   	pop    %ebx
    7cef:	5e                   	pop    %esi
    7cf0:	5d                   	pop    %ebp
    7cf1:	c3                   	ret    

00007cf2 <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    7cf2:	55                   	push   %ebp
    7cf3:	89 e5                	mov    %esp,%ebp
    7cf5:	56                   	push   %esi
    7cf6:	53                   	push   %ebx
    7cf7:	83 ec 20             	sub    $0x20,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    7cfa:	8b 45 10             	mov    0x10(%ebp),%eax
    7cfd:	89 c2                	mov    %eax,%edx
    7cff:	c1 e2 03             	shl    $0x3,%edx
    7d02:	01 c2                	add    %eax,%edx
    7d04:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7d0b:	89 c2                	mov    %eax,%edx
    7d0d:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7d10:	89 c8                	mov    %ecx,%eax
    7d12:	c1 e0 02             	shl    $0x2,%eax
    7d15:	01 c8                	add    %ecx,%eax
    7d17:	c1 e0 05             	shl    $0x5,%eax
    7d1a:	01 d0                	add    %edx,%eax
    7d1c:	8d 50 10             	lea    0x10(%eax),%edx
    7d1f:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d22:	01 d0                	add    %edx,%eax
    7d24:	83 c0 08             	add    $0x8,%eax
    7d27:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    7d2a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7d2d:	8b 40 10             	mov    0x10(%eax),%eax
    7d30:	85 c0                	test   %eax,%eax
    7d32:	0f 84 7e 02 00 00    	je     7fb6 <III_get_scale_factors+0x2c4>
    7d38:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7d3b:	8b 40 14             	mov    0x14(%eax),%eax
    7d3e:	83 f8 02             	cmp    $0x2,%eax
    7d41:	0f 85 6f 02 00 00    	jne    7fb6 <III_get_scale_factors+0x2c4>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    7d47:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7d4a:	8b 40 18             	mov    0x18(%eax),%eax
    7d4d:	85 c0                	test   %eax,%eax
    7d4f:	0f 84 6b 01 00 00    	je     7ec0 <III_get_scale_factors+0x1ce>
			for (sfb = 0; sfb < 8; sfb++)
    7d55:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7d5c:	eb 32                	jmp    7d90 <III_get_scale_factors+0x9e>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    7d5e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7d61:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    7d64:	8b 04 85 a0 f4 00 00 	mov    0xf4a0(,%eax,4),%eax
    7d6b:	89 04 24             	mov    %eax,(%esp)
    7d6e:	e8 b9 db ff ff       	call   592c <hgetbits>
    7d73:	89 c3                	mov    %eax,%ebx
    7d75:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7d78:	8b 45 14             	mov    0x14(%ebp),%eax
    7d7b:	01 c0                	add    %eax,%eax
    7d7d:	89 c2                	mov    %eax,%edx
    7d7f:	c1 e2 05             	shl    $0x5,%edx
    7d82:	29 c2                	sub    %eax,%edx
    7d84:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7d87:	01 d0                	add    %edx,%eax
    7d89:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    7d8c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7d90:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    7d94:	7e c8                	jle    7d5e <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    7d96:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    7d9d:	eb 5c                	jmp    7dfb <III_get_scale_factors+0x109>
				for (window=0; window<3; window++)
    7d9f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7da6:	eb 49                	jmp    7df1 <III_get_scale_factors+0xff>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    7da8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7dab:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    7dae:	8b 04 85 a0 f4 00 00 	mov    0xf4a0(,%eax,4),%eax
    7db5:	89 04 24             	mov    %eax,(%esp)
    7db8:	e8 6f db ff ff       	call   592c <hgetbits>
    7dbd:	89 c6                	mov    %eax,%esi
    7dbf:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7dc2:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7dc5:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7dc8:	89 d0                	mov    %edx,%eax
    7dca:	01 c0                	add    %eax,%eax
    7dcc:	01 d0                	add    %edx,%eax
    7dce:	c1 e0 02             	shl    $0x2,%eax
    7dd1:	01 d0                	add    %edx,%eax
    7dd3:	89 ca                	mov    %ecx,%edx
    7dd5:	01 d2                	add    %edx,%edx
    7dd7:	89 d1                	mov    %edx,%ecx
    7dd9:	c1 e1 05             	shl    $0x5,%ecx
    7ddc:	29 d1                	sub    %edx,%ecx
    7dde:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    7de1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7de4:	01 d0                	add    %edx,%eax
    7de6:	83 c0 14             	add    $0x14,%eax
    7de9:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    7ded:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7df1:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7df5:	7e b1                	jle    7da8 <III_get_scale_factors+0xb6>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    7df7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7dfb:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    7dff:	7e 9e                	jle    7d9f <III_get_scale_factors+0xad>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    7e01:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    7e08:	eb 5f                	jmp    7e69 <III_get_scale_factors+0x177>
				for (window=0; window<3; window++)
    7e0a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7e11:	eb 4c                	jmp    7e5f <III_get_scale_factors+0x16d>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    7e13:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7e16:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    7e19:	83 c0 10             	add    $0x10,%eax
    7e1c:	8b 04 85 a0 f4 00 00 	mov    0xf4a0(,%eax,4),%eax
    7e23:	89 04 24             	mov    %eax,(%esp)
    7e26:	e8 01 db ff ff       	call   592c <hgetbits>
    7e2b:	89 c6                	mov    %eax,%esi
    7e2d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7e30:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7e33:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7e36:	89 d0                	mov    %edx,%eax
    7e38:	01 c0                	add    %eax,%eax
    7e3a:	01 d0                	add    %edx,%eax
    7e3c:	c1 e0 02             	shl    $0x2,%eax
    7e3f:	01 d0                	add    %edx,%eax
    7e41:	89 ca                	mov    %ecx,%edx
    7e43:	01 d2                	add    %edx,%edx
    7e45:	89 d1                	mov    %edx,%ecx
    7e47:	c1 e1 05             	shl    $0x5,%ecx
    7e4a:	29 d1                	sub    %edx,%ecx
    7e4c:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    7e4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e52:	01 d0                	add    %edx,%eax
    7e54:	83 c0 14             	add    $0x14,%eax
    7e57:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    7e5b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7e5f:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7e63:	7e ae                	jle    7e13 <III_get_scale_factors+0x121>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    7e65:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7e69:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    7e6d:	7e 9b                	jle    7e0a <III_get_scale_factors+0x118>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    7e6f:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7e76:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7e7d:	eb 36                	jmp    7eb5 <III_get_scale_factors+0x1c3>
				(*scalefac)[ch].s[window][sfb] = 0;
    7e7f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7e82:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7e85:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7e88:	89 d0                	mov    %edx,%eax
    7e8a:	01 c0                	add    %eax,%eax
    7e8c:	01 d0                	add    %edx,%eax
    7e8e:	c1 e0 02             	shl    $0x2,%eax
    7e91:	01 d0                	add    %edx,%eax
    7e93:	89 ca                	mov    %ecx,%edx
    7e95:	01 d2                	add    %edx,%edx
    7e97:	89 d1                	mov    %edx,%ecx
    7e99:	c1 e1 05             	shl    $0x5,%ecx
    7e9c:	29 d1                	sub    %edx,%ecx
    7e9e:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    7ea1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ea4:	01 d0                	add    %edx,%eax
    7ea6:	83 c0 14             	add    $0x14,%eax
    7ea9:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    7eb0:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    7eb1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7eb5:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7eb9:	7e c4                	jle    7e7f <III_get_scale_factors+0x18d>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    7ebb:	e9 b1 01 00 00       	jmp    8071 <III_get_scale_factors+0x37f>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    7ec0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7ec7:	e9 8f 00 00 00       	jmp    7f5b <III_get_scale_factors+0x269>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    7ecc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7ecf:	83 c0 04             	add    $0x4,%eax
    7ed2:	8b 04 85 84 f4 00 00 	mov    0xf484(,%eax,4),%eax
    7ed9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7edc:	eb 64                	jmp    7f42 <III_get_scale_factors+0x250>
					for (window=0; window<3; window++)
    7ede:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7ee5:	eb 51                	jmp    7f38 <III_get_scale_factors+0x246>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    7ee7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7eea:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    7eed:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7ef0:	c1 e2 04             	shl    $0x4,%edx
    7ef3:	01 d0                	add    %edx,%eax
    7ef5:	8b 04 85 a0 f4 00 00 	mov    0xf4a0(,%eax,4),%eax
    7efc:	89 04 24             	mov    %eax,(%esp)
    7eff:	e8 28 da ff ff       	call   592c <hgetbits>
    7f04:	89 c6                	mov    %eax,%esi
    7f06:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7f09:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7f0c:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7f0f:	89 d0                	mov    %edx,%eax
    7f11:	01 c0                	add    %eax,%eax
    7f13:	01 d0                	add    %edx,%eax
    7f15:	c1 e0 02             	shl    $0x2,%eax
    7f18:	01 d0                	add    %edx,%eax
    7f1a:	89 ca                	mov    %ecx,%edx
    7f1c:	01 d2                	add    %edx,%edx
    7f1e:	89 d1                	mov    %edx,%ecx
    7f20:	c1 e1 05             	shl    $0x5,%ecx
    7f23:	29 d1                	sub    %edx,%ecx
    7f25:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    7f28:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f2b:	01 d0                	add    %edx,%eax
    7f2d:	83 c0 14             	add    $0x14,%eax
    7f30:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    7f34:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7f38:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7f3c:	7e a9                	jle    7ee7 <III_get_scale_factors+0x1f5>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    7f3e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7f42:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7f45:	83 c0 01             	add    $0x1,%eax
    7f48:	83 c0 04             	add    $0x4,%eax
    7f4b:	8b 04 85 84 f4 00 00 	mov    0xf484(,%eax,4),%eax
    7f52:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    7f55:	7f 87                	jg     7ede <III_get_scale_factors+0x1ec>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    7f57:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7f5b:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7f5f:	0f 8e 67 ff ff ff    	jle    7ecc <III_get_scale_factors+0x1da>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    7f65:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7f6c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7f73:	eb 36                	jmp    7fab <III_get_scale_factors+0x2b9>
					(*scalefac)[ch].s[window][sfb] = 0;
    7f75:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7f78:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7f7b:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7f7e:	89 d0                	mov    %edx,%eax
    7f80:	01 c0                	add    %eax,%eax
    7f82:	01 d0                	add    %edx,%eax
    7f84:	c1 e0 02             	shl    $0x2,%eax
    7f87:	01 d0                	add    %edx,%eax
    7f89:	89 ca                	mov    %ecx,%edx
    7f8b:	01 d2                	add    %edx,%edx
    7f8d:	89 d1                	mov    %edx,%ecx
    7f8f:	c1 e1 05             	shl    $0x5,%ecx
    7f92:	29 d1                	sub    %edx,%ecx
    7f94:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    7f97:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f9a:	01 d0                	add    %edx,%eax
    7f9c:	83 c0 14             	add    $0x14,%eax
    7f9f:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    7fa6:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    7fa7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7fab:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7faf:	7e c4                	jle    7f75 <III_get_scale_factors+0x283>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    7fb1:	e9 bb 00 00 00       	jmp    8071 <III_get_scale_factors+0x37f>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    7fb6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7fbd:	e9 89 00 00 00       	jmp    804b <III_get_scale_factors+0x359>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    7fc2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7fc5:	8b 55 14             	mov    0x14(%ebp),%edx
    7fc8:	89 d0                	mov    %edx,%eax
    7fca:	c1 e0 02             	shl    $0x2,%eax
    7fcd:	01 d0                	add    %edx,%eax
    7fcf:	c1 e0 03             	shl    $0x3,%eax
    7fd2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7fd5:	01 d0                	add    %edx,%eax
    7fd7:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    7fdb:	85 c0                	test   %eax,%eax
    7fdd:	74 06                	je     7fe5 <III_get_scale_factors+0x2f3>
    7fdf:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    7fe3:	75 62                	jne    8047 <III_get_scale_factors+0x355>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    7fe5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7fe8:	8b 04 85 80 f4 00 00 	mov    0xf480(,%eax,4),%eax
    7fef:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7ff2:	eb 41                	jmp    8035 <III_get_scale_factors+0x343>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    7ff4:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7ff8:	0f 9f c0             	setg   %al
    7ffb:	0f b6 d0             	movzbl %al,%edx
    7ffe:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8001:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    8004:	c1 e2 04             	shl    $0x4,%edx
    8007:	01 d0                	add    %edx,%eax
    8009:	8b 04 85 a0 f4 00 00 	mov    0xf4a0(,%eax,4),%eax
    8010:	89 04 24             	mov    %eax,(%esp)
    8013:	e8 14 d9 ff ff       	call   592c <hgetbits>
    8018:	89 c3                	mov    %eax,%ebx
    801a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    801d:	8b 45 14             	mov    0x14(%ebp),%eax
    8020:	01 c0                	add    %eax,%eax
    8022:	89 c2                	mov    %eax,%edx
    8024:	c1 e2 05             	shl    $0x5,%edx
    8027:	29 c2                	sub    %eax,%edx
    8029:	8b 45 f4             	mov    -0xc(%ebp),%eax
    802c:	01 d0                	add    %edx,%eax
    802e:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    8031:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8035:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8038:	83 c0 01             	add    $0x1,%eax
    803b:	8b 04 85 80 f4 00 00 	mov    0xf480(,%eax,4),%eax
    8042:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    8045:	7f ad                	jg     7ff4 <III_get_scale_factors+0x302>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    8047:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    804b:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    804f:	0f 8e 6d ff ff ff    	jle    7fc2 <III_get_scale_factors+0x2d0>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    8055:	8b 4d 08             	mov    0x8(%ebp),%ecx
    8058:	8b 45 14             	mov    0x14(%ebp),%eax
    805b:	c1 e0 03             	shl    $0x3,%eax
    805e:	89 c2                	mov    %eax,%edx
    8060:	c1 e2 05             	shl    $0x5,%edx
    8063:	29 c2                	sub    %eax,%edx
    8065:	8d 04 11             	lea    (%ecx,%edx,1),%eax
    8068:	83 c0 58             	add    $0x58,%eax
    806b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    8071:	83 c4 20             	add    $0x20,%esp
    8074:	5b                   	pop    %ebx
    8075:	5e                   	pop    %esi
    8076:	5d                   	pop    %ebp
    8077:	c3                   	ret    

00008078 <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    8078:	55                   	push   %ebp
    8079:	89 e5                	mov    %esp,%ebp
    807b:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    807e:	a1 c0 f7 00 00       	mov    0xf7c0,%eax
    8083:	85 c0                	test   %eax,%eax
    8085:	74 02                	je     8089 <initialize_huffman+0x11>
    8087:	eb 0f                	jmp    8098 <initialize_huffman+0x20>
	read_decoder_table();
    8089:	e8 03 d9 ff ff       	call   5991 <read_decoder_table>
	huffman_initialized = TRUE;
    808e:	c7 05 c0 f7 00 00 01 	movl   $0x1,0xf7c0
    8095:	00 00 00 
}
    8098:	c9                   	leave  
    8099:	c3                   	ret    

0000809a <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    809a:	55                   	push   %ebp
    809b:	89 e5                	mov    %esp,%ebp
    809d:	57                   	push   %edi
    809e:	56                   	push   %esi
    809f:	53                   	push   %ebx
    80a0:	83 ec 4c             	sub    $0x4c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    80a3:	e8 d0 ff ff ff       	call   8078 <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    80a8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    80ab:	8b 45 14             	mov    0x14(%ebp),%eax
    80ae:	8b 4d 10             	mov    0x10(%ebp),%ecx
    80b1:	89 c2                	mov    %eax,%edx
    80b3:	c1 e2 03             	shl    $0x3,%edx
    80b6:	01 c2                	add    %eax,%edx
    80b8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    80bf:	89 c2                	mov    %eax,%edx
    80c1:	89 c8                	mov    %ecx,%eax
    80c3:	c1 e0 02             	shl    $0x2,%eax
    80c6:	01 c8                	add    %ecx,%eax
    80c8:	c1 e0 05             	shl    $0x5,%eax
    80cb:	01 d0                	add    %edx,%eax
    80cd:	01 d8                	add    %ebx,%eax
    80cf:	83 c0 28             	add    $0x28,%eax
    80d2:	8b 00                	mov    (%eax),%eax
    80d4:	85 c0                	test   %eax,%eax
    80d6:	74 44                	je     811c <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    80d8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    80db:	8b 45 14             	mov    0x14(%ebp),%eax
    80de:	8b 4d 10             	mov    0x10(%ebp),%ecx
    80e1:	89 c2                	mov    %eax,%edx
    80e3:	c1 e2 03             	shl    $0x3,%edx
    80e6:	01 c2                	add    %eax,%edx
    80e8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    80ef:	89 c2                	mov    %eax,%edx
    80f1:	89 c8                	mov    %ecx,%eax
    80f3:	c1 e0 02             	shl    $0x2,%eax
    80f6:	01 c8                	add    %ecx,%eax
    80f8:	c1 e0 05             	shl    $0x5,%eax
    80fb:	01 d0                	add    %edx,%eax
    80fd:	01 d8                	add    %ebx,%eax
    80ff:	83 c0 2c             	add    $0x2c,%eax
    8102:	8b 00                	mov    (%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    8104:	83 f8 02             	cmp    $0x2,%eax
    8107:	75 13                	jne    811c <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    8109:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    8110:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    8117:	e9 cc 00 00 00       	jmp    81e8 <III_hufman_decode+0x14e>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    811c:	8b 45 1c             	mov    0x1c(%ebp),%eax
    811f:	8b 00                	mov    (%eax),%eax
    8121:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    8124:	8b 75 0c             	mov    0xc(%ebp),%esi
    8127:	8b 45 14             	mov    0x14(%ebp),%eax
    812a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    812d:	89 c2                	mov    %eax,%edx
    812f:	c1 e2 03             	shl    $0x3,%edx
    8132:	01 c2                	add    %eax,%edx
    8134:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    813b:	89 c2                	mov    %eax,%edx
    813d:	89 d8                	mov    %ebx,%eax
    813f:	c1 e0 02             	shl    $0x2,%eax
    8142:	01 d8                	add    %ebx,%eax
    8144:	c1 e0 05             	shl    $0x5,%eax
    8147:	01 d0                	add    %edx,%eax
    8149:	01 f0                	add    %esi,%eax
    814b:	83 c0 4c             	add    $0x4c,%eax
    814e:	8b 00                	mov    (%eax),%eax
    8150:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    8153:	89 c8                	mov    %ecx,%eax
    8155:	c1 e0 03             	shl    $0x3,%eax
    8158:	01 c8                	add    %ecx,%eax
    815a:	c1 e0 02             	shl    $0x2,%eax
    815d:	01 c8                	add    %ecx,%eax
    815f:	01 d0                	add    %edx,%eax
    8161:	8b 04 85 20 f5 00 00 	mov    0xf520(,%eax,4),%eax
    8168:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    816b:	8b 45 1c             	mov    0x1c(%ebp),%eax
    816e:	8b 00                	mov    (%eax),%eax
    8170:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    8173:	8b 75 0c             	mov    0xc(%ebp),%esi
    8176:	8b 45 14             	mov    0x14(%ebp),%eax
    8179:	8b 5d 10             	mov    0x10(%ebp),%ebx
    817c:	89 c2                	mov    %eax,%edx
    817e:	c1 e2 03             	shl    $0x3,%edx
    8181:	01 c2                	add    %eax,%edx
    8183:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    818a:	89 c2                	mov    %eax,%edx
    818c:	89 d8                	mov    %ebx,%eax
    818e:	c1 e0 02             	shl    $0x2,%eax
    8191:	01 d8                	add    %ebx,%eax
    8193:	c1 e0 05             	shl    $0x5,%eax
    8196:	01 d0                	add    %edx,%eax
    8198:	01 f0                	add    %esi,%eax
    819a:	83 c0 4c             	add    $0x4c,%eax
    819d:	8b 30                	mov    (%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    819f:	8b 7d 0c             	mov    0xc(%ebp),%edi
    81a2:	8b 45 14             	mov    0x14(%ebp),%eax
    81a5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    81a8:	89 c2                	mov    %eax,%edx
    81aa:	c1 e2 03             	shl    $0x3,%edx
    81ad:	01 c2                	add    %eax,%edx
    81af:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    81b6:	89 c2                	mov    %eax,%edx
    81b8:	89 d8                	mov    %ebx,%eax
    81ba:	c1 e0 02             	shl    $0x2,%eax
    81bd:	01 d8                	add    %ebx,%eax
    81bf:	c1 e0 05             	shl    $0x5,%eax
    81c2:	01 d0                	add    %edx,%eax
    81c4:	01 f8                	add    %edi,%eax
    81c6:	83 c0 50             	add    $0x50,%eax
    81c9:	8b 00                	mov    (%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    81cb:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    81cd:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    81d0:	89 c8                	mov    %ecx,%eax
    81d2:	c1 e0 03             	shl    $0x3,%eax
    81d5:	01 c8                	add    %ecx,%eax
    81d7:	c1 e0 02             	shl    $0x2,%eax
    81da:	01 c8                	add    %ecx,%eax
    81dc:	01 d0                	add    %edx,%eax
    81de:	8b 04 85 20 f5 00 00 	mov    0xf520(,%eax,4),%eax
    81e5:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    81e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    81ef:	e9 ac 01 00 00       	jmp    83a0 <III_hufman_decode+0x306>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    81f4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    81f7:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    81fa:	7d 43                	jge    823f <III_hufman_decode+0x1a5>
    81fc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    81ff:	8b 45 14             	mov    0x14(%ebp),%eax
    8202:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8205:	89 c2                	mov    %eax,%edx
    8207:	c1 e2 03             	shl    $0x3,%edx
    820a:	01 c2                	add    %eax,%edx
    820c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8213:	89 c2                	mov    %eax,%edx
    8215:	89 c8                	mov    %ecx,%eax
    8217:	c1 e0 02             	shl    $0x2,%eax
    821a:	01 c8                	add    %ecx,%eax
    821c:	c1 e0 05             	shl    $0x5,%eax
    821f:	01 d0                	add    %edx,%eax
    8221:	01 d8                	add    %ebx,%eax
    8223:	83 c0 34             	add    $0x34,%eax
    8226:	8b 10                	mov    (%eax),%edx
    8228:	89 d0                	mov    %edx,%eax
    822a:	c1 e0 02             	shl    $0x2,%eax
    822d:	01 d0                	add    %edx,%eax
    822f:	c1 e0 03             	shl    $0x3,%eax
    8232:	05 00 31 01 00       	add    $0x13100,%eax
    8237:	89 45 e0             	mov    %eax,-0x20(%ebp)
    823a:	e9 86 00 00 00       	jmp    82c5 <III_hufman_decode+0x22b>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    823f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8242:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    8245:	7d 40                	jge    8287 <III_hufman_decode+0x1ed>
    8247:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    824a:	8b 45 14             	mov    0x14(%ebp),%eax
    824d:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8250:	89 c2                	mov    %eax,%edx
    8252:	c1 e2 03             	shl    $0x3,%edx
    8255:	01 c2                	add    %eax,%edx
    8257:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    825e:	89 c2                	mov    %eax,%edx
    8260:	89 c8                	mov    %ecx,%eax
    8262:	c1 e0 02             	shl    $0x2,%eax
    8265:	01 c8                	add    %ecx,%eax
    8267:	c1 e0 05             	shl    $0x5,%eax
    826a:	01 d0                	add    %edx,%eax
    826c:	01 d8                	add    %ebx,%eax
    826e:	83 c0 38             	add    $0x38,%eax
    8271:	8b 10                	mov    (%eax),%edx
    8273:	89 d0                	mov    %edx,%eax
    8275:	c1 e0 02             	shl    $0x2,%eax
    8278:	01 d0                	add    %edx,%eax
    827a:	c1 e0 03             	shl    $0x3,%eax
    827d:	05 00 31 01 00       	add    $0x13100,%eax
    8282:	89 45 e0             	mov    %eax,-0x20(%ebp)
    8285:	eb 3e                	jmp    82c5 <III_hufman_decode+0x22b>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    8287:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    828a:	8b 45 14             	mov    0x14(%ebp),%eax
    828d:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8290:	89 c2                	mov    %eax,%edx
    8292:	c1 e2 03             	shl    $0x3,%edx
    8295:	01 c2                	add    %eax,%edx
    8297:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    829e:	89 c2                	mov    %eax,%edx
    82a0:	89 c8                	mov    %ecx,%eax
    82a2:	c1 e0 02             	shl    $0x2,%eax
    82a5:	01 c8                	add    %ecx,%eax
    82a7:	c1 e0 05             	shl    $0x5,%eax
    82aa:	01 d0                	add    %edx,%eax
    82ac:	01 d8                	add    %ebx,%eax
    82ae:	83 c0 3c             	add    $0x3c,%eax
    82b1:	8b 10                	mov    (%eax),%edx
    82b3:	89 d0                	mov    %edx,%eax
    82b5:	c1 e0 02             	shl    $0x2,%eax
    82b8:	01 d0                	add    %edx,%eax
    82ba:	c1 e0 03             	shl    $0x3,%eax
    82bd:	05 00 31 01 00       	add    $0x13100,%eax
    82c2:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    82c5:	8d 45 c8             	lea    -0x38(%ebp),%eax
    82c8:	89 44 24 10          	mov    %eax,0x10(%esp)
    82cc:	8d 45 cc             	lea    -0x34(%ebp),%eax
    82cf:	89 44 24 0c          	mov    %eax,0xc(%esp)
    82d3:	8d 45 d0             	lea    -0x30(%ebp),%eax
    82d6:	89 44 24 08          	mov    %eax,0x8(%esp)
    82da:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    82dd:	89 44 24 04          	mov    %eax,0x4(%esp)
    82e1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    82e4:	89 04 24             	mov    %eax,(%esp)
    82e7:	e8 fd ee ff ff       	call   71e9 <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = x;
    82ec:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    82ef:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    82f4:	89 c8                	mov    %ecx,%eax
    82f6:	f7 ea                	imul   %edx
    82f8:	c1 fa 02             	sar    $0x2,%edx
    82fb:	89 c8                	mov    %ecx,%eax
    82fd:	c1 f8 1f             	sar    $0x1f,%eax
    8300:	29 c2                	sub    %eax,%edx
    8302:	89 d0                	mov    %edx,%eax
    8304:	89 c2                	mov    %eax,%edx
    8306:	89 d0                	mov    %edx,%eax
    8308:	c1 e0 03             	shl    $0x3,%eax
    830b:	01 d0                	add    %edx,%eax
    830d:	c1 e0 03             	shl    $0x3,%eax
    8310:	89 c2                	mov    %eax,%edx
    8312:	8b 45 08             	mov    0x8(%ebp),%eax
    8315:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8318:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    831b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8320:	89 c8                	mov    %ecx,%eax
    8322:	f7 ea                	imul   %edx
    8324:	c1 fa 02             	sar    $0x2,%edx
    8327:	89 c8                	mov    %ecx,%eax
    8329:	c1 f8 1f             	sar    $0x1f,%eax
    832c:	29 c2                	sub    %eax,%edx
    832e:	89 d0                	mov    %edx,%eax
    8330:	c1 e0 03             	shl    $0x3,%eax
    8333:	01 d0                	add    %edx,%eax
    8335:	01 c0                	add    %eax,%eax
    8337:	29 c1                	sub    %eax,%ecx
    8339:	89 ca                	mov    %ecx,%edx
    833b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    833e:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    8341:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8344:	8d 48 01             	lea    0x1(%eax),%ecx
    8347:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    834c:	89 c8                	mov    %ecx,%eax
    834e:	f7 ea                	imul   %edx
    8350:	c1 fa 02             	sar    $0x2,%edx
    8353:	89 c8                	mov    %ecx,%eax
    8355:	c1 f8 1f             	sar    $0x1f,%eax
    8358:	29 c2                	sub    %eax,%edx
    835a:	89 d0                	mov    %edx,%eax
    835c:	89 c2                	mov    %eax,%edx
    835e:	89 d0                	mov    %edx,%eax
    8360:	c1 e0 03             	shl    $0x3,%eax
    8363:	01 d0                	add    %edx,%eax
    8365:	c1 e0 03             	shl    $0x3,%eax
    8368:	89 c2                	mov    %eax,%edx
    836a:	8b 45 08             	mov    0x8(%ebp),%eax
    836d:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8370:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8373:	8d 48 01             	lea    0x1(%eax),%ecx
    8376:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    837b:	89 c8                	mov    %ecx,%eax
    837d:	f7 ea                	imul   %edx
    837f:	c1 fa 02             	sar    $0x2,%edx
    8382:	89 c8                	mov    %ecx,%eax
    8384:	c1 f8 1f             	sar    $0x1f,%eax
    8387:	29 c2                	sub    %eax,%edx
    8389:	89 d0                	mov    %edx,%eax
    838b:	c1 e0 03             	shl    $0x3,%eax
    838e:	01 d0                	add    %edx,%eax
    8390:	01 c0                	add    %eax,%eax
    8392:	29 c1                	sub    %eax,%ecx
    8394:	89 ca                	mov    %ecx,%edx
    8396:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8399:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    839c:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    83a0:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    83a3:	8b 75 0c             	mov    0xc(%ebp),%esi
    83a6:	8b 45 14             	mov    0x14(%ebp),%eax
    83a9:	8b 4d 10             	mov    0x10(%ebp),%ecx
    83ac:	89 c2                	mov    %eax,%edx
    83ae:	c1 e2 03             	shl    $0x3,%edx
    83b1:	01 c2                	add    %eax,%edx
    83b3:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    83ba:	89 c2                	mov    %eax,%edx
    83bc:	89 c8                	mov    %ecx,%eax
    83be:	c1 e0 02             	shl    $0x2,%eax
    83c1:	01 c8                	add    %ecx,%eax
    83c3:	c1 e0 05             	shl    $0x5,%eax
    83c6:	01 d0                	add    %edx,%eax
    83c8:	01 f0                	add    %esi,%eax
    83ca:	83 c0 1c             	add    $0x1c,%eax
    83cd:	8b 00                	mov    (%eax),%eax
    83cf:	01 c0                	add    %eax,%eax
    83d1:	39 c3                	cmp    %eax,%ebx
    83d3:	0f 82 1b fe ff ff    	jb     81f4 <III_hufman_decode+0x15a>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    83d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    83dc:	8b 45 14             	mov    0x14(%ebp),%eax
    83df:	8b 4d 10             	mov    0x10(%ebp),%ecx
    83e2:	89 c2                	mov    %eax,%edx
    83e4:	c1 e2 03             	shl    $0x3,%edx
    83e7:	01 c2                	add    %eax,%edx
    83e9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    83f0:	89 c2                	mov    %eax,%edx
    83f2:	89 c8                	mov    %ecx,%eax
    83f4:	c1 e0 02             	shl    $0x2,%eax
    83f7:	01 c8                	add    %ecx,%eax
    83f9:	c1 e0 05             	shl    $0x5,%eax
    83fc:	01 d0                	add    %edx,%eax
    83fe:	01 d8                	add    %ebx,%eax
    8400:	83 c0 5c             	add    $0x5c,%eax
    8403:	8b 00                	mov    (%eax),%eax
    8405:	8d 50 20             	lea    0x20(%eax),%edx
    8408:	89 d0                	mov    %edx,%eax
    840a:	c1 e0 02             	shl    $0x2,%eax
    840d:	01 d0                	add    %edx,%eax
    840f:	c1 e0 03             	shl    $0x3,%eax
    8412:	05 00 31 01 00       	add    $0x13100,%eax
    8417:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    841a:	e9 91 01 00 00       	jmp    85b0 <III_hufman_decode+0x516>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    841f:	8d 45 c8             	lea    -0x38(%ebp),%eax
    8422:	89 44 24 10          	mov    %eax,0x10(%esp)
    8426:	8d 45 cc             	lea    -0x34(%ebp),%eax
    8429:	89 44 24 0c          	mov    %eax,0xc(%esp)
    842d:	8d 45 d0             	lea    -0x30(%ebp),%eax
    8430:	89 44 24 08          	mov    %eax,0x8(%esp)
    8434:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    8437:	89 44 24 04          	mov    %eax,0x4(%esp)
    843b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    843e:	89 04 24             	mov    %eax,(%esp)
    8441:	e8 a3 ed ff ff       	call   71e9 <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = v;
    8446:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8449:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    844e:	89 c8                	mov    %ecx,%eax
    8450:	f7 ea                	imul   %edx
    8452:	c1 fa 02             	sar    $0x2,%edx
    8455:	89 c8                	mov    %ecx,%eax
    8457:	c1 f8 1f             	sar    $0x1f,%eax
    845a:	29 c2                	sub    %eax,%edx
    845c:	89 d0                	mov    %edx,%eax
    845e:	89 c2                	mov    %eax,%edx
    8460:	89 d0                	mov    %edx,%eax
    8462:	c1 e0 03             	shl    $0x3,%eax
    8465:	01 d0                	add    %edx,%eax
    8467:	c1 e0 03             	shl    $0x3,%eax
    846a:	89 c2                	mov    %eax,%edx
    846c:	8b 45 08             	mov    0x8(%ebp),%eax
    846f:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8472:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8475:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    847a:	89 c8                	mov    %ecx,%eax
    847c:	f7 ea                	imul   %edx
    847e:	c1 fa 02             	sar    $0x2,%edx
    8481:	89 c8                	mov    %ecx,%eax
    8483:	c1 f8 1f             	sar    $0x1f,%eax
    8486:	29 c2                	sub    %eax,%edx
    8488:	89 d0                	mov    %edx,%eax
    848a:	c1 e0 03             	shl    $0x3,%eax
    848d:	01 d0                	add    %edx,%eax
    848f:	01 c0                	add    %eax,%eax
    8491:	29 c1                	sub    %eax,%ecx
    8493:	89 ca                	mov    %ecx,%edx
    8495:	8b 45 cc             	mov    -0x34(%ebp),%eax
    8498:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    849b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    849e:	8d 48 01             	lea    0x1(%eax),%ecx
    84a1:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    84a6:	89 c8                	mov    %ecx,%eax
    84a8:	f7 ea                	imul   %edx
    84aa:	c1 fa 02             	sar    $0x2,%edx
    84ad:	89 c8                	mov    %ecx,%eax
    84af:	c1 f8 1f             	sar    $0x1f,%eax
    84b2:	29 c2                	sub    %eax,%edx
    84b4:	89 d0                	mov    %edx,%eax
    84b6:	89 c2                	mov    %eax,%edx
    84b8:	89 d0                	mov    %edx,%eax
    84ba:	c1 e0 03             	shl    $0x3,%eax
    84bd:	01 d0                	add    %edx,%eax
    84bf:	c1 e0 03             	shl    $0x3,%eax
    84c2:	89 c2                	mov    %eax,%edx
    84c4:	8b 45 08             	mov    0x8(%ebp),%eax
    84c7:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    84ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    84cd:	8d 48 01             	lea    0x1(%eax),%ecx
    84d0:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    84d5:	89 c8                	mov    %ecx,%eax
    84d7:	f7 ea                	imul   %edx
    84d9:	c1 fa 02             	sar    $0x2,%edx
    84dc:	89 c8                	mov    %ecx,%eax
    84de:	c1 f8 1f             	sar    $0x1f,%eax
    84e1:	29 c2                	sub    %eax,%edx
    84e3:	89 d0                	mov    %edx,%eax
    84e5:	c1 e0 03             	shl    $0x3,%eax
    84e8:	01 d0                	add    %edx,%eax
    84ea:	01 c0                	add    %eax,%eax
    84ec:	29 c1                	sub    %eax,%ecx
    84ee:	89 ca                	mov    %ecx,%edx
    84f0:	8b 45 c8             	mov    -0x38(%ebp),%eax
    84f3:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    84f6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    84f9:	8d 48 02             	lea    0x2(%eax),%ecx
    84fc:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8501:	89 c8                	mov    %ecx,%eax
    8503:	f7 ea                	imul   %edx
    8505:	c1 fa 02             	sar    $0x2,%edx
    8508:	89 c8                	mov    %ecx,%eax
    850a:	c1 f8 1f             	sar    $0x1f,%eax
    850d:	29 c2                	sub    %eax,%edx
    850f:	89 d0                	mov    %edx,%eax
    8511:	89 c2                	mov    %eax,%edx
    8513:	89 d0                	mov    %edx,%eax
    8515:	c1 e0 03             	shl    $0x3,%eax
    8518:	01 d0                	add    %edx,%eax
    851a:	c1 e0 03             	shl    $0x3,%eax
    851d:	89 c2                	mov    %eax,%edx
    851f:	8b 45 08             	mov    0x8(%ebp),%eax
    8522:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8525:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8528:	8d 48 02             	lea    0x2(%eax),%ecx
    852b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8530:	89 c8                	mov    %ecx,%eax
    8532:	f7 ea                	imul   %edx
    8534:	c1 fa 02             	sar    $0x2,%edx
    8537:	89 c8                	mov    %ecx,%eax
    8539:	c1 f8 1f             	sar    $0x1f,%eax
    853c:	29 c2                	sub    %eax,%edx
    853e:	89 d0                	mov    %edx,%eax
    8540:	c1 e0 03             	shl    $0x3,%eax
    8543:	01 d0                	add    %edx,%eax
    8545:	01 c0                	add    %eax,%eax
    8547:	29 c1                	sub    %eax,%ecx
    8549:	89 ca                	mov    %ecx,%edx
    854b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    854e:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    8551:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8554:	8d 48 03             	lea    0x3(%eax),%ecx
    8557:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    855c:	89 c8                	mov    %ecx,%eax
    855e:	f7 ea                	imul   %edx
    8560:	c1 fa 02             	sar    $0x2,%edx
    8563:	89 c8                	mov    %ecx,%eax
    8565:	c1 f8 1f             	sar    $0x1f,%eax
    8568:	29 c2                	sub    %eax,%edx
    856a:	89 d0                	mov    %edx,%eax
    856c:	89 c2                	mov    %eax,%edx
    856e:	89 d0                	mov    %edx,%eax
    8570:	c1 e0 03             	shl    $0x3,%eax
    8573:	01 d0                	add    %edx,%eax
    8575:	c1 e0 03             	shl    $0x3,%eax
    8578:	89 c2                	mov    %eax,%edx
    857a:	8b 45 08             	mov    0x8(%ebp),%eax
    857d:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8580:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8583:	8d 48 03             	lea    0x3(%eax),%ecx
    8586:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    858b:	89 c8                	mov    %ecx,%eax
    858d:	f7 ea                	imul   %edx
    858f:	c1 fa 02             	sar    $0x2,%edx
    8592:	89 c8                	mov    %ecx,%eax
    8594:	c1 f8 1f             	sar    $0x1f,%eax
    8597:	29 c2                	sub    %eax,%edx
    8599:	89 d0                	mov    %edx,%eax
    859b:	c1 e0 03             	shl    $0x3,%eax
    859e:	01 d0                	add    %edx,%eax
    85a0:	01 c0                	add    %eax,%eax
    85a2:	29 c1                	sub    %eax,%ecx
    85a4:	89 ca                	mov    %ecx,%edx
    85a6:	8b 45 d0             	mov    -0x30(%ebp),%eax
    85a9:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    85ac:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    85b0:	e8 5b d3 ff ff       	call   5910 <hsstell>
    85b5:	89 c3                	mov    %eax,%ebx
    85b7:	8b 75 0c             	mov    0xc(%ebp),%esi
    85ba:	8b 45 14             	mov    0x14(%ebp),%eax
    85bd:	8b 4d 10             	mov    0x10(%ebp),%ecx
    85c0:	89 c2                	mov    %eax,%edx
    85c2:	c1 e2 03             	shl    $0x3,%edx
    85c5:	01 c2                	add    %eax,%edx
    85c7:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    85ce:	89 c2                	mov    %eax,%edx
    85d0:	89 c8                	mov    %ecx,%eax
    85d2:	c1 e0 02             	shl    $0x2,%eax
    85d5:	01 c8                	add    %ecx,%eax
    85d7:	c1 e0 05             	shl    $0x5,%eax
    85da:	01 d0                	add    %edx,%eax
    85dc:	01 f0                	add    %esi,%eax
    85de:	83 c0 18             	add    $0x18,%eax
    85e1:	8b 10                	mov    (%eax),%edx
    85e3:	8b 45 18             	mov    0x18(%ebp),%eax
    85e6:	01 d0                	add    %edx,%eax
    85e8:	39 c3                	cmp    %eax,%ebx
    85ea:	73 0d                	jae    85f9 <III_hufman_decode+0x55f>
    85ec:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    85f3:	0f 8e 26 fe ff ff    	jle    841f <III_hufman_decode+0x385>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    85f9:	e8 12 d3 ff ff       	call   5910 <hsstell>
    85fe:	89 c3                	mov    %eax,%ebx
    8600:	8b 75 0c             	mov    0xc(%ebp),%esi
    8603:	8b 45 14             	mov    0x14(%ebp),%eax
    8606:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8609:	89 c2                	mov    %eax,%edx
    860b:	c1 e2 03             	shl    $0x3,%edx
    860e:	01 c2                	add    %eax,%edx
    8610:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8617:	89 c2                	mov    %eax,%edx
    8619:	89 c8                	mov    %ecx,%eax
    861b:	c1 e0 02             	shl    $0x2,%eax
    861e:	01 c8                	add    %ecx,%eax
    8620:	c1 e0 05             	shl    $0x5,%eax
    8623:	01 d0                	add    %edx,%eax
    8625:	01 f0                	add    %esi,%eax
    8627:	83 c0 18             	add    $0x18,%eax
    862a:	8b 10                	mov    (%eax),%edx
    862c:	8b 45 18             	mov    0x18(%ebp),%eax
    862f:	01 d0                	add    %edx,%eax
    8631:	39 c3                	cmp    %eax,%ebx
    8633:	76 48                	jbe    867d <III_hufman_decode+0x5e3>
   {  i -=4;
    8635:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    8639:	e8 d2 d2 ff ff       	call   5910 <hsstell>
    863e:	8b 55 18             	mov    0x18(%ebp),%edx
    8641:	29 d0                	sub    %edx,%eax
    8643:	89 c6                	mov    %eax,%esi
    8645:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8648:	8b 45 14             	mov    0x14(%ebp),%eax
    864b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    864e:	89 c2                	mov    %eax,%edx
    8650:	c1 e2 03             	shl    $0x3,%edx
    8653:	01 c2                	add    %eax,%edx
    8655:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    865c:	89 c2                	mov    %eax,%edx
    865e:	89 c8                	mov    %ecx,%eax
    8660:	c1 e0 02             	shl    $0x2,%eax
    8663:	01 c8                	add    %ecx,%eax
    8665:	c1 e0 05             	shl    $0x5,%eax
    8668:	01 d0                	add    %edx,%eax
    866a:	01 d8                	add    %ebx,%eax
    866c:	83 c0 18             	add    $0x18,%eax
    866f:	8b 00                	mov    (%eax),%eax
    8671:	29 c6                	sub    %eax,%esi
    8673:	89 f0                	mov    %esi,%eax
    8675:	89 04 24             	mov    %eax,(%esp)
    8678:	e8 de d2 ff ff       	call   595b <rewindNbits>
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    867d:	e8 8e d2 ff ff       	call   5910 <hsstell>
    8682:	89 c3                	mov    %eax,%ebx
    8684:	8b 75 0c             	mov    0xc(%ebp),%esi
    8687:	8b 45 14             	mov    0x14(%ebp),%eax
    868a:	8b 4d 10             	mov    0x10(%ebp),%ecx
    868d:	89 c2                	mov    %eax,%edx
    868f:	c1 e2 03             	shl    $0x3,%edx
    8692:	01 c2                	add    %eax,%edx
    8694:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    869b:	89 c2                	mov    %eax,%edx
    869d:	89 c8                	mov    %ecx,%eax
    869f:	c1 e0 02             	shl    $0x2,%eax
    86a2:	01 c8                	add    %ecx,%eax
    86a4:	c1 e0 05             	shl    $0x5,%eax
    86a7:	01 d0                	add    %edx,%eax
    86a9:	01 f0                	add    %esi,%eax
    86ab:	83 c0 18             	add    $0x18,%eax
    86ae:	8b 10                	mov    (%eax),%edx
    86b0:	8b 45 18             	mov    0x18(%ebp),%eax
    86b3:	01 d0                	add    %edx,%eax
    86b5:	39 c3                	cmp    %eax,%ebx
    86b7:	73 45                	jae    86fe <III_hufman_decode+0x664>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
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
    86e0:	83 c0 18             	add    $0x18,%eax
    86e3:	8b 10                	mov    (%eax),%edx
    86e5:	8b 45 18             	mov    0x18(%ebp),%eax
    86e8:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    86eb:	e8 20 d2 ff ff       	call   5910 <hsstell>
    86f0:	29 c3                	sub    %eax,%ebx
    86f2:	89 d8                	mov    %ebx,%eax
    86f4:	89 04 24             	mov    %eax,(%esp)
    86f7:	e8 30 d2 ff ff       	call   592c <hgetbits>

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    86fc:	eb 5c                	jmp    875a <III_hufman_decode+0x6c0>
    86fe:	eb 5a                	jmp    875a <III_hufman_decode+0x6c0>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    8700:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8703:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8708:	89 c8                	mov    %ecx,%eax
    870a:	f7 ea                	imul   %edx
    870c:	c1 fa 02             	sar    $0x2,%edx
    870f:	89 c8                	mov    %ecx,%eax
    8711:	c1 f8 1f             	sar    $0x1f,%eax
    8714:	29 c2                	sub    %eax,%edx
    8716:	89 d0                	mov    %edx,%eax
    8718:	89 c2                	mov    %eax,%edx
    871a:	89 d0                	mov    %edx,%eax
    871c:	c1 e0 03             	shl    $0x3,%eax
    871f:	01 d0                	add    %edx,%eax
    8721:	c1 e0 03             	shl    $0x3,%eax
    8724:	89 c2                	mov    %eax,%edx
    8726:	8b 45 08             	mov    0x8(%ebp),%eax
    8729:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    872c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    872f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8734:	89 c8                	mov    %ecx,%eax
    8736:	f7 ea                	imul   %edx
    8738:	c1 fa 02             	sar    $0x2,%edx
    873b:	89 c8                	mov    %ecx,%eax
    873d:	c1 f8 1f             	sar    $0x1f,%eax
    8740:	29 c2                	sub    %eax,%edx
    8742:	89 d0                	mov    %edx,%eax
    8744:	c1 e0 03             	shl    $0x3,%eax
    8747:	01 d0                	add    %edx,%eax
    8749:	01 c0                	add    %eax,%eax
    874b:	29 c1                	sub    %eax,%ecx
    874d:	89 ca                	mov    %ecx,%edx
    874f:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    8756:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    875a:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    8761:	7e 9d                	jle    8700 <III_hufman_decode+0x666>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    8763:	83 c4 4c             	add    $0x4c,%esp
    8766:	5b                   	pop    %ebx
    8767:	5e                   	pop    %esi
    8768:	5f                   	pop    %edi
    8769:	5d                   	pop    %ebp
    876a:	c3                   	ret    

0000876b <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    876b:	55                   	push   %ebp
    876c:	89 e5                	mov    %esp,%ebp
    876e:	56                   	push   %esi
    876f:	53                   	push   %ebx
    8770:	83 ec 50             	sub    $0x50,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    8773:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    877a:	8b 45 1c             	mov    0x1c(%ebp),%eax
    877d:	8b 00                	mov    (%eax),%eax
    877f:	8b 40 10             	mov    0x10(%eax),%eax
    8782:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    8785:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    878c:	8b 45 14             	mov    0x14(%ebp),%eax
    878f:	8b 40 10             	mov    0x10(%eax),%eax
    8792:	85 c0                	test   %eax,%eax
    8794:	74 61                	je     87f7 <III_dequantize_sample+0x8c>
    8796:	8b 45 14             	mov    0x14(%ebp),%eax
    8799:	8b 40 14             	mov    0x14(%eax),%eax
    879c:	83 f8 02             	cmp    $0x2,%eax
    879f:	75 56                	jne    87f7 <III_dequantize_sample+0x8c>
		if (gr_info->mixed_block_flag)
    87a1:	8b 45 14             	mov    0x14(%ebp),%eax
    87a4:	8b 40 18             	mov    0x18(%eax),%eax
    87a7:	85 c0                	test   %eax,%eax
    87a9:	74 15                	je     87c0 <III_dequantize_sample+0x55>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    87ab:	8b 45 dc             	mov    -0x24(%ebp),%eax
    87ae:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    87b4:	05 24 f5 00 00       	add    $0xf524,%eax
    87b9:	8b 00                	mov    (%eax),%eax
    87bb:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    87be:	eb 4a                	jmp    880a <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    87c0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    87c3:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    87c9:	05 74 f5 00 00       	add    $0xf574,%eax
    87ce:	8b 50 0c             	mov    0xc(%eax),%edx
    87d1:	89 d0                	mov    %edx,%eax
    87d3:	01 c0                	add    %eax,%eax
    87d5:	01 d0                	add    %edx,%eax
    87d7:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    87da:	8b 45 dc             	mov    -0x24(%ebp),%eax
    87dd:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    87e3:	05 74 f5 00 00       	add    $0xf574,%eax
    87e8:	8b 40 0c             	mov    0xc(%eax),%eax
    87eb:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    87ee:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    87f5:	eb 13                	jmp    880a <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    87f7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    87fa:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8800:	05 24 f5 00 00       	add    $0xf524,%eax
    8805:	8b 00                	mov    (%eax),%eax
    8807:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    880a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8811:	e9 3d 06 00 00       	jmp    8e53 <III_dequantize_sample+0x6e8>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    8816:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    881d:	e9 23 06 00 00       	jmp    8e45 <III_dequantize_sample+0x6da>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    8822:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8825:	89 d0                	mov    %edx,%eax
    8827:	c1 e0 03             	shl    $0x3,%eax
    882a:	01 d0                	add    %edx,%eax
    882c:	01 c0                	add    %eax,%eax
    882e:	89 c2                	mov    %eax,%edx
    8830:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8833:	01 d0                	add    %edx,%eax
    8835:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    8838:	0f 85 9e 02 00 00    	jne    8adc <III_dequantize_sample+0x371>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    883e:	8b 45 14             	mov    0x14(%ebp),%eax
    8841:	8b 40 10             	mov    0x10(%eax),%eax
    8844:	85 c0                	test   %eax,%eax
    8846:	0f 84 6b 02 00 00    	je     8ab7 <III_dequantize_sample+0x34c>
    884c:	8b 45 14             	mov    0x14(%ebp),%eax
    884f:	8b 40 14             	mov    0x14(%eax),%eax
    8852:	83 f8 02             	cmp    $0x2,%eax
    8855:	0f 85 5c 02 00 00    	jne    8ab7 <III_dequantize_sample+0x34c>
					if (gr_info->mixed_block_flag) {
    885b:	8b 45 14             	mov    0x14(%ebp),%eax
    885e:	8b 40 18             	mov    0x18(%eax),%eax
    8861:	85 c0                	test   %eax,%eax
    8863:	0f 84 af 01 00 00    	je     8a18 <III_dequantize_sample+0x2ad>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    8869:	8b 55 f0             	mov    -0x10(%ebp),%edx
    886c:	89 d0                	mov    %edx,%eax
    886e:	c1 e0 03             	shl    $0x3,%eax
    8871:	01 d0                	add    %edx,%eax
    8873:	01 c0                	add    %eax,%eax
    8875:	89 c2                	mov    %eax,%edx
    8877:	8b 45 f4             	mov    -0xc(%ebp),%eax
    887a:	01 c2                	add    %eax,%edx
    887c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    887f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8885:	05 40 f5 00 00       	add    $0xf540,%eax
    888a:	8b 00                	mov    (%eax),%eax
    888c:	39 c2                	cmp    %eax,%edx
    888e:	0f 85 93 00 00 00    	jne    8927 <III_dequantize_sample+0x1bc>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    8894:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8897:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    889d:	05 80 f5 00 00       	add    $0xf580,%eax
    88a2:	8b 50 0c             	mov    0xc(%eax),%edx
    88a5:	89 d0                	mov    %edx,%eax
    88a7:	01 c0                	add    %eax,%eax
    88a9:	01 d0                	add    %edx,%eax
    88ab:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    88ae:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    88b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    88b8:	8d 48 01             	lea    0x1(%eax),%ecx
    88bb:	8b 55 dc             	mov    -0x24(%ebp),%edx
    88be:	89 d0                	mov    %edx,%eax
    88c0:	c1 e0 03             	shl    $0x3,%eax
    88c3:	01 d0                	add    %edx,%eax
    88c5:	c1 e0 02             	shl    $0x2,%eax
    88c8:	01 d0                	add    %edx,%eax
    88ca:	01 c8                	add    %ecx,%eax
    88cc:	83 c0 14             	add    $0x14,%eax
    88cf:	8b 0c 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    88d6:	8b 55 dc             	mov    -0x24(%ebp),%edx
    88d9:	89 d0                	mov    %edx,%eax
    88db:	c1 e0 03             	shl    $0x3,%eax
    88de:	01 d0                	add    %edx,%eax
    88e0:	c1 e0 02             	shl    $0x2,%eax
    88e3:	01 d0                	add    %edx,%eax
    88e5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    88e8:	01 d0                	add    %edx,%eax
    88ea:	83 c0 14             	add    $0x14,%eax
    88ed:	8b 04 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    88f4:	29 c1                	sub    %eax,%ecx
    88f6:	89 c8                	mov    %ecx,%eax
    88f8:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    88fb:	8b 55 dc             	mov    -0x24(%ebp),%edx
    88fe:	89 d0                	mov    %edx,%eax
    8900:	c1 e0 03             	shl    $0x3,%eax
    8903:	01 d0                	add    %edx,%eax
    8905:	c1 e0 02             	shl    $0x2,%eax
    8908:	01 d0                	add    %edx,%eax
    890a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    890d:	01 d0                	add    %edx,%eax
    890f:	83 c0 14             	add    $0x14,%eax
    8912:	8b 14 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%edx
    8919:	89 d0                	mov    %edx,%eax
    891b:	01 c0                	add    %eax,%eax
    891d:	01 d0                	add    %edx,%eax
    891f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    8922:	e9 8e 01 00 00       	jmp    8ab5 <III_dequantize_sample+0x34a>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    8927:	8b 55 f0             	mov    -0x10(%ebp),%edx
    892a:	89 d0                	mov    %edx,%eax
    892c:	c1 e0 03             	shl    $0x3,%eax
    892f:	01 d0                	add    %edx,%eax
    8931:	01 c0                	add    %eax,%eax
    8933:	89 c2                	mov    %eax,%edx
    8935:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8938:	01 c2                	add    %eax,%edx
    893a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    893d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8943:	05 40 f5 00 00       	add    $0xf540,%eax
    8948:	8b 00                	mov    (%eax),%eax
    894a:	39 c2                	cmp    %eax,%edx
    894c:	7d 2a                	jge    8978 <III_dequantize_sample+0x20d>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    894e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8952:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8955:	8d 48 01             	lea    0x1(%eax),%ecx
    8958:	8b 55 dc             	mov    -0x24(%ebp),%edx
    895b:	89 d0                	mov    %edx,%eax
    895d:	c1 e0 03             	shl    $0x3,%eax
    8960:	01 d0                	add    %edx,%eax
    8962:	c1 e0 02             	shl    $0x2,%eax
    8965:	01 d0                	add    %edx,%eax
    8967:	01 c8                	add    %ecx,%eax
    8969:	8b 04 85 20 f5 00 00 	mov    0xf520(,%eax,4),%eax
    8970:	89 45 e8             	mov    %eax,-0x18(%ebp)
    8973:	e9 3d 01 00 00       	jmp    8ab5 <III_dequantize_sample+0x34a>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    8978:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    897c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    897f:	8d 48 01             	lea    0x1(%eax),%ecx
    8982:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8985:	89 d0                	mov    %edx,%eax
    8987:	c1 e0 03             	shl    $0x3,%eax
    898a:	01 d0                	add    %edx,%eax
    898c:	c1 e0 02             	shl    $0x2,%eax
    898f:	01 d0                	add    %edx,%eax
    8991:	01 c8                	add    %ecx,%eax
    8993:	83 c0 14             	add    $0x14,%eax
    8996:	8b 14 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%edx
    899d:	89 d0                	mov    %edx,%eax
    899f:	01 c0                	add    %eax,%eax
    89a1:	01 d0                	add    %edx,%eax
    89a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    89a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    89a9:	8d 48 01             	lea    0x1(%eax),%ecx
    89ac:	8b 55 dc             	mov    -0x24(%ebp),%edx
    89af:	89 d0                	mov    %edx,%eax
    89b1:	c1 e0 03             	shl    $0x3,%eax
    89b4:	01 d0                	add    %edx,%eax
    89b6:	c1 e0 02             	shl    $0x2,%eax
    89b9:	01 d0                	add    %edx,%eax
    89bb:	01 c8                	add    %ecx,%eax
    89bd:	83 c0 14             	add    $0x14,%eax
    89c0:	8b 0c 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    89c7:	8b 55 dc             	mov    -0x24(%ebp),%edx
    89ca:	89 d0                	mov    %edx,%eax
    89cc:	c1 e0 03             	shl    $0x3,%eax
    89cf:	01 d0                	add    %edx,%eax
    89d1:	c1 e0 02             	shl    $0x2,%eax
    89d4:	01 d0                	add    %edx,%eax
    89d6:	8b 55 ec             	mov    -0x14(%ebp),%edx
    89d9:	01 d0                	add    %edx,%eax
    89db:	83 c0 14             	add    $0x14,%eax
    89de:	8b 04 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    89e5:	29 c1                	sub    %eax,%ecx
    89e7:	89 c8                	mov    %ecx,%eax
    89e9:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    89ec:	8b 55 dc             	mov    -0x24(%ebp),%edx
    89ef:	89 d0                	mov    %edx,%eax
    89f1:	c1 e0 03             	shl    $0x3,%eax
    89f4:	01 d0                	add    %edx,%eax
    89f6:	c1 e0 02             	shl    $0x2,%eax
    89f9:	01 d0                	add    %edx,%eax
    89fb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    89fe:	01 d0                	add    %edx,%eax
    8a00:	83 c0 14             	add    $0x14,%eax
    8a03:	8b 14 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%edx
    8a0a:	89 d0                	mov    %edx,%eax
    8a0c:	01 c0                	add    %eax,%eax
    8a0e:	01 d0                	add    %edx,%eax
    8a10:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    8a13:	e9 c4 00 00 00       	jmp    8adc <III_dequantize_sample+0x371>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    8a18:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8a1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8a1f:	8d 48 01             	lea    0x1(%eax),%ecx
    8a22:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8a25:	89 d0                	mov    %edx,%eax
    8a27:	c1 e0 03             	shl    $0x3,%eax
    8a2a:	01 d0                	add    %edx,%eax
    8a2c:	c1 e0 02             	shl    $0x2,%eax
    8a2f:	01 d0                	add    %edx,%eax
    8a31:	01 c8                	add    %ecx,%eax
    8a33:	83 c0 14             	add    $0x14,%eax
    8a36:	8b 14 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%edx
    8a3d:	89 d0                	mov    %edx,%eax
    8a3f:	01 c0                	add    %eax,%eax
    8a41:	01 d0                	add    %edx,%eax
    8a43:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    8a46:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8a49:	8d 48 01             	lea    0x1(%eax),%ecx
    8a4c:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8a4f:	89 d0                	mov    %edx,%eax
    8a51:	c1 e0 03             	shl    $0x3,%eax
    8a54:	01 d0                	add    %edx,%eax
    8a56:	c1 e0 02             	shl    $0x2,%eax
    8a59:	01 d0                	add    %edx,%eax
    8a5b:	01 c8                	add    %ecx,%eax
    8a5d:	83 c0 14             	add    $0x14,%eax
    8a60:	8b 0c 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    8a67:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8a6a:	89 d0                	mov    %edx,%eax
    8a6c:	c1 e0 03             	shl    $0x3,%eax
    8a6f:	01 d0                	add    %edx,%eax
    8a71:	c1 e0 02             	shl    $0x2,%eax
    8a74:	01 d0                	add    %edx,%eax
    8a76:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8a79:	01 d0                	add    %edx,%eax
    8a7b:	83 c0 14             	add    $0x14,%eax
    8a7e:	8b 04 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    8a85:	29 c1                	sub    %eax,%ecx
    8a87:	89 c8                	mov    %ecx,%eax
    8a89:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    8a8c:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8a8f:	89 d0                	mov    %edx,%eax
    8a91:	c1 e0 03             	shl    $0x3,%eax
    8a94:	01 d0                	add    %edx,%eax
    8a96:	c1 e0 02             	shl    $0x2,%eax
    8a99:	01 d0                	add    %edx,%eax
    8a9b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8a9e:	01 d0                	add    %edx,%eax
    8aa0:	83 c0 14             	add    $0x14,%eax
    8aa3:	8b 14 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%edx
    8aaa:	89 d0                	mov    %edx,%eax
    8aac:	01 c0                	add    %eax,%eax
    8aae:	01 d0                	add    %edx,%eax
    8ab0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    8ab3:	eb 27                	jmp    8adc <III_dequantize_sample+0x371>
    8ab5:	eb 25                	jmp    8adc <III_dequantize_sample+0x371>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    8ab7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8abb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8abe:	8d 48 01             	lea    0x1(%eax),%ecx
    8ac1:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8ac4:	89 d0                	mov    %edx,%eax
    8ac6:	c1 e0 03             	shl    $0x3,%eax
    8ac9:	01 d0                	add    %edx,%eax
    8acb:	c1 e0 02             	shl    $0x2,%eax
    8ace:	01 d0                	add    %edx,%eax
    8ad0:	01 c8                	add    %ecx,%eax
    8ad2:	8b 04 85 20 f5 00 00 	mov    0xf520(,%eax,4),%eax
    8ad9:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    8adc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8adf:	89 d0                	mov    %edx,%eax
    8ae1:	c1 e0 03             	shl    $0x3,%eax
    8ae4:	01 d0                	add    %edx,%eax
    8ae6:	c1 e0 04             	shl    $0x4,%eax
    8ae9:	89 c2                	mov    %eax,%edx
    8aeb:	8b 45 0c             	mov    0xc(%ebp),%eax
    8aee:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8af1:	8b 45 14             	mov    0x14(%ebp),%eax
    8af4:	8b 40 08             	mov    0x8(%eax),%eax
    8af7:	ba 00 00 00 00       	mov    $0x0,%edx
    8afc:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8aff:	89 55 cc             	mov    %edx,-0x34(%ebp)
    8b02:	df 6d c8             	fildll -0x38(%ebp)
    8b05:	dd 05 50 db 00 00    	fldl   0xdb50
    8b0b:	de e9                	fsubrp %st,%st(1)
    8b0d:	dd 05 58 db 00 00    	fldl   0xdb58
    8b13:	de c9                	fmulp  %st,%st(1)
    8b15:	dd 5c 24 08          	fstpl  0x8(%esp)
    8b19:	dd 05 60 db 00 00    	fldl   0xdb60
    8b1f:	dd 1c 24             	fstpl  (%esp)
    8b22:	e8 0c c1 ff ff       	call   4c33 <pow>
    8b27:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8b2a:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    8b2d:	8b 45 14             	mov    0x14(%ebp),%eax
    8b30:	8b 40 10             	mov    0x10(%eax),%eax
    8b33:	85 c0                	test   %eax,%eax
    8b35:	0f 84 86 01 00 00    	je     8cc1 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    8b3b:	8b 45 14             	mov    0x14(%ebp),%eax
    8b3e:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    8b41:	83 f8 02             	cmp    $0x2,%eax
    8b44:	75 0a                	jne    8b50 <III_dequantize_sample+0x3e5>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    8b46:	8b 45 14             	mov    0x14(%ebp),%eax
    8b49:	8b 40 18             	mov    0x18(%eax),%eax
    8b4c:	85 c0                	test   %eax,%eax
    8b4e:	74 27                	je     8b77 <III_dequantize_sample+0x40c>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    8b50:	8b 45 14             	mov    0x14(%ebp),%eax
    8b53:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    8b56:	83 f8 02             	cmp    $0x2,%eax
    8b59:	0f 85 62 01 00 00    	jne    8cc1 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    8b5f:	8b 45 14             	mov    0x14(%ebp),%eax
    8b62:	8b 40 18             	mov    0x18(%eax),%eax
    8b65:	85 c0                	test   %eax,%eax
    8b67:	0f 84 54 01 00 00    	je     8cc1 <III_dequantize_sample+0x556>
    8b6d:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    8b71:	0f 8e 4a 01 00 00    	jle    8cc1 <III_dequantize_sample+0x556>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    8b77:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8b7a:	89 d0                	mov    %edx,%eax
    8b7c:	c1 e0 03             	shl    $0x3,%eax
    8b7f:	01 d0                	add    %edx,%eax
    8b81:	c1 e0 04             	shl    $0x4,%eax
    8b84:	89 c2                	mov    %eax,%edx
    8b86:	8b 45 0c             	mov    0xc(%ebp),%eax
    8b89:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8b8c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8b8f:	89 d0                	mov    %edx,%eax
    8b91:	c1 e0 03             	shl    $0x3,%eax
    8b94:	01 d0                	add    %edx,%eax
    8b96:	c1 e0 04             	shl    $0x4,%eax
    8b99:	89 c2                	mov    %eax,%edx
    8b9b:	8b 45 0c             	mov    0xc(%ebp),%eax
    8b9e:	01 c2                	add    %eax,%edx
    8ba0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8ba3:	dd 04 c2             	fldl   (%edx,%eax,8)
    8ba6:	dd 5d c0             	fstpl  -0x40(%ebp)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    8ba9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8bac:	89 d0                	mov    %edx,%eax
    8bae:	c1 e0 03             	shl    $0x3,%eax
    8bb1:	01 d0                	add    %edx,%eax
    8bb3:	01 c0                	add    %eax,%eax
    8bb5:	89 c2                	mov    %eax,%edx
    8bb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8bba:	01 d0                	add    %edx,%eax
    8bbc:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    8bbf:	99                   	cltd   
    8bc0:	f7 7d e0             	idivl  -0x20(%ebp)
    8bc3:	89 c2                	mov    %eax,%edx
    8bc5:	8b 45 14             	mov    0x14(%ebp),%eax
    8bc8:	83 c2 08             	add    $0x8,%edx
    8bcb:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    8bcf:	ba 00 00 00 00       	mov    $0x0,%edx
    8bd4:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8bd7:	89 55 cc             	mov    %edx,-0x34(%ebp)
    8bda:	df 6d c8             	fildll -0x38(%ebp)
    8bdd:	dd 05 68 db 00 00    	fldl   0xdb68
    8be3:	de c9                	fmulp  %st,%st(1)
    8be5:	dd 5c 24 08          	fstpl  0x8(%esp)
    8be9:	dd 05 60 db 00 00    	fldl   0xdb60
    8bef:	dd 1c 24             	fstpl  (%esp)
    8bf2:	e8 3c c0 ff ff       	call   4c33 <pow>
    8bf7:	dc 4d c0             	fmull  -0x40(%ebp)
    8bfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8bfd:	dd 1c c3             	fstpl  (%ebx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    8c00:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8c03:	89 d0                	mov    %edx,%eax
    8c05:	c1 e0 03             	shl    $0x3,%eax
    8c08:	01 d0                	add    %edx,%eax
    8c0a:	c1 e0 04             	shl    $0x4,%eax
    8c0d:	89 c2                	mov    %eax,%edx
    8c0f:	8b 45 0c             	mov    0xc(%ebp),%eax
    8c12:	8d 34 02             	lea    (%edx,%eax,1),%esi
    8c15:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8c18:	89 d0                	mov    %edx,%eax
    8c1a:	c1 e0 03             	shl    $0x3,%eax
    8c1d:	01 d0                	add    %edx,%eax
    8c1f:	c1 e0 04             	shl    $0x4,%eax
    8c22:	89 c2                	mov    %eax,%edx
    8c24:	8b 45 0c             	mov    0xc(%ebp),%eax
    8c27:	01 c2                	add    %eax,%edx
    8c29:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8c2c:	dd 04 c2             	fldl   (%edx,%eax,8)
    8c2f:	dd 5d c0             	fstpl  -0x40(%ebp)
    8c32:	8b 45 14             	mov    0x14(%ebp),%eax
    8c35:	8b 40 40             	mov    0x40(%eax),%eax
    8c38:	ba 00 00 00 00       	mov    $0x0,%edx
    8c3d:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8c40:	89 55 cc             	mov    %edx,-0x34(%ebp)
    8c43:	df 6d c8             	fildll -0x38(%ebp)
    8c46:	d9 e8                	fld1   
    8c48:	de c1                	faddp  %st,%st(1)
    8c4a:	dd 05 70 db 00 00    	fldl   0xdb70
    8c50:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    8c52:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8c55:	89 d0                	mov    %edx,%eax
    8c57:	c1 e0 03             	shl    $0x3,%eax
    8c5a:	01 d0                	add    %edx,%eax
    8c5c:	01 c0                	add    %eax,%eax
    8c5e:	89 c2                	mov    %eax,%edx
    8c60:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8c63:	01 d0                	add    %edx,%eax
    8c65:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    8c68:	99                   	cltd   
    8c69:	f7 7d e0             	idivl  -0x20(%ebp)
    8c6c:	89 c2                	mov    %eax,%edx
    8c6e:	8b 5d 10             	mov    0x10(%ebp),%ebx
    8c71:	8b 4d 18             	mov    0x18(%ebp),%ecx
    8c74:	89 d0                	mov    %edx,%eax
    8c76:	01 c0                	add    %eax,%eax
    8c78:	01 d0                	add    %edx,%eax
    8c7a:	c1 e0 02             	shl    $0x2,%eax
    8c7d:	01 d0                	add    %edx,%eax
    8c7f:	89 ca                	mov    %ecx,%edx
    8c81:	01 d2                	add    %edx,%edx
    8c83:	89 d1                	mov    %edx,%ecx
    8c85:	c1 e1 05             	shl    $0x5,%ecx
    8c88:	29 d1                	sub    %edx,%ecx
    8c8a:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    8c8d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8c90:	01 d0                	add    %edx,%eax
    8c92:	83 c0 14             	add    $0x14,%eax
    8c95:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    8c99:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    8c9c:	db 45 d4             	fildl  -0x2c(%ebp)
    8c9f:	de c9                	fmulp  %st,%st(1)
    8ca1:	dd 5c 24 08          	fstpl  0x8(%esp)
    8ca5:	dd 05 60 db 00 00    	fldl   0xdb60
    8cab:	dd 1c 24             	fstpl  (%esp)
    8cae:	e8 80 bf ff ff       	call   4c33 <pow>
    8cb3:	dc 4d c0             	fmull  -0x40(%ebp)
    8cb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8cb9:	dd 1c c6             	fstpl  (%esi,%eax,8)
    8cbc:	e9 ab 00 00 00       	jmp    8d6c <III_dequantize_sample+0x601>
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    8cc1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8cc4:	89 d0                	mov    %edx,%eax
    8cc6:	c1 e0 03             	shl    $0x3,%eax
    8cc9:	01 d0                	add    %edx,%eax
    8ccb:	c1 e0 04             	shl    $0x4,%eax
    8cce:	89 c2                	mov    %eax,%edx
    8cd0:	8b 45 0c             	mov    0xc(%ebp),%eax
    8cd3:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8cd6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8cd9:	89 d0                	mov    %edx,%eax
    8cdb:	c1 e0 03             	shl    $0x3,%eax
    8cde:	01 d0                	add    %edx,%eax
    8ce0:	c1 e0 04             	shl    $0x4,%eax
    8ce3:	89 c2                	mov    %eax,%edx
    8ce5:	8b 45 0c             	mov    0xc(%ebp),%eax
    8ce8:	01 c2                	add    %eax,%edx
    8cea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8ced:	dd 04 c2             	fldl   (%edx,%eax,8)
    8cf0:	dd 5d c0             	fstpl  -0x40(%ebp)
    8cf3:	8b 45 14             	mov    0x14(%ebp),%eax
    8cf6:	8b 40 40             	mov    0x40(%eax),%eax
    8cf9:	ba 00 00 00 00       	mov    $0x0,%edx
    8cfe:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8d01:	89 55 cc             	mov    %edx,-0x34(%ebp)
    8d04:	df 6d c8             	fildll -0x38(%ebp)
    8d07:	d9 e8                	fld1   
    8d09:	de c1                	faddp  %st,%st(1)
    8d0b:	dd 05 70 db 00 00    	fldl   0xdb70
    8d11:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    8d13:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8d16:	8b 45 18             	mov    0x18(%ebp),%eax
    8d19:	01 c0                	add    %eax,%eax
    8d1b:	89 c2                	mov    %eax,%edx
    8d1d:	c1 e2 05             	shl    $0x5,%edx
    8d20:	29 c2                	sub    %eax,%edx
    8d22:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8d25:	01 d0                	add    %edx,%eax
    8d27:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    8d2a:	89 c2                	mov    %eax,%edx
    8d2c:	8b 45 14             	mov    0x14(%ebp),%eax
    8d2f:	8b 48 3c             	mov    0x3c(%eax),%ecx
    8d32:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8d35:	8b 04 85 e0 f6 00 00 	mov    0xf6e0(,%eax,4),%eax
    8d3c:	0f af c1             	imul   %ecx,%eax
    8d3f:	01 d0                	add    %edx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    8d41:	ba 00 00 00 00       	mov    $0x0,%edx
    8d46:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8d49:	89 55 cc             	mov    %edx,-0x34(%ebp)
    8d4c:	df 6d c8             	fildll -0x38(%ebp)
    8d4f:	de c9                	fmulp  %st,%st(1)
    8d51:	dd 5c 24 08          	fstpl  0x8(%esp)
    8d55:	dd 05 60 db 00 00    	fldl   0xdb60
    8d5b:	dd 1c 24             	fstpl  (%esp)
    8d5e:	e8 d0 be ff ff       	call   4c33 <pow>
    8d63:	dc 4d c0             	fmull  -0x40(%ebp)
    8d66:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8d69:	dd 1c c3             	fstpl  (%ebx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    8d6c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8d6f:	89 d0                	mov    %edx,%eax
    8d71:	c1 e0 03             	shl    $0x3,%eax
    8d74:	01 d0                	add    %edx,%eax
    8d76:	c1 e0 03             	shl    $0x3,%eax
    8d79:	89 c2                	mov    %eax,%edx
    8d7b:	8b 45 08             	mov    0x8(%ebp),%eax
    8d7e:	01 c2                	add    %eax,%edx
    8d80:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8d83:	8b 04 82             	mov    (%edx,%eax,4),%eax
    8d86:	c1 e8 1f             	shr    $0x1f,%eax
    8d89:	0f b6 c0             	movzbl %al,%eax
    8d8c:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    8d8f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8d92:	89 d0                	mov    %edx,%eax
    8d94:	c1 e0 03             	shl    $0x3,%eax
    8d97:	01 d0                	add    %edx,%eax
    8d99:	c1 e0 04             	shl    $0x4,%eax
    8d9c:	89 c2                	mov    %eax,%edx
    8d9e:	8b 45 0c             	mov    0xc(%ebp),%eax
    8da1:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8da4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8da7:	89 d0                	mov    %edx,%eax
    8da9:	c1 e0 03             	shl    $0x3,%eax
    8dac:	01 d0                	add    %edx,%eax
    8dae:	c1 e0 04             	shl    $0x4,%eax
    8db1:	89 c2                	mov    %eax,%edx
    8db3:	8b 45 0c             	mov    0xc(%ebp),%eax
    8db6:	01 c2                	add    %eax,%edx
    8db8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8dbb:	dd 04 c2             	fldl   (%edx,%eax,8)
    8dbe:	dd 5d c0             	fstpl  -0x40(%ebp)
    8dc1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8dc4:	89 d0                	mov    %edx,%eax
    8dc6:	c1 e0 03             	shl    $0x3,%eax
    8dc9:	01 d0                	add    %edx,%eax
    8dcb:	c1 e0 03             	shl    $0x3,%eax
    8dce:	89 c2                	mov    %eax,%edx
    8dd0:	8b 45 08             	mov    0x8(%ebp),%eax
    8dd3:	01 c2                	add    %eax,%edx
    8dd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8dd8:	8b 04 82             	mov    (%edx,%eax,4),%eax
    8ddb:	89 04 24             	mov    %eax,(%esp)
    8dde:	e8 47 bd ff ff       	call   4b2a <abs>
    8de3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    8de6:	db 45 d4             	fildl  -0x2c(%ebp)
    8de9:	dd 05 78 db 00 00    	fldl   0xdb78
    8def:	dd 5c 24 08          	fstpl  0x8(%esp)
    8df3:	dd 1c 24             	fstpl  (%esp)
    8df6:	e8 38 be ff ff       	call   4c33 <pow>
    8dfb:	dc 4d c0             	fmull  -0x40(%ebp)
    8dfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8e01:	dd 1c c3             	fstpl  (%ebx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    8e04:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    8e08:	74 37                	je     8e41 <III_dequantize_sample+0x6d6>
    8e0a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8e0d:	89 d0                	mov    %edx,%eax
    8e0f:	c1 e0 03             	shl    $0x3,%eax
    8e12:	01 d0                	add    %edx,%eax
    8e14:	c1 e0 04             	shl    $0x4,%eax
    8e17:	89 c2                	mov    %eax,%edx
    8e19:	8b 45 0c             	mov    0xc(%ebp),%eax
    8e1c:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8e1f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8e22:	89 d0                	mov    %edx,%eax
    8e24:	c1 e0 03             	shl    $0x3,%eax
    8e27:	01 d0                	add    %edx,%eax
    8e29:	c1 e0 04             	shl    $0x4,%eax
    8e2c:	89 c2                	mov    %eax,%edx
    8e2e:	8b 45 0c             	mov    0xc(%ebp),%eax
    8e31:	01 c2                	add    %eax,%edx
    8e33:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8e36:	dd 04 c2             	fldl   (%edx,%eax,8)
    8e39:	d9 e0                	fchs   
    8e3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8e3e:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    8e41:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8e45:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    8e49:	0f 8e d3 f9 ff ff    	jle    8822 <III_dequantize_sample+0xb7>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    8e4f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8e53:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    8e57:	0f 8e b9 f9 ff ff    	jle    8816 <III_dequantize_sample+0xab>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    8e5d:	83 c4 50             	add    $0x50,%esp
    8e60:	5b                   	pop    %ebx
    8e61:	5e                   	pop    %esi
    8e62:	5d                   	pop    %ebp
    8e63:	c3                   	ret    

00008e64 <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    8e64:	55                   	push   %ebp
    8e65:	89 e5                	mov    %esp,%ebp
    8e67:	57                   	push   %edi
    8e68:	56                   	push   %esi
    8e69:	53                   	push   %ebx
    8e6a:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    8e6d:	8b 45 14             	mov    0x14(%ebp),%eax
    8e70:	8b 00                	mov    (%eax),%eax
    8e72:	8b 40 10             	mov    0x10(%eax),%eax
    8e75:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    8e78:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    8e7f:	eb 33                	jmp    8eb4 <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    8e81:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    8e88:	eb 20                	jmp    8eaa <III_reorder+0x46>
         ro[sb][ss] = 0;
    8e8a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8e8d:	89 d0                	mov    %edx,%eax
    8e8f:	c1 e0 03             	shl    $0x3,%eax
    8e92:	01 d0                	add    %edx,%eax
    8e94:	c1 e0 04             	shl    $0x4,%eax
    8e97:	89 c2                	mov    %eax,%edx
    8e99:	8b 45 0c             	mov    0xc(%ebp),%eax
    8e9c:	01 c2                	add    %eax,%edx
    8e9e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8ea1:	d9 ee                	fldz   
    8ea3:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    8ea6:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8eaa:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    8eae:	7e da                	jle    8e8a <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    8eb0:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8eb4:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    8eb8:	7e c7                	jle    8e81 <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    8eba:	8b 45 10             	mov    0x10(%ebp),%eax
    8ebd:	8b 40 10             	mov    0x10(%eax),%eax
    8ec0:	85 c0                	test   %eax,%eax
    8ec2:	0f 84 af 03 00 00    	je     9277 <III_reorder+0x413>
    8ec8:	8b 45 10             	mov    0x10(%ebp),%eax
    8ecb:	8b 40 14             	mov    0x14(%eax),%eax
    8ece:	83 f8 02             	cmp    $0x2,%eax
    8ed1:	0f 85 a0 03 00 00    	jne    9277 <III_reorder+0x413>
      if (gr_info->mixed_block_flag) {
    8ed7:	8b 45 10             	mov    0x10(%ebp),%eax
    8eda:	8b 40 18             	mov    0x18(%eax),%eax
    8edd:	85 c0                	test   %eax,%eax
    8edf:	0f 84 00 02 00 00    	je     90e5 <III_reorder+0x281>
         for (sb=0 ; sb < 2 ; sb++)
    8ee5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    8eec:	eb 4c                	jmp    8f3a <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    8eee:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    8ef5:	eb 39                	jmp    8f30 <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    8ef7:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8efa:	89 d0                	mov    %edx,%eax
    8efc:	c1 e0 03             	shl    $0x3,%eax
    8eff:	01 d0                	add    %edx,%eax
    8f01:	c1 e0 04             	shl    $0x4,%eax
    8f04:	89 c2                	mov    %eax,%edx
    8f06:	8b 45 0c             	mov    0xc(%ebp),%eax
    8f09:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8f0c:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8f0f:	89 d0                	mov    %edx,%eax
    8f11:	c1 e0 03             	shl    $0x3,%eax
    8f14:	01 d0                	add    %edx,%eax
    8f16:	c1 e0 04             	shl    $0x4,%eax
    8f19:	89 c2                	mov    %eax,%edx
    8f1b:	8b 45 08             	mov    0x8(%ebp),%eax
    8f1e:	01 c2                	add    %eax,%edx
    8f20:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8f23:	dd 04 c2             	fldl   (%edx,%eax,8)
    8f26:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8f29:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    8f2c:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8f30:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    8f34:	7e c1                	jle    8ef7 <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    8f36:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8f3a:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    8f3e:	7e ae                	jle    8eee <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    8f40:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    8f47:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8f4a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8f50:	05 7c f5 00 00       	add    $0xf57c,%eax
    8f55:	8b 40 0c             	mov    0xc(%eax),%eax
    8f58:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    8f5b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8f5e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8f64:	05 80 f5 00 00       	add    $0xf580,%eax
    8f69:	8b 40 0c             	mov    0xc(%eax),%eax
    8f6c:	2b 45 e8             	sub    -0x18(%ebp),%eax
    8f6f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    8f72:	e9 5f 01 00 00       	jmp    90d6 <III_reorder+0x272>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8f77:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    8f7e:	e9 fd 00 00 00       	jmp    9080 <III_reorder+0x21c>
                  for(freq=0;freq<sfb_lines;freq++) {
    8f83:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    8f8a:	e9 e1 00 00 00       	jmp    9070 <III_reorder+0x20c>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    8f8f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8f92:	89 d0                	mov    %edx,%eax
    8f94:	01 c0                	add    %eax,%eax
    8f96:	01 c2                	add    %eax,%edx
    8f98:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8f9b:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    8f9f:	01 c2                	add    %eax,%edx
    8fa1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8fa4:	01 d0                	add    %edx,%eax
    8fa6:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    8fa9:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8fac:	89 d0                	mov    %edx,%eax
    8fae:	01 c0                	add    %eax,%eax
    8fb0:	01 c2                	add    %eax,%edx
    8fb2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8fb5:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8fb8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    8fbb:	89 d0                	mov    %edx,%eax
    8fbd:	01 c0                	add    %eax,%eax
    8fbf:	01 d0                	add    %edx,%eax
    8fc1:	01 c8                	add    %ecx,%eax
    8fc3:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8fc6:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    8fc9:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8fce:	89 c8                	mov    %ecx,%eax
    8fd0:	f7 ea                	imul   %edx
    8fd2:	c1 fa 02             	sar    $0x2,%edx
    8fd5:	89 c8                	mov    %ecx,%eax
    8fd7:	c1 f8 1f             	sar    $0x1f,%eax
    8fda:	29 c2                	sub    %eax,%edx
    8fdc:	89 d0                	mov    %edx,%eax
    8fde:	89 c2                	mov    %eax,%edx
    8fe0:	89 d0                	mov    %edx,%eax
    8fe2:	c1 e0 03             	shl    $0x3,%eax
    8fe5:	01 d0                	add    %edx,%eax
    8fe7:	c1 e0 04             	shl    $0x4,%eax
    8fea:	89 c2                	mov    %eax,%edx
    8fec:	8b 45 0c             	mov    0xc(%ebp),%eax
    8fef:	8d 34 02             	lea    (%edx,%eax,1),%esi
    8ff2:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    8ff5:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8ffa:	89 d8                	mov    %ebx,%eax
    8ffc:	f7 ea                	imul   %edx
    8ffe:	c1 fa 02             	sar    $0x2,%edx
    9001:	89 d8                	mov    %ebx,%eax
    9003:	c1 f8 1f             	sar    $0x1f,%eax
    9006:	89 d1                	mov    %edx,%ecx
    9008:	29 c1                	sub    %eax,%ecx
    900a:	89 c8                	mov    %ecx,%eax
    900c:	c1 e0 03             	shl    $0x3,%eax
    900f:	01 c8                	add    %ecx,%eax
    9011:	01 c0                	add    %eax,%eax
    9013:	29 c3                	sub    %eax,%ebx
    9015:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    9017:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    901a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    901f:	89 d8                	mov    %ebx,%eax
    9021:	f7 ea                	imul   %edx
    9023:	c1 fa 02             	sar    $0x2,%edx
    9026:	89 d8                	mov    %ebx,%eax
    9028:	c1 f8 1f             	sar    $0x1f,%eax
    902b:	29 c2                	sub    %eax,%edx
    902d:	89 d0                	mov    %edx,%eax
    902f:	89 c2                	mov    %eax,%edx
    9031:	89 d0                	mov    %edx,%eax
    9033:	c1 e0 03             	shl    $0x3,%eax
    9036:	01 d0                	add    %edx,%eax
    9038:	c1 e0 04             	shl    $0x4,%eax
    903b:	89 c2                	mov    %eax,%edx
    903d:	8b 45 08             	mov    0x8(%ebp),%eax
    9040:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    9043:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    9046:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    904b:	89 d8                	mov    %ebx,%eax
    904d:	f7 ea                	imul   %edx
    904f:	c1 fa 02             	sar    $0x2,%edx
    9052:	89 d8                	mov    %ebx,%eax
    9054:	c1 f8 1f             	sar    $0x1f,%eax
    9057:	29 c2                	sub    %eax,%edx
    9059:	89 d0                	mov    %edx,%eax
    905b:	c1 e0 03             	shl    $0x3,%eax
    905e:	01 d0                	add    %edx,%eax
    9060:	01 c0                	add    %eax,%eax
    9062:	29 c3                	sub    %eax,%ebx
    9064:	89 da                	mov    %ebx,%edx
    9066:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    9069:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    906c:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    9070:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9073:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    9076:	0f 8c 13 ff ff ff    	jl     8f8f <III_reorder+0x12b>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    907c:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    9080:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    9084:	0f 8e f9 fe ff ff    	jle    8f83 <III_reorder+0x11f>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    908a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    908e:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9091:	89 d0                	mov    %edx,%eax
    9093:	c1 e0 03             	shl    $0x3,%eax
    9096:	01 d0                	add    %edx,%eax
    9098:	c1 e0 02             	shl    $0x2,%eax
    909b:	01 d0                	add    %edx,%eax
    909d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    90a0:	01 d0                	add    %edx,%eax
    90a2:	83 c0 14             	add    $0x14,%eax
    90a5:	8b 04 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%eax
    90ac:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    90af:	8b 45 ec             	mov    -0x14(%ebp),%eax
    90b2:	8d 48 01             	lea    0x1(%eax),%ecx
    90b5:	8b 55 d0             	mov    -0x30(%ebp),%edx
    90b8:	89 d0                	mov    %edx,%eax
    90ba:	c1 e0 03             	shl    $0x3,%eax
    90bd:	01 d0                	add    %edx,%eax
    90bf:	c1 e0 02             	shl    $0x2,%eax
    90c2:	01 d0                	add    %edx,%eax
    90c4:	01 c8                	add    %ecx,%eax
    90c6:	83 c0 14             	add    $0x14,%eax
    90c9:	8b 04 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%eax
    90d0:	2b 45 e8             	sub    -0x18(%ebp),%eax
    90d3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    90d6:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    90da:	0f 8e 97 fe ff ff    	jle    8f77 <III_reorder+0x113>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    90e0:	e9 ed 01 00 00       	jmp    92d2 <III_reorder+0x46e>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    90e5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    90ec:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    90f3:	8b 45 d0             	mov    -0x30(%ebp),%eax
    90f6:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    90fc:	05 74 f5 00 00       	add    $0xf574,%eax
    9101:	8b 40 0c             	mov    0xc(%eax),%eax
    9104:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    9107:	e9 5f 01 00 00       	jmp    926b <III_reorder+0x407>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    910c:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    9113:	e9 fd 00 00 00       	jmp    9215 <III_reorder+0x3b1>
                  for(freq=0;freq<sfb_lines;freq++) {
    9118:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    911f:	e9 e1 00 00 00       	jmp    9205 <III_reorder+0x3a1>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    9124:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9127:	89 d0                	mov    %edx,%eax
    9129:	01 c0                	add    %eax,%eax
    912b:	01 c2                	add    %eax,%edx
    912d:	8b 45 d8             	mov    -0x28(%ebp),%eax
    9130:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    9134:	01 c2                	add    %eax,%edx
    9136:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9139:	01 d0                	add    %edx,%eax
    913b:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    913e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9141:	89 d0                	mov    %edx,%eax
    9143:	01 c0                	add    %eax,%eax
    9145:	01 c2                	add    %eax,%edx
    9147:	8b 45 d8             	mov    -0x28(%ebp),%eax
    914a:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    914d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    9150:	89 d0                	mov    %edx,%eax
    9152:	01 c0                	add    %eax,%eax
    9154:	01 d0                	add    %edx,%eax
    9156:	01 c8                	add    %ecx,%eax
    9158:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    915b:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    915e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9163:	89 c8                	mov    %ecx,%eax
    9165:	f7 ea                	imul   %edx
    9167:	c1 fa 02             	sar    $0x2,%edx
    916a:	89 c8                	mov    %ecx,%eax
    916c:	c1 f8 1f             	sar    $0x1f,%eax
    916f:	29 c2                	sub    %eax,%edx
    9171:	89 d0                	mov    %edx,%eax
    9173:	89 c2                	mov    %eax,%edx
    9175:	89 d0                	mov    %edx,%eax
    9177:	c1 e0 03             	shl    $0x3,%eax
    917a:	01 d0                	add    %edx,%eax
    917c:	c1 e0 04             	shl    $0x4,%eax
    917f:	89 c2                	mov    %eax,%edx
    9181:	8b 45 0c             	mov    0xc(%ebp),%eax
    9184:	8d 34 02             	lea    (%edx,%eax,1),%esi
    9187:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    918a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    918f:	89 d8                	mov    %ebx,%eax
    9191:	f7 ea                	imul   %edx
    9193:	c1 fa 02             	sar    $0x2,%edx
    9196:	89 d8                	mov    %ebx,%eax
    9198:	c1 f8 1f             	sar    $0x1f,%eax
    919b:	89 d1                	mov    %edx,%ecx
    919d:	29 c1                	sub    %eax,%ecx
    919f:	89 c8                	mov    %ecx,%eax
    91a1:	c1 e0 03             	shl    $0x3,%eax
    91a4:	01 c8                	add    %ecx,%eax
    91a6:	01 c0                	add    %eax,%eax
    91a8:	29 c3                	sub    %eax,%ebx
    91aa:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    91ac:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    91af:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    91b4:	89 d8                	mov    %ebx,%eax
    91b6:	f7 ea                	imul   %edx
    91b8:	c1 fa 02             	sar    $0x2,%edx
    91bb:	89 d8                	mov    %ebx,%eax
    91bd:	c1 f8 1f             	sar    $0x1f,%eax
    91c0:	29 c2                	sub    %eax,%edx
    91c2:	89 d0                	mov    %edx,%eax
    91c4:	89 c2                	mov    %eax,%edx
    91c6:	89 d0                	mov    %edx,%eax
    91c8:	c1 e0 03             	shl    $0x3,%eax
    91cb:	01 d0                	add    %edx,%eax
    91cd:	c1 e0 04             	shl    $0x4,%eax
    91d0:	89 c2                	mov    %eax,%edx
    91d2:	8b 45 08             	mov    0x8(%ebp),%eax
    91d5:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    91d8:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    91db:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    91e0:	89 d8                	mov    %ebx,%eax
    91e2:	f7 ea                	imul   %edx
    91e4:	c1 fa 02             	sar    $0x2,%edx
    91e7:	89 d8                	mov    %ebx,%eax
    91e9:	c1 f8 1f             	sar    $0x1f,%eax
    91ec:	29 c2                	sub    %eax,%edx
    91ee:	89 d0                	mov    %edx,%eax
    91f0:	c1 e0 03             	shl    $0x3,%eax
    91f3:	01 d0                	add    %edx,%eax
    91f5:	01 c0                	add    %eax,%eax
    91f7:	29 c3                	sub    %eax,%ebx
    91f9:	89 da                	mov    %ebx,%edx
    91fb:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    91fe:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    9201:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    9205:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9208:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    920b:	0f 8c 13 ff ff ff    	jl     9124 <III_reorder+0x2c0>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    9211:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    9215:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    9219:	0f 8e f9 fe ff ff    	jle    9118 <III_reorder+0x2b4>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    921f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9223:	8b 55 d0             	mov    -0x30(%ebp),%edx
    9226:	89 d0                	mov    %edx,%eax
    9228:	c1 e0 03             	shl    $0x3,%eax
    922b:	01 d0                	add    %edx,%eax
    922d:	c1 e0 02             	shl    $0x2,%eax
    9230:	01 d0                	add    %edx,%eax
    9232:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9235:	01 d0                	add    %edx,%eax
    9237:	83 c0 14             	add    $0x14,%eax
    923a:	8b 04 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%eax
    9241:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    9244:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9247:	8d 48 01             	lea    0x1(%eax),%ecx
    924a:	8b 55 d0             	mov    -0x30(%ebp),%edx
    924d:	89 d0                	mov    %edx,%eax
    924f:	c1 e0 03             	shl    $0x3,%eax
    9252:	01 d0                	add    %edx,%eax
    9254:	c1 e0 02             	shl    $0x2,%eax
    9257:	01 d0                	add    %edx,%eax
    9259:	01 c8                	add    %ecx,%eax
    925b:	83 c0 14             	add    $0x14,%eax
    925e:	8b 04 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%eax
    9265:	2b 45 e8             	sub    -0x18(%ebp),%eax
    9268:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    926b:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    926f:	0f 8e 97 fe ff ff    	jle    910c <III_reorder+0x2a8>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    9275:	eb 5b                	jmp    92d2 <III_reorder+0x46e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    9277:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    927e:	eb 4c                	jmp    92cc <III_reorder+0x468>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    9280:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    9287:	eb 39                	jmp    92c2 <III_reorder+0x45e>
            ro[sb][ss] = xr[sb][ss];
    9289:	8b 55 e0             	mov    -0x20(%ebp),%edx
    928c:	89 d0                	mov    %edx,%eax
    928e:	c1 e0 03             	shl    $0x3,%eax
    9291:	01 d0                	add    %edx,%eax
    9293:	c1 e0 04             	shl    $0x4,%eax
    9296:	89 c2                	mov    %eax,%edx
    9298:	8b 45 0c             	mov    0xc(%ebp),%eax
    929b:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    929e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    92a1:	89 d0                	mov    %edx,%eax
    92a3:	c1 e0 03             	shl    $0x3,%eax
    92a6:	01 d0                	add    %edx,%eax
    92a8:	c1 e0 04             	shl    $0x4,%eax
    92ab:	89 c2                	mov    %eax,%edx
    92ad:	8b 45 08             	mov    0x8(%ebp),%eax
    92b0:	01 c2                	add    %eax,%edx
    92b2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    92b5:	dd 04 c2             	fldl   (%edx,%eax,8)
    92b8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    92bb:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    92be:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    92c2:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    92c6:	7e c1                	jle    9289 <III_reorder+0x425>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    92c8:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    92cc:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    92d0:	7e ae                	jle    9280 <III_reorder+0x41c>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    92d2:	83 c4 34             	add    $0x34,%esp
    92d5:	5b                   	pop    %ebx
    92d6:	5e                   	pop    %esi
    92d7:	5f                   	pop    %edi
    92d8:	5d                   	pop    %ebp
    92d9:	c3                   	ret    

000092da <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    92da:	55                   	push   %ebp
    92db:	89 e5                	mov    %esp,%ebp
    92dd:	56                   	push   %esi
    92de:	53                   	push   %ebx
    92df:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    92e5:	8b 45 18             	mov    0x18(%ebp),%eax
    92e8:	8b 00                	mov    (%eax),%eax
    92ea:	8b 40 10             	mov    0x10(%eax),%eax
    92ed:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    92f0:	8b 45 18             	mov    0x18(%ebp),%eax
    92f3:	8b 40 08             	mov    0x8(%eax),%eax
    92f6:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    92f9:	8b 45 18             	mov    0x18(%ebp),%eax
    92fc:	8b 00                	mov    (%eax),%eax
    92fe:	8b 40 1c             	mov    0x1c(%eax),%eax
    9301:	83 f8 01             	cmp    $0x1,%eax
    9304:	75 16                	jne    931c <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    9306:	8b 45 18             	mov    0x18(%ebp),%eax
    9309:	8b 00                	mov    (%eax),%eax
    930b:	8b 40 20             	mov    0x20(%eax),%eax
    930e:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9311:	85 c0                	test   %eax,%eax
    9313:	74 07                	je     931c <III_stereo+0x42>
    9315:	b8 01 00 00 00       	mov    $0x1,%eax
    931a:	eb 05                	jmp    9321 <III_stereo+0x47>
    931c:	b8 00 00 00 00       	mov    $0x0,%eax
    9321:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    9324:	8b 45 18             	mov    0x18(%ebp),%eax
    9327:	8b 00                	mov    (%eax),%eax
    9329:	8b 40 1c             	mov    0x1c(%eax),%eax
    932c:	83 f8 01             	cmp    $0x1,%eax
    932f:	75 16                	jne    9347 <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    9331:	8b 45 18             	mov    0x18(%ebp),%eax
    9334:	8b 00                	mov    (%eax),%eax
    9336:	8b 40 20             	mov    0x20(%eax),%eax
    9339:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    933c:	85 c0                	test   %eax,%eax
    933e:	74 07                	je     9347 <III_stereo+0x6d>
    9340:	b8 01 00 00 00       	mov    $0x1,%eax
    9345:	eb 05                	jmp    934c <III_stereo+0x72>
    9347:	b8 00 00 00 00       	mov    $0x0,%eax
    934c:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    934f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9356:	eb 12                	jmp    936a <III_stereo+0x90>
      is_pos[i] = 7;
    9358:	8b 45 f0             	mov    -0x10(%ebp),%eax
    935b:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    9362:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    9366:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    936a:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    9371:	7e e5                	jle    9358 <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    9373:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    9377:	0f 85 18 0a 00 00    	jne    9d95 <III_stereo+0xabb>
    937d:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    9381:	0f 84 0e 0a 00 00    	je     9d95 <III_stereo+0xabb>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    9387:	8b 45 14             	mov    0x14(%ebp),%eax
    938a:	8b 40 10             	mov    0x10(%eax),%eax
    938d:	85 c0                	test   %eax,%eax
    938f:	0f 84 10 08 00 00    	je     9ba5 <III_stereo+0x8cb>
    9395:	8b 45 14             	mov    0x14(%ebp),%eax
    9398:	8b 40 14             	mov    0x14(%eax),%eax
    939b:	83 f8 02             	cmp    $0x2,%eax
    939e:	0f 85 01 08 00 00    	jne    9ba5 <III_stereo+0x8cb>
      {  if( gr_info->mixed_block_flag )
    93a4:	8b 45 14             	mov    0x14(%ebp),%eax
    93a7:	8b 40 18             	mov    0x18(%eax),%eax
    93aa:	85 c0                	test   %eax,%eax
    93ac:	0f 84 d0 04 00 00    	je     9882 <III_stereo+0x5a8>
         {  int max_sfb = 0;
    93b2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    93b9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    93c0:	e9 1b 03 00 00       	jmp    96e0 <III_stereo+0x406>
            {  int sfbcnt;
               sfbcnt = 2;
    93c5:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    93cc:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    93d3:	e9 0f 01 00 00       	jmp    94e7 <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    93d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    93db:	8d 48 01             	lea    0x1(%eax),%ecx
    93de:	8b 55 c8             	mov    -0x38(%ebp),%edx
    93e1:	89 d0                	mov    %edx,%eax
    93e3:	c1 e0 03             	shl    $0x3,%eax
    93e6:	01 d0                	add    %edx,%eax
    93e8:	c1 e0 02             	shl    $0x2,%eax
    93eb:	01 d0                	add    %edx,%eax
    93ed:	01 c8                	add    %ecx,%eax
    93ef:	83 c0 14             	add    $0x14,%eax
    93f2:	8b 0c 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%ecx
    93f9:	8b 55 c8             	mov    -0x38(%ebp),%edx
    93fc:	89 d0                	mov    %edx,%eax
    93fe:	c1 e0 03             	shl    $0x3,%eax
    9401:	01 d0                	add    %edx,%eax
    9403:	c1 e0 02             	shl    $0x2,%eax
    9406:	01 d0                	add    %edx,%eax
    9408:	8b 55 f4             	mov    -0xc(%ebp),%edx
    940b:	01 d0                	add    %edx,%eax
    940d:	83 c0 14             	add    $0x14,%eax
    9410:	8b 04 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%eax
    9417:	29 c1                	sub    %eax,%ecx
    9419:	89 c8                	mov    %ecx,%eax
    941b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    941e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9421:	89 d0                	mov    %edx,%eax
    9423:	c1 e0 03             	shl    $0x3,%eax
    9426:	01 d0                	add    %edx,%eax
    9428:	c1 e0 02             	shl    $0x2,%eax
    942b:	01 d0                	add    %edx,%eax
    942d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9430:	01 d0                	add    %edx,%eax
    9432:	83 c0 14             	add    $0x14,%eax
    9435:	8b 14 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%edx
    943c:	89 d0                	mov    %edx,%eax
    943e:	01 c0                	add    %eax,%eax
    9440:	01 c2                	add    %eax,%edx
    9442:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9445:	83 c0 01             	add    $0x1,%eax
    9448:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    944c:	01 d0                	add    %edx,%eax
    944e:	83 e8 01             	sub    $0x1,%eax
    9451:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    9454:	e9 80 00 00 00       	jmp    94d9 <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    9459:	8b 45 08             	mov    0x8(%ebp),%eax
    945c:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    9462:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9465:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    946a:	89 c8                	mov    %ecx,%eax
    946c:	f7 ea                	imul   %edx
    946e:	c1 fa 02             	sar    $0x2,%edx
    9471:	89 c8                	mov    %ecx,%eax
    9473:	c1 f8 1f             	sar    $0x1f,%eax
    9476:	89 d3                	mov    %edx,%ebx
    9478:	29 c3                	sub    %eax,%ebx
    947a:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    947d:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9482:	89 c8                	mov    %ecx,%eax
    9484:	f7 ea                	imul   %edx
    9486:	c1 fa 02             	sar    $0x2,%edx
    9489:	89 c8                	mov    %ecx,%eax
    948b:	c1 f8 1f             	sar    $0x1f,%eax
    948e:	29 c2                	sub    %eax,%edx
    9490:	89 d0                	mov    %edx,%eax
    9492:	c1 e0 03             	shl    $0x3,%eax
    9495:	01 d0                	add    %edx,%eax
    9497:	01 c0                	add    %eax,%eax
    9499:	29 c1                	sub    %eax,%ecx
    949b:	89 ca                	mov    %ecx,%edx
    949d:	89 d8                	mov    %ebx,%eax
    949f:	c1 e0 03             	shl    $0x3,%eax
    94a2:	01 d8                	add    %ebx,%eax
    94a4:	01 c0                	add    %eax,%eax
    94a6:	01 d0                	add    %edx,%eax
    94a8:	dd 04 c6             	fldl   (%esi,%eax,8)
    94ab:	d9 ee                	fldz   
    94ad:	df e9                	fucomip %st(1),%st
    94af:	7a 0a                	jp     94bb <III_stereo+0x1e1>
    94b1:	d9 ee                	fldz   
    94b3:	df e9                	fucomip %st(1),%st
    94b5:	dd d8                	fstp   %st(0)
    94b7:	74 18                	je     94d1 <III_stereo+0x1f7>
    94b9:	eb 02                	jmp    94bd <III_stereo+0x1e3>
    94bb:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    94bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    94c0:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    94c3:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    94ca:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    94d1:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    94d5:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    94d9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    94dd:	0f 8f 76 ff ff ff    	jg     9459 <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    94e3:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    94e7:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    94eb:	0f 8f e7 fe ff ff    	jg     93d8 <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    94f1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    94f4:	83 c0 01             	add    $0x1,%eax
    94f7:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    94fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    94fd:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9500:	7e 0b                	jle    950d <III_stereo+0x233>
                  max_sfb = sfb;
    9502:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9505:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    9508:	e9 f5 00 00 00       	jmp    9602 <III_stereo+0x328>
    950d:	e9 f0 00 00 00       	jmp    9602 <III_stereo+0x328>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9512:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9515:	8d 48 01             	lea    0x1(%eax),%ecx
    9518:	8b 55 c8             	mov    -0x38(%ebp),%edx
    951b:	89 d0                	mov    %edx,%eax
    951d:	c1 e0 03             	shl    $0x3,%eax
    9520:	01 d0                	add    %edx,%eax
    9522:	c1 e0 02             	shl    $0x2,%eax
    9525:	01 d0                	add    %edx,%eax
    9527:	01 c8                	add    %ecx,%eax
    9529:	83 c0 14             	add    $0x14,%eax
    952c:	8b 0c 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%ecx
    9533:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9536:	89 d0                	mov    %edx,%eax
    9538:	c1 e0 03             	shl    $0x3,%eax
    953b:	01 d0                	add    %edx,%eax
    953d:	c1 e0 02             	shl    $0x2,%eax
    9540:	01 d0                	add    %edx,%eax
    9542:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9545:	01 d0                	add    %edx,%eax
    9547:	83 c0 14             	add    $0x14,%eax
    954a:	8b 04 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%eax
    9551:	29 c1                	sub    %eax,%ecx
    9553:	89 c8                	mov    %ecx,%eax
    9555:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    9558:	8b 55 c8             	mov    -0x38(%ebp),%edx
    955b:	89 d0                	mov    %edx,%eax
    955d:	c1 e0 03             	shl    $0x3,%eax
    9560:	01 d0                	add    %edx,%eax
    9562:	c1 e0 02             	shl    $0x2,%eax
    9565:	01 d0                	add    %edx,%eax
    9567:	8b 55 f4             	mov    -0xc(%ebp),%edx
    956a:	01 d0                	add    %edx,%eax
    956c:	83 c0 14             	add    $0x14,%eax
    956f:	8b 14 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%edx
    9576:	89 d0                	mov    %edx,%eax
    9578:	01 c0                	add    %eax,%eax
    957a:	01 c2                	add    %eax,%edx
    957c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    957f:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9583:	01 d0                	add    %edx,%eax
    9585:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    9588:	eb 6e                	jmp    95f8 <III_stereo+0x31e>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    958a:	8b 4d 10             	mov    0x10(%ebp),%ecx
    958d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9590:	89 d0                	mov    %edx,%eax
    9592:	01 c0                	add    %eax,%eax
    9594:	01 d0                	add    %edx,%eax
    9596:	c1 e0 02             	shl    $0x2,%eax
    9599:	01 d0                	add    %edx,%eax
    959b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    959e:	01 d0                	add    %edx,%eax
    95a0:	83 c0 52             	add    $0x52,%eax
    95a3:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    95a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    95aa:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    95b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    95b4:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    95bb:	83 f8 07             	cmp    $0x7,%eax
    95be:	74 30                	je     95f0 <III_stereo+0x316>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    95c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    95c3:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    95ca:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    95d0:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    95d6:	dd 05 80 db 00 00    	fldl   0xdb80
    95dc:	de c9                	fmulp  %st,%st(1)
    95de:	dd 1c 24             	fstpl  (%esp)
    95e1:	e8 1d b6 ff ff       	call   4c03 <tan>
    95e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    95e9:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    95f0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    95f4:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    95f8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    95fc:	7f 8c                	jg     958a <III_stereo+0x2b0>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    95fe:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    9602:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    9606:	0f 8e 06 ff ff ff    	jle    9512 <III_stereo+0x238>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    960c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    960f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9615:	05 9c f5 00 00       	add    $0xf59c,%eax
    961a:	8b 50 0c             	mov    0xc(%eax),%edx
    961d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9620:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9626:	05 98 f5 00 00       	add    $0xf598,%eax
    962b:	8b 40 0c             	mov    0xc(%eax),%eax
    962e:	29 c2                	sub    %eax,%edx
    9630:	89 d0                	mov    %edx,%eax
    9632:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    9635:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9638:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    963e:	05 98 f5 00 00       	add    $0xf598,%eax
    9643:	8b 50 0c             	mov    0xc(%eax),%edx
    9646:	89 d0                	mov    %edx,%eax
    9648:	01 c0                	add    %eax,%eax
    964a:	01 c2                	add    %eax,%edx
    964c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    964f:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9653:	01 d0                	add    %edx,%eax
    9655:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    9658:	8b 45 c8             	mov    -0x38(%ebp),%eax
    965b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9661:	05 a0 f5 00 00       	add    $0xf5a0,%eax
    9666:	8b 50 0c             	mov    0xc(%eax),%edx
    9669:	8b 45 c8             	mov    -0x38(%ebp),%eax
    966c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9672:	05 9c f5 00 00       	add    $0xf59c,%eax
    9677:	8b 40 0c             	mov    0xc(%eax),%eax
    967a:	29 c2                	sub    %eax,%edx
    967c:	89 d0                	mov    %edx,%eax
    967e:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    9681:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9684:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    968a:	05 9c f5 00 00       	add    $0xf59c,%eax
    968f:	8b 50 0c             	mov    0xc(%eax),%edx
    9692:	89 d0                	mov    %edx,%eax
    9694:	01 c0                	add    %eax,%eax
    9696:	01 c2                	add    %eax,%edx
    9698:	8b 45 ec             	mov    -0x14(%ebp),%eax
    969b:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    969f:	01 d0                	add    %edx,%eax
    96a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    96a4:	eb 30                	jmp    96d6 <III_stereo+0x3fc>
               {  is_pos[i] = is_pos[sfb];
    96a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    96a9:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    96b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    96b3:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    96ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    96bd:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    96c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    96c7:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    96ce:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    96d2:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    96d6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    96da:	7f ca                	jg     96a6 <III_stereo+0x3cc>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    96dc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    96e0:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    96e4:	0f 8e db fc ff ff    	jle    93c5 <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    96ea:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    96ee:	0f 8f 89 01 00 00    	jg     987d <III_stereo+0x5a3>
             {  i = 2;
    96f4:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    96fb:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    9702:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    9709:	eb 63                	jmp    976e <III_stereo+0x494>
                {  if ( xr[1][i][ss] != 0.0 )
    970b:	8b 45 08             	mov    0x8(%ebp),%eax
    970e:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9714:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9717:	89 d0                	mov    %edx,%eax
    9719:	c1 e0 03             	shl    $0x3,%eax
    971c:	01 d0                	add    %edx,%eax
    971e:	01 c0                	add    %eax,%eax
    9720:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9723:	01 d0                	add    %edx,%eax
    9725:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9728:	d9 ee                	fldz   
    972a:	df e9                	fucomip %st(1),%st
    972c:	7a 0a                	jp     9738 <III_stereo+0x45e>
    972e:	d9 ee                	fldz   
    9730:	df e9                	fucomip %st(1),%st
    9732:	dd d8                	fstp   %st(0)
    9734:	74 23                	je     9759 <III_stereo+0x47f>
    9736:	eb 02                	jmp    973a <III_stereo+0x460>
    9738:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    973a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    973d:	89 d0                	mov    %edx,%eax
    973f:	c1 e0 03             	shl    $0x3,%eax
    9742:	01 d0                	add    %edx,%eax
    9744:	01 c0                	add    %eax,%eax
    9746:	89 c2                	mov    %eax,%edx
    9748:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    974b:	01 d0                	add    %edx,%eax
    974d:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    9750:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    9757:	eb 15                	jmp    976e <III_stereo+0x494>
                   } else
                   {  ss--;
    9759:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    975d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    9761:	79 0b                	jns    976e <III_stereo+0x494>
                      {  i--;
    9763:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    9767:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    976e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    9772:	79 97                	jns    970b <III_stereo+0x431>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    9774:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    977b:	eb 04                	jmp    9781 <III_stereo+0x4a7>
                   i++;
    977d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    9781:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9784:	89 d0                	mov    %edx,%eax
    9786:	c1 e0 03             	shl    $0x3,%eax
    9789:	01 d0                	add    %edx,%eax
    978b:	c1 e0 02             	shl    $0x2,%eax
    978e:	01 d0                	add    %edx,%eax
    9790:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9793:	01 d0                	add    %edx,%eax
    9795:	8b 04 85 20 f5 00 00 	mov    0xf520(,%eax,4),%eax
    979c:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    979f:	7e dc                	jle    977d <III_stereo+0x4a3>
                   i++;
                sfb = i;
    97a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    97a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    97a7:	8b 55 c8             	mov    -0x38(%ebp),%edx
    97aa:	89 d0                	mov    %edx,%eax
    97ac:	c1 e0 03             	shl    $0x3,%eax
    97af:	01 d0                	add    %edx,%eax
    97b1:	c1 e0 02             	shl    $0x2,%eax
    97b4:	01 d0                	add    %edx,%eax
    97b6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    97b9:	01 d0                	add    %edx,%eax
    97bb:	8b 04 85 20 f5 00 00 	mov    0xf520(,%eax,4),%eax
    97c2:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    97c5:	e9 a9 00 00 00       	jmp    9873 <III_stereo+0x599>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    97ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    97cd:	8d 48 01             	lea    0x1(%eax),%ecx
    97d0:	8b 55 c8             	mov    -0x38(%ebp),%edx
    97d3:	89 d0                	mov    %edx,%eax
    97d5:	c1 e0 03             	shl    $0x3,%eax
    97d8:	01 d0                	add    %edx,%eax
    97da:	c1 e0 02             	shl    $0x2,%eax
    97dd:	01 d0                	add    %edx,%eax
    97df:	01 c8                	add    %ecx,%eax
    97e1:	8b 0c 85 20 f5 00 00 	mov    0xf520(,%eax,4),%ecx
    97e8:	8b 55 c8             	mov    -0x38(%ebp),%edx
    97eb:	89 d0                	mov    %edx,%eax
    97ed:	c1 e0 03             	shl    $0x3,%eax
    97f0:	01 d0                	add    %edx,%eax
    97f2:	c1 e0 02             	shl    $0x2,%eax
    97f5:	01 d0                	add    %edx,%eax
    97f7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    97fa:	01 d0                	add    %edx,%eax
    97fc:	8b 04 85 20 f5 00 00 	mov    0xf520(,%eax,4),%eax
    9803:	29 c1                	sub    %eax,%ecx
    9805:	89 c8                	mov    %ecx,%eax
    9807:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    980a:	eb 5d                	jmp    9869 <III_stereo+0x58f>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    980c:	8b 45 10             	mov    0x10(%ebp),%eax
    980f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9812:	83 c2 3e             	add    $0x3e,%edx
    9815:	8b 14 90             	mov    (%eax,%edx,4),%edx
    9818:	8b 45 f0             	mov    -0x10(%ebp),%eax
    981b:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    9822:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9825:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    982c:	83 f8 07             	cmp    $0x7,%eax
    982f:	74 30                	je     9861 <III_stereo+0x587>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    9831:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9834:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    983b:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    9841:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9847:	dd 05 80 db 00 00    	fldl   0xdb80
    984d:	de c9                	fmulp  %st,%st(1)
    984f:	dd 1c 24             	fstpl  (%esp)
    9852:	e8 ac b3 ff ff       	call   4c03 <tan>
    9857:	8b 45 f0             	mov    -0x10(%ebp),%eax
    985a:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    9861:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    9865:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9869:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    986d:	7f 9d                	jg     980c <III_stereo+0x532>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    986f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9873:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    9877:	0f 8e 4d ff ff ff    	jle    97ca <III_stereo+0x4f0>
    987d:	e9 1e 03 00 00       	jmp    9ba0 <III_stereo+0x8c6>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    9882:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9889:	e9 08 03 00 00       	jmp    9b96 <III_stereo+0x8bc>
            {  int sfbcnt;
               sfbcnt = -1;
    988e:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    9895:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    989c:	e9 0f 01 00 00       	jmp    99b0 <III_stereo+0x6d6>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    98a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    98a4:	8d 48 01             	lea    0x1(%eax),%ecx
    98a7:	8b 55 c8             	mov    -0x38(%ebp),%edx
    98aa:	89 d0                	mov    %edx,%eax
    98ac:	c1 e0 03             	shl    $0x3,%eax
    98af:	01 d0                	add    %edx,%eax
    98b1:	c1 e0 02             	shl    $0x2,%eax
    98b4:	01 d0                	add    %edx,%eax
    98b6:	01 c8                	add    %ecx,%eax
    98b8:	83 c0 14             	add    $0x14,%eax
    98bb:	8b 0c 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%ecx
    98c2:	8b 55 c8             	mov    -0x38(%ebp),%edx
    98c5:	89 d0                	mov    %edx,%eax
    98c7:	c1 e0 03             	shl    $0x3,%eax
    98ca:	01 d0                	add    %edx,%eax
    98cc:	c1 e0 02             	shl    $0x2,%eax
    98cf:	01 d0                	add    %edx,%eax
    98d1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    98d4:	01 d0                	add    %edx,%eax
    98d6:	83 c0 14             	add    $0x14,%eax
    98d9:	8b 04 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%eax
    98e0:	29 c1                	sub    %eax,%ecx
    98e2:	89 c8                	mov    %ecx,%eax
    98e4:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    98e7:	8b 55 c8             	mov    -0x38(%ebp),%edx
    98ea:	89 d0                	mov    %edx,%eax
    98ec:	c1 e0 03             	shl    $0x3,%eax
    98ef:	01 d0                	add    %edx,%eax
    98f1:	c1 e0 02             	shl    $0x2,%eax
    98f4:	01 d0                	add    %edx,%eax
    98f6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    98f9:	01 d0                	add    %edx,%eax
    98fb:	83 c0 14             	add    $0x14,%eax
    98fe:	8b 14 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%edx
    9905:	89 d0                	mov    %edx,%eax
    9907:	01 c0                	add    %eax,%eax
    9909:	01 c2                	add    %eax,%edx
    990b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    990e:	83 c0 01             	add    $0x1,%eax
    9911:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    9915:	01 d0                	add    %edx,%eax
    9917:	83 e8 01             	sub    $0x1,%eax
    991a:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    991d:	e9 80 00 00 00       	jmp    99a2 <III_stereo+0x6c8>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    9922:	8b 45 08             	mov    0x8(%ebp),%eax
    9925:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    992b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    992e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9933:	89 c8                	mov    %ecx,%eax
    9935:	f7 ea                	imul   %edx
    9937:	c1 fa 02             	sar    $0x2,%edx
    993a:	89 c8                	mov    %ecx,%eax
    993c:	c1 f8 1f             	sar    $0x1f,%eax
    993f:	89 d3                	mov    %edx,%ebx
    9941:	29 c3                	sub    %eax,%ebx
    9943:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9946:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    994b:	89 c8                	mov    %ecx,%eax
    994d:	f7 ea                	imul   %edx
    994f:	c1 fa 02             	sar    $0x2,%edx
    9952:	89 c8                	mov    %ecx,%eax
    9954:	c1 f8 1f             	sar    $0x1f,%eax
    9957:	29 c2                	sub    %eax,%edx
    9959:	89 d0                	mov    %edx,%eax
    995b:	c1 e0 03             	shl    $0x3,%eax
    995e:	01 d0                	add    %edx,%eax
    9960:	01 c0                	add    %eax,%eax
    9962:	29 c1                	sub    %eax,%ecx
    9964:	89 ca                	mov    %ecx,%edx
    9966:	89 d8                	mov    %ebx,%eax
    9968:	c1 e0 03             	shl    $0x3,%eax
    996b:	01 d8                	add    %ebx,%eax
    996d:	01 c0                	add    %eax,%eax
    996f:	01 d0                	add    %edx,%eax
    9971:	dd 04 c6             	fldl   (%esi,%eax,8)
    9974:	d9 ee                	fldz   
    9976:	df e9                	fucomip %st(1),%st
    9978:	7a 0a                	jp     9984 <III_stereo+0x6aa>
    997a:	d9 ee                	fldz   
    997c:	df e9                	fucomip %st(1),%st
    997e:	dd d8                	fstp   %st(0)
    9980:	74 18                	je     999a <III_stereo+0x6c0>
    9982:	eb 02                	jmp    9986 <III_stereo+0x6ac>
    9984:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    9986:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9989:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    998c:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    9993:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    999a:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    999e:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    99a2:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    99a6:	0f 8f 76 ff ff ff    	jg     9922 <III_stereo+0x648>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    99ac:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    99b0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    99b4:	0f 89 e7 fe ff ff    	jns    98a1 <III_stereo+0x5c7>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    99ba:	8b 45 d0             	mov    -0x30(%ebp),%eax
    99bd:	83 c0 01             	add    $0x1,%eax
    99c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    99c3:	e9 f0 00 00 00       	jmp    9ab8 <III_stereo+0x7de>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    99c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    99cb:	8d 48 01             	lea    0x1(%eax),%ecx
    99ce:	8b 55 c8             	mov    -0x38(%ebp),%edx
    99d1:	89 d0                	mov    %edx,%eax
    99d3:	c1 e0 03             	shl    $0x3,%eax
    99d6:	01 d0                	add    %edx,%eax
    99d8:	c1 e0 02             	shl    $0x2,%eax
    99db:	01 d0                	add    %edx,%eax
    99dd:	01 c8                	add    %ecx,%eax
    99df:	83 c0 14             	add    $0x14,%eax
    99e2:	8b 0c 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%ecx
    99e9:	8b 55 c8             	mov    -0x38(%ebp),%edx
    99ec:	89 d0                	mov    %edx,%eax
    99ee:	c1 e0 03             	shl    $0x3,%eax
    99f1:	01 d0                	add    %edx,%eax
    99f3:	c1 e0 02             	shl    $0x2,%eax
    99f6:	01 d0                	add    %edx,%eax
    99f8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    99fb:	01 d0                	add    %edx,%eax
    99fd:	83 c0 14             	add    $0x14,%eax
    9a00:	8b 04 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%eax
    9a07:	29 c1                	sub    %eax,%ecx
    9a09:	89 c8                	mov    %ecx,%eax
    9a0b:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    9a0e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9a11:	89 d0                	mov    %edx,%eax
    9a13:	c1 e0 03             	shl    $0x3,%eax
    9a16:	01 d0                	add    %edx,%eax
    9a18:	c1 e0 02             	shl    $0x2,%eax
    9a1b:	01 d0                	add    %edx,%eax
    9a1d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9a20:	01 d0                	add    %edx,%eax
    9a22:	83 c0 14             	add    $0x14,%eax
    9a25:	8b 14 85 2c f5 00 00 	mov    0xf52c(,%eax,4),%edx
    9a2c:	89 d0                	mov    %edx,%eax
    9a2e:	01 c0                	add    %eax,%eax
    9a30:	01 c2                	add    %eax,%edx
    9a32:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9a35:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9a39:	01 d0                	add    %edx,%eax
    9a3b:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    9a3e:	eb 6e                	jmp    9aae <III_stereo+0x7d4>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    9a40:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9a43:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9a46:	89 d0                	mov    %edx,%eax
    9a48:	01 c0                	add    %eax,%eax
    9a4a:	01 d0                	add    %edx,%eax
    9a4c:	c1 e0 02             	shl    $0x2,%eax
    9a4f:	01 d0                	add    %edx,%eax
    9a51:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9a54:	01 d0                	add    %edx,%eax
    9a56:	83 c0 52             	add    $0x52,%eax
    9a59:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    9a5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9a60:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    9a67:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9a6a:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9a71:	83 f8 07             	cmp    $0x7,%eax
    9a74:	74 30                	je     9aa6 <III_stereo+0x7cc>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    9a76:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9a79:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9a80:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    9a86:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9a8c:	dd 05 80 db 00 00    	fldl   0xdb80
    9a92:	de c9                	fmulp  %st,%st(1)
    9a94:	dd 1c 24             	fstpl  (%esp)
    9a97:	e8 67 b1 ff ff       	call   4c03 <tan>
    9a9c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9a9f:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    9aa6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    9aaa:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9aae:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9ab2:	7f 8c                	jg     9a40 <III_stereo+0x766>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    9ab4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    9ab8:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    9abc:	0f 8e 06 ff ff ff    	jle    99c8 <III_stereo+0x6ee>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    9ac2:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9ac5:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9acb:	05 9c f5 00 00       	add    $0xf59c,%eax
    9ad0:	8b 50 0c             	mov    0xc(%eax),%edx
    9ad3:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9ad6:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9adc:	05 98 f5 00 00       	add    $0xf598,%eax
    9ae1:	8b 40 0c             	mov    0xc(%eax),%eax
    9ae4:	29 c2                	sub    %eax,%edx
    9ae6:	89 d0                	mov    %edx,%eax
    9ae8:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    9aeb:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9aee:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9af4:	05 98 f5 00 00       	add    $0xf598,%eax
    9af9:	8b 50 0c             	mov    0xc(%eax),%edx
    9afc:	89 d0                	mov    %edx,%eax
    9afe:	01 c0                	add    %eax,%eax
    9b00:	01 c2                	add    %eax,%edx
    9b02:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9b05:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9b09:	01 d0                	add    %edx,%eax
    9b0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    9b0e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9b11:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9b17:	05 a0 f5 00 00       	add    $0xf5a0,%eax
    9b1c:	8b 50 0c             	mov    0xc(%eax),%edx
    9b1f:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9b22:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9b28:	05 9c f5 00 00       	add    $0xf59c,%eax
    9b2d:	8b 40 0c             	mov    0xc(%eax),%eax
    9b30:	29 c2                	sub    %eax,%edx
    9b32:	89 d0                	mov    %edx,%eax
    9b34:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    9b37:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9b3a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9b40:	05 9c f5 00 00       	add    $0xf59c,%eax
    9b45:	8b 50 0c             	mov    0xc(%eax),%edx
    9b48:	89 d0                	mov    %edx,%eax
    9b4a:	01 c0                	add    %eax,%eax
    9b4c:	01 c2                	add    %eax,%edx
    9b4e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9b51:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9b55:	01 d0                	add    %edx,%eax
    9b57:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    9b5a:	eb 30                	jmp    9b8c <III_stereo+0x8b2>
               {  is_pos[i] = is_pos[sfb];
    9b5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9b5f:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    9b66:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9b69:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    9b70:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9b73:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9b7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9b7d:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    9b84:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    9b88:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9b8c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9b90:	7f ca                	jg     9b5c <III_stereo+0x882>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    9b92:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9b96:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    9b9a:	0f 8e ee fc ff ff    	jle    988e <III_stereo+0x5b4>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    9ba0:	e9 f0 01 00 00       	jmp    9d95 <III_stereo+0xabb>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    9ba5:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    9bac:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    9bb3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    9bba:	eb 63                	jmp    9c1f <III_stereo+0x945>
         {  if ( xr[1][i][ss] != 0.0 )
    9bbc:	8b 45 08             	mov    0x8(%ebp),%eax
    9bbf:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9bc5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9bc8:	89 d0                	mov    %edx,%eax
    9bca:	c1 e0 03             	shl    $0x3,%eax
    9bcd:	01 d0                	add    %edx,%eax
    9bcf:	01 c0                	add    %eax,%eax
    9bd1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9bd4:	01 d0                	add    %edx,%eax
    9bd6:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9bd9:	d9 ee                	fldz   
    9bdb:	df e9                	fucomip %st(1),%st
    9bdd:	7a 0a                	jp     9be9 <III_stereo+0x90f>
    9bdf:	d9 ee                	fldz   
    9be1:	df e9                	fucomip %st(1),%st
    9be3:	dd d8                	fstp   %st(0)
    9be5:	74 23                	je     9c0a <III_stereo+0x930>
    9be7:	eb 02                	jmp    9beb <III_stereo+0x911>
    9be9:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    9beb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9bee:	89 d0                	mov    %edx,%eax
    9bf0:	c1 e0 03             	shl    $0x3,%eax
    9bf3:	01 d0                	add    %edx,%eax
    9bf5:	01 c0                	add    %eax,%eax
    9bf7:	89 c2                	mov    %eax,%edx
    9bf9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9bfc:	01 d0                	add    %edx,%eax
    9bfe:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    9c01:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    9c08:	eb 15                	jmp    9c1f <III_stereo+0x945>
            } else
            {  ss--;
    9c0a:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    9c0e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    9c12:	79 0b                	jns    9c1f <III_stereo+0x945>
               {  i--;
    9c14:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    9c18:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    9c1f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    9c23:	79 97                	jns    9bbc <III_stereo+0x8e2>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    9c25:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    9c2c:	eb 04                	jmp    9c32 <III_stereo+0x958>
            i++;
    9c2e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    9c32:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9c35:	89 d0                	mov    %edx,%eax
    9c37:	c1 e0 03             	shl    $0x3,%eax
    9c3a:	01 d0                	add    %edx,%eax
    9c3c:	c1 e0 02             	shl    $0x2,%eax
    9c3f:	01 d0                	add    %edx,%eax
    9c41:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9c44:	01 d0                	add    %edx,%eax
    9c46:	8b 04 85 20 f5 00 00 	mov    0xf520(,%eax,4),%eax
    9c4d:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    9c50:	7e dc                	jle    9c2e <III_stereo+0x954>
            i++;
         sfb = i;
    9c52:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9c55:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    9c58:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9c5b:	89 d0                	mov    %edx,%eax
    9c5d:	c1 e0 03             	shl    $0x3,%eax
    9c60:	01 d0                	add    %edx,%eax
    9c62:	c1 e0 02             	shl    $0x2,%eax
    9c65:	01 d0                	add    %edx,%eax
    9c67:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9c6a:	01 d0                	add    %edx,%eax
    9c6c:	8b 04 85 20 f5 00 00 	mov    0xf520(,%eax,4),%eax
    9c73:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    9c76:	e9 a9 00 00 00       	jmp    9d24 <III_stereo+0xa4a>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    9c7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9c7e:	8d 48 01             	lea    0x1(%eax),%ecx
    9c81:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9c84:	89 d0                	mov    %edx,%eax
    9c86:	c1 e0 03             	shl    $0x3,%eax
    9c89:	01 d0                	add    %edx,%eax
    9c8b:	c1 e0 02             	shl    $0x2,%eax
    9c8e:	01 d0                	add    %edx,%eax
    9c90:	01 c8                	add    %ecx,%eax
    9c92:	8b 0c 85 20 f5 00 00 	mov    0xf520(,%eax,4),%ecx
    9c99:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9c9c:	89 d0                	mov    %edx,%eax
    9c9e:	c1 e0 03             	shl    $0x3,%eax
    9ca1:	01 d0                	add    %edx,%eax
    9ca3:	c1 e0 02             	shl    $0x2,%eax
    9ca6:	01 d0                	add    %edx,%eax
    9ca8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9cab:	01 d0                	add    %edx,%eax
    9cad:	8b 04 85 20 f5 00 00 	mov    0xf520(,%eax,4),%eax
    9cb4:	29 c1                	sub    %eax,%ecx
    9cb6:	89 c8                	mov    %ecx,%eax
    9cb8:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    9cbb:	eb 5d                	jmp    9d1a <III_stereo+0xa40>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    9cbd:	8b 45 10             	mov    0x10(%ebp),%eax
    9cc0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9cc3:	83 c2 3e             	add    $0x3e,%edx
    9cc6:	8b 14 90             	mov    (%eax,%edx,4),%edx
    9cc9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9ccc:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    9cd3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9cd6:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9cdd:	83 f8 07             	cmp    $0x7,%eax
    9ce0:	74 30                	je     9d12 <III_stereo+0xa38>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    9ce2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9ce5:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9cec:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    9cf2:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9cf8:	dd 05 80 db 00 00    	fldl   0xdb80
    9cfe:	de c9                	fmulp  %st,%st(1)
    9d00:	dd 1c 24             	fstpl  (%esp)
    9d03:	e8 fb ae ff ff       	call   4c03 <tan>
    9d08:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d0b:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    9d12:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    9d16:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9d1a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9d1e:	7f 9d                	jg     9cbd <III_stereo+0x9e3>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    9d20:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9d24:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    9d28:	0f 8e 4d ff ff ff    	jle    9c7b <III_stereo+0x9a1>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    9d2e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9d31:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9d37:	05 70 f5 00 00       	add    $0xf570,%eax
    9d3c:	8b 00                	mov    (%eax),%eax
    9d3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    9d41:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9d44:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9d4a:	05 74 f5 00 00       	add    $0xf574,%eax
    9d4f:	8b 00                	mov    (%eax),%eax
    9d51:	ba 40 02 00 00       	mov    $0x240,%edx
    9d56:	29 c2                	sub    %eax,%edx
    9d58:	89 d0                	mov    %edx,%eax
    9d5a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    9d5d:	eb 30                	jmp    9d8f <III_stereo+0xab5>
         {  is_pos[i] = is_pos[sfb];
    9d5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d62:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    9d69:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d6c:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    9d73:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d76:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9d7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d80:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    9d87:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    9d8b:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9d8f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9d93:	7f ca                	jg     9d5f <III_stereo+0xa85>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    9d95:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    9d9c:	eb 55                	jmp    9df3 <III_stereo+0xb19>
      for(sb=0;sb<SBLIMIT;sb++)
    9d9e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9da5:	eb 42                	jmp    9de9 <III_stereo+0xb0f>
         for(ss=0;ss<SSLIMIT;ss++)
    9da7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    9dae:	eb 2f                	jmp    9ddf <III_stereo+0xb05>
            lr[ch][sb][ss] = 0;
    9db0:	8b 55 e0             	mov    -0x20(%ebp),%edx
    9db3:	89 d0                	mov    %edx,%eax
    9db5:	c1 e0 03             	shl    $0x3,%eax
    9db8:	01 d0                	add    %edx,%eax
    9dba:	c1 e0 09             	shl    $0x9,%eax
    9dbd:	89 c2                	mov    %eax,%edx
    9dbf:	8b 45 0c             	mov    0xc(%ebp),%eax
    9dc2:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9dc5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9dc8:	89 d0                	mov    %edx,%eax
    9dca:	c1 e0 03             	shl    $0x3,%eax
    9dcd:	01 d0                	add    %edx,%eax
    9dcf:	01 c0                	add    %eax,%eax
    9dd1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9dd4:	01 d0                	add    %edx,%eax
    9dd6:	d9 ee                	fldz   
    9dd8:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    9ddb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9ddf:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    9de3:	7e cb                	jle    9db0 <III_stereo+0xad6>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    9de5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9de9:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    9ded:	7e b8                	jle    9da7 <III_stereo+0xacd>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    9def:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    9df3:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    9df7:	7e a5                	jle    9d9e <III_stereo+0xac4>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    9df9:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    9dfd:	0f 85 3d 02 00 00    	jne    a040 <III_stereo+0xd66>
      for(sb=0;sb<SBLIMIT;sb++)
    9e03:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9e0a:	e9 25 02 00 00       	jmp    a034 <III_stereo+0xd5a>
         for(ss=0;ss<SSLIMIT;ss++) {
    9e0f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    9e16:	e9 0b 02 00 00       	jmp    a026 <III_stereo+0xd4c>
            i = (sb*18)+ss;
    9e1b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9e1e:	89 d0                	mov    %edx,%eax
    9e20:	c1 e0 03             	shl    $0x3,%eax
    9e23:	01 d0                	add    %edx,%eax
    9e25:	01 c0                	add    %eax,%eax
    9e27:	89 c2                	mov    %eax,%edx
    9e29:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9e2c:	01 d0                	add    %edx,%eax
    9e2e:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    9e31:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e34:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9e3b:	83 f8 07             	cmp    $0x7,%eax
    9e3e:	0f 85 2c 01 00 00    	jne    9f70 <III_stereo+0xc96>
               if ( ms_stereo ) {
    9e44:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    9e48:	0f 84 b5 00 00 00    	je     9f03 <III_stereo+0xc29>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    9e4e:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9e51:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9e54:	89 d0                	mov    %edx,%eax
    9e56:	c1 e0 03             	shl    $0x3,%eax
    9e59:	01 d0                	add    %edx,%eax
    9e5b:	01 c0                	add    %eax,%eax
    9e5d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9e60:	01 d0                	add    %edx,%eax
    9e62:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9e65:	8b 45 08             	mov    0x8(%ebp),%eax
    9e68:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9e6e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9e71:	89 d0                	mov    %edx,%eax
    9e73:	c1 e0 03             	shl    $0x3,%eax
    9e76:	01 d0                	add    %edx,%eax
    9e78:	01 c0                	add    %eax,%eax
    9e7a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9e7d:	01 d0                	add    %edx,%eax
    9e7f:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9e82:	de c1                	faddp  %st,%st(1)
    9e84:	dd 05 88 db 00 00    	fldl   0xdb88
    9e8a:	de f9                	fdivrp %st,%st(1)
    9e8c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9e8f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9e92:	89 d0                	mov    %edx,%eax
    9e94:	c1 e0 03             	shl    $0x3,%eax
    9e97:	01 d0                	add    %edx,%eax
    9e99:	01 c0                	add    %eax,%eax
    9e9b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9e9e:	01 d0                	add    %edx,%eax
    9ea0:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    9ea3:	8b 45 0c             	mov    0xc(%ebp),%eax
    9ea6:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    9eac:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9eaf:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9eb2:	89 d0                	mov    %edx,%eax
    9eb4:	c1 e0 03             	shl    $0x3,%eax
    9eb7:	01 d0                	add    %edx,%eax
    9eb9:	01 c0                	add    %eax,%eax
    9ebb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9ebe:	01 d0                	add    %edx,%eax
    9ec0:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9ec3:	8b 45 08             	mov    0x8(%ebp),%eax
    9ec6:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9ecc:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9ecf:	89 d0                	mov    %edx,%eax
    9ed1:	c1 e0 03             	shl    $0x3,%eax
    9ed4:	01 d0                	add    %edx,%eax
    9ed6:	01 c0                	add    %eax,%eax
    9ed8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9edb:	01 d0                	add    %edx,%eax
    9edd:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9ee0:	de e9                	fsubrp %st,%st(1)
    9ee2:	dd 05 88 db 00 00    	fldl   0xdb88
    9ee8:	de f9                	fdivrp %st,%st(1)
    9eea:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9eed:	89 d0                	mov    %edx,%eax
    9eef:	c1 e0 03             	shl    $0x3,%eax
    9ef2:	01 d0                	add    %edx,%eax
    9ef4:	01 c0                	add    %eax,%eax
    9ef6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9ef9:	01 d0                	add    %edx,%eax
    9efb:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    9efe:	e9 1f 01 00 00       	jmp    a022 <III_stereo+0xd48>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    9f03:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9f06:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9f09:	89 d0                	mov    %edx,%eax
    9f0b:	c1 e0 03             	shl    $0x3,%eax
    9f0e:	01 d0                	add    %edx,%eax
    9f10:	01 c0                	add    %eax,%eax
    9f12:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9f15:	01 d0                	add    %edx,%eax
    9f17:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9f1a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9f1d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9f20:	89 d0                	mov    %edx,%eax
    9f22:	c1 e0 03             	shl    $0x3,%eax
    9f25:	01 d0                	add    %edx,%eax
    9f27:	01 c0                	add    %eax,%eax
    9f29:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9f2c:	01 d0                	add    %edx,%eax
    9f2e:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    9f31:	8b 45 0c             	mov    0xc(%ebp),%eax
    9f34:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9f3a:	8b 45 08             	mov    0x8(%ebp),%eax
    9f3d:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    9f43:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9f46:	89 d0                	mov    %edx,%eax
    9f48:	c1 e0 03             	shl    $0x3,%eax
    9f4b:	01 d0                	add    %edx,%eax
    9f4d:	01 c0                	add    %eax,%eax
    9f4f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9f52:	01 d0                	add    %edx,%eax
    9f54:	dd 04 c3             	fldl   (%ebx,%eax,8)
    9f57:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9f5a:	89 d0                	mov    %edx,%eax
    9f5c:	c1 e0 03             	shl    $0x3,%eax
    9f5f:	01 d0                	add    %edx,%eax
    9f61:	01 c0                	add    %eax,%eax
    9f63:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9f66:	01 d0                	add    %edx,%eax
    9f68:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    9f6b:	e9 b2 00 00 00       	jmp    a022 <III_stereo+0xd48>
               }
            }
            else if (i_stereo ) {
    9f70:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    9f74:	0f 84 94 00 00 00    	je     a00e <III_stereo+0xd34>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    9f7a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9f7d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9f80:	89 d0                	mov    %edx,%eax
    9f82:	c1 e0 03             	shl    $0x3,%eax
    9f85:	01 d0                	add    %edx,%eax
    9f87:	01 c0                	add    %eax,%eax
    9f89:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9f8c:	01 d0                	add    %edx,%eax
    9f8e:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9f91:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f94:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9f9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9f9e:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9fa5:	d9 e8                	fld1   
    9fa7:	de c1                	faddp  %st,%st(1)
    9fa9:	de f9                	fdivrp %st,%st(1)
    9fab:	de c9                	fmulp  %st,%st(1)
    9fad:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9fb0:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9fb3:	89 d0                	mov    %edx,%eax
    9fb5:	c1 e0 03             	shl    $0x3,%eax
    9fb8:	01 d0                	add    %edx,%eax
    9fba:	01 c0                	add    %eax,%eax
    9fbc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9fbf:	01 d0                	add    %edx,%eax
    9fc1:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    9fc4:	8b 45 0c             	mov    0xc(%ebp),%eax
    9fc7:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    9fcd:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9fd0:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9fd3:	89 d0                	mov    %edx,%eax
    9fd5:	c1 e0 03             	shl    $0x3,%eax
    9fd8:	01 d0                	add    %edx,%eax
    9fda:	01 c0                	add    %eax,%eax
    9fdc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9fdf:	01 d0                	add    %edx,%eax
    9fe1:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9fe4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9fe7:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9fee:	d9 e8                	fld1   
    9ff0:	de c1                	faddp  %st,%st(1)
    9ff2:	d9 e8                	fld1   
    9ff4:	de f1                	fdivp  %st,%st(1)
    9ff6:	de c9                	fmulp  %st,%st(1)
    9ff8:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9ffb:	89 d0                	mov    %edx,%eax
    9ffd:	c1 e0 03             	shl    $0x3,%eax
    a000:	01 d0                	add    %edx,%eax
    a002:	01 c0                	add    %eax,%eax
    a004:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a007:	01 d0                	add    %edx,%eax
    a009:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    a00c:	eb 14                	jmp    a022 <III_stereo+0xd48>
            }
            else {
               printf(0,"Error in streo processing\n");
    a00e:	c7 44 24 04 20 cb 00 	movl   $0xcb20,0x4(%esp)
    a015:	00 
    a016:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    a01d:	e8 3c a7 ff ff       	call   475e <printf>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    a022:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a026:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    a02a:	0f 8e eb fd ff ff    	jle    9e1b <III_stereo+0xb41>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    a030:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a034:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    a038:	0f 8e d1 fd ff ff    	jle    9e0f <III_stereo+0xb35>
    a03e:	eb 54                	jmp    a094 <III_stereo+0xdba>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    a040:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a047:	eb 45                	jmp    a08e <III_stereo+0xdb4>
         for(ss=0;ss<SSLIMIT;ss++)
    a049:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    a050:	eb 32                	jmp    a084 <III_stereo+0xdaa>
            lr[0][sb][ss] = xr[0][sb][ss];
    a052:	8b 4d 08             	mov    0x8(%ebp),%ecx
    a055:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a058:	89 d0                	mov    %edx,%eax
    a05a:	c1 e0 03             	shl    $0x3,%eax
    a05d:	01 d0                	add    %edx,%eax
    a05f:	01 c0                	add    %eax,%eax
    a061:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a064:	01 d0                	add    %edx,%eax
    a066:	dd 04 c1             	fldl   (%ecx,%eax,8)
    a069:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a06c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a06f:	89 d0                	mov    %edx,%eax
    a071:	c1 e0 03             	shl    $0x3,%eax
    a074:	01 d0                	add    %edx,%eax
    a076:	01 c0                	add    %eax,%eax
    a078:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a07b:	01 d0                	add    %edx,%eax
    a07d:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    a080:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a084:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    a088:	7e c8                	jle    a052 <III_stereo+0xd78>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    a08a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a08e:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    a092:	7e b5                	jle    a049 <III_stereo+0xd6f>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    a094:	81 c4 50 1b 00 00    	add    $0x1b50,%esp
    a09a:	5b                   	pop    %ebx
    a09b:	5e                   	pop    %esi
    a09c:	5d                   	pop    %ebp
    a09d:	c3                   	ret    

0000a09e <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    a09e:	55                   	push   %ebp
    a09f:	89 e5                	mov    %esp,%ebp
    a0a1:	83 ec 48             	sub    $0x48,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    a0a4:	a1 80 f7 00 00       	mov    0xf780,%eax
    a0a9:	85 c0                	test   %eax,%eax
    a0ab:	74 68                	je     a115 <III_antialias+0x77>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    a0ad:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a0b4:	eb 4f                	jmp    a105 <III_antialias+0x67>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    a0b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a0b9:	dd 04 c5 40 f7 00 00 	fldl   0xf740(,%eax,8)
    a0c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a0c3:	dd 04 c5 40 f7 00 00 	fldl   0xf740(,%eax,8)
    a0ca:	de c9                	fmulp  %st,%st(1)
    a0cc:	d9 e8                	fld1   
    a0ce:	de c1                	faddp  %st,%st(1)
    a0d0:	dd 1c 24             	fstpl  (%esp)
    a0d3:	e8 de ac ff ff       	call   4db6 <sqrt>
    a0d8:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    a0db:	d9 e8                	fld1   
    a0dd:	dc 75 e0             	fdivl  -0x20(%ebp)
    a0e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a0e3:	dd 1c c5 e0 f7 00 00 	fstpl  0xf7e0(,%eax,8)
         ca[i] = Ci[i]/sq;
    a0ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a0ed:	dd 04 c5 40 f7 00 00 	fldl   0xf740(,%eax,8)
    a0f4:	dc 75 e0             	fdivl  -0x20(%ebp)
    a0f7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a0fa:	dd 1c c5 20 f8 00 00 	fstpl  0xf820(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    a101:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a105:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    a109:	7e ab                	jle    a0b6 <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    a10b:	c7 05 80 f7 00 00 00 	movl   $0x0,0xf780
    a112:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    a115:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a11c:	eb 4c                	jmp    a16a <III_antialias+0xcc>
       for(ss=0;ss<SSLIMIT;ss++)
    a11e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a125:	eb 39                	jmp    a160 <III_antialias+0xc2>
          hybridIn[sb][ss] = xr[sb][ss];
    a127:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a12a:	89 d0                	mov    %edx,%eax
    a12c:	c1 e0 03             	shl    $0x3,%eax
    a12f:	01 d0                	add    %edx,%eax
    a131:	c1 e0 04             	shl    $0x4,%eax
    a134:	89 c2                	mov    %eax,%edx
    a136:	8b 45 0c             	mov    0xc(%ebp),%eax
    a139:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a13c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a13f:	89 d0                	mov    %edx,%eax
    a141:	c1 e0 03             	shl    $0x3,%eax
    a144:	01 d0                	add    %edx,%eax
    a146:	c1 e0 04             	shl    $0x4,%eax
    a149:	89 c2                	mov    %eax,%edx
    a14b:	8b 45 08             	mov    0x8(%ebp),%eax
    a14e:	01 c2                	add    %eax,%edx
    a150:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a153:	dd 04 c2             	fldl   (%edx,%eax,8)
    a156:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a159:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    a15c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a160:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a164:	7e c1                	jle    a127 <III_antialias+0x89>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    a166:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a16a:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    a16e:	7e ae                	jle    a11e <III_antialias+0x80>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    a170:	8b 45 10             	mov    0x10(%ebp),%eax
    a173:	8b 40 10             	mov    0x10(%eax),%eax
    a176:	85 c0                	test   %eax,%eax
    a178:	74 1a                	je     a194 <III_antialias+0xf6>
    a17a:	8b 45 10             	mov    0x10(%ebp),%eax
    a17d:	8b 40 14             	mov    0x14(%eax),%eax
    a180:	83 f8 02             	cmp    $0x2,%eax
    a183:	75 0f                	jne    a194 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    a185:	8b 45 10             	mov    0x10(%ebp),%eax
    a188:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    a18b:	85 c0                	test   %eax,%eax
    a18d:	75 05                	jne    a194 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    a18f:	e9 1c 01 00 00       	jmp    a2b0 <III_antialias+0x212>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    a194:	8b 45 10             	mov    0x10(%ebp),%eax
    a197:	8b 40 10             	mov    0x10(%eax),%eax
    a19a:	85 c0                	test   %eax,%eax
    a19c:	74 1e                	je     a1bc <III_antialias+0x11e>
    a19e:	8b 45 10             	mov    0x10(%ebp),%eax
    a1a1:	8b 40 18             	mov    0x18(%eax),%eax
    a1a4:	85 c0                	test   %eax,%eax
    a1a6:	74 14                	je     a1bc <III_antialias+0x11e>
     (gr_info->block_type == 2))
    a1a8:	8b 45 10             	mov    0x10(%ebp),%eax
    a1ab:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    a1ae:	83 f8 02             	cmp    $0x2,%eax
    a1b1:	75 09                	jne    a1bc <III_antialias+0x11e>
     (gr_info->block_type == 2))
      sblim = 1;
    a1b3:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    a1ba:	eb 07                	jmp    a1c3 <III_antialias+0x125>
   else
      sblim = SBLIMIT-1;
    a1bc:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    a1c3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a1ca:	e9 d5 00 00 00       	jmp    a2a4 <III_antialias+0x206>
      for(ss=0;ss<8;ss++) {
    a1cf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a1d6:	e9 bb 00 00 00       	jmp    a296 <III_antialias+0x1f8>
         bu = xr[sb][17-ss];
    a1db:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a1de:	89 d0                	mov    %edx,%eax
    a1e0:	c1 e0 03             	shl    $0x3,%eax
    a1e3:	01 d0                	add    %edx,%eax
    a1e5:	c1 e0 04             	shl    $0x4,%eax
    a1e8:	89 c2                	mov    %eax,%edx
    a1ea:	8b 45 08             	mov    0x8(%ebp),%eax
    a1ed:	01 c2                	add    %eax,%edx
    a1ef:	b8 11 00 00 00       	mov    $0x11,%eax
    a1f4:	2b 45 f4             	sub    -0xc(%ebp),%eax
    a1f7:	dd 04 c2             	fldl   (%edx,%eax,8)
    a1fa:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    a1fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a200:	8d 50 01             	lea    0x1(%eax),%edx
    a203:	89 d0                	mov    %edx,%eax
    a205:	c1 e0 03             	shl    $0x3,%eax
    a208:	01 d0                	add    %edx,%eax
    a20a:	c1 e0 04             	shl    $0x4,%eax
    a20d:	89 c2                	mov    %eax,%edx
    a20f:	8b 45 08             	mov    0x8(%ebp),%eax
    a212:	01 c2                	add    %eax,%edx
    a214:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a217:	dd 04 c2             	fldl   (%edx,%eax,8)
    a21a:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    a21d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a220:	89 d0                	mov    %edx,%eax
    a222:	c1 e0 03             	shl    $0x3,%eax
    a225:	01 d0                	add    %edx,%eax
    a227:	c1 e0 04             	shl    $0x4,%eax
    a22a:	89 c2                	mov    %eax,%edx
    a22c:	8b 45 0c             	mov    0xc(%ebp),%eax
    a22f:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a232:	b8 11 00 00 00       	mov    $0x11,%eax
    a237:	2b 45 f4             	sub    -0xc(%ebp),%eax
    a23a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a23d:	dd 04 d5 e0 f7 00 00 	fldl   0xf7e0(,%edx,8)
    a244:	dc 4d d8             	fmull  -0x28(%ebp)
    a247:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a24a:	dd 04 d5 20 f8 00 00 	fldl   0xf820(,%edx,8)
    a251:	dc 4d d0             	fmull  -0x30(%ebp)
    a254:	de e9                	fsubrp %st,%st(1)
    a256:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    a259:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a25c:	8d 50 01             	lea    0x1(%eax),%edx
    a25f:	89 d0                	mov    %edx,%eax
    a261:	c1 e0 03             	shl    $0x3,%eax
    a264:	01 d0                	add    %edx,%eax
    a266:	c1 e0 04             	shl    $0x4,%eax
    a269:	89 c2                	mov    %eax,%edx
    a26b:	8b 45 0c             	mov    0xc(%ebp),%eax
    a26e:	01 c2                	add    %eax,%edx
    a270:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a273:	dd 04 c5 e0 f7 00 00 	fldl   0xf7e0(,%eax,8)
    a27a:	dc 4d d0             	fmull  -0x30(%ebp)
    a27d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a280:	dd 04 c5 20 f8 00 00 	fldl   0xf820(,%eax,8)
    a287:	dc 4d d8             	fmull  -0x28(%ebp)
    a28a:	de c1                	faddp  %st,%st(1)
    a28c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a28f:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    a292:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a296:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    a29a:	0f 8e 3b ff ff ff    	jle    a1db <III_antialias+0x13d>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    a2a0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a2a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a2a7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    a2aa:	0f 8c 1f ff ff ff    	jl     a1cf <III_antialias+0x131>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    a2b0:	c9                   	leave  
    a2b1:	c3                   	ret    

0000a2b2 <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    a2b2:	55                   	push   %ebp
    a2b3:	89 e5                	mov    %esp,%ebp
    a2b5:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    a2bb:	a1 60 f8 00 00       	mov    0xf860,%eax
    a2c0:	85 c0                	test   %eax,%eax
    a2c2:	0f 85 59 02 00 00    	jne    a521 <inv_mdct+0x26f>

    /* type 0 */
      for(i=0;i<36;i++)
    a2c8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a2cf:	eb 29                	jmp    a2fa <inv_mdct+0x48>
         win[0][i] = sin( PI/36 *(i+0.5) );
    a2d1:	db 45 f4             	fildl  -0xc(%ebp)
    a2d4:	dd 05 90 db 00 00    	fldl   0xdb90
    a2da:	de c1                	faddp  %st,%st(1)
    a2dc:	dd 05 98 db 00 00    	fldl   0xdb98
    a2e2:	de c9                	fmulp  %st,%st(1)
    a2e4:	dd 1c 24             	fstpl  (%esp)
    a2e7:	e8 53 a8 ff ff       	call   4b3f <sin>
    a2ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a2ef:	dd 1c c5 80 f8 00 00 	fstpl  0xf880(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    a2f6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a2fa:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a2fe:	7e d1                	jle    a2d1 <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    a300:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a307:	eb 2c                	jmp    a335 <inv_mdct+0x83>
         win[1][i] = sin( PI/36 *(i+0.5) );
    a309:	db 45 f4             	fildl  -0xc(%ebp)
    a30c:	dd 05 90 db 00 00    	fldl   0xdb90
    a312:	de c1                	faddp  %st,%st(1)
    a314:	dd 05 98 db 00 00    	fldl   0xdb98
    a31a:	de c9                	fmulp  %st,%st(1)
    a31c:	dd 1c 24             	fstpl  (%esp)
    a31f:	e8 1b a8 ff ff       	call   4b3f <sin>
    a324:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a327:	83 c0 24             	add    $0x24,%eax
    a32a:	dd 1c c5 80 f8 00 00 	fstpl  0xf880(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    a331:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a335:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a339:	7e ce                	jle    a309 <inv_mdct+0x57>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    a33b:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    a342:	eb 13                	jmp    a357 <inv_mdct+0xa5>
         win[1][i] = 1.0;
    a344:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a347:	83 c0 24             	add    $0x24,%eax
    a34a:	d9 e8                	fld1   
    a34c:	dd 1c c5 80 f8 00 00 	fstpl  0xf880(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    a353:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a357:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    a35b:	7e e7                	jle    a344 <inv_mdct+0x92>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    a35d:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    a364:	eb 34                	jmp    a39a <inv_mdct+0xe8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    a366:	db 45 f4             	fildl  -0xc(%ebp)
    a369:	dd 05 90 db 00 00    	fldl   0xdb90
    a36f:	de c1                	faddp  %st,%st(1)
    a371:	dd 05 a0 db 00 00    	fldl   0xdba0
    a377:	de e9                	fsubrp %st,%st(1)
    a379:	dd 05 80 db 00 00    	fldl   0xdb80
    a37f:	de c9                	fmulp  %st,%st(1)
    a381:	dd 1c 24             	fstpl  (%esp)
    a384:	e8 b6 a7 ff ff       	call   4b3f <sin>
    a389:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a38c:	83 c0 24             	add    $0x24,%eax
    a38f:	dd 1c c5 80 f8 00 00 	fstpl  0xf880(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    a396:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a39a:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    a39e:	7e c6                	jle    a366 <inv_mdct+0xb4>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    a3a0:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    a3a7:	eb 13                	jmp    a3bc <inv_mdct+0x10a>
         win[1][i] = 0.0;
    a3a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a3ac:	83 c0 24             	add    $0x24,%eax
    a3af:	d9 ee                	fldz   
    a3b1:	dd 1c c5 80 f8 00 00 	fstpl  0xf880(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    a3b8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a3bc:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a3c0:	7e e7                	jle    a3a9 <inv_mdct+0xf7>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    a3c2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a3c9:	eb 13                	jmp    a3de <inv_mdct+0x12c>
         win[3][i] = 0.0;
    a3cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a3ce:	83 c0 6c             	add    $0x6c,%eax
    a3d1:	d9 ee                	fldz   
    a3d3:	dd 1c c5 80 f8 00 00 	fstpl  0xf880(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    a3da:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a3de:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    a3e2:	7e e7                	jle    a3cb <inv_mdct+0x119>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    a3e4:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    a3eb:	eb 34                	jmp    a421 <inv_mdct+0x16f>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    a3ed:	db 45 f4             	fildl  -0xc(%ebp)
    a3f0:	dd 05 90 db 00 00    	fldl   0xdb90
    a3f6:	de c1                	faddp  %st,%st(1)
    a3f8:	dd 05 a8 db 00 00    	fldl   0xdba8
    a3fe:	de e9                	fsubrp %st,%st(1)
    a400:	dd 05 80 db 00 00    	fldl   0xdb80
    a406:	de c9                	fmulp  %st,%st(1)
    a408:	dd 1c 24             	fstpl  (%esp)
    a40b:	e8 2f a7 ff ff       	call   4b3f <sin>
    a410:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a413:	83 c0 6c             	add    $0x6c,%eax
    a416:	dd 1c c5 80 f8 00 00 	fstpl  0xf880(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    a41d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a421:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a425:	7e c6                	jle    a3ed <inv_mdct+0x13b>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    a427:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    a42e:	eb 13                	jmp    a443 <inv_mdct+0x191>
         win[3][i] =1.0;
    a430:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a433:	83 c0 6c             	add    $0x6c,%eax
    a436:	d9 e8                	fld1   
    a438:	dd 1c c5 80 f8 00 00 	fstpl  0xf880(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    a43f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a443:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a447:	7e e7                	jle    a430 <inv_mdct+0x17e>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    a449:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    a450:	eb 2c                	jmp    a47e <inv_mdct+0x1cc>
         win[3][i] = sin( PI/36*(i+0.5) );
    a452:	db 45 f4             	fildl  -0xc(%ebp)
    a455:	dd 05 90 db 00 00    	fldl   0xdb90
    a45b:	de c1                	faddp  %st,%st(1)
    a45d:	dd 05 98 db 00 00    	fldl   0xdb98
    a463:	de c9                	fmulp  %st,%st(1)
    a465:	dd 1c 24             	fstpl  (%esp)
    a468:	e8 d2 a6 ff ff       	call   4b3f <sin>
    a46d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a470:	83 c0 6c             	add    $0x6c,%eax
    a473:	dd 1c c5 80 f8 00 00 	fstpl  0xf880(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    a47a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a47e:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a482:	7e ce                	jle    a452 <inv_mdct+0x1a0>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    a484:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a48b:	eb 2c                	jmp    a4b9 <inv_mdct+0x207>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    a48d:	db 45 f4             	fildl  -0xc(%ebp)
    a490:	dd 05 90 db 00 00    	fldl   0xdb90
    a496:	de c1                	faddp  %st,%st(1)
    a498:	dd 05 80 db 00 00    	fldl   0xdb80
    a49e:	de c9                	fmulp  %st,%st(1)
    a4a0:	dd 1c 24             	fstpl  (%esp)
    a4a3:	e8 97 a6 ff ff       	call   4b3f <sin>
    a4a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a4ab:	83 c0 48             	add    $0x48,%eax
    a4ae:	dd 1c c5 80 f8 00 00 	fstpl  0xf880(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    a4b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a4b9:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a4bd:	7e ce                	jle    a48d <inv_mdct+0x1db>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    a4bf:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    a4c6:	eb 13                	jmp    a4db <inv_mdct+0x229>
         win[2][i] = 0.0 ;
    a4c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a4cb:	83 c0 48             	add    $0x48,%eax
    a4ce:	d9 ee                	fldz   
    a4d0:	dd 1c c5 80 f8 00 00 	fstpl  0xf880(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    a4d7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a4db:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a4df:	7e e7                	jle    a4c8 <inv_mdct+0x216>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    a4e1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a4e8:	eb 21                	jmp    a50b <inv_mdct+0x259>
         COS[i] = cos(PI/(2*36) * i);
    a4ea:	db 45 f4             	fildl  -0xc(%ebp)
    a4ed:	dd 05 b0 db 00 00    	fldl   0xdbb0
    a4f3:	de c9                	fmulp  %st,%st(1)
    a4f5:	dd 1c 24             	fstpl  (%esp)
    a4f8:	e8 e1 a6 ff ff       	call   4bde <cos>
    a4fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a500:	dd 1c c5 00 fd 00 00 	fstpl  0xfd00(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    a507:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a50b:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    a512:	7e d6                	jle    a4ea <inv_mdct+0x238>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    a514:	a1 60 f8 00 00       	mov    0xf860,%eax
    a519:	83 c0 01             	add    $0x1,%eax
    a51c:	a3 60 f8 00 00       	mov    %eax,0xf860
    }

    for(i=0;i<36;i++)
    a521:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a528:	eb 17                	jmp    a541 <inv_mdct+0x28f>
       out[i]=0;
    a52a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a52d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a534:	8b 45 0c             	mov    0xc(%ebp),%eax
    a537:	01 d0                	add    %edx,%eax
    a539:	d9 ee                	fldz   
    a53b:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    a53d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a541:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a545:	7e e3                	jle    a52a <inv_mdct+0x278>
       out[i]=0;

    if(block_type == 2){
    a547:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    a54b:	0f 85 85 01 00 00    	jne    a6d6 <inv_mdct+0x424>
       N=12;
    a551:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    a558:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a55f:	e9 63 01 00 00       	jmp    a6c7 <inv_mdct+0x415>
          for(p= 0;p<N;p++){
    a564:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a56b:	e9 df 00 00 00       	jmp    a64f <inv_mdct+0x39d>
             sum = 0.0;
    a570:	d9 ee                	fldz   
    a572:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    a575:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a57c:	e9 8f 00 00 00       	jmp    a610 <inv_mdct+0x35e>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    a581:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a584:	89 d0                	mov    %edx,%eax
    a586:	01 c0                	add    %eax,%eax
    a588:	01 c2                	add    %eax,%edx
    a58a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a58d:	01 d0                	add    %edx,%eax
    a58f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a596:	8b 45 08             	mov    0x8(%ebp),%eax
    a599:	01 d0                	add    %edx,%eax
    a59b:	dd 00                	fldl   (%eax)
    a59d:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
    a5a3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a5a6:	01 c0                	add    %eax,%eax
    a5a8:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    a5ae:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    a5b4:	dd 05 b8 db 00 00    	fldl   0xdbb8
    a5ba:	de f1                	fdivp  %st,%st(1)
    a5bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a5bf:	01 c0                	add    %eax,%eax
    a5c1:	8d 50 01             	lea    0x1(%eax),%edx
    a5c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a5c7:	89 c1                	mov    %eax,%ecx
    a5c9:	c1 e9 1f             	shr    $0x1f,%ecx
    a5cc:	01 c8                	add    %ecx,%eax
    a5ce:	d1 f8                	sar    %eax
    a5d0:	01 d0                	add    %edx,%eax
    a5d2:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    a5d8:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    a5de:	de c9                	fmulp  %st,%st(1)
    a5e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a5e3:	01 c0                	add    %eax,%eax
    a5e5:	83 c0 01             	add    $0x1,%eax
    a5e8:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    a5ee:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    a5f4:	de c9                	fmulp  %st,%st(1)
    a5f6:	dd 1c 24             	fstpl  (%esp)
    a5f9:	e8 e0 a5 ff ff       	call   4bde <cos>
    a5fe:	dc 8d 68 ff ff ff    	fmull  -0x98(%ebp)
    a604:	dd 45 e0             	fldl   -0x20(%ebp)
    a607:	de c1                	faddp  %st,%st(1)
    a609:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    a60c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a610:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a613:	89 c2                	mov    %eax,%edx
    a615:	c1 ea 1f             	shr    $0x1f,%edx
    a618:	01 d0                	add    %edx,%eax
    a61a:	d1 f8                	sar    %eax
    a61c:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a61f:	0f 8f 5c ff ff ff    	jg     a581 <inv_mdct+0x2cf>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    a625:	8b 55 10             	mov    0x10(%ebp),%edx
    a628:	89 d0                	mov    %edx,%eax
    a62a:	c1 e0 03             	shl    $0x3,%eax
    a62d:	01 d0                	add    %edx,%eax
    a62f:	c1 e0 02             	shl    $0x2,%eax
    a632:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a635:	01 d0                	add    %edx,%eax
    a637:	dd 04 c5 80 f8 00 00 	fldl   0xf880(,%eax,8)
    a63e:	dc 4d e0             	fmull  -0x20(%ebp)
    a641:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a644:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    a64b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a64f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a652:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a655:	0f 8c 15 ff ff ff    	jl     a570 <inv_mdct+0x2be>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    a65b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a662:	eb 57                	jmp    a6bb <inv_mdct+0x409>
             out[6*i+p+6] += tmp[p];
    a664:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a667:	89 d0                	mov    %edx,%eax
    a669:	01 c0                	add    %eax,%eax
    a66b:	01 d0                	add    %edx,%eax
    a66d:	01 c0                	add    %eax,%eax
    a66f:	89 c2                	mov    %eax,%edx
    a671:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a674:	01 d0                	add    %edx,%eax
    a676:	83 c0 06             	add    $0x6,%eax
    a679:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a680:	8b 45 0c             	mov    0xc(%ebp),%eax
    a683:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a686:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a689:	89 d0                	mov    %edx,%eax
    a68b:	01 c0                	add    %eax,%eax
    a68d:	01 d0                	add    %edx,%eax
    a68f:	01 c0                	add    %eax,%eax
    a691:	89 c2                	mov    %eax,%edx
    a693:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a696:	01 d0                	add    %edx,%eax
    a698:	83 c0 06             	add    $0x6,%eax
    a69b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a6a2:	8b 45 0c             	mov    0xc(%ebp),%eax
    a6a5:	01 d0                	add    %edx,%eax
    a6a7:	dd 00                	fldl   (%eax)
    a6a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a6ac:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    a6b3:	de c1                	faddp  %st,%st(1)
    a6b5:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    a6b7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a6bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a6be:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a6c1:	7c a1                	jl     a664 <inv_mdct+0x3b2>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    a6c3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a6c7:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    a6cb:	0f 8e 93 fe ff ff    	jle    a564 <inv_mdct+0x2b2>
    a6d1:	e9 da 00 00 00       	jmp    a7b0 <inv_mdct+0x4fe>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    a6d6:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    a6dd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a6e4:	e9 bb 00 00 00       	jmp    a7a4 <inv_mdct+0x4f2>
         sum = 0.0;
    a6e9:	d9 ee                	fldz   
    a6eb:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    a6ee:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a6f5:	eb 6a                	jmp    a761 <inv_mdct+0x4af>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    a6f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a6fa:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a701:	8b 45 08             	mov    0x8(%ebp),%eax
    a704:	01 d0                	add    %edx,%eax
    a706:	dd 00                	fldl   (%eax)
    a708:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a70b:	01 c0                	add    %eax,%eax
    a70d:	8d 50 01             	lea    0x1(%eax),%edx
    a710:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a713:	89 c1                	mov    %eax,%ecx
    a715:	c1 e9 1f             	shr    $0x1f,%ecx
    a718:	01 c8                	add    %ecx,%eax
    a71a:	d1 f8                	sar    %eax
    a71c:	01 c2                	add    %eax,%edx
    a71e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a721:	01 c0                	add    %eax,%eax
    a723:	83 c0 01             	add    $0x1,%eax
    a726:	89 d1                	mov    %edx,%ecx
    a728:	0f af c8             	imul   %eax,%ecx
    a72b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a730:	89 c8                	mov    %ecx,%eax
    a732:	f7 ea                	imul   %edx
    a734:	c1 fa 05             	sar    $0x5,%edx
    a737:	89 c8                	mov    %ecx,%eax
    a739:	c1 f8 1f             	sar    $0x1f,%eax
    a73c:	29 c2                	sub    %eax,%edx
    a73e:	89 d0                	mov    %edx,%eax
    a740:	c1 e0 03             	shl    $0x3,%eax
    a743:	01 d0                	add    %edx,%eax
    a745:	c1 e0 04             	shl    $0x4,%eax
    a748:	29 c1                	sub    %eax,%ecx
    a74a:	89 ca                	mov    %ecx,%edx
    a74c:	dd 04 d5 00 fd 00 00 	fldl   0xfd00(,%edx,8)
    a753:	de c9                	fmulp  %st,%st(1)
    a755:	dd 45 e0             	fldl   -0x20(%ebp)
    a758:	de c1                	faddp  %st,%st(1)
    a75a:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    a75d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a761:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a764:	89 c2                	mov    %eax,%edx
    a766:	c1 ea 1f             	shr    $0x1f,%edx
    a769:	01 d0                	add    %edx,%eax
    a76b:	d1 f8                	sar    %eax
    a76d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a770:	7f 85                	jg     a6f7 <inv_mdct+0x445>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    a772:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a775:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a77c:	8b 45 0c             	mov    0xc(%ebp),%eax
    a77f:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a782:	8b 55 10             	mov    0x10(%ebp),%edx
    a785:	89 d0                	mov    %edx,%eax
    a787:	c1 e0 03             	shl    $0x3,%eax
    a78a:	01 d0                	add    %edx,%eax
    a78c:	c1 e0 02             	shl    $0x2,%eax
    a78f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a792:	01 d0                	add    %edx,%eax
    a794:	dd 04 c5 80 f8 00 00 	fldl   0xf880(,%eax,8)
    a79b:	dc 4d e0             	fmull  -0x20(%ebp)
    a79e:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    a7a0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a7a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a7a7:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a7aa:	0f 8c 39 ff ff ff    	jl     a6e9 <inv_mdct+0x437>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    a7b0:	c9                   	leave  
    a7b1:	c3                   	ret    

0000a7b2 <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    a7b2:	55                   	push   %ebp
    a7b3:	89 e5                	mov    %esp,%ebp
    a7b5:	53                   	push   %ebx
    a7b6:	81 ec 54 01 00 00    	sub    $0x154,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    a7bc:	a1 84 f7 00 00       	mov    0xf784,%eax
    a7c1:	85 c0                	test   %eax,%eax
    a7c3:	74 6f                	je     a834 <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    a7c5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a7cc:	eb 56                	jmp    a824 <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    a7ce:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a7d5:	eb 43                	jmp    a81a <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    a7d7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a7de:	eb 30                	jmp    a810 <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    a7e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a7e3:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a7e6:	89 c2                	mov    %eax,%edx
    a7e8:	c1 e2 03             	shl    $0x3,%edx
    a7eb:	01 c2                	add    %eax,%edx
    a7ed:	8d 04 12             	lea    (%edx,%edx,1),%eax
    a7f0:	89 c2                	mov    %eax,%edx
    a7f2:	89 c8                	mov    %ecx,%eax
    a7f4:	c1 e0 03             	shl    $0x3,%eax
    a7f7:	01 c8                	add    %ecx,%eax
    a7f9:	c1 e0 06             	shl    $0x6,%eax
    a7fc:	01 c2                	add    %eax,%edx
    a7fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a801:	01 d0                	add    %edx,%eax
    a803:	d9 ee                	fldz   
    a805:	dd 1c c5 80 01 01 00 	fstpl  0x10180(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    a80c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a810:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    a814:	7e ca                	jle    a7e0 <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    a816:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a81a:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    a81e:	7e b7                	jle    a7d7 <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    a820:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a824:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    a828:	7e a4                	jle    a7ce <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    a82a:	c7 05 84 f7 00 00 00 	movl   $0x0,0xf784
    a831:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    a834:	8b 45 18             	mov    0x18(%ebp),%eax
    a837:	8b 40 10             	mov    0x10(%eax),%eax
    a83a:	85 c0                	test   %eax,%eax
    a83c:	74 10                	je     a84e <III_hybrid+0x9c>
    a83e:	8b 45 18             	mov    0x18(%ebp),%eax
    a841:	8b 40 18             	mov    0x18(%eax),%eax
    a844:	85 c0                	test   %eax,%eax
    a846:	74 06                	je     a84e <III_hybrid+0x9c>
    a848:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    a84c:	7e 08                	jle    a856 <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    a84e:	8b 45 18             	mov    0x18(%ebp),%eax
    a851:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    a854:	eb 05                	jmp    a85b <III_hybrid+0xa9>
    a856:	b8 00 00 00 00       	mov    $0x0,%eax
    a85b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    a85e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a861:	89 44 24 08          	mov    %eax,0x8(%esp)
    a865:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    a86b:	89 44 24 04          	mov    %eax,0x4(%esp)
    a86f:	8b 45 08             	mov    0x8(%ebp),%eax
    a872:	89 04 24             	mov    %eax,(%esp)
    a875:	e8 38 fa ff ff       	call   a2b2 <inv_mdct>

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    a87a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a881:	e9 83 00 00 00       	jmp    a909 <III_hybrid+0x157>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    a886:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a889:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a890:	8b 45 0c             	mov    0xc(%ebp),%eax
    a893:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    a896:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a899:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    a8a0:	8b 45 10             	mov    0x10(%ebp),%eax
    a8a3:	8b 4d 14             	mov    0x14(%ebp),%ecx
    a8a6:	89 c2                	mov    %eax,%edx
    a8a8:	c1 e2 03             	shl    $0x3,%edx
    a8ab:	01 c2                	add    %eax,%edx
    a8ad:	8d 04 12             	lea    (%edx,%edx,1),%eax
    a8b0:	89 c2                	mov    %eax,%edx
    a8b2:	89 c8                	mov    %ecx,%eax
    a8b4:	c1 e0 03             	shl    $0x3,%eax
    a8b7:	01 c8                	add    %ecx,%eax
    a8b9:	c1 e0 06             	shl    $0x6,%eax
    a8bc:	01 c2                	add    %eax,%edx
    a8be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a8c1:	01 d0                	add    %edx,%eax
    a8c3:	dd 04 c5 80 01 01 00 	fldl   0x10180(,%eax,8)
    a8ca:	de c1                	faddp  %st,%st(1)
    a8cc:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    a8ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a8d1:	83 c0 12             	add    $0x12,%eax
    a8d4:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    a8db:	8b 45 10             	mov    0x10(%ebp),%eax
    a8de:	8b 4d 14             	mov    0x14(%ebp),%ecx
    a8e1:	89 c2                	mov    %eax,%edx
    a8e3:	c1 e2 03             	shl    $0x3,%edx
    a8e6:	01 c2                	add    %eax,%edx
    a8e8:	8d 04 12             	lea    (%edx,%edx,1),%eax
    a8eb:	89 c2                	mov    %eax,%edx
    a8ed:	89 c8                	mov    %ecx,%eax
    a8ef:	c1 e0 03             	shl    $0x3,%eax
    a8f2:	01 c8                	add    %ecx,%eax
    a8f4:	c1 e0 06             	shl    $0x6,%eax
    a8f7:	01 c2                	add    %eax,%edx
    a8f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a8fc:	01 d0                	add    %edx,%eax
    a8fe:	dd 1c c5 80 01 01 00 	fstpl  0x10180(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    a905:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a909:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a90d:	0f 8e 73 ff ff ff    	jle    a886 <III_hybrid+0xd4>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    a913:	81 c4 54 01 00 00    	add    $0x154,%esp
    a919:	5b                   	pop    %ebx
    a91a:	5d                   	pop    %ebp
    a91b:	c3                   	ret    

0000a91c <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    a91c:	55                   	push   %ebp
    a91d:	89 e5                	mov    %esp,%ebp
    a91f:	57                   	push   %edi
    a920:	56                   	push   %esi
    a921:	53                   	push   %ebx
    a922:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    a925:	be 00 00 00 00       	mov    $0x0,%esi
    a92a:	e9 1c 01 00 00       	jmp    aa4b <create_syn_filter+0x12f>
		for (k=0; k<32; k++) {
    a92f:	bb 00 00 00 00       	mov    $0x0,%ebx
    a934:	e9 06 01 00 00       	jmp    aa3f <create_syn_filter+0x123>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    a939:	89 f0                	mov    %esi,%eax
    a93b:	c1 e0 08             	shl    $0x8,%eax
    a93e:	89 c2                	mov    %eax,%edx
    a940:	8b 45 08             	mov    0x8(%ebp),%eax
    a943:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    a946:	89 75 e0             	mov    %esi,-0x20(%ebp)
    a949:	db 45 e0             	fildl  -0x20(%ebp)
    a94c:	dd 05 c0 db 00 00    	fldl   0xdbc0
    a952:	de c9                	fmulp  %st,%st(1)
    a954:	dd 05 c8 db 00 00    	fldl   0xdbc8
    a95a:	de c1                	faddp  %st,%st(1)
    a95c:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    a95f:	83 c0 01             	add    $0x1,%eax
    a962:	89 45 e0             	mov    %eax,-0x20(%ebp)
    a965:	db 45 e0             	fildl  -0x20(%ebp)
    a968:	de c9                	fmulp  %st,%st(1)
    a96a:	dd 1c 24             	fstpl  (%esp)
    a96d:	e8 6c a2 ff ff       	call   4bde <cos>
    a972:	dd 05 d0 db 00 00    	fldl   0xdbd0
    a978:	de c9                	fmulp  %st,%st(1)
    a97a:	dd 1c df             	fstpl  (%edi,%ebx,8)
    a97d:	dd 04 df             	fldl   (%edi,%ebx,8)
    a980:	d9 ee                	fldz   
    a982:	d9 c9                	fxch   %st(1)
    a984:	df e9                	fucomip %st(1),%st
    a986:	dd d8                	fstp   %st(0)
    a988:	72 47                	jb     a9d1 <create_syn_filter+0xb5>
				filter[i][k] = (int)(filter[i][k]+0.5);
    a98a:	89 f0                	mov    %esi,%eax
    a98c:	c1 e0 08             	shl    $0x8,%eax
    a98f:	89 c2                	mov    %eax,%edx
    a991:	8b 45 08             	mov    0x8(%ebp),%eax
    a994:	01 c2                	add    %eax,%edx
    a996:	89 f0                	mov    %esi,%eax
    a998:	c1 e0 08             	shl    $0x8,%eax
    a99b:	89 c1                	mov    %eax,%ecx
    a99d:	8b 45 08             	mov    0x8(%ebp),%eax
    a9a0:	01 c8                	add    %ecx,%eax
    a9a2:	dd 04 d8             	fldl   (%eax,%ebx,8)
    a9a5:	dd 05 90 db 00 00    	fldl   0xdb90
    a9ab:	de c1                	faddp  %st,%st(1)
    a9ad:	d9 7d e6             	fnstcw -0x1a(%ebp)
    a9b0:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    a9b4:	b4 0c                	mov    $0xc,%ah
    a9b6:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    a9ba:	d9 6d e4             	fldcw  -0x1c(%ebp)
    a9bd:	db 5d e0             	fistpl -0x20(%ebp)
    a9c0:	d9 6d e6             	fldcw  -0x1a(%ebp)
    a9c3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    a9c6:	89 45 e0             	mov    %eax,-0x20(%ebp)
    a9c9:	db 45 e0             	fildl  -0x20(%ebp)
    a9cc:	dd 1c da             	fstpl  (%edx,%ebx,8)
    a9cf:	eb 45                	jmp    aa16 <create_syn_filter+0xfa>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    a9d1:	89 f0                	mov    %esi,%eax
    a9d3:	c1 e0 08             	shl    $0x8,%eax
    a9d6:	89 c2                	mov    %eax,%edx
    a9d8:	8b 45 08             	mov    0x8(%ebp),%eax
    a9db:	01 c2                	add    %eax,%edx
    a9dd:	89 f0                	mov    %esi,%eax
    a9df:	c1 e0 08             	shl    $0x8,%eax
    a9e2:	89 c1                	mov    %eax,%ecx
    a9e4:	8b 45 08             	mov    0x8(%ebp),%eax
    a9e7:	01 c8                	add    %ecx,%eax
    a9e9:	dd 04 d8             	fldl   (%eax,%ebx,8)
    a9ec:	dd 05 90 db 00 00    	fldl   0xdb90
    a9f2:	de e9                	fsubrp %st,%st(1)
    a9f4:	d9 7d e6             	fnstcw -0x1a(%ebp)
    a9f7:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    a9fb:	b4 0c                	mov    $0xc,%ah
    a9fd:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    aa01:	d9 6d e4             	fldcw  -0x1c(%ebp)
    aa04:	db 5d e0             	fistpl -0x20(%ebp)
    aa07:	d9 6d e6             	fldcw  -0x1a(%ebp)
    aa0a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    aa0d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    aa10:	db 45 e0             	fildl  -0x20(%ebp)
    aa13:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    aa16:	89 f0                	mov    %esi,%eax
    aa18:	c1 e0 08             	shl    $0x8,%eax
    aa1b:	89 c2                	mov    %eax,%edx
    aa1d:	8b 45 08             	mov    0x8(%ebp),%eax
    aa20:	01 d0                	add    %edx,%eax
    aa22:	89 f2                	mov    %esi,%edx
    aa24:	89 d1                	mov    %edx,%ecx
    aa26:	c1 e1 08             	shl    $0x8,%ecx
    aa29:	8b 55 08             	mov    0x8(%ebp),%edx
    aa2c:	01 ca                	add    %ecx,%edx
    aa2e:	dd 04 da             	fldl   (%edx,%ebx,8)
    aa31:	dd 05 d8 db 00 00    	fldl   0xdbd8
    aa37:	de c9                	fmulp  %st,%st(1)
    aa39:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    aa3c:	83 c3 01             	add    $0x1,%ebx
    aa3f:	83 fb 1f             	cmp    $0x1f,%ebx
    aa42:	0f 8e f1 fe ff ff    	jle    a939 <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    aa48:	83 c6 01             	add    $0x1,%esi
    aa4b:	83 fe 3f             	cmp    $0x3f,%esi
    aa4e:	0f 8e db fe ff ff    	jle    a92f <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    aa54:	83 c4 1c             	add    $0x1c,%esp
    aa57:	5b                   	pop    %ebx
    aa58:	5e                   	pop    %esi
    aa59:	5f                   	pop    %edi
    aa5a:	5d                   	pop    %ebp
    aa5b:	c3                   	ret    

0000aa5c <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    aa5c:	55                   	push   %ebp
    aa5d:	89 e5                	mov    %esp,%ebp
    aa5f:	57                   	push   %edi
    aa60:	56                   	push   %esi
    aa61:	53                   	push   %ebx
    aa62:	81 ec 14 10 00 00    	sub    $0x1014,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    aa68:	8d 95 e8 ef ff ff    	lea    -0x1018(%ebp),%edx
    aa6e:	bb 40 cb 00 00       	mov    $0xcb40,%ebx
    aa73:	b8 00 04 00 00       	mov    $0x400,%eax
    aa78:	89 d7                	mov    %edx,%edi
    aa7a:	89 de                	mov    %ebx,%esi
    aa7c:	89 c1                	mov    %eax,%ecx
    aa7e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    aa80:	8d 85 e8 ef ff ff    	lea    -0x1018(%ebp),%eax
    aa86:	89 45 ec             	mov    %eax,-0x14(%ebp)
}
    aa89:	81 c4 14 10 00 00    	add    $0x1014,%esp
    aa8f:	5b                   	pop    %ebx
    aa90:	5e                   	pop    %esi
    aa91:	5f                   	pop    %edi
    aa92:	5d                   	pop    %ebp
    aa93:	c3                   	ret    

0000aa94 <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    aa94:	55                   	push   %ebp
    aa95:	89 e5                	mov    %esp,%ebp
    aa97:	57                   	push   %edi
    aa98:	56                   	push   %esi
    aa99:	53                   	push   %ebx
    aa9a:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    aa9d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    aaa4:	a1 88 f7 00 00       	mov    0xf788,%eax
    aaa9:	85 c0                	test   %eax,%eax
    aaab:	74 6f                	je     ab1c <SubBandSynthesis+0x88>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    aaad:	c7 44 24 04 40 db 00 	movl   $0xdb40,0x4(%esp)
    aab4:	00 
    aab5:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    aabc:	e8 15 a8 ff ff       	call   52d6 <mem_alloc>
    aac1:	a3 80 25 01 00       	mov    %eax,0x12580
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    aac6:	c7 44 24 04 43 db 00 	movl   $0xdb43,0x4(%esp)
    aacd:	00 
    aace:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    aad5:	e8 fc a7 ff ff       	call   52d6 <mem_alloc>
    aada:	a3 84 25 01 00       	mov    %eax,0x12584
		create_syn_filter(*filter);
    aadf:	a1 84 25 01 00       	mov    0x12584,%eax
    aae4:	89 04 24             	mov    %eax,(%esp)
    aae7:	e8 30 fe ff ff       	call   a91c <create_syn_filter>
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    aaec:	c7 44 24 04 46 db 00 	movl   $0xdb46,0x4(%esp)
    aaf3:	00 
    aaf4:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    aafb:	e8 d6 a7 ff ff       	call   52d6 <mem_alloc>
    ab00:	a3 88 25 01 00       	mov    %eax,0x12588
		read_syn_window(window);
    ab05:	a1 88 25 01 00       	mov    0x12588,%eax
    ab0a:	89 04 24             	mov    %eax,(%esp)
    ab0d:	e8 4a ff ff ff       	call   aa5c <read_syn_window>
		init = 0;
    ab12:	c7 05 88 f7 00 00 00 	movl   $0x0,0xf788
    ab19:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    ab1c:	8b 45 0c             	mov    0xc(%ebp),%eax
    ab1f:	8b 04 85 8c f7 00 00 	mov    0xf78c(,%eax,4),%eax
    ab26:	83 e8 40             	sub    $0x40,%eax
    ab29:	25 ff 03 00 00       	and    $0x3ff,%eax
    ab2e:	89 c2                	mov    %eax,%edx
    ab30:	8b 45 0c             	mov    0xc(%ebp),%eax
    ab33:	89 14 85 8c f7 00 00 	mov    %edx,0xf78c(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    ab3a:	8b 15 80 25 01 00    	mov    0x12580,%edx
    ab40:	8b 45 0c             	mov    0xc(%ebp),%eax
    ab43:	8b 04 85 8c f7 00 00 	mov    0xf78c(,%eax,4),%eax
    ab4a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    ab4d:	c1 e1 0a             	shl    $0xa,%ecx
    ab50:	01 c8                	add    %ecx,%eax
    ab52:	c1 e0 03             	shl    $0x3,%eax
    ab55:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    ab58:	bb 00 00 00 00       	mov    $0x0,%ebx
    ab5d:	eb 40                	jmp    ab9f <SubBandSynthesis+0x10b>
		sum = 0;
    ab5f:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    ab61:	be 00 00 00 00       	mov    $0x0,%esi
    ab66:	eb 26                	jmp    ab8e <SubBandSynthesis+0xfa>
			sum += bandPtr[k] * (*filter)[i][k];
    ab68:	89 f0                	mov    %esi,%eax
    ab6a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    ab71:	8b 45 08             	mov    0x8(%ebp),%eax
    ab74:	01 d0                	add    %edx,%eax
    ab76:	dd 00                	fldl   (%eax)
    ab78:	a1 84 25 01 00       	mov    0x12584,%eax
    ab7d:	89 da                	mov    %ebx,%edx
    ab7f:	c1 e2 05             	shl    $0x5,%edx
    ab82:	01 f2                	add    %esi,%edx
    ab84:	dd 04 d0             	fldl   (%eax,%edx,8)
    ab87:	de c9                	fmulp  %st,%st(1)
    ab89:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    ab8b:	83 c6 01             	add    $0x1,%esi
    ab8e:	83 fe 1f             	cmp    $0x1f,%esi
    ab91:	7e d5                	jle    ab68 <SubBandSynthesis+0xd4>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    ab93:	89 d8                	mov    %ebx,%eax
    ab95:	c1 e0 03             	shl    $0x3,%eax
    ab98:	01 f8                	add    %edi,%eax
    ab9a:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    ab9c:	83 c3 01             	add    $0x1,%ebx
    ab9f:	83 fb 3f             	cmp    $0x3f,%ebx
    aba2:	7e bb                	jle    ab5f <SubBandSynthesis+0xcb>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    aba4:	bf 00 00 00 00       	mov    $0x0,%edi
    aba9:	e9 c7 00 00 00       	jmp    ac75 <SubBandSynthesis+0x1e1>
		sum = 0;
    abae:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    abb0:	bb 00 00 00 00       	mov    $0x0,%ebx
    abb5:	eb 4c                	jmp    ac03 <SubBandSynthesis+0x16f>
			k = j + (i<<5);
    abb7:	89 d8                	mov    %ebx,%eax
    abb9:	c1 e0 05             	shl    $0x5,%eax
    abbc:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    abbf:	a1 88 25 01 00       	mov    0x12588,%eax
    abc4:	89 f2                	mov    %esi,%edx
    abc6:	c1 e2 03             	shl    $0x3,%edx
    abc9:	01 d0                	add    %edx,%eax
    abcb:	dd 00                	fldl   (%eax)
    abcd:	a1 80 25 01 00       	mov    0x12580,%eax
    abd2:	8d 53 01             	lea    0x1(%ebx),%edx
    abd5:	d1 fa                	sar    %edx
    abd7:	c1 e2 06             	shl    $0x6,%edx
    abda:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    abdd:	8b 55 0c             	mov    0xc(%ebp),%edx
    abe0:	8b 14 95 8c f7 00 00 	mov    0xf78c(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    abe7:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    abe9:	89 d1                	mov    %edx,%ecx
    abeb:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    abf1:	8b 55 0c             	mov    0xc(%ebp),%edx
    abf4:	c1 e2 0a             	shl    $0xa,%edx
    abf7:	01 ca                	add    %ecx,%edx
    abf9:	dd 04 d0             	fldl   (%eax,%edx,8)
    abfc:	de c9                	fmulp  %st,%st(1)
    abfe:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    ac00:	83 c3 01             	add    $0x1,%ebx
    ac03:	83 fb 0f             	cmp    $0xf,%ebx
    ac06:	7e af                	jle    abb7 <SubBandSynthesis+0x123>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    ac08:	dd 05 e0 db 00 00    	fldl   0xdbe0
    ac0e:	de c9                	fmulp  %st,%st(1)
    ac10:	d9 7d d6             	fnstcw -0x2a(%ebp)
    ac13:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    ac17:	b4 0c                	mov    $0xc,%ah
    ac19:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    ac1d:	d9 6d d4             	fldcw  -0x2c(%ebp)
    ac20:	db 5d e0             	fistpl -0x20(%ebp)
    ac23:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    ac26:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    ac2d:	7e 15                	jle    ac44 <SubBandSynthesis+0x1b0>
    ac2f:	89 f8                	mov    %edi,%eax
    ac31:	8d 14 00             	lea    (%eax,%eax,1),%edx
    ac34:	8b 45 10             	mov    0x10(%ebp),%eax
    ac37:	01 d0                	add    %edx,%eax
    ac39:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    ac3e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    ac42:	eb 2e                	jmp    ac72 <SubBandSynthesis+0x1de>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    ac44:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    ac4b:	7d 15                	jge    ac62 <SubBandSynthesis+0x1ce>
    ac4d:	89 f8                	mov    %edi,%eax
    ac4f:	8d 14 00             	lea    (%eax,%eax,1),%edx
    ac52:	8b 45 10             	mov    0x10(%ebp),%eax
    ac55:	01 d0                	add    %edx,%eax
    ac57:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    ac5c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    ac60:	eb 10                	jmp    ac72 <SubBandSynthesis+0x1de>
			else                           samples[j] = foo;
    ac62:	89 f8                	mov    %edi,%eax
    ac64:	8d 14 00             	lea    (%eax,%eax,1),%edx
    ac67:	8b 45 10             	mov    0x10(%ebp),%eax
    ac6a:	01 c2                	add    %eax,%edx
    ac6c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    ac6f:	66 89 02             	mov    %ax,(%edx)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    ac72:	83 c7 01             	add    $0x1,%edi
    ac75:	83 ff 1f             	cmp    $0x1f,%edi
    ac78:	0f 8e 30 ff ff ff    	jle    abae <SubBandSynthesis+0x11a>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    ac7e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    ac81:	83 c4 2c             	add    $0x2c,%esp
    ac84:	5b                   	pop    %ebx
    ac85:	5e                   	pop    %esi
    ac86:	5f                   	pop    %edi
    ac87:	5d                   	pop    %ebp
    ac88:	c3                   	ret    

0000ac89 <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    ac89:	55                   	push   %ebp
    ac8a:	89 e5                	mov    %esp,%ebp
    ac8c:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    ac8f:	8b 45 10             	mov    0x10(%ebp),%eax
    ac92:	8b 40 08             	mov    0x8(%eax),%eax
    ac95:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    ac98:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    ac9f:	eb 75                	jmp    ad16 <out_fifo+0x8d>
    aca1:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    aca8:	eb 62                	jmp    ad0c <out_fifo+0x83>
            (*psampFrames)++;
    acaa:	8b 45 14             	mov    0x14(%ebp),%eax
    acad:	8b 00                	mov    (%eax),%eax
    acaf:	8d 50 01             	lea    0x1(%eax),%edx
    acb2:	8b 45 14             	mov    0x14(%ebp),%eax
    acb5:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    acb7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    acbe:	eb 40                	jmp    ad00 <out_fifo+0x77>
                if (!(k%1600) && k) {
    acc0:	8b 0d 8c 25 01 00    	mov    0x1258c,%ecx
    acc6:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    accb:	89 c8                	mov    %ecx,%eax
    accd:	f7 ea                	imul   %edx
    accf:	c1 fa 09             	sar    $0x9,%edx
    acd2:	89 c8                	mov    %ecx,%eax
    acd4:	c1 f8 1f             	sar    $0x1f,%eax
    acd7:	29 c2                	sub    %eax,%edx
    acd9:	89 d0                	mov    %edx,%eax
    acdb:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    ace1:	29 c1                	sub    %eax,%ecx
    ace3:	89 c8                	mov    %ecx,%eax
    ace5:	85 c0                	test   %eax,%eax
    ace7:	75 13                	jne    acfc <out_fifo+0x73>
    ace9:	a1 8c 25 01 00       	mov    0x1258c,%eax
    acee:	85 c0                	test   %eax,%eax
    acf0:	74 0a                	je     acfc <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    acf2:	c7 05 8c 25 01 00 00 	movl   $0x0,0x1258c
    acf9:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    acfc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ad00:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ad03:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    ad06:	7c b8                	jl     acc0 <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    ad08:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    ad0c:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    ad10:	7e 98                	jle    acaa <out_fifo+0x21>
    ad12:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    ad16:	8b 45 fc             	mov    -0x4(%ebp),%eax
    ad19:	3b 45 0c             	cmp    0xc(%ebp),%eax
    ad1c:	7c 83                	jl     aca1 <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    ad1e:	c9                   	leave  
    ad1f:	c3                   	ret    

0000ad20 <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    ad20:	55                   	push   %ebp
    ad21:	89 e5                	mov    %esp,%ebp
    ad23:	83 ec 18             	sub    $0x18,%esp
    *old_crc = getbits(bs, 16);
    ad26:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
    ad2d:	00 
    ad2e:	8b 45 08             	mov    0x8(%ebp),%eax
    ad31:	89 04 24             	mov    %eax,(%esp)
    ad34:	e8 8b a8 ff ff       	call   55c4 <getbits>
    ad39:	8b 55 0c             	mov    0xc(%ebp),%edx
    ad3c:	89 02                	mov    %eax,(%edx)
}
    ad3e:	c9                   	leave  
    ad3f:	c3                   	ret    

0000ad40 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    ad40:	55                   	push   %ebp
    ad41:	89 e5                	mov    %esp,%ebp
    ad43:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    ad46:	8b 45 08             	mov    0x8(%ebp),%eax
    ad49:	8b 40 0c             	mov    0xc(%eax),%eax
    ad4c:	83 c0 1e             	add    $0x1e,%eax
    ad4f:	8b 14 85 e0 f2 00 00 	mov    0xf2e0(,%eax,4),%edx
    ad56:	89 d0                	mov    %edx,%eax
    ad58:	c1 e0 03             	shl    $0x3,%eax
    ad5b:	01 d0                	add    %edx,%eax
    ad5d:	c1 e0 04             	shl    $0x4,%eax
			/ s_freq[fr_ps.header->sampling_frequency];
    ad60:	89 45 ec             	mov    %eax,-0x14(%ebp)
    ad63:	db 45 ec             	fildl  -0x14(%ebp)
    ad66:	8b 45 08             	mov    0x8(%ebp),%eax
    ad69:	8b 40 10             	mov    0x10(%eax),%eax
    ad6c:	dd 04 c5 a0 f3 00 00 	fldl   0xf3a0(,%eax,8)
    ad73:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    ad75:	d9 7d ea             	fnstcw -0x16(%ebp)
    ad78:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    ad7c:	b4 0c                	mov    $0xc,%ah
    ad7e:	66 89 45 e8          	mov    %ax,-0x18(%ebp)
    ad82:	d9 6d e8             	fldcw  -0x18(%ebp)
    ad85:	db 5d fc             	fistpl -0x4(%ebp)
    ad88:	d9 6d ea             	fldcw  -0x16(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    ad8b:	8b 45 08             	mov    0x8(%ebp),%eax
    ad8e:	8b 40 14             	mov    0x14(%eax),%eax
    ad91:	85 c0                	test   %eax,%eax
    ad93:	74 04                	je     ad99 <main_data_slots+0x59>
    ad95:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    ad99:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    ad9d:	8b 45 08             	mov    0x8(%ebp),%eax
    ada0:	8b 40 08             	mov    0x8(%eax),%eax
    ada3:	85 c0                	test   %eax,%eax
    ada5:	74 04                	je     adab <main_data_slots+0x6b>
		nSlots -= 2;
    ada7:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    adab:	8b 45 10             	mov    0x10(%ebp),%eax
    adae:	83 f8 01             	cmp    $0x1,%eax
    adb1:	75 06                	jne    adb9 <main_data_slots+0x79>
		nSlots -= 17;
    adb3:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    adb7:	eb 04                	jmp    adbd <main_data_slots+0x7d>
	else
		nSlots -=32;
    adb9:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    adbd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    adc0:	c9                   	leave  
    adc1:	c3                   	ret    
