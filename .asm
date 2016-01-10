
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
       e:	e8 3b 46 00 00       	call   464e <malloc>
      13:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
      16:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
      1d:	e8 2c 46 00 00       	call   464e <malloc>
      22:	8b 55 f4             	mov    -0xc(%ebp),%edx
      25:	89 42 14             	mov    %eax,0x14(%edx)
	strcpy(temp->name, name);
      28:	8b 45 f4             	mov    -0xc(%ebp),%eax
      2b:	8b 40 14             	mov    0x14(%eax),%eax
      2e:	8b 55 1c             	mov    0x1c(%ebp),%edx
      31:	89 54 24 04          	mov    %edx,0x4(%esp)
      35:	89 04 24             	mov    %eax,(%esp)
      38:	e8 fa 3e 00 00       	call   3f37 <strcpy>
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
      5d:	8b 15 68 f2 00 00    	mov    0xf268,%edx
      63:	8b 5d f4             	mov    -0xc(%ebp),%ebx
      66:	8d 45 d8             	lea    -0x28(%ebp),%eax
      69:	89 54 24 10          	mov    %edx,0x10(%esp)
      6d:	8b 15 50 20 01 00    	mov    0x12050,%edx
      73:	89 54 24 04          	mov    %edx,0x4(%esp)
      77:	8b 15 54 20 01 00    	mov    0x12054,%edx
      7d:	89 54 24 08          	mov    %edx,0x8(%esp)
      81:	8b 15 58 20 01 00    	mov    0x12058,%edx
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
      ae:	8b 15 64 f2 00 00    	mov    0xf264,%edx
      b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
      b7:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
      ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
      bd:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
      c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
      c7:	a3 64 f2 00 00       	mov    %eax,0xf264
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
      d7:	a1 64 f2 00 00       	mov    0xf264,%eax
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
      f9:	e8 17 44 00 00       	call   4515 <free>
		free(temp);
      fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
     101:	89 04 24             	mov    %eax,(%esp)
     104:	e8 0c 44 00 00       	call   4515 <free>
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
     10f:	c7 05 64 f2 00 00 00 	movl   $0x0,0xf264
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
     127:	e8 7a 3e 00 00       	call   3fa6 <strlen>
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
     1bb:	c7 05 68 f2 00 00 00 	movl   $0x0,0xf268
     1c2:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     1c5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     1cc:	00 
     1cd:	8b 45 08             	mov    0x8(%ebp),%eax
     1d0:	89 04 24             	mov    %eax,(%esp)
     1d3:	e8 e2 3f 00 00       	call   41ba <open>
     1d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     1db:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     1df:	79 20                	jns    201 <list+0x52>
		printf(2, "ls: cannot open %s\n", path);
     1e1:	8b 45 08             	mov    0x8(%ebp),%eax
     1e4:	89 44 24 08          	mov    %eax,0x8(%esp)
     1e8:	c7 44 24 04 e0 a9 00 	movl   $0xa9e0,0x4(%esp)
     1ef:	00 
     1f0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     1f7:	e8 66 41 00 00       	call   4362 <printf>
		return;
     1fc:	e9 8f 02 00 00       	jmp    490 <list+0x2e1>
	}

	if (fstat(fd, &st) < 0) {
     201:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     207:	89 44 24 04          	mov    %eax,0x4(%esp)
     20b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     20e:	89 04 24             	mov    %eax,(%esp)
     211:	e8 bc 3f 00 00       	call   41d2 <fstat>
     216:	85 c0                	test   %eax,%eax
     218:	79 2b                	jns    245 <list+0x96>
		printf(2, "ls: cannot stat %s\n", path);
     21a:	8b 45 08             	mov    0x8(%ebp),%eax
     21d:	89 44 24 08          	mov    %eax,0x8(%esp)
     221:	c7 44 24 04 f4 a9 00 	movl   $0xa9f4,0x4(%esp)
     228:	00 
     229:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     230:	e8 2d 41 00 00       	call   4362 <printf>
		close(fd);
     235:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     238:	89 04 24             	mov    %eax,(%esp)
     23b:	e8 62 3f 00 00       	call   41a2 <close>
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
     28c:	c7 44 24 04 08 aa 00 	movl   $0xaa08,0x4(%esp)
     293:	00 
     294:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     29b:	e8 c2 40 00 00       	call   4362 <printf>
		break;
     2a0:	e9 e0 01 00 00       	jmp    485 <list+0x2d6>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     2a5:	8b 45 08             	mov    0x8(%ebp),%eax
     2a8:	89 04 24             	mov    %eax,(%esp)
     2ab:	e8 f6 3c 00 00       	call   3fa6 <strlen>
     2b0:	83 c0 10             	add    $0x10,%eax
     2b3:	3d 00 02 00 00       	cmp    $0x200,%eax
     2b8:	76 19                	jbe    2d3 <list+0x124>
			printf(1, "ls: path too long\n");
     2ba:	c7 44 24 04 15 aa 00 	movl   $0xaa15,0x4(%esp)
     2c1:	00 
     2c2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     2c9:	e8 94 40 00 00       	call   4362 <printf>
			break;
     2ce:	e9 b2 01 00 00       	jmp    485 <list+0x2d6>
		}
		strcpy(buf, path);
     2d3:	8b 45 08             	mov    0x8(%ebp),%eax
     2d6:	89 44 24 04          	mov    %eax,0x4(%esp)
     2da:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2e0:	89 04 24             	mov    %eax,(%esp)
     2e3:	e8 4f 3c 00 00       	call   3f37 <strcpy>
		p = buf + strlen(buf);
     2e8:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2ee:	89 04 24             	mov    %eax,(%esp)
     2f1:	e8 b0 3c 00 00       	call   3fa6 <strlen>
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
     33e:	e8 f2 3d 00 00       	call   4135 <memmove>
			p[DIRSIZ] = 0;
     343:	8b 45 e0             	mov    -0x20(%ebp),%eax
     346:	83 c0 0e             	add    $0xe,%eax
     349:	c6 00 00             	movb   $0x0,(%eax)
			if (stat(buf, &st) < 0) {
     34c:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     352:	89 44 24 04          	mov    %eax,0x4(%esp)
     356:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     35c:	89 04 24             	mov    %eax,(%esp)
     35f:	e8 36 3d 00 00       	call   409a <stat>
     364:	85 c0                	test   %eax,%eax
     366:	79 23                	jns    38b <list+0x1dc>
				printf(1, "ls: cannot stat %s\n", buf);
     368:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     36e:	89 44 24 08          	mov    %eax,0x8(%esp)
     372:	c7 44 24 04 f4 a9 00 	movl   $0xa9f4,0x4(%esp)
     379:	00 
     37a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     381:	e8 dc 3f 00 00       	call   4362 <printf>
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
     3b7:	8b 15 68 f2 00 00    	mov    0xf268,%edx
     3bd:	8d 45 d0             	lea    -0x30(%ebp),%eax
     3c0:	89 54 24 10          	mov    %edx,0x10(%esp)
     3c4:	8b 15 50 20 01 00    	mov    0x12050,%edx
     3ca:	89 54 24 04          	mov    %edx,0x4(%esp)
     3ce:	8b 15 54 20 01 00    	mov    0x12054,%edx
     3d4:	89 54 24 08          	mov    %edx,0x8(%esp)
     3d8:	8b 15 58 20 01 00    	mov    0x12058,%edx
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
     451:	a1 68 f2 00 00       	mov    0xf268,%eax
     456:	83 c0 01             	add    $0x1,%eax
     459:	a3 68 f2 00 00       	mov    %eax,0xf268
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
     476:	e8 17 3d 00 00       	call   4192 <read>
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
     48b:	e8 12 3d 00 00       	call   41a2 <close>
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
     4f1:	e8 1c 1f 00 00       	call   2412 <fill_rect>
	}
	if (style == ICON_STYLE) {
     4f6:	a1 24 ea 00 00       	mov    0xea24,%eax
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
     52b:	a1 68 ea 00 00       	mov    0xea68,%eax
     530:	89 44 24 0c          	mov    %eax,0xc(%esp)
     534:	a1 6c ea 00 00       	mov    0xea6c,%eax
     539:	89 44 24 10          	mov    %eax,0x10(%esp)
     53d:	a1 70 ea 00 00       	mov    0xea70,%eax
     542:	89 44 24 14          	mov    %eax,0x14(%esp)
     546:	8b 45 08             	mov    0x8(%ebp),%eax
     549:	89 04 24             	mov    %eax,(%esp)
     54c:	8b 45 0c             	mov    0xc(%ebp),%eax
     54f:	89 44 24 04          	mov    %eax,0x4(%esp)
     553:	8b 45 10             	mov    0x10(%ebp),%eax
     556:	89 44 24 08          	mov    %eax,0x8(%esp)
     55a:	e8 52 25 00 00       	call   2ab1 <draw_picture>
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
     575:	a1 d0 ea 00 00       	mov    0xead0,%eax
     57a:	89 44 24 0c          	mov    %eax,0xc(%esp)
     57e:	a1 d4 ea 00 00       	mov    0xead4,%eax
     583:	89 44 24 10          	mov    %eax,0x10(%esp)
     587:	a1 d8 ea 00 00       	mov    0xead8,%eax
     58c:	89 44 24 14          	mov    %eax,0x14(%esp)
     590:	8b 45 08             	mov    0x8(%ebp),%eax
     593:	89 04 24             	mov    %eax,(%esp)
     596:	8b 45 0c             	mov    0xc(%ebp),%eax
     599:	89 44 24 04          	mov    %eax,0x4(%esp)
     59d:	8b 45 10             	mov    0x10(%ebp),%eax
     5a0:	89 44 24 08          	mov    %eax,0x8(%esp)
     5a4:	e8 08 25 00 00       	call   2ab1 <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     5a9:	90                   	nop
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
     5aa:	8b 45 14             	mov    0x14(%ebp),%eax
     5ad:	89 04 24             	mov    %eax,(%esp)
     5b0:	e8 f1 39 00 00       	call   3fa6 <strlen>
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
     60d:	e8 df 23 00 00       	call   29f1 <puts_str>
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
     642:	a1 9c ea 00 00       	mov    0xea9c,%eax
     647:	89 44 24 0c          	mov    %eax,0xc(%esp)
     64b:	a1 a0 ea 00 00       	mov    0xeaa0,%eax
     650:	89 44 24 10          	mov    %eax,0x10(%esp)
     654:	a1 a4 ea 00 00       	mov    0xeaa4,%eax
     659:	89 44 24 14          	mov    %eax,0x14(%esp)
     65d:	8b 45 08             	mov    0x8(%ebp),%eax
     660:	89 04 24             	mov    %eax,(%esp)
     663:	8b 45 0c             	mov    0xc(%ebp),%eax
     666:	89 44 24 04          	mov    %eax,0x4(%esp)
     66a:	8b 45 10             	mov    0x10(%ebp),%eax
     66d:	89 44 24 08          	mov    %eax,0x8(%esp)
     671:	e8 3b 24 00 00       	call   2ab1 <draw_picture>
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
     6be:	e8 2e 23 00 00       	call   29f1 <puts_str>
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
     6d9:	a1 04 eb 00 00       	mov    0xeb04,%eax
     6de:	89 44 24 0c          	mov    %eax,0xc(%esp)
     6e2:	a1 08 eb 00 00       	mov    0xeb08,%eax
     6e7:	89 44 24 10          	mov    %eax,0x10(%esp)
     6eb:	a1 0c eb 00 00       	mov    0xeb0c,%eax
     6f0:	89 44 24 14          	mov    %eax,0x14(%esp)
     6f4:	8b 45 08             	mov    0x8(%ebp),%eax
     6f7:	89 04 24             	mov    %eax,(%esp)
     6fa:	8b 45 0c             	mov    0xc(%ebp),%eax
     6fd:	89 44 24 04          	mov    %eax,0x4(%esp)
     701:	8b 45 10             	mov    0x10(%ebp),%eax
     704:	89 44 24 08          	mov    %eax,0x8(%esp)
     708:	e8 a4 23 00 00       	call   2ab1 <draw_picture>
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
     745:	e8 a7 22 00 00       	call   29f1 <puts_str>
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
     75e:	e8 eb 3e 00 00       	call   464e <malloc>
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
		4 * BUTTON_WIDTH + 200, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "up1.bmp",
		5 * BUTTON_WIDTH + 200, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
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
     8f5:	e8 8d 22 00 00       	call   2b87 <draw_line>
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
     93c:	e8 46 22 00 00       	call   2b87 <draw_line>
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
     983:	e8 ff 21 00 00       	call   2b87 <draw_line>
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
     9c6:	e8 bc 21 00 00       	call   2b87 <draw_line>
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
     a09:	e8 04 1a 00 00       	call   2412 <fill_rect>
			TOOLSBAR_COLOR);
	puts_str(context, "Finder", 0, WINDOW_WIDTH / 2, 3);
     a0e:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
     a15:	00 
     a16:	c7 44 24 14 2c 01 00 	movl   $0x12c,0x14(%esp)
     a1d:	00 
     a1e:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     a25:	00 
     a26:	c7 44 24 0c 28 aa 00 	movl   $0xaa28,0xc(%esp)
     a2d:	00 
     a2e:	8b 45 08             	mov    0x8(%ebp),%eax
     a31:	89 04 24             	mov    %eax,(%esp)
     a34:	8b 45 0c             	mov    0xc(%ebp),%eax
     a37:	89 44 24 04          	mov    %eax,0x4(%esp)
     a3b:	8b 45 10             	mov    0x10(%ebp),%eax
     a3e:	89 44 24 08          	mov    %eax,0x8(%esp)
     a42:	e8 aa 1f 00 00       	call   29f1 <puts_str>
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     a47:	c7 44 24 10 0a 00 00 	movl   $0xa,0x10(%esp)
     a4e:	00 
     a4f:	c7 44 24 0c 20 eb 00 	movl   $0xeb20,0xc(%esp)
     a56:	00 
     a57:	8b 45 08             	mov    0x8(%ebp),%eax
     a5a:	89 04 24             	mov    %eax,(%esp)
     a5d:	8b 45 0c             	mov    0xc(%ebp),%eax
     a60:	89 44 24 04          	mov    %eax,0x4(%esp)
     a64:	8b 45 10             	mov    0x10(%ebp),%eax
     a67:	89 44 24 08          	mov    %eax,0x8(%esp)
     a6b:	e8 f2 24 00 00       	call   2f62 <draw_iconlist>


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
     a7f:	a1 24 ea 00 00       	mov    0xea24,%eax
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
     ad0:	e8 3d 19 00 00       	call   2412 <fill_rect>
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
     b17:	e8 6b 20 00 00       	call   2b87 <draw_line>
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);

	//printf(0, "listing complete!\n");
	//printItemList();
	p = fileItemList;
     b1c:	a1 64 f2 00 00       	mov    0xf264,%eax
     b21:	89 45 f4             	mov    %eax,-0xc(%ebp)
	itemCounter = 0;
     b24:	c7 05 68 f2 00 00 00 	movl   $0x0,0xf268
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
     bb0:	a1 24 ea 00 00       	mov    0xea24,%eax
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
     bfa:	e8 13 18 00 00       	call   2412 <fill_rect>
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
     c3b:	e8 d2 17 00 00       	call   2412 <fill_rect>
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
     c80:	e8 8d 17 00 00       	call   2412 <fill_rect>
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     c85:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     c8c:	00 
     c8d:	c7 44 24 14 2b 00 00 	movl   $0x2b,0x14(%esp)
     c94:	00 
     c95:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     c9c:	00 
     c9d:	c7 44 24 0c 2f aa 00 	movl   $0xaa2f,0xc(%esp)
     ca4:	00 
     ca5:	8b 45 08             	mov    0x8(%ebp),%eax
     ca8:	89 04 24             	mov    %eax,(%esp)
     cab:	8b 45 0c             	mov    0xc(%ebp),%eax
     cae:	89 44 24 04          	mov    %eax,0x4(%esp)
     cb2:	8b 45 10             	mov    0x10(%ebp),%eax
     cb5:	89 44 24 08          	mov    %eax,0x8(%esp)
     cb9:	e8 33 1d 00 00       	call   29f1 <puts_str>
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     cbe:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     cc5:	00 
     cc6:	c7 44 24 14 cb 00 00 	movl   $0xcb,0x14(%esp)
     ccd:	00 
     cce:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     cd5:	00 
     cd6:	c7 44 24 0c 34 aa 00 	movl   $0xaa34,0xc(%esp)
     cdd:	00 
     cde:	8b 45 08             	mov    0x8(%ebp),%eax
     ce1:	89 04 24             	mov    %eax,(%esp)
     ce4:	8b 45 0c             	mov    0xc(%ebp),%eax
     ce7:	89 44 24 04          	mov    %eax,0x4(%esp)
     ceb:	8b 45 10             	mov    0x10(%ebp),%eax
     cee:	89 44 24 08          	mov    %eax,0x8(%esp)
     cf2:	e8 fa 1c 00 00       	call   29f1 <puts_str>
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
     d0e:	e8 3b 39 00 00       	call   464e <malloc>
     d13:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
     d16:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     d1d:	e8 2c 39 00 00       	call   464e <malloc>
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
     dcf:	e8 41 37 00 00       	call   4515 <free>
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
     de3:	a1 64 f2 00 00       	mov    0xf264,%eax
     de8:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     deb:	eb 27                	jmp    e14 <printItemList+0x37>
		printf(0, "%s\n", p->name);
     ded:	8b 45 f4             	mov    -0xc(%ebp),%eax
     df0:	8b 40 14             	mov    0x14(%eax),%eax
     df3:	89 44 24 08          	mov    %eax,0x8(%esp)
     df7:	c7 44 24 04 39 aa 00 	movl   $0xaa39,0x4(%esp)
     dfe:	00 
     dff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e06:	e8 57 35 00 00       	call   4362 <printf>
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
     e22:	a1 24 ea 00 00       	mov    0xea24,%eax
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
     e7a:	8b 15 60 f2 00 00    	mov    0xf260,%edx
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
     ea6:	e8 b1 29 00 00       	call   385c <initRect>
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
     ec0:	a1 60 f2 00 00       	mov    0xf260,%eax
     ec5:	01 c2                	add    %eax,%edx
     ec7:	8b 45 08             	mov    0x8(%ebp),%eax
     eca:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
     ed1:	00 
     ed2:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     ed6:	89 54 24 08          	mov    %edx,0x8(%esp)
     eda:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     ee1:	00 
     ee2:	89 04 24             	mov    %eax,(%esp)
     ee5:	e8 72 29 00 00       	call   385c <initRect>
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
     efa:	a1 24 ea 00 00       	mov    0xea24,%eax
     eff:	83 f8 01             	cmp    $0x1,%eax
     f02:	75 0d                	jne    f11 <addItemEvent+0x1d>
		if (item.pos.start.y <= TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)
     f04:	8b 45 28             	mov    0x28(%ebp),%eax
     f07:	83 f8 46             	cmp    $0x46,%eax
     f0a:	7f 12                	jg     f1e <addItemEvent+0x2a>
			return;
     f0c:	e9 e0 00 00 00       	jmp    ff1 <addItemEvent+0xfd>
	} else {
		if (item.pos.start.y <= TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)
     f11:	8b 45 28             	mov    0x28(%ebp),%eax
     f14:	83 f8 62             	cmp    $0x62,%eax
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
     f31:	c7 44 24 18 bc 1b 00 	movl   $0x1bbc,0x18(%esp)
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
     f63:	e8 e0 29 00 00       	call   3948 <createClickable>
		break;
     f68:	e9 84 00 00 00       	jmp    ff1 <addItemEvent+0xfd>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     f6d:	c7 44 24 18 bc 1b 00 	movl   $0x1bbc,0x18(%esp)
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
     f9f:	e8 a4 29 00 00       	call   3948 <createClickable>
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_enterDir);
     fa4:	c7 44 24 18 2a 14 00 	movl   $0x142a,0x18(%esp)
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
     fd6:	e8 6d 29 00 00       	call   3948 <createClickable>
		break;
     fdb:	eb 14                	jmp    ff1 <addItemEvent+0xfd>
	default:
		printf(0, "unknown file type!");
     fdd:	c7 44 24 04 3d aa 00 	movl   $0xaa3d,0x4(%esp)
     fe4:	00 
     fe5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     fec:	e8 71 33 00 00       	call   4362 <printf>
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
     ff9:	a1 64 f2 00 00       	mov    0xf264,%eax
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
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp };

void addWndEvent(ClickableManager *cm) {
    107b:	55                   	push   %ebp
    107c:	89 e5                	mov    %esp,%ebp
    107e:	57                   	push   %edi
    107f:	56                   	push   %esi
    1080:	53                   	push   %ebx
    1081:	83 ec 4c             	sub    $0x4c,%esp
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
    1084:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
	for (i = 0; i < n; i++) {
    108b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1092:	e9 96 00 00 00       	jmp    112d <addWndEvent+0xb2>
		createClickable(cm,
    1097:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    109a:	8b 1c 85 40 ed 00 00 	mov    0xed40(,%eax,4),%ebx
    10a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10a4:	6b c0 34             	imul   $0x34,%eax,%eax
    10a7:	05 40 eb 00 00       	add    $0xeb40,%eax
    10ac:	8b 78 10             	mov    0x10(%eax),%edi
    10af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10b2:	6b c0 34             	imul   $0x34,%eax,%eax
    10b5:	05 40 eb 00 00       	add    $0xeb40,%eax
    10ba:	8b 70 0c             	mov    0xc(%eax),%esi
    10bd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10c0:	6b c0 34             	imul   $0x34,%eax,%eax
    10c3:	05 40 eb 00 00       	add    $0xeb40,%eax
    10c8:	8b 48 04             	mov    0x4(%eax),%ecx
    10cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10ce:	6b c0 34             	imul   $0x34,%eax,%eax
    10d1:	05 40 eb 00 00       	add    $0xeb40,%eax
    10d6:	8b 10                	mov    (%eax),%edx
    10d8:	8d 45 d0             	lea    -0x30(%ebp),%eax
    10db:	89 7c 24 10          	mov    %edi,0x10(%esp)
    10df:	89 74 24 0c          	mov    %esi,0xc(%esp)
    10e3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    10e7:	89 54 24 04          	mov    %edx,0x4(%esp)
    10eb:	89 04 24             	mov    %eax,(%esp)
    10ee:	e8 69 27 00 00       	call   385c <initRect>
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
    1124:	e8 1f 28 00 00       	call   3948 <createClickable>
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp };

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
    1147:	a1 64 f2 00 00       	mov    0xf264,%eax
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
    117d:	e8 35 27 00 00       	call   38b7 <isIn>
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
    11a4:	83 ec 18             	sub    $0x18,%esp
//	while (q != 0)
//	{
//		p = q;
//		q = q->next;
//	}
	printf(0, "tryingToScrollDown, current Offset %d\n", scrollOffset);
    11a7:	a1 60 f2 00 00       	mov    0xf260,%eax
    11ac:	89 44 24 08          	mov    %eax,0x8(%esp)
    11b0:	c7 44 24 04 50 aa 00 	movl   $0xaa50,0x4(%esp)
    11b7:	00 
    11b8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11bf:	e8 9e 31 00 00       	call   4362 <printf>
	scrollOffset -= SCROLL_UNIT;
    11c4:	a1 60 f2 00 00       	mov    0xf260,%eax
    11c9:	83 e8 1e             	sub    $0x1e,%eax
    11cc:	a3 60 f2 00 00       	mov    %eax,0xf260
	printf(0, "scrollDown, current Offset %d\n", scrollOffset);
    11d1:	a1 60 f2 00 00       	mov    0xf260,%eax
    11d6:	89 44 24 08          	mov    %eax,0x8(%esp)
    11da:	c7 44 24 04 78 aa 00 	movl   $0xaa78,0x4(%esp)
    11e1:	00 
    11e2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11e9:	e8 74 31 00 00       	call   4362 <printf>
}
    11ee:	c9                   	leave  
    11ef:	c3                   	ret    

000011f0 <h_scrollDown>:

void h_scrollDown(Point p) {
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	83 ec 38             	sub    $0x38,%esp
	scrollDown();
    11f6:	e8 a6 ff ff ff       	call   11a1 <scrollDown>
	freeFileItemList();
    11fb:	e8 d1 ee ff ff       	call   d1 <freeFileItemList>
	list(".");
    1200:	c7 04 24 97 aa 00 00 	movl   $0xaa97,(%esp)
    1207:	e8 a3 ef ff ff       	call   1af <list>
	drawFinderContent(context);
    120c:	a1 50 20 01 00       	mov    0x12050,%eax
    1211:	89 04 24             	mov    %eax,(%esp)
    1214:	a1 54 20 01 00       	mov    0x12054,%eax
    1219:	89 44 24 04          	mov    %eax,0x4(%esp)
    121d:	a1 58 20 01 00       	mov    0x12058,%eax
    1222:	89 44 24 08          	mov    %eax,0x8(%esp)
    1226:	e8 47 f8 ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    122b:	a1 50 20 01 00       	mov    0x12050,%eax
    1230:	89 04 24             	mov    %eax,(%esp)
    1233:	a1 54 20 01 00       	mov    0x12054,%eax
    1238:	89 44 24 04          	mov    %eax,0x4(%esp)
    123c:	a1 58 20 01 00       	mov    0x12058,%eax
    1241:	89 44 24 08          	mov    %eax,0x8(%esp)
    1245:	e8 67 f6 ff ff       	call   8b1 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    124a:	8d 45 e8             	lea    -0x18(%ebp),%eax
    124d:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1254:	00 
    1255:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    125c:	00 
    125d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1264:	00 
    1265:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    126c:	00 
    126d:	89 04 24             	mov    %eax,(%esp)
    1270:	e8 e7 25 00 00       	call   385c <initRect>
    1275:	83 ec 04             	sub    $0x4,%esp
    1278:	8b 45 e8             	mov    -0x18(%ebp),%eax
    127b:	89 44 24 04          	mov    %eax,0x4(%esp)
    127f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1282:	89 44 24 08          	mov    %eax,0x8(%esp)
    1286:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1289:	89 44 24 0c          	mov    %eax,0xc(%esp)
    128d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1290:	89 44 24 10          	mov    %eax,0x10(%esp)
    1294:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    129b:	e8 bf 27 00 00       	call   3a5f <deleteClickable>
	addWndEvent(&cm);
    12a0:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    12a7:	e8 cf fd ff ff       	call   107b <addWndEvent>
	addListEvent(&cm);
    12ac:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    12b3:	e8 3b fd ff ff       	call   ff3 <addListEvent>
}
    12b8:	c9                   	leave  
    12b9:	c3                   	ret    

000012ba <scrollUp>:

void scrollUp() {
    12ba:	55                   	push   %ebp
    12bb:	89 e5                	mov    %esp,%ebp
    12bd:	83 ec 18             	sub    $0x18,%esp
//	struct fileItem *q = fileItemList;
	printf(0, "tryingToScrollUp, current Offset %d\n", scrollOffset);
    12c0:	a1 60 f2 00 00       	mov    0xf260,%eax
    12c5:	89 44 24 08          	mov    %eax,0x8(%esp)
    12c9:	c7 44 24 04 9c aa 00 	movl   $0xaa9c,0x4(%esp)
    12d0:	00 
    12d1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    12d8:	e8 85 30 00 00       	call   4362 <printf>
	scrollOffset += SCROLL_UNIT;
    12dd:	a1 60 f2 00 00       	mov    0xf260,%eax
    12e2:	83 c0 1e             	add    $0x1e,%eax
    12e5:	a3 60 f2 00 00       	mov    %eax,0xf260
	printf(0, "scrollUp, current Offset %d\n", scrollOffset);
    12ea:	a1 60 f2 00 00       	mov    0xf260,%eax
    12ef:	89 44 24 08          	mov    %eax,0x8(%esp)
    12f3:	c7 44 24 04 c1 aa 00 	movl   $0xaac1,0x4(%esp)
    12fa:	00 
    12fb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1302:	e8 5b 30 00 00       	call   4362 <printf>
}
    1307:	c9                   	leave  
    1308:	c3                   	ret    

00001309 <h_scrollUp>:

void h_scrollUp(Point p) {
    1309:	55                   	push   %ebp
    130a:	89 e5                	mov    %esp,%ebp
    130c:	83 ec 38             	sub    $0x38,%esp
	scrollUp();
    130f:	e8 a6 ff ff ff       	call   12ba <scrollUp>
	freeFileItemList();
    1314:	e8 b8 ed ff ff       	call   d1 <freeFileItemList>
	list(".");
    1319:	c7 04 24 97 aa 00 00 	movl   $0xaa97,(%esp)
    1320:	e8 8a ee ff ff       	call   1af <list>
	drawFinderContent(context);
    1325:	a1 50 20 01 00       	mov    0x12050,%eax
    132a:	89 04 24             	mov    %eax,(%esp)
    132d:	a1 54 20 01 00       	mov    0x12054,%eax
    1332:	89 44 24 04          	mov    %eax,0x4(%esp)
    1336:	a1 58 20 01 00       	mov    0x12058,%eax
    133b:	89 44 24 08          	mov    %eax,0x8(%esp)
    133f:	e8 2e f7 ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    1344:	a1 50 20 01 00       	mov    0x12050,%eax
    1349:	89 04 24             	mov    %eax,(%esp)
    134c:	a1 54 20 01 00       	mov    0x12054,%eax
    1351:	89 44 24 04          	mov    %eax,0x4(%esp)
    1355:	a1 58 20 01 00       	mov    0x12058,%eax
    135a:	89 44 24 08          	mov    %eax,0x8(%esp)
    135e:	e8 4e f5 ff ff       	call   8b1 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1363:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1366:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    136d:	00 
    136e:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1375:	00 
    1376:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    137d:	00 
    137e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1385:	00 
    1386:	89 04 24             	mov    %eax,(%esp)
    1389:	e8 ce 24 00 00       	call   385c <initRect>
    138e:	83 ec 04             	sub    $0x4,%esp
    1391:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1394:	89 44 24 04          	mov    %eax,0x4(%esp)
    1398:	8b 45 ec             	mov    -0x14(%ebp),%eax
    139b:	89 44 24 08          	mov    %eax,0x8(%esp)
    139f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    13a2:	89 44 24 0c          	mov    %eax,0xc(%esp)
    13a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13a9:	89 44 24 10          	mov    %eax,0x10(%esp)
    13ad:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    13b4:	e8 a6 26 00 00       	call   3a5f <deleteClickable>
	addWndEvent(&cm);
    13b9:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    13c0:	e8 b6 fc ff ff       	call   107b <addWndEvent>
	addListEvent(&cm);
    13c5:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    13cc:	e8 22 fc ff ff       	call   ff3 <addListEvent>
}
    13d1:	c9                   	leave  
    13d2:	c3                   	ret    

000013d3 <enterDir>:

// Handlers
void enterDir(char *name) {
    13d3:	55                   	push   %ebp
    13d4:	89 e5                	mov    %esp,%ebp
    13d6:	83 ec 18             	sub    $0x18,%esp
	scrollOffset = 0;
    13d9:	c7 05 60 f2 00 00 00 	movl   $0x0,0xf260
    13e0:	00 00 00 
	printf(0, "entering : %s\n", name);
    13e3:	8b 45 08             	mov    0x8(%ebp),%eax
    13e6:	89 44 24 08          	mov    %eax,0x8(%esp)
    13ea:	c7 44 24 04 de aa 00 	movl   $0xaade,0x4(%esp)
    13f1:	00 
    13f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    13f9:	e8 64 2f 00 00       	call   4362 <printf>
	if (chdir(name) < 0)
    13fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1401:	89 04 24             	mov    %eax,(%esp)
    1404:	e8 e1 2d 00 00       	call   41ea <chdir>
    1409:	85 c0                	test   %eax,%eax
    140b:	79 1b                	jns    1428 <enterDir+0x55>
		printf(2, "cannot cd %s\n", name);
    140d:	8b 45 08             	mov    0x8(%ebp),%eax
    1410:	89 44 24 08          	mov    %eax,0x8(%esp)
    1414:	c7 44 24 04 ed aa 00 	movl   $0xaaed,0x4(%esp)
    141b:	00 
    141c:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1423:	e8 3a 2f 00 00       	call   4362 <printf>
}
    1428:	c9                   	leave  
    1429:	c3                   	ret    

0000142a <h_enterDir>:

void h_enterDir(Point p) {
    142a:	55                   	push   %ebp
    142b:	89 e5                	mov    %esp,%ebp
    142d:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *temp = getFileItem(p);
    1430:	8b 45 08             	mov    0x8(%ebp),%eax
    1433:	8b 55 0c             	mov    0xc(%ebp),%edx
    1436:	89 04 24             	mov    %eax,(%esp)
    1439:	89 54 24 04          	mov    %edx,0x4(%esp)
    143d:	e8 ff fc ff ff       	call   1141 <getFileItem>
    1442:	89 45 f4             	mov    %eax,-0xc(%ebp)
	enterDir(temp->name);
    1445:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1448:	8b 40 14             	mov    0x14(%eax),%eax
    144b:	89 04 24             	mov    %eax,(%esp)
    144e:	e8 80 ff ff ff       	call   13d3 <enterDir>
	freeFileItemList();
    1453:	e8 79 ec ff ff       	call   d1 <freeFileItemList>
	list(".");
    1458:	c7 04 24 97 aa 00 00 	movl   $0xaa97,(%esp)
    145f:	e8 4b ed ff ff       	call   1af <list>
	drawFinderContent(context);
    1464:	a1 50 20 01 00       	mov    0x12050,%eax
    1469:	89 04 24             	mov    %eax,(%esp)
    146c:	a1 54 20 01 00       	mov    0x12054,%eax
    1471:	89 44 24 04          	mov    %eax,0x4(%esp)
    1475:	a1 58 20 01 00       	mov    0x12058,%eax
    147a:	89 44 24 08          	mov    %eax,0x8(%esp)
    147e:	e8 ef f5 ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    1483:	a1 50 20 01 00       	mov    0x12050,%eax
    1488:	89 04 24             	mov    %eax,(%esp)
    148b:	a1 54 20 01 00       	mov    0x12054,%eax
    1490:	89 44 24 04          	mov    %eax,0x4(%esp)
    1494:	a1 58 20 01 00       	mov    0x12058,%eax
    1499:	89 44 24 08          	mov    %eax,0x8(%esp)
    149d:	e8 0f f4 ff ff       	call   8b1 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    14a2:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    14a5:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    14ac:	00 
    14ad:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    14b4:	00 
    14b5:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    14bc:	00 
    14bd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    14c4:	00 
    14c5:	89 04 24             	mov    %eax,(%esp)
    14c8:	e8 8f 23 00 00       	call   385c <initRect>
    14cd:	83 ec 04             	sub    $0x4,%esp
    14d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    14d3:	89 44 24 04          	mov    %eax,0x4(%esp)
    14d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    14da:	89 44 24 08          	mov    %eax,0x8(%esp)
    14de:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14e1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    14e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14e8:	89 44 24 10          	mov    %eax,0x10(%esp)
    14ec:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    14f3:	e8 67 25 00 00       	call   3a5f <deleteClickable>
	addWndEvent(&cm);
    14f8:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    14ff:	e8 77 fb ff ff       	call   107b <addWndEvent>
	addListEvent(&cm);
    1504:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    150b:	e8 e3 fa ff ff       	call   ff3 <addListEvent>
}
    1510:	c9                   	leave  
    1511:	c3                   	ret    

00001512 <newFile>:

void newFile(char *name) {
    1512:	55                   	push   %ebp
    1513:	89 e5                	mov    %esp,%ebp
    1515:	83 ec 28             	sub    $0x28,%esp
	int fd;
	int n = strlen(name);
    1518:	8b 45 08             	mov    0x8(%ebp),%eax
    151b:	89 04 24             	mov    %eax,(%esp)
    151e:	e8 83 2a 00 00       	call   3fa6 <strlen>
    1523:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 8;
    1526:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
	int counter;
	while ((fd = open(name, 0)) > 0)
    152d:	eb 60                	jmp    158f <newFile+0x7d>
	{
		n = strlen(name);
    152f:	8b 45 08             	mov    0x8(%ebp),%eax
    1532:	89 04 24             	mov    %eax,(%esp)
    1535:	e8 6c 2a 00 00       	call   3fa6 <strlen>
    153a:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    153d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1540:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1543:	75 09                	jne    154e <newFile+0x3c>
		{
			counter = 1;
    1545:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    154c:	eb 17                	jmp    1565 <newFile+0x53>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    154e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1551:	8b 45 08             	mov    0x8(%ebp),%eax
    1554:	01 d0                	add    %edx,%eax
    1556:	89 04 24             	mov    %eax,(%esp)
    1559:	e8 8a 2b 00 00       	call   40e8 <atoi>
    155e:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    1561:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    1565:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1568:	89 04 24             	mov    %eax,(%esp)
    156b:	e8 89 f7 ff ff       	call   cf9 <int2str>
    1570:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1573:	8b 55 08             	mov    0x8(%ebp),%edx
    1576:	01 ca                	add    %ecx,%edx
    1578:	89 44 24 04          	mov    %eax,0x4(%esp)
    157c:	89 14 24             	mov    %edx,(%esp)
    157f:	e8 b3 29 00 00       	call   3f37 <strcpy>
		close(fd);
    1584:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1587:	89 04 24             	mov    %eax,(%esp)
    158a:	e8 13 2c 00 00       	call   41a2 <close>
void newFile(char *name) {
	int fd;
	int n = strlen(name);
	int baseLen = 8;
	int counter;
	while ((fd = open(name, 0)) > 0)
    158f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1596:	00 
    1597:	8b 45 08             	mov    0x8(%ebp),%eax
    159a:	89 04 24             	mov    %eax,(%esp)
    159d:	e8 18 2c 00 00       	call   41ba <open>
    15a2:	89 45 e8             	mov    %eax,-0x18(%ebp)
    15a5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    15a9:	7f 84                	jg     152f <newFile+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		close(fd);
	}
	if ((fd = open(name, O_CREATE)) < 0) {
    15ab:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    15b2:	00 
    15b3:	8b 45 08             	mov    0x8(%ebp),%eax
    15b6:	89 04 24             	mov    %eax,(%esp)
    15b9:	e8 fc 2b 00 00       	call   41ba <open>
    15be:	89 45 e8             	mov    %eax,-0x18(%ebp)
    15c1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    15c5:	79 20                	jns    15e7 <newFile+0xd5>
		printf(0, "cat: cannot open %s\n", name);
    15c7:	8b 45 08             	mov    0x8(%ebp),%eax
    15ca:	89 44 24 08          	mov    %eax,0x8(%esp)
    15ce:	c7 44 24 04 fb aa 00 	movl   $0xaafb,0x4(%esp)
    15d5:	00 
    15d6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    15dd:	e8 80 2d 00 00       	call   4362 <printf>
		exit();
    15e2:	e8 93 2b 00 00       	call   417a <exit>
	}
	close(fd);
    15e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15ea:	89 04 24             	mov    %eax,(%esp)
    15ed:	e8 b0 2b 00 00       	call   41a2 <close>
}
    15f2:	c9                   	leave  
    15f3:	c3                   	ret    

000015f4 <h_newFile>:

void h_newFile(Point p) {
    15f4:	55                   	push   %ebp
    15f5:	89 e5                	mov    %esp,%ebp
    15f7:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "file.txt";
    15fa:	c7 45 c8 66 69 6c 65 	movl   $0x656c6966,-0x38(%ebp)
    1601:	c7 45 cc 2e 74 78 74 	movl   $0x7478742e,-0x34(%ebp)
    1608:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    160f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    1616:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    161d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    1624:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    162b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFile(nf);
    1632:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1635:	89 04 24             	mov    %eax,(%esp)
    1638:	e8 d5 fe ff ff       	call   1512 <newFile>
	freeFileItemList();
    163d:	e8 8f ea ff ff       	call   d1 <freeFileItemList>
	list(".");
    1642:	c7 04 24 97 aa 00 00 	movl   $0xaa97,(%esp)
    1649:	e8 61 eb ff ff       	call   1af <list>
	drawFinderContent(context);
    164e:	a1 50 20 01 00       	mov    0x12050,%eax
    1653:	89 04 24             	mov    %eax,(%esp)
    1656:	a1 54 20 01 00       	mov    0x12054,%eax
    165b:	89 44 24 04          	mov    %eax,0x4(%esp)
    165f:	a1 58 20 01 00       	mov    0x12058,%eax
    1664:	89 44 24 08          	mov    %eax,0x8(%esp)
    1668:	e8 05 f4 ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    166d:	a1 50 20 01 00       	mov    0x12050,%eax
    1672:	89 04 24             	mov    %eax,(%esp)
    1675:	a1 54 20 01 00       	mov    0x12054,%eax
    167a:	89 44 24 04          	mov    %eax,0x4(%esp)
    167e:	a1 58 20 01 00       	mov    0x12058,%eax
    1683:	89 44 24 08          	mov    %eax,0x8(%esp)
    1687:	e8 25 f2 ff ff       	call   8b1 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    168c:	8d 45 e8             	lea    -0x18(%ebp),%eax
    168f:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1696:	00 
    1697:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    169e:	00 
    169f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    16a6:	00 
    16a7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    16ae:	00 
    16af:	89 04 24             	mov    %eax,(%esp)
    16b2:	e8 a5 21 00 00       	call   385c <initRect>
    16b7:	83 ec 04             	sub    $0x4,%esp
    16ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16bd:	89 44 24 04          	mov    %eax,0x4(%esp)
    16c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    16c4:	89 44 24 08          	mov    %eax,0x8(%esp)
    16c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    16cb:	89 44 24 0c          	mov    %eax,0xc(%esp)
    16cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16d2:	89 44 24 10          	mov    %eax,0x10(%esp)
    16d6:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    16dd:	e8 7d 23 00 00       	call   3a5f <deleteClickable>
	addWndEvent(&cm);
    16e2:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    16e9:	e8 8d f9 ff ff       	call   107b <addWndEvent>
	addListEvent(&cm);
    16ee:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    16f5:	e8 f9 f8 ff ff       	call   ff3 <addListEvent>
}
    16fa:	c9                   	leave  
    16fb:	c3                   	ret    

000016fc <newFolder>:

void newFolder(char *name) {
    16fc:	55                   	push   %ebp
    16fd:	89 e5                	mov    %esp,%ebp
    16ff:	83 ec 28             	sub    $0x28,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
    1702:	8b 45 08             	mov    0x8(%ebp),%eax
    1705:	89 04 24             	mov    %eax,(%esp)
    1708:	e8 99 28 00 00       	call   3fa6 <strlen>
    170d:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 9;
    1710:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%ebp)
	int counter;
	while (mkdir(name) < 0) {
    1717:	eb 55                	jmp    176e <newFolder+0x72>
		n = strlen(name);
    1719:	8b 45 08             	mov    0x8(%ebp),%eax
    171c:	89 04 24             	mov    %eax,(%esp)
    171f:	e8 82 28 00 00       	call   3fa6 <strlen>
    1724:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    1727:	8b 45 f0             	mov    -0x10(%ebp),%eax
    172a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    172d:	75 09                	jne    1738 <newFolder+0x3c>
		{
			counter = 1;
    172f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1736:	eb 17                	jmp    174f <newFolder+0x53>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    1738:	8b 55 ec             	mov    -0x14(%ebp),%edx
    173b:	8b 45 08             	mov    0x8(%ebp),%eax
    173e:	01 d0                	add    %edx,%eax
    1740:	89 04 24             	mov    %eax,(%esp)
    1743:	e8 a0 29 00 00       	call   40e8 <atoi>
    1748:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    174b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    174f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1752:	89 04 24             	mov    %eax,(%esp)
    1755:	e8 9f f5 ff ff       	call   cf9 <int2str>
    175a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    175d:	8b 55 08             	mov    0x8(%ebp),%edx
    1760:	01 ca                	add    %ecx,%edx
    1762:	89 44 24 04          	mov    %eax,0x4(%esp)
    1766:	89 14 24             	mov    %edx,(%esp)
    1769:	e8 c9 27 00 00       	call   3f37 <strcpy>
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    176e:	8b 45 08             	mov    0x8(%ebp),%eax
    1771:	89 04 24             	mov    %eax,(%esp)
    1774:	e8 69 2a 00 00       	call   41e2 <mkdir>
    1779:	85 c0                	test   %eax,%eax
    177b:	78 9c                	js     1719 <newFolder+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		//printf(0, "mkdir: %s failed to create\n", newfolder);
	}
}
    177d:	c9                   	leave  
    177e:	c3                   	ret    

0000177f <h_newFolder>:

void h_newFolder(Point p) {
    177f:	55                   	push   %ebp
    1780:	89 e5                	mov    %esp,%ebp
    1782:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "newFolder";
    1785:	c7 45 c8 6e 65 77 46 	movl   $0x4677656e,-0x38(%ebp)
    178c:	c7 45 cc 6f 6c 64 65 	movl   $0x65646c6f,-0x34(%ebp)
    1793:	c7 45 d0 72 00 00 00 	movl   $0x72,-0x30(%ebp)
    179a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    17a1:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    17a8:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    17af:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    17b6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFolder(nf);
    17bd:	8d 45 c8             	lea    -0x38(%ebp),%eax
    17c0:	89 04 24             	mov    %eax,(%esp)
    17c3:	e8 34 ff ff ff       	call   16fc <newFolder>
	freeFileItemList();
    17c8:	e8 04 e9 ff ff       	call   d1 <freeFileItemList>
	printf(0, "new folder!\n");
    17cd:	c7 44 24 04 10 ab 00 	movl   $0xab10,0x4(%esp)
    17d4:	00 
    17d5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    17dc:	e8 81 2b 00 00       	call   4362 <printf>
	list(".");
    17e1:	c7 04 24 97 aa 00 00 	movl   $0xaa97,(%esp)
    17e8:	e8 c2 e9 ff ff       	call   1af <list>
	printItemList();
    17ed:	e8 eb f5 ff ff       	call   ddd <printItemList>
	drawFinderContent(context);
    17f2:	a1 50 20 01 00       	mov    0x12050,%eax
    17f7:	89 04 24             	mov    %eax,(%esp)
    17fa:	a1 54 20 01 00       	mov    0x12054,%eax
    17ff:	89 44 24 04          	mov    %eax,0x4(%esp)
    1803:	a1 58 20 01 00       	mov    0x12058,%eax
    1808:	89 44 24 08          	mov    %eax,0x8(%esp)
    180c:	e8 61 f2 ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    1811:	a1 50 20 01 00       	mov    0x12050,%eax
    1816:	89 04 24             	mov    %eax,(%esp)
    1819:	a1 54 20 01 00       	mov    0x12054,%eax
    181e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1822:	a1 58 20 01 00       	mov    0x12058,%eax
    1827:	89 44 24 08          	mov    %eax,0x8(%esp)
    182b:	e8 81 f0 ff ff       	call   8b1 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1830:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1833:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    183a:	00 
    183b:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1842:	00 
    1843:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    184a:	00 
    184b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1852:	00 
    1853:	89 04 24             	mov    %eax,(%esp)
    1856:	e8 01 20 00 00       	call   385c <initRect>
    185b:	83 ec 04             	sub    $0x4,%esp
    185e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1861:	89 44 24 04          	mov    %eax,0x4(%esp)
    1865:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1868:	89 44 24 08          	mov    %eax,0x8(%esp)
    186c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    186f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1873:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1876:	89 44 24 10          	mov    %eax,0x10(%esp)
    187a:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    1881:	e8 d9 21 00 00       	call   3a5f <deleteClickable>
	addWndEvent(&cm);
    1886:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    188d:	e8 e9 f7 ff ff       	call   107b <addWndEvent>
	addListEvent(&cm);
    1892:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    1899:	e8 55 f7 ff ff       	call   ff3 <addListEvent>
}
    189e:	c9                   	leave  
    189f:	c3                   	ret    

000018a0 <deleteFile>:

void deleteFile(char *name)
{
    18a0:	55                   	push   %ebp
    18a1:	89 e5                	mov    %esp,%ebp
    18a3:	83 ec 28             	sub    $0x28,%esp
    printf(0, "currently having sex with %s\n", name);
    18a6:	8b 45 08             	mov    0x8(%ebp),%eax
    18a9:	89 44 24 08          	mov    %eax,0x8(%esp)
    18ad:	c7 44 24 04 1d ab 00 	movl   $0xab1d,0x4(%esp)
    18b4:	00 
    18b5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    18bc:	e8 a1 2a 00 00       	call   4362 <printf>
	if(unlink(name) < 0){
    18c1:	8b 45 08             	mov    0x8(%ebp),%eax
    18c4:	89 04 24             	mov    %eax,(%esp)
    18c7:	e8 fe 28 00 00       	call   41ca <unlink>
    18cc:	85 c0                	test   %eax,%eax
    18ce:	0f 89 9c 00 00 00    	jns    1970 <deleteFile+0xd0>
		if (chdir(name) < 0){
    18d4:	8b 45 08             	mov    0x8(%ebp),%eax
    18d7:	89 04 24             	mov    %eax,(%esp)
    18da:	e8 0b 29 00 00       	call   41ea <chdir>
    18df:	85 c0                	test   %eax,%eax
    18e1:	79 1d                	jns    1900 <deleteFile+0x60>
			printf(2, "rm: %s failed to delete\n", name);
    18e3:	8b 45 08             	mov    0x8(%ebp),%eax
    18e6:	89 44 24 08          	mov    %eax,0x8(%esp)
    18ea:	c7 44 24 04 3b ab 00 	movl   $0xab3b,0x4(%esp)
    18f1:	00 
    18f2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    18f9:	e8 64 2a 00 00       	call   4362 <printf>
    18fe:	eb 70                	jmp    1970 <deleteFile+0xd0>
		}
		else{
			freeFileItemList();
    1900:	e8 cc e7 ff ff       	call   d1 <freeFileItemList>
	        list(".");
    1905:	c7 04 24 97 aa 00 00 	movl   $0xaa97,(%esp)
    190c:	e8 9e e8 ff ff       	call   1af <list>
	        struct fileItem *p;
	        p = fileItemList;
    1911:	a1 64 f2 00 00       	mov    0xf264,%eax
    1916:	89 45 f4             	mov    %eax,-0xc(%ebp)
	        while (p != 0) {
    1919:	eb 27                	jmp    1942 <deleteFile+0xa2>
		        deleteFile(p->name);
    191b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    191e:	8b 40 14             	mov    0x14(%eax),%eax
    1921:	89 04 24             	mov    %eax,(%esp)
    1924:	e8 77 ff ff ff       	call   18a0 <deleteFile>
		        freeFileItemList();
    1929:	e8 a3 e7 ff ff       	call   d1 <freeFileItemList>
                list(".");
    192e:	c7 04 24 97 aa 00 00 	movl   $0xaa97,(%esp)
    1935:	e8 75 e8 ff ff       	call   1af <list>
                p = fileItemList;
    193a:	a1 64 f2 00 00       	mov    0xf264,%eax
    193f:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else{
			freeFileItemList();
	        list(".");
	        struct fileItem *p;
	        p = fileItemList;
	        while (p != 0) {
    1942:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1946:	75 d3                	jne    191b <deleteFile+0x7b>
		        deleteFile(p->name);
		        freeFileItemList();
                list(".");
                p = fileItemList;
	        }
            chdir("..");
    1948:	c7 04 24 54 ab 00 00 	movl   $0xab54,(%esp)
    194f:	e8 96 28 00 00       	call   41ea <chdir>
            freeFileItemList();
    1954:	e8 78 e7 ff ff       	call   d1 <freeFileItemList>
            list(".");
    1959:	c7 04 24 97 aa 00 00 	movl   $0xaa97,(%esp)
    1960:	e8 4a e8 ff ff       	call   1af <list>
            unlink(name);
    1965:	8b 45 08             	mov    0x8(%ebp),%eax
    1968:	89 04 24             	mov    %eax,(%esp)
    196b:	e8 5a 28 00 00       	call   41ca <unlink>
		}
	}
}
    1970:	c9                   	leave  
    1971:	c3                   	ret    

00001972 <h_deleteFile>:
void h_deleteFile(Point p) {
    1972:	55                   	push   %ebp
    1973:	89 e5                	mov    %esp,%ebp
    1975:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *q = fileItemList;
    1978:	a1 64 f2 00 00       	mov    0xf264,%eax
    197d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    struct fileItem *p1, *head, *p2;
    head = p1 = p2 = 0;
    1980:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    1987:	8b 45 e8             	mov    -0x18(%ebp),%eax
    198a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    198d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1990:	89 45 ec             	mov    %eax,-0x14(%ebp)
    printf(0, "hi1\n");
    1993:	c7 44 24 04 57 ab 00 	movl   $0xab57,0x4(%esp)
    199a:	00 
    199b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    19a2:	e8 bb 29 00 00       	call   4362 <printf>
	while (q != 0)
    19a7:	e9 8d 00 00 00       	jmp    1a39 <h_deleteFile+0xc7>
	{
        printf(0, "hi2\n");
    19ac:	c7 44 24 04 5c ab 00 	movl   $0xab5c,0x4(%esp)
    19b3:	00 
    19b4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    19bb:	e8 a2 29 00 00       	call   4362 <printf>
		if (q->chosen)
    19c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19c3:	8b 40 28             	mov    0x28(%eax),%eax
    19c6:	85 c0                	test   %eax,%eax
    19c8:	74 66                	je     1a30 <h_deleteFile+0xbe>
		{
            p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
    19ca:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
    19d1:	e8 78 2c 00 00       	call   464e <malloc>
    19d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
            p1->name = (char *)malloc(32 * sizeof(char));
    19d9:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    19e0:	e8 69 2c 00 00       	call   464e <malloc>
    19e5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    19e8:	89 42 14             	mov    %eax,0x14(%edx)
            strcpy(p1->name, q->name);
    19eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19ee:	8b 50 14             	mov    0x14(%eax),%edx
    19f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19f4:	8b 40 14             	mov    0x14(%eax),%eax
    19f7:	89 54 24 04          	mov    %edx,0x4(%esp)
    19fb:	89 04 24             	mov    %eax,(%esp)
    19fe:	e8 34 25 00 00       	call   3f37 <strcpy>
            if(head == 0)
    1a03:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a07:	75 0e                	jne    1a17 <h_deleteFile+0xa5>
            {
                head = p1;
    1a09:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a0c:	89 45 ec             	mov    %eax,-0x14(%ebp)
                p2 = p1;
    1a0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a12:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1a15:	eb 0f                	jmp    1a26 <h_deleteFile+0xb4>
            } else {
                p2->next = p1;
    1a17:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a1a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1a1d:	89 50 2c             	mov    %edx,0x2c(%eax)
                p2 = p1;
    1a20:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a23:	89 45 e8             	mov    %eax,-0x18(%ebp)
            }
            p1->next = 0;
    1a26:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a29:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
		}
        q = q->next;
    1a30:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a33:	8b 40 2c             	mov    0x2c(%eax),%eax
    1a36:	89 45 f4             	mov    %eax,-0xc(%ebp)
void h_deleteFile(Point p) {
	struct fileItem *q = fileItemList;
    struct fileItem *p1, *head, *p2;
    head = p1 = p2 = 0;
    printf(0, "hi1\n");
	while (q != 0)
    1a39:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1a3d:	0f 85 69 ff ff ff    	jne    19ac <h_deleteFile+0x3a>
            }
            p1->next = 0;
		}
        q = q->next;
	}
    p1 = head;
    1a43:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a46:	89 45 f0             	mov    %eax,-0x10(%ebp)
    printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
    1a49:	c7 44 24 04 64 ab 00 	movl   $0xab64,0x4(%esp)
    1a50:	00 
    1a51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a58:	e8 05 29 00 00       	call   4362 <printf>
    while (p1 != 0)
    1a5d:	eb 17                	jmp    1a76 <h_deleteFile+0x104>
    {
        deleteFile(p1->name);
    1a5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a62:	8b 40 14             	mov    0x14(%eax),%eax
    1a65:	89 04 24             	mov    %eax,(%esp)
    1a68:	e8 33 fe ff ff       	call   18a0 <deleteFile>
        p1 = p1->next;
    1a6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a70:	8b 40 2c             	mov    0x2c(%eax),%eax
    1a73:	89 45 f0             	mov    %eax,-0x10(%ebp)
		}
        q = q->next;
	}
    p1 = head;
    printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
    while (p1 != 0)
    1a76:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1a7a:	75 e3                	jne    1a5f <h_deleteFile+0xed>
    {
        deleteFile(p1->name);
        p1 = p1->next;
    }
    printf(0, "i was so tm fast. :p\n");
    1a7c:	c7 44 24 04 cc ab 00 	movl   $0xabcc,0x4(%esp)
    1a83:	00 
    1a84:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a8b:	e8 d2 28 00 00       	call   4362 <printf>
    p1 = head;
    1a90:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a93:	89 45 f0             	mov    %eax,-0x10(%ebp)
    while (p1 != 0) {
    1a96:	eb 46                	jmp    1ade <h_deleteFile+0x16c>
        p2 = p1;
    1a98:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a9b:	89 45 e8             	mov    %eax,-0x18(%ebp)
        printf(0, "freeing %s\n", p2->name);
    1a9e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1aa1:	8b 40 14             	mov    0x14(%eax),%eax
    1aa4:	89 44 24 08          	mov    %eax,0x8(%esp)
    1aa8:	c7 44 24 04 e2 ab 00 	movl   $0xabe2,0x4(%esp)
    1aaf:	00 
    1ab0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ab7:	e8 a6 28 00 00       	call   4362 <printf>
        p1 = p1->next;
    1abc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1abf:	8b 40 2c             	mov    0x2c(%eax),%eax
    1ac2:	89 45 f0             	mov    %eax,-0x10(%ebp)
        free(p2->name);
    1ac5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ac8:	8b 40 14             	mov    0x14(%eax),%eax
    1acb:	89 04 24             	mov    %eax,(%esp)
    1ace:	e8 42 2a 00 00       	call   4515 <free>
        free(p2);
    1ad3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ad6:	89 04 24             	mov    %eax,(%esp)
    1ad9:	e8 37 2a 00 00       	call   4515 <free>
        deleteFile(p1->name);
        p1 = p1->next;
    }
    printf(0, "i was so tm fast. :p\n");
    p1 = head;
    while (p1 != 0) {
    1ade:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1ae2:	75 b4                	jne    1a98 <h_deleteFile+0x126>
        printf(0, "freeing %s\n", p2->name);
        p1 = p1->next;
        free(p2->name);
        free(p2);
    }
    printf(0, "done freeing!~~~\n");
    1ae4:	c7 44 24 04 ee ab 00 	movl   $0xabee,0x4(%esp)
    1aeb:	00 
    1aec:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1af3:	e8 6a 28 00 00       	call   4362 <printf>
	freeFileItemList();
    1af8:	e8 d4 e5 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1afd:	c7 04 24 97 aa 00 00 	movl   $0xaa97,(%esp)
    1b04:	e8 a6 e6 ff ff       	call   1af <list>
    printItemList();
    1b09:	e8 cf f2 ff ff       	call   ddd <printItemList>
	drawFinderContent(context);
    1b0e:	a1 50 20 01 00       	mov    0x12050,%eax
    1b13:	89 04 24             	mov    %eax,(%esp)
    1b16:	a1 54 20 01 00       	mov    0x12054,%eax
    1b1b:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b1f:	a1 58 20 01 00       	mov    0x12058,%eax
    1b24:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b28:	e8 45 ef ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    1b2d:	a1 50 20 01 00       	mov    0x12050,%eax
    1b32:	89 04 24             	mov    %eax,(%esp)
    1b35:	a1 54 20 01 00       	mov    0x12054,%eax
    1b3a:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b3e:	a1 58 20 01 00       	mov    0x12058,%eax
    1b43:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b47:	e8 65 ed ff ff       	call   8b1 <drawFinderWnd>
		deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1b4c:	8d 45 d8             	lea    -0x28(%ebp),%eax
    1b4f:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1b56:	00 
    1b57:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1b5e:	00 
    1b5f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1b66:	00 
    1b67:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1b6e:	00 
    1b6f:	89 04 24             	mov    %eax,(%esp)
    1b72:	e8 e5 1c 00 00       	call   385c <initRect>
    1b77:	83 ec 04             	sub    $0x4,%esp
    1b7a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1b7d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b81:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1b84:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b88:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1b8b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1b8f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b92:	89 44 24 10          	mov    %eax,0x10(%esp)
    1b96:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    1b9d:	e8 bd 1e 00 00       	call   3a5f <deleteClickable>
		addWndEvent(&cm);
    1ba2:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    1ba9:	e8 cd f4 ff ff       	call   107b <addWndEvent>
		addListEvent(&cm);
    1bae:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    1bb5:	e8 39 f4 ff ff       	call   ff3 <addListEvent>
}
    1bba:	c9                   	leave  
    1bbb:	c3                   	ret    

00001bbc <h_chooseFile>:

void h_chooseFile(Point p) {
    1bbc:	55                   	push   %ebp
    1bbd:	89 e5                	mov    %esp,%ebp
    1bbf:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = getFileItem(p);
    1bc2:	8b 45 08             	mov    0x8(%ebp),%eax
    1bc5:	8b 55 0c             	mov    0xc(%ebp),%edx
    1bc8:	89 04 24             	mov    %eax,(%esp)
    1bcb:	89 54 24 04          	mov    %edx,0x4(%esp)
    1bcf:	e8 6d f5 ff ff       	call   1141 <getFileItem>
    1bd4:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (temp->chosen != 0)
    1bd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bda:	8b 40 28             	mov    0x28(%eax),%eax
    1bdd:	85 c0                	test   %eax,%eax
    1bdf:	74 20                	je     1c01 <h_chooseFile+0x45>
	{
		printf(0, "chooseFile!\n");
    1be1:	c7 44 24 04 00 ac 00 	movl   $0xac00,0x4(%esp)
    1be8:	00 
    1be9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1bf0:	e8 6d 27 00 00       	call   4362 <printf>
		temp->chosen = 0;
    1bf5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bf8:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    1bff:	eb 1e                	jmp    1c1f <h_chooseFile+0x63>
	}
	else
	{
		printf(0, "unchooseFile!\n");
    1c01:	c7 44 24 04 0d ac 00 	movl   $0xac0d,0x4(%esp)
    1c08:	00 
    1c09:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c10:	e8 4d 27 00 00       	call   4362 <printf>
		temp->chosen = 1;
    1c15:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c18:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    1c1f:	a1 50 20 01 00       	mov    0x12050,%eax
    1c24:	89 04 24             	mov    %eax,(%esp)
    1c27:	a1 54 20 01 00       	mov    0x12054,%eax
    1c2c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c30:	a1 58 20 01 00       	mov    0x12058,%eax
    1c35:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c39:	e8 34 ee ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    1c3e:	a1 50 20 01 00       	mov    0x12050,%eax
    1c43:	89 04 24             	mov    %eax,(%esp)
    1c46:	a1 54 20 01 00       	mov    0x12054,%eax
    1c4b:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c4f:	a1 58 20 01 00       	mov    0x12058,%eax
    1c54:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c58:	e8 54 ec ff ff       	call   8b1 <drawFinderWnd>
}
    1c5d:	c9                   	leave  
    1c5e:	c3                   	ret    

00001c5f <h_closeWnd>:

void h_closeWnd(Point p) {
    1c5f:	55                   	push   %ebp
    1c60:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    1c62:	c7 05 20 ea 00 00 00 	movl   $0x0,0xea20
    1c69:	00 00 00 
}
    1c6c:	5d                   	pop    %ebp
    1c6d:	c3                   	ret    

00001c6e <h_chvm1>:

void h_chvm1(Point p) {
    1c6e:	55                   	push   %ebp
    1c6f:	89 e5                	mov    %esp,%ebp
    1c71:	83 ec 38             	sub    $0x38,%esp
	style = ICON_STYLE;
    1c74:	c7 05 24 ea 00 00 01 	movl   $0x1,0xea24
    1c7b:	00 00 00 
	freeFileItemList();
    1c7e:	e8 4e e4 ff ff       	call   d1 <freeFileItemList>
		list(".");
    1c83:	c7 04 24 97 aa 00 00 	movl   $0xaa97,(%esp)
    1c8a:	e8 20 e5 ff ff       	call   1af <list>
		drawFinderContent(context);
    1c8f:	a1 50 20 01 00       	mov    0x12050,%eax
    1c94:	89 04 24             	mov    %eax,(%esp)
    1c97:	a1 54 20 01 00       	mov    0x12054,%eax
    1c9c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ca0:	a1 58 20 01 00       	mov    0x12058,%eax
    1ca5:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ca9:	e8 c4 ed ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    1cae:	a1 50 20 01 00       	mov    0x12050,%eax
    1cb3:	89 04 24             	mov    %eax,(%esp)
    1cb6:	a1 54 20 01 00       	mov    0x12054,%eax
    1cbb:	89 44 24 04          	mov    %eax,0x4(%esp)
    1cbf:	a1 58 20 01 00       	mov    0x12058,%eax
    1cc4:	89 44 24 08          	mov    %eax,0x8(%esp)
    1cc8:	e8 e4 eb ff ff       	call   8b1 <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1ccd:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1cd0:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1cd7:	00 
    1cd8:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1cdf:	00 
    1ce0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1ce7:	00 
    1ce8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1cef:	00 
    1cf0:	89 04 24             	mov    %eax,(%esp)
    1cf3:	e8 64 1b 00 00       	call   385c <initRect>
    1cf8:	83 ec 04             	sub    $0x4,%esp
    1cfb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1cfe:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d02:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1d05:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d09:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1d0c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1d10:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d13:	89 44 24 10          	mov    %eax,0x10(%esp)
    1d17:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    1d1e:	e8 3c 1d 00 00       	call   3a5f <deleteClickable>
			addWndEvent(&cm);
    1d23:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    1d2a:	e8 4c f3 ff ff       	call   107b <addWndEvent>
			addListEvent(&cm);
    1d2f:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    1d36:	e8 b8 f2 ff ff       	call   ff3 <addListEvent>
}
    1d3b:	c9                   	leave  
    1d3c:	c3                   	ret    

00001d3d <h_chvm2>:

void h_chvm2(Point p) {
    1d3d:	55                   	push   %ebp
    1d3e:	89 e5                	mov    %esp,%ebp
    1d40:	83 ec 38             	sub    $0x38,%esp
	style = LIST_STYLE;
    1d43:	c7 05 24 ea 00 00 02 	movl   $0x2,0xea24
    1d4a:	00 00 00 
	freeFileItemList();
    1d4d:	e8 7f e3 ff ff       	call   d1 <freeFileItemList>
		list(".");
    1d52:	c7 04 24 97 aa 00 00 	movl   $0xaa97,(%esp)
    1d59:	e8 51 e4 ff ff       	call   1af <list>
		drawFinderContent(context);
    1d5e:	a1 50 20 01 00       	mov    0x12050,%eax
    1d63:	89 04 24             	mov    %eax,(%esp)
    1d66:	a1 54 20 01 00       	mov    0x12054,%eax
    1d6b:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d6f:	a1 58 20 01 00       	mov    0x12058,%eax
    1d74:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d78:	e8 f5 ec ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    1d7d:	a1 50 20 01 00       	mov    0x12050,%eax
    1d82:	89 04 24             	mov    %eax,(%esp)
    1d85:	a1 54 20 01 00       	mov    0x12054,%eax
    1d8a:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d8e:	a1 58 20 01 00       	mov    0x12058,%eax
    1d93:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d97:	e8 15 eb ff ff       	call   8b1 <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1d9c:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1d9f:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1da6:	00 
    1da7:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1dae:	00 
    1daf:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1db6:	00 
    1db7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1dbe:	00 
    1dbf:	89 04 24             	mov    %eax,(%esp)
    1dc2:	e8 95 1a 00 00       	call   385c <initRect>
    1dc7:	83 ec 04             	sub    $0x4,%esp
    1dca:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1dcd:	89 44 24 04          	mov    %eax,0x4(%esp)
    1dd1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1dd4:	89 44 24 08          	mov    %eax,0x8(%esp)
    1dd8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ddb:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1ddf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1de2:	89 44 24 10          	mov    %eax,0x10(%esp)
    1de6:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    1ded:	e8 6d 1c 00 00       	call   3a5f <deleteClickable>
			addWndEvent(&cm);
    1df2:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    1df9:	e8 7d f2 ff ff       	call   107b <addWndEvent>
			addListEvent(&cm);
    1dfe:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    1e05:	e8 e9 f1 ff ff       	call   ff3 <addListEvent>
}
    1e0a:	c9                   	leave  
    1e0b:	c3                   	ret    

00001e0c <h_goUp>:

void h_goUp(Point p) {
    1e0c:	55                   	push   %ebp
    1e0d:	89 e5                	mov    %esp,%ebp
    1e0f:	83 ec 38             	sub    $0x38,%esp
	enterDir("..");
    1e12:	c7 04 24 54 ab 00 00 	movl   $0xab54,(%esp)
    1e19:	e8 b5 f5 ff ff       	call   13d3 <enterDir>
	freeFileItemList();
    1e1e:	e8 ae e2 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1e23:	c7 04 24 97 aa 00 00 	movl   $0xaa97,(%esp)
    1e2a:	e8 80 e3 ff ff       	call   1af <list>
	drawFinderContent(context);
    1e2f:	a1 50 20 01 00       	mov    0x12050,%eax
    1e34:	89 04 24             	mov    %eax,(%esp)
    1e37:	a1 54 20 01 00       	mov    0x12054,%eax
    1e3c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1e40:	a1 58 20 01 00       	mov    0x12058,%eax
    1e45:	89 44 24 08          	mov    %eax,0x8(%esp)
    1e49:	e8 24 ec ff ff       	call   a72 <drawFinderContent>
	drawFinderWnd(context);
    1e4e:	a1 50 20 01 00       	mov    0x12050,%eax
    1e53:	89 04 24             	mov    %eax,(%esp)
    1e56:	a1 54 20 01 00       	mov    0x12054,%eax
    1e5b:	89 44 24 04          	mov    %eax,0x4(%esp)
    1e5f:	a1 58 20 01 00       	mov    0x12058,%eax
    1e64:	89 44 24 08          	mov    %eax,0x8(%esp)
    1e68:	e8 44 ea ff ff       	call   8b1 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1e6d:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1e70:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1e77:	00 
    1e78:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1e7f:	00 
    1e80:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1e87:	00 
    1e88:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1e8f:	00 
    1e90:	89 04 24             	mov    %eax,(%esp)
    1e93:	e8 c4 19 00 00       	call   385c <initRect>
    1e98:	83 ec 04             	sub    $0x4,%esp
    1e9b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e9e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ea2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ea5:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ea9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1eac:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1eb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1eb3:	89 44 24 10          	mov    %eax,0x10(%esp)
    1eb7:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    1ebe:	e8 9c 1b 00 00       	call   3a5f <deleteClickable>
	addWndEvent(&cm);
    1ec3:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    1eca:	e8 ac f1 ff ff       	call   107b <addWndEvent>
	addListEvent(&cm);
    1ecf:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    1ed6:	e8 18 f1 ff ff       	call   ff3 <addListEvent>
}
    1edb:	c9                   	leave  
    1edc:	c3                   	ret    

00001edd <h_empty>:

void h_empty(Point p) {
    1edd:	55                   	push   %ebp
    1ede:	89 e5                	mov    %esp,%ebp

}
    1ee0:	5d                   	pop    %ebp
    1ee1:	c3                   	ret    

00001ee2 <main>:

int main(int argc, char *argv[]) {
    1ee2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1ee6:	83 e4 f0             	and    $0xfffffff0,%esp
    1ee9:	ff 71 fc             	pushl  -0x4(%ecx)
    1eec:	55                   	push   %ebp
    1eed:	89 e5                	mov    %esp,%ebp
    1eef:	56                   	push   %esi
    1ef0:	53                   	push   %ebx
    1ef1:	51                   	push   %ecx
    1ef2:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
	int winid;
	struct Msg msg;

	Point p;

	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    1ef8:	c7 44 24 08 c2 01 00 	movl   $0x1c2,0x8(%esp)
    1eff:	00 
    1f00:	c7 44 24 04 58 02 00 	movl   $0x258,0x4(%esp)
    1f07:	00 
    1f08:	c7 04 24 50 20 01 00 	movl   $0x12050,(%esp)
    1f0f:	e8 12 04 00 00       	call   2326 <init_context>
    1f14:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    1f17:	8d 45 88             	lea    -0x78(%ebp),%eax
    1f1a:	8b 15 50 20 01 00    	mov    0x12050,%edx
    1f20:	89 54 24 04          	mov    %edx,0x4(%esp)
    1f24:	8b 15 54 20 01 00    	mov    0x12054,%edx
    1f2a:	89 54 24 08          	mov    %edx,0x8(%esp)
    1f2e:	8b 15 58 20 01 00    	mov    0x12058,%edx
    1f34:	89 54 24 0c          	mov    %edx,0xc(%esp)
    1f38:	89 04 24             	mov    %eax,(%esp)
    1f3b:	e8 ba 19 00 00       	call   38fa <initClickManager>
    1f40:	83 ec 04             	sub    $0x4,%esp
    1f43:	8b 45 88             	mov    -0x78(%ebp),%eax
    1f46:	a3 5c 20 01 00       	mov    %eax,0x1205c
    1f4b:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1f4e:	a3 60 20 01 00       	mov    %eax,0x12060
    1f53:	8b 45 90             	mov    -0x70(%ebp),%eax
    1f56:	a3 64 20 01 00       	mov    %eax,0x12064
    1f5b:	8b 45 94             	mov    -0x6c(%ebp),%eax
    1f5e:	a3 68 20 01 00       	mov    %eax,0x12068
    1f63:	8b 45 98             	mov    -0x68(%ebp),%eax
    1f66:	a3 6c 20 01 00       	mov    %eax,0x1206c
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    1f6b:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
    1f72:	00 
    1f73:	c7 04 24 20 eb 00 00 	movl   $0xeb20,(%esp)
    1f7a:	e8 a1 0f 00 00       	call   2f20 <load_iconlist>
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    1f7f:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    1f86:	00 
    1f87:	c7 04 24 40 ea 00 00 	movl   $0xea40,(%esp)
    1f8e:	e8 8d 0f 00 00       	call   2f20 <load_iconlist>
	//testHandlers();
	mkdir("userfolder");
    1f93:	c7 04 24 1c ac 00 00 	movl   $0xac1c,(%esp)
    1f9a:	e8 43 22 00 00       	call   41e2 <mkdir>
	enterDir("userfolder");
    1f9f:	c7 04 24 1c ac 00 00 	movl   $0xac1c,(%esp)
    1fa6:	e8 28 f4 ff ff       	call   13d3 <enterDir>
	freeFileItemList();
    1fab:	e8 21 e1 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1fb0:	c7 04 24 97 aa 00 00 	movl   $0xaa97,(%esp)
    1fb7:	e8 f3 e1 ff ff       	call   1af <list>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1fbc:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    1fbf:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1fc6:	00 
    1fc7:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1fce:	00 
    1fcf:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1fd6:	00 
    1fd7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1fde:	00 
    1fdf:	89 04 24             	mov    %eax,(%esp)
    1fe2:	e8 75 18 00 00       	call   385c <initRect>
    1fe7:	83 ec 04             	sub    $0x4,%esp
    1fea:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1fed:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ff1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1ff4:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ff8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1ffb:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1fff:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2002:	89 44 24 10          	mov    %eax,0x10(%esp)
    2006:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    200d:	e8 4d 1a 00 00       	call   3a5f <deleteClickable>
	addWndEvent(&cm);
    2012:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    2019:	e8 5d f0 ff ff       	call   107b <addWndEvent>
	addListEvent(&cm);
    201e:	c7 04 24 5c 20 01 00 	movl   $0x1205c,(%esp)
    2025:	e8 c9 ef ff ff       	call   ff3 <addListEvent>
	while (isRun) {
    202a:	e9 c7 01 00 00       	jmp    21f6 <main+0x314>
		getMsg(&msg);
    202f:	8d 45 bc             	lea    -0x44(%ebp),%eax
    2032:	89 04 24             	mov    %eax,(%esp)
    2035:	e8 e0 21 00 00       	call   421a <getMsg>
		switch (msg.msg_type) {
    203a:	8b 45 bc             	mov    -0x44(%ebp),%eax
    203d:	83 f8 08             	cmp    $0x8,%eax
    2040:	0f 87 af 01 00 00    	ja     21f5 <main+0x313>
    2046:	8b 04 85 28 ac 00 00 	mov    0xac28(,%eax,4),%eax
    204d:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    204f:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    2052:	8b 55 c0             	mov    -0x40(%ebp),%edx
    2055:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    2058:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    205c:	89 54 24 04          	mov    %edx,0x4(%esp)
    2060:	89 04 24             	mov    %eax,(%esp)
    2063:	e8 cd 17 00 00       	call   3835 <initPoint>
    2068:	83 ec 04             	sub    $0x4,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    206b:	8b 0d 60 20 01 00    	mov    0x12060,%ecx
    2071:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    2074:	8b 55 b8             	mov    -0x48(%ebp),%edx
    2077:	89 44 24 04          	mov    %eax,0x4(%esp)
    207b:	89 54 24 08          	mov    %edx,0x8(%esp)
    207f:	89 0c 24             	mov    %ecx,(%esp)
    2082:	e8 b8 1a 00 00       	call   3b3f <executeHandler>
    2087:	85 c0                	test   %eax,%eax
    2089:	74 19                	je     20a4 <main+0x1c2>
				updateWindow(winid, context.addr);
    208b:	a1 50 20 01 00       	mov    0x12050,%eax
    2090:	89 44 24 04          	mov    %eax,0x4(%esp)
    2094:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2097:	89 04 24             	mov    %eax,(%esp)
    209a:	e8 93 21 00 00       	call   4232 <updateWindow>
			}
			break;
    209f:	e9 52 01 00 00       	jmp    21f6 <main+0x314>
    20a4:	e9 4d 01 00 00       	jmp    21f6 <main+0x314>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderContent(context);
    20a9:	a1 50 20 01 00       	mov    0x12050,%eax
    20ae:	89 04 24             	mov    %eax,(%esp)
    20b1:	a1 54 20 01 00       	mov    0x12054,%eax
    20b6:	89 44 24 04          	mov    %eax,0x4(%esp)
    20ba:	a1 58 20 01 00       	mov    0x12058,%eax
    20bf:	89 44 24 08          	mov    %eax,0x8(%esp)
    20c3:	e8 aa e9 ff ff       	call   a72 <drawFinderContent>
			drawFinderWnd(context);
    20c8:	a1 50 20 01 00       	mov    0x12050,%eax
    20cd:	89 04 24             	mov    %eax,(%esp)
    20d0:	a1 54 20 01 00       	mov    0x12054,%eax
    20d5:	89 44 24 04          	mov    %eax,0x4(%esp)
    20d9:	a1 58 20 01 00       	mov    0x12058,%eax
    20de:	89 44 24 08          	mov    %eax,0x8(%esp)
    20e2:	e8 ca e7 ff ff       	call   8b1 <drawFinderWnd>
			updateWindow(winid, context.addr);
    20e7:	a1 50 20 01 00       	mov    0x12050,%eax
    20ec:	89 44 24 04          	mov    %eax,0x4(%esp)
    20f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    20f3:	89 04 24             	mov    %eax,(%esp)
    20f6:	e8 37 21 00 00       	call   4232 <updateWindow>
			break;
    20fb:	e9 f6 00 00 00       	jmp    21f6 <main+0x314>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    2100:	8b 75 cc             	mov    -0x34(%ebp),%esi
    2103:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    2106:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    2109:	8b 55 c0             	mov    -0x40(%ebp),%edx
    210c:	a1 50 20 01 00       	mov    0x12050,%eax
    2111:	89 74 24 14          	mov    %esi,0x14(%esp)
    2115:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    2119:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    211d:	89 54 24 08          	mov    %edx,0x8(%esp)
    2121:	89 44 24 04          	mov    %eax,0x4(%esp)
    2125:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2128:	89 04 24             	mov    %eax,(%esp)
    212b:	e8 0a 21 00 00       	call   423a <updatePartialWindow>
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    2130:	e9 c1 00 00 00       	jmp    21f6 <main+0x314>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2135:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    2138:	8b 55 c0             	mov    -0x40(%ebp),%edx
    213b:	8d 45 80             	lea    -0x80(%ebp),%eax
    213e:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2142:	89 54 24 04          	mov    %edx,0x4(%esp)
    2146:	89 04 24             	mov    %eax,(%esp)
    2149:	e8 e7 16 00 00       	call   3835 <initPoint>
    214e:	83 ec 04             	sub    $0x4,%esp
    2151:	8b 45 80             	mov    -0x80(%ebp),%eax
    2154:	8b 55 84             	mov    -0x7c(%ebp),%edx
    2157:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    215a:	89 55 b8             	mov    %edx,-0x48(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.left_click, p)) {
    215d:	8b 0d 5c 20 01 00    	mov    0x1205c,%ecx
    2163:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    2166:	8b 55 b8             	mov    -0x48(%ebp),%edx
    2169:	89 44 24 04          	mov    %eax,0x4(%esp)
    216d:	89 54 24 08          	mov    %edx,0x8(%esp)
    2171:	89 0c 24             	mov    %ecx,(%esp)
    2174:	e8 c6 19 00 00       	call   3b3f <executeHandler>
    2179:	85 c0                	test   %eax,%eax
    217b:	74 16                	je     2193 <main+0x2b1>

				updateWindow(winid, context.addr);
    217d:	a1 50 20 01 00       	mov    0x12050,%eax
    2182:	89 44 24 04          	mov    %eax,0x4(%esp)
    2186:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2189:	89 04 24             	mov    %eax,(%esp)
    218c:	e8 a1 20 00 00       	call   4232 <updateWindow>
			}
			break;
    2191:	eb 63                	jmp    21f6 <main+0x314>
    2193:	eb 61                	jmp    21f6 <main+0x314>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    2195:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    2198:	8b 55 c0             	mov    -0x40(%ebp),%edx
    219b:	8d 45 80             	lea    -0x80(%ebp),%eax
    219e:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    21a2:	89 54 24 04          	mov    %edx,0x4(%esp)
    21a6:	89 04 24             	mov    %eax,(%esp)
    21a9:	e8 87 16 00 00       	call   3835 <initPoint>
    21ae:	83 ec 04             	sub    $0x4,%esp
    21b1:	8b 45 80             	mov    -0x80(%ebp),%eax
    21b4:	8b 55 84             	mov    -0x7c(%ebp),%edx
    21b7:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    21ba:	89 55 b8             	mov    %edx,-0x48(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    21bd:	8b 0d 64 20 01 00    	mov    0x12064,%ecx
    21c3:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    21c6:	8b 55 b8             	mov    -0x48(%ebp),%edx
    21c9:	89 44 24 04          	mov    %eax,0x4(%esp)
    21cd:	89 54 24 08          	mov    %edx,0x8(%esp)
    21d1:	89 0c 24             	mov    %ecx,(%esp)
    21d4:	e8 66 19 00 00       	call   3b3f <executeHandler>
    21d9:	85 c0                	test   %eax,%eax
    21db:	74 16                	je     21f3 <main+0x311>
				updateWindow(winid, context.addr);
    21dd:	a1 50 20 01 00       	mov    0x12050,%eax
    21e2:	89 44 24 04          	mov    %eax,0x4(%esp)
    21e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    21e9:	89 04 24             	mov    %eax,(%esp)
    21ec:	e8 41 20 00 00       	call   4232 <updateWindow>
			}
			break;
    21f1:	eb 03                	jmp    21f6 <main+0x314>
    21f3:	eb 01                	jmp    21f6 <main+0x314>
		default:
			break;
    21f5:	90                   	nop
	freeFileItemList();
	list(".");
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	while (isRun) {
    21f6:	a1 20 ea 00 00       	mov    0xea20,%eax
    21fb:	85 c0                	test   %eax,%eax
    21fd:	0f 85 2c fe ff ff    	jne    202f <main+0x14d>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    2203:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2206:	89 44 24 04          	mov    %eax,0x4(%esp)
    220a:	c7 04 24 50 20 01 00 	movl   $0x12050,(%esp)
    2211:	e8 93 01 00 00       	call   23a9 <free_context>
	exit();
    2216:	e8 5f 1f 00 00       	call   417a <exit>

0000221b <testHandlers>:
}

void testHandlers() {
    221b:	55                   	push   %ebp
    221c:	89 e5                	mov    %esp,%ebp
    221e:	83 ec 18             	sub    $0x18,%esp

	list(".");
    2221:	c7 04 24 97 aa 00 00 	movl   $0xaa97,(%esp)
    2228:	e8 82 df ff ff       	call   1af <list>
	printf(0, "original list:\n");
    222d:	c7 44 24 04 4c ac 00 	movl   $0xac4c,0x4(%esp)
    2234:	00 
    2235:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    223c:	e8 21 21 00 00       	call   4362 <printf>
	printItemList();
    2241:	e8 97 eb ff ff       	call   ddd <printItemList>
	printf(0, "\n");
    2246:	c7 44 24 04 5c ac 00 	movl   $0xac5c,0x4(%esp)
    224d:	00 
    224e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2255:	e8 08 21 00 00       	call   4362 <printf>
	printf(0, "new a folder:\n");
    225a:	c7 44 24 04 5e ac 00 	movl   $0xac5e,0x4(%esp)
    2261:	00 
    2262:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2269:	e8 f4 20 00 00       	call   4362 <printf>
	newFolder("newfolder");
    226e:	c7 04 24 6d ac 00 00 	movl   $0xac6d,(%esp)
    2275:	e8 82 f4 ff ff       	call   16fc <newFolder>
	freeFileItemList();
    227a:	e8 52 de ff ff       	call   d1 <freeFileItemList>
	list(".");
    227f:	c7 04 24 97 aa 00 00 	movl   $0xaa97,(%esp)
    2286:	e8 24 df ff ff       	call   1af <list>
	printItemList();
    228b:	e8 4d eb ff ff       	call   ddd <printItemList>
	printf(0, "\n");
    2290:	c7 44 24 04 5c ac 00 	movl   $0xac5c,0x4(%esp)
    2297:	00 
    2298:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    229f:	e8 be 20 00 00       	call   4362 <printf>
	printf(0, "enter new folder:\n");
    22a4:	c7 44 24 04 77 ac 00 	movl   $0xac77,0x4(%esp)
    22ab:	00 
    22ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    22b3:	e8 aa 20 00 00       	call   4362 <printf>
	enterDir("newfolder");
    22b8:	c7 04 24 6d ac 00 00 	movl   $0xac6d,(%esp)
    22bf:	e8 0f f1 ff ff       	call   13d3 <enterDir>
	freeFileItemList();
    22c4:	e8 08 de ff ff       	call   d1 <freeFileItemList>
	list(".");
    22c9:	c7 04 24 97 aa 00 00 	movl   $0xaa97,(%esp)
    22d0:	e8 da de ff ff       	call   1af <list>
	printItemList();
    22d5:	e8 03 eb ff ff       	call   ddd <printItemList>
	printf(0, "\n");
    22da:	c7 44 24 04 5c ac 00 	movl   $0xac5c,0x4(%esp)
    22e1:	00 
    22e2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    22e9:	e8 74 20 00 00       	call   4362 <printf>
	printf(0, "new a file:\n");
    22ee:	c7 44 24 04 8a ac 00 	movl   $0xac8a,0x4(%esp)
    22f5:	00 
    22f6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    22fd:	e8 60 20 00 00       	call   4362 <printf>
	newFile("newfile.txt");
    2302:	c7 04 24 97 ac 00 00 	movl   $0xac97,(%esp)
    2309:	e8 04 f2 ff ff       	call   1512 <newFile>
	freeFileItemList();
    230e:	e8 be dd ff ff       	call   d1 <freeFileItemList>
	list(".");
    2313:	c7 04 24 97 aa 00 00 	movl   $0xaa97,(%esp)
    231a:	e8 90 de ff ff       	call   1af <list>
	printItemList();
    231f:	e8 b9 ea ff ff       	call   ddd <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    2324:	c9                   	leave  
    2325:	c3                   	ret    

00002326 <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    2326:	55                   	push   %ebp
    2327:	89 e5                	mov    %esp,%ebp
    2329:	83 ec 18             	sub    $0x18,%esp
    context_ptr->width = width;
    232c:	8b 45 08             	mov    0x8(%ebp),%eax
    232f:	8b 55 0c             	mov    0xc(%ebp),%edx
    2332:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    2335:	8b 45 08             	mov    0x8(%ebp),%eax
    2338:	8b 55 10             	mov    0x10(%ebp),%edx
    233b:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    233e:	8b 55 0c             	mov    0xc(%ebp),%edx
    2341:	8b 45 10             	mov    0x10(%ebp),%eax
    2344:	0f af c2             	imul   %edx,%eax
    2347:	01 c0                	add    %eax,%eax
    2349:	89 04 24             	mov    %eax,(%esp)
    234c:	e8 fd 22 00 00       	call   464e <malloc>
    2351:	8b 55 08             	mov    0x8(%ebp),%edx
    2354:	89 02                	mov    %eax,(%edx)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    2356:	8b 55 0c             	mov    0xc(%ebp),%edx
    2359:	8b 45 10             	mov    0x10(%ebp),%eax
    235c:	0f af c2             	imul   %edx,%eax
    235f:	8d 14 00             	lea    (%eax,%eax,1),%edx
    2362:	8b 45 08             	mov    0x8(%ebp),%eax
    2365:	8b 00                	mov    (%eax),%eax
    2367:	89 54 24 08          	mov    %edx,0x8(%esp)
    236b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2372:	00 
    2373:	89 04 24             	mov    %eax,(%esp)
    2376:	e8 52 1c 00 00       	call   3fcd <memset>
    initializeASCII();
    237b:	e8 93 01 00 00       	call   2513 <initializeASCII>
    initializeGBK();
    2380:	e8 17 03 00 00       	call   269c <initializeGBK>
    return createWindow(0, 0, width, height);
    2385:	8b 45 10             	mov    0x10(%ebp),%eax
    2388:	89 44 24 0c          	mov    %eax,0xc(%esp)
    238c:	8b 45 0c             	mov    0xc(%ebp),%eax
    238f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2393:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    239a:	00 
    239b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23a2:	e8 7b 1e 00 00       	call   4222 <createWindow>
}
    23a7:	c9                   	leave  
    23a8:	c3                   	ret    

000023a9 <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    23a9:	55                   	push   %ebp
    23aa:	89 e5                	mov    %esp,%ebp
    23ac:	83 ec 18             	sub    $0x18,%esp
    free(context_ptr->addr);
    23af:	8b 45 08             	mov    0x8(%ebp),%eax
    23b2:	8b 00                	mov    (%eax),%eax
    23b4:	89 04 24             	mov    %eax,(%esp)
    23b7:	e8 59 21 00 00       	call   4515 <free>
    freeASCII();
    23bc:	e8 c6 02 00 00       	call   2687 <freeASCII>
    freeGBK();
    23c1:	e8 7e 03 00 00       	call   2744 <freeGBK>
    destroyWindow(winid);
    23c6:	8b 45 0c             	mov    0xc(%ebp),%eax
    23c9:	89 04 24             	mov    %eax,(%esp)
    23cc:	e8 59 1e 00 00       	call   422a <destroyWindow>
}
    23d1:	c9                   	leave  
    23d2:	c3                   	ret    

000023d3 <draw_point>:
*             then do nothing!
*/

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    23d3:	55                   	push   %ebp
    23d4:	89 e5                	mov    %esp,%ebp
    23d6:	83 ec 04             	sub    $0x4,%esp
    23d9:	8b 45 1c             	mov    0x1c(%ebp),%eax
    23dc:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width) 
    23e0:	8b 45 0c             	mov    0xc(%ebp),%eax
    23e3:	3b 45 14             	cmp    0x14(%ebp),%eax
    23e6:	77 02                	ja     23ea <draw_point+0x17>
    return;
    23e8:	eb 26                	jmp    2410 <draw_point+0x3d>
  if(y >= c.height)
    23ea:	8b 45 10             	mov    0x10(%ebp),%eax
    23ed:	3b 45 18             	cmp    0x18(%ebp),%eax
    23f0:	77 02                	ja     23f4 <draw_point+0x21>
    return;
    23f2:	eb 1c                	jmp    2410 <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    23f4:	8b 55 08             	mov    0x8(%ebp),%edx
    23f7:	8b 45 0c             	mov    0xc(%ebp),%eax
    23fa:	0f af 45 18          	imul   0x18(%ebp),%eax
    23fe:	89 c1                	mov    %eax,%ecx
    2400:	8b 45 14             	mov    0x14(%ebp),%eax
    2403:	01 c8                	add    %ecx,%eax
    2405:	01 c0                	add    %eax,%eax
    2407:	01 c2                	add    %eax,%edx
    2409:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    240d:	66 89 02             	mov    %ax,(%edx)
}
    2410:	c9                   	leave  
    2411:	c3                   	ret    

00002412 <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    2412:	55                   	push   %ebp
    2413:	89 e5                	mov    %esp,%ebp
    2415:	83 ec 2c             	sub    $0x2c,%esp
    2418:	8b 45 24             	mov    0x24(%ebp),%eax
    241b:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    241f:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2422:	8b 55 14             	mov    0x14(%ebp),%edx
    2425:	01 c2                	add    %eax,%edx
    2427:	8b 45 0c             	mov    0xc(%ebp),%eax
    242a:	39 c2                	cmp    %eax,%edx
    242c:	0f 46 c2             	cmovbe %edx,%eax
    242f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height; 
    2432:	8b 45 20             	mov    0x20(%ebp),%eax
    2435:	8b 55 18             	mov    0x18(%ebp),%edx
    2438:	01 c2                	add    %eax,%edx
    243a:	8b 45 10             	mov    0x10(%ebp),%eax
    243d:	39 c2                	cmp    %eax,%edx
    243f:	0f 46 c2             	cmovbe %edx,%eax
    2442:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    2445:	8b 45 18             	mov    0x18(%ebp),%eax
    2448:	89 45 f8             	mov    %eax,-0x8(%ebp)
    244b:	eb 47                	jmp    2494 <fill_rect+0x82>
	{
		for (x = bx; x < mx; x++)
    244d:	8b 45 14             	mov    0x14(%ebp),%eax
    2450:	89 45 fc             	mov    %eax,-0x4(%ebp)
    2453:	eb 33                	jmp    2488 <fill_rect+0x76>
		{
			draw_point(c, x, y, color);
    2455:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    2459:	8b 55 f8             	mov    -0x8(%ebp),%edx
    245c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    245f:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2463:	89 54 24 10          	mov    %edx,0x10(%esp)
    2467:	89 44 24 0c          	mov    %eax,0xc(%esp)
    246b:	8b 45 08             	mov    0x8(%ebp),%eax
    246e:	89 04 24             	mov    %eax,(%esp)
    2471:	8b 45 0c             	mov    0xc(%ebp),%eax
    2474:	89 44 24 04          	mov    %eax,0x4(%esp)
    2478:	8b 45 10             	mov    0x10(%ebp),%eax
    247b:	89 44 24 08          	mov    %eax,0x8(%esp)
    247f:	e8 4f ff ff ff       	call   23d3 <draw_point>
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    2484:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    2488:	8b 45 fc             	mov    -0x4(%ebp),%eax
    248b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    248e:	7c c5                	jl     2455 <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
    2490:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2494:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2497:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    249a:	7c b1                	jl     244d <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    249c:	c9                   	leave  
    249d:	c3                   	ret    

0000249e <printBinary>:

void printBinary(char c)
{
    249e:	55                   	push   %ebp
    249f:	89 e5                	mov    %esp,%ebp
    24a1:	83 ec 28             	sub    $0x28,%esp
    24a4:	8b 45 08             	mov    0x8(%ebp),%eax
    24a7:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    24aa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    24b1:	eb 44                	jmp    24f7 <printBinary+0x59>
	{
		if(((c << i) & 0x80) != 0)
    24b3:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    24b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24ba:	89 c1                	mov    %eax,%ecx
    24bc:	d3 e2                	shl    %cl,%edx
    24be:	89 d0                	mov    %edx,%eax
    24c0:	25 80 00 00 00       	and    $0x80,%eax
    24c5:	85 c0                	test   %eax,%eax
    24c7:	74 16                	je     24df <printBinary+0x41>
		{
			printf(0, "1");
    24c9:	c7 44 24 04 a3 ac 00 	movl   $0xaca3,0x4(%esp)
    24d0:	00 
    24d1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24d8:	e8 85 1e 00 00       	call   4362 <printf>
    24dd:	eb 14                	jmp    24f3 <printBinary+0x55>
		}
		else
		{
			printf(0, "0");
    24df:	c7 44 24 04 a5 ac 00 	movl   $0xaca5,0x4(%esp)
    24e6:	00 
    24e7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24ee:	e8 6f 1e 00 00       	call   4362 <printf>
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    24f3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    24f7:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    24fb:	7e b6                	jle    24b3 <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    24fd:	c7 44 24 04 a7 ac 00 	movl   $0xaca7,0x4(%esp)
    2504:	00 
    2505:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    250c:	e8 51 1e 00 00       	call   4362 <printf>
}
    2511:	c9                   	leave  
    2512:	c3                   	ret    

00002513 <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    2513:	55                   	push   %ebp
    2514:	89 e5                	mov    %esp,%ebp
    2516:	56                   	push   %esi
    2517:	53                   	push   %ebx
    2518:	83 ec 30             	sub    $0x30,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    251b:	c7 44 24 04 a9 ac 00 	movl   $0xaca9,0x4(%esp)
    2522:	00 
    2523:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    252a:	e8 33 1e 00 00       	call   4362 <printf>
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    252f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2536:	00 
    2537:	c7 04 24 bc ac 00 00 	movl   $0xacbc,(%esp)
    253e:	e8 77 1c 00 00       	call   41ba <open>
    2543:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2546:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    254a:	79 21                	jns    256d <initializeASCII+0x5a>
	  printf(0,"cannot open %s\n", HANKAKU);
    254c:	c7 44 24 08 bc ac 00 	movl   $0xacbc,0x8(%esp)
    2553:	00 
    2554:	c7 44 24 04 c8 ac 00 	movl   $0xacc8,0x4(%esp)
    255b:	00 
    255c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2563:	e8 fa 1d 00 00       	call   4362 <printf>
	  return;
    2568:	e9 13 01 00 00       	jmp    2680 <initializeASCII+0x16d>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    256d:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2574:	e8 d5 20 00 00       	call   464e <malloc>
    2579:	a3 80 20 01 00       	mov    %eax,0x12080
	for (i = 0; i < ASCII_NUM; i++)
    257e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2585:	eb 12                	jmp    2599 <initializeASCII+0x86>
	{
		hankaku[i] = 0;
    2587:	8b 15 80 20 01 00    	mov    0x12080,%edx
    258d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2590:	01 d0                	add    %edx,%eax
    2592:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    2595:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2599:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    25a0:	7e e5                	jle    2587 <initializeASCII+0x74>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    25a2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    25a9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    25b0:	e9 84 00 00 00       	jmp    2639 <initializeASCII+0x126>
	{
		for (i = 0; i < n; i++){
    25b5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    25bc:	eb 73                	jmp    2631 <initializeASCII+0x11e>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    25be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25c1:	05 a0 20 01 00       	add    $0x120a0,%eax
    25c6:	0f b6 00             	movzbl (%eax),%eax
    25c9:	3c 2a                	cmp    $0x2a,%al
    25cb:	74 0f                	je     25dc <initializeASCII+0xc9>
    25cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25d0:	05 a0 20 01 00       	add    $0x120a0,%eax
    25d5:	0f b6 00             	movzbl (%eax),%eax
    25d8:	3c 2e                	cmp    $0x2e,%al
    25da:	75 51                	jne    262d <initializeASCII+0x11a>
			{
				if (buf[i] == '*')
    25dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25df:	05 a0 20 01 00       	add    $0x120a0,%eax
    25e4:	0f b6 00             	movzbl (%eax),%eax
    25e7:	3c 2a                	cmp    $0x2a,%al
    25e9:	75 2d                	jne    2618 <initializeASCII+0x105>
				{
					hankaku[y] |= (0x80 >> x);
    25eb:	8b 15 80 20 01 00    	mov    0x12080,%edx
    25f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    25f4:	01 c2                	add    %eax,%edx
    25f6:	8b 0d 80 20 01 00    	mov    0x12080,%ecx
    25fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    25ff:	01 c8                	add    %ecx,%eax
    2601:	0f b6 00             	movzbl (%eax),%eax
    2604:	89 c3                	mov    %eax,%ebx
    2606:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2609:	be 80 00 00 00       	mov    $0x80,%esi
    260e:	89 c1                	mov    %eax,%ecx
    2610:	d3 fe                	sar    %cl,%esi
    2612:	89 f0                	mov    %esi,%eax
    2614:	09 d8                	or     %ebx,%eax
    2616:	88 02                	mov    %al,(%edx)
				}
				x ++;
    2618:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    261c:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    2620:	7e 0b                	jle    262d <initializeASCII+0x11a>
				{
					x = 0;
    2622:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    2629:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    262d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2631:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2634:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    2637:	7c 85                	jl     25be <initializeASCII+0xab>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    2639:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    2640:	00 
    2641:	c7 44 24 04 a0 20 01 	movl   $0x120a0,0x4(%esp)
    2648:	00 
    2649:	8b 45 e8             	mov    -0x18(%ebp),%eax
    264c:	89 04 24             	mov    %eax,(%esp)
    264f:	e8 3e 1b 00 00       	call   4192 <read>
    2654:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2657:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    265b:	0f 8f 54 ff ff ff    	jg     25b5 <initializeASCII+0xa2>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    2661:	c7 44 24 04 d8 ac 00 	movl   $0xacd8,0x4(%esp)
    2668:	00 
    2669:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2670:	e8 ed 1c 00 00       	call   4362 <printf>
	close(fd);
    2675:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2678:	89 04 24             	mov    %eax,(%esp)
    267b:	e8 22 1b 00 00       	call   41a2 <close>
}
    2680:	83 c4 30             	add    $0x30,%esp
    2683:	5b                   	pop    %ebx
    2684:	5e                   	pop    %esi
    2685:	5d                   	pop    %ebp
    2686:	c3                   	ret    

00002687 <freeASCII>:

void freeASCII(){
    2687:	55                   	push   %ebp
    2688:	89 e5                	mov    %esp,%ebp
    268a:	83 ec 18             	sub    $0x18,%esp
	free(hankaku);
    268d:	a1 80 20 01 00       	mov    0x12080,%eax
    2692:	89 04 24             	mov    %eax,(%esp)
    2695:	e8 7b 1e 00 00       	call   4515 <free>
}
    269a:	c9                   	leave  
    269b:	c3                   	ret    

0000269c <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    269c:	55                   	push   %ebp
    269d:	89 e5                	mov    %esp,%ebp
    269f:	83 ec 28             	sub    $0x28,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    26a2:	c7 44 24 04 f5 ac 00 	movl   $0xacf5,0x4(%esp)
    26a9:	00 
    26aa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26b1:	e8 ac 1c 00 00       	call   4362 <printf>
	if((fd = open(HZK16, 0)) < 0){
    26b6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    26bd:	00 
    26be:	c7 04 24 06 ad 00 00 	movl   $0xad06,(%esp)
    26c5:	e8 f0 1a 00 00       	call   41ba <open>
    26ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
    26cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    26d1:	79 1e                	jns    26f1 <initializeGBK+0x55>
		printf(0,"cannot open %s\n", HZK16);
    26d3:	c7 44 24 08 06 ad 00 	movl   $0xad06,0x8(%esp)
    26da:	00 
    26db:	c7 44 24 04 c8 ac 00 	movl   $0xacc8,0x4(%esp)
    26e2:	00 
    26e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26ea:	e8 73 1c 00 00       	call   4362 <printf>
		return;
    26ef:	eb 51                	jmp    2742 <initializeGBK+0xa6>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    26f1:	c7 04 24 78 69 00 00 	movl   $0x6978,(%esp)
    26f8:	e8 51 1f 00 00       	call   464e <malloc>
    26fd:	a3 84 20 01 00       	mov    %eax,0x12084
	fontFile.size = read(fd, fontFile.buf, 27000);
    2702:	a1 84 20 01 00       	mov    0x12084,%eax
    2707:	c7 44 24 08 78 69 00 	movl   $0x6978,0x8(%esp)
    270e:	00 
    270f:	89 44 24 04          	mov    %eax,0x4(%esp)
    2713:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2716:	89 04 24             	mov    %eax,(%esp)
    2719:	e8 74 1a 00 00       	call   4192 <read>
    271e:	a3 88 20 01 00       	mov    %eax,0x12088
	printf(0,"initialzing gbk complete!\n");
    2723:	c7 44 24 04 10 ad 00 	movl   $0xad10,0x4(%esp)
    272a:	00 
    272b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2732:	e8 2b 1c 00 00       	call   4362 <printf>
	close(fd);
    2737:	8b 45 f4             	mov    -0xc(%ebp),%eax
    273a:	89 04 24             	mov    %eax,(%esp)
    273d:	e8 60 1a 00 00       	call   41a2 <close>
}
    2742:	c9                   	leave  
    2743:	c3                   	ret    

00002744 <freeGBK>:

void freeGBK(){
    2744:	55                   	push   %ebp
    2745:	89 e5                	mov    %esp,%ebp
    2747:	83 ec 18             	sub    $0x18,%esp
	free(fontFile.buf);
    274a:	a1 84 20 01 00       	mov    0x12084,%eax
    274f:	89 04 24             	mov    %eax,(%esp)
    2752:	e8 be 1d 00 00       	call   4515 <free>
}
    2757:	c9                   	leave  
    2758:	c3                   	ret    

00002759 <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    2759:	55                   	push   %ebp
    275a:	89 e5                	mov    %esp,%ebp
    275c:	53                   	push   %ebx
    275d:	83 ec 30             	sub    $0x30,%esp
    2760:	8b 55 14             	mov    0x14(%ebp),%edx
    2763:	8b 45 18             	mov    0x18(%ebp),%eax
    2766:	88 55 e8             	mov    %dl,-0x18(%ebp)
    2769:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    276d:	8b 45 20             	mov    0x20(%ebp),%eax
    2770:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2773:	eb 7f                	jmp    27f4 <put_ascii+0x9b>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    2775:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    277c:	eb 6c                	jmp    27ea <put_ascii+0x91>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    277e:	a1 80 20 01 00       	mov    0x12080,%eax
    2783:	0f b6 55 e8          	movzbl -0x18(%ebp),%edx
    2787:	c1 e2 04             	shl    $0x4,%edx
    278a:	89 d1                	mov    %edx,%ecx
    278c:	8b 55 20             	mov    0x20(%ebp),%edx
    278f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    2792:	29 d3                	sub    %edx,%ebx
    2794:	89 da                	mov    %ebx,%edx
    2796:	01 ca                	add    %ecx,%edx
    2798:	01 d0                	add    %edx,%eax
    279a:	0f b6 00             	movzbl (%eax),%eax
    279d:	0f b6 d0             	movzbl %al,%edx
    27a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    27a3:	89 c1                	mov    %eax,%ecx
    27a5:	d3 e2                	shl    %cl,%edx
    27a7:	89 d0                	mov    %edx,%eax
    27a9:	25 80 00 00 00       	and    $0x80,%eax
    27ae:	85 c0                	test   %eax,%eax
    27b0:	74 34                	je     27e6 <put_ascii+0x8d>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    27b2:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    27b6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    27b9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    27bc:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    27bf:	01 d8                	add    %ebx,%eax
    27c1:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    27c5:	89 54 24 10          	mov    %edx,0x10(%esp)
    27c9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    27cd:	8b 45 08             	mov    0x8(%ebp),%eax
    27d0:	89 04 24             	mov    %eax,(%esp)
    27d3:	8b 45 0c             	mov    0xc(%ebp),%eax
    27d6:	89 44 24 04          	mov    %eax,0x4(%esp)
    27da:	8b 45 10             	mov    0x10(%ebp),%eax
    27dd:	89 44 24 08          	mov    %eax,0x8(%esp)
    27e1:	e8 ed fb ff ff       	call   23d3 <draw_point>
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    27e6:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    27ea:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    27ee:	7e 8e                	jle    277e <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    27f0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    27f4:	8b 45 20             	mov    0x20(%ebp),%eax
    27f7:	83 c0 10             	add    $0x10,%eax
    27fa:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    27fd:	0f 8f 72 ff ff ff    	jg     2775 <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    2803:	83 c4 30             	add    $0x30,%esp
    2806:	5b                   	pop    %ebx
    2807:	5d                   	pop    %ebp
    2808:	c3                   	ret    

00002809 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    2809:	55                   	push   %ebp
    280a:	89 e5                	mov    %esp,%ebp
    280c:	53                   	push   %ebx
    280d:	83 ec 34             	sub    $0x34,%esp
    2810:	8b 55 14             	mov    0x14(%ebp),%edx
    2813:	8b 45 18             	mov    0x18(%ebp),%eax
    2816:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    281a:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    281e:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    2822:	0f b6 c0             	movzbl %al,%eax
    2825:	3d a0 00 00 00       	cmp    $0xa0,%eax
    282a:	0f 8e 40 01 00 00    	jle    2970 <put_gbk+0x167>
    2830:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2834:	66 c1 f8 08          	sar    $0x8,%ax
    2838:	98                   	cwtl   
    2839:	0f b6 c0             	movzbl %al,%eax
    283c:	3d a0 00 00 00       	cmp    $0xa0,%eax
    2841:	0f 8e 29 01 00 00    	jle    2970 <put_gbk+0x167>
		hzk16Base = fontFile.buf;
    2847:	a1 84 20 01 00       	mov    0x12084,%eax
    284c:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    284f:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    2853:	0f b6 c0             	movzbl %al,%eax
    2856:	2d a1 00 00 00       	sub    $0xa1,%eax
    285b:	6b c0 5e             	imul   $0x5e,%eax,%eax
    285e:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    2862:	66 c1 fa 08          	sar    $0x8,%dx
    2866:	0f bf d2             	movswl %dx,%edx
    2869:	0f b6 d2             	movzbl %dl,%edx
    286c:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    2872:	01 d0                	add    %edx,%eax
    2874:	c1 e0 05             	shl    $0x5,%eax
    2877:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    287a:	8b 45 20             	mov    0x20(%ebp),%eax
    287d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2880:	e9 da 00 00 00       	jmp    295f <put_gbk+0x156>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2885:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    288c:	eb 58                	jmp    28e6 <put_gbk+0xdd>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    288e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2891:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2894:	01 d0                	add    %edx,%eax
    2896:	0f b6 00             	movzbl (%eax),%eax
    2899:	0f b6 d0             	movzbl %al,%edx
    289c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    289f:	89 c1                	mov    %eax,%ecx
    28a1:	d3 e2                	shl    %cl,%edx
    28a3:	89 d0                	mov    %edx,%eax
    28a5:	25 80 00 00 00       	and    $0x80,%eax
    28aa:	85 c0                	test   %eax,%eax
    28ac:	74 34                	je     28e2 <put_gbk+0xd9>
					draw_point(c, x + tmpX, tmpY, colorNum);
    28ae:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    28b2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    28b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    28b8:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    28bb:	01 d8                	add    %ebx,%eax
    28bd:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    28c1:	89 54 24 10          	mov    %edx,0x10(%esp)
    28c5:	89 44 24 0c          	mov    %eax,0xc(%esp)
    28c9:	8b 45 08             	mov    0x8(%ebp),%eax
    28cc:	89 04 24             	mov    %eax,(%esp)
    28cf:	8b 45 0c             	mov    0xc(%ebp),%eax
    28d2:	89 44 24 04          	mov    %eax,0x4(%esp)
    28d6:	8b 45 10             	mov    0x10(%ebp),%eax
    28d9:	89 44 24 08          	mov    %eax,0x8(%esp)
    28dd:	e8 f1 fa ff ff       	call   23d3 <draw_point>
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    28e2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    28e6:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    28ea:	7e a2                	jle    288e <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    28ec:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    28f0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    28f7:	eb 58                	jmp    2951 <put_gbk+0x148>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    28f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    28fc:	8b 55 ec             	mov    -0x14(%ebp),%edx
    28ff:	01 d0                	add    %edx,%eax
    2901:	0f b6 00             	movzbl (%eax),%eax
    2904:	0f b6 d0             	movzbl %al,%edx
    2907:	8b 45 f8             	mov    -0x8(%ebp),%eax
    290a:	89 c1                	mov    %eax,%ecx
    290c:	d3 e2                	shl    %cl,%edx
    290e:	89 d0                	mov    %edx,%eax
    2910:	25 80 00 00 00       	and    $0x80,%eax
    2915:	85 c0                	test   %eax,%eax
    2917:	74 34                	je     294d <put_gbk+0x144>
					draw_point(c, x + tmpX, tmpY, colorNum);
    2919:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    291d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2920:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2923:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2926:	01 d8                	add    %ebx,%eax
    2928:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    292c:	89 54 24 10          	mov    %edx,0x10(%esp)
    2930:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2934:	8b 45 08             	mov    0x8(%ebp),%eax
    2937:	89 04 24             	mov    %eax,(%esp)
    293a:	8b 45 0c             	mov    0xc(%ebp),%eax
    293d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2941:	8b 45 10             	mov    0x10(%ebp),%eax
    2944:	89 44 24 08          	mov    %eax,0x8(%esp)
    2948:	e8 86 fa ff ff       	call   23d3 <draw_point>
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    294d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2951:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2955:	7e a2                	jle    28f9 <put_gbk+0xf0>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    2957:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    295b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    295f:	8b 45 20             	mov    0x20(%ebp),%eax
    2962:	83 c0 10             	add    $0x10,%eax
    2965:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2968:	0f 8f 17 ff ff ff    	jg     2885 <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    296e:	eb 7b                	jmp    29eb <put_gbk+0x1e2>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    2970:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2974:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2978:	0f b6 c0             	movzbl %al,%eax
    297b:	8b 4d 20             	mov    0x20(%ebp),%ecx
    297e:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2982:	8b 4d 1c             	mov    0x1c(%ebp),%ecx
    2985:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2989:	89 54 24 10          	mov    %edx,0x10(%esp)
    298d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2991:	8b 45 08             	mov    0x8(%ebp),%eax
    2994:	89 04 24             	mov    %eax,(%esp)
    2997:	8b 45 0c             	mov    0xc(%ebp),%eax
    299a:	89 44 24 04          	mov    %eax,0x4(%esp)
    299e:	8b 45 10             	mov    0x10(%ebp),%eax
    29a1:	89 44 24 08          	mov    %eax,0x8(%esp)
    29a5:	e8 af fd ff ff       	call   2759 <put_ascii>
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    29aa:	8b 45 1c             	mov    0x1c(%ebp),%eax
    29ad:	8d 58 08             	lea    0x8(%eax),%ebx
    29b0:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    29b4:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    29b8:	66 c1 f8 08          	sar    $0x8,%ax
    29bc:	0f b6 c0             	movzbl %al,%eax
    29bf:	8b 4d 20             	mov    0x20(%ebp),%ecx
    29c2:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    29c6:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    29ca:	89 54 24 10          	mov    %edx,0x10(%esp)
    29ce:	89 44 24 0c          	mov    %eax,0xc(%esp)
    29d2:	8b 45 08             	mov    0x8(%ebp),%eax
    29d5:	89 04 24             	mov    %eax,(%esp)
    29d8:	8b 45 0c             	mov    0xc(%ebp),%eax
    29db:	89 44 24 04          	mov    %eax,0x4(%esp)
    29df:	8b 45 10             	mov    0x10(%ebp),%eax
    29e2:	89 44 24 08          	mov    %eax,0x8(%esp)
    29e6:	e8 6e fd ff ff       	call   2759 <put_ascii>
	}
}
    29eb:	83 c4 34             	add    $0x34,%esp
    29ee:	5b                   	pop    %ebx
    29ef:	5d                   	pop    %ebp
    29f0:	c3                   	ret    

000029f1 <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    29f1:	55                   	push   %ebp
    29f2:	89 e5                	mov    %esp,%ebp
    29f4:	83 ec 38             	sub    $0x38,%esp
    29f7:	8b 45 18             	mov    0x18(%ebp),%eax
    29fa:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    29fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    2a05:	8b 45 14             	mov    0x14(%ebp),%eax
    2a08:	89 04 24             	mov    %eax,(%esp)
    2a0b:	e8 96 15 00 00       	call   3fa6 <strlen>
    2a10:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    2a13:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2a1a:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2a1d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2a20:	eb 49                	jmp    2a6b <puts_str+0x7a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    2a22:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2a26:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2a29:	8b 45 14             	mov    0x14(%ebp),%eax
    2a2c:	01 c8                	add    %ecx,%eax
    2a2e:	0f b6 00             	movzbl (%eax),%eax
    2a31:	0f b6 c0             	movzbl %al,%eax
    2a34:	8b 4d 20             	mov    0x20(%ebp),%ecx
    2a37:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2a3b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    2a3e:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2a42:	89 54 24 10          	mov    %edx,0x10(%esp)
    2a46:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2a4a:	8b 45 08             	mov    0x8(%ebp),%eax
    2a4d:	89 04 24             	mov    %eax,(%esp)
    2a50:	8b 45 0c             	mov    0xc(%ebp),%eax
    2a53:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a57:	8b 45 10             	mov    0x10(%ebp),%eax
    2a5a:	89 44 24 08          	mov    %eax,0x8(%esp)
    2a5e:	e8 f6 fc ff ff       	call   2759 <put_ascii>
			xTmp += 8;
    2a63:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    2a67:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    2a6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a6e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    2a71:	72 af                	jb     2a22 <puts_str+0x31>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    2a73:	c9                   	leave  
    2a74:	c3                   	ret    

00002a75 <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    2a75:	55                   	push   %ebp
    2a76:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    2a78:	8b 45 10             	mov    0x10(%ebp),%eax
    2a7b:	8d 50 07             	lea    0x7(%eax),%edx
    2a7e:	85 c0                	test   %eax,%eax
    2a80:	0f 48 c2             	cmovs  %edx,%eax
    2a83:	c1 f8 03             	sar    $0x3,%eax
    2a86:	89 c2                	mov    %eax,%edx
    2a88:	8b 45 0c             	mov    0xc(%ebp),%eax
    2a8b:	8d 48 03             	lea    0x3(%eax),%ecx
    2a8e:	85 c0                	test   %eax,%eax
    2a90:	0f 48 c1             	cmovs  %ecx,%eax
    2a93:	c1 f8 02             	sar    $0x2,%eax
    2a96:	c1 e0 05             	shl    $0x5,%eax
    2a99:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    2a9c:	8b 45 08             	mov    0x8(%ebp),%eax
    2a9f:	8d 50 07             	lea    0x7(%eax),%edx
    2aa2:	85 c0                	test   %eax,%eax
    2aa4:	0f 48 c2             	cmovs  %edx,%eax
    2aa7:	c1 f8 03             	sar    $0x3,%eax
    2aaa:	c1 e0 0b             	shl    $0xb,%eax
    2aad:	01 c8                	add    %ecx,%eax
}
    2aaf:	5d                   	pop    %ebp
    2ab0:	c3                   	ret    

00002ab1 <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    2ab1:	55                   	push   %ebp
    2ab2:	89 e5                	mov    %esp,%ebp
    2ab4:	53                   	push   %ebx
    2ab5:	83 ec 28             	sub    $0x28,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    2ab8:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2abf:	e9 b1 00 00 00       	jmp    2b75 <draw_picture+0xc4>
	{
		for (j = 0; j < pic.width; j++)
    2ac4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2acb:	e9 95 00 00 00       	jmp    2b65 <draw_picture+0xb4>
		{
			rgb = pic.data[i*pic.width+j];
    2ad0:	8b 55 14             	mov    0x14(%ebp),%edx
    2ad3:	8b 45 18             	mov    0x18(%ebp),%eax
    2ad6:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    2ada:	89 c1                	mov    %eax,%ecx
    2adc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2adf:	01 c8                	add    %ecx,%eax
    2ae1:	c1 e0 02             	shl    $0x2,%eax
    2ae4:	01 d0                	add    %edx,%eax
    2ae6:	8b 00                	mov    (%eax),%eax
    2ae8:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    2aeb:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    2aef:	3c 01                	cmp    $0x1,%al
    2af1:	75 02                	jne    2af5 <draw_picture+0x44>
    2af3:	eb 6c                	jmp    2b61 <draw_picture+0xb0>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    2af5:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    2af9:	0f b6 c8             	movzbl %al,%ecx
    2afc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    2b00:	0f b6 d0             	movzbl %al,%edx
    2b03:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    2b07:	0f b6 c0             	movzbl %al,%eax
    2b0a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2b0e:	89 54 24 04          	mov    %edx,0x4(%esp)
    2b12:	89 04 24             	mov    %eax,(%esp)
    2b15:	e8 5b ff ff ff       	call   2a75 <_RGB16BIT565>
    2b1a:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    2b1e:	0f b7 4d f2          	movzwl -0xe(%ebp),%ecx
    2b22:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2b25:	83 e8 01             	sub    $0x1,%eax
    2b28:	2b 45 f8             	sub    -0x8(%ebp),%eax
    2b2b:	89 c2                	mov    %eax,%edx
    2b2d:	8b 45 24             	mov    0x24(%ebp),%eax
    2b30:	01 d0                	add    %edx,%eax
    2b32:	89 c2                	mov    %eax,%edx
    2b34:	8b 45 20             	mov    0x20(%ebp),%eax
    2b37:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    2b3a:	01 d8                	add    %ebx,%eax
    2b3c:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2b40:	89 54 24 10          	mov    %edx,0x10(%esp)
    2b44:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2b48:	8b 45 08             	mov    0x8(%ebp),%eax
    2b4b:	89 04 24             	mov    %eax,(%esp)
    2b4e:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b51:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b55:	8b 45 10             	mov    0x10(%ebp),%eax
    2b58:	89 44 24 08          	mov    %eax,0x8(%esp)
    2b5c:	e8 72 f8 ff ff       	call   23d3 <draw_point>
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    2b61:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2b65:	8b 45 18             	mov    0x18(%ebp),%eax
    2b68:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2b6b:	0f 8f 5f ff ff ff    	jg     2ad0 <draw_picture+0x1f>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    2b71:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2b75:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2b78:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    2b7b:	0f 8f 43 ff ff ff    	jg     2ac4 <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    2b81:	83 c4 28             	add    $0x28,%esp
    2b84:	5b                   	pop    %ebx
    2b85:	5d                   	pop    %ebp
    2b86:	c3                   	ret    

00002b87 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    2b87:	55                   	push   %ebp
    2b88:	89 e5                	mov    %esp,%ebp
    2b8a:	83 ec 3c             	sub    $0x3c,%esp
    2b8d:	8b 45 24             	mov    0x24(%ebp),%eax
    2b90:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    2b94:	8b 45 14             	mov    0x14(%ebp),%eax
    2b97:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2b9a:	29 c2                	sub    %eax,%edx
    2b9c:	89 d0                	mov    %edx,%eax
    2b9e:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    2ba1:	8b 45 18             	mov    0x18(%ebp),%eax
    2ba4:	8b 55 20             	mov    0x20(%ebp),%edx
    2ba7:	29 c2                	sub    %eax,%edx
    2ba9:	89 d0                	mov    %edx,%eax
    2bab:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    2bae:	8b 45 14             	mov    0x14(%ebp),%eax
    2bb1:	c1 e0 0a             	shl    $0xa,%eax
    2bb4:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    2bb7:	8b 45 18             	mov    0x18(%ebp),%eax
    2bba:	c1 e0 0a             	shl    $0xa,%eax
    2bbd:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    2bc0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2bc3:	c1 f8 1f             	sar    $0x1f,%eax
    2bc6:	31 45 fc             	xor    %eax,-0x4(%ebp)
    2bc9:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    2bcc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2bcf:	c1 f8 1f             	sar    $0x1f,%eax
    2bd2:	31 45 f8             	xor    %eax,-0x8(%ebp)
    2bd5:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    2bd8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2bdb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    2bde:	7c 57                	jl     2c37 <draw_line+0xb0>
		len = dx + 1;
    2be0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2be3:	83 c0 01             	add    $0x1,%eax
    2be6:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    2be9:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2bec:	3b 45 14             	cmp    0x14(%ebp),%eax
    2bef:	7e 07                	jle    2bf8 <draw_line+0x71>
    2bf1:	b8 00 04 00 00       	mov    $0x400,%eax
    2bf6:	eb 05                	jmp    2bfd <draw_line+0x76>
    2bf8:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    2bfd:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    2c00:	8b 45 20             	mov    0x20(%ebp),%eax
    2c03:	3b 45 18             	cmp    0x18(%ebp),%eax
    2c06:	7c 16                	jl     2c1e <draw_line+0x97>
    2c08:	8b 45 18             	mov    0x18(%ebp),%eax
    2c0b:	8b 55 20             	mov    0x20(%ebp),%edx
    2c0e:	29 c2                	sub    %eax,%edx
    2c10:	89 d0                	mov    %edx,%eax
    2c12:	83 c0 01             	add    $0x1,%eax
    2c15:	c1 e0 0a             	shl    $0xa,%eax
    2c18:	99                   	cltd   
    2c19:	f7 7d ec             	idivl  -0x14(%ebp)
    2c1c:	eb 14                	jmp    2c32 <draw_line+0xab>
    2c1e:	8b 45 18             	mov    0x18(%ebp),%eax
    2c21:	8b 55 20             	mov    0x20(%ebp),%edx
    2c24:	29 c2                	sub    %eax,%edx
    2c26:	89 d0                	mov    %edx,%eax
    2c28:	83 e8 01             	sub    $0x1,%eax
    2c2b:	c1 e0 0a             	shl    $0xa,%eax
    2c2e:	99                   	cltd   
    2c2f:	f7 7d ec             	idivl  -0x14(%ebp)
    2c32:	89 45 f8             	mov    %eax,-0x8(%ebp)
    2c35:	eb 55                	jmp    2c8c <draw_line+0x105>
	}
	else {
		len = dy + 1;
    2c37:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2c3a:	83 c0 01             	add    $0x1,%eax
    2c3d:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    2c40:	8b 45 20             	mov    0x20(%ebp),%eax
    2c43:	3b 45 18             	cmp    0x18(%ebp),%eax
    2c46:	7e 07                	jle    2c4f <draw_line+0xc8>
    2c48:	b8 00 04 00 00       	mov    $0x400,%eax
    2c4d:	eb 05                	jmp    2c54 <draw_line+0xcd>
    2c4f:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    2c54:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    2c57:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2c5a:	3b 45 14             	cmp    0x14(%ebp),%eax
    2c5d:	7c 16                	jl     2c75 <draw_line+0xee>
    2c5f:	8b 45 14             	mov    0x14(%ebp),%eax
    2c62:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2c65:	29 c2                	sub    %eax,%edx
    2c67:	89 d0                	mov    %edx,%eax
    2c69:	83 c0 01             	add    $0x1,%eax
    2c6c:	c1 e0 0a             	shl    $0xa,%eax
    2c6f:	99                   	cltd   
    2c70:	f7 7d ec             	idivl  -0x14(%ebp)
    2c73:	eb 14                	jmp    2c89 <draw_line+0x102>
    2c75:	8b 45 14             	mov    0x14(%ebp),%eax
    2c78:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2c7b:	29 c2                	sub    %eax,%edx
    2c7d:	89 d0                	mov    %edx,%eax
    2c7f:	83 e8 01             	sub    $0x1,%eax
    2c82:	c1 e0 0a             	shl    $0xa,%eax
    2c85:	99                   	cltd   
    2c86:	f7 7d ec             	idivl  -0x14(%ebp)
    2c89:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    2c8c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    2c93:	eb 47                	jmp    2cdc <draw_line+0x155>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    2c95:	0f b7 4d dc          	movzwl -0x24(%ebp),%ecx
    2c99:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2c9c:	c1 f8 0a             	sar    $0xa,%eax
    2c9f:	89 c2                	mov    %eax,%edx
    2ca1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ca4:	c1 f8 0a             	sar    $0xa,%eax
    2ca7:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2cab:	89 54 24 10          	mov    %edx,0x10(%esp)
    2caf:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2cb3:	8b 45 08             	mov    0x8(%ebp),%eax
    2cb6:	89 04 24             	mov    %eax,(%esp)
    2cb9:	8b 45 0c             	mov    0xc(%ebp),%eax
    2cbc:	89 44 24 04          	mov    %eax,0x4(%esp)
    2cc0:	8b 45 10             	mov    0x10(%ebp),%eax
    2cc3:	89 44 24 08          	mov    %eax,0x8(%esp)
    2cc7:	e8 07 f7 ff ff       	call   23d3 <draw_point>
		y += dy;
    2ccc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2ccf:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    2cd2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2cd5:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    2cd8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    2cdc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2cdf:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    2ce2:	7c b1                	jl     2c95 <draw_line+0x10e>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    2ce4:	c9                   	leave  
    2ce5:	c3                   	ret    

00002ce6 <draw_window>:

void
draw_window(Context c, char *title)
{
    2ce6:	55                   	push   %ebp
    2ce7:	89 e5                	mov    %esp,%ebp
    2ce9:	83 ec 38             	sub    $0x38,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    2cec:	8b 45 0c             	mov    0xc(%ebp),%eax
    2cef:	83 e8 01             	sub    $0x1,%eax
    2cf2:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    2cf9:	00 
    2cfa:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    2d01:	00 
    2d02:	89 44 24 14          	mov    %eax,0x14(%esp)
    2d06:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    2d0d:	00 
    2d0e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    2d15:	00 
    2d16:	8b 45 08             	mov    0x8(%ebp),%eax
    2d19:	89 04 24             	mov    %eax,(%esp)
    2d1c:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d1f:	89 44 24 04          	mov    %eax,0x4(%esp)
    2d23:	8b 45 10             	mov    0x10(%ebp),%eax
    2d26:	89 44 24 08          	mov    %eax,0x8(%esp)
    2d2a:	e8 58 fe ff ff       	call   2b87 <draw_line>
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    2d2f:	8b 45 10             	mov    0x10(%ebp),%eax
    2d32:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2d35:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d38:	8d 50 ff             	lea    -0x1(%eax),%edx
    2d3b:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d3e:	83 e8 01             	sub    $0x1,%eax
    2d41:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    2d48:	00 
    2d49:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2d4d:	89 54 24 14          	mov    %edx,0x14(%esp)
    2d51:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    2d58:	00 
    2d59:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2d5d:	8b 45 08             	mov    0x8(%ebp),%eax
    2d60:	89 04 24             	mov    %eax,(%esp)
    2d63:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d66:	89 44 24 04          	mov    %eax,0x4(%esp)
    2d6a:	8b 45 10             	mov    0x10(%ebp),%eax
    2d6d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2d71:	e8 11 fe ff ff       	call   2b87 <draw_line>
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    2d76:	8b 45 10             	mov    0x10(%ebp),%eax
    2d79:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2d7c:	8b 45 10             	mov    0x10(%ebp),%eax
    2d7f:	8d 50 ff             	lea    -0x1(%eax),%edx
    2d82:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d85:	83 e8 01             	sub    $0x1,%eax
    2d88:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    2d8f:	00 
    2d90:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2d94:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    2d9b:	00 
    2d9c:	89 54 24 10          	mov    %edx,0x10(%esp)
    2da0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2da4:	8b 45 08             	mov    0x8(%ebp),%eax
    2da7:	89 04 24             	mov    %eax,(%esp)
    2daa:	8b 45 0c             	mov    0xc(%ebp),%eax
    2dad:	89 44 24 04          	mov    %eax,0x4(%esp)
    2db1:	8b 45 10             	mov    0x10(%ebp),%eax
    2db4:	89 44 24 08          	mov    %eax,0x8(%esp)
    2db8:	e8 ca fd ff ff       	call   2b87 <draw_line>
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    2dbd:	8b 45 10             	mov    0x10(%ebp),%eax
    2dc0:	83 e8 01             	sub    $0x1,%eax
    2dc3:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    2dca:	00 
    2dcb:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    2dd2:	00 
    2dd3:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    2dda:	00 
    2ddb:	89 44 24 10          	mov    %eax,0x10(%esp)
    2ddf:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    2de6:	00 
    2de7:	8b 45 08             	mov    0x8(%ebp),%eax
    2dea:	89 04 24             	mov    %eax,(%esp)
    2ded:	8b 45 0c             	mov    0xc(%ebp),%eax
    2df0:	89 44 24 04          	mov    %eax,0x4(%esp)
    2df4:	8b 45 10             	mov    0x10(%ebp),%eax
    2df7:	89 44 24 08          	mov    %eax,0x8(%esp)
    2dfb:	e8 87 fd ff ff       	call   2b87 <draw_line>
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    2e00:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e03:	83 e8 02             	sub    $0x2,%eax
    2e06:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    2e0d:	00 
    2e0e:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    2e15:	00 
    2e16:	89 44 24 14          	mov    %eax,0x14(%esp)
    2e1a:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    2e21:	00 
    2e22:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    2e29:	00 
    2e2a:	8b 45 08             	mov    0x8(%ebp),%eax
    2e2d:	89 04 24             	mov    %eax,(%esp)
    2e30:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e33:	89 44 24 04          	mov    %eax,0x4(%esp)
    2e37:	8b 45 10             	mov    0x10(%ebp),%eax
    2e3a:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e3e:	e8 cf f5 ff ff       	call   2412 <fill_rect>
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    2e43:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e46:	83 e8 02             	sub    $0x2,%eax
    2e49:	89 c2                	mov    %eax,%edx
    2e4b:	8b 45 10             	mov    0x10(%ebp),%eax
    2e4e:	83 e8 15             	sub    $0x15,%eax
    2e51:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    2e58:	00 
    2e59:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    2e60:	00 
    2e61:	89 54 24 14          	mov    %edx,0x14(%esp)
    2e65:	89 44 24 10          	mov    %eax,0x10(%esp)
    2e69:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    2e70:	00 
    2e71:	8b 45 08             	mov    0x8(%ebp),%eax
    2e74:	89 04 24             	mov    %eax,(%esp)
    2e77:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e7a:	89 44 24 04          	mov    %eax,0x4(%esp)
    2e7e:	8b 45 10             	mov    0x10(%ebp),%eax
    2e81:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e85:	e8 88 f5 ff ff       	call   2412 <fill_rect>

  loadBitmap(&pic, "close.bmp");
    2e8a:	c7 44 24 04 2b ad 00 	movl   $0xad2b,0x4(%esp)
    2e91:	00 
    2e92:	8d 45 ec             	lea    -0x14(%ebp),%eax
    2e95:	89 04 24             	mov    %eax,(%esp)
    2e98:	e8 44 01 00 00       	call   2fe1 <loadBitmap>
  draw_picture(c, pic, 3, 3);
    2e9d:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
    2ea4:	00 
    2ea5:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
    2eac:	00 
    2ead:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2eb0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2eb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2eb7:	89 44 24 10          	mov    %eax,0x10(%esp)
    2ebb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ebe:	89 44 24 14          	mov    %eax,0x14(%esp)
    2ec2:	8b 45 08             	mov    0x8(%ebp),%eax
    2ec5:	89 04 24             	mov    %eax,(%esp)
    2ec8:	8b 45 0c             	mov    0xc(%ebp),%eax
    2ecb:	89 44 24 04          	mov    %eax,0x4(%esp)
    2ecf:	8b 45 10             	mov    0x10(%ebp),%eax
    2ed2:	89 44 24 08          	mov    %eax,0x8(%esp)
    2ed6:	e8 d6 fb ff ff       	call   2ab1 <draw_picture>
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    2edb:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
    2ee2:	00 
    2ee3:	c7 44 24 14 19 00 00 	movl   $0x19,0x14(%esp)
    2eea:	00 
    2eeb:	c7 44 24 10 ff ff 00 	movl   $0xffff,0x10(%esp)
    2ef2:	00 
    2ef3:	8b 45 14             	mov    0x14(%ebp),%eax
    2ef6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2efa:	8b 45 08             	mov    0x8(%ebp),%eax
    2efd:	89 04 24             	mov    %eax,(%esp)
    2f00:	8b 45 0c             	mov    0xc(%ebp),%eax
    2f03:	89 44 24 04          	mov    %eax,0x4(%esp)
    2f07:	8b 45 10             	mov    0x10(%ebp),%eax
    2f0a:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f0e:	e8 de fa ff ff       	call   29f1 <puts_str>
  freepic(&pic);
    2f13:	8d 45 ec             	lea    -0x14(%ebp),%eax
    2f16:	89 04 24             	mov    %eax,(%esp)
    2f19:	e8 6f 06 00 00       	call   358d <freepic>
}
    2f1e:	c9                   	leave  
    2f1f:	c3                   	ret    

00002f20 <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    2f20:	55                   	push   %ebp
    2f21:	89 e5                	mov    %esp,%ebp
    2f23:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < len; i++)
    2f26:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2f2d:	eb 29                	jmp    2f58 <load_iconlist+0x38>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    2f2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f32:	6b d0 34             	imul   $0x34,%eax,%edx
    2f35:	8b 45 08             	mov    0x8(%ebp),%eax
    2f38:	01 d0                	add    %edx,%eax
    2f3a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2f3d:	6b ca 34             	imul   $0x34,%edx,%ecx
    2f40:	8b 55 08             	mov    0x8(%ebp),%edx
    2f43:	01 ca                	add    %ecx,%edx
    2f45:	83 c2 28             	add    $0x28,%edx
    2f48:	89 44 24 04          	mov    %eax,0x4(%esp)
    2f4c:	89 14 24             	mov    %edx,(%esp)
    2f4f:	e8 8d 00 00 00       	call   2fe1 <loadBitmap>
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    2f54:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2f58:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f5b:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2f5e:	7c cf                	jl     2f2f <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    2f60:	c9                   	leave  
    2f61:	c3                   	ret    

00002f62 <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    2f62:	55                   	push   %ebp
    2f63:	89 e5                	mov    %esp,%ebp
    2f65:	53                   	push   %ebx
    2f66:	83 ec 30             	sub    $0x30,%esp
    int i;
    for (i = 0; i < len; i++)
    2f69:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2f70:	eb 61                	jmp    2fd3 <draw_iconlist+0x71>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    2f72:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2f75:	6b d0 34             	imul   $0x34,%eax,%edx
    2f78:	8b 45 14             	mov    0x14(%ebp),%eax
    2f7b:	01 d0                	add    %edx,%eax
    2f7d:	8b 48 24             	mov    0x24(%eax),%ecx
    2f80:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2f83:	6b d0 34             	imul   $0x34,%eax,%edx
    2f86:	8b 45 14             	mov    0x14(%ebp),%eax
    2f89:	01 d0                	add    %edx,%eax
    2f8b:	8b 50 20             	mov    0x20(%eax),%edx
    2f8e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2f91:	6b d8 34             	imul   $0x34,%eax,%ebx
    2f94:	8b 45 14             	mov    0x14(%ebp),%eax
    2f97:	01 d8                	add    %ebx,%eax
    2f99:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    2f9d:	89 54 24 18          	mov    %edx,0x18(%esp)
    2fa1:	8b 50 28             	mov    0x28(%eax),%edx
    2fa4:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2fa8:	8b 50 2c             	mov    0x2c(%eax),%edx
    2fab:	89 54 24 10          	mov    %edx,0x10(%esp)
    2faf:	8b 40 30             	mov    0x30(%eax),%eax
    2fb2:	89 44 24 14          	mov    %eax,0x14(%esp)
    2fb6:	8b 45 08             	mov    0x8(%ebp),%eax
    2fb9:	89 04 24             	mov    %eax,(%esp)
    2fbc:	8b 45 0c             	mov    0xc(%ebp),%eax
    2fbf:	89 44 24 04          	mov    %eax,0x4(%esp)
    2fc3:	8b 45 10             	mov    0x10(%ebp),%eax
    2fc6:	89 44 24 08          	mov    %eax,0x8(%esp)
    2fca:	e8 e2 fa ff ff       	call   2ab1 <draw_picture>
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    2fcf:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2fd3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2fd6:	3b 45 18             	cmp    0x18(%ebp),%eax
    2fd9:	7c 97                	jl     2f72 <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    2fdb:	83 c4 30             	add    $0x30,%esp
    2fde:	5b                   	pop    %ebx
    2fdf:	5d                   	pop    %ebp
    2fe0:	c3                   	ret    

00002fe1 <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    2fe1:	55                   	push   %ebp
    2fe2:	89 e5                	mov    %esp,%ebp
    2fe4:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    2fea:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    2ff1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2ff8:	00 
    2ff9:	8b 45 0c             	mov    0xc(%ebp),%eax
    2ffc:	89 04 24             	mov    %eax,(%esp)
    2fff:	e8 b6 11 00 00       	call   41ba <open>
    3004:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3007:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    300b:	79 20                	jns    302d <loadBitmap+0x4c>
		printf(0, "cannot open %s\n", pic_name);
    300d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3010:	89 44 24 08          	mov    %eax,0x8(%esp)
    3014:	c7 44 24 04 38 ad 00 	movl   $0xad38,0x4(%esp)
    301b:	00 
    301c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3023:	e8 3a 13 00 00       	call   4362 <printf>
		return;
    3028:	e9 ef 02 00 00       	jmp    331c <loadBitmap+0x33b>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    302d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3030:	89 44 24 08          	mov    %eax,0x8(%esp)
    3034:	c7 44 24 04 48 ad 00 	movl   $0xad48,0x4(%esp)
    303b:	00 
    303c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3043:	e8 1a 13 00 00       	call   4362 <printf>
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    3048:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    304f:	e8 fa 15 00 00       	call   464e <malloc>
    3054:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    3057:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
    305e:	00 
    305f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3062:	89 44 24 04          	mov    %eax,0x4(%esp)
    3066:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3069:	89 04 24             	mov    %eax,(%esp)
    306c:	e8 21 11 00 00       	call   4192 <read>
    3071:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    3074:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3077:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    307a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    307d:	0f b7 00             	movzwl (%eax),%eax
    3080:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    3084:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    3088:	66 3d 42 4d          	cmp    $0x4d42,%ax
    308c:	74 19                	je     30a7 <loadBitmap+0xc6>
		printf(0, "file is not .bmp file!");
    308e:	c7 44 24 04 5c ad 00 	movl   $0xad5c,0x4(%esp)
    3095:	00 
    3096:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    309d:	e8 c0 12 00 00       	call   4362 <printf>
		return;
    30a2:	e9 75 02 00 00       	jmp    331c <loadBitmap+0x33b>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    30a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    30aa:	83 c0 02             	add    $0x2,%eax
    30ad:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    30b0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    30b3:	8b 00                	mov    (%eax),%eax
    30b5:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    30b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    30bb:	83 c0 06             	add    $0x6,%eax
    30be:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    30c1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    30c4:	0f b7 00             	movzwl (%eax),%eax
    30c7:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    30cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    30ce:	83 c0 08             	add    $0x8,%eax
    30d1:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    30d4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    30d7:	0f b7 00             	movzwl (%eax),%eax
    30da:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    30de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    30e1:	83 c0 0a             	add    $0xa,%eax
    30e4:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    30e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    30ea:	8b 00                	mov    (%eax),%eax
    30ec:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    30ef:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    30f6:	00 
    30f7:	8d 45 84             	lea    -0x7c(%ebp),%eax
    30fa:	89 44 24 04          	mov    %eax,0x4(%esp)
    30fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3101:	89 04 24             	mov    %eax,(%esp)
    3104:	e8 89 10 00 00       	call   4192 <read>
	width = bitInfoHead.biWidth;
    3109:	8b 45 88             	mov    -0x78(%ebp),%eax
    310c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    310f:	8b 45 8c             	mov    -0x74(%ebp),%eax
    3112:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    3115:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3118:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    311c:	c1 e0 02             	shl    $0x2,%eax
    311f:	89 44 24 10          	mov    %eax,0x10(%esp)
    3123:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3126:	89 44 24 0c          	mov    %eax,0xc(%esp)
    312a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    312d:	89 44 24 08          	mov    %eax,0x8(%esp)
    3131:	c7 44 24 04 74 ad 00 	movl   $0xad74,0x4(%esp)
    3138:	00 
    3139:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3140:	e8 1d 12 00 00       	call   4362 <printf>
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    3145:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    3149:	75 14                	jne    315f <loadBitmap+0x17e>
		printf(0, "0");
    314b:	c7 44 24 04 99 ad 00 	movl   $0xad99,0x4(%esp)
    3152:	00 
    3153:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    315a:	e8 03 12 00 00       	call   4362 <printf>
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    315f:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    3163:	0f b7 c0             	movzwl %ax,%eax
    3166:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    316a:	83 c0 1f             	add    $0x1f,%eax
    316d:	8d 50 1f             	lea    0x1f(%eax),%edx
    3170:	85 c0                	test   %eax,%eax
    3172:	0f 48 c2             	cmovs  %edx,%eax
    3175:	c1 f8 05             	sar    $0x5,%eax
    3178:	c1 e0 02             	shl    $0x2,%eax
    317b:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    317e:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3181:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3185:	89 04 24             	mov    %eax,(%esp)
    3188:	e8 c1 14 00 00       	call   464e <malloc>
    318d:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    3190:	8b 55 d0             	mov    -0x30(%ebp),%edx
    3193:	8b 45 cc             	mov    -0x34(%ebp),%eax
    3196:	0f af c2             	imul   %edx,%eax
    3199:	89 44 24 08          	mov    %eax,0x8(%esp)
    319d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    31a4:	00 
    31a5:	8b 45 c8             	mov    -0x38(%ebp),%eax
    31a8:	89 04 24             	mov    %eax,(%esp)
    31ab:	e8 1d 0e 00 00       	call   3fcd <memset>
	long nData = height * l_width;
    31b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    31b3:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    31b7:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    31ba:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    31bd:	89 44 24 08          	mov    %eax,0x8(%esp)
    31c1:	8b 45 c8             	mov    -0x38(%ebp),%eax
    31c4:	89 44 24 04          	mov    %eax,0x4(%esp)
    31c8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    31cb:	89 04 24             	mov    %eax,(%esp)
    31ce:	e8 bf 0f 00 00       	call   4192 <read>

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    31d3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    31d6:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    31da:	c1 e0 02             	shl    $0x2,%eax
    31dd:	89 04 24             	mov    %eax,(%esp)
    31e0:	e8 69 14 00 00       	call   464e <malloc>
    31e5:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    31e8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    31eb:	8b 45 d0             	mov    -0x30(%ebp),%eax
    31ee:	0f af c2             	imul   %edx,%eax
    31f1:	c1 e0 02             	shl    $0x2,%eax
    31f4:	89 44 24 08          	mov    %eax,0x8(%esp)
    31f8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    31ff:	00 
    3200:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3203:	89 04 24             	mov    %eax,(%esp)
    3206:	e8 c2 0d 00 00       	call   3fcd <memset>
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    320b:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    320f:	66 83 f8 17          	cmp    $0x17,%ax
    3213:	77 19                	ja     322e <loadBitmap+0x24d>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    3215:	c7 44 24 04 9c ad 00 	movl   $0xad9c,0x4(%esp)
    321c:	00 
    321d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3224:	e8 39 11 00 00       	call   4362 <printf>
		return;
    3229:	e9 ee 00 00 00       	jmp    331c <loadBitmap+0x33b>
	} else	//位图为24位真彩色
	{
		index = 0;
    322e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    3235:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    323c:	e9 94 00 00 00       	jmp    32d5 <loadBitmap+0x2f4>
			for (j = 0; j < width; j++) {
    3241:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3248:	eb 7b                	jmp    32c5 <loadBitmap+0x2e4>
				k = i * l_width + j * 3;
    324a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    324d:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    3251:	89 c1                	mov    %eax,%ecx
    3253:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3256:	89 d0                	mov    %edx,%eax
    3258:	01 c0                	add    %eax,%eax
    325a:	01 d0                	add    %edx,%eax
    325c:	01 c8                	add    %ecx,%eax
    325e:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    3261:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3264:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    326b:	8b 45 c0             	mov    -0x40(%ebp),%eax
    326e:	01 c2                	add    %eax,%edx
    3270:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3273:	8d 48 02             	lea    0x2(%eax),%ecx
    3276:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3279:	01 c8                	add    %ecx,%eax
    327b:	0f b6 00             	movzbl (%eax),%eax
    327e:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    3281:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3284:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    328b:	8b 45 c0             	mov    -0x40(%ebp),%eax
    328e:	01 c2                	add    %eax,%edx
    3290:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3293:	8d 48 01             	lea    0x1(%eax),%ecx
    3296:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3299:	01 c8                	add    %ecx,%eax
    329b:	0f b6 00             	movzbl (%eax),%eax
    329e:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    32a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    32a4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    32ab:	8b 45 c0             	mov    -0x40(%ebp),%eax
    32ae:	01 c2                	add    %eax,%edx
    32b0:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    32b3:	8b 45 c8             	mov    -0x38(%ebp),%eax
    32b6:	01 c8                	add    %ecx,%eax
    32b8:	0f b6 00             	movzbl (%eax),%eax
    32bb:	88 02                	mov    %al,(%edx)
				index++;
    32bd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    32c1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    32c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32c8:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    32cb:	0f 8c 79 ff ff ff    	jl     324a <loadBitmap+0x269>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    32d1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    32d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32d8:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    32db:	0f 8c 60 ff ff ff    	jl     3241 <loadBitmap+0x260>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    32e1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    32e4:	89 04 24             	mov    %eax,(%esp)
    32e7:	e8 b6 0e 00 00       	call   41a2 <close>

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    32ec:	8b 45 08             	mov    0x8(%ebp),%eax
    32ef:	8b 55 c0             	mov    -0x40(%ebp),%edx
    32f2:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    32f4:	8b 45 08             	mov    0x8(%ebp),%eax
    32f7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    32fa:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    32fd:	8b 45 08             	mov    0x8(%ebp),%eax
    3300:	8b 55 d0             	mov    -0x30(%ebp),%edx
    3303:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    3306:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3309:	89 04 24             	mov    %eax,(%esp)
    330c:	e8 04 12 00 00       	call   4515 <free>
	free(BmpFileHeader);
    3311:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3314:	89 04 24             	mov    %eax,(%esp)
    3317:	e8 f9 11 00 00       	call   4515 <free>
	//printf("\n");
}
    331c:	c9                   	leave  
    331d:	c3                   	ret    

0000331e <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    331e:	55                   	push   %ebp
    331f:	89 e5                	mov    %esp,%ebp
    3321:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图文件头:\n");
    3324:	c7 44 24 04 bc ad 00 	movl   $0xadbc,0x4(%esp)
    332b:	00 
    332c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3333:	e8 2a 10 00 00       	call   4362 <printf>
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    3338:	8b 45 08             	mov    0x8(%ebp),%eax
    333b:	0f b7 00             	movzwl (%eax),%eax
    333e:	0f b7 c0             	movzwl %ax,%eax
    3341:	89 44 24 08          	mov    %eax,0x8(%esp)
    3345:	c7 44 24 04 ce ad 00 	movl   $0xadce,0x4(%esp)
    334c:	00 
    334d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3354:	e8 09 10 00 00       	call   4362 <printf>
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    3359:	8b 45 08             	mov    0x8(%ebp),%eax
    335c:	8b 40 04             	mov    0x4(%eax),%eax
    335f:	89 44 24 08          	mov    %eax,0x8(%esp)
    3363:	c7 44 24 04 ec ad 00 	movl   $0xadec,0x4(%esp)
    336a:	00 
    336b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3372:	e8 eb 0f 00 00       	call   4362 <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    3377:	8b 45 08             	mov    0x8(%ebp),%eax
    337a:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    337e:	0f b7 c0             	movzwl %ax,%eax
    3381:	89 44 24 08          	mov    %eax,0x8(%esp)
    3385:	c7 44 24 04 fd ad 00 	movl   $0xadfd,0x4(%esp)
    338c:	00 
    338d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3394:	e8 c9 0f 00 00       	call   4362 <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    3399:	8b 45 08             	mov    0x8(%ebp),%eax
    339c:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    33a0:	0f b7 c0             	movzwl %ax,%eax
    33a3:	89 44 24 08          	mov    %eax,0x8(%esp)
    33a7:	c7 44 24 04 fd ad 00 	movl   $0xadfd,0x4(%esp)
    33ae:	00 
    33af:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    33b6:	e8 a7 0f 00 00       	call   4362 <printf>
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    33bb:	8b 45 08             	mov    0x8(%ebp),%eax
    33be:	8b 40 0c             	mov    0xc(%eax),%eax
    33c1:	89 44 24 08          	mov    %eax,0x8(%esp)
    33c5:	c7 44 24 04 0c ae 00 	movl   $0xae0c,0x4(%esp)
    33cc:	00 
    33cd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    33d4:	e8 89 0f 00 00       	call   4362 <printf>
}
    33d9:	c9                   	leave  
    33da:	c3                   	ret    

000033db <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    33db:	55                   	push   %ebp
    33dc:	89 e5                	mov    %esp,%ebp
    33de:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图信息头:\n");
    33e1:	c7 44 24 04 35 ae 00 	movl   $0xae35,0x4(%esp)
    33e8:	00 
    33e9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    33f0:	e8 6d 0f 00 00       	call   4362 <printf>
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    33f5:	8b 45 08             	mov    0x8(%ebp),%eax
    33f8:	8b 00                	mov    (%eax),%eax
    33fa:	89 44 24 08          	mov    %eax,0x8(%esp)
    33fe:	c7 44 24 04 47 ae 00 	movl   $0xae47,0x4(%esp)
    3405:	00 
    3406:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    340d:	e8 50 0f 00 00       	call   4362 <printf>
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    3412:	8b 45 08             	mov    0x8(%ebp),%eax
    3415:	8b 40 04             	mov    0x4(%eax),%eax
    3418:	89 44 24 08          	mov    %eax,0x8(%esp)
    341c:	c7 44 24 04 5e ae 00 	movl   $0xae5e,0x4(%esp)
    3423:	00 
    3424:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    342b:	e8 32 0f 00 00       	call   4362 <printf>
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    3430:	8b 45 08             	mov    0x8(%ebp),%eax
    3433:	8b 40 08             	mov    0x8(%eax),%eax
    3436:	89 44 24 08          	mov    %eax,0x8(%esp)
    343a:	c7 44 24 04 6c ae 00 	movl   $0xae6c,0x4(%esp)
    3441:	00 
    3442:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3449:	e8 14 0f 00 00       	call   4362 <printf>
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    344e:	8b 45 08             	mov    0x8(%ebp),%eax
    3451:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    3455:	0f b7 c0             	movzwl %ax,%eax
    3458:	89 44 24 08          	mov    %eax,0x8(%esp)
    345c:	c7 44 24 04 7a ae 00 	movl   $0xae7a,0x4(%esp)
    3463:	00 
    3464:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    346b:	e8 f2 0e 00 00       	call   4362 <printf>
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    3470:	8b 45 08             	mov    0x8(%ebp),%eax
    3473:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    3477:	0f b7 c0             	movzwl %ax,%eax
    347a:	89 44 24 08          	mov    %eax,0x8(%esp)
    347e:	c7 44 24 04 90 ae 00 	movl   $0xae90,0x4(%esp)
    3485:	00 
    3486:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    348d:	e8 d0 0e 00 00       	call   4362 <printf>
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    3492:	8b 45 08             	mov    0x8(%ebp),%eax
    3495:	8b 40 10             	mov    0x10(%eax),%eax
    3498:	89 44 24 08          	mov    %eax,0x8(%esp)
    349c:	c7 44 24 04 b1 ae 00 	movl   $0xaeb1,0x4(%esp)
    34a3:	00 
    34a4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34ab:	e8 b2 0e 00 00       	call   4362 <printf>
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    34b0:	8b 45 08             	mov    0x8(%ebp),%eax
    34b3:	8b 40 14             	mov    0x14(%eax),%eax
    34b6:	89 44 24 08          	mov    %eax,0x8(%esp)
    34ba:	c7 44 24 04 c4 ae 00 	movl   $0xaec4,0x4(%esp)
    34c1:	00 
    34c2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34c9:	e8 94 0e 00 00       	call   4362 <printf>
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    34ce:	8b 45 08             	mov    0x8(%ebp),%eax
    34d1:	8b 40 18             	mov    0x18(%eax),%eax
    34d4:	89 44 24 08          	mov    %eax,0x8(%esp)
    34d8:	c7 44 24 04 f8 ae 00 	movl   $0xaef8,0x4(%esp)
    34df:	00 
    34e0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34e7:	e8 76 0e 00 00       	call   4362 <printf>
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    34ec:	8b 45 08             	mov    0x8(%ebp),%eax
    34ef:	8b 40 1c             	mov    0x1c(%eax),%eax
    34f2:	89 44 24 08          	mov    %eax,0x8(%esp)
    34f6:	c7 44 24 04 0d af 00 	movl   $0xaf0d,0x4(%esp)
    34fd:	00 
    34fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3505:	e8 58 0e 00 00       	call   4362 <printf>
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    350a:	8b 45 08             	mov    0x8(%ebp),%eax
    350d:	8b 40 20             	mov    0x20(%eax),%eax
    3510:	89 44 24 08          	mov    %eax,0x8(%esp)
    3514:	c7 44 24 04 22 af 00 	movl   $0xaf22,0x4(%esp)
    351b:	00 
    351c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3523:	e8 3a 0e 00 00       	call   4362 <printf>
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    3528:	8b 45 08             	mov    0x8(%ebp),%eax
    352b:	8b 40 24             	mov    0x24(%eax),%eax
    352e:	89 44 24 08          	mov    %eax,0x8(%esp)
    3532:	c7 44 24 04 39 af 00 	movl   $0xaf39,0x4(%esp)
    3539:	00 
    353a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3541:	e8 1c 0e 00 00       	call   4362 <printf>
}
    3546:	c9                   	leave  
    3547:	c3                   	ret    

00003548 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    3548:	55                   	push   %ebp
    3549:	89 e5                	mov    %esp,%ebp
    354b:	83 ec 28             	sub    $0x28,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    354e:	8b 45 08             	mov    0x8(%ebp),%eax
    3551:	0f b6 00             	movzbl (%eax),%eax
    3554:	0f b6 c8             	movzbl %al,%ecx
    3557:	8b 45 08             	mov    0x8(%ebp),%eax
    355a:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    355e:	0f b6 d0             	movzbl %al,%edx
    3561:	8b 45 08             	mov    0x8(%ebp),%eax
    3564:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    3568:	0f b6 c0             	movzbl %al,%eax
    356b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    356f:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3573:	89 44 24 08          	mov    %eax,0x8(%esp)
    3577:	c7 44 24 04 4d af 00 	movl   $0xaf4d,0x4(%esp)
    357e:	00 
    357f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3586:	e8 d7 0d 00 00       	call   4362 <printf>
}
    358b:	c9                   	leave  
    358c:	c3                   	ret    

0000358d <freepic>:

void freepic(PICNODE *pic) {
    358d:	55                   	push   %ebp
    358e:	89 e5                	mov    %esp,%ebp
    3590:	83 ec 18             	sub    $0x18,%esp
	free(pic->data);
    3593:	8b 45 08             	mov    0x8(%ebp),%eax
    3596:	8b 00                	mov    (%eax),%eax
    3598:	89 04 24             	mov    %eax,(%esp)
    359b:	e8 75 0f 00 00       	call   4515 <free>
}
    35a0:	c9                   	leave  
    35a1:	c3                   	ret    

000035a2 <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    35a2:	55                   	push   %ebp
    35a3:	89 e5                	mov    %esp,%ebp
    35a5:	53                   	push   %ebx
    35a6:	81 ec 84 00 00 00    	sub    $0x84,%esp
	int W = 15;
    35ac:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    35b3:	8d 45 dc             	lea    -0x24(%ebp),%eax
    35b6:	8b 55 ec             	mov    -0x14(%ebp),%edx
    35b9:	89 54 24 10          	mov    %edx,0x10(%esp)
    35bd:	8b 55 ec             	mov    -0x14(%ebp),%edx
    35c0:	89 54 24 0c          	mov    %edx,0xc(%esp)
    35c4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    35cb:	00 
    35cc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    35d3:	00 
    35d4:	89 04 24             	mov    %eax,(%esp)
    35d7:	e8 80 02 00 00       	call   385c <initRect>
    35dc:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    35df:	8b 45 08             	mov    0x8(%ebp),%eax
    35e2:	8b 40 04             	mov    0x4(%eax),%eax
    35e5:	2b 45 ec             	sub    -0x14(%ebp),%eax
    35e8:	89 c2                	mov    %eax,%edx
    35ea:	8d 45 cc             	lea    -0x34(%ebp),%eax
    35ed:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    35f0:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    35f4:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    35f7:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    35fb:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    3602:	00 
    3603:	89 54 24 04          	mov    %edx,0x4(%esp)
    3607:	89 04 24             	mov    %eax,(%esp)
    360a:	e8 4d 02 00 00       	call   385c <initRect>
    360f:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    3612:	8b 45 08             	mov    0x8(%ebp),%eax
    3615:	8b 40 08             	mov    0x8(%eax),%eax
    3618:	2b 45 ec             	sub    -0x14(%ebp),%eax
    361b:	89 c1                	mov    %eax,%ecx
    361d:	8b 45 08             	mov    0x8(%ebp),%eax
    3620:	8b 40 04             	mov    0x4(%eax),%eax
    3623:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3626:	89 c2                	mov    %eax,%edx
    3628:	8d 45 bc             	lea    -0x44(%ebp),%eax
    362b:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    362e:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    3632:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    3635:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    3639:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    363d:	89 54 24 04          	mov    %edx,0x4(%esp)
    3641:	89 04 24             	mov    %eax,(%esp)
    3644:	e8 13 02 00 00       	call   385c <initRect>
    3649:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    364c:	8b 45 08             	mov    0x8(%ebp),%eax
    364f:	8b 40 08             	mov    0x8(%eax),%eax
    3652:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3655:	89 c2                	mov    %eax,%edx
    3657:	8d 45 ac             	lea    -0x54(%ebp),%eax
    365a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    365d:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    3661:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    3664:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    3668:	89 54 24 08          	mov    %edx,0x8(%esp)
    366c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3673:	00 
    3674:	89 04 24             	mov    %eax,(%esp)
    3677:	e8 e0 01 00 00       	call   385c <initRect>
    367c:	83 ec 04             	sub    $0x4,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    367f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3686:	e9 96 01 00 00       	jmp    3821 <set_icon_alpha+0x27f>
		for (j = 0; j < pic->height; j++) {
    368b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3692:	e9 77 01 00 00       	jmp    380e <set_icon_alpha+0x26c>
			p = initPoint(i, j);
    3697:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    369a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    369d:	89 54 24 08          	mov    %edx,0x8(%esp)
    36a1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    36a4:	89 54 24 04          	mov    %edx,0x4(%esp)
    36a8:	89 04 24             	mov    %eax,(%esp)
    36ab:	e8 85 01 00 00       	call   3835 <initPoint>
    36b0:	83 ec 04             	sub    $0x4,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    36b3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    36b6:	89 44 24 08          	mov    %eax,0x8(%esp)
    36ba:	8b 45 e0             	mov    -0x20(%ebp),%eax
    36bd:	89 44 24 0c          	mov    %eax,0xc(%esp)
    36c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    36c4:	89 44 24 10          	mov    %eax,0x10(%esp)
    36c8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    36cb:	89 44 24 14          	mov    %eax,0x14(%esp)
    36cf:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    36d2:	8b 55 a8             	mov    -0x58(%ebp),%edx
    36d5:	89 04 24             	mov    %eax,(%esp)
    36d8:	89 54 24 04          	mov    %edx,0x4(%esp)
    36dc:	e8 d6 01 00 00       	call   38b7 <isIn>
    36e1:	85 c0                	test   %eax,%eax
    36e3:	0f 85 9a 00 00 00    	jne    3783 <set_icon_alpha+0x1e1>
    36e9:	8b 45 cc             	mov    -0x34(%ebp),%eax
    36ec:	89 44 24 08          	mov    %eax,0x8(%esp)
    36f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    36f3:	89 44 24 0c          	mov    %eax,0xc(%esp)
    36f7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    36fa:	89 44 24 10          	mov    %eax,0x10(%esp)
    36fe:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3701:	89 44 24 14          	mov    %eax,0x14(%esp)
    3705:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    3708:	8b 55 a8             	mov    -0x58(%ebp),%edx
    370b:	89 04 24             	mov    %eax,(%esp)
    370e:	89 54 24 04          	mov    %edx,0x4(%esp)
    3712:	e8 a0 01 00 00       	call   38b7 <isIn>
    3717:	85 c0                	test   %eax,%eax
    3719:	75 68                	jne    3783 <set_icon_alpha+0x1e1>
    371b:	8b 45 bc             	mov    -0x44(%ebp),%eax
    371e:	89 44 24 08          	mov    %eax,0x8(%esp)
    3722:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3725:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3729:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    372c:	89 44 24 10          	mov    %eax,0x10(%esp)
    3730:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3733:	89 44 24 14          	mov    %eax,0x14(%esp)
    3737:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    373a:	8b 55 a8             	mov    -0x58(%ebp),%edx
    373d:	89 04 24             	mov    %eax,(%esp)
    3740:	89 54 24 04          	mov    %edx,0x4(%esp)
    3744:	e8 6e 01 00 00       	call   38b7 <isIn>
    3749:	85 c0                	test   %eax,%eax
    374b:	75 36                	jne    3783 <set_icon_alpha+0x1e1>
    374d:	8b 45 ac             	mov    -0x54(%ebp),%eax
    3750:	89 44 24 08          	mov    %eax,0x8(%esp)
    3754:	8b 45 b0             	mov    -0x50(%ebp),%eax
    3757:	89 44 24 0c          	mov    %eax,0xc(%esp)
    375b:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    375e:	89 44 24 10          	mov    %eax,0x10(%esp)
    3762:	8b 45 b8             	mov    -0x48(%ebp),%eax
    3765:	89 44 24 14          	mov    %eax,0x14(%esp)
    3769:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    376c:	8b 55 a8             	mov    -0x58(%ebp),%edx
    376f:	89 04 24             	mov    %eax,(%esp)
    3772:	89 54 24 04          	mov    %edx,0x4(%esp)
    3776:	e8 3c 01 00 00       	call   38b7 <isIn>
    377b:	85 c0                	test   %eax,%eax
    377d:	0f 84 87 00 00 00    	je     380a <set_icon_alpha+0x268>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    3783:	8b 45 08             	mov    0x8(%ebp),%eax
    3786:	8b 10                	mov    (%eax),%edx
    3788:	8b 45 08             	mov    0x8(%ebp),%eax
    378b:	8b 40 04             	mov    0x4(%eax),%eax
    378e:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3792:	89 c1                	mov    %eax,%ecx
    3794:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3797:	01 c8                	add    %ecx,%eax
    3799:	c1 e0 02             	shl    $0x2,%eax
    379c:	01 d0                	add    %edx,%eax
    379e:	0f b6 00             	movzbl (%eax),%eax
    37a1:	3c ff                	cmp    $0xff,%al
    37a3:	75 65                	jne    380a <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    37a5:	8b 45 08             	mov    0x8(%ebp),%eax
    37a8:	8b 10                	mov    (%eax),%edx
    37aa:	8b 45 08             	mov    0x8(%ebp),%eax
    37ad:	8b 40 04             	mov    0x4(%eax),%eax
    37b0:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    37b4:	89 c1                	mov    %eax,%ecx
    37b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37b9:	01 c8                	add    %ecx,%eax
    37bb:	c1 e0 02             	shl    $0x2,%eax
    37be:	01 d0                	add    %edx,%eax
    37c0:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    37c4:	3c ff                	cmp    $0xff,%al
    37c6:	75 42                	jne    380a <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    37c8:	8b 45 08             	mov    0x8(%ebp),%eax
    37cb:	8b 10                	mov    (%eax),%edx
    37cd:	8b 45 08             	mov    0x8(%ebp),%eax
    37d0:	8b 40 04             	mov    0x4(%eax),%eax
    37d3:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    37d7:	89 c1                	mov    %eax,%ecx
    37d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37dc:	01 c8                	add    %ecx,%eax
    37de:	c1 e0 02             	shl    $0x2,%eax
    37e1:	01 d0                	add    %edx,%eax
    37e3:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    37e7:	3c ff                	cmp    $0xff,%al
    37e9:	75 1f                	jne    380a <set_icon_alpha+0x268>
					pic->data[j * pic->width + i].rgbReserved = 1;
    37eb:	8b 45 08             	mov    0x8(%ebp),%eax
    37ee:	8b 10                	mov    (%eax),%edx
    37f0:	8b 45 08             	mov    0x8(%ebp),%eax
    37f3:	8b 40 04             	mov    0x4(%eax),%eax
    37f6:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    37fa:	89 c1                	mov    %eax,%ecx
    37fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37ff:	01 c8                	add    %ecx,%eax
    3801:	c1 e0 02             	shl    $0x2,%eax
    3804:	01 d0                	add    %edx,%eax
    3806:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    380a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    380e:	8b 45 08             	mov    0x8(%ebp),%eax
    3811:	8b 40 08             	mov    0x8(%eax),%eax
    3814:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3817:	0f 8f 7a fe ff ff    	jg     3697 <set_icon_alpha+0xf5>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    381d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3821:	8b 45 08             	mov    0x8(%ebp),%eax
    3824:	8b 40 04             	mov    0x4(%eax),%eax
    3827:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    382a:	0f 8f 5b fe ff ff    	jg     368b <set_icon_alpha+0xe9>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    3830:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3833:	c9                   	leave  
    3834:	c3                   	ret    

00003835 <initPoint>:
#include "context.h"
#include "message.h"
#include "types.h"
#include "user.h"
Point initPoint(int x, int y)
{
    3835:	55                   	push   %ebp
    3836:	89 e5                	mov    %esp,%ebp
    3838:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    383b:	8b 45 0c             	mov    0xc(%ebp),%eax
    383e:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    3841:	8b 45 10             	mov    0x10(%ebp),%eax
    3844:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    3847:	8b 4d 08             	mov    0x8(%ebp),%ecx
    384a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    384d:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3850:	89 01                	mov    %eax,(%ecx)
    3852:	89 51 04             	mov    %edx,0x4(%ecx)
}
    3855:	8b 45 08             	mov    0x8(%ebp),%eax
    3858:	c9                   	leave  
    3859:	c2 04 00             	ret    $0x4

0000385c <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    385c:	55                   	push   %ebp
    385d:	89 e5                	mov    %esp,%ebp
    385f:	83 ec 24             	sub    $0x24,%esp
	Rect r;
	r.start = initPoint(x, y);
    3862:	8d 45 e8             	lea    -0x18(%ebp),%eax
    3865:	8b 55 10             	mov    0x10(%ebp),%edx
    3868:	89 54 24 08          	mov    %edx,0x8(%esp)
    386c:	8b 55 0c             	mov    0xc(%ebp),%edx
    386f:	89 54 24 04          	mov    %edx,0x4(%esp)
    3873:	89 04 24             	mov    %eax,(%esp)
    3876:	e8 ba ff ff ff       	call   3835 <initPoint>
    387b:	83 ec 04             	sub    $0x4,%esp
    387e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3881:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3884:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3887:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    388a:	8b 45 14             	mov    0x14(%ebp),%eax
    388d:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    3890:	8b 45 18             	mov    0x18(%ebp),%eax
    3893:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    3896:	8b 45 08             	mov    0x8(%ebp),%eax
    3899:	8b 55 f0             	mov    -0x10(%ebp),%edx
    389c:	89 10                	mov    %edx,(%eax)
    389e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    38a1:	89 50 04             	mov    %edx,0x4(%eax)
    38a4:	8b 55 f8             	mov    -0x8(%ebp),%edx
    38a7:	89 50 08             	mov    %edx,0x8(%eax)
    38aa:	8b 55 fc             	mov    -0x4(%ebp),%edx
    38ad:	89 50 0c             	mov    %edx,0xc(%eax)
}
    38b0:	8b 45 08             	mov    0x8(%ebp),%eax
    38b3:	c9                   	leave  
    38b4:	c2 04 00             	ret    $0x4

000038b7 <isIn>:

int isIn(Point p, Rect r)
{
    38b7:	55                   	push   %ebp
    38b8:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    38ba:	8b 55 08             	mov    0x8(%ebp),%edx
    38bd:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    38c0:	39 c2                	cmp    %eax,%edx
    38c2:	7c 2f                	jl     38f3 <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    38c4:	8b 45 08             	mov    0x8(%ebp),%eax
    38c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    38ca:	8b 55 18             	mov    0x18(%ebp),%edx
    38cd:	01 ca                	add    %ecx,%edx
    38cf:	39 d0                	cmp    %edx,%eax
    38d1:	7d 20                	jge    38f3 <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    38d3:	8b 55 0c             	mov    0xc(%ebp),%edx
    38d6:	8b 45 14             	mov    0x14(%ebp),%eax
    38d9:	39 c2                	cmp    %eax,%edx
    38db:	7c 16                	jl     38f3 <isIn+0x3c>
    38dd:	8b 45 0c             	mov    0xc(%ebp),%eax
    38e0:	8b 4d 14             	mov    0x14(%ebp),%ecx
    38e3:	8b 55 1c             	mov    0x1c(%ebp),%edx
    38e6:	01 ca                	add    %ecx,%edx
    38e8:	39 d0                	cmp    %edx,%eax
    38ea:	7d 07                	jge    38f3 <isIn+0x3c>
    38ec:	b8 01 00 00 00       	mov    $0x1,%eax
    38f1:	eb 05                	jmp    38f8 <isIn+0x41>
    38f3:	b8 00 00 00 00       	mov    $0x0,%eax
}
    38f8:	5d                   	pop    %ebp
    38f9:	c3                   	ret    

000038fa <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    38fa:	55                   	push   %ebp
    38fb:	89 e5                	mov    %esp,%ebp
    38fd:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    3900:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    3907:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    390e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    3915:	8b 45 10             	mov    0x10(%ebp),%eax
    3918:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    391b:	8b 45 14             	mov    0x14(%ebp),%eax
    391e:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    3921:	8b 45 08             	mov    0x8(%ebp),%eax
    3924:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3927:	89 10                	mov    %edx,(%eax)
    3929:	8b 55 f0             	mov    -0x10(%ebp),%edx
    392c:	89 50 04             	mov    %edx,0x4(%eax)
    392f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3932:	89 50 08             	mov    %edx,0x8(%eax)
    3935:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3938:	89 50 0c             	mov    %edx,0xc(%eax)
    393b:	8b 55 fc             	mov    -0x4(%ebp),%edx
    393e:	89 50 10             	mov    %edx,0x10(%eax)
}
    3941:	8b 45 08             	mov    0x8(%ebp),%eax
    3944:	c9                   	leave  
    3945:	c2 04 00             	ret    $0x4

00003948 <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    3948:	55                   	push   %ebp
    3949:	89 e5                	mov    %esp,%ebp
    394b:	83 ec 28             	sub    $0x28,%esp
	switch (MsgType)
    394e:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3951:	83 f8 03             	cmp    $0x3,%eax
    3954:	74 72                	je     39c8 <createClickable+0x80>
    3956:	83 f8 04             	cmp    $0x4,%eax
    3959:	74 0a                	je     3965 <createClickable+0x1d>
    395b:	83 f8 02             	cmp    $0x2,%eax
    395e:	74 38                	je     3998 <createClickable+0x50>
    3960:	e9 96 00 00 00       	jmp    39fb <createClickable+0xb3>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    3965:	8b 45 08             	mov    0x8(%ebp),%eax
    3968:	8d 50 04             	lea    0x4(%eax),%edx
    396b:	8b 45 20             	mov    0x20(%ebp),%eax
    396e:	89 44 24 14          	mov    %eax,0x14(%esp)
    3972:	8b 45 0c             	mov    0xc(%ebp),%eax
    3975:	89 44 24 04          	mov    %eax,0x4(%esp)
    3979:	8b 45 10             	mov    0x10(%ebp),%eax
    397c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3980:	8b 45 14             	mov    0x14(%ebp),%eax
    3983:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3987:	8b 45 18             	mov    0x18(%ebp),%eax
    398a:	89 44 24 10          	mov    %eax,0x10(%esp)
    398e:	89 14 24             	mov    %edx,(%esp)
    3991:	e8 7c 00 00 00       	call   3a12 <addClickable>
	        break;
    3996:	eb 78                	jmp    3a10 <createClickable+0xc8>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    3998:	8b 45 08             	mov    0x8(%ebp),%eax
    399b:	8b 55 20             	mov    0x20(%ebp),%edx
    399e:	89 54 24 14          	mov    %edx,0x14(%esp)
    39a2:	8b 55 0c             	mov    0xc(%ebp),%edx
    39a5:	89 54 24 04          	mov    %edx,0x4(%esp)
    39a9:	8b 55 10             	mov    0x10(%ebp),%edx
    39ac:	89 54 24 08          	mov    %edx,0x8(%esp)
    39b0:	8b 55 14             	mov    0x14(%ebp),%edx
    39b3:	89 54 24 0c          	mov    %edx,0xc(%esp)
    39b7:	8b 55 18             	mov    0x18(%ebp),%edx
    39ba:	89 54 24 10          	mov    %edx,0x10(%esp)
    39be:	89 04 24             	mov    %eax,(%esp)
    39c1:	e8 4c 00 00 00       	call   3a12 <addClickable>
	    	break;
    39c6:	eb 48                	jmp    3a10 <createClickable+0xc8>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    39c8:	8b 45 08             	mov    0x8(%ebp),%eax
    39cb:	8d 50 08             	lea    0x8(%eax),%edx
    39ce:	8b 45 20             	mov    0x20(%ebp),%eax
    39d1:	89 44 24 14          	mov    %eax,0x14(%esp)
    39d5:	8b 45 0c             	mov    0xc(%ebp),%eax
    39d8:	89 44 24 04          	mov    %eax,0x4(%esp)
    39dc:	8b 45 10             	mov    0x10(%ebp),%eax
    39df:	89 44 24 08          	mov    %eax,0x8(%esp)
    39e3:	8b 45 14             	mov    0x14(%ebp),%eax
    39e6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    39ea:	8b 45 18             	mov    0x18(%ebp),%eax
    39ed:	89 44 24 10          	mov    %eax,0x10(%esp)
    39f1:	89 14 24             	mov    %edx,(%esp)
    39f4:	e8 19 00 00 00       	call   3a12 <addClickable>
	    	break;
    39f9:	eb 15                	jmp    3a10 <createClickable+0xc8>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    39fb:	c7 44 24 04 5c af 00 	movl   $0xaf5c,0x4(%esp)
    3a02:	00 
    3a03:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3a0a:	e8 53 09 00 00       	call   4362 <printf>
	    	break;
    3a0f:	90                   	nop
	}
}
    3a10:	c9                   	leave  
    3a11:	c3                   	ret    

00003a12 <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    3a12:	55                   	push   %ebp
    3a13:	89 e5                	mov    %esp,%ebp
    3a15:	83 ec 28             	sub    $0x28,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    3a18:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
    3a1f:	e8 2a 0c 00 00       	call   464e <malloc>
    3a24:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    3a27:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a2a:	8b 55 0c             	mov    0xc(%ebp),%edx
    3a2d:	89 10                	mov    %edx,(%eax)
    3a2f:	8b 55 10             	mov    0x10(%ebp),%edx
    3a32:	89 50 04             	mov    %edx,0x4(%eax)
    3a35:	8b 55 14             	mov    0x14(%ebp),%edx
    3a38:	89 50 08             	mov    %edx,0x8(%eax)
    3a3b:	8b 55 18             	mov    0x18(%ebp),%edx
    3a3e:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    3a41:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a44:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3a47:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    3a4a:	8b 45 08             	mov    0x8(%ebp),%eax
    3a4d:	8b 10                	mov    (%eax),%edx
    3a4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a52:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    3a55:	8b 45 08             	mov    0x8(%ebp),%eax
    3a58:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3a5b:	89 10                	mov    %edx,(%eax)
}
    3a5d:	c9                   	leave  
    3a5e:	c3                   	ret    

00003a5f <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    3a5f:	55                   	push   %ebp
    3a60:	89 e5                	mov    %esp,%ebp
    3a62:	83 ec 38             	sub    $0x38,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    3a65:	8b 45 08             	mov    0x8(%ebp),%eax
    3a68:	8b 00                	mov    (%eax),%eax
    3a6a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3a6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3a70:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    3a73:	e9 bb 00 00 00       	jmp    3b33 <deleteClickable+0xd4>
	{
		if (isIn(cur->area.start, region))
    3a78:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a7b:	89 44 24 08          	mov    %eax,0x8(%esp)
    3a7f:	8b 45 10             	mov    0x10(%ebp),%eax
    3a82:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3a86:	8b 45 14             	mov    0x14(%ebp),%eax
    3a89:	89 44 24 10          	mov    %eax,0x10(%esp)
    3a8d:	8b 45 18             	mov    0x18(%ebp),%eax
    3a90:	89 44 24 14          	mov    %eax,0x14(%esp)
    3a94:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3a97:	8b 50 04             	mov    0x4(%eax),%edx
    3a9a:	8b 00                	mov    (%eax),%eax
    3a9c:	89 04 24             	mov    %eax,(%esp)
    3a9f:	89 54 24 04          	mov    %edx,0x4(%esp)
    3aa3:	e8 0f fe ff ff       	call   38b7 <isIn>
    3aa8:	85 c0                	test   %eax,%eax
    3aaa:	74 60                	je     3b0c <deleteClickable+0xad>
		{
			//如果当前指针指向头部
			if (cur == *head)
    3aac:	8b 45 08             	mov    0x8(%ebp),%eax
    3aaf:	8b 00                	mov    (%eax),%eax
    3ab1:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3ab4:	75 2e                	jne    3ae4 <deleteClickable+0x85>
			{
				//删除头节点
				temp = *head;
    3ab6:	8b 45 08             	mov    0x8(%ebp),%eax
    3ab9:	8b 00                	mov    (%eax),%eax
    3abb:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    3abe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ac1:	8b 50 14             	mov    0x14(%eax),%edx
    3ac4:	8b 45 08             	mov    0x8(%ebp),%eax
    3ac7:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    3ac9:	8b 45 08             	mov    0x8(%ebp),%eax
    3acc:	8b 00                	mov    (%eax),%eax
    3ace:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3ad1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ad4:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    3ad7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3ada:	89 04 24             	mov    %eax,(%esp)
    3add:	e8 33 0a 00 00       	call   4515 <free>
    3ae2:	eb 4f                	jmp    3b33 <deleteClickable+0xd4>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    3ae4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ae7:	8b 50 14             	mov    0x14(%eax),%edx
    3aea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3aed:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    3af0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3af3:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    3af6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3af9:	8b 40 14             	mov    0x14(%eax),%eax
    3afc:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    3aff:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3b02:	89 04 24             	mov    %eax,(%esp)
    3b05:	e8 0b 0a 00 00       	call   4515 <free>
    3b0a:	eb 27                	jmp    3b33 <deleteClickable+0xd4>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    3b0c:	8b 45 08             	mov    0x8(%ebp),%eax
    3b0f:	8b 00                	mov    (%eax),%eax
    3b11:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3b14:	75 0b                	jne    3b21 <deleteClickable+0xc2>
			{
				cur = cur->next;
    3b16:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3b19:	8b 40 14             	mov    0x14(%eax),%eax
    3b1c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3b1f:	eb 12                	jmp    3b33 <deleteClickable+0xd4>
			}
			else
			{
				cur = cur->next;
    3b21:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3b24:	8b 40 14             	mov    0x14(%eax),%eax
    3b27:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    3b2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b2d:	8b 40 14             	mov    0x14(%eax),%eax
    3b30:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    3b33:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3b37:	0f 85 3b ff ff ff    	jne    3a78 <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    3b3d:	c9                   	leave  
    3b3e:	c3                   	ret    

00003b3f <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    3b3f:	55                   	push   %ebp
    3b40:	89 e5                	mov    %esp,%ebp
    3b42:	83 ec 38             	sub    $0x38,%esp
	Clickable *cur = head;
    3b45:	8b 45 08             	mov    0x8(%ebp),%eax
    3b48:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    3b4b:	eb 59                	jmp    3ba6 <executeHandler+0x67>
	{
		if (isIn(click, cur->area))
    3b4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b50:	8b 10                	mov    (%eax),%edx
    3b52:	89 54 24 08          	mov    %edx,0x8(%esp)
    3b56:	8b 50 04             	mov    0x4(%eax),%edx
    3b59:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3b5d:	8b 50 08             	mov    0x8(%eax),%edx
    3b60:	89 54 24 10          	mov    %edx,0x10(%esp)
    3b64:	8b 40 0c             	mov    0xc(%eax),%eax
    3b67:	89 44 24 14          	mov    %eax,0x14(%esp)
    3b6b:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b6e:	8b 55 10             	mov    0x10(%ebp),%edx
    3b71:	89 04 24             	mov    %eax,(%esp)
    3b74:	89 54 24 04          	mov    %edx,0x4(%esp)
    3b78:	e8 3a fd ff ff       	call   38b7 <isIn>
    3b7d:	85 c0                	test   %eax,%eax
    3b7f:	74 1c                	je     3b9d <executeHandler+0x5e>
		{
			cur->handler(click);
    3b81:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b84:	8b 48 10             	mov    0x10(%eax),%ecx
    3b87:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b8a:	8b 55 10             	mov    0x10(%ebp),%edx
    3b8d:	89 04 24             	mov    %eax,(%esp)
    3b90:	89 54 24 04          	mov    %edx,0x4(%esp)
    3b94:	ff d1                	call   *%ecx
			return 1;
    3b96:	b8 01 00 00 00       	mov    $0x1,%eax
    3b9b:	eb 28                	jmp    3bc5 <executeHandler+0x86>
		}
		cur = cur->next;
    3b9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ba0:	8b 40 14             	mov    0x14(%eax),%eax
    3ba3:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    3ba6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3baa:	75 a1                	jne    3b4d <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	printf(0, "execute: none!\n");
    3bac:	c7 44 24 04 8a af 00 	movl   $0xaf8a,0x4(%esp)
    3bb3:	00 
    3bb4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3bbb:	e8 a2 07 00 00       	call   4362 <printf>
	return 0;
    3bc0:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3bc5:	c9                   	leave  
    3bc6:	c3                   	ret    

00003bc7 <printClickable>:

void printClickable(Clickable *c)
{
    3bc7:	55                   	push   %ebp
    3bc8:	89 e5                	mov    %esp,%ebp
    3bca:	53                   	push   %ebx
    3bcb:	83 ec 24             	sub    $0x24,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    3bce:	8b 45 08             	mov    0x8(%ebp),%eax
    3bd1:	8b 58 0c             	mov    0xc(%eax),%ebx
    3bd4:	8b 45 08             	mov    0x8(%ebp),%eax
    3bd7:	8b 48 08             	mov    0x8(%eax),%ecx
    3bda:	8b 45 08             	mov    0x8(%ebp),%eax
    3bdd:	8b 50 04             	mov    0x4(%eax),%edx
    3be0:	8b 45 08             	mov    0x8(%ebp),%eax
    3be3:	8b 00                	mov    (%eax),%eax
    3be5:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    3be9:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    3bed:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3bf1:	89 44 24 08          	mov    %eax,0x8(%esp)
    3bf5:	c7 44 24 04 9a af 00 	movl   $0xaf9a,0x4(%esp)
    3bfc:	00 
    3bfd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3c04:	e8 59 07 00 00       	call   4362 <printf>
}
    3c09:	83 c4 24             	add    $0x24,%esp
    3c0c:	5b                   	pop    %ebx
    3c0d:	5d                   	pop    %ebp
    3c0e:	c3                   	ret    

00003c0f <printClickableList>:

void printClickableList(Clickable *head)
{
    3c0f:	55                   	push   %ebp
    3c10:	89 e5                	mov    %esp,%ebp
    3c12:	83 ec 28             	sub    $0x28,%esp
	Clickable *cur = head;
    3c15:	8b 45 08             	mov    0x8(%ebp),%eax
    3c18:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    3c1b:	c7 44 24 04 ac af 00 	movl   $0xafac,0x4(%esp)
    3c22:	00 
    3c23:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3c2a:	e8 33 07 00 00       	call   4362 <printf>
	while(cur != 0)
    3c2f:	eb 14                	jmp    3c45 <printClickableList+0x36>
	{
		printClickable(cur);
    3c31:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3c34:	89 04 24             	mov    %eax,(%esp)
    3c37:	e8 8b ff ff ff       	call   3bc7 <printClickable>
		cur = cur->next;
    3c3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3c3f:	8b 40 14             	mov    0x14(%eax),%eax
    3c42:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    3c45:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3c49:	75 e6                	jne    3c31 <printClickableList+0x22>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    3c4b:	c7 44 24 04 bd af 00 	movl   $0xafbd,0x4(%esp)
    3c52:	00 
    3c53:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3c5a:	e8 03 07 00 00       	call   4362 <printf>
}
    3c5f:	c9                   	leave  
    3c60:	c3                   	ret    

00003c61 <testHanler>:

void testHanler(struct Point p)
{
    3c61:	55                   	push   %ebp
    3c62:	89 e5                	mov    %esp,%ebp
    3c64:	83 ec 18             	sub    $0x18,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    3c67:	8b 55 0c             	mov    0xc(%ebp),%edx
    3c6a:	8b 45 08             	mov    0x8(%ebp),%eax
    3c6d:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3c71:	89 44 24 08          	mov    %eax,0x8(%esp)
    3c75:	c7 44 24 04 bf af 00 	movl   $0xafbf,0x4(%esp)
    3c7c:	00 
    3c7d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3c84:	e8 d9 06 00 00       	call   4362 <printf>
}
    3c89:	c9                   	leave  
    3c8a:	c3                   	ret    

00003c8b <testClickable>:
void testClickable(struct Context c)
{
    3c8b:	55                   	push   %ebp
    3c8c:	89 e5                	mov    %esp,%ebp
    3c8e:	81 ec 98 00 00 00    	sub    $0x98,%esp
	ClickableManager cm = initClickManager(c);
    3c94:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3c97:	8b 55 08             	mov    0x8(%ebp),%edx
    3c9a:	89 54 24 04          	mov    %edx,0x4(%esp)
    3c9e:	8b 55 0c             	mov    0xc(%ebp),%edx
    3ca1:	89 54 24 08          	mov    %edx,0x8(%esp)
    3ca5:	8b 55 10             	mov    0x10(%ebp),%edx
    3ca8:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3cac:	89 04 24             	mov    %eax,(%esp)
    3caf:	e8 46 fc ff ff       	call   38fa <initClickManager>
    3cb4:	83 ec 04             	sub    $0x4,%esp

	Rect r1 = initRect(5,5,20,20);
    3cb7:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    3cba:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    3cc1:	00 
    3cc2:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    3cc9:	00 
    3cca:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    3cd1:	00 
    3cd2:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    3cd9:	00 
    3cda:	89 04 24             	mov    %eax,(%esp)
    3cdd:	e8 7a fb ff ff       	call   385c <initRect>
    3ce2:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(20,20,20,20);
    3ce5:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    3ce8:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    3cef:	00 
    3cf0:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    3cf7:	00 
    3cf8:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
    3cff:	00 
    3d00:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
    3d07:	00 
    3d08:	89 04 24             	mov    %eax,(%esp)
    3d0b:	e8 4c fb ff ff       	call   385c <initRect>
    3d10:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(50,50,15,15);
    3d13:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    3d16:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
    3d1d:	00 
    3d1e:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%esp)
    3d25:	00 
    3d26:	c7 44 24 08 32 00 00 	movl   $0x32,0x8(%esp)
    3d2d:	00 
    3d2e:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
    3d35:	00 
    3d36:	89 04 24             	mov    %eax,(%esp)
    3d39:	e8 1e fb ff ff       	call   385c <initRect>
    3d3e:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0,0,30,30);
    3d41:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3d44:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    3d4b:	00 
    3d4c:	c7 44 24 0c 1e 00 00 	movl   $0x1e,0xc(%esp)
    3d53:	00 
    3d54:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    3d5b:	00 
    3d5c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3d63:	00 
    3d64:	89 04 24             	mov    %eax,(%esp)
    3d67:	e8 f0 fa ff ff       	call   385c <initRect>
    3d6c:	83 ec 04             	sub    $0x4,%esp
	Point p1 = initPoint(23, 23);
    3d6f:	8d 45 9c             	lea    -0x64(%ebp),%eax
    3d72:	c7 44 24 08 17 00 00 	movl   $0x17,0x8(%esp)
    3d79:	00 
    3d7a:	c7 44 24 04 17 00 00 	movl   $0x17,0x4(%esp)
    3d81:	00 
    3d82:	89 04 24             	mov    %eax,(%esp)
    3d85:	e8 ab fa ff ff       	call   3835 <initPoint>
    3d8a:	83 ec 04             	sub    $0x4,%esp
	Point p2 = initPoint(70, 70);
    3d8d:	8d 45 94             	lea    -0x6c(%ebp),%eax
    3d90:	c7 44 24 08 46 00 00 	movl   $0x46,0x8(%esp)
    3d97:	00 
    3d98:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
    3d9f:	00 
    3da0:	89 04 24             	mov    %eax,(%esp)
    3da3:	e8 8d fa ff ff       	call   3835 <initPoint>
    3da8:	83 ec 04             	sub    $0x4,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    3dab:	c7 44 24 18 61 3c 00 	movl   $0x3c61,0x18(%esp)
    3db2:	00 
    3db3:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    3dba:	00 
    3dbb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3dbe:	89 44 24 04          	mov    %eax,0x4(%esp)
    3dc2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3dc5:	89 44 24 08          	mov    %eax,0x8(%esp)
    3dc9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3dcc:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3dd0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3dd3:	89 44 24 10          	mov    %eax,0x10(%esp)
    3dd7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3dda:	89 04 24             	mov    %eax,(%esp)
    3ddd:	e8 66 fb ff ff       	call   3948 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    3de2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3de5:	89 44 24 08          	mov    %eax,0x8(%esp)
    3de9:	c7 44 24 04 d3 af 00 	movl   $0xafd3,0x4(%esp)
    3df0:	00 
    3df1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3df8:	e8 65 05 00 00       	call   4362 <printf>
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    3dfd:	c7 44 24 18 61 3c 00 	movl   $0x3c61,0x18(%esp)
    3e04:	00 
    3e05:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    3e0c:	00 
    3e0d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3e10:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e14:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3e17:	89 44 24 08          	mov    %eax,0x8(%esp)
    3e1b:	8b 45 cc             	mov    -0x34(%ebp),%eax
    3e1e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3e22:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3e25:	89 44 24 10          	mov    %eax,0x10(%esp)
    3e29:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3e2c:	89 04 24             	mov    %eax,(%esp)
    3e2f:	e8 14 fb ff ff       	call   3948 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    3e34:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3e37:	89 44 24 08          	mov    %eax,0x8(%esp)
    3e3b:	c7 44 24 04 d3 af 00 	movl   $0xafd3,0x4(%esp)
    3e42:	00 
    3e43:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e4a:	e8 13 05 00 00       	call   4362 <printf>
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    3e4f:	c7 44 24 18 61 3c 00 	movl   $0x3c61,0x18(%esp)
    3e56:	00 
    3e57:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    3e5e:	00 
    3e5f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    3e62:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e66:	8b 45 b8             	mov    -0x48(%ebp),%eax
    3e69:	89 44 24 08          	mov    %eax,0x8(%esp)
    3e6d:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3e70:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3e74:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3e77:	89 44 24 10          	mov    %eax,0x10(%esp)
    3e7b:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3e7e:	89 04 24             	mov    %eax,(%esp)
    3e81:	e8 c2 fa ff ff       	call   3948 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    3e86:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3e89:	89 44 24 08          	mov    %eax,0x8(%esp)
    3e8d:	c7 44 24 04 d3 af 00 	movl   $0xafd3,0x4(%esp)
    3e94:	00 
    3e95:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e9c:	e8 c1 04 00 00       	call   4362 <printf>
	printClickableList(cm.left_click);
    3ea1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3ea4:	89 04 24             	mov    %eax,(%esp)
    3ea7:	e8 63 fd ff ff       	call   3c0f <printClickableList>
	executeHandler(cm.left_click, p1);
    3eac:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    3eaf:	8b 45 9c             	mov    -0x64(%ebp),%eax
    3eb2:	8b 55 a0             	mov    -0x60(%ebp),%edx
    3eb5:	89 44 24 04          	mov    %eax,0x4(%esp)
    3eb9:	89 54 24 08          	mov    %edx,0x8(%esp)
    3ebd:	89 0c 24             	mov    %ecx,(%esp)
    3ec0:	e8 7a fc ff ff       	call   3b3f <executeHandler>
	executeHandler(cm.left_click, p2);
    3ec5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    3ec8:	8b 45 94             	mov    -0x6c(%ebp),%eax
    3ecb:	8b 55 98             	mov    -0x68(%ebp),%edx
    3ece:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ed2:	89 54 24 08          	mov    %edx,0x8(%esp)
    3ed6:	89 0c 24             	mov    %ecx,(%esp)
    3ed9:	e8 61 fc ff ff       	call   3b3f <executeHandler>
	deleteClickable(&cm.left_click, r4);
    3ede:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    3ee1:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ee5:	8b 45 a8             	mov    -0x58(%ebp),%eax
    3ee8:	89 44 24 08          	mov    %eax,0x8(%esp)
    3eec:	8b 45 ac             	mov    -0x54(%ebp),%eax
    3eef:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3ef3:	8b 45 b0             	mov    -0x50(%ebp),%eax
    3ef6:	89 44 24 10          	mov    %eax,0x10(%esp)
    3efa:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3efd:	89 04 24             	mov    %eax,(%esp)
    3f00:	e8 5a fb ff ff       	call   3a5f <deleteClickable>
	printClickableList(cm.left_click);
    3f05:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f08:	89 04 24             	mov    %eax,(%esp)
    3f0b:	e8 ff fc ff ff       	call   3c0f <printClickableList>
}
    3f10:	c9                   	leave  
    3f11:	c3                   	ret    

00003f12 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    3f12:	55                   	push   %ebp
    3f13:	89 e5                	mov    %esp,%ebp
    3f15:	57                   	push   %edi
    3f16:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    3f17:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3f1a:	8b 55 10             	mov    0x10(%ebp),%edx
    3f1d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f20:	89 cb                	mov    %ecx,%ebx
    3f22:	89 df                	mov    %ebx,%edi
    3f24:	89 d1                	mov    %edx,%ecx
    3f26:	fc                   	cld    
    3f27:	f3 aa                	rep stos %al,%es:(%edi)
    3f29:	89 ca                	mov    %ecx,%edx
    3f2b:	89 fb                	mov    %edi,%ebx
    3f2d:	89 5d 08             	mov    %ebx,0x8(%ebp)
    3f30:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    3f33:	5b                   	pop    %ebx
    3f34:	5f                   	pop    %edi
    3f35:	5d                   	pop    %ebp
    3f36:	c3                   	ret    

00003f37 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3f37:	55                   	push   %ebp
    3f38:	89 e5                	mov    %esp,%ebp
    3f3a:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    3f3d:	8b 45 08             	mov    0x8(%ebp),%eax
    3f40:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    3f43:	90                   	nop
    3f44:	8b 45 08             	mov    0x8(%ebp),%eax
    3f47:	8d 50 01             	lea    0x1(%eax),%edx
    3f4a:	89 55 08             	mov    %edx,0x8(%ebp)
    3f4d:	8b 55 0c             	mov    0xc(%ebp),%edx
    3f50:	8d 4a 01             	lea    0x1(%edx),%ecx
    3f53:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    3f56:	0f b6 12             	movzbl (%edx),%edx
    3f59:	88 10                	mov    %dl,(%eax)
    3f5b:	0f b6 00             	movzbl (%eax),%eax
    3f5e:	84 c0                	test   %al,%al
    3f60:	75 e2                	jne    3f44 <strcpy+0xd>
    ;
  return os;
    3f62:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3f65:	c9                   	leave  
    3f66:	c3                   	ret    

00003f67 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3f67:	55                   	push   %ebp
    3f68:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    3f6a:	eb 08                	jmp    3f74 <strcmp+0xd>
    p++, q++;
    3f6c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3f70:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3f74:	8b 45 08             	mov    0x8(%ebp),%eax
    3f77:	0f b6 00             	movzbl (%eax),%eax
    3f7a:	84 c0                	test   %al,%al
    3f7c:	74 10                	je     3f8e <strcmp+0x27>
    3f7e:	8b 45 08             	mov    0x8(%ebp),%eax
    3f81:	0f b6 10             	movzbl (%eax),%edx
    3f84:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f87:	0f b6 00             	movzbl (%eax),%eax
    3f8a:	38 c2                	cmp    %al,%dl
    3f8c:	74 de                	je     3f6c <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3f8e:	8b 45 08             	mov    0x8(%ebp),%eax
    3f91:	0f b6 00             	movzbl (%eax),%eax
    3f94:	0f b6 d0             	movzbl %al,%edx
    3f97:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f9a:	0f b6 00             	movzbl (%eax),%eax
    3f9d:	0f b6 c0             	movzbl %al,%eax
    3fa0:	29 c2                	sub    %eax,%edx
    3fa2:	89 d0                	mov    %edx,%eax
}
    3fa4:	5d                   	pop    %ebp
    3fa5:	c3                   	ret    

00003fa6 <strlen>:

uint
strlen(char *s)
{
    3fa6:	55                   	push   %ebp
    3fa7:	89 e5                	mov    %esp,%ebp
    3fa9:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    3fac:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    3fb3:	eb 04                	jmp    3fb9 <strlen+0x13>
    3fb5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3fb9:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3fbc:	8b 45 08             	mov    0x8(%ebp),%eax
    3fbf:	01 d0                	add    %edx,%eax
    3fc1:	0f b6 00             	movzbl (%eax),%eax
    3fc4:	84 c0                	test   %al,%al
    3fc6:	75 ed                	jne    3fb5 <strlen+0xf>
    ;
  return n;
    3fc8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3fcb:	c9                   	leave  
    3fcc:	c3                   	ret    

00003fcd <memset>:

void*
memset(void *dst, int c, uint n)
{
    3fcd:	55                   	push   %ebp
    3fce:	89 e5                	mov    %esp,%ebp
    3fd0:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    3fd3:	8b 45 10             	mov    0x10(%ebp),%eax
    3fd6:	89 44 24 08          	mov    %eax,0x8(%esp)
    3fda:	8b 45 0c             	mov    0xc(%ebp),%eax
    3fdd:	89 44 24 04          	mov    %eax,0x4(%esp)
    3fe1:	8b 45 08             	mov    0x8(%ebp),%eax
    3fe4:	89 04 24             	mov    %eax,(%esp)
    3fe7:	e8 26 ff ff ff       	call   3f12 <stosb>
  return dst;
    3fec:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3fef:	c9                   	leave  
    3ff0:	c3                   	ret    

00003ff1 <strchr>:

char*
strchr(const char *s, char c)
{
    3ff1:	55                   	push   %ebp
    3ff2:	89 e5                	mov    %esp,%ebp
    3ff4:	83 ec 04             	sub    $0x4,%esp
    3ff7:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ffa:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    3ffd:	eb 14                	jmp    4013 <strchr+0x22>
    if(*s == c)
    3fff:	8b 45 08             	mov    0x8(%ebp),%eax
    4002:	0f b6 00             	movzbl (%eax),%eax
    4005:	3a 45 fc             	cmp    -0x4(%ebp),%al
    4008:	75 05                	jne    400f <strchr+0x1e>
      return (char*)s;
    400a:	8b 45 08             	mov    0x8(%ebp),%eax
    400d:	eb 13                	jmp    4022 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    400f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    4013:	8b 45 08             	mov    0x8(%ebp),%eax
    4016:	0f b6 00             	movzbl (%eax),%eax
    4019:	84 c0                	test   %al,%al
    401b:	75 e2                	jne    3fff <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    401d:	b8 00 00 00 00       	mov    $0x0,%eax
}
    4022:	c9                   	leave  
    4023:	c3                   	ret    

00004024 <gets>:

char*
gets(char *buf, int max)
{
    4024:	55                   	push   %ebp
    4025:	89 e5                	mov    %esp,%ebp
    4027:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    402a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4031:	eb 4c                	jmp    407f <gets+0x5b>
    cc = read(0, &c, 1);
    4033:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    403a:	00 
    403b:	8d 45 ef             	lea    -0x11(%ebp),%eax
    403e:	89 44 24 04          	mov    %eax,0x4(%esp)
    4042:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4049:	e8 44 01 00 00       	call   4192 <read>
    404e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    4051:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4055:	7f 02                	jg     4059 <gets+0x35>
      break;
    4057:	eb 31                	jmp    408a <gets+0x66>
    buf[i++] = c;
    4059:	8b 45 f4             	mov    -0xc(%ebp),%eax
    405c:	8d 50 01             	lea    0x1(%eax),%edx
    405f:	89 55 f4             	mov    %edx,-0xc(%ebp)
    4062:	89 c2                	mov    %eax,%edx
    4064:	8b 45 08             	mov    0x8(%ebp),%eax
    4067:	01 c2                	add    %eax,%edx
    4069:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    406d:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    406f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4073:	3c 0a                	cmp    $0xa,%al
    4075:	74 13                	je     408a <gets+0x66>
    4077:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    407b:	3c 0d                	cmp    $0xd,%al
    407d:	74 0b                	je     408a <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    407f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4082:	83 c0 01             	add    $0x1,%eax
    4085:	3b 45 0c             	cmp    0xc(%ebp),%eax
    4088:	7c a9                	jl     4033 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    408a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    408d:	8b 45 08             	mov    0x8(%ebp),%eax
    4090:	01 d0                	add    %edx,%eax
    4092:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    4095:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4098:	c9                   	leave  
    4099:	c3                   	ret    

0000409a <stat>:

int
stat(char *n, struct stat *st)
{
    409a:	55                   	push   %ebp
    409b:	89 e5                	mov    %esp,%ebp
    409d:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    40a0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    40a7:	00 
    40a8:	8b 45 08             	mov    0x8(%ebp),%eax
    40ab:	89 04 24             	mov    %eax,(%esp)
    40ae:	e8 07 01 00 00       	call   41ba <open>
    40b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    40b6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    40ba:	79 07                	jns    40c3 <stat+0x29>
    return -1;
    40bc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    40c1:	eb 23                	jmp    40e6 <stat+0x4c>
  r = fstat(fd, st);
    40c3:	8b 45 0c             	mov    0xc(%ebp),%eax
    40c6:	89 44 24 04          	mov    %eax,0x4(%esp)
    40ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40cd:	89 04 24             	mov    %eax,(%esp)
    40d0:	e8 fd 00 00 00       	call   41d2 <fstat>
    40d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    40d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40db:	89 04 24             	mov    %eax,(%esp)
    40de:	e8 bf 00 00 00       	call   41a2 <close>
  return r;
    40e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    40e6:	c9                   	leave  
    40e7:	c3                   	ret    

000040e8 <atoi>:

int
atoi(const char *s)
{
    40e8:	55                   	push   %ebp
    40e9:	89 e5                	mov    %esp,%ebp
    40eb:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    40ee:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    40f5:	eb 25                	jmp    411c <atoi+0x34>
    n = n*10 + *s++ - '0';
    40f7:	8b 55 fc             	mov    -0x4(%ebp),%edx
    40fa:	89 d0                	mov    %edx,%eax
    40fc:	c1 e0 02             	shl    $0x2,%eax
    40ff:	01 d0                	add    %edx,%eax
    4101:	01 c0                	add    %eax,%eax
    4103:	89 c1                	mov    %eax,%ecx
    4105:	8b 45 08             	mov    0x8(%ebp),%eax
    4108:	8d 50 01             	lea    0x1(%eax),%edx
    410b:	89 55 08             	mov    %edx,0x8(%ebp)
    410e:	0f b6 00             	movzbl (%eax),%eax
    4111:	0f be c0             	movsbl %al,%eax
    4114:	01 c8                	add    %ecx,%eax
    4116:	83 e8 30             	sub    $0x30,%eax
    4119:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    411c:	8b 45 08             	mov    0x8(%ebp),%eax
    411f:	0f b6 00             	movzbl (%eax),%eax
    4122:	3c 2f                	cmp    $0x2f,%al
    4124:	7e 0a                	jle    4130 <atoi+0x48>
    4126:	8b 45 08             	mov    0x8(%ebp),%eax
    4129:	0f b6 00             	movzbl (%eax),%eax
    412c:	3c 39                	cmp    $0x39,%al
    412e:	7e c7                	jle    40f7 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    4130:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4133:	c9                   	leave  
    4134:	c3                   	ret    

00004135 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    4135:	55                   	push   %ebp
    4136:	89 e5                	mov    %esp,%ebp
    4138:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    413b:	8b 45 08             	mov    0x8(%ebp),%eax
    413e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    4141:	8b 45 0c             	mov    0xc(%ebp),%eax
    4144:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    4147:	eb 17                	jmp    4160 <memmove+0x2b>
    *dst++ = *src++;
    4149:	8b 45 fc             	mov    -0x4(%ebp),%eax
    414c:	8d 50 01             	lea    0x1(%eax),%edx
    414f:	89 55 fc             	mov    %edx,-0x4(%ebp)
    4152:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4155:	8d 4a 01             	lea    0x1(%edx),%ecx
    4158:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    415b:	0f b6 12             	movzbl (%edx),%edx
    415e:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    4160:	8b 45 10             	mov    0x10(%ebp),%eax
    4163:	8d 50 ff             	lea    -0x1(%eax),%edx
    4166:	89 55 10             	mov    %edx,0x10(%ebp)
    4169:	85 c0                	test   %eax,%eax
    416b:	7f dc                	jg     4149 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    416d:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4170:	c9                   	leave  
    4171:	c3                   	ret    

00004172 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    4172:	b8 01 00 00 00       	mov    $0x1,%eax
    4177:	cd 40                	int    $0x40
    4179:	c3                   	ret    

0000417a <exit>:
SYSCALL(exit)
    417a:	b8 02 00 00 00       	mov    $0x2,%eax
    417f:	cd 40                	int    $0x40
    4181:	c3                   	ret    

00004182 <wait>:
SYSCALL(wait)
    4182:	b8 03 00 00 00       	mov    $0x3,%eax
    4187:	cd 40                	int    $0x40
    4189:	c3                   	ret    

0000418a <pipe>:
SYSCALL(pipe)
    418a:	b8 04 00 00 00       	mov    $0x4,%eax
    418f:	cd 40                	int    $0x40
    4191:	c3                   	ret    

00004192 <read>:
SYSCALL(read)
    4192:	b8 05 00 00 00       	mov    $0x5,%eax
    4197:	cd 40                	int    $0x40
    4199:	c3                   	ret    

0000419a <write>:
SYSCALL(write)
    419a:	b8 10 00 00 00       	mov    $0x10,%eax
    419f:	cd 40                	int    $0x40
    41a1:	c3                   	ret    

000041a2 <close>:
SYSCALL(close)
    41a2:	b8 15 00 00 00       	mov    $0x15,%eax
    41a7:	cd 40                	int    $0x40
    41a9:	c3                   	ret    

000041aa <kill>:
SYSCALL(kill)
    41aa:	b8 06 00 00 00       	mov    $0x6,%eax
    41af:	cd 40                	int    $0x40
    41b1:	c3                   	ret    

000041b2 <exec>:
SYSCALL(exec)
    41b2:	b8 07 00 00 00       	mov    $0x7,%eax
    41b7:	cd 40                	int    $0x40
    41b9:	c3                   	ret    

000041ba <open>:
SYSCALL(open)
    41ba:	b8 0f 00 00 00       	mov    $0xf,%eax
    41bf:	cd 40                	int    $0x40
    41c1:	c3                   	ret    

000041c2 <mknod>:
SYSCALL(mknod)
    41c2:	b8 11 00 00 00       	mov    $0x11,%eax
    41c7:	cd 40                	int    $0x40
    41c9:	c3                   	ret    

000041ca <unlink>:
SYSCALL(unlink)
    41ca:	b8 12 00 00 00       	mov    $0x12,%eax
    41cf:	cd 40                	int    $0x40
    41d1:	c3                   	ret    

000041d2 <fstat>:
SYSCALL(fstat)
    41d2:	b8 08 00 00 00       	mov    $0x8,%eax
    41d7:	cd 40                	int    $0x40
    41d9:	c3                   	ret    

000041da <link>:
SYSCALL(link)
    41da:	b8 13 00 00 00       	mov    $0x13,%eax
    41df:	cd 40                	int    $0x40
    41e1:	c3                   	ret    

000041e2 <mkdir>:
SYSCALL(mkdir)
    41e2:	b8 14 00 00 00       	mov    $0x14,%eax
    41e7:	cd 40                	int    $0x40
    41e9:	c3                   	ret    

000041ea <chdir>:
SYSCALL(chdir)
    41ea:	b8 09 00 00 00       	mov    $0x9,%eax
    41ef:	cd 40                	int    $0x40
    41f1:	c3                   	ret    

000041f2 <dup>:
SYSCALL(dup)
    41f2:	b8 0a 00 00 00       	mov    $0xa,%eax
    41f7:	cd 40                	int    $0x40
    41f9:	c3                   	ret    

000041fa <getpid>:
SYSCALL(getpid)
    41fa:	b8 0b 00 00 00       	mov    $0xb,%eax
    41ff:	cd 40                	int    $0x40
    4201:	c3                   	ret    

00004202 <sbrk>:
SYSCALL(sbrk)
    4202:	b8 0c 00 00 00       	mov    $0xc,%eax
    4207:	cd 40                	int    $0x40
    4209:	c3                   	ret    

0000420a <sleep>:
SYSCALL(sleep)
    420a:	b8 0d 00 00 00       	mov    $0xd,%eax
    420f:	cd 40                	int    $0x40
    4211:	c3                   	ret    

00004212 <uptime>:
SYSCALL(uptime)
    4212:	b8 0e 00 00 00       	mov    $0xe,%eax
    4217:	cd 40                	int    $0x40
    4219:	c3                   	ret    

0000421a <getMsg>:
SYSCALL(getMsg)
    421a:	b8 16 00 00 00       	mov    $0x16,%eax
    421f:	cd 40                	int    $0x40
    4221:	c3                   	ret    

00004222 <createWindow>:
SYSCALL(createWindow)
    4222:	b8 17 00 00 00       	mov    $0x17,%eax
    4227:	cd 40                	int    $0x40
    4229:	c3                   	ret    

0000422a <destroyWindow>:
SYSCALL(destroyWindow)
    422a:	b8 18 00 00 00       	mov    $0x18,%eax
    422f:	cd 40                	int    $0x40
    4231:	c3                   	ret    

00004232 <updateWindow>:
SYSCALL(updateWindow)
    4232:	b8 19 00 00 00       	mov    $0x19,%eax
    4237:	cd 40                	int    $0x40
    4239:	c3                   	ret    

0000423a <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    423a:	b8 1a 00 00 00       	mov    $0x1a,%eax
    423f:	cd 40                	int    $0x40
    4241:	c3                   	ret    

00004242 <kwrite>:
SYSCALL(kwrite)
    4242:	b8 1c 00 00 00       	mov    $0x1c,%eax
    4247:	cd 40                	int    $0x40
    4249:	c3                   	ret    

0000424a <setSampleRate>:
SYSCALL(setSampleRate)
    424a:	b8 1b 00 00 00       	mov    $0x1b,%eax
    424f:	cd 40                	int    $0x40
    4251:	c3                   	ret    

00004252 <pause>:
SYSCALL(pause)
    4252:	b8 1d 00 00 00       	mov    $0x1d,%eax
    4257:	cd 40                	int    $0x40
    4259:	c3                   	ret    

0000425a <wavdecode>:
SYSCALL(wavdecode)
    425a:	b8 1e 00 00 00       	mov    $0x1e,%eax
    425f:	cd 40                	int    $0x40
    4261:	c3                   	ret    

00004262 <beginDecode>:
SYSCALL(beginDecode)
    4262:	b8 1f 00 00 00       	mov    $0x1f,%eax
    4267:	cd 40                	int    $0x40
    4269:	c3                   	ret    

0000426a <waitForDecode>:
SYSCALL(waitForDecode)
    426a:	b8 20 00 00 00       	mov    $0x20,%eax
    426f:	cd 40                	int    $0x40
    4271:	c3                   	ret    

00004272 <endDecode>:
SYSCALL(endDecode)
    4272:	b8 21 00 00 00       	mov    $0x21,%eax
    4277:	cd 40                	int    $0x40
    4279:	c3                   	ret    

0000427a <getCoreBuf>:
    427a:	b8 22 00 00 00       	mov    $0x22,%eax
    427f:	cd 40                	int    $0x40
    4281:	c3                   	ret    

00004282 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    4282:	55                   	push   %ebp
    4283:	89 e5                	mov    %esp,%ebp
    4285:	83 ec 18             	sub    $0x18,%esp
    4288:	8b 45 0c             	mov    0xc(%ebp),%eax
    428b:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    428e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4295:	00 
    4296:	8d 45 f4             	lea    -0xc(%ebp),%eax
    4299:	89 44 24 04          	mov    %eax,0x4(%esp)
    429d:	8b 45 08             	mov    0x8(%ebp),%eax
    42a0:	89 04 24             	mov    %eax,(%esp)
    42a3:	e8 f2 fe ff ff       	call   419a <write>
}
    42a8:	c9                   	leave  
    42a9:	c3                   	ret    

000042aa <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    42aa:	55                   	push   %ebp
    42ab:	89 e5                	mov    %esp,%ebp
    42ad:	56                   	push   %esi
    42ae:	53                   	push   %ebx
    42af:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    42b2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    42b9:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    42bd:	74 17                	je     42d6 <printint+0x2c>
    42bf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    42c3:	79 11                	jns    42d6 <printint+0x2c>
    neg = 1;
    42c5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    42cc:	8b 45 0c             	mov    0xc(%ebp),%eax
    42cf:	f7 d8                	neg    %eax
    42d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    42d4:	eb 06                	jmp    42dc <printint+0x32>
  } else {
    x = xx;
    42d6:	8b 45 0c             	mov    0xc(%ebp),%eax
    42d9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    42dc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    42e3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    42e6:	8d 41 01             	lea    0x1(%ecx),%eax
    42e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    42ec:	8b 5d 10             	mov    0x10(%ebp),%ebx
    42ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
    42f2:	ba 00 00 00 00       	mov    $0x0,%edx
    42f7:	f7 f3                	div    %ebx
    42f9:	89 d0                	mov    %edx,%eax
    42fb:	0f b6 80 68 ed 00 00 	movzbl 0xed68(%eax),%eax
    4302:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    4306:	8b 75 10             	mov    0x10(%ebp),%esi
    4309:	8b 45 ec             	mov    -0x14(%ebp),%eax
    430c:	ba 00 00 00 00       	mov    $0x0,%edx
    4311:	f7 f6                	div    %esi
    4313:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4316:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    431a:	75 c7                	jne    42e3 <printint+0x39>
  if(neg)
    431c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4320:	74 10                	je     4332 <printint+0x88>
    buf[i++] = '-';
    4322:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4325:	8d 50 01             	lea    0x1(%eax),%edx
    4328:	89 55 f4             	mov    %edx,-0xc(%ebp)
    432b:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    4330:	eb 1f                	jmp    4351 <printint+0xa7>
    4332:	eb 1d                	jmp    4351 <printint+0xa7>
    putc(fd, buf[i]);
    4334:	8d 55 dc             	lea    -0x24(%ebp),%edx
    4337:	8b 45 f4             	mov    -0xc(%ebp),%eax
    433a:	01 d0                	add    %edx,%eax
    433c:	0f b6 00             	movzbl (%eax),%eax
    433f:	0f be c0             	movsbl %al,%eax
    4342:	89 44 24 04          	mov    %eax,0x4(%esp)
    4346:	8b 45 08             	mov    0x8(%ebp),%eax
    4349:	89 04 24             	mov    %eax,(%esp)
    434c:	e8 31 ff ff ff       	call   4282 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    4351:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    4355:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4359:	79 d9                	jns    4334 <printint+0x8a>
    putc(fd, buf[i]);
}
    435b:	83 c4 30             	add    $0x30,%esp
    435e:	5b                   	pop    %ebx
    435f:	5e                   	pop    %esi
    4360:	5d                   	pop    %ebp
    4361:	c3                   	ret    

00004362 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    4362:	55                   	push   %ebp
    4363:	89 e5                	mov    %esp,%ebp
    4365:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    4368:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    436f:	8d 45 0c             	lea    0xc(%ebp),%eax
    4372:	83 c0 04             	add    $0x4,%eax
    4375:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    4378:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    437f:	e9 7c 01 00 00       	jmp    4500 <printf+0x19e>
    c = fmt[i] & 0xff;
    4384:	8b 55 0c             	mov    0xc(%ebp),%edx
    4387:	8b 45 f0             	mov    -0x10(%ebp),%eax
    438a:	01 d0                	add    %edx,%eax
    438c:	0f b6 00             	movzbl (%eax),%eax
    438f:	0f be c0             	movsbl %al,%eax
    4392:	25 ff 00 00 00       	and    $0xff,%eax
    4397:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    439a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    439e:	75 2c                	jne    43cc <printf+0x6a>
      if(c == '%'){
    43a0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    43a4:	75 0c                	jne    43b2 <printf+0x50>
        state = '%';
    43a6:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    43ad:	e9 4a 01 00 00       	jmp    44fc <printf+0x19a>
      } else {
        putc(fd, c);
    43b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    43b5:	0f be c0             	movsbl %al,%eax
    43b8:	89 44 24 04          	mov    %eax,0x4(%esp)
    43bc:	8b 45 08             	mov    0x8(%ebp),%eax
    43bf:	89 04 24             	mov    %eax,(%esp)
    43c2:	e8 bb fe ff ff       	call   4282 <putc>
    43c7:	e9 30 01 00 00       	jmp    44fc <printf+0x19a>
      }
    } else if(state == '%'){
    43cc:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    43d0:	0f 85 26 01 00 00    	jne    44fc <printf+0x19a>
      if(c == 'd'){
    43d6:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    43da:	75 2d                	jne    4409 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    43dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    43df:	8b 00                	mov    (%eax),%eax
    43e1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    43e8:	00 
    43e9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    43f0:	00 
    43f1:	89 44 24 04          	mov    %eax,0x4(%esp)
    43f5:	8b 45 08             	mov    0x8(%ebp),%eax
    43f8:	89 04 24             	mov    %eax,(%esp)
    43fb:	e8 aa fe ff ff       	call   42aa <printint>
        ap++;
    4400:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4404:	e9 ec 00 00 00       	jmp    44f5 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    4409:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    440d:	74 06                	je     4415 <printf+0xb3>
    440f:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    4413:	75 2d                	jne    4442 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    4415:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4418:	8b 00                	mov    (%eax),%eax
    441a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    4421:	00 
    4422:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    4429:	00 
    442a:	89 44 24 04          	mov    %eax,0x4(%esp)
    442e:	8b 45 08             	mov    0x8(%ebp),%eax
    4431:	89 04 24             	mov    %eax,(%esp)
    4434:	e8 71 fe ff ff       	call   42aa <printint>
        ap++;
    4439:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    443d:	e9 b3 00 00 00       	jmp    44f5 <printf+0x193>
      } else if(c == 's'){
    4442:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    4446:	75 45                	jne    448d <printf+0x12b>
        s = (char*)*ap;
    4448:	8b 45 e8             	mov    -0x18(%ebp),%eax
    444b:	8b 00                	mov    (%eax),%eax
    444d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    4450:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    4454:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4458:	75 09                	jne    4463 <printf+0x101>
          s = "(null)";
    445a:	c7 45 f4 e3 af 00 00 	movl   $0xafe3,-0xc(%ebp)
        while(*s != 0){
    4461:	eb 1e                	jmp    4481 <printf+0x11f>
    4463:	eb 1c                	jmp    4481 <printf+0x11f>
          putc(fd, *s);
    4465:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4468:	0f b6 00             	movzbl (%eax),%eax
    446b:	0f be c0             	movsbl %al,%eax
    446e:	89 44 24 04          	mov    %eax,0x4(%esp)
    4472:	8b 45 08             	mov    0x8(%ebp),%eax
    4475:	89 04 24             	mov    %eax,(%esp)
    4478:	e8 05 fe ff ff       	call   4282 <putc>
          s++;
    447d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    4481:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4484:	0f b6 00             	movzbl (%eax),%eax
    4487:	84 c0                	test   %al,%al
    4489:	75 da                	jne    4465 <printf+0x103>
    448b:	eb 68                	jmp    44f5 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    448d:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    4491:	75 1d                	jne    44b0 <printf+0x14e>
        putc(fd, *ap);
    4493:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4496:	8b 00                	mov    (%eax),%eax
    4498:	0f be c0             	movsbl %al,%eax
    449b:	89 44 24 04          	mov    %eax,0x4(%esp)
    449f:	8b 45 08             	mov    0x8(%ebp),%eax
    44a2:	89 04 24             	mov    %eax,(%esp)
    44a5:	e8 d8 fd ff ff       	call   4282 <putc>
        ap++;
    44aa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    44ae:	eb 45                	jmp    44f5 <printf+0x193>
      } else if(c == '%'){
    44b0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    44b4:	75 17                	jne    44cd <printf+0x16b>
        putc(fd, c);
    44b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    44b9:	0f be c0             	movsbl %al,%eax
    44bc:	89 44 24 04          	mov    %eax,0x4(%esp)
    44c0:	8b 45 08             	mov    0x8(%ebp),%eax
    44c3:	89 04 24             	mov    %eax,(%esp)
    44c6:	e8 b7 fd ff ff       	call   4282 <putc>
    44cb:	eb 28                	jmp    44f5 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    44cd:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    44d4:	00 
    44d5:	8b 45 08             	mov    0x8(%ebp),%eax
    44d8:	89 04 24             	mov    %eax,(%esp)
    44db:	e8 a2 fd ff ff       	call   4282 <putc>
        putc(fd, c);
    44e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    44e3:	0f be c0             	movsbl %al,%eax
    44e6:	89 44 24 04          	mov    %eax,0x4(%esp)
    44ea:	8b 45 08             	mov    0x8(%ebp),%eax
    44ed:	89 04 24             	mov    %eax,(%esp)
    44f0:	e8 8d fd ff ff       	call   4282 <putc>
      }
      state = 0;
    44f5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    44fc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4500:	8b 55 0c             	mov    0xc(%ebp),%edx
    4503:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4506:	01 d0                	add    %edx,%eax
    4508:	0f b6 00             	movzbl (%eax),%eax
    450b:	84 c0                	test   %al,%al
    450d:	0f 85 71 fe ff ff    	jne    4384 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    4513:	c9                   	leave  
    4514:	c3                   	ret    

00004515 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4515:	55                   	push   %ebp
    4516:	89 e5                	mov    %esp,%ebp
    4518:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    451b:	8b 45 08             	mov    0x8(%ebp),%eax
    451e:	83 e8 08             	sub    $0x8,%eax
    4521:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4524:	a1 74 f2 00 00       	mov    0xf274,%eax
    4529:	89 45 fc             	mov    %eax,-0x4(%ebp)
    452c:	eb 24                	jmp    4552 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    452e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4531:	8b 00                	mov    (%eax),%eax
    4533:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4536:	77 12                	ja     454a <free+0x35>
    4538:	8b 45 f8             	mov    -0x8(%ebp),%eax
    453b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    453e:	77 24                	ja     4564 <free+0x4f>
    4540:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4543:	8b 00                	mov    (%eax),%eax
    4545:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4548:	77 1a                	ja     4564 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    454a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    454d:	8b 00                	mov    (%eax),%eax
    454f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4552:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4555:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4558:	76 d4                	jbe    452e <free+0x19>
    455a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    455d:	8b 00                	mov    (%eax),%eax
    455f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4562:	76 ca                	jbe    452e <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    4564:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4567:	8b 40 04             	mov    0x4(%eax),%eax
    456a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4571:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4574:	01 c2                	add    %eax,%edx
    4576:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4579:	8b 00                	mov    (%eax),%eax
    457b:	39 c2                	cmp    %eax,%edx
    457d:	75 24                	jne    45a3 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    457f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4582:	8b 50 04             	mov    0x4(%eax),%edx
    4585:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4588:	8b 00                	mov    (%eax),%eax
    458a:	8b 40 04             	mov    0x4(%eax),%eax
    458d:	01 c2                	add    %eax,%edx
    458f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4592:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    4595:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4598:	8b 00                	mov    (%eax),%eax
    459a:	8b 10                	mov    (%eax),%edx
    459c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    459f:	89 10                	mov    %edx,(%eax)
    45a1:	eb 0a                	jmp    45ad <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    45a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45a6:	8b 10                	mov    (%eax),%edx
    45a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    45ab:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    45ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45b0:	8b 40 04             	mov    0x4(%eax),%eax
    45b3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    45ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45bd:	01 d0                	add    %edx,%eax
    45bf:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    45c2:	75 20                	jne    45e4 <free+0xcf>
    p->s.size += bp->s.size;
    45c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45c7:	8b 50 04             	mov    0x4(%eax),%edx
    45ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
    45cd:	8b 40 04             	mov    0x4(%eax),%eax
    45d0:	01 c2                	add    %eax,%edx
    45d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45d5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    45d8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    45db:	8b 10                	mov    (%eax),%edx
    45dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45e0:	89 10                	mov    %edx,(%eax)
    45e2:	eb 08                	jmp    45ec <free+0xd7>
  } else
    p->s.ptr = bp;
    45e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45e7:	8b 55 f8             	mov    -0x8(%ebp),%edx
    45ea:	89 10                	mov    %edx,(%eax)
  freep = p;
    45ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
    45ef:	a3 74 f2 00 00       	mov    %eax,0xf274
}
    45f4:	c9                   	leave  
    45f5:	c3                   	ret    

000045f6 <morecore>:

static Header*
morecore(uint nu)
{
    45f6:	55                   	push   %ebp
    45f7:	89 e5                	mov    %esp,%ebp
    45f9:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    45fc:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    4603:	77 07                	ja     460c <morecore+0x16>
    nu = 4096;
    4605:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    460c:	8b 45 08             	mov    0x8(%ebp),%eax
    460f:	c1 e0 03             	shl    $0x3,%eax
    4612:	89 04 24             	mov    %eax,(%esp)
    4615:	e8 e8 fb ff ff       	call   4202 <sbrk>
    461a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    461d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4621:	75 07                	jne    462a <morecore+0x34>
    return 0;
    4623:	b8 00 00 00 00       	mov    $0x0,%eax
    4628:	eb 22                	jmp    464c <morecore+0x56>
  hp = (Header*)p;
    462a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    462d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    4630:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4633:	8b 55 08             	mov    0x8(%ebp),%edx
    4636:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    4639:	8b 45 f0             	mov    -0x10(%ebp),%eax
    463c:	83 c0 08             	add    $0x8,%eax
    463f:	89 04 24             	mov    %eax,(%esp)
    4642:	e8 ce fe ff ff       	call   4515 <free>
  return freep;
    4647:	a1 74 f2 00 00       	mov    0xf274,%eax
}
    464c:	c9                   	leave  
    464d:	c3                   	ret    

0000464e <malloc>:

void*
malloc(uint nbytes)
{
    464e:	55                   	push   %ebp
    464f:	89 e5                	mov    %esp,%ebp
    4651:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4654:	8b 45 08             	mov    0x8(%ebp),%eax
    4657:	83 c0 07             	add    $0x7,%eax
    465a:	c1 e8 03             	shr    $0x3,%eax
    465d:	83 c0 01             	add    $0x1,%eax
    4660:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    4663:	a1 74 f2 00 00       	mov    0xf274,%eax
    4668:	89 45 f0             	mov    %eax,-0x10(%ebp)
    466b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    466f:	75 23                	jne    4694 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    4671:	c7 45 f0 6c f2 00 00 	movl   $0xf26c,-0x10(%ebp)
    4678:	8b 45 f0             	mov    -0x10(%ebp),%eax
    467b:	a3 74 f2 00 00       	mov    %eax,0xf274
    4680:	a1 74 f2 00 00       	mov    0xf274,%eax
    4685:	a3 6c f2 00 00       	mov    %eax,0xf26c
    base.s.size = 0;
    468a:	c7 05 70 f2 00 00 00 	movl   $0x0,0xf270
    4691:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4694:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4697:	8b 00                	mov    (%eax),%eax
    4699:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    469c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    469f:	8b 40 04             	mov    0x4(%eax),%eax
    46a2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    46a5:	72 4d                	jb     46f4 <malloc+0xa6>
      if(p->s.size == nunits)
    46a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46aa:	8b 40 04             	mov    0x4(%eax),%eax
    46ad:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    46b0:	75 0c                	jne    46be <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    46b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46b5:	8b 10                	mov    (%eax),%edx
    46b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    46ba:	89 10                	mov    %edx,(%eax)
    46bc:	eb 26                	jmp    46e4 <malloc+0x96>
      else {
        p->s.size -= nunits;
    46be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46c1:	8b 40 04             	mov    0x4(%eax),%eax
    46c4:	2b 45 ec             	sub    -0x14(%ebp),%eax
    46c7:	89 c2                	mov    %eax,%edx
    46c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46cc:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    46cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46d2:	8b 40 04             	mov    0x4(%eax),%eax
    46d5:	c1 e0 03             	shl    $0x3,%eax
    46d8:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    46db:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46de:	8b 55 ec             	mov    -0x14(%ebp),%edx
    46e1:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    46e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    46e7:	a3 74 f2 00 00       	mov    %eax,0xf274
      return (void*)(p + 1);
    46ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46ef:	83 c0 08             	add    $0x8,%eax
    46f2:	eb 38                	jmp    472c <malloc+0xde>
    }
    if(p == freep)
    46f4:	a1 74 f2 00 00       	mov    0xf274,%eax
    46f9:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    46fc:	75 1b                	jne    4719 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    46fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4701:	89 04 24             	mov    %eax,(%esp)
    4704:	e8 ed fe ff ff       	call   45f6 <morecore>
    4709:	89 45 f4             	mov    %eax,-0xc(%ebp)
    470c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4710:	75 07                	jne    4719 <malloc+0xcb>
        return 0;
    4712:	b8 00 00 00 00       	mov    $0x0,%eax
    4717:	eb 13                	jmp    472c <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4719:	8b 45 f4             	mov    -0xc(%ebp),%eax
    471c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    471f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4722:	8b 00                	mov    (%eax),%eax
    4724:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    4727:	e9 70 ff ff ff       	jmp    469c <malloc+0x4e>
}
    472c:	c9                   	leave  
    472d:	c3                   	ret    

0000472e <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    472e:	55                   	push   %ebp
    472f:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    4731:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    4735:	79 07                	jns    473e <abs+0x10>
		return x * -1;
    4737:	8b 45 08             	mov    0x8(%ebp),%eax
    473a:	f7 d8                	neg    %eax
    473c:	eb 03                	jmp    4741 <abs+0x13>
	else
		return x;
    473e:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4741:	5d                   	pop    %ebp
    4742:	c3                   	ret    

00004743 <sin>:
double sin(double x)  
{  
    4743:	55                   	push   %ebp
    4744:	89 e5                	mov    %esp,%ebp
    4746:	83 ec 3c             	sub    $0x3c,%esp
    4749:	8b 45 08             	mov    0x8(%ebp),%eax
    474c:	89 45 c8             	mov    %eax,-0x38(%ebp)
    474f:	8b 45 0c             	mov    0xc(%ebp),%eax
    4752:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    4755:	dd 45 c8             	fldl   -0x38(%ebp)
    4758:	dd 5d f8             	fstpl  -0x8(%ebp)
    475b:	d9 e8                	fld1   
    475d:	dd 5d f0             	fstpl  -0x10(%ebp)
    4760:	dd 45 c8             	fldl   -0x38(%ebp)
    4763:	dd 5d e8             	fstpl  -0x18(%ebp)
    4766:	dd 45 c8             	fldl   -0x38(%ebp)
    4769:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    476c:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    4773:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    477a:	eb 50                	jmp    47cc <sin+0x89>
	{  
		n = n+1;  
    477c:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    4780:	db 45 dc             	fildl  -0x24(%ebp)
    4783:	dc 4d f0             	fmull  -0x10(%ebp)
    4786:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4789:	83 c0 01             	add    $0x1,%eax
    478c:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    478f:	db 45 c4             	fildl  -0x3c(%ebp)
    4792:	de c9                	fmulp  %st,%st(1)
    4794:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    4797:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    479b:	dd 45 c8             	fldl   -0x38(%ebp)
    479e:	dc 4d c8             	fmull  -0x38(%ebp)
    47a1:	dd 45 e8             	fldl   -0x18(%ebp)
    47a4:	de c9                	fmulp  %st,%st(1)
    47a6:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    47a9:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    47ac:	dd 45 e8             	fldl   -0x18(%ebp)
    47af:	dc 75 f0             	fdivl  -0x10(%ebp)
    47b2:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    47b5:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    47b9:	7e 08                	jle    47c3 <sin+0x80>
    47bb:	dd 45 f8             	fldl   -0x8(%ebp)
    47be:	dc 45 e0             	faddl  -0x20(%ebp)
    47c1:	eb 06                	jmp    47c9 <sin+0x86>
    47c3:	dd 45 f8             	fldl   -0x8(%ebp)
    47c6:	dc 65 e0             	fsubl  -0x20(%ebp)
    47c9:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    47cc:	dd 45 e0             	fldl   -0x20(%ebp)
    47cf:	dd 05 f0 af 00 00    	fldl   0xaff0
    47d5:	d9 c9                	fxch   %st(1)
    47d7:	df e9                	fucomip %st(1),%st
    47d9:	dd d8                	fstp   %st(0)
    47db:	77 9f                	ja     477c <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    47dd:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    47e0:	c9                   	leave  
    47e1:	c3                   	ret    

000047e2 <cos>:
double cos(double x)  
{  
    47e2:	55                   	push   %ebp
    47e3:	89 e5                	mov    %esp,%ebp
    47e5:	83 ec 10             	sub    $0x10,%esp
    47e8:	8b 45 08             	mov    0x8(%ebp),%eax
    47eb:	89 45 f8             	mov    %eax,-0x8(%ebp)
    47ee:	8b 45 0c             	mov    0xc(%ebp),%eax
    47f1:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    47f4:	dd 05 f8 af 00 00    	fldl   0xaff8
    47fa:	dc 65 f8             	fsubl  -0x8(%ebp)
    47fd:	dd 1c 24             	fstpl  (%esp)
    4800:	e8 3e ff ff ff       	call   4743 <sin>
}  
    4805:	c9                   	leave  
    4806:	c3                   	ret    

00004807 <tan>:
double tan(double x)  
{  
    4807:	55                   	push   %ebp
    4808:	89 e5                	mov    %esp,%ebp
    480a:	83 ec 18             	sub    $0x18,%esp
    480d:	8b 45 08             	mov    0x8(%ebp),%eax
    4810:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4813:	8b 45 0c             	mov    0xc(%ebp),%eax
    4816:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    4819:	dd 45 f8             	fldl   -0x8(%ebp)
    481c:	dd 1c 24             	fstpl  (%esp)
    481f:	e8 1f ff ff ff       	call   4743 <sin>
    4824:	dd 5d f0             	fstpl  -0x10(%ebp)
    4827:	dd 45 f8             	fldl   -0x8(%ebp)
    482a:	dd 1c 24             	fstpl  (%esp)
    482d:	e8 b0 ff ff ff       	call   47e2 <cos>
    4832:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    4835:	c9                   	leave  
    4836:	c3                   	ret    

00004837 <pow>:

double pow(double x, double y)
{
    4837:	55                   	push   %ebp
    4838:	89 e5                	mov    %esp,%ebp
    483a:	83 ec 48             	sub    $0x48,%esp
    483d:	8b 45 08             	mov    0x8(%ebp),%eax
    4840:	89 45 e0             	mov    %eax,-0x20(%ebp)
    4843:	8b 45 0c             	mov    0xc(%ebp),%eax
    4846:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4849:	8b 45 10             	mov    0x10(%ebp),%eax
    484c:	89 45 d8             	mov    %eax,-0x28(%ebp)
    484f:	8b 45 14             	mov    0x14(%ebp),%eax
    4852:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    4855:	dd 45 e0             	fldl   -0x20(%ebp)
    4858:	d9 ee                	fldz   
    485a:	df e9                	fucomip %st(1),%st
    485c:	dd d8                	fstp   %st(0)
    485e:	7a 28                	jp     4888 <pow+0x51>
    4860:	dd 45 e0             	fldl   -0x20(%ebp)
    4863:	d9 ee                	fldz   
    4865:	df e9                	fucomip %st(1),%st
    4867:	dd d8                	fstp   %st(0)
    4869:	75 1d                	jne    4888 <pow+0x51>
    486b:	dd 45 d8             	fldl   -0x28(%ebp)
    486e:	d9 ee                	fldz   
    4870:	df e9                	fucomip %st(1),%st
    4872:	dd d8                	fstp   %st(0)
    4874:	7a 0b                	jp     4881 <pow+0x4a>
    4876:	dd 45 d8             	fldl   -0x28(%ebp)
    4879:	d9 ee                	fldz   
    487b:	df e9                	fucomip %st(1),%st
    487d:	dd d8                	fstp   %st(0)
    487f:	74 07                	je     4888 <pow+0x51>
    4881:	d9 ee                	fldz   
    4883:	e9 30 01 00 00       	jmp    49b8 <pow+0x181>
	else if(x==0 && y==0) return 1;
    4888:	dd 45 e0             	fldl   -0x20(%ebp)
    488b:	d9 ee                	fldz   
    488d:	df e9                	fucomip %st(1),%st
    488f:	dd d8                	fstp   %st(0)
    4891:	7a 28                	jp     48bb <pow+0x84>
    4893:	dd 45 e0             	fldl   -0x20(%ebp)
    4896:	d9 ee                	fldz   
    4898:	df e9                	fucomip %st(1),%st
    489a:	dd d8                	fstp   %st(0)
    489c:	75 1d                	jne    48bb <pow+0x84>
    489e:	dd 45 d8             	fldl   -0x28(%ebp)
    48a1:	d9 ee                	fldz   
    48a3:	df e9                	fucomip %st(1),%st
    48a5:	dd d8                	fstp   %st(0)
    48a7:	7a 12                	jp     48bb <pow+0x84>
    48a9:	dd 45 d8             	fldl   -0x28(%ebp)
    48ac:	d9 ee                	fldz   
    48ae:	df e9                	fucomip %st(1),%st
    48b0:	dd d8                	fstp   %st(0)
    48b2:	75 07                	jne    48bb <pow+0x84>
    48b4:	d9 e8                	fld1   
    48b6:	e9 fd 00 00 00       	jmp    49b8 <pow+0x181>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    48bb:	d9 ee                	fldz   
    48bd:	dd 45 d8             	fldl   -0x28(%ebp)
    48c0:	d9 c9                	fxch   %st(1)
    48c2:	df e9                	fucomip %st(1),%st
    48c4:	dd d8                	fstp   %st(0)
    48c6:	76 1d                	jbe    48e5 <pow+0xae>
    48c8:	dd 45 d8             	fldl   -0x28(%ebp)
    48cb:	d9 e0                	fchs   
    48cd:	dd 5c 24 08          	fstpl  0x8(%esp)
    48d1:	dd 45 e0             	fldl   -0x20(%ebp)
    48d4:	dd 1c 24             	fstpl  (%esp)
    48d7:	e8 5b ff ff ff       	call   4837 <pow>
    48dc:	d9 e8                	fld1   
    48de:	de f1                	fdivp  %st,%st(1)
    48e0:	e9 d3 00 00 00       	jmp    49b8 <pow+0x181>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    48e5:	d9 ee                	fldz   
    48e7:	dd 45 e0             	fldl   -0x20(%ebp)
    48ea:	d9 c9                	fxch   %st(1)
    48ec:	df e9                	fucomip %st(1),%st
    48ee:	dd d8                	fstp   %st(0)
    48f0:	76 40                	jbe    4932 <pow+0xfb>
    48f2:	dd 45 d8             	fldl   -0x28(%ebp)
    48f5:	d9 7d d6             	fnstcw -0x2a(%ebp)
    48f8:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    48fc:	b4 0c                	mov    $0xc,%ah
    48fe:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    4902:	d9 6d d4             	fldcw  -0x2c(%ebp)
    4905:	db 5d d0             	fistpl -0x30(%ebp)
    4908:	d9 6d d6             	fldcw  -0x2a(%ebp)
    490b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    490e:	89 45 d0             	mov    %eax,-0x30(%ebp)
    4911:	db 45 d0             	fildl  -0x30(%ebp)
    4914:	dd 45 d8             	fldl   -0x28(%ebp)
    4917:	de e1                	fsubp  %st,%st(1)
    4919:	d9 ee                	fldz   
    491b:	df e9                	fucomip %st(1),%st
    491d:	7a 0a                	jp     4929 <pow+0xf2>
    491f:	d9 ee                	fldz   
    4921:	df e9                	fucomip %st(1),%st
    4923:	dd d8                	fstp   %st(0)
    4925:	74 0b                	je     4932 <pow+0xfb>
    4927:	eb 02                	jmp    492b <pow+0xf4>
    4929:	dd d8                	fstp   %st(0)
    492b:	d9 ee                	fldz   
    492d:	e9 86 00 00 00       	jmp    49b8 <pow+0x181>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    4932:	d9 ee                	fldz   
    4934:	dd 45 e0             	fldl   -0x20(%ebp)
    4937:	d9 c9                	fxch   %st(1)
    4939:	df e9                	fucomip %st(1),%st
    493b:	dd d8                	fstp   %st(0)
    493d:	76 63                	jbe    49a2 <pow+0x16b>
    493f:	dd 45 d8             	fldl   -0x28(%ebp)
    4942:	d9 7d d6             	fnstcw -0x2a(%ebp)
    4945:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    4949:	b4 0c                	mov    $0xc,%ah
    494b:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    494f:	d9 6d d4             	fldcw  -0x2c(%ebp)
    4952:	db 5d d0             	fistpl -0x30(%ebp)
    4955:	d9 6d d6             	fldcw  -0x2a(%ebp)
    4958:	8b 45 d0             	mov    -0x30(%ebp),%eax
    495b:	89 45 d0             	mov    %eax,-0x30(%ebp)
    495e:	db 45 d0             	fildl  -0x30(%ebp)
    4961:	dd 45 d8             	fldl   -0x28(%ebp)
    4964:	de e1                	fsubp  %st,%st(1)
    4966:	d9 ee                	fldz   
    4968:	df e9                	fucomip %st(1),%st
    496a:	7a 34                	jp     49a0 <pow+0x169>
    496c:	d9 ee                	fldz   
    496e:	df e9                	fucomip %st(1),%st
    4970:	dd d8                	fstp   %st(0)
    4972:	75 2e                	jne    49a2 <pow+0x16b>
	{
		double powint=1;
    4974:	d9 e8                	fld1   
    4976:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    4979:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    4980:	eb 0d                	jmp    498f <pow+0x158>
    4982:	dd 45 f0             	fldl   -0x10(%ebp)
    4985:	dc 4d e0             	fmull  -0x20(%ebp)
    4988:	dd 5d f0             	fstpl  -0x10(%ebp)
    498b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    498f:	db 45 ec             	fildl  -0x14(%ebp)
    4992:	dd 45 d8             	fldl   -0x28(%ebp)
    4995:	df e9                	fucomip %st(1),%st
    4997:	dd d8                	fstp   %st(0)
    4999:	73 e7                	jae    4982 <pow+0x14b>
		return powint;
    499b:	dd 45 f0             	fldl   -0x10(%ebp)
    499e:	eb 18                	jmp    49b8 <pow+0x181>
    49a0:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    49a2:	dd 45 e0             	fldl   -0x20(%ebp)
    49a5:	dd 1c 24             	fstpl  (%esp)
    49a8:	e8 36 00 00 00       	call   49e3 <ln>
    49ad:	dc 4d d8             	fmull  -0x28(%ebp)
    49b0:	dd 1c 24             	fstpl  (%esp)
    49b3:	e8 0e 02 00 00       	call   4bc6 <exp>
}
    49b8:	c9                   	leave  
    49b9:	c3                   	ret    

000049ba <sqrt>:
// 求根
double sqrt(double x)
{
    49ba:	55                   	push   %ebp
    49bb:	89 e5                	mov    %esp,%ebp
    49bd:	83 ec 28             	sub    $0x28,%esp
    49c0:	8b 45 08             	mov    0x8(%ebp),%eax
    49c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    49c6:	8b 45 0c             	mov    0xc(%ebp),%eax
    49c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    49cc:	dd 05 00 b0 00 00    	fldl   0xb000
    49d2:	dd 5c 24 08          	fstpl  0x8(%esp)
    49d6:	dd 45 f0             	fldl   -0x10(%ebp)
    49d9:	dd 1c 24             	fstpl  (%esp)
    49dc:	e8 56 fe ff ff       	call   4837 <pow>
}
    49e1:	c9                   	leave  
    49e2:	c3                   	ret    

000049e3 <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    49e3:	55                   	push   %ebp
    49e4:	89 e5                	mov    %esp,%ebp
    49e6:	81 ec 88 00 00 00    	sub    $0x88,%esp
    49ec:	8b 45 08             	mov    0x8(%ebp),%eax
    49ef:	89 45 90             	mov    %eax,-0x70(%ebp)
    49f2:	8b 45 0c             	mov    0xc(%ebp),%eax
    49f5:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    49f8:	dd 45 90             	fldl   -0x70(%ebp)
    49fb:	d9 e8                	fld1   
    49fd:	de e9                	fsubrp %st,%st(1)
    49ff:	dd 5d c0             	fstpl  -0x40(%ebp)
    4a02:	d9 ee                	fldz   
    4a04:	dd 5d f0             	fstpl  -0x10(%ebp)
    4a07:	d9 ee                	fldz   
    4a09:	dd 5d b8             	fstpl  -0x48(%ebp)
    4a0c:	d9 ee                	fldz   
    4a0e:	dd 5d b0             	fstpl  -0x50(%ebp)
    4a11:	d9 ee                	fldz   
    4a13:	dd 5d e8             	fstpl  -0x18(%ebp)
    4a16:	d9 e8                	fld1   
    4a18:	dd 5d e0             	fstpl  -0x20(%ebp)
    4a1b:	d9 e8                	fld1   
    4a1d:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    4a20:	dd 45 90             	fldl   -0x70(%ebp)
    4a23:	d9 e8                	fld1   
    4a25:	df e9                	fucomip %st(1),%st
    4a27:	dd d8                	fstp   %st(0)
    4a29:	7a 12                	jp     4a3d <ln+0x5a>
    4a2b:	dd 45 90             	fldl   -0x70(%ebp)
    4a2e:	d9 e8                	fld1   
    4a30:	df e9                	fucomip %st(1),%st
    4a32:	dd d8                	fstp   %st(0)
    4a34:	75 07                	jne    4a3d <ln+0x5a>
    4a36:	d9 ee                	fldz   
    4a38:	e9 87 01 00 00       	jmp    4bc4 <ln+0x1e1>
	else if(x>2) return -ln(1/x);
    4a3d:	dd 45 90             	fldl   -0x70(%ebp)
    4a40:	dd 05 08 b0 00 00    	fldl   0xb008
    4a46:	d9 c9                	fxch   %st(1)
    4a48:	df e9                	fucomip %st(1),%st
    4a4a:	dd d8                	fstp   %st(0)
    4a4c:	76 14                	jbe    4a62 <ln+0x7f>
    4a4e:	d9 e8                	fld1   
    4a50:	dc 75 90             	fdivl  -0x70(%ebp)
    4a53:	dd 1c 24             	fstpl  (%esp)
    4a56:	e8 88 ff ff ff       	call   49e3 <ln>
    4a5b:	d9 e0                	fchs   
    4a5d:	e9 62 01 00 00       	jmp    4bc4 <ln+0x1e1>
	else if(x<.1)
    4a62:	dd 05 10 b0 00 00    	fldl   0xb010
    4a68:	dd 45 90             	fldl   -0x70(%ebp)
    4a6b:	d9 c9                	fxch   %st(1)
    4a6d:	df e9                	fucomip %st(1),%st
    4a6f:	dd d8                	fstp   %st(0)
    4a71:	76 59                	jbe    4acc <ln+0xe9>
	{
		double n=-1;
    4a73:	d9 e8                	fld1   
    4a75:	d9 e0                	fchs   
    4a77:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    4a7a:	dd 45 c8             	fldl   -0x38(%ebp)
    4a7d:	dd 05 18 b0 00 00    	fldl   0xb018
    4a83:	de e9                	fsubrp %st,%st(1)
    4a85:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    4a88:	dd 45 c8             	fldl   -0x38(%ebp)
    4a8b:	dd 1c 24             	fstpl  (%esp)
    4a8e:	e8 33 01 00 00       	call   4bc6 <exp>
    4a93:	dd 45 90             	fldl   -0x70(%ebp)
    4a96:	de f1                	fdivp  %st,%st(1)
    4a98:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    4a9b:	dd 45 a0             	fldl   -0x60(%ebp)
    4a9e:	dd 05 08 b0 00 00    	fldl   0xb008
    4aa4:	d9 c9                	fxch   %st(1)
    4aa6:	df e9                	fucomip %st(1),%st
    4aa8:	dd d8                	fstp   %st(0)
    4aaa:	77 ce                	ja     4a7a <ln+0x97>
    4aac:	d9 e8                	fld1   
    4aae:	dd 45 a0             	fldl   -0x60(%ebp)
    4ab1:	d9 c9                	fxch   %st(1)
    4ab3:	df e9                	fucomip %st(1),%st
    4ab5:	dd d8                	fstp   %st(0)
    4ab7:	77 c1                	ja     4a7a <ln+0x97>
		return ln(a)+n;
    4ab9:	dd 45 a0             	fldl   -0x60(%ebp)
    4abc:	dd 1c 24             	fstpl  (%esp)
    4abf:	e8 1f ff ff ff       	call   49e3 <ln>
    4ac4:	dc 45 c8             	faddl  -0x38(%ebp)
    4ac7:	e9 f8 00 00 00       	jmp    4bc4 <ln+0x1e1>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    4acc:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    4ad3:	d9 e8                	fld1   
    4ad5:	dd 5d d8             	fstpl  -0x28(%ebp)
    4ad8:	e9 b6 00 00 00       	jmp    4b93 <ln+0x1b0>
	{
		ln_tmp=ln_px;
    4add:	dd 45 e8             	fldl   -0x18(%ebp)
    4ae0:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    4ae3:	dd 45 d8             	fldl   -0x28(%ebp)
    4ae6:	dc 4d c0             	fmull  -0x40(%ebp)
    4ae9:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    4aec:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    4af0:	75 0d                	jne    4aff <ln+0x11c>
    4af2:	db 45 d4             	fildl  -0x2c(%ebp)
    4af5:	dd 45 d8             	fldl   -0x28(%ebp)
    4af8:	de f1                	fdivp  %st,%st(1)
    4afa:	dd 5d d8             	fstpl  -0x28(%ebp)
    4afd:	eb 13                	jmp    4b12 <ln+0x12f>
		else tmp=tmp/-l;
    4aff:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4b02:	f7 d8                	neg    %eax
    4b04:	89 45 8c             	mov    %eax,-0x74(%ebp)
    4b07:	db 45 8c             	fildl  -0x74(%ebp)
    4b0a:	dd 45 d8             	fldl   -0x28(%ebp)
    4b0d:	de f1                	fdivp  %st,%st(1)
    4b0f:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    4b12:	dd 45 f0             	fldl   -0x10(%ebp)
    4b15:	dc 45 d8             	faddl  -0x28(%ebp)
    4b18:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    4b1b:	dd 45 d8             	fldl   -0x28(%ebp)
    4b1e:	d9 e0                	fchs   
    4b20:	dc 4d c0             	fmull  -0x40(%ebp)
    4b23:	db 45 d4             	fildl  -0x2c(%ebp)
    4b26:	de c9                	fmulp  %st,%st(1)
    4b28:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4b2b:	83 c0 01             	add    $0x1,%eax
    4b2e:	89 45 8c             	mov    %eax,-0x74(%ebp)
    4b31:	db 45 8c             	fildl  -0x74(%ebp)
    4b34:	de f9                	fdivrp %st,%st(1)
    4b36:	dc 45 f0             	faddl  -0x10(%ebp)
    4b39:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    4b3c:	dd 45 d8             	fldl   -0x28(%ebp)
    4b3f:	dc 4d c0             	fmull  -0x40(%ebp)
    4b42:	dc 4d c0             	fmull  -0x40(%ebp)
    4b45:	db 45 d4             	fildl  -0x2c(%ebp)
    4b48:	de c9                	fmulp  %st,%st(1)
    4b4a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4b4d:	83 c0 02             	add    $0x2,%eax
    4b50:	89 45 8c             	mov    %eax,-0x74(%ebp)
    4b53:	db 45 8c             	fildl  -0x74(%ebp)
    4b56:	de f9                	fdivrp %st,%st(1)
    4b58:	dc 45 b8             	faddl  -0x48(%ebp)
    4b5b:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    4b5e:	dd 45 b0             	fldl   -0x50(%ebp)
    4b61:	dc 65 b8             	fsubl  -0x48(%ebp)
    4b64:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    4b67:	dd 45 a8             	fldl   -0x58(%ebp)
    4b6a:	dc 4d a8             	fmull  -0x58(%ebp)
    4b6d:	dd 45 b8             	fldl   -0x48(%ebp)
    4b70:	d8 c0                	fadd   %st(0),%st
    4b72:	dd 45 b0             	fldl   -0x50(%ebp)
    4b75:	de e1                	fsubp  %st,%st(1)
    4b77:	dc 45 f0             	faddl  -0x10(%ebp)
    4b7a:	de f9                	fdivrp %st,%st(1)
    4b7c:	dd 45 b0             	fldl   -0x50(%ebp)
    4b7f:	de e1                	fsubp  %st,%st(1)
    4b81:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    4b84:	db 45 d4             	fildl  -0x2c(%ebp)
    4b87:	dd 45 d8             	fldl   -0x28(%ebp)
    4b8a:	de c9                	fmulp  %st,%st(1)
    4b8c:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    4b8f:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    4b93:	dd 45 e8             	fldl   -0x18(%ebp)
    4b96:	dc 65 e0             	fsubl  -0x20(%ebp)
    4b99:	dd 05 20 b0 00 00    	fldl   0xb020
    4b9f:	d9 c9                	fxch   %st(1)
    4ba1:	df e9                	fucomip %st(1),%st
    4ba3:	dd d8                	fstp   %st(0)
    4ba5:	0f 87 32 ff ff ff    	ja     4add <ln+0xfa>
    4bab:	dd 45 e8             	fldl   -0x18(%ebp)
    4bae:	dc 65 e0             	fsubl  -0x20(%ebp)
    4bb1:	dd 05 28 b0 00 00    	fldl   0xb028
    4bb7:	df e9                	fucomip %st(1),%st
    4bb9:	dd d8                	fstp   %st(0)
    4bbb:	0f 87 1c ff ff ff    	ja     4add <ln+0xfa>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    4bc1:	dd 45 e8             	fldl   -0x18(%ebp)
}
    4bc4:	c9                   	leave  
    4bc5:	c3                   	ret    

00004bc6 <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    4bc6:	55                   	push   %ebp
    4bc7:	89 e5                	mov    %esp,%ebp
    4bc9:	83 ec 78             	sub    $0x78,%esp
    4bcc:	8b 45 08             	mov    0x8(%ebp),%eax
    4bcf:	89 45 a0             	mov    %eax,-0x60(%ebp)
    4bd2:	8b 45 0c             	mov    0xc(%ebp),%eax
    4bd5:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    4bd8:	dd 45 a0             	fldl   -0x60(%ebp)
    4bdb:	dd 5d c0             	fstpl  -0x40(%ebp)
    4bde:	d9 ee                	fldz   
    4be0:	dd 5d f0             	fstpl  -0x10(%ebp)
    4be3:	d9 ee                	fldz   
    4be5:	dd 5d b8             	fstpl  -0x48(%ebp)
    4be8:	d9 ee                	fldz   
    4bea:	dd 5d b0             	fstpl  -0x50(%ebp)
    4bed:	d9 ee                	fldz   
    4bef:	dd 5d e8             	fstpl  -0x18(%ebp)
    4bf2:	d9 e8                	fld1   
    4bf4:	dd 5d e0             	fstpl  -0x20(%ebp)
    4bf7:	d9 e8                	fld1   
    4bf9:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    4bfc:	dd 45 a0             	fldl   -0x60(%ebp)
    4bff:	d9 ee                	fldz   
    4c01:	df e9                	fucomip %st(1),%st
    4c03:	dd d8                	fstp   %st(0)
    4c05:	7a 12                	jp     4c19 <exp+0x53>
    4c07:	dd 45 a0             	fldl   -0x60(%ebp)
    4c0a:	d9 ee                	fldz   
    4c0c:	df e9                	fucomip %st(1),%st
    4c0e:	dd d8                	fstp   %st(0)
    4c10:	75 07                	jne    4c19 <exp+0x53>
    4c12:	d9 e8                	fld1   
    4c14:	e9 08 01 00 00       	jmp    4d21 <exp+0x15b>
	if(x<0) return 1/exp(-x); 
    4c19:	d9 ee                	fldz   
    4c1b:	dd 45 a0             	fldl   -0x60(%ebp)
    4c1e:	d9 c9                	fxch   %st(1)
    4c20:	df e9                	fucomip %st(1),%st
    4c22:	dd d8                	fstp   %st(0)
    4c24:	76 16                	jbe    4c3c <exp+0x76>
    4c26:	dd 45 a0             	fldl   -0x60(%ebp)
    4c29:	d9 e0                	fchs   
    4c2b:	dd 1c 24             	fstpl  (%esp)
    4c2e:	e8 93 ff ff ff       	call   4bc6 <exp>
    4c33:	d9 e8                	fld1   
    4c35:	de f1                	fdivp  %st,%st(1)
    4c37:	e9 e5 00 00 00       	jmp    4d21 <exp+0x15b>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    4c3c:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    4c43:	d9 e8                	fld1   
    4c45:	dd 5d d0             	fstpl  -0x30(%ebp)
    4c48:	e9 92 00 00 00       	jmp    4cdf <exp+0x119>
	{
		ex_tmp=ex_px;
    4c4d:	dd 45 e8             	fldl   -0x18(%ebp)
    4c50:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    4c53:	dd 45 d0             	fldl   -0x30(%ebp)
    4c56:	dc 4d c0             	fmull  -0x40(%ebp)
    4c59:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    4c5c:	db 45 cc             	fildl  -0x34(%ebp)
    4c5f:	dd 45 d0             	fldl   -0x30(%ebp)
    4c62:	de f1                	fdivp  %st,%st(1)
    4c64:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    4c67:	dd 45 f0             	fldl   -0x10(%ebp)
    4c6a:	dc 45 d0             	faddl  -0x30(%ebp)
    4c6d:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    4c70:	dd 45 d0             	fldl   -0x30(%ebp)
    4c73:	dc 4d c0             	fmull  -0x40(%ebp)
    4c76:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4c79:	83 c0 01             	add    $0x1,%eax
    4c7c:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4c7f:	db 45 9c             	fildl  -0x64(%ebp)
    4c82:	de f9                	fdivrp %st,%st(1)
    4c84:	dc 45 f0             	faddl  -0x10(%ebp)
    4c87:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    4c8a:	dd 45 d0             	fldl   -0x30(%ebp)
    4c8d:	dc 4d c0             	fmull  -0x40(%ebp)
    4c90:	dc 4d c0             	fmull  -0x40(%ebp)
    4c93:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4c96:	83 c0 01             	add    $0x1,%eax
    4c99:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4c9c:	db 45 9c             	fildl  -0x64(%ebp)
    4c9f:	de f9                	fdivrp %st,%st(1)
    4ca1:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4ca4:	83 c0 02             	add    $0x2,%eax
    4ca7:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4caa:	db 45 9c             	fildl  -0x64(%ebp)
    4cad:	de f9                	fdivrp %st,%st(1)
    4caf:	dc 45 b8             	faddl  -0x48(%ebp)
    4cb2:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    4cb5:	dd 45 b0             	fldl   -0x50(%ebp)
    4cb8:	dc 65 b8             	fsubl  -0x48(%ebp)
    4cbb:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    4cbe:	dd 45 d8             	fldl   -0x28(%ebp)
    4cc1:	dc 4d d8             	fmull  -0x28(%ebp)
    4cc4:	dd 45 b8             	fldl   -0x48(%ebp)
    4cc7:	d8 c0                	fadd   %st(0),%st
    4cc9:	dd 45 b0             	fldl   -0x50(%ebp)
    4ccc:	de e1                	fsubp  %st,%st(1)
    4cce:	dc 45 f0             	faddl  -0x10(%ebp)
    4cd1:	de f9                	fdivrp %st,%st(1)
    4cd3:	dd 45 b0             	fldl   -0x50(%ebp)
    4cd6:	de e1                	fsubp  %st,%st(1)
    4cd8:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    4cdb:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    4cdf:	dd 45 e8             	fldl   -0x18(%ebp)
    4ce2:	dc 65 e0             	fsubl  -0x20(%ebp)
    4ce5:	dd 05 30 b0 00 00    	fldl   0xb030
    4ceb:	d9 c9                	fxch   %st(1)
    4ced:	df e9                	fucomip %st(1),%st
    4cef:	dd d8                	fstp   %st(0)
    4cf1:	77 12                	ja     4d05 <exp+0x13f>
    4cf3:	dd 45 e8             	fldl   -0x18(%ebp)
    4cf6:	dc 65 e0             	fsubl  -0x20(%ebp)
    4cf9:	dd 05 38 b0 00 00    	fldl   0xb038
    4cff:	df e9                	fucomip %st(1),%st
    4d01:	dd d8                	fstp   %st(0)
    4d03:	76 15                	jbe    4d1a <exp+0x154>
    4d05:	dd 45 d8             	fldl   -0x28(%ebp)
    4d08:	dd 05 30 b0 00 00    	fldl   0xb030
    4d0e:	d9 c9                	fxch   %st(1)
    4d10:	df e9                	fucomip %st(1),%st
    4d12:	dd d8                	fstp   %st(0)
    4d14:	0f 87 33 ff ff ff    	ja     4c4d <exp+0x87>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    4d1a:	dd 45 e8             	fldl   -0x18(%ebp)
    4d1d:	d9 e8                	fld1   
    4d1f:	de c1                	faddp  %st,%st(1)
    4d21:	c9                   	leave  
    4d22:	c3                   	ret    

00004d23 <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    4d23:	55                   	push   %ebp
    4d24:	89 e5                	mov    %esp,%ebp
    4d26:	83 ec 78             	sub    $0x78,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    4d29:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    4d2d:	8b 45 08             	mov    0x8(%ebp),%eax
    4d30:	89 44 24 04          	mov    %eax,0x4(%esp)
    4d34:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4d37:	89 04 24             	mov    %eax,(%esp)
    4d3a:	e8 f8 f1 ff ff       	call   3f37 <strcpy>
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    4d3f:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    4d46:	00 
    4d47:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4d4a:	89 04 24             	mov    %eax,(%esp)
    4d4d:	e8 68 f4 ff ff       	call   41ba <open>
    4d52:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4d55:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4d59:	75 1b                	jne    4d76 <OpenTableFile+0x53>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    4d5b:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4d5e:	89 44 24 08          	mov    %eax,0x8(%esp)
    4d62:	c7 44 24 04 6c b0 00 	movl   $0xb06c,0x4(%esp)
    4d69:	00 
    4d6a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4d71:	e8 ec f5 ff ff       	call   4362 <printf>
    }
    return f;
    4d76:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4d79:	c9                   	leave  
    4d7a:	c3                   	ret    

00004d7b <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    4d7b:	55                   	push   %ebp
    4d7c:	89 e5                	mov    %esp,%ebp
    4d7e:	57                   	push   %edi
    4d7f:	56                   	push   %esi
    4d80:	53                   	push   %ebx
    4d81:	83 ec 3c             	sub    $0x3c,%esp
	layer *info = fr_ps->header;
    4d84:	8b 45 08             	mov    0x8(%ebp),%eax
    4d87:	8b 00                	mov    (%eax),%eax
    4d89:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    4d8c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4d8f:	8b 78 14             	mov    0x14(%eax),%edi
    4d92:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4d95:	8b 70 10             	mov    0x10(%eax),%esi
    4d98:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4d9b:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    4d9e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4da1:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    4da4:	85 c0                	test   %eax,%eax
    4da6:	0f 94 c0             	sete   %al
    4da9:	0f b6 c8             	movzbl %al,%ecx
    4dac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4daf:	8b 50 04             	mov    0x4(%eax),%edx
    4db2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4db5:	8b 00                	mov    (%eax),%eax
    4db7:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    4dbb:	89 74 24 18          	mov    %esi,0x18(%esp)
    4dbf:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    4dc3:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4dc7:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4dcb:	89 44 24 08          	mov    %eax,0x8(%esp)
    4dcf:	c7 44 24 04 8c b0 00 	movl   $0xb08c,0x4(%esp)
    4dd6:	00 
    4dd7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4dde:	e8 7f f5 ff ff       	call   4362 <printf>
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    4de3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4de6:	8b 78 2c             	mov    0x2c(%eax),%edi
    4de9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4dec:	8b 70 28             	mov    0x28(%eax),%esi
    4def:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4df2:	8b 58 24             	mov    0x24(%eax),%ebx
    4df5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4df8:	8b 48 20             	mov    0x20(%eax),%ecx
    4dfb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4dfe:	8b 50 1c             	mov    0x1c(%eax),%edx
    4e01:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e04:	8b 40 18             	mov    0x18(%eax),%eax
    4e07:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    4e0b:	89 74 24 18          	mov    %esi,0x18(%esp)
    4e0f:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    4e13:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4e17:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4e1b:	89 44 24 08          	mov    %eax,0x8(%esp)
    4e1f:	c7 44 24 04 cc b0 00 	movl   $0xb0cc,0x4(%esp)
    4e26:	00 
    4e27:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4e2e:	e8 2f f5 ff ff       	call   4362 <printf>
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    4e33:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e36:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4e39:	8b 0c 85 80 ee 00 00 	mov    0xee80(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    4e40:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e43:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4e46:	dd 04 c5 60 ee 00 00 	fldl   0xee60(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    4e4d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e50:	8b 40 04             	mov    0x4(%eax),%eax
    4e53:	8d 50 ff             	lea    -0x1(%eax),%edx
    4e56:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e59:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4e5c:	89 d0                	mov    %edx,%eax
    4e5e:	c1 e0 04             	shl    $0x4,%eax
    4e61:	29 d0                	sub    %edx,%eax
    4e63:	01 d8                	add    %ebx,%eax
    4e65:	8b 14 85 a0 ed 00 00 	mov    0xeda0(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    4e6c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e6f:	8b 40 04             	mov    0x4(%eax),%eax
    4e72:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4e75:	8b 04 85 80 ed 00 00 	mov    0xed80(,%eax,4),%eax
    4e7c:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    4e80:	dd 5c 24 10          	fstpl  0x10(%esp)
    4e84:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4e88:	89 44 24 08          	mov    %eax,0x8(%esp)
    4e8c:	c7 44 24 04 f4 b0 00 	movl   $0xb0f4,0x4(%esp)
    4e93:	00 
    4e94:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4e9b:	e8 c2 f4 ff ff       	call   4362 <printf>
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    4ea0:	8b 45 08             	mov    0x8(%ebp),%eax
    4ea3:	8b 48 08             	mov    0x8(%eax),%ecx
    4ea6:	8b 45 08             	mov    0x8(%ebp),%eax
    4ea9:	8b 50 0c             	mov    0xc(%eax),%edx
    4eac:	8b 45 08             	mov    0x8(%ebp),%eax
    4eaf:	8b 40 10             	mov    0x10(%eax),%eax
    4eb2:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4eb6:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4eba:	89 44 24 08          	mov    %eax,0x8(%esp)
    4ebe:	c7 44 24 04 23 b1 00 	movl   $0xb123,0x4(%esp)
    4ec5:	00 
    4ec6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4ecd:	e8 90 f4 ff ff       	call   4362 <printf>
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    4ed2:	83 c4 3c             	add    $0x3c,%esp
    4ed5:	5b                   	pop    %ebx
    4ed6:	5e                   	pop    %esi
    4ed7:	5f                   	pop    %edi
    4ed8:	5d                   	pop    %ebp
    4ed9:	c3                   	ret    

00004eda <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    4eda:	55                   	push   %ebp
    4edb:	89 e5                	mov    %esp,%ebp
    4edd:	83 ec 28             	sub    $0x28,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    4ee0:	8b 45 08             	mov    0x8(%ebp),%eax
    4ee3:	89 04 24             	mov    %eax,(%esp)
    4ee6:	e8 63 f7 ff ff       	call   464e <malloc>
    4eeb:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    4eee:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4ef2:	74 1c                	je     4f10 <mem_alloc+0x36>
		memset(ptr, 0, block);
    4ef4:	8b 45 08             	mov    0x8(%ebp),%eax
    4ef7:	89 44 24 08          	mov    %eax,0x8(%esp)
    4efb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4f02:	00 
    4f03:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4f06:	89 04 24             	mov    %eax,(%esp)
    4f09:	e8 bf f0 ff ff       	call   3fcd <memset>
    4f0e:	eb 20                	jmp    4f30 <mem_alloc+0x56>
	else{
		printf(0, "Unable to allocate %s\n", item);
    4f10:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f13:	89 44 24 08          	mov    %eax,0x8(%esp)
    4f17:	c7 44 24 04 3d b1 00 	movl   $0xb13d,0x4(%esp)
    4f1e:	00 
    4f1f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4f26:	e8 37 f4 ff ff       	call   4362 <printf>
		exit();
    4f2b:	e8 4a f2 ff ff       	call   417a <exit>
	}
	return ptr;
    4f30:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4f33:	c9                   	leave  
    4f34:	c3                   	ret    

00004f35 <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    4f35:	55                   	push   %ebp
    4f36:	89 e5                	mov    %esp,%ebp
    4f38:	83 ec 18             	sub    $0x18,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    4f3b:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f3e:	c7 44 24 04 54 b1 00 	movl   $0xb154,0x4(%esp)
    4f45:	00 
    4f46:	89 04 24             	mov    %eax,(%esp)
    4f49:	e8 8c ff ff ff       	call   4eda <mem_alloc>
    4f4e:	8b 55 08             	mov    0x8(%ebp),%edx
    4f51:	89 42 04             	mov    %eax,0x4(%edx)
	bs->buf_size = size;
    4f54:	8b 45 08             	mov    0x8(%ebp),%eax
    4f57:	8b 55 0c             	mov    0xc(%ebp),%edx
    4f5a:	89 50 08             	mov    %edx,0x8(%eax)
}
    4f5d:	c9                   	leave  
    4f5e:	c3                   	ret    

00004f5f <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    4f5f:	55                   	push   %ebp
    4f60:	89 e5                	mov    %esp,%ebp
    4f62:	83 ec 18             	sub    $0x18,%esp
	free(bs->buf);
    4f65:	8b 45 08             	mov    0x8(%ebp),%eax
    4f68:	8b 40 04             	mov    0x4(%eax),%eax
    4f6b:	89 04 24             	mov    %eax,(%esp)
    4f6e:	e8 a2 f5 ff ff       	call   4515 <free>
}
    4f73:	c9                   	leave  
    4f74:	c3                   	ret    

00004f75 <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    4f75:	55                   	push   %ebp
    4f76:	89 e5                	mov    %esp,%ebp
    4f78:	83 ec 18             	sub    $0x18,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    4f7b:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    4f82:	00 
    4f83:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f86:	89 04 24             	mov    %eax,(%esp)
    4f89:	e8 2c f2 ff ff       	call   41ba <open>
    4f8e:	8b 55 08             	mov    0x8(%ebp),%edx
    4f91:	89 02                	mov    %eax,(%edx)
    4f93:	8b 45 08             	mov    0x8(%ebp),%eax
    4f96:	8b 00                	mov    (%eax),%eax
    4f98:	83 f8 ff             	cmp    $0xffffffff,%eax
    4f9b:	75 20                	jne    4fbd <open_bit_stream_r+0x48>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    4f9d:	8b 45 0c             	mov    0xc(%ebp),%eax
    4fa0:	89 44 24 08          	mov    %eax,0x8(%esp)
    4fa4:	c7 44 24 04 5b b1 00 	movl   $0xb15b,0x4(%esp)
    4fab:	00 
    4fac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4fb3:	e8 aa f3 ff ff       	call   4362 <printf>
		exit();
    4fb8:	e8 bd f1 ff ff       	call   417a <exit>
	}

	bs->format = BINARY;
    4fbd:	8b 45 08             	mov    0x8(%ebp),%eax
    4fc0:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    4fc4:	8b 45 10             	mov    0x10(%ebp),%eax
    4fc7:	89 44 24 04          	mov    %eax,0x4(%esp)
    4fcb:	8b 45 08             	mov    0x8(%ebp),%eax
    4fce:	89 04 24             	mov    %eax,(%esp)
    4fd1:	e8 5f ff ff ff       	call   4f35 <alloc_buffer>
	bs->buf_byte_idx=0;
    4fd6:	8b 45 08             	mov    0x8(%ebp),%eax
    4fd9:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    4fe0:	8b 45 08             	mov    0x8(%ebp),%eax
    4fe3:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    4fea:	8b 45 08             	mov    0x8(%ebp),%eax
    4fed:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    4ff4:	8b 45 08             	mov    0x8(%ebp),%eax
    4ff7:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    4ffe:	8b 45 08             	mov    0x8(%ebp),%eax
    5001:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    5008:	8b 45 08             	mov    0x8(%ebp),%eax
    500b:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    5012:	c9                   	leave  
    5013:	c3                   	ret    

00005014 <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    5014:	55                   	push   %ebp
    5015:	89 e5                	mov    %esp,%ebp
    5017:	83 ec 18             	sub    $0x18,%esp
	close(bs->pt);
    501a:	8b 45 08             	mov    0x8(%ebp),%eax
    501d:	8b 00                	mov    (%eax),%eax
    501f:	89 04 24             	mov    %eax,(%esp)
    5022:	e8 7b f1 ff ff       	call   41a2 <close>
	desalloc_buffer(bs);
    5027:	8b 45 08             	mov    0x8(%ebp),%eax
    502a:	89 04 24             	mov    %eax,(%esp)
    502d:	e8 2d ff ff ff       	call   4f5f <desalloc_buffer>
}
    5032:	c9                   	leave  
    5033:	c3                   	ret    

00005034 <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    5034:	55                   	push   %ebp
    5035:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    5037:	8b 45 08             	mov    0x8(%ebp),%eax
    503a:	8b 40 20             	mov    0x20(%eax),%eax
}
    503d:	5d                   	pop    %ebp
    503e:	c3                   	ret    

0000503f <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    503f:	55                   	push   %ebp
    5040:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    5042:	8b 45 08             	mov    0x8(%ebp),%eax
    5045:	8b 40 0c             	mov    0xc(%eax),%eax
}
    5048:	5d                   	pop    %ebp
    5049:	c3                   	ret    

0000504a <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    504a:	55                   	push   %ebp
    504b:	89 e5                	mov    %esp,%ebp
    504d:	56                   	push   %esi
    504e:	53                   	push   %ebx
    504f:	83 ec 10             	sub    $0x10,%esp
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    5052:	8b 45 08             	mov    0x8(%ebp),%eax
    5055:	8b 40 08             	mov    0x8(%eax),%eax
    5058:	8d 50 fe             	lea    -0x2(%eax),%edx
    505b:	8b 45 08             	mov    0x8(%ebp),%eax
    505e:	8b 40 10             	mov    0x10(%eax),%eax
    5061:	89 d3                	mov    %edx,%ebx
    5063:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    5065:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    506a:	eb 35                	jmp    50a1 <refill_buffer+0x57>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    506c:	8b 45 08             	mov    0x8(%ebp),%eax
    506f:	8b 50 04             	mov    0x4(%eax),%edx
    5072:	89 d8                	mov    %ebx,%eax
    5074:	8d 58 ff             	lea    -0x1(%eax),%ebx
    5077:	01 c2                	add    %eax,%edx
    5079:	8b 45 08             	mov    0x8(%ebp),%eax
    507c:	8b 00                	mov    (%eax),%eax
    507e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    5085:	00 
    5086:	89 54 24 04          	mov    %edx,0x4(%esp)
    508a:	89 04 24             	mov    %eax,(%esp)
    508d:	e8 00 f1 ff ff       	call   4192 <read>
    5092:	89 c6                	mov    %eax,%esi
		if (!n)
    5094:	85 f6                	test   %esi,%esi
    5096:	75 09                	jne    50a1 <refill_buffer+0x57>
		bs->eob= i+1;
    5098:	8d 53 01             	lea    0x1(%ebx),%edx
    509b:	8b 45 08             	mov    0x8(%ebp),%eax
    509e:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    50a1:	85 db                	test   %ebx,%ebx
    50a3:	78 0a                	js     50af <refill_buffer+0x65>
    50a5:	8b 45 08             	mov    0x8(%ebp),%eax
    50a8:	8b 40 1c             	mov    0x1c(%eax),%eax
    50ab:	85 c0                	test   %eax,%eax
    50ad:	74 bd                	je     506c <refill_buffer+0x22>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    50af:	83 c4 10             	add    $0x10,%esp
    50b2:	5b                   	pop    %ebx
    50b3:	5e                   	pop    %esi
    50b4:	5d                   	pop    %ebp
    50b5:	c3                   	ret    

000050b6 <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    50b6:	55                   	push   %ebp
    50b7:	89 e5                	mov    %esp,%ebp
    50b9:	53                   	push   %ebx
    50ba:	83 ec 24             	sub    $0x24,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    50bd:	8b 45 08             	mov    0x8(%ebp),%eax
    50c0:	8b 40 0c             	mov    0xc(%eax),%eax
    50c3:	8d 50 01             	lea    0x1(%eax),%edx
    50c6:	8b 45 08             	mov    0x8(%ebp),%eax
    50c9:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    50cc:	8b 45 08             	mov    0x8(%ebp),%eax
    50cf:	8b 40 14             	mov    0x14(%eax),%eax
    50d2:	85 c0                	test   %eax,%eax
    50d4:	0f 85 9f 00 00 00    	jne    5179 <get1bit+0xc3>
        bs->buf_bit_idx = 8;
    50da:	8b 45 08             	mov    0x8(%ebp),%eax
    50dd:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    50e4:	8b 45 08             	mov    0x8(%ebp),%eax
    50e7:	8b 40 10             	mov    0x10(%eax),%eax
    50ea:	8d 50 ff             	lea    -0x1(%eax),%edx
    50ed:	8b 45 08             	mov    0x8(%ebp),%eax
    50f0:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    50f3:	8b 45 08             	mov    0x8(%ebp),%eax
    50f6:	8b 40 10             	mov    0x10(%eax),%eax
    50f9:	83 f8 03             	cmp    $0x3,%eax
    50fc:	7e 10                	jle    510e <get1bit+0x58>
    50fe:	8b 45 08             	mov    0x8(%ebp),%eax
    5101:	8b 50 10             	mov    0x10(%eax),%edx
    5104:	8b 45 08             	mov    0x8(%ebp),%eax
    5107:	8b 40 1c             	mov    0x1c(%eax),%eax
    510a:	39 c2                	cmp    %eax,%edx
    510c:	7d 6b                	jge    5179 <get1bit+0xc3>
             if (bs->eob)
    510e:	8b 45 08             	mov    0x8(%ebp),%eax
    5111:	8b 40 1c             	mov    0x1c(%eax),%eax
    5114:	85 c0                	test   %eax,%eax
    5116:	74 0c                	je     5124 <get1bit+0x6e>
                bs->eobs = TRUE;
    5118:	8b 45 08             	mov    0x8(%ebp),%eax
    511b:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    5122:	eb 55                	jmp    5179 <get1bit+0xc3>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    5124:	8b 45 08             	mov    0x8(%ebp),%eax
    5127:	8b 58 10             	mov    0x10(%eax),%ebx
    512a:	eb 2f                	jmp    515b <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    512c:	8b 45 08             	mov    0x8(%ebp),%eax
    512f:	8b 50 04             	mov    0x4(%eax),%edx
    5132:	8b 45 08             	mov    0x8(%ebp),%eax
    5135:	8b 40 08             	mov    0x8(%eax),%eax
    5138:	8d 48 ff             	lea    -0x1(%eax),%ecx
    513b:	8b 45 08             	mov    0x8(%ebp),%eax
    513e:	8b 40 10             	mov    0x10(%eax),%eax
    5141:	29 c1                	sub    %eax,%ecx
    5143:	89 c8                	mov    %ecx,%eax
    5145:	01 d8                	add    %ebx,%eax
    5147:	01 c2                	add    %eax,%edx
    5149:	8b 45 08             	mov    0x8(%ebp),%eax
    514c:	8b 48 04             	mov    0x4(%eax),%ecx
    514f:	89 d8                	mov    %ebx,%eax
    5151:	01 c8                	add    %ecx,%eax
    5153:	0f b6 00             	movzbl (%eax),%eax
    5156:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    5158:	83 eb 01             	sub    $0x1,%ebx
    515b:	85 db                	test   %ebx,%ebx
    515d:	79 cd                	jns    512c <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    515f:	8b 45 08             	mov    0x8(%ebp),%eax
    5162:	89 04 24             	mov    %eax,(%esp)
    5165:	e8 e0 fe ff ff       	call   504a <refill_buffer>
                bs->buf_byte_idx = bs->buf_size-1;
    516a:	8b 45 08             	mov    0x8(%ebp),%eax
    516d:	8b 40 08             	mov    0x8(%eax),%eax
    5170:	8d 50 ff             	lea    -0x1(%eax),%edx
    5173:	8b 45 08             	mov    0x8(%ebp),%eax
    5176:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    5179:	8b 45 08             	mov    0x8(%ebp),%eax
    517c:	8b 50 04             	mov    0x4(%eax),%edx
    517f:	8b 45 08             	mov    0x8(%ebp),%eax
    5182:	8b 40 10             	mov    0x10(%eax),%eax
    5185:	01 d0                	add    %edx,%eax
    5187:	0f b6 00             	movzbl (%eax),%eax
    518a:	0f b6 d0             	movzbl %al,%edx
    518d:	8b 45 08             	mov    0x8(%ebp),%eax
    5190:	8b 40 14             	mov    0x14(%eax),%eax
    5193:	83 e8 01             	sub    $0x1,%eax
    5196:	8b 04 85 a0 ee 00 00 	mov    0xeea0(,%eax,4),%eax
    519d:	21 d0                	and    %edx,%eax
    519f:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    51a2:	8b 45 08             	mov    0x8(%ebp),%eax
    51a5:	8b 40 14             	mov    0x14(%eax),%eax
    51a8:	83 e8 01             	sub    $0x1,%eax
    51ab:	89 c1                	mov    %eax,%ecx
    51ad:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    51b0:	8b 45 08             	mov    0x8(%ebp),%eax
    51b3:	8b 40 14             	mov    0x14(%eax),%eax
    51b6:	8d 50 ff             	lea    -0x1(%eax),%edx
    51b9:	8b 45 08             	mov    0x8(%ebp),%eax
    51bc:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    51bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    51c2:	83 c4 24             	add    $0x24,%esp
    51c5:	5b                   	pop    %ebx
    51c6:	5d                   	pop    %ebp
    51c7:	c3                   	ret    

000051c8 <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    51c8:	55                   	push   %ebp
    51c9:	89 e5                	mov    %esp,%ebp
    51cb:	57                   	push   %edi
    51cc:	56                   	push   %esi
    51cd:	53                   	push   %ebx
    51ce:	83 ec 2c             	sub    $0x2c,%esp
	unsigned long val=0;
    51d1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    51d8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    51db:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    51df:	7e 1c                	jle    51fd <getbits+0x35>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    51e1:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
    51e8:	00 
    51e9:	c7 44 24 04 74 b1 00 	movl   $0xb174,0x4(%esp)
    51f0:	00 
    51f1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    51f8:	e8 65 f1 ff ff       	call   4362 <printf>

	bs->totbit += N;
    51fd:	8b 45 08             	mov    0x8(%ebp),%eax
    5200:	8b 50 0c             	mov    0xc(%eax),%edx
    5203:	8b 45 0c             	mov    0xc(%ebp),%eax
    5206:	01 c2                	add    %eax,%edx
    5208:	8b 45 08             	mov    0x8(%ebp),%eax
    520b:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    520e:	e9 0a 01 00 00       	jmp    531d <getbits+0x155>
		if (!bs->buf_bit_idx) {
    5213:	8b 45 08             	mov    0x8(%ebp),%eax
    5216:	8b 40 14             	mov    0x14(%eax),%eax
    5219:	85 c0                	test   %eax,%eax
    521b:	0f 85 9f 00 00 00    	jne    52c0 <getbits+0xf8>
			bs->buf_bit_idx = 8;
    5221:	8b 45 08             	mov    0x8(%ebp),%eax
    5224:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    522b:	8b 45 08             	mov    0x8(%ebp),%eax
    522e:	8b 40 10             	mov    0x10(%eax),%eax
    5231:	8d 50 ff             	lea    -0x1(%eax),%edx
    5234:	8b 45 08             	mov    0x8(%ebp),%eax
    5237:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    523a:	8b 45 08             	mov    0x8(%ebp),%eax
    523d:	8b 40 10             	mov    0x10(%eax),%eax
    5240:	83 f8 03             	cmp    $0x3,%eax
    5243:	7e 10                	jle    5255 <getbits+0x8d>
    5245:	8b 45 08             	mov    0x8(%ebp),%eax
    5248:	8b 50 10             	mov    0x10(%eax),%edx
    524b:	8b 45 08             	mov    0x8(%ebp),%eax
    524e:	8b 40 1c             	mov    0x1c(%eax),%eax
    5251:	39 c2                	cmp    %eax,%edx
    5253:	7d 6b                	jge    52c0 <getbits+0xf8>
				if (bs->eob)
    5255:	8b 45 08             	mov    0x8(%ebp),%eax
    5258:	8b 40 1c             	mov    0x1c(%eax),%eax
    525b:	85 c0                	test   %eax,%eax
    525d:	74 0c                	je     526b <getbits+0xa3>
					bs->eobs = TRUE;
    525f:	8b 45 08             	mov    0x8(%ebp),%eax
    5262:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    5269:	eb 55                	jmp    52c0 <getbits+0xf8>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    526b:	8b 45 08             	mov    0x8(%ebp),%eax
    526e:	8b 70 10             	mov    0x10(%eax),%esi
    5271:	eb 2f                	jmp    52a2 <getbits+0xda>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    5273:	8b 45 08             	mov    0x8(%ebp),%eax
    5276:	8b 50 04             	mov    0x4(%eax),%edx
    5279:	8b 45 08             	mov    0x8(%ebp),%eax
    527c:	8b 40 08             	mov    0x8(%eax),%eax
    527f:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5282:	8b 45 08             	mov    0x8(%ebp),%eax
    5285:	8b 40 10             	mov    0x10(%eax),%eax
    5288:	29 c1                	sub    %eax,%ecx
    528a:	89 c8                	mov    %ecx,%eax
    528c:	01 f0                	add    %esi,%eax
    528e:	01 c2                	add    %eax,%edx
    5290:	8b 45 08             	mov    0x8(%ebp),%eax
    5293:	8b 48 04             	mov    0x4(%eax),%ecx
    5296:	89 f0                	mov    %esi,%eax
    5298:	01 c8                	add    %ecx,%eax
    529a:	0f b6 00             	movzbl (%eax),%eax
    529d:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    529f:	83 ee 01             	sub    $0x1,%esi
    52a2:	85 f6                	test   %esi,%esi
    52a4:	79 cd                	jns    5273 <getbits+0xab>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    52a6:	8b 45 08             	mov    0x8(%ebp),%eax
    52a9:	89 04 24             	mov    %eax,(%esp)
    52ac:	e8 99 fd ff ff       	call   504a <refill_buffer>
					bs->buf_byte_idx = bs->buf_size-1;
    52b1:	8b 45 08             	mov    0x8(%ebp),%eax
    52b4:	8b 40 08             	mov    0x8(%eax),%eax
    52b7:	8d 50 ff             	lea    -0x1(%eax),%edx
    52ba:	8b 45 08             	mov    0x8(%ebp),%eax
    52bd:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    52c0:	8b 45 08             	mov    0x8(%ebp),%eax
    52c3:	8b 40 14             	mov    0x14(%eax),%eax
    52c6:	39 d8                	cmp    %ebx,%eax
    52c8:	0f 4f c3             	cmovg  %ebx,%eax
    52cb:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    52cd:	8b 45 08             	mov    0x8(%ebp),%eax
    52d0:	8b 50 04             	mov    0x4(%eax),%edx
    52d3:	8b 45 08             	mov    0x8(%ebp),%eax
    52d6:	8b 40 10             	mov    0x10(%eax),%eax
    52d9:	01 d0                	add    %edx,%eax
    52db:	0f b6 00             	movzbl (%eax),%eax
    52de:	0f b6 d0             	movzbl %al,%edx
    52e1:	8b 45 08             	mov    0x8(%ebp),%eax
    52e4:	8b 40 14             	mov    0x14(%eax),%eax
    52e7:	8b 04 85 c0 ee 00 00 	mov    0xeec0(,%eax,4),%eax
    52ee:	89 d7                	mov    %edx,%edi
    52f0:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    52f2:	8b 45 08             	mov    0x8(%ebp),%eax
    52f5:	8b 40 14             	mov    0x14(%eax),%eax
    52f8:	29 f0                	sub    %esi,%eax
    52fa:	89 c1                	mov    %eax,%ecx
    52fc:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    52fe:	89 d8                	mov    %ebx,%eax
    5300:	29 f0                	sub    %esi,%eax
    5302:	89 c1                	mov    %eax,%ecx
    5304:	d3 e7                	shl    %cl,%edi
    5306:	89 f8                	mov    %edi,%eax
    5308:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    530b:	8b 45 08             	mov    0x8(%ebp),%eax
    530e:	8b 40 14             	mov    0x14(%eax),%eax
    5311:	29 f0                	sub    %esi,%eax
    5313:	89 c2                	mov    %eax,%edx
    5315:	8b 45 08             	mov    0x8(%ebp),%eax
    5318:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    531b:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    531d:	85 db                	test   %ebx,%ebx
    531f:	0f 8f ee fe ff ff    	jg     5213 <getbits+0x4b>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    5325:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    5328:	83 c4 2c             	add    $0x2c,%esp
    532b:	5b                   	pop    %ebx
    532c:	5e                   	pop    %esi
    532d:	5f                   	pop    %edi
    532e:	5d                   	pop    %ebp
    532f:	c3                   	ret    

00005330 <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    5330:	55                   	push   %ebp
    5331:	89 e5                	mov    %esp,%ebp
    5333:	83 ec 38             	sub    $0x38,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    5336:	db 45 10             	fildl  0x10(%ebp)
    5339:	dd 5c 24 08          	fstpl  0x8(%esp)
    533d:	dd 05 e0 b1 00 00    	fldl   0xb1e0
    5343:	dd 1c 24             	fstpl  (%esp)
    5346:	e8 ec f4 ff ff       	call   4837 <pow>
    534b:	d9 7d e6             	fnstcw -0x1a(%ebp)
    534e:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    5352:	b4 0c                	mov    $0xc,%ah
    5354:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    5358:	d9 6d e4             	fldcw  -0x1c(%ebp)
    535b:	db 5d e0             	fistpl -0x20(%ebp)
    535e:	d9 6d e6             	fldcw  -0x1a(%ebp)
    5361:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5364:	83 e8 01             	sub    $0x1,%eax
    5367:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    536a:	8b 45 08             	mov    0x8(%ebp),%eax
    536d:	89 04 24             	mov    %eax,(%esp)
    5370:	e8 ca fc ff ff       	call   503f <sstell>
    5375:	83 e0 07             	and    $0x7,%eax
    5378:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    537b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    537f:	74 17                	je     5398 <seek_sync+0x68>
		getbits(bs, (int)(ALIGNING-aligning));
    5381:	b8 08 00 00 00       	mov    $0x8,%eax
    5386:	2b 45 ec             	sub    -0x14(%ebp),%eax
    5389:	89 44 24 04          	mov    %eax,0x4(%esp)
    538d:	8b 45 08             	mov    0x8(%ebp),%eax
    5390:	89 04 24             	mov    %eax,(%esp)
    5393:	e8 30 fe ff ff       	call   51c8 <getbits>

	val = getbits(bs, N);
    5398:	8b 45 10             	mov    0x10(%ebp),%eax
    539b:	89 44 24 04          	mov    %eax,0x4(%esp)
    539f:	8b 45 08             	mov    0x8(%ebp),%eax
    53a2:	89 04 24             	mov    %eax,(%esp)
    53a5:	e8 1e fe ff ff       	call   51c8 <getbits>
    53aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    53ad:	eb 1a                	jmp    53c9 <seek_sync+0x99>
		val <<= ALIGNING;
    53af:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    53b3:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    53ba:	00 
    53bb:	8b 45 08             	mov    0x8(%ebp),%eax
    53be:	89 04 24             	mov    %eax,(%esp)
    53c1:	e8 02 fe ff ff       	call   51c8 <getbits>
    53c6:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    53c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    53cc:	23 45 f4             	and    -0xc(%ebp),%eax
    53cf:	3b 45 0c             	cmp    0xc(%ebp),%eax
    53d2:	74 0f                	je     53e3 <seek_sync+0xb3>
    53d4:	8b 45 08             	mov    0x8(%ebp),%eax
    53d7:	89 04 24             	mov    %eax,(%esp)
    53da:	e8 55 fc ff ff       	call   5034 <end_bs>
    53df:	85 c0                	test   %eax,%eax
    53e1:	74 cc                	je     53af <seek_sync+0x7f>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    53e3:	8b 45 08             	mov    0x8(%ebp),%eax
    53e6:	89 04 24             	mov    %eax,(%esp)
    53e9:	e8 46 fc ff ff       	call   5034 <end_bs>
    53ee:	85 c0                	test   %eax,%eax
    53f0:	74 07                	je     53f9 <seek_sync+0xc9>
		return(0);
    53f2:	b8 00 00 00 00       	mov    $0x0,%eax
    53f7:	eb 05                	jmp    53fe <seek_sync+0xce>
	else
		return(1);
    53f9:	b8 01 00 00 00       	mov    $0x1,%eax
}
    53fe:	c9                   	leave  
    53ff:	c3                   	ret    

00005400 <js_bound>:

int js_bound(int lay, int m_ext)
{
    5400:	55                   	push   %ebp
    5401:	89 e5                	mov    %esp,%ebp
    5403:	83 ec 18             	sub    $0x18,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    5406:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    540a:	7e 12                	jle    541e <js_bound+0x1e>
    540c:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    5410:	7f 0c                	jg     541e <js_bound+0x1e>
    5412:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    5416:	78 06                	js     541e <js_bound+0x1e>
    5418:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    541c:	7e 27                	jle    5445 <js_bound+0x45>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    541e:	8b 45 0c             	mov    0xc(%ebp),%eax
    5421:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5425:	8b 45 08             	mov    0x8(%ebp),%eax
    5428:	89 44 24 08          	mov    %eax,0x8(%esp)
    542c:	c7 44 24 04 a8 b1 00 	movl   $0xb1a8,0x4(%esp)
    5433:	00 
    5434:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    543b:	e8 22 ef ff ff       	call   4362 <printf>
        exit();
    5440:	e8 35 ed ff ff       	call   417a <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    5445:	8b 45 08             	mov    0x8(%ebp),%eax
    5448:	83 e8 01             	sub    $0x1,%eax
    544b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    5452:	8b 45 0c             	mov    0xc(%ebp),%eax
    5455:	01 d0                	add    %edx,%eax
    5457:	8b 04 85 00 ef 00 00 	mov    0xef00(,%eax,4),%eax
}
    545e:	c9                   	leave  
    545f:	c3                   	ret    

00005460 <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    5460:	55                   	push   %ebp
    5461:	89 e5                	mov    %esp,%ebp
    5463:	83 ec 28             	sub    $0x28,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    5466:	8b 45 08             	mov    0x8(%ebp),%eax
    5469:	8b 00                	mov    (%eax),%eax
    546b:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    546e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5471:	8b 50 1c             	mov    0x1c(%eax),%edx
    5474:	8b 45 08             	mov    0x8(%ebp),%eax
    5477:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    547a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    547d:	8b 40 1c             	mov    0x1c(%eax),%eax
    5480:	83 f8 03             	cmp    $0x3,%eax
    5483:	75 07                	jne    548c <hdr_to_frps+0x2c>
    5485:	b8 01 00 00 00       	mov    $0x1,%eax
    548a:	eb 05                	jmp    5491 <hdr_to_frps+0x31>
    548c:	b8 02 00 00 00       	mov    $0x2,%eax
    5491:	8b 55 08             	mov    0x8(%ebp),%edx
    5494:	89 42 08             	mov    %eax,0x8(%edx)
	fr_ps->sblimit = SBLIMIT;
    5497:	8b 45 08             	mov    0x8(%ebp),%eax
    549a:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    54a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54a4:	8b 40 1c             	mov    0x1c(%eax),%eax
    54a7:	83 f8 01             	cmp    $0x1,%eax
    54aa:	75 20                	jne    54cc <hdr_to_frps+0x6c>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    54ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54af:	8b 50 20             	mov    0x20(%eax),%edx
    54b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54b5:	8b 40 04             	mov    0x4(%eax),%eax
    54b8:	89 54 24 04          	mov    %edx,0x4(%esp)
    54bc:	89 04 24             	mov    %eax,(%esp)
    54bf:	e8 3c ff ff ff       	call   5400 <js_bound>
    54c4:	8b 55 08             	mov    0x8(%ebp),%edx
    54c7:	89 42 0c             	mov    %eax,0xc(%edx)
    54ca:	eb 0c                	jmp    54d8 <hdr_to_frps+0x78>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    54cc:	8b 45 08             	mov    0x8(%ebp),%eax
    54cf:	8b 50 10             	mov    0x10(%eax),%edx
    54d2:	8b 45 08             	mov    0x8(%ebp),%eax
    54d5:	89 50 0c             	mov    %edx,0xc(%eax)
}
    54d8:	c9                   	leave  
    54d9:	c3                   	ret    

000054da <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    54da:	55                   	push   %ebp
    54db:	89 e5                	mov    %esp,%ebp
    54dd:	83 ec 18             	sub    $0x18,%esp
	if (N != 8) {
    54e0:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    54e4:	74 19                	je     54ff <hputbuf+0x25>
		printf(0,"Not Supported yet!!\n");
    54e6:	c7 44 24 04 cb b1 00 	movl   $0xb1cb,0x4(%esp)
    54ed:	00 
    54ee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    54f5:	e8 68 ee ff ff       	call   4362 <printf>
		exit();
    54fa:	e8 7b ec ff ff       	call   417a <exit>
	}
	getCoreBuf(1, val);
    54ff:	8b 45 08             	mov    0x8(%ebp),%eax
    5502:	89 44 24 04          	mov    %eax,0x4(%esp)
    5506:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    550d:	e8 68 ed ff ff       	call   427a <getCoreBuf>
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    5512:	c9                   	leave  
    5513:	c3                   	ret    

00005514 <hsstell>:

unsigned long hsstell()
{
    5514:	55                   	push   %ebp
    5515:	89 e5                	mov    %esp,%ebp
    5517:	83 ec 18             	sub    $0x18,%esp
	return getCoreBuf(2, 0);
    551a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    5521:	00 
    5522:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    5529:	e8 4c ed ff ff       	call   427a <getCoreBuf>
//	return(totbit);
}
    552e:	c9                   	leave  
    552f:	c3                   	ret    

00005530 <hgetbits>:

unsigned long hgetbits(int N)
{
    5530:	55                   	push   %ebp
    5531:	89 e5                	mov    %esp,%ebp
    5533:	83 ec 18             	sub    $0x18,%esp

	return getCoreBuf(3, N);
    5536:	8b 45 08             	mov    0x8(%ebp),%eax
    5539:	89 44 24 04          	mov    %eax,0x4(%esp)
    553d:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    5544:	e8 31 ed ff ff       	call   427a <getCoreBuf>
}
    5549:	c9                   	leave  
    554a:	c3                   	ret    

0000554b <hget1bit>:


unsigned int hget1bit()
{
    554b:	55                   	push   %ebp
    554c:	89 e5                	mov    %esp,%ebp
    554e:	83 ec 18             	sub    $0x18,%esp
	return(hgetbits(1));
    5551:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    5558:	e8 d3 ff ff ff       	call   5530 <hgetbits>
}
    555d:	c9                   	leave  
    555e:	c3                   	ret    

0000555f <rewindNbits>:


void rewindNbits(int N)
{
    555f:	55                   	push   %ebp
    5560:	89 e5                	mov    %esp,%ebp
    5562:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(4, N);
    5565:	8b 45 08             	mov    0x8(%ebp),%eax
    5568:	89 44 24 04          	mov    %eax,0x4(%esp)
    556c:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    5573:	e8 02 ed ff ff       	call   427a <getCoreBuf>
}
    5578:	c9                   	leave  
    5579:	c3                   	ret    

0000557a <rewindNbytes>:


void rewindNbytes(int N)
{
    557a:	55                   	push   %ebp
    557b:	89 e5                	mov    %esp,%ebp
    557d:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(5, N);
    5580:	8b 45 08             	mov    0x8(%ebp),%eax
    5583:	89 44 24 04          	mov    %eax,0x4(%esp)
    5587:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    558e:	e8 e7 ec ff ff       	call   427a <getCoreBuf>
}
    5593:	c9                   	leave  
    5594:	c3                   	ret    

00005595 <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    5595:	55                   	push   %ebp
    5596:	89 e5                	mov    %esp,%ebp
    5598:	57                   	push   %edi
    5599:	56                   	push   %esi
    559a:	53                   	push   %ebx
    559b:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    55a1:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    55a5:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    55a9:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    55ad:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    55b1:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    55b5:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    55b9:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    55bd:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    55c1:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    55c5:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    55c9:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    55cd:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    55d1:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    55d5:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    55d9:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    55dd:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    55e1:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    55e5:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    55e9:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    55ed:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    55f1:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    55f5:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    55f9:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    55fd:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    5601:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    5605:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    5609:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    560d:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    5611:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    5615:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    5619:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    561d:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    5621:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    5625:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    5629:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    562d:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    5631:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    5635:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    5639:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    563d:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    5641:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    5645:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    5649:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    564d:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    5651:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    5655:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    5659:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    565d:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    5661:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    5665:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    5669:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    566d:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    5671:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    5675:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    5679:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    567d:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    5681:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    5685:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    5689:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    568d:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    5691:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    5695:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    5699:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    569d:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    56a1:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    56a5:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    56a9:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    56ad:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    56b1:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    56b5:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    56b9:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    56bd:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    56c1:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    56c5:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    56c9:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    56cd:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    56d1:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    56d5:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    56d9:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    56dd:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    56e1:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    56e5:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    56e9:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    56f0:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    56f7:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    56fe:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    5705:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    570c:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    5713:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    571a:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    5721:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    5728:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    572f:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    5736:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    573d:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    5744:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    574b:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    5752:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    5759:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    5760:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    5767:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    576e:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    5775:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    577c:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    5783:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    578a:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    5791:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    5798:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    579f:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    57a6:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    57ad:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    57b1:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    57b5:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    57b9:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    57bd:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    57c1:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    57c5:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    57c9:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    57cd:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    57d1:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    57d5:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    57d9:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    57dd:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    57e1:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    57e5:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    57e9:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    57ed:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    57f1:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    57f5:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    57f9:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    57fd:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    5801:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    5805:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    5809:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    580d:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    5811:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    5815:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    5819:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    581d:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    5821:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    5825:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    5829:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    582d:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    5831:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    5835:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    583c:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    5843:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    584a:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    5851:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    5858:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    585f:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    5866:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    586d:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    5874:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    587b:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    5882:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    5889:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    5890:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    5897:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    589e:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    58a5:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    58ac:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    58b3:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    58ba:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    58c1:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    58c8:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    58cf:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    58d6:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    58dd:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    58e4:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    58eb:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    58f2:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    58f9:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    5900:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    5907:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    590e:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    5915:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    591c:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    5923:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    592a:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    5931:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    5938:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    593f:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    5946:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    594d:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    5954:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    595b:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    5962:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    5969:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    5970:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    5977:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    597e:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    5985:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    598c:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    5993:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    599a:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    59a1:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    59a8:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    59af:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    59b6:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    59bd:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    59c4:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    59cb:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    59d2:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    59d9:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    59e0:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    59e7:	8d 95 98 fe ff ff    	lea    -0x168(%ebp),%edx
    59ed:	b8 00 b2 00 00       	mov    $0xb200,%eax
    59f2:	b9 23 00 00 00       	mov    $0x23,%ecx
    59f7:	89 d7                	mov    %edx,%edi
    59f9:	89 c6                	mov    %eax,%esi
    59fb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    59fd:	89 f0                	mov    %esi,%eax
    59ff:	89 fa                	mov    %edi,%edx
    5a01:	0f b7 08             	movzwl (%eax),%ecx
    5a04:	66 89 0a             	mov    %cx,(%edx)
    5a07:	83 c2 02             	add    $0x2,%edx
    5a0a:	83 c0 02             	add    $0x2,%eax

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    5a0d:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    5a13:	ba a0 b2 00 00       	mov    $0xb2a0,%edx
    5a18:	bb 8e 00 00 00       	mov    $0x8e,%ebx
    5a1d:	89 c1                	mov    %eax,%ecx
    5a1f:	83 e1 02             	and    $0x2,%ecx
    5a22:	85 c9                	test   %ecx,%ecx
    5a24:	74 0f                	je     5a35 <read_decoder_table+0x4a0>
    5a26:	0f b7 0a             	movzwl (%edx),%ecx
    5a29:	66 89 08             	mov    %cx,(%eax)
    5a2c:	83 c0 02             	add    $0x2,%eax
    5a2f:	83 c2 02             	add    $0x2,%edx
    5a32:	83 eb 02             	sub    $0x2,%ebx
    5a35:	89 d9                	mov    %ebx,%ecx
    5a37:	c1 e9 02             	shr    $0x2,%ecx
    5a3a:	89 c7                	mov    %eax,%edi
    5a3c:	89 d6                	mov    %edx,%esi
    5a3e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5a40:	89 f2                	mov    %esi,%edx
    5a42:	89 f8                	mov    %edi,%eax
    5a44:	b9 00 00 00 00       	mov    $0x0,%ecx
    5a49:	89 de                	mov    %ebx,%esi
    5a4b:	83 e6 02             	and    $0x2,%esi
    5a4e:	85 f6                	test   %esi,%esi
    5a50:	74 0b                	je     5a5d <read_decoder_table+0x4c8>
    5a52:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    5a56:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    5a5a:	83 c1 02             	add    $0x2,%ecx
    5a5d:	83 e3 01             	and    $0x1,%ebx
    5a60:	85 db                	test   %ebx,%ebx
    5a62:	74 07                	je     5a6b <read_decoder_table+0x4d6>
    5a64:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    5a68:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    5a6b:	8d 95 7c fd ff ff    	lea    -0x284(%ebp),%edx
    5a71:	b8 40 b3 00 00       	mov    $0xb340,%eax
    5a76:	b9 23 00 00 00       	mov    $0x23,%ecx
    5a7b:	89 d7                	mov    %edx,%edi
    5a7d:	89 c6                	mov    %eax,%esi
    5a7f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5a81:	89 f0                	mov    %esi,%eax
    5a83:	89 fa                	mov    %edi,%edx
    5a85:	0f b7 08             	movzwl (%eax),%ecx
    5a88:	66 89 0a             	mov    %cx,(%edx)
    5a8b:	83 c2 02             	add    $0x2,%edx
    5a8e:	83 c0 02             	add    $0x2,%eax

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    5a91:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    5a97:	ba e0 b3 00 00       	mov    $0xb3e0,%edx
    5a9c:	bb fe 00 00 00       	mov    $0xfe,%ebx
    5aa1:	89 c1                	mov    %eax,%ecx
    5aa3:	83 e1 02             	and    $0x2,%ecx
    5aa6:	85 c9                	test   %ecx,%ecx
    5aa8:	74 0f                	je     5ab9 <read_decoder_table+0x524>
    5aaa:	0f b7 0a             	movzwl (%edx),%ecx
    5aad:	66 89 08             	mov    %cx,(%eax)
    5ab0:	83 c0 02             	add    $0x2,%eax
    5ab3:	83 c2 02             	add    $0x2,%edx
    5ab6:	83 eb 02             	sub    $0x2,%ebx
    5ab9:	89 d9                	mov    %ebx,%ecx
    5abb:	c1 e9 02             	shr    $0x2,%ecx
    5abe:	89 c7                	mov    %eax,%edi
    5ac0:	89 d6                	mov    %edx,%esi
    5ac2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5ac4:	89 f2                	mov    %esi,%edx
    5ac6:	89 f8                	mov    %edi,%eax
    5ac8:	b9 00 00 00 00       	mov    $0x0,%ecx
    5acd:	89 de                	mov    %ebx,%esi
    5acf:	83 e6 02             	and    $0x2,%esi
    5ad2:	85 f6                	test   %esi,%esi
    5ad4:	74 0b                	je     5ae1 <read_decoder_table+0x54c>
    5ad6:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    5ada:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    5ade:	83 c1 02             	add    $0x2,%ecx
    5ae1:	83 e3 01             	and    $0x1,%ebx
    5ae4:	85 db                	test   %ebx,%ebx
    5ae6:	74 07                	je     5aef <read_decoder_table+0x55a>
    5ae8:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    5aec:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    5aef:	8d 95 80 fb ff ff    	lea    -0x480(%ebp),%edx
    5af5:	b8 e0 b4 00 00       	mov    $0xb4e0,%eax
    5afa:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    5aff:	89 d7                	mov    %edx,%edi
    5b01:	89 c6                	mov    %eax,%esi
    5b03:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5b05:	89 f0                	mov    %esi,%eax
    5b07:	89 fa                	mov    %edi,%edx
    5b09:	0f b7 08             	movzwl (%eax),%ecx
    5b0c:	66 89 0a             	mov    %cx,(%edx)
    5b0f:	83 c2 02             	add    $0x2,%edx
    5b12:	83 c0 02             	add    $0x2,%eax

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    5b15:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    5b1b:	ba e0 b5 00 00       	mov    $0xb5e0,%edx
    5b20:	bb fe 00 00 00       	mov    $0xfe,%ebx
    5b25:	89 c1                	mov    %eax,%ecx
    5b27:	83 e1 02             	and    $0x2,%ecx
    5b2a:	85 c9                	test   %ecx,%ecx
    5b2c:	74 0f                	je     5b3d <read_decoder_table+0x5a8>
    5b2e:	0f b7 0a             	movzwl (%edx),%ecx
    5b31:	66 89 08             	mov    %cx,(%eax)
    5b34:	83 c0 02             	add    $0x2,%eax
    5b37:	83 c2 02             	add    $0x2,%edx
    5b3a:	83 eb 02             	sub    $0x2,%ebx
    5b3d:	89 d9                	mov    %ebx,%ecx
    5b3f:	c1 e9 02             	shr    $0x2,%ecx
    5b42:	89 c7                	mov    %eax,%edi
    5b44:	89 d6                	mov    %edx,%esi
    5b46:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5b48:	89 f2                	mov    %esi,%edx
    5b4a:	89 f8                	mov    %edi,%eax
    5b4c:	b9 00 00 00 00       	mov    $0x0,%ecx
    5b51:	89 de                	mov    %ebx,%esi
    5b53:	83 e6 02             	and    $0x2,%esi
    5b56:	85 f6                	test   %esi,%esi
    5b58:	74 0b                	je     5b65 <read_decoder_table+0x5d0>
    5b5a:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    5b5e:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    5b62:	83 c1 02             	add    $0x2,%ecx
    5b65:	83 e3 01             	and    $0x1,%ebx
    5b68:	85 db                	test   %ebx,%ebx
    5b6a:	74 07                	je     5b73 <read_decoder_table+0x5de>
    5b6c:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    5b70:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    5b73:	8d 95 84 f6 ff ff    	lea    -0x97c(%ebp),%edx
    5b79:	b8 e0 b6 00 00       	mov    $0xb6e0,%eax
    5b7e:	b9 ff 00 00 00       	mov    $0xff,%ecx
    5b83:	89 d7                	mov    %edx,%edi
    5b85:	89 c6                	mov    %eax,%esi
    5b87:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5b89:	89 f0                	mov    %esi,%eax
    5b8b:	89 fa                	mov    %edi,%edx
    5b8d:	0f b7 08             	movzwl (%eax),%ecx
    5b90:	66 89 0a             	mov    %cx,(%edx)
    5b93:	83 c2 02             	add    $0x2,%edx
    5b96:	83 c0 02             	add    $0x2,%eax

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    5b99:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    5b9f:	ba e0 ba 00 00       	mov    $0xbae0,%edx
    5ba4:	bb fe 03 00 00       	mov    $0x3fe,%ebx
    5ba9:	89 c1                	mov    %eax,%ecx
    5bab:	83 e1 02             	and    $0x2,%ecx
    5bae:	85 c9                	test   %ecx,%ecx
    5bb0:	74 0f                	je     5bc1 <read_decoder_table+0x62c>
    5bb2:	0f b7 0a             	movzwl (%edx),%ecx
    5bb5:	66 89 08             	mov    %cx,(%eax)
    5bb8:	83 c0 02             	add    $0x2,%eax
    5bbb:	83 c2 02             	add    $0x2,%edx
    5bbe:	83 eb 02             	sub    $0x2,%ebx
    5bc1:	89 d9                	mov    %ebx,%ecx
    5bc3:	c1 e9 02             	shr    $0x2,%ecx
    5bc6:	89 c7                	mov    %eax,%edi
    5bc8:	89 d6                	mov    %edx,%esi
    5bca:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5bcc:	89 f2                	mov    %esi,%edx
    5bce:	89 f8                	mov    %edi,%eax
    5bd0:	b9 00 00 00 00       	mov    $0x0,%ecx
    5bd5:	89 de                	mov    %ebx,%esi
    5bd7:	83 e6 02             	and    $0x2,%esi
    5bda:	85 f6                	test   %esi,%esi
    5bdc:	74 0b                	je     5be9 <read_decoder_table+0x654>
    5bde:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    5be2:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    5be6:	83 c1 02             	add    $0x2,%ecx
    5be9:	83 e3 01             	and    $0x1,%ebx
    5bec:	85 db                	test   %ebx,%ebx
    5bee:	74 07                	je     5bf7 <read_decoder_table+0x662>
    5bf0:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    5bf4:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    5bf7:	8d 95 88 ee ff ff    	lea    -0x1178(%ebp),%edx
    5bfd:	b8 e0 be 00 00       	mov    $0xbee0,%eax
    5c02:	b9 ff 00 00 00       	mov    $0xff,%ecx
    5c07:	89 d7                	mov    %edx,%edi
    5c09:	89 c6                	mov    %eax,%esi
    5c0b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5c0d:	89 f0                	mov    %esi,%eax
    5c0f:	89 fa                	mov    %edi,%edx
    5c11:	0f b7 08             	movzwl (%eax),%ecx
    5c14:	66 89 0a             	mov    %cx,(%edx)
    5c17:	83 c2 02             	add    $0x2,%edx
    5c1a:	83 c0 02             	add    $0x2,%eax

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    5c1d:	8d 95 88 ea ff ff    	lea    -0x1578(%ebp),%edx
    5c23:	bb e0 c2 00 00       	mov    $0xc2e0,%ebx
    5c28:	b8 00 01 00 00       	mov    $0x100,%eax
    5c2d:	89 d7                	mov    %edx,%edi
    5c2f:	89 de                	mov    %ebx,%esi
    5c31:	89 c1                	mov    %eax,%ecx
    5c33:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    5c35:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    5c3c:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    5c43:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    5c4a:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    5c51:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    5c58:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    5c5f:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    5c66:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    5c6d:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    5c74:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    5c7b:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    5c82:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    5c89:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    5c90:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    5c97:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    5c9e:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    5ca5:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    5cac:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    5cb3:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    5cba:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    5cc1:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    5cc8:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    5ccf:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    5cd6:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    5cdd:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    5ce4:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    5ceb:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    5cf2:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    5cf9:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    5d00:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    5d07:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    5d0e:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    5d15:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    5d1c:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    5d23:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    5d2a:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    5d31:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    5d38:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    5d3f:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    5d46:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    5d4d:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    5d54:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    5d5b:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    5d62:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    5d69:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    5d70:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    5d77:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    5d7e:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    5d85:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    5d8c:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    5d93:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    5d9a:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    5da1:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    5da8:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    5daf:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    5db6:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    5dbd:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    5dc4:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    5dcb:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    5dd2:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    5dd9:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    5de0:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    5de7:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    5dee:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    5df5:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    5dfc:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    5e03:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    5e0a:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    5e11:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    5e18:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    5e1f:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    5e26:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    5e2d:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    5e34:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    5e3b:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    5e42:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    5e49:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    5e50:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    5e57:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    5e5e:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    5e65:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    5e6c:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    5e73:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    5e7a:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    5e81:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    5e88:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    5e8f:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    5e96:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    5e9d:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    5ea4:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    5eab:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    5eb2:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    5eb9:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    5ec0:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    5ec7:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    5ece:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    5ed5:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    5edc:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    5ee3:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    5eea:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    5ef1:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    5ef8:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    5eff:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    5f06:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    5f0d:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    5f14:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    5f1b:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    5f22:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    5f29:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    5f30:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    5f37:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    5f3e:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    5f45:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    5f4c:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    5f53:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    5f5a:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    5f61:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    5f68:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    5f6f:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    5f76:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    5f7d:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    5f84:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    5f8b:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    5f92:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    5f99:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    5fa0:	30 00 
    5fa2:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    5fa9:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    5fb0:	00 00 00 
    5fb3:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    5fba:	00 00 00 
    5fbd:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    5fc4:	00 00 00 
    5fc7:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    5fce:	00 00 00 
    5fd1:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    5fd8:	ff ff ff 
    5fdb:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    5fe2:	00 00 00 
    5fe5:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    5fec:	00 00 00 
    5fef:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    5ff6:	00 00 00 
    5ff9:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    6000:	00 00 00 
    6003:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    600a:	31 00 
    600c:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    6013:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    601a:	00 00 00 
    601d:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    6024:	00 00 00 
    6027:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    602e:	00 00 00 
    6031:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    6038:	00 00 00 
    603b:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    6042:	ff ff ff 
    6045:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    604c:	00 00 00 
    604f:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    6056:	00 00 00 
    6059:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    605c:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    6062:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    6069:	00 00 00 
    606c:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    6073:	32 00 
    6075:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    607c:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    6083:	00 00 00 
    6086:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    608d:	00 00 00 
    6090:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    6097:	00 00 00 
    609a:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    60a1:	00 00 00 
    60a4:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    60ab:	ff ff ff 
    60ae:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    60b5:	00 00 00 
    60b8:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    60bf:	00 00 00 
    60c2:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    60c5:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    60cb:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    60d2:	00 00 00 
    60d5:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    60dc:	33 00 
    60de:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    60e5:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    60ec:	00 00 00 
    60ef:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    60f6:	00 00 00 
    60f9:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    6100:	00 00 00 
    6103:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    610a:	00 00 00 
    610d:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    6114:	ff ff ff 
    6117:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    611e:	00 00 00 
    6121:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    6128:	00 00 00 
    612b:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    612e:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    6134:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    613b:	00 00 00 
    613e:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    6145:	34 00 
    6147:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    614e:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    6155:	00 00 00 
    6158:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    615f:	00 00 00 
    6162:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    6169:	00 00 00 
    616c:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    6173:	00 00 00 
    6176:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    617d:	ff ff ff 
    6180:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    6187:	00 00 00 
    618a:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    6191:	00 00 00 
    6194:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    619b:	00 00 00 
    619e:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    61a5:	00 00 00 
    61a8:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    61af:	35 00 
    61b1:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    61b8:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    61bf:	00 00 00 
    61c2:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    61c9:	00 00 00 
    61cc:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    61d3:	00 00 00 
    61d6:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    61dd:	00 00 00 
    61e0:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    61e7:	ff ff ff 
    61ea:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    61f1:	00 00 00 
    61f4:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    61fb:	00 00 00 
    61fe:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    6204:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    620a:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    6211:	00 00 00 
    6214:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    621b:	36 00 
    621d:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    6224:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    622b:	00 00 00 
    622e:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    6235:	00 00 00 
    6238:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    623f:	00 00 00 
    6242:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    6249:	00 00 00 
    624c:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    6253:	ff ff ff 
    6256:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    625d:	00 00 00 
    6260:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    6267:	00 00 00 
    626a:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    6270:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    6276:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    627d:	00 00 00 
    6280:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    6287:	37 00 
    6289:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    6290:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    6297:	00 00 00 
    629a:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    62a1:	00 00 00 
    62a4:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    62ab:	00 00 00 
    62ae:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    62b5:	00 00 00 
    62b8:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    62bf:	ff ff ff 
    62c2:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    62c9:	00 00 00 
    62cc:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    62d3:	00 00 00 
    62d6:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    62dc:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    62e2:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    62e9:	00 00 00 
    62ec:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    62f3:	38 00 
    62f5:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    62fc:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    6303:	00 00 00 
    6306:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    630d:	00 00 00 
    6310:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    6317:	00 00 00 
    631a:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    6321:	00 00 00 
    6324:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    632b:	ff ff ff 
    632e:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    6335:	00 00 00 
    6338:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    633f:	00 00 00 
    6342:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    6348:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    634e:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    6355:	00 00 00 
    6358:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    635f:	39 00 
    6361:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    6368:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    636f:	00 00 00 
    6372:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    6379:	00 00 00 
    637c:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    6383:	00 00 00 
    6386:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    638d:	00 00 00 
    6390:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    6397:	ff ff ff 
    639a:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    63a1:	00 00 00 
    63a4:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    63ab:	00 00 00 
    63ae:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    63b4:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    63ba:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    63c1:	00 00 00 
    63c4:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    63cb:	31 30 
    63cd:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    63d4:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    63db:	00 00 00 
    63de:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    63e5:	00 00 00 
    63e8:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    63ef:	00 00 00 
    63f2:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    63f9:	00 00 00 
    63fc:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    6403:	ff ff ff 
    6406:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    640d:	00 00 00 
    6410:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    6417:	00 00 00 
    641a:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    6420:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    6426:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    642d:	00 00 00 
    6430:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    6437:	31 31 
    6439:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    6440:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    6447:	00 00 00 
    644a:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    6451:	00 00 00 
    6454:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    645b:	00 00 00 
    645e:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    6465:	00 00 00 
    6468:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    646f:	ff ff ff 
    6472:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    6479:	00 00 00 
    647c:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    6483:	00 00 00 
    6486:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    648c:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    6492:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    6499:	00 00 00 
    649c:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    64a3:	31 32 
    64a5:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    64ac:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    64b3:	00 00 00 
    64b6:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    64bd:	00 00 00 
    64c0:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    64c7:	00 00 00 
    64ca:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    64d1:	00 00 00 
    64d4:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    64db:	ff ff ff 
    64de:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    64e5:	00 00 00 
    64e8:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    64ef:	00 00 00 
    64f2:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    64f8:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    64fe:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    6505:	00 00 00 
    6508:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    650f:	31 33 
    6511:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    6518:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    651f:	00 00 00 
    6522:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    6529:	00 00 00 
    652c:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    6533:	00 00 00 
    6536:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    653d:	00 00 00 
    6540:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    6547:	ff ff ff 
    654a:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    6551:	00 00 00 
    6554:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    655b:	00 00 00 
    655e:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    6564:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    656a:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    6571:	01 00 00 
    6574:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    657b:	31 34 
    657d:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    6584:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    658b:	00 00 00 
    658e:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    6595:	00 00 00 
    6598:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    659f:	00 00 00 
    65a2:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    65a9:	00 00 00 
    65ac:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    65b3:	ff ff ff 
    65b6:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    65bd:	00 00 00 
    65c0:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    65c7:	00 00 00 
    65ca:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    65d1:	00 00 00 
    65d4:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    65db:	00 00 00 
    65de:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    65e5:	31 35 
    65e7:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    65ee:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    65f5:	00 00 00 
    65f8:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    65ff:	00 00 00 
    6602:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    6609:	00 00 00 
    660c:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    6613:	00 00 00 
    6616:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    661d:	ff ff ff 
    6620:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    6627:	00 00 00 
    662a:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    6631:	00 00 00 
    6634:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    663a:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    6640:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    6647:	01 00 00 
    664a:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    6651:	31 36 
    6653:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    665a:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    6661:	00 00 00 
    6664:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    666b:	00 00 00 
    666e:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    6675:	00 00 00 
    6678:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    667f:	00 00 00 
    6682:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    6689:	ff ff ff 
    668c:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    6693:	00 00 00 
    6696:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    669d:	00 00 00 
    66a0:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    66a6:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    66ac:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    66b3:	01 00 00 
    66b6:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    66bd:	31 37 
    66bf:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    66c6:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    66cd:	00 00 00 
    66d0:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    66d7:	00 00 00 
    66da:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    66e1:	00 00 00 
    66e4:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    66eb:	00 00 00 
    66ee:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    66f5:	00 00 00 
    66f8:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    66ff:	00 00 00 
    6702:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    6709:	00 00 00 
    670c:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6712:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    6718:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    671f:	01 00 00 
    6722:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    6729:	31 38 
    672b:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    6732:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    6739:	00 00 00 
    673c:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    6743:	00 00 00 
    6746:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    674d:	00 00 00 
    6750:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    6757:	00 00 00 
    675a:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    6761:	00 00 00 
    6764:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    676b:	00 00 00 
    676e:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    6775:	00 00 00 
    6778:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    677e:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    6784:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    678b:	01 00 00 
    678e:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    6795:	31 39 
    6797:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    679e:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    67a5:	00 00 00 
    67a8:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    67af:	00 00 00 
    67b2:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    67b9:	00 00 00 
    67bc:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    67c3:	00 00 00 
    67c6:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    67cd:	00 00 00 
    67d0:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    67d7:	00 00 00 
    67da:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    67e1:	00 00 00 
    67e4:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    67ea:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    67f0:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    67f7:	01 00 00 
    67fa:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    6801:	32 30 
    6803:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    680a:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    6811:	00 00 00 
    6814:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    681b:	00 00 00 
    681e:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    6825:	00 00 00 
    6828:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    682f:	00 00 00 
    6832:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    6839:	00 00 00 
    683c:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    6843:	00 00 00 
    6846:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    684d:	00 00 00 
    6850:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6856:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    685c:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    6863:	01 00 00 
    6866:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    686d:	32 31 
    686f:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    6876:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    687d:	00 00 00 
    6880:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    6887:	00 00 00 
    688a:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    6891:	00 00 00 
    6894:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    689b:	00 00 00 
    689e:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    68a5:	00 00 00 
    68a8:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    68af:	00 00 00 
    68b2:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    68b9:	00 00 00 
    68bc:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    68c2:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    68c8:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    68cf:	01 00 00 
    68d2:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    68d9:	32 32 
    68db:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    68e2:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    68e9:	00 00 00 
    68ec:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    68f3:	00 00 00 
    68f6:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    68fd:	00 00 00 
    6900:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    6907:	03 00 00 
    690a:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    6911:	00 00 00 
    6914:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    691b:	00 00 00 
    691e:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    6925:	00 00 00 
    6928:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    692e:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    6934:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    693b:	01 00 00 
    693e:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    6945:	32 33 
    6947:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    694e:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    6955:	00 00 00 
    6958:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    695f:	00 00 00 
    6962:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    6969:	00 00 00 
    696c:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    6973:	1f 00 00 
    6976:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    697d:	00 00 00 
    6980:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    6987:	00 00 00 
    698a:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    6991:	00 00 00 
    6994:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    699a:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    69a0:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    69a7:	01 00 00 
    69aa:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    69b1:	32 34 
    69b3:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    69ba:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    69c1:	00 00 00 
    69c4:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    69cb:	00 00 00 
    69ce:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    69d5:	00 00 00 
    69d8:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    69df:	00 00 00 
    69e2:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    69e9:	ff ff ff 
    69ec:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    69f3:	00 00 00 
    69f6:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    69fd:	00 00 00 
    6a00:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6a06:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    6a0c:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    6a13:	02 00 00 
    6a16:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    6a1d:	32 35 
    6a1f:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    6a26:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    6a2d:	00 00 00 
    6a30:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    6a37:	00 00 00 
    6a3a:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    6a41:	00 00 00 
    6a44:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    6a4b:	00 00 00 
    6a4e:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    6a55:	00 00 00 
    6a58:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    6a5f:	00 00 00 
    6a62:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    6a69:	00 00 00 
    6a6c:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6a72:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    6a78:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    6a7f:	02 00 00 
    6a82:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    6a89:	32 36 
    6a8b:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    6a92:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    6a99:	00 00 00 
    6a9c:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    6aa3:	00 00 00 
    6aa6:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    6aad:	00 00 00 
    6ab0:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    6ab7:	00 00 00 
    6aba:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    6ac1:	00 00 00 
    6ac4:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    6acb:	00 00 00 
    6ace:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    6ad5:	00 00 00 
    6ad8:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6ade:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    6ae4:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    6aeb:	02 00 00 
    6aee:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    6af5:	32 37 
    6af7:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    6afe:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    6b05:	00 00 00 
    6b08:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    6b0f:	00 00 00 
    6b12:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    6b19:	00 00 00 
    6b1c:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    6b23:	00 00 00 
    6b26:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    6b2d:	00 00 00 
    6b30:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    6b37:	00 00 00 
    6b3a:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    6b41:	00 00 00 
    6b44:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6b4a:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    6b50:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    6b57:	02 00 00 
    6b5a:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    6b61:	32 38 
    6b63:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    6b6a:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    6b71:	00 00 00 
    6b74:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    6b7b:	00 00 00 
    6b7e:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    6b85:	00 00 00 
    6b88:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    6b8f:	00 00 00 
    6b92:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    6b99:	00 00 00 
    6b9c:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    6ba3:	00 00 00 
    6ba6:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    6bad:	00 00 00 
    6bb0:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6bb6:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    6bbc:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    6bc3:	02 00 00 
    6bc6:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    6bcd:	32 39 
    6bcf:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    6bd6:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    6bdd:	00 00 00 
    6be0:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    6be7:	00 00 00 
    6bea:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    6bf1:	00 00 00 
    6bf4:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    6bfb:	01 00 00 
    6bfe:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    6c05:	00 00 00 
    6c08:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    6c0f:	00 00 00 
    6c12:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    6c19:	00 00 00 
    6c1c:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6c22:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    6c28:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    6c2f:	02 00 00 
    6c32:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    6c39:	33 30 
    6c3b:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    6c42:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    6c49:	00 00 00 
    6c4c:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    6c53:	00 00 00 
    6c56:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    6c5d:	00 00 00 
    6c60:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    6c67:	07 00 00 
    6c6a:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    6c71:	00 00 00 
    6c74:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    6c7b:	00 00 00 
    6c7e:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    6c85:	00 00 00 
    6c88:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6c8e:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    6c94:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    6c9b:	02 00 00 
    6c9e:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    6ca5:	33 31 
    6ca7:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    6cae:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    6cb5:	00 00 00 
    6cb8:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    6cbf:	00 00 00 
    6cc2:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    6cc9:	00 00 00 
    6ccc:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    6cd3:	1f 00 00 
    6cd6:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    6cdd:	00 00 00 
    6ce0:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    6ce7:	00 00 00 
    6cea:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    6cf1:	00 00 00 
    6cf4:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6cfa:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    6d00:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    6d07:	02 00 00 
    6d0a:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    6d11:	33 32 
    6d13:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    6d1a:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    6d21:	00 00 00 
    6d24:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    6d2b:	00 00 00 
    6d2e:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    6d35:	00 00 00 
    6d38:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    6d3f:	00 00 00 
    6d42:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    6d49:	ff ff ff 
    6d4c:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    6d53:	00 00 00 
    6d56:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    6d5d:	00 00 00 
    6d60:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    6d66:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    6d6c:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    6d73:	00 00 00 
    6d76:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    6d7d:	33 33 
    6d7f:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    6d86:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    6d8d:	00 00 00 
    6d90:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    6d97:	00 00 00 
    6d9a:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    6da1:	00 00 00 
    6da4:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    6dab:	00 00 00 
    6dae:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    6db5:	ff ff ff 
    6db8:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    6dbf:	00 00 00 
    6dc2:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    6dc9:	00 00 00 
    6dcc:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    6dd2:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    6dd8:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    6ddf:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    6de2:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    6de8:	5b                   	pop    %ebx
    6de9:	5e                   	pop    %esi
    6dea:	5f                   	pop    %edi
    6deb:	5d                   	pop    %ebp
    6dec:	c3                   	ret    

00006ded <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    6ded:	55                   	push   %ebp
    6dee:	89 e5                	mov    %esp,%ebp
    6df0:	53                   	push   %ebx
    6df1:	83 ec 24             	sub    $0x24,%esp
  HUFFBITS level;
  int point = 0;
    6df4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    6dfb:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    6e02:	a1 30 ef 00 00       	mov    0xef30,%eax
    6e07:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    6e0a:	8b 45 08             	mov    0x8(%ebp),%eax
    6e0d:	8b 40 20             	mov    0x20(%eax),%eax
    6e10:	85 c0                	test   %eax,%eax
    6e12:	75 0a                	jne    6e1e <huffman_decoder+0x31>
    6e14:	b8 02 00 00 00       	mov    $0x2,%eax
    6e19:	e9 0d 03 00 00       	jmp    712b <huffman_decoder+0x33e>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    6e1e:	8b 45 08             	mov    0x8(%ebp),%eax
    6e21:	8b 40 24             	mov    0x24(%eax),%eax
    6e24:	85 c0                	test   %eax,%eax
    6e26:	75 1d                	jne    6e45 <huffman_decoder+0x58>
  {  *x = *y = 0;
    6e28:	8b 45 10             	mov    0x10(%ebp),%eax
    6e2b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    6e31:	8b 45 10             	mov    0x10(%ebp),%eax
    6e34:	8b 10                	mov    (%eax),%edx
    6e36:	8b 45 0c             	mov    0xc(%ebp),%eax
    6e39:	89 10                	mov    %edx,(%eax)
     return 0;
    6e3b:	b8 00 00 00 00       	mov    $0x0,%eax
    6e40:	e9 e6 02 00 00       	jmp    712b <huffman_decoder+0x33e>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    6e45:	8b 45 08             	mov    0x8(%ebp),%eax
    6e48:	8b 40 20             	mov    0x20(%eax),%eax
    6e4b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6e4e:	01 d2                	add    %edx,%edx
    6e50:	01 d0                	add    %edx,%eax
    6e52:	0f b6 00             	movzbl (%eax),%eax
    6e55:	84 c0                	test   %al,%al
    6e57:	75 46                	jne    6e9f <huffman_decoder+0xb2>
      *x = h->val[point][1] >> 4;
    6e59:	8b 45 08             	mov    0x8(%ebp),%eax
    6e5c:	8b 40 20             	mov    0x20(%eax),%eax
    6e5f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6e62:	01 d2                	add    %edx,%edx
    6e64:	01 d0                	add    %edx,%eax
    6e66:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6e6a:	c0 e8 04             	shr    $0x4,%al
    6e6d:	0f b6 d0             	movzbl %al,%edx
    6e70:	8b 45 0c             	mov    0xc(%ebp),%eax
    6e73:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    6e75:	8b 45 08             	mov    0x8(%ebp),%eax
    6e78:	8b 40 20             	mov    0x20(%eax),%eax
    6e7b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6e7e:	01 d2                	add    %edx,%edx
    6e80:	01 d0                	add    %edx,%eax
    6e82:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6e86:	0f b6 c0             	movzbl %al,%eax
    6e89:	83 e0 0f             	and    $0xf,%eax
    6e8c:	89 c2                	mov    %eax,%edx
    6e8e:	8b 45 10             	mov    0x10(%ebp),%eax
    6e91:	89 10                	mov    %edx,(%eax)

      error = 0;
    6e93:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    6e9a:	e9 af 00 00 00       	jmp    6f4e <huffman_decoder+0x161>
    } 
    if (hget1bit()) {
    6e9f:	e8 a7 e6 ff ff       	call   554b <hget1bit>
    6ea4:	85 c0                	test   %eax,%eax
    6ea6:	74 47                	je     6eef <huffman_decoder+0x102>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    6ea8:	eb 17                	jmp    6ec1 <huffman_decoder+0xd4>
    6eaa:	8b 45 08             	mov    0x8(%ebp),%eax
    6ead:	8b 40 20             	mov    0x20(%eax),%eax
    6eb0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6eb3:	01 d2                	add    %edx,%edx
    6eb5:	01 d0                	add    %edx,%eax
    6eb7:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6ebb:	0f b6 c0             	movzbl %al,%eax
    6ebe:	01 45 f0             	add    %eax,-0x10(%ebp)
    6ec1:	8b 45 08             	mov    0x8(%ebp),%eax
    6ec4:	8b 40 20             	mov    0x20(%eax),%eax
    6ec7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6eca:	01 d2                	add    %edx,%edx
    6ecc:	01 d0                	add    %edx,%eax
    6ece:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6ed2:	3c f9                	cmp    $0xf9,%al
    6ed4:	77 d4                	ja     6eaa <huffman_decoder+0xbd>
      point += h->val[point][1];
    6ed6:	8b 45 08             	mov    0x8(%ebp),%eax
    6ed9:	8b 40 20             	mov    0x20(%eax),%eax
    6edc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6edf:	01 d2                	add    %edx,%edx
    6ee1:	01 d0                	add    %edx,%eax
    6ee3:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6ee7:	0f b6 c0             	movzbl %al,%eax
    6eea:	01 45 f0             	add    %eax,-0x10(%ebp)
    6eed:	eb 42                	jmp    6f31 <huffman_decoder+0x144>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    6eef:	eb 16                	jmp    6f07 <huffman_decoder+0x11a>
    6ef1:	8b 45 08             	mov    0x8(%ebp),%eax
    6ef4:	8b 40 20             	mov    0x20(%eax),%eax
    6ef7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6efa:	01 d2                	add    %edx,%edx
    6efc:	01 d0                	add    %edx,%eax
    6efe:	0f b6 00             	movzbl (%eax),%eax
    6f01:	0f b6 c0             	movzbl %al,%eax
    6f04:	01 45 f0             	add    %eax,-0x10(%ebp)
    6f07:	8b 45 08             	mov    0x8(%ebp),%eax
    6f0a:	8b 40 20             	mov    0x20(%eax),%eax
    6f0d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6f10:	01 d2                	add    %edx,%edx
    6f12:	01 d0                	add    %edx,%eax
    6f14:	0f b6 00             	movzbl (%eax),%eax
    6f17:	3c f9                	cmp    $0xf9,%al
    6f19:	77 d6                	ja     6ef1 <huffman_decoder+0x104>
      point += h->val[point][0];
    6f1b:	8b 45 08             	mov    0x8(%ebp),%eax
    6f1e:	8b 40 20             	mov    0x20(%eax),%eax
    6f21:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6f24:	01 d2                	add    %edx,%edx
    6f26:	01 d0                	add    %edx,%eax
    6f28:	0f b6 00             	movzbl (%eax),%eax
    6f2b:	0f b6 c0             	movzbl %al,%eax
    6f2e:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    6f31:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    6f34:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    6f38:	0f 85 07 ff ff ff    	jne    6e45 <huffman_decoder+0x58>
    6f3e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6f41:	a1 c4 22 01 00       	mov    0x122c4,%eax
    6f46:	39 c2                	cmp    %eax,%edx
    6f48:	0f 82 f7 fe ff ff    	jb     6e45 <huffman_decoder+0x58>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    6f4e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    6f52:	74 24                	je     6f78 <huffman_decoder+0x18b>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    6f54:	8b 45 08             	mov    0x8(%ebp),%eax
    6f57:	8b 40 04             	mov    0x4(%eax),%eax
    6f5a:	83 e8 01             	sub    $0x1,%eax
    6f5d:	01 c0                	add    %eax,%eax
    6f5f:	89 c2                	mov    %eax,%edx
    6f61:	8b 45 0c             	mov    0xc(%ebp),%eax
    6f64:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    6f66:	8b 45 08             	mov    0x8(%ebp),%eax
    6f69:	8b 40 08             	mov    0x8(%eax),%eax
    6f6c:	83 e8 01             	sub    $0x1,%eax
    6f6f:	01 c0                	add    %eax,%eax
    6f71:	89 c2                	mov    %eax,%edx
    6f73:	8b 45 10             	mov    0x10(%ebp),%eax
    6f76:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    6f78:	8b 45 08             	mov    0x8(%ebp),%eax
    6f7b:	0f b6 00             	movzbl (%eax),%eax
    6f7e:	3c 33                	cmp    $0x33,%al
    6f80:	0f 85 ec 00 00 00    	jne    7072 <huffman_decoder+0x285>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    6f86:	8b 45 08             	mov    0x8(%ebp),%eax
    6f89:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6f8d:	3c 32                	cmp    $0x32,%al
    6f8f:	74 0f                	je     6fa0 <huffman_decoder+0x1b3>
    6f91:	8b 45 08             	mov    0x8(%ebp),%eax
    6f94:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6f98:	3c 33                	cmp    $0x33,%al
    6f9a:	0f 85 d2 00 00 00    	jne    7072 <huffman_decoder+0x285>
     *v = (*y>>3) & 1;
    6fa0:	8b 45 10             	mov    0x10(%ebp),%eax
    6fa3:	8b 00                	mov    (%eax),%eax
    6fa5:	c1 f8 03             	sar    $0x3,%eax
    6fa8:	83 e0 01             	and    $0x1,%eax
    6fab:	89 c2                	mov    %eax,%edx
    6fad:	8b 45 14             	mov    0x14(%ebp),%eax
    6fb0:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    6fb2:	8b 45 10             	mov    0x10(%ebp),%eax
    6fb5:	8b 00                	mov    (%eax),%eax
    6fb7:	c1 f8 02             	sar    $0x2,%eax
    6fba:	83 e0 01             	and    $0x1,%eax
    6fbd:	89 c2                	mov    %eax,%edx
    6fbf:	8b 45 18             	mov    0x18(%ebp),%eax
    6fc2:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    6fc4:	8b 45 10             	mov    0x10(%ebp),%eax
    6fc7:	8b 00                	mov    (%eax),%eax
    6fc9:	d1 f8                	sar    %eax
    6fcb:	83 e0 01             	and    $0x1,%eax
    6fce:	89 c2                	mov    %eax,%edx
    6fd0:	8b 45 0c             	mov    0xc(%ebp),%eax
    6fd3:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    6fd5:	8b 45 10             	mov    0x10(%ebp),%eax
    6fd8:	8b 00                	mov    (%eax),%eax
    6fda:	83 e0 01             	and    $0x1,%eax
    6fdd:	89 c2                	mov    %eax,%edx
    6fdf:	8b 45 10             	mov    0x10(%ebp),%eax
    6fe2:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    6fe4:	8b 45 14             	mov    0x14(%ebp),%eax
    6fe7:	8b 00                	mov    (%eax),%eax
    6fe9:	85 c0                	test   %eax,%eax
    6feb:	74 18                	je     7005 <huffman_decoder+0x218>
        if (hget1bit() == 1) *v = -*v;
    6fed:	e8 59 e5 ff ff       	call   554b <hget1bit>
    6ff2:	83 f8 01             	cmp    $0x1,%eax
    6ff5:	75 0e                	jne    7005 <huffman_decoder+0x218>
    6ff7:	8b 45 14             	mov    0x14(%ebp),%eax
    6ffa:	8b 00                	mov    (%eax),%eax
    6ffc:	f7 d8                	neg    %eax
    6ffe:	89 c2                	mov    %eax,%edx
    7000:	8b 45 14             	mov    0x14(%ebp),%eax
    7003:	89 10                	mov    %edx,(%eax)
     if (*w)
    7005:	8b 45 18             	mov    0x18(%ebp),%eax
    7008:	8b 00                	mov    (%eax),%eax
    700a:	85 c0                	test   %eax,%eax
    700c:	74 18                	je     7026 <huffman_decoder+0x239>
        if (hget1bit() == 1) *w = -*w;
    700e:	e8 38 e5 ff ff       	call   554b <hget1bit>
    7013:	83 f8 01             	cmp    $0x1,%eax
    7016:	75 0e                	jne    7026 <huffman_decoder+0x239>
    7018:	8b 45 18             	mov    0x18(%ebp),%eax
    701b:	8b 00                	mov    (%eax),%eax
    701d:	f7 d8                	neg    %eax
    701f:	89 c2                	mov    %eax,%edx
    7021:	8b 45 18             	mov    0x18(%ebp),%eax
    7024:	89 10                	mov    %edx,(%eax)
     if (*x)
    7026:	8b 45 0c             	mov    0xc(%ebp),%eax
    7029:	8b 00                	mov    (%eax),%eax
    702b:	85 c0                	test   %eax,%eax
    702d:	74 18                	je     7047 <huffman_decoder+0x25a>
        if (hget1bit() == 1) *x = -*x;
    702f:	e8 17 e5 ff ff       	call   554b <hget1bit>
    7034:	83 f8 01             	cmp    $0x1,%eax
    7037:	75 0e                	jne    7047 <huffman_decoder+0x25a>
    7039:	8b 45 0c             	mov    0xc(%ebp),%eax
    703c:	8b 00                	mov    (%eax),%eax
    703e:	f7 d8                	neg    %eax
    7040:	89 c2                	mov    %eax,%edx
    7042:	8b 45 0c             	mov    0xc(%ebp),%eax
    7045:	89 10                	mov    %edx,(%eax)
     if (*y)
    7047:	8b 45 10             	mov    0x10(%ebp),%eax
    704a:	8b 00                	mov    (%eax),%eax
    704c:	85 c0                	test   %eax,%eax
    704e:	74 1d                	je     706d <huffman_decoder+0x280>
        if (hget1bit() == 1) *y = -*y;
    7050:	e8 f6 e4 ff ff       	call   554b <hget1bit>
    7055:	83 f8 01             	cmp    $0x1,%eax
    7058:	75 13                	jne    706d <huffman_decoder+0x280>
    705a:	8b 45 10             	mov    0x10(%ebp),%eax
    705d:	8b 00                	mov    (%eax),%eax
    705f:	f7 d8                	neg    %eax
    7061:	89 c2                	mov    %eax,%edx
    7063:	8b 45 10             	mov    0x10(%ebp),%eax
    7066:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    7068:	e9 bb 00 00 00       	jmp    7128 <huffman_decoder+0x33b>
    706d:	e9 b6 00 00 00       	jmp    7128 <huffman_decoder+0x33b>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    7072:	8b 45 08             	mov    0x8(%ebp),%eax
    7075:	8b 40 0c             	mov    0xc(%eax),%eax
    7078:	85 c0                	test   %eax,%eax
    707a:	74 30                	je     70ac <huffman_decoder+0x2bf>
       if ((h->xlen-1) == *x) 
    707c:	8b 45 08             	mov    0x8(%ebp),%eax
    707f:	8b 40 04             	mov    0x4(%eax),%eax
    7082:	8d 50 ff             	lea    -0x1(%eax),%edx
    7085:	8b 45 0c             	mov    0xc(%ebp),%eax
    7088:	8b 00                	mov    (%eax),%eax
    708a:	39 c2                	cmp    %eax,%edx
    708c:	75 1e                	jne    70ac <huffman_decoder+0x2bf>
         *x += hgetbits(h->linbits);
    708e:	8b 45 0c             	mov    0xc(%ebp),%eax
    7091:	8b 00                	mov    (%eax),%eax
    7093:	89 c3                	mov    %eax,%ebx
    7095:	8b 45 08             	mov    0x8(%ebp),%eax
    7098:	8b 40 0c             	mov    0xc(%eax),%eax
    709b:	89 04 24             	mov    %eax,(%esp)
    709e:	e8 8d e4 ff ff       	call   5530 <hgetbits>
    70a3:	01 d8                	add    %ebx,%eax
    70a5:	89 c2                	mov    %eax,%edx
    70a7:	8b 45 0c             	mov    0xc(%ebp),%eax
    70aa:	89 10                	mov    %edx,(%eax)
     if (*x)
    70ac:	8b 45 0c             	mov    0xc(%ebp),%eax
    70af:	8b 00                	mov    (%eax),%eax
    70b1:	85 c0                	test   %eax,%eax
    70b3:	74 18                	je     70cd <huffman_decoder+0x2e0>
        if (hget1bit() == 1) *x = -*x;
    70b5:	e8 91 e4 ff ff       	call   554b <hget1bit>
    70ba:	83 f8 01             	cmp    $0x1,%eax
    70bd:	75 0e                	jne    70cd <huffman_decoder+0x2e0>
    70bf:	8b 45 0c             	mov    0xc(%ebp),%eax
    70c2:	8b 00                	mov    (%eax),%eax
    70c4:	f7 d8                	neg    %eax
    70c6:	89 c2                	mov    %eax,%edx
    70c8:	8b 45 0c             	mov    0xc(%ebp),%eax
    70cb:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    70cd:	8b 45 08             	mov    0x8(%ebp),%eax
    70d0:	8b 40 0c             	mov    0xc(%eax),%eax
    70d3:	85 c0                	test   %eax,%eax
    70d5:	74 30                	je     7107 <huffman_decoder+0x31a>
       if ((h->ylen-1) == *y)
    70d7:	8b 45 08             	mov    0x8(%ebp),%eax
    70da:	8b 40 08             	mov    0x8(%eax),%eax
    70dd:	8d 50 ff             	lea    -0x1(%eax),%edx
    70e0:	8b 45 10             	mov    0x10(%ebp),%eax
    70e3:	8b 00                	mov    (%eax),%eax
    70e5:	39 c2                	cmp    %eax,%edx
    70e7:	75 1e                	jne    7107 <huffman_decoder+0x31a>
         *y += hgetbits(h->linbits);
    70e9:	8b 45 10             	mov    0x10(%ebp),%eax
    70ec:	8b 00                	mov    (%eax),%eax
    70ee:	89 c3                	mov    %eax,%ebx
    70f0:	8b 45 08             	mov    0x8(%ebp),%eax
    70f3:	8b 40 0c             	mov    0xc(%eax),%eax
    70f6:	89 04 24             	mov    %eax,(%esp)
    70f9:	e8 32 e4 ff ff       	call   5530 <hgetbits>
    70fe:	01 d8                	add    %ebx,%eax
    7100:	89 c2                	mov    %eax,%edx
    7102:	8b 45 10             	mov    0x10(%ebp),%eax
    7105:	89 10                	mov    %edx,(%eax)
     if (*y)
    7107:	8b 45 10             	mov    0x10(%ebp),%eax
    710a:	8b 00                	mov    (%eax),%eax
    710c:	85 c0                	test   %eax,%eax
    710e:	74 18                	je     7128 <huffman_decoder+0x33b>
        if (hget1bit() == 1) *y = -*y;
    7110:	e8 36 e4 ff ff       	call   554b <hget1bit>
    7115:	83 f8 01             	cmp    $0x1,%eax
    7118:	75 0e                	jne    7128 <huffman_decoder+0x33b>
    711a:	8b 45 10             	mov    0x10(%ebp),%eax
    711d:	8b 00                	mov    (%eax),%eax
    711f:	f7 d8                	neg    %eax
    7121:	89 c2                	mov    %eax,%edx
    7123:	8b 45 10             	mov    0x10(%ebp),%eax
    7126:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    7128:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    712b:	83 c4 24             	add    $0x24,%esp
    712e:	5b                   	pop    %ebx
    712f:	5d                   	pop    %ebp
    7130:	c3                   	ret    

00007131 <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    7131:	55                   	push   %ebp
    7132:	89 e5                	mov    %esp,%ebp
    7134:	83 ec 28             	sub    $0x28,%esp
    layer *hdr = fr_ps->header;
    7137:	8b 45 0c             	mov    0xc(%ebp),%eax
    713a:	8b 00                	mov    (%eax),%eax
    713c:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    713f:	8b 45 08             	mov    0x8(%ebp),%eax
    7142:	89 04 24             	mov    %eax,(%esp)
    7145:	e8 6c df ff ff       	call   50b6 <get1bit>
    714a:	89 c2                	mov    %eax,%edx
    714c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    714f:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    7151:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    7158:	00 
    7159:	8b 45 08             	mov    0x8(%ebp),%eax
    715c:	89 04 24             	mov    %eax,(%esp)
    715f:	e8 64 e0 ff ff       	call   51c8 <getbits>
    7164:	ba 04 00 00 00       	mov    $0x4,%edx
    7169:	29 c2                	sub    %eax,%edx
    716b:	89 d0                	mov    %edx,%eax
    716d:	89 c2                	mov    %eax,%edx
    716f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7172:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    7175:	8b 45 08             	mov    0x8(%ebp),%eax
    7178:	89 04 24             	mov    %eax,(%esp)
    717b:	e8 36 df ff ff       	call   50b6 <get1bit>
    7180:	85 c0                	test   %eax,%eax
    7182:	0f 94 c0             	sete   %al
    7185:	0f b6 d0             	movzbl %al,%edx
    7188:	8b 45 f4             	mov    -0xc(%ebp),%eax
    718b:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    718e:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    7195:	00 
    7196:	8b 45 08             	mov    0x8(%ebp),%eax
    7199:	89 04 24             	mov    %eax,(%esp)
    719c:	e8 27 e0 ff ff       	call   51c8 <getbits>
    71a1:	89 c2                	mov    %eax,%edx
    71a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    71a6:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    71a9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    71b0:	00 
    71b1:	8b 45 08             	mov    0x8(%ebp),%eax
    71b4:	89 04 24             	mov    %eax,(%esp)
    71b7:	e8 0c e0 ff ff       	call   51c8 <getbits>
    71bc:	89 c2                	mov    %eax,%edx
    71be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    71c1:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    71c4:	8b 45 08             	mov    0x8(%ebp),%eax
    71c7:	89 04 24             	mov    %eax,(%esp)
    71ca:	e8 e7 de ff ff       	call   50b6 <get1bit>
    71cf:	89 c2                	mov    %eax,%edx
    71d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    71d4:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    71d7:	8b 45 08             	mov    0x8(%ebp),%eax
    71da:	89 04 24             	mov    %eax,(%esp)
    71dd:	e8 d4 de ff ff       	call   50b6 <get1bit>
    71e2:	89 c2                	mov    %eax,%edx
    71e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    71e7:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    71ea:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    71f1:	00 
    71f2:	8b 45 08             	mov    0x8(%ebp),%eax
    71f5:	89 04 24             	mov    %eax,(%esp)
    71f8:	e8 cb df ff ff       	call   51c8 <getbits>
    71fd:	89 c2                	mov    %eax,%edx
    71ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7202:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    7205:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    720c:	00 
    720d:	8b 45 08             	mov    0x8(%ebp),%eax
    7210:	89 04 24             	mov    %eax,(%esp)
    7213:	e8 b0 df ff ff       	call   51c8 <getbits>
    7218:	89 c2                	mov    %eax,%edx
    721a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    721d:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    7220:	8b 45 08             	mov    0x8(%ebp),%eax
    7223:	89 04 24             	mov    %eax,(%esp)
    7226:	e8 8b de ff ff       	call   50b6 <get1bit>
    722b:	89 c2                	mov    %eax,%edx
    722d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7230:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    7233:	8b 45 08             	mov    0x8(%ebp),%eax
    7236:	89 04 24             	mov    %eax,(%esp)
    7239:	e8 78 de ff ff       	call   50b6 <get1bit>
    723e:	89 c2                	mov    %eax,%edx
    7240:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7243:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    7246:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    724d:	00 
    724e:	8b 45 08             	mov    0x8(%ebp),%eax
    7251:	89 04 24             	mov    %eax,(%esp)
    7254:	e8 6f df ff ff       	call   51c8 <getbits>
    7259:	89 c2                	mov    %eax,%edx
    725b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    725e:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    7261:	c9                   	leave  
    7262:	c3                   	ret    

00007263 <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    7263:	55                   	push   %ebp
    7264:	89 e5                	mov    %esp,%ebp
    7266:	56                   	push   %esi
    7267:	53                   	push   %ebx
    7268:	83 ec 20             	sub    $0x20,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    726b:	8b 45 10             	mov    0x10(%ebp),%eax
    726e:	8b 40 08             	mov    0x8(%eax),%eax
    7271:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    7274:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    727b:	00 
    727c:	8b 45 08             	mov    0x8(%ebp),%eax
    727f:	89 04 24             	mov    %eax,(%esp)
    7282:	e8 41 df ff ff       	call   51c8 <getbits>
    7287:	8b 55 0c             	mov    0xc(%ebp),%edx
    728a:	89 02                	mov    %eax,(%edx)
	if (stereo == 1)
    728c:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    7290:	75 1b                	jne    72ad <III_get_side_info+0x4a>
		si->private_bits = getbits(bs,5);
    7292:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    7299:	00 
    729a:	8b 45 08             	mov    0x8(%ebp),%eax
    729d:	89 04 24             	mov    %eax,(%esp)
    72a0:	e8 23 df ff ff       	call   51c8 <getbits>
    72a5:	8b 55 0c             	mov    0xc(%ebp),%edx
    72a8:	89 42 04             	mov    %eax,0x4(%edx)
    72ab:	eb 19                	jmp    72c6 <III_get_side_info+0x63>
	else
		si->private_bits = getbits(bs,3);
    72ad:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    72b4:	00 
    72b5:	8b 45 08             	mov    0x8(%ebp),%eax
    72b8:	89 04 24             	mov    %eax,(%esp)
    72bb:	e8 08 df ff ff       	call   51c8 <getbits>
    72c0:	8b 55 0c             	mov    0xc(%ebp),%edx
    72c3:	89 42 04             	mov    %eax,0x4(%edx)

	for (ch=0; ch<stereo; ch++)
    72c6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    72cd:	eb 3d                	jmp    730c <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    72cf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    72d6:	eb 2a                	jmp    7302 <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    72d8:	8b 45 08             	mov    0x8(%ebp),%eax
    72db:	89 04 24             	mov    %eax,(%esp)
    72de:	e8 d3 dd ff ff       	call   50b6 <get1bit>
    72e3:	89 c1                	mov    %eax,%ecx
    72e5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    72e8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    72eb:	89 d0                	mov    %edx,%eax
    72ed:	c1 e0 02             	shl    $0x2,%eax
    72f0:	01 d0                	add    %edx,%eax
    72f2:	c1 e0 03             	shl    $0x3,%eax
    72f5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    72f8:	01 d0                	add    %edx,%eax
    72fa:	89 4c 83 08          	mov    %ecx,0x8(%ebx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    72fe:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7302:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    7306:	7e d0                	jle    72d8 <III_get_side_info+0x75>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    7308:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    730c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    730f:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    7312:	7c bb                	jl     72cf <III_get_side_info+0x6c>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    7314:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    731b:	e9 c5 05 00 00       	jmp    78e5 <III_get_side_info+0x682>
		for (ch=0; ch<stereo; ch++) {
    7320:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7327:	e9 a9 05 00 00       	jmp    78d5 <III_get_side_info+0x672>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    732c:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    7333:	00 
    7334:	8b 45 08             	mov    0x8(%ebp),%eax
    7337:	89 04 24             	mov    %eax,(%esp)
    733a:	e8 89 de ff ff       	call   51c8 <getbits>
    733f:	89 c3                	mov    %eax,%ebx
    7341:	8b 75 0c             	mov    0xc(%ebp),%esi
    7344:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7347:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    734a:	89 c2                	mov    %eax,%edx
    734c:	c1 e2 03             	shl    $0x3,%edx
    734f:	01 c2                	add    %eax,%edx
    7351:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7358:	89 c2                	mov    %eax,%edx
    735a:	89 c8                	mov    %ecx,%eax
    735c:	c1 e0 02             	shl    $0x2,%eax
    735f:	01 c8                	add    %ecx,%eax
    7361:	c1 e0 05             	shl    $0x5,%eax
    7364:	01 d0                	add    %edx,%eax
    7366:	01 f0                	add    %esi,%eax
    7368:	83 c0 18             	add    $0x18,%eax
    736b:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    736d:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    7374:	00 
    7375:	8b 45 08             	mov    0x8(%ebp),%eax
    7378:	89 04 24             	mov    %eax,(%esp)
    737b:	e8 48 de ff ff       	call   51c8 <getbits>
    7380:	89 c3                	mov    %eax,%ebx
    7382:	8b 75 0c             	mov    0xc(%ebp),%esi
    7385:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7388:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    738b:	89 c2                	mov    %eax,%edx
    738d:	c1 e2 03             	shl    $0x3,%edx
    7390:	01 c2                	add    %eax,%edx
    7392:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7399:	89 c2                	mov    %eax,%edx
    739b:	89 c8                	mov    %ecx,%eax
    739d:	c1 e0 02             	shl    $0x2,%eax
    73a0:	01 c8                	add    %ecx,%eax
    73a2:	c1 e0 05             	shl    $0x5,%eax
    73a5:	01 d0                	add    %edx,%eax
    73a7:	01 f0                	add    %esi,%eax
    73a9:	83 c0 1c             	add    $0x1c,%eax
    73ac:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    73ae:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    73b5:	00 
    73b6:	8b 45 08             	mov    0x8(%ebp),%eax
    73b9:	89 04 24             	mov    %eax,(%esp)
    73bc:	e8 07 de ff ff       	call   51c8 <getbits>
    73c1:	89 c3                	mov    %eax,%ebx
    73c3:	8b 75 0c             	mov    0xc(%ebp),%esi
    73c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    73c9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    73cc:	89 c2                	mov    %eax,%edx
    73ce:	c1 e2 03             	shl    $0x3,%edx
    73d1:	01 c2                	add    %eax,%edx
    73d3:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    73da:	89 c2                	mov    %eax,%edx
    73dc:	89 c8                	mov    %ecx,%eax
    73de:	c1 e0 02             	shl    $0x2,%eax
    73e1:	01 c8                	add    %ecx,%eax
    73e3:	c1 e0 05             	shl    $0x5,%eax
    73e6:	01 d0                	add    %edx,%eax
    73e8:	01 f0                	add    %esi,%eax
    73ea:	83 c0 20             	add    $0x20,%eax
    73ed:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    73ef:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    73f6:	00 
    73f7:	8b 45 08             	mov    0x8(%ebp),%eax
    73fa:	89 04 24             	mov    %eax,(%esp)
    73fd:	e8 c6 dd ff ff       	call   51c8 <getbits>
    7402:	89 c3                	mov    %eax,%ebx
    7404:	8b 75 0c             	mov    0xc(%ebp),%esi
    7407:	8b 45 f0             	mov    -0x10(%ebp),%eax
    740a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    740d:	89 c2                	mov    %eax,%edx
    740f:	c1 e2 03             	shl    $0x3,%edx
    7412:	01 c2                	add    %eax,%edx
    7414:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    741b:	89 c2                	mov    %eax,%edx
    741d:	89 c8                	mov    %ecx,%eax
    741f:	c1 e0 02             	shl    $0x2,%eax
    7422:	01 c8                	add    %ecx,%eax
    7424:	c1 e0 05             	shl    $0x5,%eax
    7427:	01 d0                	add    %edx,%eax
    7429:	01 f0                	add    %esi,%eax
    742b:	83 c0 24             	add    $0x24,%eax
    742e:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    7430:	8b 45 08             	mov    0x8(%ebp),%eax
    7433:	89 04 24             	mov    %eax,(%esp)
    7436:	e8 7b dc ff ff       	call   50b6 <get1bit>
    743b:	89 c3                	mov    %eax,%ebx
    743d:	8b 75 0c             	mov    0xc(%ebp),%esi
    7440:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7443:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7446:	89 c2                	mov    %eax,%edx
    7448:	c1 e2 03             	shl    $0x3,%edx
    744b:	01 c2                	add    %eax,%edx
    744d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7454:	89 c2                	mov    %eax,%edx
    7456:	89 c8                	mov    %ecx,%eax
    7458:	c1 e0 02             	shl    $0x2,%eax
    745b:	01 c8                	add    %ecx,%eax
    745d:	c1 e0 05             	shl    $0x5,%eax
    7460:	01 d0                	add    %edx,%eax
    7462:	01 f0                	add    %esi,%eax
    7464:	83 c0 28             	add    $0x28,%eax
    7467:	89 18                	mov    %ebx,(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    7469:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    746c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    746f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7472:	89 c2                	mov    %eax,%edx
    7474:	c1 e2 03             	shl    $0x3,%edx
    7477:	01 c2                	add    %eax,%edx
    7479:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7480:	89 c2                	mov    %eax,%edx
    7482:	89 c8                	mov    %ecx,%eax
    7484:	c1 e0 02             	shl    $0x2,%eax
    7487:	01 c8                	add    %ecx,%eax
    7489:	c1 e0 05             	shl    $0x5,%eax
    748c:	01 d0                	add    %edx,%eax
    748e:	01 d8                	add    %ebx,%eax
    7490:	83 c0 28             	add    $0x28,%eax
    7493:	8b 00                	mov    (%eax),%eax
    7495:	85 c0                	test   %eax,%eax
    7497:	0f 84 82 02 00 00    	je     771f <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    749d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    74a4:	00 
    74a5:	8b 45 08             	mov    0x8(%ebp),%eax
    74a8:	89 04 24             	mov    %eax,(%esp)
    74ab:	e8 18 dd ff ff       	call   51c8 <getbits>
    74b0:	89 c3                	mov    %eax,%ebx
    74b2:	8b 75 0c             	mov    0xc(%ebp),%esi
    74b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    74b8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    74bb:	89 c2                	mov    %eax,%edx
    74bd:	c1 e2 03             	shl    $0x3,%edx
    74c0:	01 c2                	add    %eax,%edx
    74c2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    74c9:	89 c2                	mov    %eax,%edx
    74cb:	89 c8                	mov    %ecx,%eax
    74cd:	c1 e0 02             	shl    $0x2,%eax
    74d0:	01 c8                	add    %ecx,%eax
    74d2:	c1 e0 05             	shl    $0x5,%eax
    74d5:	01 d0                	add    %edx,%eax
    74d7:	01 f0                	add    %esi,%eax
    74d9:	83 c0 2c             	add    $0x2c,%eax
    74dc:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    74de:	8b 45 08             	mov    0x8(%ebp),%eax
    74e1:	89 04 24             	mov    %eax,(%esp)
    74e4:	e8 cd db ff ff       	call   50b6 <get1bit>
    74e9:	89 c3                	mov    %eax,%ebx
    74eb:	8b 75 0c             	mov    0xc(%ebp),%esi
    74ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
    74f1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    74f4:	89 c2                	mov    %eax,%edx
    74f6:	c1 e2 03             	shl    $0x3,%edx
    74f9:	01 c2                	add    %eax,%edx
    74fb:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7502:	89 c2                	mov    %eax,%edx
    7504:	89 c8                	mov    %ecx,%eax
    7506:	c1 e0 02             	shl    $0x2,%eax
    7509:	01 c8                	add    %ecx,%eax
    750b:	c1 e0 05             	shl    $0x5,%eax
    750e:	01 d0                	add    %edx,%eax
    7510:	01 f0                	add    %esi,%eax
    7512:	83 c0 30             	add    $0x30,%eax
    7515:	89 18                	mov    %ebx,(%eax)
				for (i=0; i<2; i++)
    7517:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    751e:	eb 46                	jmp    7566 <III_get_side_info+0x303>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    7520:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    7527:	00 
    7528:	8b 45 08             	mov    0x8(%ebp),%eax
    752b:	89 04 24             	mov    %eax,(%esp)
    752e:	e8 95 dc ff ff       	call   51c8 <getbits>
    7533:	89 c3                	mov    %eax,%ebx
    7535:	8b 75 0c             	mov    0xc(%ebp),%esi
    7538:	8b 45 f0             	mov    -0x10(%ebp),%eax
    753b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    753e:	89 c2                	mov    %eax,%edx
    7540:	c1 e2 03             	shl    $0x3,%edx
    7543:	01 c2                	add    %eax,%edx
    7545:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7548:	89 c2                	mov    %eax,%edx
    754a:	89 c8                	mov    %ecx,%eax
    754c:	c1 e0 02             	shl    $0x2,%eax
    754f:	01 c8                	add    %ecx,%eax
    7551:	c1 e0 03             	shl    $0x3,%eax
    7554:	01 c2                	add    %eax,%edx
    7556:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7559:	01 d0                	add    %edx,%eax
    755b:	83 c0 08             	add    $0x8,%eax
    755e:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    7562:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7566:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    756a:	7e b4                	jle    7520 <III_get_side_info+0x2bd>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    756c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7573:	eb 46                	jmp    75bb <III_get_side_info+0x358>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    7575:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    757c:	00 
    757d:	8b 45 08             	mov    0x8(%ebp),%eax
    7580:	89 04 24             	mov    %eax,(%esp)
    7583:	e8 40 dc ff ff       	call   51c8 <getbits>
    7588:	89 c3                	mov    %eax,%ebx
    758a:	8b 75 0c             	mov    0xc(%ebp),%esi
    758d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7590:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7593:	89 c2                	mov    %eax,%edx
    7595:	c1 e2 03             	shl    $0x3,%edx
    7598:	01 c2                	add    %eax,%edx
    759a:	8d 04 12             	lea    (%edx,%edx,1),%eax
    759d:	89 c2                	mov    %eax,%edx
    759f:	89 c8                	mov    %ecx,%eax
    75a1:	c1 e0 02             	shl    $0x2,%eax
    75a4:	01 c8                	add    %ecx,%eax
    75a6:	c1 e0 03             	shl    $0x3,%eax
    75a9:	01 c2                	add    %eax,%edx
    75ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
    75ae:	01 d0                	add    %edx,%eax
    75b0:	83 c0 0c             	add    $0xc,%eax
    75b3:	89 5c 86 10          	mov    %ebx,0x10(%esi,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    75b7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    75bb:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    75bf:	7e b4                	jle    7575 <III_get_side_info+0x312>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    75c1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    75c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    75c7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    75ca:	89 c2                	mov    %eax,%edx
    75cc:	c1 e2 03             	shl    $0x3,%edx
    75cf:	01 c2                	add    %eax,%edx
    75d1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    75d8:	89 c2                	mov    %eax,%edx
    75da:	89 c8                	mov    %ecx,%eax
    75dc:	c1 e0 02             	shl    $0x2,%eax
    75df:	01 c8                	add    %ecx,%eax
    75e1:	c1 e0 05             	shl    $0x5,%eax
    75e4:	01 d0                	add    %edx,%eax
    75e6:	01 d8                	add    %ebx,%eax
    75e8:	83 c0 2c             	add    $0x2c,%eax
    75eb:	8b 00                	mov    (%eax),%eax
    75ed:	85 c0                	test   %eax,%eax
    75ef:	75 05                	jne    75f6 <III_get_side_info+0x393>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    75f1:	e8 84 cb ff ff       	call   417a <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    75f6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    75f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    75fc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    75ff:	89 c2                	mov    %eax,%edx
    7601:	c1 e2 03             	shl    $0x3,%edx
    7604:	01 c2                	add    %eax,%edx
    7606:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    760d:	89 c2                	mov    %eax,%edx
    760f:	89 c8                	mov    %ecx,%eax
    7611:	c1 e0 02             	shl    $0x2,%eax
    7614:	01 c8                	add    %ecx,%eax
    7616:	c1 e0 05             	shl    $0x5,%eax
    7619:	01 d0                	add    %edx,%eax
    761b:	01 d8                	add    %ebx,%eax
    761d:	83 c0 2c             	add    $0x2c,%eax
    7620:	8b 00                	mov    (%eax),%eax
    7622:	83 f8 02             	cmp    $0x2,%eax
    7625:	75 62                	jne    7689 <III_get_side_info+0x426>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    7627:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    762a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    762d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7630:	89 c2                	mov    %eax,%edx
    7632:	c1 e2 03             	shl    $0x3,%edx
    7635:	01 c2                	add    %eax,%edx
    7637:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    763e:	89 c2                	mov    %eax,%edx
    7640:	89 c8                	mov    %ecx,%eax
    7642:	c1 e0 02             	shl    $0x2,%eax
    7645:	01 c8                	add    %ecx,%eax
    7647:	c1 e0 05             	shl    $0x5,%eax
    764a:	01 d0                	add    %edx,%eax
    764c:	01 d8                	add    %ebx,%eax
    764e:	83 c0 30             	add    $0x30,%eax
    7651:	8b 00                	mov    (%eax),%eax
    7653:	85 c0                	test   %eax,%eax
    7655:	75 32                	jne    7689 <III_get_side_info+0x426>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    7657:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    765a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    765d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7660:	89 c2                	mov    %eax,%edx
    7662:	c1 e2 03             	shl    $0x3,%edx
    7665:	01 c2                	add    %eax,%edx
    7667:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    766e:	89 c2                	mov    %eax,%edx
    7670:	89 c8                	mov    %ecx,%eax
    7672:	c1 e0 02             	shl    $0x2,%eax
    7675:	01 c8                	add    %ecx,%eax
    7677:	c1 e0 05             	shl    $0x5,%eax
    767a:	01 d0                	add    %edx,%eax
    767c:	01 d8                	add    %ebx,%eax
    767e:	83 c0 4c             	add    $0x4c,%eax
    7681:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
    7687:	eb 30                	jmp    76b9 <III_get_side_info+0x456>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    7689:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    768c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    768f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7692:	89 c2                	mov    %eax,%edx
    7694:	c1 e2 03             	shl    $0x3,%edx
    7697:	01 c2                	add    %eax,%edx
    7699:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    76a0:	89 c2                	mov    %eax,%edx
    76a2:	89 c8                	mov    %ecx,%eax
    76a4:	c1 e0 02             	shl    $0x2,%eax
    76a7:	01 c8                	add    %ecx,%eax
    76a9:	c1 e0 05             	shl    $0x5,%eax
    76ac:	01 d0                	add    %edx,%eax
    76ae:	01 d8                	add    %ebx,%eax
    76b0:	83 c0 4c             	add    $0x4c,%eax
    76b3:	c7 00 07 00 00 00    	movl   $0x7,(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    76b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    76bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    76bf:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    76c2:	89 c2                	mov    %eax,%edx
    76c4:	c1 e2 03             	shl    $0x3,%edx
    76c7:	01 c2                	add    %eax,%edx
    76c9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    76d0:	89 c2                	mov    %eax,%edx
    76d2:	89 c8                	mov    %ecx,%eax
    76d4:	c1 e0 02             	shl    $0x2,%eax
    76d7:	01 c8                	add    %ecx,%eax
    76d9:	c1 e0 05             	shl    $0x5,%eax
    76dc:	01 d0                	add    %edx,%eax
    76de:	01 d8                	add    %ebx,%eax
    76e0:	83 c0 4c             	add    $0x4c,%eax
    76e3:	8b 00                	mov    (%eax),%eax
    76e5:	ba 14 00 00 00       	mov    $0x14,%edx
    76ea:	89 d3                	mov    %edx,%ebx
    76ec:	29 c3                	sub    %eax,%ebx
    76ee:	8b 75 0c             	mov    0xc(%ebp),%esi
    76f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    76f4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    76f7:	89 c2                	mov    %eax,%edx
    76f9:	c1 e2 03             	shl    $0x3,%edx
    76fc:	01 c2                	add    %eax,%edx
    76fe:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7705:	89 c2                	mov    %eax,%edx
    7707:	89 c8                	mov    %ecx,%eax
    7709:	c1 e0 02             	shl    $0x2,%eax
    770c:	01 c8                	add    %ecx,%eax
    770e:	c1 e0 05             	shl    $0x5,%eax
    7711:	01 d0                	add    %edx,%eax
    7713:	01 f0                	add    %esi,%eax
    7715:	83 c0 50             	add    $0x50,%eax
    7718:	89 18                	mov    %ebx,(%eax)
    771a:	e9 07 01 00 00       	jmp    7826 <III_get_side_info+0x5c3>
			}
			else {
				for (i=0; i<3; i++)
    771f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7726:	eb 46                	jmp    776e <III_get_side_info+0x50b>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    7728:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    772f:	00 
    7730:	8b 45 08             	mov    0x8(%ebp),%eax
    7733:	89 04 24             	mov    %eax,(%esp)
    7736:	e8 8d da ff ff       	call   51c8 <getbits>
    773b:	89 c3                	mov    %eax,%ebx
    773d:	8b 75 0c             	mov    0xc(%ebp),%esi
    7740:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7743:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7746:	89 c2                	mov    %eax,%edx
    7748:	c1 e2 03             	shl    $0x3,%edx
    774b:	01 c2                	add    %eax,%edx
    774d:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7750:	89 c2                	mov    %eax,%edx
    7752:	89 c8                	mov    %ecx,%eax
    7754:	c1 e0 02             	shl    $0x2,%eax
    7757:	01 c8                	add    %ecx,%eax
    7759:	c1 e0 03             	shl    $0x3,%eax
    775c:	01 c2                	add    %eax,%edx
    775e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7761:	01 d0                	add    %edx,%eax
    7763:	83 c0 08             	add    $0x8,%eax
    7766:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    776a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    776e:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7772:	7e b4                	jle    7728 <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    7774:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    777b:	00 
    777c:	8b 45 08             	mov    0x8(%ebp),%eax
    777f:	89 04 24             	mov    %eax,(%esp)
    7782:	e8 41 da ff ff       	call   51c8 <getbits>
    7787:	89 c3                	mov    %eax,%ebx
    7789:	8b 75 0c             	mov    0xc(%ebp),%esi
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
    77ae:	01 f0                	add    %esi,%eax
    77b0:	83 c0 4c             	add    $0x4c,%eax
    77b3:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    77b5:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    77bc:	00 
    77bd:	8b 45 08             	mov    0x8(%ebp),%eax
    77c0:	89 04 24             	mov    %eax,(%esp)
    77c3:	e8 00 da ff ff       	call   51c8 <getbits>
    77c8:	89 c3                	mov    %eax,%ebx
    77ca:	8b 75 0c             	mov    0xc(%ebp),%esi
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
    77ef:	01 f0                	add    %esi,%eax
    77f1:	83 c0 50             	add    $0x50,%eax
    77f4:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    77f6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    77f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    77fc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    77ff:	89 c2                	mov    %eax,%edx
    7801:	c1 e2 03             	shl    $0x3,%edx
    7804:	01 c2                	add    %eax,%edx
    7806:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    780d:	89 c2                	mov    %eax,%edx
    780f:	89 c8                	mov    %ecx,%eax
    7811:	c1 e0 02             	shl    $0x2,%eax
    7814:	01 c8                	add    %ecx,%eax
    7816:	c1 e0 05             	shl    $0x5,%eax
    7819:	01 d0                	add    %edx,%eax
    781b:	01 d8                	add    %ebx,%eax
    781d:	83 c0 2c             	add    $0x2c,%eax
    7820:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    7826:	8b 45 08             	mov    0x8(%ebp),%eax
    7829:	89 04 24             	mov    %eax,(%esp)
    782c:	e8 85 d8 ff ff       	call   50b6 <get1bit>
    7831:	89 c3                	mov    %eax,%ebx
    7833:	8b 75 0c             	mov    0xc(%ebp),%esi
    7836:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7839:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    783c:	89 c2                	mov    %eax,%edx
    783e:	c1 e2 03             	shl    $0x3,%edx
    7841:	01 c2                	add    %eax,%edx
    7843:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    784a:	89 c2                	mov    %eax,%edx
    784c:	89 c8                	mov    %ecx,%eax
    784e:	c1 e0 02             	shl    $0x2,%eax
    7851:	01 c8                	add    %ecx,%eax
    7853:	c1 e0 05             	shl    $0x5,%eax
    7856:	01 d0                	add    %edx,%eax
    7858:	01 f0                	add    %esi,%eax
    785a:	83 c0 54             	add    $0x54,%eax
    785d:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    785f:	8b 45 08             	mov    0x8(%ebp),%eax
    7862:	89 04 24             	mov    %eax,(%esp)
    7865:	e8 4c d8 ff ff       	call   50b6 <get1bit>
    786a:	89 c3                	mov    %eax,%ebx
    786c:	8b 75 0c             	mov    0xc(%ebp),%esi
    786f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7872:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7875:	89 c2                	mov    %eax,%edx
    7877:	c1 e2 03             	shl    $0x3,%edx
    787a:	01 c2                	add    %eax,%edx
    787c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7883:	89 c2                	mov    %eax,%edx
    7885:	89 c8                	mov    %ecx,%eax
    7887:	c1 e0 02             	shl    $0x2,%eax
    788a:	01 c8                	add    %ecx,%eax
    788c:	c1 e0 05             	shl    $0x5,%eax
    788f:	01 d0                	add    %edx,%eax
    7891:	01 f0                	add    %esi,%eax
    7893:	83 c0 58             	add    $0x58,%eax
    7896:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    7898:	8b 45 08             	mov    0x8(%ebp),%eax
    789b:	89 04 24             	mov    %eax,(%esp)
    789e:	e8 13 d8 ff ff       	call   50b6 <get1bit>
    78a3:	89 c3                	mov    %eax,%ebx
    78a5:	8b 75 0c             	mov    0xc(%ebp),%esi
    78a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    78ab:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    78ae:	89 c2                	mov    %eax,%edx
    78b0:	c1 e2 03             	shl    $0x3,%edx
    78b3:	01 c2                	add    %eax,%edx
    78b5:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    78bc:	89 c2                	mov    %eax,%edx
    78be:	89 c8                	mov    %ecx,%eax
    78c0:	c1 e0 02             	shl    $0x2,%eax
    78c3:	01 c8                	add    %ecx,%eax
    78c5:	c1 e0 05             	shl    $0x5,%eax
    78c8:	01 d0                	add    %edx,%eax
    78ca:	01 f0                	add    %esi,%eax
    78cc:	83 c0 5c             	add    $0x5c,%eax
    78cf:	89 18                	mov    %ebx,(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    78d1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    78d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    78d8:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    78db:	0f 8c 4b fa ff ff    	jl     732c <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    78e1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    78e5:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    78e9:	0f 8e 31 fa ff ff    	jle    7320 <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    78ef:	83 c4 20             	add    $0x20,%esp
    78f2:	5b                   	pop    %ebx
    78f3:	5e                   	pop    %esi
    78f4:	5d                   	pop    %ebp
    78f5:	c3                   	ret    

000078f6 <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    78f6:	55                   	push   %ebp
    78f7:	89 e5                	mov    %esp,%ebp
    78f9:	56                   	push   %esi
    78fa:	53                   	push   %ebx
    78fb:	83 ec 20             	sub    $0x20,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    78fe:	8b 45 10             	mov    0x10(%ebp),%eax
    7901:	89 c2                	mov    %eax,%edx
    7903:	c1 e2 03             	shl    $0x3,%edx
    7906:	01 c2                	add    %eax,%edx
    7908:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    790f:	89 c2                	mov    %eax,%edx
    7911:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7914:	89 c8                	mov    %ecx,%eax
    7916:	c1 e0 02             	shl    $0x2,%eax
    7919:	01 c8                	add    %ecx,%eax
    791b:	c1 e0 05             	shl    $0x5,%eax
    791e:	01 d0                	add    %edx,%eax
    7920:	8d 50 10             	lea    0x10(%eax),%edx
    7923:	8b 45 0c             	mov    0xc(%ebp),%eax
    7926:	01 d0                	add    %edx,%eax
    7928:	83 c0 08             	add    $0x8,%eax
    792b:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    792e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7931:	8b 40 10             	mov    0x10(%eax),%eax
    7934:	85 c0                	test   %eax,%eax
    7936:	0f 84 7e 02 00 00    	je     7bba <III_get_scale_factors+0x2c4>
    793c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    793f:	8b 40 14             	mov    0x14(%eax),%eax
    7942:	83 f8 02             	cmp    $0x2,%eax
    7945:	0f 85 6f 02 00 00    	jne    7bba <III_get_scale_factors+0x2c4>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    794b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    794e:	8b 40 18             	mov    0x18(%eax),%eax
    7951:	85 c0                	test   %eax,%eax
    7953:	0f 84 6b 01 00 00    	je     7ac4 <III_get_scale_factors+0x1ce>
			for (sfb = 0; sfb < 8; sfb++)
    7959:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7960:	eb 32                	jmp    7994 <III_get_scale_factors+0x9e>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    7962:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7965:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    7968:	8b 04 85 60 ef 00 00 	mov    0xef60(,%eax,4),%eax
    796f:	89 04 24             	mov    %eax,(%esp)
    7972:	e8 b9 db ff ff       	call   5530 <hgetbits>
    7977:	89 c3                	mov    %eax,%ebx
    7979:	8b 4d 08             	mov    0x8(%ebp),%ecx
    797c:	8b 45 14             	mov    0x14(%ebp),%eax
    797f:	01 c0                	add    %eax,%eax
    7981:	89 c2                	mov    %eax,%edx
    7983:	c1 e2 05             	shl    $0x5,%edx
    7986:	29 c2                	sub    %eax,%edx
    7988:	8b 45 f4             	mov    -0xc(%ebp),%eax
    798b:	01 d0                	add    %edx,%eax
    798d:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    7990:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7994:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    7998:	7e c8                	jle    7962 <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    799a:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    79a1:	eb 5c                	jmp    79ff <III_get_scale_factors+0x109>
				for (window=0; window<3; window++)
    79a3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    79aa:	eb 49                	jmp    79f5 <III_get_scale_factors+0xff>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    79ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
    79af:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    79b2:	8b 04 85 60 ef 00 00 	mov    0xef60(,%eax,4),%eax
    79b9:	89 04 24             	mov    %eax,(%esp)
    79bc:	e8 6f db ff ff       	call   5530 <hgetbits>
    79c1:	89 c6                	mov    %eax,%esi
    79c3:	8b 5d 08             	mov    0x8(%ebp),%ebx
    79c6:	8b 55 ec             	mov    -0x14(%ebp),%edx
    79c9:	8b 4d 14             	mov    0x14(%ebp),%ecx
    79cc:	89 d0                	mov    %edx,%eax
    79ce:	01 c0                	add    %eax,%eax
    79d0:	01 d0                	add    %edx,%eax
    79d2:	c1 e0 02             	shl    $0x2,%eax
    79d5:	01 d0                	add    %edx,%eax
    79d7:	89 ca                	mov    %ecx,%edx
    79d9:	01 d2                	add    %edx,%edx
    79db:	89 d1                	mov    %edx,%ecx
    79dd:	c1 e1 05             	shl    $0x5,%ecx
    79e0:	29 d1                	sub    %edx,%ecx
    79e2:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    79e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    79e8:	01 d0                	add    %edx,%eax
    79ea:	83 c0 14             	add    $0x14,%eax
    79ed:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    79f1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    79f5:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    79f9:	7e b1                	jle    79ac <III_get_scale_factors+0xb6>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    79fb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    79ff:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    7a03:	7e 9e                	jle    79a3 <III_get_scale_factors+0xad>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    7a05:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    7a0c:	eb 5f                	jmp    7a6d <III_get_scale_factors+0x177>
				for (window=0; window<3; window++)
    7a0e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7a15:	eb 4c                	jmp    7a63 <III_get_scale_factors+0x16d>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    7a17:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7a1a:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    7a1d:	83 c0 10             	add    $0x10,%eax
    7a20:	8b 04 85 60 ef 00 00 	mov    0xef60(,%eax,4),%eax
    7a27:	89 04 24             	mov    %eax,(%esp)
    7a2a:	e8 01 db ff ff       	call   5530 <hgetbits>
    7a2f:	89 c6                	mov    %eax,%esi
    7a31:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7a34:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7a37:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7a3a:	89 d0                	mov    %edx,%eax
    7a3c:	01 c0                	add    %eax,%eax
    7a3e:	01 d0                	add    %edx,%eax
    7a40:	c1 e0 02             	shl    $0x2,%eax
    7a43:	01 d0                	add    %edx,%eax
    7a45:	89 ca                	mov    %ecx,%edx
    7a47:	01 d2                	add    %edx,%edx
    7a49:	89 d1                	mov    %edx,%ecx
    7a4b:	c1 e1 05             	shl    $0x5,%ecx
    7a4e:	29 d1                	sub    %edx,%ecx
    7a50:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    7a53:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7a56:	01 d0                	add    %edx,%eax
    7a58:	83 c0 14             	add    $0x14,%eax
    7a5b:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    7a5f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7a63:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7a67:	7e ae                	jle    7a17 <III_get_scale_factors+0x121>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    7a69:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7a6d:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    7a71:	7e 9b                	jle    7a0e <III_get_scale_factors+0x118>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    7a73:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7a7a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7a81:	eb 36                	jmp    7ab9 <III_get_scale_factors+0x1c3>
				(*scalefac)[ch].s[window][sfb] = 0;
    7a83:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7a86:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7a89:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7a8c:	89 d0                	mov    %edx,%eax
    7a8e:	01 c0                	add    %eax,%eax
    7a90:	01 d0                	add    %edx,%eax
    7a92:	c1 e0 02             	shl    $0x2,%eax
    7a95:	01 d0                	add    %edx,%eax
    7a97:	89 ca                	mov    %ecx,%edx
    7a99:	01 d2                	add    %edx,%edx
    7a9b:	89 d1                	mov    %edx,%ecx
    7a9d:	c1 e1 05             	shl    $0x5,%ecx
    7aa0:	29 d1                	sub    %edx,%ecx
    7aa2:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    7aa5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7aa8:	01 d0                	add    %edx,%eax
    7aaa:	83 c0 14             	add    $0x14,%eax
    7aad:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    7ab4:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    7ab5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7ab9:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7abd:	7e c4                	jle    7a83 <III_get_scale_factors+0x18d>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    7abf:	e9 b1 01 00 00       	jmp    7c75 <III_get_scale_factors+0x37f>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    7ac4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7acb:	e9 8f 00 00 00       	jmp    7b5f <III_get_scale_factors+0x269>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    7ad0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7ad3:	83 c0 04             	add    $0x4,%eax
    7ad6:	8b 04 85 44 ef 00 00 	mov    0xef44(,%eax,4),%eax
    7add:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7ae0:	eb 64                	jmp    7b46 <III_get_scale_factors+0x250>
					for (window=0; window<3; window++)
    7ae2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7ae9:	eb 51                	jmp    7b3c <III_get_scale_factors+0x246>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    7aeb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7aee:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    7af1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7af4:	c1 e2 04             	shl    $0x4,%edx
    7af7:	01 d0                	add    %edx,%eax
    7af9:	8b 04 85 60 ef 00 00 	mov    0xef60(,%eax,4),%eax
    7b00:	89 04 24             	mov    %eax,(%esp)
    7b03:	e8 28 da ff ff       	call   5530 <hgetbits>
    7b08:	89 c6                	mov    %eax,%esi
    7b0a:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7b0d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7b10:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7b13:	89 d0                	mov    %edx,%eax
    7b15:	01 c0                	add    %eax,%eax
    7b17:	01 d0                	add    %edx,%eax
    7b19:	c1 e0 02             	shl    $0x2,%eax
    7b1c:	01 d0                	add    %edx,%eax
    7b1e:	89 ca                	mov    %ecx,%edx
    7b20:	01 d2                	add    %edx,%edx
    7b22:	89 d1                	mov    %edx,%ecx
    7b24:	c1 e1 05             	shl    $0x5,%ecx
    7b27:	29 d1                	sub    %edx,%ecx
    7b29:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    7b2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7b2f:	01 d0                	add    %edx,%eax
    7b31:	83 c0 14             	add    $0x14,%eax
    7b34:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    7b38:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7b3c:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7b40:	7e a9                	jle    7aeb <III_get_scale_factors+0x1f5>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    7b42:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7b46:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7b49:	83 c0 01             	add    $0x1,%eax
    7b4c:	83 c0 04             	add    $0x4,%eax
    7b4f:	8b 04 85 44 ef 00 00 	mov    0xef44(,%eax,4),%eax
    7b56:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    7b59:	7f 87                	jg     7ae2 <III_get_scale_factors+0x1ec>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    7b5b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7b5f:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7b63:	0f 8e 67 ff ff ff    	jle    7ad0 <III_get_scale_factors+0x1da>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    7b69:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7b70:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7b77:	eb 36                	jmp    7baf <III_get_scale_factors+0x2b9>
					(*scalefac)[ch].s[window][sfb] = 0;
    7b79:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7b7c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7b7f:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7b82:	89 d0                	mov    %edx,%eax
    7b84:	01 c0                	add    %eax,%eax
    7b86:	01 d0                	add    %edx,%eax
    7b88:	c1 e0 02             	shl    $0x2,%eax
    7b8b:	01 d0                	add    %edx,%eax
    7b8d:	89 ca                	mov    %ecx,%edx
    7b8f:	01 d2                	add    %edx,%edx
    7b91:	89 d1                	mov    %edx,%ecx
    7b93:	c1 e1 05             	shl    $0x5,%ecx
    7b96:	29 d1                	sub    %edx,%ecx
    7b98:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    7b9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7b9e:	01 d0                	add    %edx,%eax
    7ba0:	83 c0 14             	add    $0x14,%eax
    7ba3:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    7baa:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    7bab:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7baf:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7bb3:	7e c4                	jle    7b79 <III_get_scale_factors+0x283>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    7bb5:	e9 bb 00 00 00       	jmp    7c75 <III_get_scale_factors+0x37f>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    7bba:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7bc1:	e9 89 00 00 00       	jmp    7c4f <III_get_scale_factors+0x359>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    7bc6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7bc9:	8b 55 14             	mov    0x14(%ebp),%edx
    7bcc:	89 d0                	mov    %edx,%eax
    7bce:	c1 e0 02             	shl    $0x2,%eax
    7bd1:	01 d0                	add    %edx,%eax
    7bd3:	c1 e0 03             	shl    $0x3,%eax
    7bd6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7bd9:	01 d0                	add    %edx,%eax
    7bdb:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    7bdf:	85 c0                	test   %eax,%eax
    7be1:	74 06                	je     7be9 <III_get_scale_factors+0x2f3>
    7be3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    7be7:	75 62                	jne    7c4b <III_get_scale_factors+0x355>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    7be9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7bec:	8b 04 85 40 ef 00 00 	mov    0xef40(,%eax,4),%eax
    7bf3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    7bf6:	eb 41                	jmp    7c39 <III_get_scale_factors+0x343>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    7bf8:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7bfc:	0f 9f c0             	setg   %al
    7bff:	0f b6 d0             	movzbl %al,%edx
    7c02:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7c05:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    7c08:	c1 e2 04             	shl    $0x4,%edx
    7c0b:	01 d0                	add    %edx,%eax
    7c0d:	8b 04 85 60 ef 00 00 	mov    0xef60(,%eax,4),%eax
    7c14:	89 04 24             	mov    %eax,(%esp)
    7c17:	e8 14 d9 ff ff       	call   5530 <hgetbits>
    7c1c:	89 c3                	mov    %eax,%ebx
    7c1e:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7c21:	8b 45 14             	mov    0x14(%ebp),%eax
    7c24:	01 c0                	add    %eax,%eax
    7c26:	89 c2                	mov    %eax,%edx
    7c28:	c1 e2 05             	shl    $0x5,%edx
    7c2b:	29 c2                	sub    %eax,%edx
    7c2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7c30:	01 d0                	add    %edx,%eax
    7c32:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    7c35:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7c39:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7c3c:	83 c0 01             	add    $0x1,%eax
    7c3f:	8b 04 85 40 ef 00 00 	mov    0xef40(,%eax,4),%eax
    7c46:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    7c49:	7f ad                	jg     7bf8 <III_get_scale_factors+0x302>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    7c4b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7c4f:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    7c53:	0f 8e 6d ff ff ff    	jle    7bc6 <III_get_scale_factors+0x2d0>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    7c59:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7c5c:	8b 45 14             	mov    0x14(%ebp),%eax
    7c5f:	c1 e0 03             	shl    $0x3,%eax
    7c62:	89 c2                	mov    %eax,%edx
    7c64:	c1 e2 05             	shl    $0x5,%edx
    7c67:	29 c2                	sub    %eax,%edx
    7c69:	8d 04 11             	lea    (%ecx,%edx,1),%eax
    7c6c:	83 c0 58             	add    $0x58,%eax
    7c6f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    7c75:	83 c4 20             	add    $0x20,%esp
    7c78:	5b                   	pop    %ebx
    7c79:	5e                   	pop    %esi
    7c7a:	5d                   	pop    %ebp
    7c7b:	c3                   	ret    

00007c7c <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    7c7c:	55                   	push   %ebp
    7c7d:	89 e5                	mov    %esp,%ebp
    7c7f:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    7c82:	a1 80 f2 00 00       	mov    0xf280,%eax
    7c87:	85 c0                	test   %eax,%eax
    7c89:	74 02                	je     7c8d <initialize_huffman+0x11>
    7c8b:	eb 0f                	jmp    7c9c <initialize_huffman+0x20>
	read_decoder_table();
    7c8d:	e8 03 d9 ff ff       	call   5595 <read_decoder_table>
	huffman_initialized = TRUE;
    7c92:	c7 05 80 f2 00 00 01 	movl   $0x1,0xf280
    7c99:	00 00 00 
}
    7c9c:	c9                   	leave  
    7c9d:	c3                   	ret    

00007c9e <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    7c9e:	55                   	push   %ebp
    7c9f:	89 e5                	mov    %esp,%ebp
    7ca1:	57                   	push   %edi
    7ca2:	56                   	push   %esi
    7ca3:	53                   	push   %ebx
    7ca4:	83 ec 4c             	sub    $0x4c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    7ca7:	e8 d0 ff ff ff       	call   7c7c <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    7cac:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7caf:	8b 45 14             	mov    0x14(%ebp),%eax
    7cb2:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7cb5:	89 c2                	mov    %eax,%edx
    7cb7:	c1 e2 03             	shl    $0x3,%edx
    7cba:	01 c2                	add    %eax,%edx
    7cbc:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7cc3:	89 c2                	mov    %eax,%edx
    7cc5:	89 c8                	mov    %ecx,%eax
    7cc7:	c1 e0 02             	shl    $0x2,%eax
    7cca:	01 c8                	add    %ecx,%eax
    7ccc:	c1 e0 05             	shl    $0x5,%eax
    7ccf:	01 d0                	add    %edx,%eax
    7cd1:	01 d8                	add    %ebx,%eax
    7cd3:	83 c0 28             	add    $0x28,%eax
    7cd6:	8b 00                	mov    (%eax),%eax
    7cd8:	85 c0                	test   %eax,%eax
    7cda:	74 44                	je     7d20 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    7cdc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7cdf:	8b 45 14             	mov    0x14(%ebp),%eax
    7ce2:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7ce5:	89 c2                	mov    %eax,%edx
    7ce7:	c1 e2 03             	shl    $0x3,%edx
    7cea:	01 c2                	add    %eax,%edx
    7cec:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7cf3:	89 c2                	mov    %eax,%edx
    7cf5:	89 c8                	mov    %ecx,%eax
    7cf7:	c1 e0 02             	shl    $0x2,%eax
    7cfa:	01 c8                	add    %ecx,%eax
    7cfc:	c1 e0 05             	shl    $0x5,%eax
    7cff:	01 d0                	add    %edx,%eax
    7d01:	01 d8                	add    %ebx,%eax
    7d03:	83 c0 2c             	add    $0x2c,%eax
    7d06:	8b 00                	mov    (%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    7d08:	83 f8 02             	cmp    $0x2,%eax
    7d0b:	75 13                	jne    7d20 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    7d0d:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    7d14:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    7d1b:	e9 cc 00 00 00       	jmp    7dec <III_hufman_decode+0x14e>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7d20:	8b 45 1c             	mov    0x1c(%ebp),%eax
    7d23:	8b 00                	mov    (%eax),%eax
    7d25:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    7d28:	8b 75 0c             	mov    0xc(%ebp),%esi
    7d2b:	8b 45 14             	mov    0x14(%ebp),%eax
    7d2e:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7d31:	89 c2                	mov    %eax,%edx
    7d33:	c1 e2 03             	shl    $0x3,%edx
    7d36:	01 c2                	add    %eax,%edx
    7d38:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7d3f:	89 c2                	mov    %eax,%edx
    7d41:	89 d8                	mov    %ebx,%eax
    7d43:	c1 e0 02             	shl    $0x2,%eax
    7d46:	01 d8                	add    %ebx,%eax
    7d48:	c1 e0 05             	shl    $0x5,%eax
    7d4b:	01 d0                	add    %edx,%eax
    7d4d:	01 f0                	add    %esi,%eax
    7d4f:	83 c0 4c             	add    $0x4c,%eax
    7d52:	8b 00                	mov    (%eax),%eax
    7d54:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7d57:	89 c8                	mov    %ecx,%eax
    7d59:	c1 e0 03             	shl    $0x3,%eax
    7d5c:	01 c8                	add    %ecx,%eax
    7d5e:	c1 e0 02             	shl    $0x2,%eax
    7d61:	01 c8                	add    %ecx,%eax
    7d63:	01 d0                	add    %edx,%eax
    7d65:	8b 04 85 e0 ef 00 00 	mov    0xefe0(,%eax,4),%eax
    7d6c:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7d6f:	8b 45 1c             	mov    0x1c(%ebp),%eax
    7d72:	8b 00                	mov    (%eax),%eax
    7d74:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    7d77:	8b 75 0c             	mov    0xc(%ebp),%esi
    7d7a:	8b 45 14             	mov    0x14(%ebp),%eax
    7d7d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7d80:	89 c2                	mov    %eax,%edx
    7d82:	c1 e2 03             	shl    $0x3,%edx
    7d85:	01 c2                	add    %eax,%edx
    7d87:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7d8e:	89 c2                	mov    %eax,%edx
    7d90:	89 d8                	mov    %ebx,%eax
    7d92:	c1 e0 02             	shl    $0x2,%eax
    7d95:	01 d8                	add    %ebx,%eax
    7d97:	c1 e0 05             	shl    $0x5,%eax
    7d9a:	01 d0                	add    %edx,%eax
    7d9c:	01 f0                	add    %esi,%eax
    7d9e:	83 c0 4c             	add    $0x4c,%eax
    7da1:	8b 30                	mov    (%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    7da3:	8b 7d 0c             	mov    0xc(%ebp),%edi
    7da6:	8b 45 14             	mov    0x14(%ebp),%eax
    7da9:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7dac:	89 c2                	mov    %eax,%edx
    7dae:	c1 e2 03             	shl    $0x3,%edx
    7db1:	01 c2                	add    %eax,%edx
    7db3:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7dba:	89 c2                	mov    %eax,%edx
    7dbc:	89 d8                	mov    %ebx,%eax
    7dbe:	c1 e0 02             	shl    $0x2,%eax
    7dc1:	01 d8                	add    %ebx,%eax
    7dc3:	c1 e0 05             	shl    $0x5,%eax
    7dc6:	01 d0                	add    %edx,%eax
    7dc8:	01 f8                	add    %edi,%eax
    7dca:	83 c0 50             	add    $0x50,%eax
    7dcd:	8b 00                	mov    (%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    7dcf:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    7dd1:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7dd4:	89 c8                	mov    %ecx,%eax
    7dd6:	c1 e0 03             	shl    $0x3,%eax
    7dd9:	01 c8                	add    %ecx,%eax
    7ddb:	c1 e0 02             	shl    $0x2,%eax
    7dde:	01 c8                	add    %ecx,%eax
    7de0:	01 d0                	add    %edx,%eax
    7de2:	8b 04 85 e0 ef 00 00 	mov    0xefe0(,%eax,4),%eax
    7de9:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    7dec:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    7df3:	e9 ac 01 00 00       	jmp    7fa4 <III_hufman_decode+0x306>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    7df8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7dfb:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    7dfe:	7d 43                	jge    7e43 <III_hufman_decode+0x1a5>
    7e00:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7e03:	8b 45 14             	mov    0x14(%ebp),%eax
    7e06:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7e09:	89 c2                	mov    %eax,%edx
    7e0b:	c1 e2 03             	shl    $0x3,%edx
    7e0e:	01 c2                	add    %eax,%edx
    7e10:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7e17:	89 c2                	mov    %eax,%edx
    7e19:	89 c8                	mov    %ecx,%eax
    7e1b:	c1 e0 02             	shl    $0x2,%eax
    7e1e:	01 c8                	add    %ecx,%eax
    7e20:	c1 e0 05             	shl    $0x5,%eax
    7e23:	01 d0                	add    %edx,%eax
    7e25:	01 d8                	add    %ebx,%eax
    7e27:	83 c0 34             	add    $0x34,%eax
    7e2a:	8b 10                	mov    (%eax),%edx
    7e2c:	89 d0                	mov    %edx,%eax
    7e2e:	c1 e0 02             	shl    $0x2,%eax
    7e31:	01 d0                	add    %edx,%eax
    7e33:	c1 e0 03             	shl    $0x3,%eax
    7e36:	05 a0 22 01 00       	add    $0x122a0,%eax
    7e3b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    7e3e:	e9 86 00 00 00       	jmp    7ec9 <III_hufman_decode+0x22b>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    7e43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7e46:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    7e49:	7d 40                	jge    7e8b <III_hufman_decode+0x1ed>
    7e4b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7e4e:	8b 45 14             	mov    0x14(%ebp),%eax
    7e51:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7e54:	89 c2                	mov    %eax,%edx
    7e56:	c1 e2 03             	shl    $0x3,%edx
    7e59:	01 c2                	add    %eax,%edx
    7e5b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7e62:	89 c2                	mov    %eax,%edx
    7e64:	89 c8                	mov    %ecx,%eax
    7e66:	c1 e0 02             	shl    $0x2,%eax
    7e69:	01 c8                	add    %ecx,%eax
    7e6b:	c1 e0 05             	shl    $0x5,%eax
    7e6e:	01 d0                	add    %edx,%eax
    7e70:	01 d8                	add    %ebx,%eax
    7e72:	83 c0 38             	add    $0x38,%eax
    7e75:	8b 10                	mov    (%eax),%edx
    7e77:	89 d0                	mov    %edx,%eax
    7e79:	c1 e0 02             	shl    $0x2,%eax
    7e7c:	01 d0                	add    %edx,%eax
    7e7e:	c1 e0 03             	shl    $0x3,%eax
    7e81:	05 a0 22 01 00       	add    $0x122a0,%eax
    7e86:	89 45 e0             	mov    %eax,-0x20(%ebp)
    7e89:	eb 3e                	jmp    7ec9 <III_hufman_decode+0x22b>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    7e8b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7e8e:	8b 45 14             	mov    0x14(%ebp),%eax
    7e91:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7e94:	89 c2                	mov    %eax,%edx
    7e96:	c1 e2 03             	shl    $0x3,%edx
    7e99:	01 c2                	add    %eax,%edx
    7e9b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7ea2:	89 c2                	mov    %eax,%edx
    7ea4:	89 c8                	mov    %ecx,%eax
    7ea6:	c1 e0 02             	shl    $0x2,%eax
    7ea9:	01 c8                	add    %ecx,%eax
    7eab:	c1 e0 05             	shl    $0x5,%eax
    7eae:	01 d0                	add    %edx,%eax
    7eb0:	01 d8                	add    %ebx,%eax
    7eb2:	83 c0 3c             	add    $0x3c,%eax
    7eb5:	8b 10                	mov    (%eax),%edx
    7eb7:	89 d0                	mov    %edx,%eax
    7eb9:	c1 e0 02             	shl    $0x2,%eax
    7ebc:	01 d0                	add    %edx,%eax
    7ebe:	c1 e0 03             	shl    $0x3,%eax
    7ec1:	05 a0 22 01 00       	add    $0x122a0,%eax
    7ec6:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    7ec9:	8d 45 c8             	lea    -0x38(%ebp),%eax
    7ecc:	89 44 24 10          	mov    %eax,0x10(%esp)
    7ed0:	8d 45 cc             	lea    -0x34(%ebp),%eax
    7ed3:	89 44 24 0c          	mov    %eax,0xc(%esp)
    7ed7:	8d 45 d0             	lea    -0x30(%ebp),%eax
    7eda:	89 44 24 08          	mov    %eax,0x8(%esp)
    7ede:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    7ee1:	89 44 24 04          	mov    %eax,0x4(%esp)
    7ee5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7ee8:	89 04 24             	mov    %eax,(%esp)
    7eeb:	e8 fd ee ff ff       	call   6ded <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = x;
    7ef0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7ef3:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7ef8:	89 c8                	mov    %ecx,%eax
    7efa:	f7 ea                	imul   %edx
    7efc:	c1 fa 02             	sar    $0x2,%edx
    7eff:	89 c8                	mov    %ecx,%eax
    7f01:	c1 f8 1f             	sar    $0x1f,%eax
    7f04:	29 c2                	sub    %eax,%edx
    7f06:	89 d0                	mov    %edx,%eax
    7f08:	89 c2                	mov    %eax,%edx
    7f0a:	89 d0                	mov    %edx,%eax
    7f0c:	c1 e0 03             	shl    $0x3,%eax
    7f0f:	01 d0                	add    %edx,%eax
    7f11:	c1 e0 03             	shl    $0x3,%eax
    7f14:	89 c2                	mov    %eax,%edx
    7f16:	8b 45 08             	mov    0x8(%ebp),%eax
    7f19:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7f1c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7f1f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7f24:	89 c8                	mov    %ecx,%eax
    7f26:	f7 ea                	imul   %edx
    7f28:	c1 fa 02             	sar    $0x2,%edx
    7f2b:	89 c8                	mov    %ecx,%eax
    7f2d:	c1 f8 1f             	sar    $0x1f,%eax
    7f30:	29 c2                	sub    %eax,%edx
    7f32:	89 d0                	mov    %edx,%eax
    7f34:	c1 e0 03             	shl    $0x3,%eax
    7f37:	01 d0                	add    %edx,%eax
    7f39:	01 c0                	add    %eax,%eax
    7f3b:	29 c1                	sub    %eax,%ecx
    7f3d:	89 ca                	mov    %ecx,%edx
    7f3f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7f42:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    7f45:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7f48:	8d 48 01             	lea    0x1(%eax),%ecx
    7f4b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7f50:	89 c8                	mov    %ecx,%eax
    7f52:	f7 ea                	imul   %edx
    7f54:	c1 fa 02             	sar    $0x2,%edx
    7f57:	89 c8                	mov    %ecx,%eax
    7f59:	c1 f8 1f             	sar    $0x1f,%eax
    7f5c:	29 c2                	sub    %eax,%edx
    7f5e:	89 d0                	mov    %edx,%eax
    7f60:	89 c2                	mov    %eax,%edx
    7f62:	89 d0                	mov    %edx,%eax
    7f64:	c1 e0 03             	shl    $0x3,%eax
    7f67:	01 d0                	add    %edx,%eax
    7f69:	c1 e0 03             	shl    $0x3,%eax
    7f6c:	89 c2                	mov    %eax,%edx
    7f6e:	8b 45 08             	mov    0x8(%ebp),%eax
    7f71:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7f74:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7f77:	8d 48 01             	lea    0x1(%eax),%ecx
    7f7a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7f7f:	89 c8                	mov    %ecx,%eax
    7f81:	f7 ea                	imul   %edx
    7f83:	c1 fa 02             	sar    $0x2,%edx
    7f86:	89 c8                	mov    %ecx,%eax
    7f88:	c1 f8 1f             	sar    $0x1f,%eax
    7f8b:	29 c2                	sub    %eax,%edx
    7f8d:	89 d0                	mov    %edx,%eax
    7f8f:	c1 e0 03             	shl    $0x3,%eax
    7f92:	01 d0                	add    %edx,%eax
    7f94:	01 c0                	add    %eax,%eax
    7f96:	29 c1                	sub    %eax,%ecx
    7f98:	89 ca                	mov    %ecx,%edx
    7f9a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7f9d:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    7fa0:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    7fa4:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    7fa7:	8b 75 0c             	mov    0xc(%ebp),%esi
    7faa:	8b 45 14             	mov    0x14(%ebp),%eax
    7fad:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7fb0:	89 c2                	mov    %eax,%edx
    7fb2:	c1 e2 03             	shl    $0x3,%edx
    7fb5:	01 c2                	add    %eax,%edx
    7fb7:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7fbe:	89 c2                	mov    %eax,%edx
    7fc0:	89 c8                	mov    %ecx,%eax
    7fc2:	c1 e0 02             	shl    $0x2,%eax
    7fc5:	01 c8                	add    %ecx,%eax
    7fc7:	c1 e0 05             	shl    $0x5,%eax
    7fca:	01 d0                	add    %edx,%eax
    7fcc:	01 f0                	add    %esi,%eax
    7fce:	83 c0 1c             	add    $0x1c,%eax
    7fd1:	8b 00                	mov    (%eax),%eax
    7fd3:	01 c0                	add    %eax,%eax
    7fd5:	39 c3                	cmp    %eax,%ebx
    7fd7:	0f 82 1b fe ff ff    	jb     7df8 <III_hufman_decode+0x15a>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    7fdd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7fe0:	8b 45 14             	mov    0x14(%ebp),%eax
    7fe3:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7fe6:	89 c2                	mov    %eax,%edx
    7fe8:	c1 e2 03             	shl    $0x3,%edx
    7feb:	01 c2                	add    %eax,%edx
    7fed:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7ff4:	89 c2                	mov    %eax,%edx
    7ff6:	89 c8                	mov    %ecx,%eax
    7ff8:	c1 e0 02             	shl    $0x2,%eax
    7ffb:	01 c8                	add    %ecx,%eax
    7ffd:	c1 e0 05             	shl    $0x5,%eax
    8000:	01 d0                	add    %edx,%eax
    8002:	01 d8                	add    %ebx,%eax
    8004:	83 c0 5c             	add    $0x5c,%eax
    8007:	8b 00                	mov    (%eax),%eax
    8009:	8d 50 20             	lea    0x20(%eax),%edx
    800c:	89 d0                	mov    %edx,%eax
    800e:	c1 e0 02             	shl    $0x2,%eax
    8011:	01 d0                	add    %edx,%eax
    8013:	c1 e0 03             	shl    $0x3,%eax
    8016:	05 a0 22 01 00       	add    $0x122a0,%eax
    801b:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    801e:	e9 91 01 00 00       	jmp    81b4 <III_hufman_decode+0x516>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    8023:	8d 45 c8             	lea    -0x38(%ebp),%eax
    8026:	89 44 24 10          	mov    %eax,0x10(%esp)
    802a:	8d 45 cc             	lea    -0x34(%ebp),%eax
    802d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    8031:	8d 45 d0             	lea    -0x30(%ebp),%eax
    8034:	89 44 24 08          	mov    %eax,0x8(%esp)
    8038:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    803b:	89 44 24 04          	mov    %eax,0x4(%esp)
    803f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8042:	89 04 24             	mov    %eax,(%esp)
    8045:	e8 a3 ed ff ff       	call   6ded <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = v;
    804a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    804d:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8052:	89 c8                	mov    %ecx,%eax
    8054:	f7 ea                	imul   %edx
    8056:	c1 fa 02             	sar    $0x2,%edx
    8059:	89 c8                	mov    %ecx,%eax
    805b:	c1 f8 1f             	sar    $0x1f,%eax
    805e:	29 c2                	sub    %eax,%edx
    8060:	89 d0                	mov    %edx,%eax
    8062:	89 c2                	mov    %eax,%edx
    8064:	89 d0                	mov    %edx,%eax
    8066:	c1 e0 03             	shl    $0x3,%eax
    8069:	01 d0                	add    %edx,%eax
    806b:	c1 e0 03             	shl    $0x3,%eax
    806e:	89 c2                	mov    %eax,%edx
    8070:	8b 45 08             	mov    0x8(%ebp),%eax
    8073:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8076:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8079:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    807e:	89 c8                	mov    %ecx,%eax
    8080:	f7 ea                	imul   %edx
    8082:	c1 fa 02             	sar    $0x2,%edx
    8085:	89 c8                	mov    %ecx,%eax
    8087:	c1 f8 1f             	sar    $0x1f,%eax
    808a:	29 c2                	sub    %eax,%edx
    808c:	89 d0                	mov    %edx,%eax
    808e:	c1 e0 03             	shl    $0x3,%eax
    8091:	01 d0                	add    %edx,%eax
    8093:	01 c0                	add    %eax,%eax
    8095:	29 c1                	sub    %eax,%ecx
    8097:	89 ca                	mov    %ecx,%edx
    8099:	8b 45 cc             	mov    -0x34(%ebp),%eax
    809c:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    809f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    80a2:	8d 48 01             	lea    0x1(%eax),%ecx
    80a5:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    80aa:	89 c8                	mov    %ecx,%eax
    80ac:	f7 ea                	imul   %edx
    80ae:	c1 fa 02             	sar    $0x2,%edx
    80b1:	89 c8                	mov    %ecx,%eax
    80b3:	c1 f8 1f             	sar    $0x1f,%eax
    80b6:	29 c2                	sub    %eax,%edx
    80b8:	89 d0                	mov    %edx,%eax
    80ba:	89 c2                	mov    %eax,%edx
    80bc:	89 d0                	mov    %edx,%eax
    80be:	c1 e0 03             	shl    $0x3,%eax
    80c1:	01 d0                	add    %edx,%eax
    80c3:	c1 e0 03             	shl    $0x3,%eax
    80c6:	89 c2                	mov    %eax,%edx
    80c8:	8b 45 08             	mov    0x8(%ebp),%eax
    80cb:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    80ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    80d1:	8d 48 01             	lea    0x1(%eax),%ecx
    80d4:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    80d9:	89 c8                	mov    %ecx,%eax
    80db:	f7 ea                	imul   %edx
    80dd:	c1 fa 02             	sar    $0x2,%edx
    80e0:	89 c8                	mov    %ecx,%eax
    80e2:	c1 f8 1f             	sar    $0x1f,%eax
    80e5:	29 c2                	sub    %eax,%edx
    80e7:	89 d0                	mov    %edx,%eax
    80e9:	c1 e0 03             	shl    $0x3,%eax
    80ec:	01 d0                	add    %edx,%eax
    80ee:	01 c0                	add    %eax,%eax
    80f0:	29 c1                	sub    %eax,%ecx
    80f2:	89 ca                	mov    %ecx,%edx
    80f4:	8b 45 c8             	mov    -0x38(%ebp),%eax
    80f7:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    80fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    80fd:	8d 48 02             	lea    0x2(%eax),%ecx
    8100:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8105:	89 c8                	mov    %ecx,%eax
    8107:	f7 ea                	imul   %edx
    8109:	c1 fa 02             	sar    $0x2,%edx
    810c:	89 c8                	mov    %ecx,%eax
    810e:	c1 f8 1f             	sar    $0x1f,%eax
    8111:	29 c2                	sub    %eax,%edx
    8113:	89 d0                	mov    %edx,%eax
    8115:	89 c2                	mov    %eax,%edx
    8117:	89 d0                	mov    %edx,%eax
    8119:	c1 e0 03             	shl    $0x3,%eax
    811c:	01 d0                	add    %edx,%eax
    811e:	c1 e0 03             	shl    $0x3,%eax
    8121:	89 c2                	mov    %eax,%edx
    8123:	8b 45 08             	mov    0x8(%ebp),%eax
    8126:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8129:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    812c:	8d 48 02             	lea    0x2(%eax),%ecx
    812f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8134:	89 c8                	mov    %ecx,%eax
    8136:	f7 ea                	imul   %edx
    8138:	c1 fa 02             	sar    $0x2,%edx
    813b:	89 c8                	mov    %ecx,%eax
    813d:	c1 f8 1f             	sar    $0x1f,%eax
    8140:	29 c2                	sub    %eax,%edx
    8142:	89 d0                	mov    %edx,%eax
    8144:	c1 e0 03             	shl    $0x3,%eax
    8147:	01 d0                	add    %edx,%eax
    8149:	01 c0                	add    %eax,%eax
    814b:	29 c1                	sub    %eax,%ecx
    814d:	89 ca                	mov    %ecx,%edx
    814f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8152:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    8155:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8158:	8d 48 03             	lea    0x3(%eax),%ecx
    815b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8160:	89 c8                	mov    %ecx,%eax
    8162:	f7 ea                	imul   %edx
    8164:	c1 fa 02             	sar    $0x2,%edx
    8167:	89 c8                	mov    %ecx,%eax
    8169:	c1 f8 1f             	sar    $0x1f,%eax
    816c:	29 c2                	sub    %eax,%edx
    816e:	89 d0                	mov    %edx,%eax
    8170:	89 c2                	mov    %eax,%edx
    8172:	89 d0                	mov    %edx,%eax
    8174:	c1 e0 03             	shl    $0x3,%eax
    8177:	01 d0                	add    %edx,%eax
    8179:	c1 e0 03             	shl    $0x3,%eax
    817c:	89 c2                	mov    %eax,%edx
    817e:	8b 45 08             	mov    0x8(%ebp),%eax
    8181:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8184:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8187:	8d 48 03             	lea    0x3(%eax),%ecx
    818a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    818f:	89 c8                	mov    %ecx,%eax
    8191:	f7 ea                	imul   %edx
    8193:	c1 fa 02             	sar    $0x2,%edx
    8196:	89 c8                	mov    %ecx,%eax
    8198:	c1 f8 1f             	sar    $0x1f,%eax
    819b:	29 c2                	sub    %eax,%edx
    819d:	89 d0                	mov    %edx,%eax
    819f:	c1 e0 03             	shl    $0x3,%eax
    81a2:	01 d0                	add    %edx,%eax
    81a4:	01 c0                	add    %eax,%eax
    81a6:	29 c1                	sub    %eax,%ecx
    81a8:	89 ca                	mov    %ecx,%edx
    81aa:	8b 45 d0             	mov    -0x30(%ebp),%eax
    81ad:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    81b0:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    81b4:	e8 5b d3 ff ff       	call   5514 <hsstell>
    81b9:	89 c3                	mov    %eax,%ebx
    81bb:	8b 75 0c             	mov    0xc(%ebp),%esi
    81be:	8b 45 14             	mov    0x14(%ebp),%eax
    81c1:	8b 4d 10             	mov    0x10(%ebp),%ecx
    81c4:	89 c2                	mov    %eax,%edx
    81c6:	c1 e2 03             	shl    $0x3,%edx
    81c9:	01 c2                	add    %eax,%edx
    81cb:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    81d2:	89 c2                	mov    %eax,%edx
    81d4:	89 c8                	mov    %ecx,%eax
    81d6:	c1 e0 02             	shl    $0x2,%eax
    81d9:	01 c8                	add    %ecx,%eax
    81db:	c1 e0 05             	shl    $0x5,%eax
    81de:	01 d0                	add    %edx,%eax
    81e0:	01 f0                	add    %esi,%eax
    81e2:	83 c0 18             	add    $0x18,%eax
    81e5:	8b 10                	mov    (%eax),%edx
    81e7:	8b 45 18             	mov    0x18(%ebp),%eax
    81ea:	01 d0                	add    %edx,%eax
    81ec:	39 c3                	cmp    %eax,%ebx
    81ee:	73 0d                	jae    81fd <III_hufman_decode+0x55f>
    81f0:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    81f7:	0f 8e 26 fe ff ff    	jle    8023 <III_hufman_decode+0x385>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    81fd:	e8 12 d3 ff ff       	call   5514 <hsstell>
    8202:	89 c3                	mov    %eax,%ebx
    8204:	8b 75 0c             	mov    0xc(%ebp),%esi
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
    8229:	01 f0                	add    %esi,%eax
    822b:	83 c0 18             	add    $0x18,%eax
    822e:	8b 10                	mov    (%eax),%edx
    8230:	8b 45 18             	mov    0x18(%ebp),%eax
    8233:	01 d0                	add    %edx,%eax
    8235:	39 c3                	cmp    %eax,%ebx
    8237:	76 48                	jbe    8281 <III_hufman_decode+0x5e3>
   {  i -=4;
    8239:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    823d:	e8 d2 d2 ff ff       	call   5514 <hsstell>
    8242:	8b 55 18             	mov    0x18(%ebp),%edx
    8245:	29 d0                	sub    %edx,%eax
    8247:	89 c6                	mov    %eax,%esi
    8249:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    824c:	8b 45 14             	mov    0x14(%ebp),%eax
    824f:	8b 4d 10             	mov    0x10(%ebp),%ecx
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
    826e:	01 d8                	add    %ebx,%eax
    8270:	83 c0 18             	add    $0x18,%eax
    8273:	8b 00                	mov    (%eax),%eax
    8275:	29 c6                	sub    %eax,%esi
    8277:	89 f0                	mov    %esi,%eax
    8279:	89 04 24             	mov    %eax,(%esp)
    827c:	e8 de d2 ff ff       	call   555f <rewindNbits>
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    8281:	e8 8e d2 ff ff       	call   5514 <hsstell>
    8286:	89 c3                	mov    %eax,%ebx
    8288:	8b 75 0c             	mov    0xc(%ebp),%esi
    828b:	8b 45 14             	mov    0x14(%ebp),%eax
    828e:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8291:	89 c2                	mov    %eax,%edx
    8293:	c1 e2 03             	shl    $0x3,%edx
    8296:	01 c2                	add    %eax,%edx
    8298:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    829f:	89 c2                	mov    %eax,%edx
    82a1:	89 c8                	mov    %ecx,%eax
    82a3:	c1 e0 02             	shl    $0x2,%eax
    82a6:	01 c8                	add    %ecx,%eax
    82a8:	c1 e0 05             	shl    $0x5,%eax
    82ab:	01 d0                	add    %edx,%eax
    82ad:	01 f0                	add    %esi,%eax
    82af:	83 c0 18             	add    $0x18,%eax
    82b2:	8b 10                	mov    (%eax),%edx
    82b4:	8b 45 18             	mov    0x18(%ebp),%eax
    82b7:	01 d0                	add    %edx,%eax
    82b9:	39 c3                	cmp    %eax,%ebx
    82bb:	73 45                	jae    8302 <III_hufman_decode+0x664>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    82bd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    82c0:	8b 45 14             	mov    0x14(%ebp),%eax
    82c3:	8b 4d 10             	mov    0x10(%ebp),%ecx
    82c6:	89 c2                	mov    %eax,%edx
    82c8:	c1 e2 03             	shl    $0x3,%edx
    82cb:	01 c2                	add    %eax,%edx
    82cd:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    82d4:	89 c2                	mov    %eax,%edx
    82d6:	89 c8                	mov    %ecx,%eax
    82d8:	c1 e0 02             	shl    $0x2,%eax
    82db:	01 c8                	add    %ecx,%eax
    82dd:	c1 e0 05             	shl    $0x5,%eax
    82e0:	01 d0                	add    %edx,%eax
    82e2:	01 d8                	add    %ebx,%eax
    82e4:	83 c0 18             	add    $0x18,%eax
    82e7:	8b 10                	mov    (%eax),%edx
    82e9:	8b 45 18             	mov    0x18(%ebp),%eax
    82ec:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    82ef:	e8 20 d2 ff ff       	call   5514 <hsstell>
    82f4:	29 c3                	sub    %eax,%ebx
    82f6:	89 d8                	mov    %ebx,%eax
    82f8:	89 04 24             	mov    %eax,(%esp)
    82fb:	e8 30 d2 ff ff       	call   5530 <hgetbits>

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    8300:	eb 5c                	jmp    835e <III_hufman_decode+0x6c0>
    8302:	eb 5a                	jmp    835e <III_hufman_decode+0x6c0>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    8304:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8307:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    830c:	89 c8                	mov    %ecx,%eax
    830e:	f7 ea                	imul   %edx
    8310:	c1 fa 02             	sar    $0x2,%edx
    8313:	89 c8                	mov    %ecx,%eax
    8315:	c1 f8 1f             	sar    $0x1f,%eax
    8318:	29 c2                	sub    %eax,%edx
    831a:	89 d0                	mov    %edx,%eax
    831c:	89 c2                	mov    %eax,%edx
    831e:	89 d0                	mov    %edx,%eax
    8320:	c1 e0 03             	shl    $0x3,%eax
    8323:	01 d0                	add    %edx,%eax
    8325:	c1 e0 03             	shl    $0x3,%eax
    8328:	89 c2                	mov    %eax,%edx
    832a:	8b 45 08             	mov    0x8(%ebp),%eax
    832d:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8330:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    8333:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8338:	89 c8                	mov    %ecx,%eax
    833a:	f7 ea                	imul   %edx
    833c:	c1 fa 02             	sar    $0x2,%edx
    833f:	89 c8                	mov    %ecx,%eax
    8341:	c1 f8 1f             	sar    $0x1f,%eax
    8344:	29 c2                	sub    %eax,%edx
    8346:	89 d0                	mov    %edx,%eax
    8348:	c1 e0 03             	shl    $0x3,%eax
    834b:	01 d0                	add    %edx,%eax
    834d:	01 c0                	add    %eax,%eax
    834f:	29 c1                	sub    %eax,%ecx
    8351:	89 ca                	mov    %ecx,%edx
    8353:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    835a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    835e:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    8365:	7e 9d                	jle    8304 <III_hufman_decode+0x666>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    8367:	83 c4 4c             	add    $0x4c,%esp
    836a:	5b                   	pop    %ebx
    836b:	5e                   	pop    %esi
    836c:	5f                   	pop    %edi
    836d:	5d                   	pop    %ebp
    836e:	c3                   	ret    

0000836f <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    836f:	55                   	push   %ebp
    8370:	89 e5                	mov    %esp,%ebp
    8372:	56                   	push   %esi
    8373:	53                   	push   %ebx
    8374:	83 ec 50             	sub    $0x50,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    8377:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    837e:	8b 45 1c             	mov    0x1c(%ebp),%eax
    8381:	8b 00                	mov    (%eax),%eax
    8383:	8b 40 10             	mov    0x10(%eax),%eax
    8386:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    8389:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    8390:	8b 45 14             	mov    0x14(%ebp),%eax
    8393:	8b 40 10             	mov    0x10(%eax),%eax
    8396:	85 c0                	test   %eax,%eax
    8398:	74 61                	je     83fb <III_dequantize_sample+0x8c>
    839a:	8b 45 14             	mov    0x14(%ebp),%eax
    839d:	8b 40 14             	mov    0x14(%eax),%eax
    83a0:	83 f8 02             	cmp    $0x2,%eax
    83a3:	75 56                	jne    83fb <III_dequantize_sample+0x8c>
		if (gr_info->mixed_block_flag)
    83a5:	8b 45 14             	mov    0x14(%ebp),%eax
    83a8:	8b 40 18             	mov    0x18(%eax),%eax
    83ab:	85 c0                	test   %eax,%eax
    83ad:	74 15                	je     83c4 <III_dequantize_sample+0x55>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    83af:	8b 45 dc             	mov    -0x24(%ebp),%eax
    83b2:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    83b8:	05 e4 ef 00 00       	add    $0xefe4,%eax
    83bd:	8b 00                	mov    (%eax),%eax
    83bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    83c2:	eb 4a                	jmp    840e <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    83c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    83c7:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    83cd:	05 34 f0 00 00       	add    $0xf034,%eax
    83d2:	8b 50 0c             	mov    0xc(%eax),%edx
    83d5:	89 d0                	mov    %edx,%eax
    83d7:	01 c0                	add    %eax,%eax
    83d9:	01 d0                	add    %edx,%eax
    83db:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    83de:	8b 45 dc             	mov    -0x24(%ebp),%eax
    83e1:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    83e7:	05 34 f0 00 00       	add    $0xf034,%eax
    83ec:	8b 40 0c             	mov    0xc(%eax),%eax
    83ef:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    83f2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    83f9:	eb 13                	jmp    840e <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    83fb:	8b 45 dc             	mov    -0x24(%ebp),%eax
    83fe:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8404:	05 e4 ef 00 00       	add    $0xefe4,%eax
    8409:	8b 00                	mov    (%eax),%eax
    840b:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    840e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8415:	e9 3d 06 00 00       	jmp    8a57 <III_dequantize_sample+0x6e8>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    841a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8421:	e9 23 06 00 00       	jmp    8a49 <III_dequantize_sample+0x6da>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    8426:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8429:	89 d0                	mov    %edx,%eax
    842b:	c1 e0 03             	shl    $0x3,%eax
    842e:	01 d0                	add    %edx,%eax
    8430:	01 c0                	add    %eax,%eax
    8432:	89 c2                	mov    %eax,%edx
    8434:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8437:	01 d0                	add    %edx,%eax
    8439:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    843c:	0f 85 9e 02 00 00    	jne    86e0 <III_dequantize_sample+0x371>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    8442:	8b 45 14             	mov    0x14(%ebp),%eax
    8445:	8b 40 10             	mov    0x10(%eax),%eax
    8448:	85 c0                	test   %eax,%eax
    844a:	0f 84 6b 02 00 00    	je     86bb <III_dequantize_sample+0x34c>
    8450:	8b 45 14             	mov    0x14(%ebp),%eax
    8453:	8b 40 14             	mov    0x14(%eax),%eax
    8456:	83 f8 02             	cmp    $0x2,%eax
    8459:	0f 85 5c 02 00 00    	jne    86bb <III_dequantize_sample+0x34c>
					if (gr_info->mixed_block_flag) {
    845f:	8b 45 14             	mov    0x14(%ebp),%eax
    8462:	8b 40 18             	mov    0x18(%eax),%eax
    8465:	85 c0                	test   %eax,%eax
    8467:	0f 84 af 01 00 00    	je     861c <III_dequantize_sample+0x2ad>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    846d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8470:	89 d0                	mov    %edx,%eax
    8472:	c1 e0 03             	shl    $0x3,%eax
    8475:	01 d0                	add    %edx,%eax
    8477:	01 c0                	add    %eax,%eax
    8479:	89 c2                	mov    %eax,%edx
    847b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    847e:	01 c2                	add    %eax,%edx
    8480:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8483:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8489:	05 00 f0 00 00       	add    $0xf000,%eax
    848e:	8b 00                	mov    (%eax),%eax
    8490:	39 c2                	cmp    %eax,%edx
    8492:	0f 85 93 00 00 00    	jne    852b <III_dequantize_sample+0x1bc>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    8498:	8b 45 dc             	mov    -0x24(%ebp),%eax
    849b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    84a1:	05 40 f0 00 00       	add    $0xf040,%eax
    84a6:	8b 50 0c             	mov    0xc(%eax),%edx
    84a9:	89 d0                	mov    %edx,%eax
    84ab:	01 c0                	add    %eax,%eax
    84ad:	01 d0                	add    %edx,%eax
    84af:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    84b2:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    84b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    84bc:	8d 48 01             	lea    0x1(%eax),%ecx
    84bf:	8b 55 dc             	mov    -0x24(%ebp),%edx
    84c2:	89 d0                	mov    %edx,%eax
    84c4:	c1 e0 03             	shl    $0x3,%eax
    84c7:	01 d0                	add    %edx,%eax
    84c9:	c1 e0 02             	shl    $0x2,%eax
    84cc:	01 d0                	add    %edx,%eax
    84ce:	01 c8                	add    %ecx,%eax
    84d0:	83 c0 14             	add    $0x14,%eax
    84d3:	8b 0c 85 ec ef 00 00 	mov    0xefec(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    84da:	8b 55 dc             	mov    -0x24(%ebp),%edx
    84dd:	89 d0                	mov    %edx,%eax
    84df:	c1 e0 03             	shl    $0x3,%eax
    84e2:	01 d0                	add    %edx,%eax
    84e4:	c1 e0 02             	shl    $0x2,%eax
    84e7:	01 d0                	add    %edx,%eax
    84e9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    84ec:	01 d0                	add    %edx,%eax
    84ee:	83 c0 14             	add    $0x14,%eax
    84f1:	8b 04 85 ec ef 00 00 	mov    0xefec(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    84f8:	29 c1                	sub    %eax,%ecx
    84fa:	89 c8                	mov    %ecx,%eax
    84fc:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    84ff:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8502:	89 d0                	mov    %edx,%eax
    8504:	c1 e0 03             	shl    $0x3,%eax
    8507:	01 d0                	add    %edx,%eax
    8509:	c1 e0 02             	shl    $0x2,%eax
    850c:	01 d0                	add    %edx,%eax
    850e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8511:	01 d0                	add    %edx,%eax
    8513:	83 c0 14             	add    $0x14,%eax
    8516:	8b 14 85 ec ef 00 00 	mov    0xefec(,%eax,4),%edx
    851d:	89 d0                	mov    %edx,%eax
    851f:	01 c0                	add    %eax,%eax
    8521:	01 d0                	add    %edx,%eax
    8523:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    8526:	e9 8e 01 00 00       	jmp    86b9 <III_dequantize_sample+0x34a>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    852b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    852e:	89 d0                	mov    %edx,%eax
    8530:	c1 e0 03             	shl    $0x3,%eax
    8533:	01 d0                	add    %edx,%eax
    8535:	01 c0                	add    %eax,%eax
    8537:	89 c2                	mov    %eax,%edx
    8539:	8b 45 f4             	mov    -0xc(%ebp),%eax
    853c:	01 c2                	add    %eax,%edx
    853e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8541:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8547:	05 00 f0 00 00       	add    $0xf000,%eax
    854c:	8b 00                	mov    (%eax),%eax
    854e:	39 c2                	cmp    %eax,%edx
    8550:	7d 2a                	jge    857c <III_dequantize_sample+0x20d>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    8552:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8556:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8559:	8d 48 01             	lea    0x1(%eax),%ecx
    855c:	8b 55 dc             	mov    -0x24(%ebp),%edx
    855f:	89 d0                	mov    %edx,%eax
    8561:	c1 e0 03             	shl    $0x3,%eax
    8564:	01 d0                	add    %edx,%eax
    8566:	c1 e0 02             	shl    $0x2,%eax
    8569:	01 d0                	add    %edx,%eax
    856b:	01 c8                	add    %ecx,%eax
    856d:	8b 04 85 e0 ef 00 00 	mov    0xefe0(,%eax,4),%eax
    8574:	89 45 e8             	mov    %eax,-0x18(%ebp)
    8577:	e9 3d 01 00 00       	jmp    86b9 <III_dequantize_sample+0x34a>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    857c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8580:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8583:	8d 48 01             	lea    0x1(%eax),%ecx
    8586:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8589:	89 d0                	mov    %edx,%eax
    858b:	c1 e0 03             	shl    $0x3,%eax
    858e:	01 d0                	add    %edx,%eax
    8590:	c1 e0 02             	shl    $0x2,%eax
    8593:	01 d0                	add    %edx,%eax
    8595:	01 c8                	add    %ecx,%eax
    8597:	83 c0 14             	add    $0x14,%eax
    859a:	8b 14 85 ec ef 00 00 	mov    0xefec(,%eax,4),%edx
    85a1:	89 d0                	mov    %edx,%eax
    85a3:	01 c0                	add    %eax,%eax
    85a5:	01 d0                	add    %edx,%eax
    85a7:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    85aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    85ad:	8d 48 01             	lea    0x1(%eax),%ecx
    85b0:	8b 55 dc             	mov    -0x24(%ebp),%edx
    85b3:	89 d0                	mov    %edx,%eax
    85b5:	c1 e0 03             	shl    $0x3,%eax
    85b8:	01 d0                	add    %edx,%eax
    85ba:	c1 e0 02             	shl    $0x2,%eax
    85bd:	01 d0                	add    %edx,%eax
    85bf:	01 c8                	add    %ecx,%eax
    85c1:	83 c0 14             	add    $0x14,%eax
    85c4:	8b 0c 85 ec ef 00 00 	mov    0xefec(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    85cb:	8b 55 dc             	mov    -0x24(%ebp),%edx
    85ce:	89 d0                	mov    %edx,%eax
    85d0:	c1 e0 03             	shl    $0x3,%eax
    85d3:	01 d0                	add    %edx,%eax
    85d5:	c1 e0 02             	shl    $0x2,%eax
    85d8:	01 d0                	add    %edx,%eax
    85da:	8b 55 ec             	mov    -0x14(%ebp),%edx
    85dd:	01 d0                	add    %edx,%eax
    85df:	83 c0 14             	add    $0x14,%eax
    85e2:	8b 04 85 ec ef 00 00 	mov    0xefec(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    85e9:	29 c1                	sub    %eax,%ecx
    85eb:	89 c8                	mov    %ecx,%eax
    85ed:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    85f0:	8b 55 dc             	mov    -0x24(%ebp),%edx
    85f3:	89 d0                	mov    %edx,%eax
    85f5:	c1 e0 03             	shl    $0x3,%eax
    85f8:	01 d0                	add    %edx,%eax
    85fa:	c1 e0 02             	shl    $0x2,%eax
    85fd:	01 d0                	add    %edx,%eax
    85ff:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8602:	01 d0                	add    %edx,%eax
    8604:	83 c0 14             	add    $0x14,%eax
    8607:	8b 14 85 ec ef 00 00 	mov    0xefec(,%eax,4),%edx
    860e:	89 d0                	mov    %edx,%eax
    8610:	01 c0                	add    %eax,%eax
    8612:	01 d0                	add    %edx,%eax
    8614:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    8617:	e9 c4 00 00 00       	jmp    86e0 <III_dequantize_sample+0x371>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    861c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8620:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8623:	8d 48 01             	lea    0x1(%eax),%ecx
    8626:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8629:	89 d0                	mov    %edx,%eax
    862b:	c1 e0 03             	shl    $0x3,%eax
    862e:	01 d0                	add    %edx,%eax
    8630:	c1 e0 02             	shl    $0x2,%eax
    8633:	01 d0                	add    %edx,%eax
    8635:	01 c8                	add    %ecx,%eax
    8637:	83 c0 14             	add    $0x14,%eax
    863a:	8b 14 85 ec ef 00 00 	mov    0xefec(,%eax,4),%edx
    8641:	89 d0                	mov    %edx,%eax
    8643:	01 c0                	add    %eax,%eax
    8645:	01 d0                	add    %edx,%eax
    8647:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    864a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    864d:	8d 48 01             	lea    0x1(%eax),%ecx
    8650:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8653:	89 d0                	mov    %edx,%eax
    8655:	c1 e0 03             	shl    $0x3,%eax
    8658:	01 d0                	add    %edx,%eax
    865a:	c1 e0 02             	shl    $0x2,%eax
    865d:	01 d0                	add    %edx,%eax
    865f:	01 c8                	add    %ecx,%eax
    8661:	83 c0 14             	add    $0x14,%eax
    8664:	8b 0c 85 ec ef 00 00 	mov    0xefec(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    866b:	8b 55 dc             	mov    -0x24(%ebp),%edx
    866e:	89 d0                	mov    %edx,%eax
    8670:	c1 e0 03             	shl    $0x3,%eax
    8673:	01 d0                	add    %edx,%eax
    8675:	c1 e0 02             	shl    $0x2,%eax
    8678:	01 d0                	add    %edx,%eax
    867a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    867d:	01 d0                	add    %edx,%eax
    867f:	83 c0 14             	add    $0x14,%eax
    8682:	8b 04 85 ec ef 00 00 	mov    0xefec(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    8689:	29 c1                	sub    %eax,%ecx
    868b:	89 c8                	mov    %ecx,%eax
    868d:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    8690:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8693:	89 d0                	mov    %edx,%eax
    8695:	c1 e0 03             	shl    $0x3,%eax
    8698:	01 d0                	add    %edx,%eax
    869a:	c1 e0 02             	shl    $0x2,%eax
    869d:	01 d0                	add    %edx,%eax
    869f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    86a2:	01 d0                	add    %edx,%eax
    86a4:	83 c0 14             	add    $0x14,%eax
    86a7:	8b 14 85 ec ef 00 00 	mov    0xefec(,%eax,4),%edx
    86ae:	89 d0                	mov    %edx,%eax
    86b0:	01 c0                	add    %eax,%eax
    86b2:	01 d0                	add    %edx,%eax
    86b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    86b7:	eb 27                	jmp    86e0 <III_dequantize_sample+0x371>
    86b9:	eb 25                	jmp    86e0 <III_dequantize_sample+0x371>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    86bb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    86bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    86c2:	8d 48 01             	lea    0x1(%eax),%ecx
    86c5:	8b 55 dc             	mov    -0x24(%ebp),%edx
    86c8:	89 d0                	mov    %edx,%eax
    86ca:	c1 e0 03             	shl    $0x3,%eax
    86cd:	01 d0                	add    %edx,%eax
    86cf:	c1 e0 02             	shl    $0x2,%eax
    86d2:	01 d0                	add    %edx,%eax
    86d4:	01 c8                	add    %ecx,%eax
    86d6:	8b 04 85 e0 ef 00 00 	mov    0xefe0(,%eax,4),%eax
    86dd:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    86e0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    86e3:	89 d0                	mov    %edx,%eax
    86e5:	c1 e0 03             	shl    $0x3,%eax
    86e8:	01 d0                	add    %edx,%eax
    86ea:	c1 e0 04             	shl    $0x4,%eax
    86ed:	89 c2                	mov    %eax,%edx
    86ef:	8b 45 0c             	mov    0xc(%ebp),%eax
    86f2:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    86f5:	8b 45 14             	mov    0x14(%ebp),%eax
    86f8:	8b 40 08             	mov    0x8(%eax),%eax
    86fb:	ba 00 00 00 00       	mov    $0x0,%edx
    8700:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8703:	89 55 cc             	mov    %edx,-0x34(%ebp)
    8706:	df 6d c8             	fildll -0x38(%ebp)
    8709:	dd 05 10 d7 00 00    	fldl   0xd710
    870f:	de e9                	fsubrp %st,%st(1)
    8711:	dd 05 18 d7 00 00    	fldl   0xd718
    8717:	de c9                	fmulp  %st,%st(1)
    8719:	dd 5c 24 08          	fstpl  0x8(%esp)
    871d:	dd 05 20 d7 00 00    	fldl   0xd720
    8723:	dd 1c 24             	fstpl  (%esp)
    8726:	e8 0c c1 ff ff       	call   4837 <pow>
    872b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    872e:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    8731:	8b 45 14             	mov    0x14(%ebp),%eax
    8734:	8b 40 10             	mov    0x10(%eax),%eax
    8737:	85 c0                	test   %eax,%eax
    8739:	0f 84 86 01 00 00    	je     88c5 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    873f:	8b 45 14             	mov    0x14(%ebp),%eax
    8742:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    8745:	83 f8 02             	cmp    $0x2,%eax
    8748:	75 0a                	jne    8754 <III_dequantize_sample+0x3e5>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    874a:	8b 45 14             	mov    0x14(%ebp),%eax
    874d:	8b 40 18             	mov    0x18(%eax),%eax
    8750:	85 c0                	test   %eax,%eax
    8752:	74 27                	je     877b <III_dequantize_sample+0x40c>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    8754:	8b 45 14             	mov    0x14(%ebp),%eax
    8757:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    875a:	83 f8 02             	cmp    $0x2,%eax
    875d:	0f 85 62 01 00 00    	jne    88c5 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    8763:	8b 45 14             	mov    0x14(%ebp),%eax
    8766:	8b 40 18             	mov    0x18(%eax),%eax
    8769:	85 c0                	test   %eax,%eax
    876b:	0f 84 54 01 00 00    	je     88c5 <III_dequantize_sample+0x556>
    8771:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    8775:	0f 8e 4a 01 00 00    	jle    88c5 <III_dequantize_sample+0x556>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    877b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    877e:	89 d0                	mov    %edx,%eax
    8780:	c1 e0 03             	shl    $0x3,%eax
    8783:	01 d0                	add    %edx,%eax
    8785:	c1 e0 04             	shl    $0x4,%eax
    8788:	89 c2                	mov    %eax,%edx
    878a:	8b 45 0c             	mov    0xc(%ebp),%eax
    878d:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8790:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8793:	89 d0                	mov    %edx,%eax
    8795:	c1 e0 03             	shl    $0x3,%eax
    8798:	01 d0                	add    %edx,%eax
    879a:	c1 e0 04             	shl    $0x4,%eax
    879d:	89 c2                	mov    %eax,%edx
    879f:	8b 45 0c             	mov    0xc(%ebp),%eax
    87a2:	01 c2                	add    %eax,%edx
    87a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    87a7:	dd 04 c2             	fldl   (%edx,%eax,8)
    87aa:	dd 5d c0             	fstpl  -0x40(%ebp)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    87ad:	8b 55 f0             	mov    -0x10(%ebp),%edx
    87b0:	89 d0                	mov    %edx,%eax
    87b2:	c1 e0 03             	shl    $0x3,%eax
    87b5:	01 d0                	add    %edx,%eax
    87b7:	01 c0                	add    %eax,%eax
    87b9:	89 c2                	mov    %eax,%edx
    87bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    87be:	01 d0                	add    %edx,%eax
    87c0:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    87c3:	99                   	cltd   
    87c4:	f7 7d e0             	idivl  -0x20(%ebp)
    87c7:	89 c2                	mov    %eax,%edx
    87c9:	8b 45 14             	mov    0x14(%ebp),%eax
    87cc:	83 c2 08             	add    $0x8,%edx
    87cf:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    87d3:	ba 00 00 00 00       	mov    $0x0,%edx
    87d8:	89 45 c8             	mov    %eax,-0x38(%ebp)
    87db:	89 55 cc             	mov    %edx,-0x34(%ebp)
    87de:	df 6d c8             	fildll -0x38(%ebp)
    87e1:	dd 05 28 d7 00 00    	fldl   0xd728
    87e7:	de c9                	fmulp  %st,%st(1)
    87e9:	dd 5c 24 08          	fstpl  0x8(%esp)
    87ed:	dd 05 20 d7 00 00    	fldl   0xd720
    87f3:	dd 1c 24             	fstpl  (%esp)
    87f6:	e8 3c c0 ff ff       	call   4837 <pow>
    87fb:	dc 4d c0             	fmull  -0x40(%ebp)
    87fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8801:	dd 1c c3             	fstpl  (%ebx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    8804:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8807:	89 d0                	mov    %edx,%eax
    8809:	c1 e0 03             	shl    $0x3,%eax
    880c:	01 d0                	add    %edx,%eax
    880e:	c1 e0 04             	shl    $0x4,%eax
    8811:	89 c2                	mov    %eax,%edx
    8813:	8b 45 0c             	mov    0xc(%ebp),%eax
    8816:	8d 34 02             	lea    (%edx,%eax,1),%esi
    8819:	8b 55 f0             	mov    -0x10(%ebp),%edx
    881c:	89 d0                	mov    %edx,%eax
    881e:	c1 e0 03             	shl    $0x3,%eax
    8821:	01 d0                	add    %edx,%eax
    8823:	c1 e0 04             	shl    $0x4,%eax
    8826:	89 c2                	mov    %eax,%edx
    8828:	8b 45 0c             	mov    0xc(%ebp),%eax
    882b:	01 c2                	add    %eax,%edx
    882d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8830:	dd 04 c2             	fldl   (%edx,%eax,8)
    8833:	dd 5d c0             	fstpl  -0x40(%ebp)
    8836:	8b 45 14             	mov    0x14(%ebp),%eax
    8839:	8b 40 40             	mov    0x40(%eax),%eax
    883c:	ba 00 00 00 00       	mov    $0x0,%edx
    8841:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8844:	89 55 cc             	mov    %edx,-0x34(%ebp)
    8847:	df 6d c8             	fildll -0x38(%ebp)
    884a:	d9 e8                	fld1   
    884c:	de c1                	faddp  %st,%st(1)
    884e:	dd 05 30 d7 00 00    	fldl   0xd730
    8854:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    8856:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8859:	89 d0                	mov    %edx,%eax
    885b:	c1 e0 03             	shl    $0x3,%eax
    885e:	01 d0                	add    %edx,%eax
    8860:	01 c0                	add    %eax,%eax
    8862:	89 c2                	mov    %eax,%edx
    8864:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8867:	01 d0                	add    %edx,%eax
    8869:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    886c:	99                   	cltd   
    886d:	f7 7d e0             	idivl  -0x20(%ebp)
    8870:	89 c2                	mov    %eax,%edx
    8872:	8b 5d 10             	mov    0x10(%ebp),%ebx
    8875:	8b 4d 18             	mov    0x18(%ebp),%ecx
    8878:	89 d0                	mov    %edx,%eax
    887a:	01 c0                	add    %eax,%eax
    887c:	01 d0                	add    %edx,%eax
    887e:	c1 e0 02             	shl    $0x2,%eax
    8881:	01 d0                	add    %edx,%eax
    8883:	89 ca                	mov    %ecx,%edx
    8885:	01 d2                	add    %edx,%edx
    8887:	89 d1                	mov    %edx,%ecx
    8889:	c1 e1 05             	shl    $0x5,%ecx
    888c:	29 d1                	sub    %edx,%ecx
    888e:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    8891:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8894:	01 d0                	add    %edx,%eax
    8896:	83 c0 14             	add    $0x14,%eax
    8899:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    889d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    88a0:	db 45 d4             	fildl  -0x2c(%ebp)
    88a3:	de c9                	fmulp  %st,%st(1)
    88a5:	dd 5c 24 08          	fstpl  0x8(%esp)
    88a9:	dd 05 20 d7 00 00    	fldl   0xd720
    88af:	dd 1c 24             	fstpl  (%esp)
    88b2:	e8 80 bf ff ff       	call   4837 <pow>
    88b7:	dc 4d c0             	fmull  -0x40(%ebp)
    88ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88bd:	dd 1c c6             	fstpl  (%esi,%eax,8)
    88c0:	e9 ab 00 00 00       	jmp    8970 <III_dequantize_sample+0x601>
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    88c5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    88c8:	89 d0                	mov    %edx,%eax
    88ca:	c1 e0 03             	shl    $0x3,%eax
    88cd:	01 d0                	add    %edx,%eax
    88cf:	c1 e0 04             	shl    $0x4,%eax
    88d2:	89 c2                	mov    %eax,%edx
    88d4:	8b 45 0c             	mov    0xc(%ebp),%eax
    88d7:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    88da:	8b 55 f0             	mov    -0x10(%ebp),%edx
    88dd:	89 d0                	mov    %edx,%eax
    88df:	c1 e0 03             	shl    $0x3,%eax
    88e2:	01 d0                	add    %edx,%eax
    88e4:	c1 e0 04             	shl    $0x4,%eax
    88e7:	89 c2                	mov    %eax,%edx
    88e9:	8b 45 0c             	mov    0xc(%ebp),%eax
    88ec:	01 c2                	add    %eax,%edx
    88ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88f1:	dd 04 c2             	fldl   (%edx,%eax,8)
    88f4:	dd 5d c0             	fstpl  -0x40(%ebp)
    88f7:	8b 45 14             	mov    0x14(%ebp),%eax
    88fa:	8b 40 40             	mov    0x40(%eax),%eax
    88fd:	ba 00 00 00 00       	mov    $0x0,%edx
    8902:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8905:	89 55 cc             	mov    %edx,-0x34(%ebp)
    8908:	df 6d c8             	fildll -0x38(%ebp)
    890b:	d9 e8                	fld1   
    890d:	de c1                	faddp  %st,%st(1)
    890f:	dd 05 30 d7 00 00    	fldl   0xd730
    8915:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    8917:	8b 4d 10             	mov    0x10(%ebp),%ecx
    891a:	8b 45 18             	mov    0x18(%ebp),%eax
    891d:	01 c0                	add    %eax,%eax
    891f:	89 c2                	mov    %eax,%edx
    8921:	c1 e2 05             	shl    $0x5,%edx
    8924:	29 c2                	sub    %eax,%edx
    8926:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8929:	01 d0                	add    %edx,%eax
    892b:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    892e:	89 c2                	mov    %eax,%edx
    8930:	8b 45 14             	mov    0x14(%ebp),%eax
    8933:	8b 48 3c             	mov    0x3c(%eax),%ecx
    8936:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8939:	8b 04 85 a0 f1 00 00 	mov    0xf1a0(,%eax,4),%eax
    8940:	0f af c1             	imul   %ecx,%eax
    8943:	01 d0                	add    %edx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    8945:	ba 00 00 00 00       	mov    $0x0,%edx
    894a:	89 45 c8             	mov    %eax,-0x38(%ebp)
    894d:	89 55 cc             	mov    %edx,-0x34(%ebp)
    8950:	df 6d c8             	fildll -0x38(%ebp)
    8953:	de c9                	fmulp  %st,%st(1)
    8955:	dd 5c 24 08          	fstpl  0x8(%esp)
    8959:	dd 05 20 d7 00 00    	fldl   0xd720
    895f:	dd 1c 24             	fstpl  (%esp)
    8962:	e8 d0 be ff ff       	call   4837 <pow>
    8967:	dc 4d c0             	fmull  -0x40(%ebp)
    896a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    896d:	dd 1c c3             	fstpl  (%ebx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    8970:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8973:	89 d0                	mov    %edx,%eax
    8975:	c1 e0 03             	shl    $0x3,%eax
    8978:	01 d0                	add    %edx,%eax
    897a:	c1 e0 03             	shl    $0x3,%eax
    897d:	89 c2                	mov    %eax,%edx
    897f:	8b 45 08             	mov    0x8(%ebp),%eax
    8982:	01 c2                	add    %eax,%edx
    8984:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8987:	8b 04 82             	mov    (%edx,%eax,4),%eax
    898a:	c1 e8 1f             	shr    $0x1f,%eax
    898d:	0f b6 c0             	movzbl %al,%eax
    8990:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    8993:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8996:	89 d0                	mov    %edx,%eax
    8998:	c1 e0 03             	shl    $0x3,%eax
    899b:	01 d0                	add    %edx,%eax
    899d:	c1 e0 04             	shl    $0x4,%eax
    89a0:	89 c2                	mov    %eax,%edx
    89a2:	8b 45 0c             	mov    0xc(%ebp),%eax
    89a5:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    89a8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    89ab:	89 d0                	mov    %edx,%eax
    89ad:	c1 e0 03             	shl    $0x3,%eax
    89b0:	01 d0                	add    %edx,%eax
    89b2:	c1 e0 04             	shl    $0x4,%eax
    89b5:	89 c2                	mov    %eax,%edx
    89b7:	8b 45 0c             	mov    0xc(%ebp),%eax
    89ba:	01 c2                	add    %eax,%edx
    89bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    89bf:	dd 04 c2             	fldl   (%edx,%eax,8)
    89c2:	dd 5d c0             	fstpl  -0x40(%ebp)
    89c5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    89c8:	89 d0                	mov    %edx,%eax
    89ca:	c1 e0 03             	shl    $0x3,%eax
    89cd:	01 d0                	add    %edx,%eax
    89cf:	c1 e0 03             	shl    $0x3,%eax
    89d2:	89 c2                	mov    %eax,%edx
    89d4:	8b 45 08             	mov    0x8(%ebp),%eax
    89d7:	01 c2                	add    %eax,%edx
    89d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    89dc:	8b 04 82             	mov    (%edx,%eax,4),%eax
    89df:	89 04 24             	mov    %eax,(%esp)
    89e2:	e8 47 bd ff ff       	call   472e <abs>
    89e7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    89ea:	db 45 d4             	fildl  -0x2c(%ebp)
    89ed:	dd 05 38 d7 00 00    	fldl   0xd738
    89f3:	dd 5c 24 08          	fstpl  0x8(%esp)
    89f7:	dd 1c 24             	fstpl  (%esp)
    89fa:	e8 38 be ff ff       	call   4837 <pow>
    89ff:	dc 4d c0             	fmull  -0x40(%ebp)
    8a02:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a05:	dd 1c c3             	fstpl  (%ebx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    8a08:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    8a0c:	74 37                	je     8a45 <III_dequantize_sample+0x6d6>
    8a0e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8a11:	89 d0                	mov    %edx,%eax
    8a13:	c1 e0 03             	shl    $0x3,%eax
    8a16:	01 d0                	add    %edx,%eax
    8a18:	c1 e0 04             	shl    $0x4,%eax
    8a1b:	89 c2                	mov    %eax,%edx
    8a1d:	8b 45 0c             	mov    0xc(%ebp),%eax
    8a20:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8a23:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8a26:	89 d0                	mov    %edx,%eax
    8a28:	c1 e0 03             	shl    $0x3,%eax
    8a2b:	01 d0                	add    %edx,%eax
    8a2d:	c1 e0 04             	shl    $0x4,%eax
    8a30:	89 c2                	mov    %eax,%edx
    8a32:	8b 45 0c             	mov    0xc(%ebp),%eax
    8a35:	01 c2                	add    %eax,%edx
    8a37:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a3a:	dd 04 c2             	fldl   (%edx,%eax,8)
    8a3d:	d9 e0                	fchs   
    8a3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a42:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    8a45:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8a49:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    8a4d:	0f 8e d3 f9 ff ff    	jle    8426 <III_dequantize_sample+0xb7>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    8a53:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8a57:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    8a5b:	0f 8e b9 f9 ff ff    	jle    841a <III_dequantize_sample+0xab>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    8a61:	83 c4 50             	add    $0x50,%esp
    8a64:	5b                   	pop    %ebx
    8a65:	5e                   	pop    %esi
    8a66:	5d                   	pop    %ebp
    8a67:	c3                   	ret    

00008a68 <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    8a68:	55                   	push   %ebp
    8a69:	89 e5                	mov    %esp,%ebp
    8a6b:	57                   	push   %edi
    8a6c:	56                   	push   %esi
    8a6d:	53                   	push   %ebx
    8a6e:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    8a71:	8b 45 14             	mov    0x14(%ebp),%eax
    8a74:	8b 00                	mov    (%eax),%eax
    8a76:	8b 40 10             	mov    0x10(%eax),%eax
    8a79:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    8a7c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    8a83:	eb 33                	jmp    8ab8 <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    8a85:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    8a8c:	eb 20                	jmp    8aae <III_reorder+0x46>
         ro[sb][ss] = 0;
    8a8e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8a91:	89 d0                	mov    %edx,%eax
    8a93:	c1 e0 03             	shl    $0x3,%eax
    8a96:	01 d0                	add    %edx,%eax
    8a98:	c1 e0 04             	shl    $0x4,%eax
    8a9b:	89 c2                	mov    %eax,%edx
    8a9d:	8b 45 0c             	mov    0xc(%ebp),%eax
    8aa0:	01 c2                	add    %eax,%edx
    8aa2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8aa5:	d9 ee                	fldz   
    8aa7:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    8aaa:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8aae:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    8ab2:	7e da                	jle    8a8e <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    8ab4:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8ab8:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    8abc:	7e c7                	jle    8a85 <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    8abe:	8b 45 10             	mov    0x10(%ebp),%eax
    8ac1:	8b 40 10             	mov    0x10(%eax),%eax
    8ac4:	85 c0                	test   %eax,%eax
    8ac6:	0f 84 af 03 00 00    	je     8e7b <III_reorder+0x413>
    8acc:	8b 45 10             	mov    0x10(%ebp),%eax
    8acf:	8b 40 14             	mov    0x14(%eax),%eax
    8ad2:	83 f8 02             	cmp    $0x2,%eax
    8ad5:	0f 85 a0 03 00 00    	jne    8e7b <III_reorder+0x413>
      if (gr_info->mixed_block_flag) {
    8adb:	8b 45 10             	mov    0x10(%ebp),%eax
    8ade:	8b 40 18             	mov    0x18(%eax),%eax
    8ae1:	85 c0                	test   %eax,%eax
    8ae3:	0f 84 00 02 00 00    	je     8ce9 <III_reorder+0x281>
         for (sb=0 ; sb < 2 ; sb++)
    8ae9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    8af0:	eb 4c                	jmp    8b3e <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    8af2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    8af9:	eb 39                	jmp    8b34 <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    8afb:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8afe:	89 d0                	mov    %edx,%eax
    8b00:	c1 e0 03             	shl    $0x3,%eax
    8b03:	01 d0                	add    %edx,%eax
    8b05:	c1 e0 04             	shl    $0x4,%eax
    8b08:	89 c2                	mov    %eax,%edx
    8b0a:	8b 45 0c             	mov    0xc(%ebp),%eax
    8b0d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8b10:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8b13:	89 d0                	mov    %edx,%eax
    8b15:	c1 e0 03             	shl    $0x3,%eax
    8b18:	01 d0                	add    %edx,%eax
    8b1a:	c1 e0 04             	shl    $0x4,%eax
    8b1d:	89 c2                	mov    %eax,%edx
    8b1f:	8b 45 08             	mov    0x8(%ebp),%eax
    8b22:	01 c2                	add    %eax,%edx
    8b24:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8b27:	dd 04 c2             	fldl   (%edx,%eax,8)
    8b2a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8b2d:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    8b30:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8b34:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    8b38:	7e c1                	jle    8afb <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    8b3a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8b3e:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    8b42:	7e ae                	jle    8af2 <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    8b44:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    8b4b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8b4e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8b54:	05 3c f0 00 00       	add    $0xf03c,%eax
    8b59:	8b 40 0c             	mov    0xc(%eax),%eax
    8b5c:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    8b5f:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8b62:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8b68:	05 40 f0 00 00       	add    $0xf040,%eax
    8b6d:	8b 40 0c             	mov    0xc(%eax),%eax
    8b70:	2b 45 e8             	sub    -0x18(%ebp),%eax
    8b73:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    8b76:	e9 5f 01 00 00       	jmp    8cda <III_reorder+0x272>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8b7b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    8b82:	e9 fd 00 00 00       	jmp    8c84 <III_reorder+0x21c>
                  for(freq=0;freq<sfb_lines;freq++) {
    8b87:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    8b8e:	e9 e1 00 00 00       	jmp    8c74 <III_reorder+0x20c>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    8b93:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8b96:	89 d0                	mov    %edx,%eax
    8b98:	01 c0                	add    %eax,%eax
    8b9a:	01 c2                	add    %eax,%edx
    8b9c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8b9f:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    8ba3:	01 c2                	add    %eax,%edx
    8ba5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8ba8:	01 d0                	add    %edx,%eax
    8baa:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    8bad:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8bb0:	89 d0                	mov    %edx,%eax
    8bb2:	01 c0                	add    %eax,%eax
    8bb4:	01 c2                	add    %eax,%edx
    8bb6:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8bb9:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8bbc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    8bbf:	89 d0                	mov    %edx,%eax
    8bc1:	01 c0                	add    %eax,%eax
    8bc3:	01 d0                	add    %edx,%eax
    8bc5:	01 c8                	add    %ecx,%eax
    8bc7:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8bca:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    8bcd:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8bd2:	89 c8                	mov    %ecx,%eax
    8bd4:	f7 ea                	imul   %edx
    8bd6:	c1 fa 02             	sar    $0x2,%edx
    8bd9:	89 c8                	mov    %ecx,%eax
    8bdb:	c1 f8 1f             	sar    $0x1f,%eax
    8bde:	29 c2                	sub    %eax,%edx
    8be0:	89 d0                	mov    %edx,%eax
    8be2:	89 c2                	mov    %eax,%edx
    8be4:	89 d0                	mov    %edx,%eax
    8be6:	c1 e0 03             	shl    $0x3,%eax
    8be9:	01 d0                	add    %edx,%eax
    8beb:	c1 e0 04             	shl    $0x4,%eax
    8bee:	89 c2                	mov    %eax,%edx
    8bf0:	8b 45 0c             	mov    0xc(%ebp),%eax
    8bf3:	8d 34 02             	lea    (%edx,%eax,1),%esi
    8bf6:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    8bf9:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8bfe:	89 d8                	mov    %ebx,%eax
    8c00:	f7 ea                	imul   %edx
    8c02:	c1 fa 02             	sar    $0x2,%edx
    8c05:	89 d8                	mov    %ebx,%eax
    8c07:	c1 f8 1f             	sar    $0x1f,%eax
    8c0a:	89 d1                	mov    %edx,%ecx
    8c0c:	29 c1                	sub    %eax,%ecx
    8c0e:	89 c8                	mov    %ecx,%eax
    8c10:	c1 e0 03             	shl    $0x3,%eax
    8c13:	01 c8                	add    %ecx,%eax
    8c15:	01 c0                	add    %eax,%eax
    8c17:	29 c3                	sub    %eax,%ebx
    8c19:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    8c1b:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8c1e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8c23:	89 d8                	mov    %ebx,%eax
    8c25:	f7 ea                	imul   %edx
    8c27:	c1 fa 02             	sar    $0x2,%edx
    8c2a:	89 d8                	mov    %ebx,%eax
    8c2c:	c1 f8 1f             	sar    $0x1f,%eax
    8c2f:	29 c2                	sub    %eax,%edx
    8c31:	89 d0                	mov    %edx,%eax
    8c33:	89 c2                	mov    %eax,%edx
    8c35:	89 d0                	mov    %edx,%eax
    8c37:	c1 e0 03             	shl    $0x3,%eax
    8c3a:	01 d0                	add    %edx,%eax
    8c3c:	c1 e0 04             	shl    $0x4,%eax
    8c3f:	89 c2                	mov    %eax,%edx
    8c41:	8b 45 08             	mov    0x8(%ebp),%eax
    8c44:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    8c47:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8c4a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8c4f:	89 d8                	mov    %ebx,%eax
    8c51:	f7 ea                	imul   %edx
    8c53:	c1 fa 02             	sar    $0x2,%edx
    8c56:	89 d8                	mov    %ebx,%eax
    8c58:	c1 f8 1f             	sar    $0x1f,%eax
    8c5b:	29 c2                	sub    %eax,%edx
    8c5d:	89 d0                	mov    %edx,%eax
    8c5f:	c1 e0 03             	shl    $0x3,%eax
    8c62:	01 d0                	add    %edx,%eax
    8c64:	01 c0                	add    %eax,%eax
    8c66:	29 c3                	sub    %eax,%ebx
    8c68:	89 da                	mov    %ebx,%edx
    8c6a:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8c6d:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    8c70:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    8c74:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8c77:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    8c7a:	0f 8c 13 ff ff ff    	jl     8b93 <III_reorder+0x12b>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8c80:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    8c84:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    8c88:	0f 8e f9 fe ff ff    	jle    8b87 <III_reorder+0x11f>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    8c8e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8c92:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8c95:	89 d0                	mov    %edx,%eax
    8c97:	c1 e0 03             	shl    $0x3,%eax
    8c9a:	01 d0                	add    %edx,%eax
    8c9c:	c1 e0 02             	shl    $0x2,%eax
    8c9f:	01 d0                	add    %edx,%eax
    8ca1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8ca4:	01 d0                	add    %edx,%eax
    8ca6:	83 c0 14             	add    $0x14,%eax
    8ca9:	8b 04 85 ec ef 00 00 	mov    0xefec(,%eax,4),%eax
    8cb0:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    8cb3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8cb6:	8d 48 01             	lea    0x1(%eax),%ecx
    8cb9:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8cbc:	89 d0                	mov    %edx,%eax
    8cbe:	c1 e0 03             	shl    $0x3,%eax
    8cc1:	01 d0                	add    %edx,%eax
    8cc3:	c1 e0 02             	shl    $0x2,%eax
    8cc6:	01 d0                	add    %edx,%eax
    8cc8:	01 c8                	add    %ecx,%eax
    8cca:	83 c0 14             	add    $0x14,%eax
    8ccd:	8b 04 85 ec ef 00 00 	mov    0xefec(,%eax,4),%eax
    8cd4:	2b 45 e8             	sub    -0x18(%ebp),%eax
    8cd7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    8cda:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    8cde:	0f 8e 97 fe ff ff    	jle    8b7b <III_reorder+0x113>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    8ce4:	e9 ed 01 00 00       	jmp    8ed6 <III_reorder+0x46e>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    8ce9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8cf0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    8cf7:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8cfa:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8d00:	05 34 f0 00 00       	add    $0xf034,%eax
    8d05:	8b 40 0c             	mov    0xc(%eax),%eax
    8d08:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    8d0b:	e9 5f 01 00 00       	jmp    8e6f <III_reorder+0x407>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8d10:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    8d17:	e9 fd 00 00 00       	jmp    8e19 <III_reorder+0x3b1>
                  for(freq=0;freq<sfb_lines;freq++) {
    8d1c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    8d23:	e9 e1 00 00 00       	jmp    8e09 <III_reorder+0x3a1>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    8d28:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8d2b:	89 d0                	mov    %edx,%eax
    8d2d:	01 c0                	add    %eax,%eax
    8d2f:	01 c2                	add    %eax,%edx
    8d31:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8d34:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    8d38:	01 c2                	add    %eax,%edx
    8d3a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8d3d:	01 d0                	add    %edx,%eax
    8d3f:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    8d42:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8d45:	89 d0                	mov    %edx,%eax
    8d47:	01 c0                	add    %eax,%eax
    8d49:	01 c2                	add    %eax,%edx
    8d4b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8d4e:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8d51:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    8d54:	89 d0                	mov    %edx,%eax
    8d56:	01 c0                	add    %eax,%eax
    8d58:	01 d0                	add    %edx,%eax
    8d5a:	01 c8                	add    %ecx,%eax
    8d5c:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8d5f:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    8d62:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8d67:	89 c8                	mov    %ecx,%eax
    8d69:	f7 ea                	imul   %edx
    8d6b:	c1 fa 02             	sar    $0x2,%edx
    8d6e:	89 c8                	mov    %ecx,%eax
    8d70:	c1 f8 1f             	sar    $0x1f,%eax
    8d73:	29 c2                	sub    %eax,%edx
    8d75:	89 d0                	mov    %edx,%eax
    8d77:	89 c2                	mov    %eax,%edx
    8d79:	89 d0                	mov    %edx,%eax
    8d7b:	c1 e0 03             	shl    $0x3,%eax
    8d7e:	01 d0                	add    %edx,%eax
    8d80:	c1 e0 04             	shl    $0x4,%eax
    8d83:	89 c2                	mov    %eax,%edx
    8d85:	8b 45 0c             	mov    0xc(%ebp),%eax
    8d88:	8d 34 02             	lea    (%edx,%eax,1),%esi
    8d8b:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    8d8e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8d93:	89 d8                	mov    %ebx,%eax
    8d95:	f7 ea                	imul   %edx
    8d97:	c1 fa 02             	sar    $0x2,%edx
    8d9a:	89 d8                	mov    %ebx,%eax
    8d9c:	c1 f8 1f             	sar    $0x1f,%eax
    8d9f:	89 d1                	mov    %edx,%ecx
    8da1:	29 c1                	sub    %eax,%ecx
    8da3:	89 c8                	mov    %ecx,%eax
    8da5:	c1 e0 03             	shl    $0x3,%eax
    8da8:	01 c8                	add    %ecx,%eax
    8daa:	01 c0                	add    %eax,%eax
    8dac:	29 c3                	sub    %eax,%ebx
    8dae:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    8db0:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8db3:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8db8:	89 d8                	mov    %ebx,%eax
    8dba:	f7 ea                	imul   %edx
    8dbc:	c1 fa 02             	sar    $0x2,%edx
    8dbf:	89 d8                	mov    %ebx,%eax
    8dc1:	c1 f8 1f             	sar    $0x1f,%eax
    8dc4:	29 c2                	sub    %eax,%edx
    8dc6:	89 d0                	mov    %edx,%eax
    8dc8:	89 c2                	mov    %eax,%edx
    8dca:	89 d0                	mov    %edx,%eax
    8dcc:	c1 e0 03             	shl    $0x3,%eax
    8dcf:	01 d0                	add    %edx,%eax
    8dd1:	c1 e0 04             	shl    $0x4,%eax
    8dd4:	89 c2                	mov    %eax,%edx
    8dd6:	8b 45 08             	mov    0x8(%ebp),%eax
    8dd9:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    8ddc:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8ddf:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8de4:	89 d8                	mov    %ebx,%eax
    8de6:	f7 ea                	imul   %edx
    8de8:	c1 fa 02             	sar    $0x2,%edx
    8deb:	89 d8                	mov    %ebx,%eax
    8ded:	c1 f8 1f             	sar    $0x1f,%eax
    8df0:	29 c2                	sub    %eax,%edx
    8df2:	89 d0                	mov    %edx,%eax
    8df4:	c1 e0 03             	shl    $0x3,%eax
    8df7:	01 d0                	add    %edx,%eax
    8df9:	01 c0                	add    %eax,%eax
    8dfb:	29 c3                	sub    %eax,%ebx
    8dfd:	89 da                	mov    %ebx,%edx
    8dff:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8e02:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    8e05:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    8e09:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8e0c:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    8e0f:	0f 8c 13 ff ff ff    	jl     8d28 <III_reorder+0x2c0>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8e15:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    8e19:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    8e1d:	0f 8e f9 fe ff ff    	jle    8d1c <III_reorder+0x2b4>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    8e23:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8e27:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8e2a:	89 d0                	mov    %edx,%eax
    8e2c:	c1 e0 03             	shl    $0x3,%eax
    8e2f:	01 d0                	add    %edx,%eax
    8e31:	c1 e0 02             	shl    $0x2,%eax
    8e34:	01 d0                	add    %edx,%eax
    8e36:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8e39:	01 d0                	add    %edx,%eax
    8e3b:	83 c0 14             	add    $0x14,%eax
    8e3e:	8b 04 85 ec ef 00 00 	mov    0xefec(,%eax,4),%eax
    8e45:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    8e48:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8e4b:	8d 48 01             	lea    0x1(%eax),%ecx
    8e4e:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8e51:	89 d0                	mov    %edx,%eax
    8e53:	c1 e0 03             	shl    $0x3,%eax
    8e56:	01 d0                	add    %edx,%eax
    8e58:	c1 e0 02             	shl    $0x2,%eax
    8e5b:	01 d0                	add    %edx,%eax
    8e5d:	01 c8                	add    %ecx,%eax
    8e5f:	83 c0 14             	add    $0x14,%eax
    8e62:	8b 04 85 ec ef 00 00 	mov    0xefec(,%eax,4),%eax
    8e69:	2b 45 e8             	sub    -0x18(%ebp),%eax
    8e6c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    8e6f:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    8e73:	0f 8e 97 fe ff ff    	jle    8d10 <III_reorder+0x2a8>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    8e79:	eb 5b                	jmp    8ed6 <III_reorder+0x46e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    8e7b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    8e82:	eb 4c                	jmp    8ed0 <III_reorder+0x468>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    8e84:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    8e8b:	eb 39                	jmp    8ec6 <III_reorder+0x45e>
            ro[sb][ss] = xr[sb][ss];
    8e8d:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8e90:	89 d0                	mov    %edx,%eax
    8e92:	c1 e0 03             	shl    $0x3,%eax
    8e95:	01 d0                	add    %edx,%eax
    8e97:	c1 e0 04             	shl    $0x4,%eax
    8e9a:	89 c2                	mov    %eax,%edx
    8e9c:	8b 45 0c             	mov    0xc(%ebp),%eax
    8e9f:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8ea2:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8ea5:	89 d0                	mov    %edx,%eax
    8ea7:	c1 e0 03             	shl    $0x3,%eax
    8eaa:	01 d0                	add    %edx,%eax
    8eac:	c1 e0 04             	shl    $0x4,%eax
    8eaf:	89 c2                	mov    %eax,%edx
    8eb1:	8b 45 08             	mov    0x8(%ebp),%eax
    8eb4:	01 c2                	add    %eax,%edx
    8eb6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8eb9:	dd 04 c2             	fldl   (%edx,%eax,8)
    8ebc:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8ebf:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    8ec2:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8ec6:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    8eca:	7e c1                	jle    8e8d <III_reorder+0x425>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    8ecc:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8ed0:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    8ed4:	7e ae                	jle    8e84 <III_reorder+0x41c>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    8ed6:	83 c4 34             	add    $0x34,%esp
    8ed9:	5b                   	pop    %ebx
    8eda:	5e                   	pop    %esi
    8edb:	5f                   	pop    %edi
    8edc:	5d                   	pop    %ebp
    8edd:	c3                   	ret    

00008ede <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    8ede:	55                   	push   %ebp
    8edf:	89 e5                	mov    %esp,%ebp
    8ee1:	56                   	push   %esi
    8ee2:	53                   	push   %ebx
    8ee3:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    8ee9:	8b 45 18             	mov    0x18(%ebp),%eax
    8eec:	8b 00                	mov    (%eax),%eax
    8eee:	8b 40 10             	mov    0x10(%eax),%eax
    8ef1:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    8ef4:	8b 45 18             	mov    0x18(%ebp),%eax
    8ef7:	8b 40 08             	mov    0x8(%eax),%eax
    8efa:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8efd:	8b 45 18             	mov    0x18(%ebp),%eax
    8f00:	8b 00                	mov    (%eax),%eax
    8f02:	8b 40 1c             	mov    0x1c(%eax),%eax
    8f05:	83 f8 01             	cmp    $0x1,%eax
    8f08:	75 16                	jne    8f20 <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    8f0a:	8b 45 18             	mov    0x18(%ebp),%eax
    8f0d:	8b 00                	mov    (%eax),%eax
    8f0f:	8b 40 20             	mov    0x20(%eax),%eax
    8f12:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8f15:	85 c0                	test   %eax,%eax
    8f17:	74 07                	je     8f20 <III_stereo+0x42>
    8f19:	b8 01 00 00 00       	mov    $0x1,%eax
    8f1e:	eb 05                	jmp    8f25 <III_stereo+0x47>
    8f20:	b8 00 00 00 00       	mov    $0x0,%eax
    8f25:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8f28:	8b 45 18             	mov    0x18(%ebp),%eax
    8f2b:	8b 00                	mov    (%eax),%eax
    8f2d:	8b 40 1c             	mov    0x1c(%eax),%eax
    8f30:	83 f8 01             	cmp    $0x1,%eax
    8f33:	75 16                	jne    8f4b <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    8f35:	8b 45 18             	mov    0x18(%ebp),%eax
    8f38:	8b 00                	mov    (%eax),%eax
    8f3a:	8b 40 20             	mov    0x20(%eax),%eax
    8f3d:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8f40:	85 c0                	test   %eax,%eax
    8f42:	74 07                	je     8f4b <III_stereo+0x6d>
    8f44:	b8 01 00 00 00       	mov    $0x1,%eax
    8f49:	eb 05                	jmp    8f50 <III_stereo+0x72>
    8f4b:	b8 00 00 00 00       	mov    $0x0,%eax
    8f50:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    8f53:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8f5a:	eb 12                	jmp    8f6e <III_stereo+0x90>
      is_pos[i] = 7;
    8f5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f5f:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    8f66:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    8f6a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8f6e:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    8f75:	7e e5                	jle    8f5c <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    8f77:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    8f7b:	0f 85 18 0a 00 00    	jne    9999 <III_stereo+0xabb>
    8f81:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    8f85:	0f 84 0e 0a 00 00    	je     9999 <III_stereo+0xabb>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    8f8b:	8b 45 14             	mov    0x14(%ebp),%eax
    8f8e:	8b 40 10             	mov    0x10(%eax),%eax
    8f91:	85 c0                	test   %eax,%eax
    8f93:	0f 84 10 08 00 00    	je     97a9 <III_stereo+0x8cb>
    8f99:	8b 45 14             	mov    0x14(%ebp),%eax
    8f9c:	8b 40 14             	mov    0x14(%eax),%eax
    8f9f:	83 f8 02             	cmp    $0x2,%eax
    8fa2:	0f 85 01 08 00 00    	jne    97a9 <III_stereo+0x8cb>
      {  if( gr_info->mixed_block_flag )
    8fa8:	8b 45 14             	mov    0x14(%ebp),%eax
    8fab:	8b 40 18             	mov    0x18(%eax),%eax
    8fae:	85 c0                	test   %eax,%eax
    8fb0:	0f 84 d0 04 00 00    	je     9486 <III_stereo+0x5a8>
         {  int max_sfb = 0;
    8fb6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    8fbd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8fc4:	e9 1b 03 00 00       	jmp    92e4 <III_stereo+0x406>
            {  int sfbcnt;
               sfbcnt = 2;
    8fc9:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    8fd0:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    8fd7:	e9 0f 01 00 00       	jmp    90eb <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    8fdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8fdf:	8d 48 01             	lea    0x1(%eax),%ecx
    8fe2:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8fe5:	89 d0                	mov    %edx,%eax
    8fe7:	c1 e0 03             	shl    $0x3,%eax
    8fea:	01 d0                	add    %edx,%eax
    8fec:	c1 e0 02             	shl    $0x2,%eax
    8fef:	01 d0                	add    %edx,%eax
    8ff1:	01 c8                	add    %ecx,%eax
    8ff3:	83 c0 14             	add    $0x14,%eax
    8ff6:	8b 0c 85 ec ef 00 00 	mov    0xefec(,%eax,4),%ecx
    8ffd:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9000:	89 d0                	mov    %edx,%eax
    9002:	c1 e0 03             	shl    $0x3,%eax
    9005:	01 d0                	add    %edx,%eax
    9007:	c1 e0 02             	shl    $0x2,%eax
    900a:	01 d0                	add    %edx,%eax
    900c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    900f:	01 d0                	add    %edx,%eax
    9011:	83 c0 14             	add    $0x14,%eax
    9014:	8b 04 85 ec ef 00 00 	mov    0xefec(,%eax,4),%eax
    901b:	29 c1                	sub    %eax,%ecx
    901d:	89 c8                	mov    %ecx,%eax
    901f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    9022:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9025:	89 d0                	mov    %edx,%eax
    9027:	c1 e0 03             	shl    $0x3,%eax
    902a:	01 d0                	add    %edx,%eax
    902c:	c1 e0 02             	shl    $0x2,%eax
    902f:	01 d0                	add    %edx,%eax
    9031:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9034:	01 d0                	add    %edx,%eax
    9036:	83 c0 14             	add    $0x14,%eax
    9039:	8b 14 85 ec ef 00 00 	mov    0xefec(,%eax,4),%edx
    9040:	89 d0                	mov    %edx,%eax
    9042:	01 c0                	add    %eax,%eax
    9044:	01 c2                	add    %eax,%edx
    9046:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9049:	83 c0 01             	add    $0x1,%eax
    904c:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    9050:	01 d0                	add    %edx,%eax
    9052:	83 e8 01             	sub    $0x1,%eax
    9055:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    9058:	e9 80 00 00 00       	jmp    90dd <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    905d:	8b 45 08             	mov    0x8(%ebp),%eax
    9060:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    9066:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9069:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    906e:	89 c8                	mov    %ecx,%eax
    9070:	f7 ea                	imul   %edx
    9072:	c1 fa 02             	sar    $0x2,%edx
    9075:	89 c8                	mov    %ecx,%eax
    9077:	c1 f8 1f             	sar    $0x1f,%eax
    907a:	89 d3                	mov    %edx,%ebx
    907c:	29 c3                	sub    %eax,%ebx
    907e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9081:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9086:	89 c8                	mov    %ecx,%eax
    9088:	f7 ea                	imul   %edx
    908a:	c1 fa 02             	sar    $0x2,%edx
    908d:	89 c8                	mov    %ecx,%eax
    908f:	c1 f8 1f             	sar    $0x1f,%eax
    9092:	29 c2                	sub    %eax,%edx
    9094:	89 d0                	mov    %edx,%eax
    9096:	c1 e0 03             	shl    $0x3,%eax
    9099:	01 d0                	add    %edx,%eax
    909b:	01 c0                	add    %eax,%eax
    909d:	29 c1                	sub    %eax,%ecx
    909f:	89 ca                	mov    %ecx,%edx
    90a1:	89 d8                	mov    %ebx,%eax
    90a3:	c1 e0 03             	shl    $0x3,%eax
    90a6:	01 d8                	add    %ebx,%eax
    90a8:	01 c0                	add    %eax,%eax
    90aa:	01 d0                	add    %edx,%eax
    90ac:	dd 04 c6             	fldl   (%esi,%eax,8)
    90af:	d9 ee                	fldz   
    90b1:	df e9                	fucomip %st(1),%st
    90b3:	7a 0a                	jp     90bf <III_stereo+0x1e1>
    90b5:	d9 ee                	fldz   
    90b7:	df e9                	fucomip %st(1),%st
    90b9:	dd d8                	fstp   %st(0)
    90bb:	74 18                	je     90d5 <III_stereo+0x1f7>
    90bd:	eb 02                	jmp    90c1 <III_stereo+0x1e3>
    90bf:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    90c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    90c4:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    90c7:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    90ce:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    90d5:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    90d9:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    90dd:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    90e1:	0f 8f 76 ff ff ff    	jg     905d <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    90e7:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    90eb:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    90ef:	0f 8f e7 fe ff ff    	jg     8fdc <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    90f5:	8b 45 d8             	mov    -0x28(%ebp),%eax
    90f8:	83 c0 01             	add    $0x1,%eax
    90fb:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    90fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9101:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9104:	7e 0b                	jle    9111 <III_stereo+0x233>
                  max_sfb = sfb;
    9106:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9109:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    910c:	e9 f5 00 00 00       	jmp    9206 <III_stereo+0x328>
    9111:	e9 f0 00 00 00       	jmp    9206 <III_stereo+0x328>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    9116:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9119:	8d 48 01             	lea    0x1(%eax),%ecx
    911c:	8b 55 c8             	mov    -0x38(%ebp),%edx
    911f:	89 d0                	mov    %edx,%eax
    9121:	c1 e0 03             	shl    $0x3,%eax
    9124:	01 d0                	add    %edx,%eax
    9126:	c1 e0 02             	shl    $0x2,%eax
    9129:	01 d0                	add    %edx,%eax
    912b:	01 c8                	add    %ecx,%eax
    912d:	83 c0 14             	add    $0x14,%eax
    9130:	8b 0c 85 ec ef 00 00 	mov    0xefec(,%eax,4),%ecx
    9137:	8b 55 c8             	mov    -0x38(%ebp),%edx
    913a:	89 d0                	mov    %edx,%eax
    913c:	c1 e0 03             	shl    $0x3,%eax
    913f:	01 d0                	add    %edx,%eax
    9141:	c1 e0 02             	shl    $0x2,%eax
    9144:	01 d0                	add    %edx,%eax
    9146:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9149:	01 d0                	add    %edx,%eax
    914b:	83 c0 14             	add    $0x14,%eax
    914e:	8b 04 85 ec ef 00 00 	mov    0xefec(,%eax,4),%eax
    9155:	29 c1                	sub    %eax,%ecx
    9157:	89 c8                	mov    %ecx,%eax
    9159:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    915c:	8b 55 c8             	mov    -0x38(%ebp),%edx
    915f:	89 d0                	mov    %edx,%eax
    9161:	c1 e0 03             	shl    $0x3,%eax
    9164:	01 d0                	add    %edx,%eax
    9166:	c1 e0 02             	shl    $0x2,%eax
    9169:	01 d0                	add    %edx,%eax
    916b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    916e:	01 d0                	add    %edx,%eax
    9170:	83 c0 14             	add    $0x14,%eax
    9173:	8b 14 85 ec ef 00 00 	mov    0xefec(,%eax,4),%edx
    917a:	89 d0                	mov    %edx,%eax
    917c:	01 c0                	add    %eax,%eax
    917e:	01 c2                	add    %eax,%edx
    9180:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9183:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9187:	01 d0                	add    %edx,%eax
    9189:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    918c:	eb 6e                	jmp    91fc <III_stereo+0x31e>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    918e:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9191:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9194:	89 d0                	mov    %edx,%eax
    9196:	01 c0                	add    %eax,%eax
    9198:	01 d0                	add    %edx,%eax
    919a:	c1 e0 02             	shl    $0x2,%eax
    919d:	01 d0                	add    %edx,%eax
    919f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    91a2:	01 d0                	add    %edx,%eax
    91a4:	83 c0 52             	add    $0x52,%eax
    91a7:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    91ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91ae:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    91b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91b8:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    91bf:	83 f8 07             	cmp    $0x7,%eax
    91c2:	74 30                	je     91f4 <III_stereo+0x316>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    91c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91c7:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    91ce:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    91d4:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    91da:	dd 05 40 d7 00 00    	fldl   0xd740
    91e0:	de c9                	fmulp  %st,%st(1)
    91e2:	dd 1c 24             	fstpl  (%esp)
    91e5:	e8 1d b6 ff ff       	call   4807 <tan>
    91ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91ed:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    91f4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    91f8:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    91fc:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9200:	7f 8c                	jg     918e <III_stereo+0x2b0>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    9202:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    9206:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    920a:	0f 8e 06 ff ff ff    	jle    9116 <III_stereo+0x238>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    9210:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9213:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9219:	05 5c f0 00 00       	add    $0xf05c,%eax
    921e:	8b 50 0c             	mov    0xc(%eax),%edx
    9221:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9224:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    922a:	05 58 f0 00 00       	add    $0xf058,%eax
    922f:	8b 40 0c             	mov    0xc(%eax),%eax
    9232:	29 c2                	sub    %eax,%edx
    9234:	89 d0                	mov    %edx,%eax
    9236:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    9239:	8b 45 c8             	mov    -0x38(%ebp),%eax
    923c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9242:	05 58 f0 00 00       	add    $0xf058,%eax
    9247:	8b 50 0c             	mov    0xc(%eax),%edx
    924a:	89 d0                	mov    %edx,%eax
    924c:	01 c0                	add    %eax,%eax
    924e:	01 c2                	add    %eax,%edx
    9250:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9253:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9257:	01 d0                	add    %edx,%eax
    9259:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    925c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    925f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9265:	05 60 f0 00 00       	add    $0xf060,%eax
    926a:	8b 50 0c             	mov    0xc(%eax),%edx
    926d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9270:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9276:	05 5c f0 00 00       	add    $0xf05c,%eax
    927b:	8b 40 0c             	mov    0xc(%eax),%eax
    927e:	29 c2                	sub    %eax,%edx
    9280:	89 d0                	mov    %edx,%eax
    9282:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    9285:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9288:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    928e:	05 5c f0 00 00       	add    $0xf05c,%eax
    9293:	8b 50 0c             	mov    0xc(%eax),%edx
    9296:	89 d0                	mov    %edx,%eax
    9298:	01 c0                	add    %eax,%eax
    929a:	01 c2                	add    %eax,%edx
    929c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    929f:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    92a3:	01 d0                	add    %edx,%eax
    92a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    92a8:	eb 30                	jmp    92da <III_stereo+0x3fc>
               {  is_pos[i] = is_pos[sfb];
    92aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    92ad:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    92b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    92b7:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    92be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    92c1:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    92c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    92cb:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    92d2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    92d6:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    92da:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    92de:	7f ca                	jg     92aa <III_stereo+0x3cc>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    92e0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    92e4:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    92e8:	0f 8e db fc ff ff    	jle    8fc9 <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    92ee:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    92f2:	0f 8f 89 01 00 00    	jg     9481 <III_stereo+0x5a3>
             {  i = 2;
    92f8:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    92ff:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    9306:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    930d:	eb 63                	jmp    9372 <III_stereo+0x494>
                {  if ( xr[1][i][ss] != 0.0 )
    930f:	8b 45 08             	mov    0x8(%ebp),%eax
    9312:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9318:	8b 55 f0             	mov    -0x10(%ebp),%edx
    931b:	89 d0                	mov    %edx,%eax
    931d:	c1 e0 03             	shl    $0x3,%eax
    9320:	01 d0                	add    %edx,%eax
    9322:	01 c0                	add    %eax,%eax
    9324:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9327:	01 d0                	add    %edx,%eax
    9329:	dd 04 c1             	fldl   (%ecx,%eax,8)
    932c:	d9 ee                	fldz   
    932e:	df e9                	fucomip %st(1),%st
    9330:	7a 0a                	jp     933c <III_stereo+0x45e>
    9332:	d9 ee                	fldz   
    9334:	df e9                	fucomip %st(1),%st
    9336:	dd d8                	fstp   %st(0)
    9338:	74 23                	je     935d <III_stereo+0x47f>
    933a:	eb 02                	jmp    933e <III_stereo+0x460>
    933c:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    933e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9341:	89 d0                	mov    %edx,%eax
    9343:	c1 e0 03             	shl    $0x3,%eax
    9346:	01 d0                	add    %edx,%eax
    9348:	01 c0                	add    %eax,%eax
    934a:	89 c2                	mov    %eax,%edx
    934c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    934f:	01 d0                	add    %edx,%eax
    9351:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    9354:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    935b:	eb 15                	jmp    9372 <III_stereo+0x494>
                   } else
                   {  ss--;
    935d:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    9361:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    9365:	79 0b                	jns    9372 <III_stereo+0x494>
                      {  i--;
    9367:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    936b:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    9372:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    9376:	79 97                	jns    930f <III_stereo+0x431>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    9378:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    937f:	eb 04                	jmp    9385 <III_stereo+0x4a7>
                   i++;
    9381:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    9385:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9388:	89 d0                	mov    %edx,%eax
    938a:	c1 e0 03             	shl    $0x3,%eax
    938d:	01 d0                	add    %edx,%eax
    938f:	c1 e0 02             	shl    $0x2,%eax
    9392:	01 d0                	add    %edx,%eax
    9394:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9397:	01 d0                	add    %edx,%eax
    9399:	8b 04 85 e0 ef 00 00 	mov    0xefe0(,%eax,4),%eax
    93a0:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    93a3:	7e dc                	jle    9381 <III_stereo+0x4a3>
                   i++;
                sfb = i;
    93a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    93a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    93ab:	8b 55 c8             	mov    -0x38(%ebp),%edx
    93ae:	89 d0                	mov    %edx,%eax
    93b0:	c1 e0 03             	shl    $0x3,%eax
    93b3:	01 d0                	add    %edx,%eax
    93b5:	c1 e0 02             	shl    $0x2,%eax
    93b8:	01 d0                	add    %edx,%eax
    93ba:	8b 55 f0             	mov    -0x10(%ebp),%edx
    93bd:	01 d0                	add    %edx,%eax
    93bf:	8b 04 85 e0 ef 00 00 	mov    0xefe0(,%eax,4),%eax
    93c6:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    93c9:	e9 a9 00 00 00       	jmp    9477 <III_stereo+0x599>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    93ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    93d1:	8d 48 01             	lea    0x1(%eax),%ecx
    93d4:	8b 55 c8             	mov    -0x38(%ebp),%edx
    93d7:	89 d0                	mov    %edx,%eax
    93d9:	c1 e0 03             	shl    $0x3,%eax
    93dc:	01 d0                	add    %edx,%eax
    93de:	c1 e0 02             	shl    $0x2,%eax
    93e1:	01 d0                	add    %edx,%eax
    93e3:	01 c8                	add    %ecx,%eax
    93e5:	8b 0c 85 e0 ef 00 00 	mov    0xefe0(,%eax,4),%ecx
    93ec:	8b 55 c8             	mov    -0x38(%ebp),%edx
    93ef:	89 d0                	mov    %edx,%eax
    93f1:	c1 e0 03             	shl    $0x3,%eax
    93f4:	01 d0                	add    %edx,%eax
    93f6:	c1 e0 02             	shl    $0x2,%eax
    93f9:	01 d0                	add    %edx,%eax
    93fb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    93fe:	01 d0                	add    %edx,%eax
    9400:	8b 04 85 e0 ef 00 00 	mov    0xefe0(,%eax,4),%eax
    9407:	29 c1                	sub    %eax,%ecx
    9409:	89 c8                	mov    %ecx,%eax
    940b:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    940e:	eb 5d                	jmp    946d <III_stereo+0x58f>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    9410:	8b 45 10             	mov    0x10(%ebp),%eax
    9413:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9416:	83 c2 3e             	add    $0x3e,%edx
    9419:	8b 14 90             	mov    (%eax,%edx,4),%edx
    941c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    941f:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    9426:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9429:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9430:	83 f8 07             	cmp    $0x7,%eax
    9433:	74 30                	je     9465 <III_stereo+0x587>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    9435:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9438:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    943f:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    9445:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    944b:	dd 05 40 d7 00 00    	fldl   0xd740
    9451:	de c9                	fmulp  %st,%st(1)
    9453:	dd 1c 24             	fstpl  (%esp)
    9456:	e8 ac b3 ff ff       	call   4807 <tan>
    945b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    945e:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    9465:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    9469:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    946d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9471:	7f 9d                	jg     9410 <III_stereo+0x532>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    9473:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9477:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    947b:	0f 8e 4d ff ff ff    	jle    93ce <III_stereo+0x4f0>
    9481:	e9 1e 03 00 00       	jmp    97a4 <III_stereo+0x8c6>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    9486:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    948d:	e9 08 03 00 00       	jmp    979a <III_stereo+0x8bc>
            {  int sfbcnt;
               sfbcnt = -1;
    9492:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    9499:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    94a0:	e9 0f 01 00 00       	jmp    95b4 <III_stereo+0x6d6>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    94a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    94a8:	8d 48 01             	lea    0x1(%eax),%ecx
    94ab:	8b 55 c8             	mov    -0x38(%ebp),%edx
    94ae:	89 d0                	mov    %edx,%eax
    94b0:	c1 e0 03             	shl    $0x3,%eax
    94b3:	01 d0                	add    %edx,%eax
    94b5:	c1 e0 02             	shl    $0x2,%eax
    94b8:	01 d0                	add    %edx,%eax
    94ba:	01 c8                	add    %ecx,%eax
    94bc:	83 c0 14             	add    $0x14,%eax
    94bf:	8b 0c 85 ec ef 00 00 	mov    0xefec(,%eax,4),%ecx
    94c6:	8b 55 c8             	mov    -0x38(%ebp),%edx
    94c9:	89 d0                	mov    %edx,%eax
    94cb:	c1 e0 03             	shl    $0x3,%eax
    94ce:	01 d0                	add    %edx,%eax
    94d0:	c1 e0 02             	shl    $0x2,%eax
    94d3:	01 d0                	add    %edx,%eax
    94d5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    94d8:	01 d0                	add    %edx,%eax
    94da:	83 c0 14             	add    $0x14,%eax
    94dd:	8b 04 85 ec ef 00 00 	mov    0xefec(,%eax,4),%eax
    94e4:	29 c1                	sub    %eax,%ecx
    94e6:	89 c8                	mov    %ecx,%eax
    94e8:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    94eb:	8b 55 c8             	mov    -0x38(%ebp),%edx
    94ee:	89 d0                	mov    %edx,%eax
    94f0:	c1 e0 03             	shl    $0x3,%eax
    94f3:	01 d0                	add    %edx,%eax
    94f5:	c1 e0 02             	shl    $0x2,%eax
    94f8:	01 d0                	add    %edx,%eax
    94fa:	8b 55 f4             	mov    -0xc(%ebp),%edx
    94fd:	01 d0                	add    %edx,%eax
    94ff:	83 c0 14             	add    $0x14,%eax
    9502:	8b 14 85 ec ef 00 00 	mov    0xefec(,%eax,4),%edx
    9509:	89 d0                	mov    %edx,%eax
    950b:	01 c0                	add    %eax,%eax
    950d:	01 c2                	add    %eax,%edx
    950f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9512:	83 c0 01             	add    $0x1,%eax
    9515:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    9519:	01 d0                	add    %edx,%eax
    951b:	83 e8 01             	sub    $0x1,%eax
    951e:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    9521:	e9 80 00 00 00       	jmp    95a6 <III_stereo+0x6c8>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    9526:	8b 45 08             	mov    0x8(%ebp),%eax
    9529:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    952f:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9532:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9537:	89 c8                	mov    %ecx,%eax
    9539:	f7 ea                	imul   %edx
    953b:	c1 fa 02             	sar    $0x2,%edx
    953e:	89 c8                	mov    %ecx,%eax
    9540:	c1 f8 1f             	sar    $0x1f,%eax
    9543:	89 d3                	mov    %edx,%ebx
    9545:	29 c3                	sub    %eax,%ebx
    9547:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    954a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    954f:	89 c8                	mov    %ecx,%eax
    9551:	f7 ea                	imul   %edx
    9553:	c1 fa 02             	sar    $0x2,%edx
    9556:	89 c8                	mov    %ecx,%eax
    9558:	c1 f8 1f             	sar    $0x1f,%eax
    955b:	29 c2                	sub    %eax,%edx
    955d:	89 d0                	mov    %edx,%eax
    955f:	c1 e0 03             	shl    $0x3,%eax
    9562:	01 d0                	add    %edx,%eax
    9564:	01 c0                	add    %eax,%eax
    9566:	29 c1                	sub    %eax,%ecx
    9568:	89 ca                	mov    %ecx,%edx
    956a:	89 d8                	mov    %ebx,%eax
    956c:	c1 e0 03             	shl    $0x3,%eax
    956f:	01 d8                	add    %ebx,%eax
    9571:	01 c0                	add    %eax,%eax
    9573:	01 d0                	add    %edx,%eax
    9575:	dd 04 c6             	fldl   (%esi,%eax,8)
    9578:	d9 ee                	fldz   
    957a:	df e9                	fucomip %st(1),%st
    957c:	7a 0a                	jp     9588 <III_stereo+0x6aa>
    957e:	d9 ee                	fldz   
    9580:	df e9                	fucomip %st(1),%st
    9582:	dd d8                	fstp   %st(0)
    9584:	74 18                	je     959e <III_stereo+0x6c0>
    9586:	eb 02                	jmp    958a <III_stereo+0x6ac>
    9588:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    958a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    958d:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    9590:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    9597:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    959e:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    95a2:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    95a6:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    95aa:	0f 8f 76 ff ff ff    	jg     9526 <III_stereo+0x648>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    95b0:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    95b4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    95b8:	0f 89 e7 fe ff ff    	jns    94a5 <III_stereo+0x5c7>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    95be:	8b 45 d0             	mov    -0x30(%ebp),%eax
    95c1:	83 c0 01             	add    $0x1,%eax
    95c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    95c7:	e9 f0 00 00 00       	jmp    96bc <III_stereo+0x7de>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    95cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    95cf:	8d 48 01             	lea    0x1(%eax),%ecx
    95d2:	8b 55 c8             	mov    -0x38(%ebp),%edx
    95d5:	89 d0                	mov    %edx,%eax
    95d7:	c1 e0 03             	shl    $0x3,%eax
    95da:	01 d0                	add    %edx,%eax
    95dc:	c1 e0 02             	shl    $0x2,%eax
    95df:	01 d0                	add    %edx,%eax
    95e1:	01 c8                	add    %ecx,%eax
    95e3:	83 c0 14             	add    $0x14,%eax
    95e6:	8b 0c 85 ec ef 00 00 	mov    0xefec(,%eax,4),%ecx
    95ed:	8b 55 c8             	mov    -0x38(%ebp),%edx
    95f0:	89 d0                	mov    %edx,%eax
    95f2:	c1 e0 03             	shl    $0x3,%eax
    95f5:	01 d0                	add    %edx,%eax
    95f7:	c1 e0 02             	shl    $0x2,%eax
    95fa:	01 d0                	add    %edx,%eax
    95fc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    95ff:	01 d0                	add    %edx,%eax
    9601:	83 c0 14             	add    $0x14,%eax
    9604:	8b 04 85 ec ef 00 00 	mov    0xefec(,%eax,4),%eax
    960b:	29 c1                	sub    %eax,%ecx
    960d:	89 c8                	mov    %ecx,%eax
    960f:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    9612:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9615:	89 d0                	mov    %edx,%eax
    9617:	c1 e0 03             	shl    $0x3,%eax
    961a:	01 d0                	add    %edx,%eax
    961c:	c1 e0 02             	shl    $0x2,%eax
    961f:	01 d0                	add    %edx,%eax
    9621:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9624:	01 d0                	add    %edx,%eax
    9626:	83 c0 14             	add    $0x14,%eax
    9629:	8b 14 85 ec ef 00 00 	mov    0xefec(,%eax,4),%edx
    9630:	89 d0                	mov    %edx,%eax
    9632:	01 c0                	add    %eax,%eax
    9634:	01 c2                	add    %eax,%edx
    9636:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9639:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    963d:	01 d0                	add    %edx,%eax
    963f:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    9642:	eb 6e                	jmp    96b2 <III_stereo+0x7d4>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    9644:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9647:	8b 55 ec             	mov    -0x14(%ebp),%edx
    964a:	89 d0                	mov    %edx,%eax
    964c:	01 c0                	add    %eax,%eax
    964e:	01 d0                	add    %edx,%eax
    9650:	c1 e0 02             	shl    $0x2,%eax
    9653:	01 d0                	add    %edx,%eax
    9655:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9658:	01 d0                	add    %edx,%eax
    965a:	83 c0 52             	add    $0x52,%eax
    965d:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    9661:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9664:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    966b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    966e:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9675:	83 f8 07             	cmp    $0x7,%eax
    9678:	74 30                	je     96aa <III_stereo+0x7cc>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    967a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    967d:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9684:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    968a:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9690:	dd 05 40 d7 00 00    	fldl   0xd740
    9696:	de c9                	fmulp  %st,%st(1)
    9698:	dd 1c 24             	fstpl  (%esp)
    969b:	e8 67 b1 ff ff       	call   4807 <tan>
    96a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    96a3:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    96aa:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    96ae:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    96b2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    96b6:	7f 8c                	jg     9644 <III_stereo+0x766>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    96b8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    96bc:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    96c0:	0f 8e 06 ff ff ff    	jle    95cc <III_stereo+0x6ee>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    96c6:	8b 45 c8             	mov    -0x38(%ebp),%eax
    96c9:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    96cf:	05 5c f0 00 00       	add    $0xf05c,%eax
    96d4:	8b 50 0c             	mov    0xc(%eax),%edx
    96d7:	8b 45 c8             	mov    -0x38(%ebp),%eax
    96da:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    96e0:	05 58 f0 00 00       	add    $0xf058,%eax
    96e5:	8b 40 0c             	mov    0xc(%eax),%eax
    96e8:	29 c2                	sub    %eax,%edx
    96ea:	89 d0                	mov    %edx,%eax
    96ec:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    96ef:	8b 45 c8             	mov    -0x38(%ebp),%eax
    96f2:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    96f8:	05 58 f0 00 00       	add    $0xf058,%eax
    96fd:	8b 50 0c             	mov    0xc(%eax),%edx
    9700:	89 d0                	mov    %edx,%eax
    9702:	01 c0                	add    %eax,%eax
    9704:	01 c2                	add    %eax,%edx
    9706:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9709:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    970d:	01 d0                	add    %edx,%eax
    970f:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    9712:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9715:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    971b:	05 60 f0 00 00       	add    $0xf060,%eax
    9720:	8b 50 0c             	mov    0xc(%eax),%edx
    9723:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9726:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    972c:	05 5c f0 00 00       	add    $0xf05c,%eax
    9731:	8b 40 0c             	mov    0xc(%eax),%eax
    9734:	29 c2                	sub    %eax,%edx
    9736:	89 d0                	mov    %edx,%eax
    9738:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    973b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    973e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9744:	05 5c f0 00 00       	add    $0xf05c,%eax
    9749:	8b 50 0c             	mov    0xc(%eax),%edx
    974c:	89 d0                	mov    %edx,%eax
    974e:	01 c0                	add    %eax,%eax
    9750:	01 c2                	add    %eax,%edx
    9752:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9755:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9759:	01 d0                	add    %edx,%eax
    975b:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    975e:	eb 30                	jmp    9790 <III_stereo+0x8b2>
               {  is_pos[i] = is_pos[sfb];
    9760:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9763:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    976a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    976d:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    9774:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9777:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    977e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9781:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    9788:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    978c:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9790:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9794:	7f ca                	jg     9760 <III_stereo+0x882>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    9796:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    979a:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    979e:	0f 8e ee fc ff ff    	jle    9492 <III_stereo+0x5b4>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    97a4:	e9 f0 01 00 00       	jmp    9999 <III_stereo+0xabb>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    97a9:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    97b0:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    97b7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    97be:	eb 63                	jmp    9823 <III_stereo+0x945>
         {  if ( xr[1][i][ss] != 0.0 )
    97c0:	8b 45 08             	mov    0x8(%ebp),%eax
    97c3:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    97c9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    97cc:	89 d0                	mov    %edx,%eax
    97ce:	c1 e0 03             	shl    $0x3,%eax
    97d1:	01 d0                	add    %edx,%eax
    97d3:	01 c0                	add    %eax,%eax
    97d5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    97d8:	01 d0                	add    %edx,%eax
    97da:	dd 04 c1             	fldl   (%ecx,%eax,8)
    97dd:	d9 ee                	fldz   
    97df:	df e9                	fucomip %st(1),%st
    97e1:	7a 0a                	jp     97ed <III_stereo+0x90f>
    97e3:	d9 ee                	fldz   
    97e5:	df e9                	fucomip %st(1),%st
    97e7:	dd d8                	fstp   %st(0)
    97e9:	74 23                	je     980e <III_stereo+0x930>
    97eb:	eb 02                	jmp    97ef <III_stereo+0x911>
    97ed:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    97ef:	8b 55 f0             	mov    -0x10(%ebp),%edx
    97f2:	89 d0                	mov    %edx,%eax
    97f4:	c1 e0 03             	shl    $0x3,%eax
    97f7:	01 d0                	add    %edx,%eax
    97f9:	01 c0                	add    %eax,%eax
    97fb:	89 c2                	mov    %eax,%edx
    97fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9800:	01 d0                	add    %edx,%eax
    9802:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    9805:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    980c:	eb 15                	jmp    9823 <III_stereo+0x945>
            } else
            {  ss--;
    980e:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    9812:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    9816:	79 0b                	jns    9823 <III_stereo+0x945>
               {  i--;
    9818:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    981c:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    9823:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    9827:	79 97                	jns    97c0 <III_stereo+0x8e2>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    9829:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    9830:	eb 04                	jmp    9836 <III_stereo+0x958>
            i++;
    9832:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    9836:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9839:	89 d0                	mov    %edx,%eax
    983b:	c1 e0 03             	shl    $0x3,%eax
    983e:	01 d0                	add    %edx,%eax
    9840:	c1 e0 02             	shl    $0x2,%eax
    9843:	01 d0                	add    %edx,%eax
    9845:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9848:	01 d0                	add    %edx,%eax
    984a:	8b 04 85 e0 ef 00 00 	mov    0xefe0(,%eax,4),%eax
    9851:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    9854:	7e dc                	jle    9832 <III_stereo+0x954>
            i++;
         sfb = i;
    9856:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9859:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    985c:	8b 55 c8             	mov    -0x38(%ebp),%edx
    985f:	89 d0                	mov    %edx,%eax
    9861:	c1 e0 03             	shl    $0x3,%eax
    9864:	01 d0                	add    %edx,%eax
    9866:	c1 e0 02             	shl    $0x2,%eax
    9869:	01 d0                	add    %edx,%eax
    986b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    986e:	01 d0                	add    %edx,%eax
    9870:	8b 04 85 e0 ef 00 00 	mov    0xefe0(,%eax,4),%eax
    9877:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    987a:	e9 a9 00 00 00       	jmp    9928 <III_stereo+0xa4a>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    987f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9882:	8d 48 01             	lea    0x1(%eax),%ecx
    9885:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9888:	89 d0                	mov    %edx,%eax
    988a:	c1 e0 03             	shl    $0x3,%eax
    988d:	01 d0                	add    %edx,%eax
    988f:	c1 e0 02             	shl    $0x2,%eax
    9892:	01 d0                	add    %edx,%eax
    9894:	01 c8                	add    %ecx,%eax
    9896:	8b 0c 85 e0 ef 00 00 	mov    0xefe0(,%eax,4),%ecx
    989d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    98a0:	89 d0                	mov    %edx,%eax
    98a2:	c1 e0 03             	shl    $0x3,%eax
    98a5:	01 d0                	add    %edx,%eax
    98a7:	c1 e0 02             	shl    $0x2,%eax
    98aa:	01 d0                	add    %edx,%eax
    98ac:	8b 55 f4             	mov    -0xc(%ebp),%edx
    98af:	01 d0                	add    %edx,%eax
    98b1:	8b 04 85 e0 ef 00 00 	mov    0xefe0(,%eax,4),%eax
    98b8:	29 c1                	sub    %eax,%ecx
    98ba:	89 c8                	mov    %ecx,%eax
    98bc:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    98bf:	eb 5d                	jmp    991e <III_stereo+0xa40>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    98c1:	8b 45 10             	mov    0x10(%ebp),%eax
    98c4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    98c7:	83 c2 3e             	add    $0x3e,%edx
    98ca:	8b 14 90             	mov    (%eax,%edx,4),%edx
    98cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    98d0:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    98d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    98da:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    98e1:	83 f8 07             	cmp    $0x7,%eax
    98e4:	74 30                	je     9916 <III_stereo+0xa38>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    98e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    98e9:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    98f0:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    98f6:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    98fc:	dd 05 40 d7 00 00    	fldl   0xd740
    9902:	de c9                	fmulp  %st,%st(1)
    9904:	dd 1c 24             	fstpl  (%esp)
    9907:	e8 fb ae ff ff       	call   4807 <tan>
    990c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    990f:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    9916:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    991a:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    991e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9922:	7f 9d                	jg     98c1 <III_stereo+0x9e3>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    9924:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9928:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    992c:	0f 8e 4d ff ff ff    	jle    987f <III_stereo+0x9a1>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    9932:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9935:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    993b:	05 30 f0 00 00       	add    $0xf030,%eax
    9940:	8b 00                	mov    (%eax),%eax
    9942:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    9945:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9948:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    994e:	05 34 f0 00 00       	add    $0xf034,%eax
    9953:	8b 00                	mov    (%eax),%eax
    9955:	ba 40 02 00 00       	mov    $0x240,%edx
    995a:	29 c2                	sub    %eax,%edx
    995c:	89 d0                	mov    %edx,%eax
    995e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    9961:	eb 30                	jmp    9993 <III_stereo+0xab5>
         {  is_pos[i] = is_pos[sfb];
    9963:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9966:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    996d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9970:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    9977:	8b 45 f4             	mov    -0xc(%ebp),%eax
    997a:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9981:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9984:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    998b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    998f:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9993:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    9997:	7f ca                	jg     9963 <III_stereo+0xa85>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    9999:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    99a0:	eb 55                	jmp    99f7 <III_stereo+0xb19>
      for(sb=0;sb<SBLIMIT;sb++)
    99a2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    99a9:	eb 42                	jmp    99ed <III_stereo+0xb0f>
         for(ss=0;ss<SSLIMIT;ss++)
    99ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    99b2:	eb 2f                	jmp    99e3 <III_stereo+0xb05>
            lr[ch][sb][ss] = 0;
    99b4:	8b 55 e0             	mov    -0x20(%ebp),%edx
    99b7:	89 d0                	mov    %edx,%eax
    99b9:	c1 e0 03             	shl    $0x3,%eax
    99bc:	01 d0                	add    %edx,%eax
    99be:	c1 e0 09             	shl    $0x9,%eax
    99c1:	89 c2                	mov    %eax,%edx
    99c3:	8b 45 0c             	mov    0xc(%ebp),%eax
    99c6:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    99c9:	8b 55 e8             	mov    -0x18(%ebp),%edx
    99cc:	89 d0                	mov    %edx,%eax
    99ce:	c1 e0 03             	shl    $0x3,%eax
    99d1:	01 d0                	add    %edx,%eax
    99d3:	01 c0                	add    %eax,%eax
    99d5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    99d8:	01 d0                	add    %edx,%eax
    99da:	d9 ee                	fldz   
    99dc:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    99df:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    99e3:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    99e7:	7e cb                	jle    99b4 <III_stereo+0xad6>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    99e9:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    99ed:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    99f1:	7e b8                	jle    99ab <III_stereo+0xacd>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    99f3:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    99f7:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    99fb:	7e a5                	jle    99a2 <III_stereo+0xac4>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    99fd:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    9a01:	0f 85 3d 02 00 00    	jne    9c44 <III_stereo+0xd66>
      for(sb=0;sb<SBLIMIT;sb++)
    9a07:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9a0e:	e9 25 02 00 00       	jmp    9c38 <III_stereo+0xd5a>
         for(ss=0;ss<SSLIMIT;ss++) {
    9a13:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    9a1a:	e9 0b 02 00 00       	jmp    9c2a <III_stereo+0xd4c>
            i = (sb*18)+ss;
    9a1f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9a22:	89 d0                	mov    %edx,%eax
    9a24:	c1 e0 03             	shl    $0x3,%eax
    9a27:	01 d0                	add    %edx,%eax
    9a29:	01 c0                	add    %eax,%eax
    9a2b:	89 c2                	mov    %eax,%edx
    9a2d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9a30:	01 d0                	add    %edx,%eax
    9a32:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    9a35:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9a38:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9a3f:	83 f8 07             	cmp    $0x7,%eax
    9a42:	0f 85 2c 01 00 00    	jne    9b74 <III_stereo+0xc96>
               if ( ms_stereo ) {
    9a48:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    9a4c:	0f 84 b5 00 00 00    	je     9b07 <III_stereo+0xc29>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    9a52:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9a55:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9a58:	89 d0                	mov    %edx,%eax
    9a5a:	c1 e0 03             	shl    $0x3,%eax
    9a5d:	01 d0                	add    %edx,%eax
    9a5f:	01 c0                	add    %eax,%eax
    9a61:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9a64:	01 d0                	add    %edx,%eax
    9a66:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9a69:	8b 45 08             	mov    0x8(%ebp),%eax
    9a6c:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9a72:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9a75:	89 d0                	mov    %edx,%eax
    9a77:	c1 e0 03             	shl    $0x3,%eax
    9a7a:	01 d0                	add    %edx,%eax
    9a7c:	01 c0                	add    %eax,%eax
    9a7e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9a81:	01 d0                	add    %edx,%eax
    9a83:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9a86:	de c1                	faddp  %st,%st(1)
    9a88:	dd 05 48 d7 00 00    	fldl   0xd748
    9a8e:	de f9                	fdivrp %st,%st(1)
    9a90:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9a93:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9a96:	89 d0                	mov    %edx,%eax
    9a98:	c1 e0 03             	shl    $0x3,%eax
    9a9b:	01 d0                	add    %edx,%eax
    9a9d:	01 c0                	add    %eax,%eax
    9a9f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9aa2:	01 d0                	add    %edx,%eax
    9aa4:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    9aa7:	8b 45 0c             	mov    0xc(%ebp),%eax
    9aaa:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    9ab0:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9ab3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9ab6:	89 d0                	mov    %edx,%eax
    9ab8:	c1 e0 03             	shl    $0x3,%eax
    9abb:	01 d0                	add    %edx,%eax
    9abd:	01 c0                	add    %eax,%eax
    9abf:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9ac2:	01 d0                	add    %edx,%eax
    9ac4:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9ac7:	8b 45 08             	mov    0x8(%ebp),%eax
    9aca:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9ad0:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9ad3:	89 d0                	mov    %edx,%eax
    9ad5:	c1 e0 03             	shl    $0x3,%eax
    9ad8:	01 d0                	add    %edx,%eax
    9ada:	01 c0                	add    %eax,%eax
    9adc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9adf:	01 d0                	add    %edx,%eax
    9ae1:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9ae4:	de e9                	fsubrp %st,%st(1)
    9ae6:	dd 05 48 d7 00 00    	fldl   0xd748
    9aec:	de f9                	fdivrp %st,%st(1)
    9aee:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9af1:	89 d0                	mov    %edx,%eax
    9af3:	c1 e0 03             	shl    $0x3,%eax
    9af6:	01 d0                	add    %edx,%eax
    9af8:	01 c0                	add    %eax,%eax
    9afa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9afd:	01 d0                	add    %edx,%eax
    9aff:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    9b02:	e9 1f 01 00 00       	jmp    9c26 <III_stereo+0xd48>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    9b07:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9b0a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b0d:	89 d0                	mov    %edx,%eax
    9b0f:	c1 e0 03             	shl    $0x3,%eax
    9b12:	01 d0                	add    %edx,%eax
    9b14:	01 c0                	add    %eax,%eax
    9b16:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9b19:	01 d0                	add    %edx,%eax
    9b1b:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9b1e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9b21:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b24:	89 d0                	mov    %edx,%eax
    9b26:	c1 e0 03             	shl    $0x3,%eax
    9b29:	01 d0                	add    %edx,%eax
    9b2b:	01 c0                	add    %eax,%eax
    9b2d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9b30:	01 d0                	add    %edx,%eax
    9b32:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    9b35:	8b 45 0c             	mov    0xc(%ebp),%eax
    9b38:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9b3e:	8b 45 08             	mov    0x8(%ebp),%eax
    9b41:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    9b47:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b4a:	89 d0                	mov    %edx,%eax
    9b4c:	c1 e0 03             	shl    $0x3,%eax
    9b4f:	01 d0                	add    %edx,%eax
    9b51:	01 c0                	add    %eax,%eax
    9b53:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9b56:	01 d0                	add    %edx,%eax
    9b58:	dd 04 c3             	fldl   (%ebx,%eax,8)
    9b5b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b5e:	89 d0                	mov    %edx,%eax
    9b60:	c1 e0 03             	shl    $0x3,%eax
    9b63:	01 d0                	add    %edx,%eax
    9b65:	01 c0                	add    %eax,%eax
    9b67:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9b6a:	01 d0                	add    %edx,%eax
    9b6c:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    9b6f:	e9 b2 00 00 00       	jmp    9c26 <III_stereo+0xd48>
               }
            }
            else if (i_stereo ) {
    9b74:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    9b78:	0f 84 94 00 00 00    	je     9c12 <III_stereo+0xd34>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    9b7e:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9b81:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9b84:	89 d0                	mov    %edx,%eax
    9b86:	c1 e0 03             	shl    $0x3,%eax
    9b89:	01 d0                	add    %edx,%eax
    9b8b:	01 c0                	add    %eax,%eax
    9b8d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9b90:	01 d0                	add    %edx,%eax
    9b92:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9b95:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9b98:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9b9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9ba2:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9ba9:	d9 e8                	fld1   
    9bab:	de c1                	faddp  %st,%st(1)
    9bad:	de f9                	fdivrp %st,%st(1)
    9baf:	de c9                	fmulp  %st,%st(1)
    9bb1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9bb4:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9bb7:	89 d0                	mov    %edx,%eax
    9bb9:	c1 e0 03             	shl    $0x3,%eax
    9bbc:	01 d0                	add    %edx,%eax
    9bbe:	01 c0                	add    %eax,%eax
    9bc0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9bc3:	01 d0                	add    %edx,%eax
    9bc5:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    9bc8:	8b 45 0c             	mov    0xc(%ebp),%eax
    9bcb:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    9bd1:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9bd4:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9bd7:	89 d0                	mov    %edx,%eax
    9bd9:	c1 e0 03             	shl    $0x3,%eax
    9bdc:	01 d0                	add    %edx,%eax
    9bde:	01 c0                	add    %eax,%eax
    9be0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9be3:	01 d0                	add    %edx,%eax
    9be5:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9be8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9beb:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9bf2:	d9 e8                	fld1   
    9bf4:	de c1                	faddp  %st,%st(1)
    9bf6:	d9 e8                	fld1   
    9bf8:	de f1                	fdivp  %st,%st(1)
    9bfa:	de c9                	fmulp  %st,%st(1)
    9bfc:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9bff:	89 d0                	mov    %edx,%eax
    9c01:	c1 e0 03             	shl    $0x3,%eax
    9c04:	01 d0                	add    %edx,%eax
    9c06:	01 c0                	add    %eax,%eax
    9c08:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9c0b:	01 d0                	add    %edx,%eax
    9c0d:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    9c10:	eb 14                	jmp    9c26 <III_stereo+0xd48>
            }
            else {
               printf(0,"Error in streo processing\n");
    9c12:	c7 44 24 04 e0 c6 00 	movl   $0xc6e0,0x4(%esp)
    9c19:	00 
    9c1a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    9c21:	e8 3c a7 ff ff       	call   4362 <printf>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    9c26:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9c2a:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    9c2e:	0f 8e eb fd ff ff    	jle    9a1f <III_stereo+0xb41>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    9c34:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9c38:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    9c3c:	0f 8e d1 fd ff ff    	jle    9a13 <III_stereo+0xb35>
    9c42:	eb 54                	jmp    9c98 <III_stereo+0xdba>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    9c44:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9c4b:	eb 45                	jmp    9c92 <III_stereo+0xdb4>
         for(ss=0;ss<SSLIMIT;ss++)
    9c4d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    9c54:	eb 32                	jmp    9c88 <III_stereo+0xdaa>
            lr[0][sb][ss] = xr[0][sb][ss];
    9c56:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9c59:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9c5c:	89 d0                	mov    %edx,%eax
    9c5e:	c1 e0 03             	shl    $0x3,%eax
    9c61:	01 d0                	add    %edx,%eax
    9c63:	01 c0                	add    %eax,%eax
    9c65:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9c68:	01 d0                	add    %edx,%eax
    9c6a:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9c6d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9c70:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9c73:	89 d0                	mov    %edx,%eax
    9c75:	c1 e0 03             	shl    $0x3,%eax
    9c78:	01 d0                	add    %edx,%eax
    9c7a:	01 c0                	add    %eax,%eax
    9c7c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9c7f:	01 d0                	add    %edx,%eax
    9c81:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    9c84:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9c88:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    9c8c:	7e c8                	jle    9c56 <III_stereo+0xd78>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    9c8e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9c92:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    9c96:	7e b5                	jle    9c4d <III_stereo+0xd6f>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    9c98:	81 c4 50 1b 00 00    	add    $0x1b50,%esp
    9c9e:	5b                   	pop    %ebx
    9c9f:	5e                   	pop    %esi
    9ca0:	5d                   	pop    %ebp
    9ca1:	c3                   	ret    

00009ca2 <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    9ca2:	55                   	push   %ebp
    9ca3:	89 e5                	mov    %esp,%ebp
    9ca5:	83 ec 48             	sub    $0x48,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    9ca8:	a1 40 f2 00 00       	mov    0xf240,%eax
    9cad:	85 c0                	test   %eax,%eax
    9caf:	74 68                	je     9d19 <III_antialias+0x77>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    9cb1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9cb8:	eb 4f                	jmp    9d09 <III_antialias+0x67>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    9cba:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9cbd:	dd 04 c5 00 f2 00 00 	fldl   0xf200(,%eax,8)
    9cc4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9cc7:	dd 04 c5 00 f2 00 00 	fldl   0xf200(,%eax,8)
    9cce:	de c9                	fmulp  %st,%st(1)
    9cd0:	d9 e8                	fld1   
    9cd2:	de c1                	faddp  %st,%st(1)
    9cd4:	dd 1c 24             	fstpl  (%esp)
    9cd7:	e8 de ac ff ff       	call   49ba <sqrt>
    9cdc:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    9cdf:	d9 e8                	fld1   
    9ce1:	dc 75 e0             	fdivl  -0x20(%ebp)
    9ce4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9ce7:	dd 1c c5 a0 f2 00 00 	fstpl  0xf2a0(,%eax,8)
         ca[i] = Ci[i]/sq;
    9cee:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9cf1:	dd 04 c5 00 f2 00 00 	fldl   0xf200(,%eax,8)
    9cf8:	dc 75 e0             	fdivl  -0x20(%ebp)
    9cfb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9cfe:	dd 1c c5 e0 f2 00 00 	fstpl  0xf2e0(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    9d05:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9d09:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    9d0d:	7e ab                	jle    9cba <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    9d0f:	c7 05 40 f2 00 00 00 	movl   $0x0,0xf240
    9d16:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    9d19:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9d20:	eb 4c                	jmp    9d6e <III_antialias+0xcc>
       for(ss=0;ss<SSLIMIT;ss++)
    9d22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9d29:	eb 39                	jmp    9d64 <III_antialias+0xc2>
          hybridIn[sb][ss] = xr[sb][ss];
    9d2b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9d2e:	89 d0                	mov    %edx,%eax
    9d30:	c1 e0 03             	shl    $0x3,%eax
    9d33:	01 d0                	add    %edx,%eax
    9d35:	c1 e0 04             	shl    $0x4,%eax
    9d38:	89 c2                	mov    %eax,%edx
    9d3a:	8b 45 0c             	mov    0xc(%ebp),%eax
    9d3d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9d40:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9d43:	89 d0                	mov    %edx,%eax
    9d45:	c1 e0 03             	shl    $0x3,%eax
    9d48:	01 d0                	add    %edx,%eax
    9d4a:	c1 e0 04             	shl    $0x4,%eax
    9d4d:	89 c2                	mov    %eax,%edx
    9d4f:	8b 45 08             	mov    0x8(%ebp),%eax
    9d52:	01 c2                	add    %eax,%edx
    9d54:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d57:	dd 04 c2             	fldl   (%edx,%eax,8)
    9d5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9d5d:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    9d60:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9d64:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9d68:	7e c1                	jle    9d2b <III_antialias+0x89>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    9d6a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9d6e:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    9d72:	7e ae                	jle    9d22 <III_antialias+0x80>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    9d74:	8b 45 10             	mov    0x10(%ebp),%eax
    9d77:	8b 40 10             	mov    0x10(%eax),%eax
    9d7a:	85 c0                	test   %eax,%eax
    9d7c:	74 1a                	je     9d98 <III_antialias+0xf6>
    9d7e:	8b 45 10             	mov    0x10(%ebp),%eax
    9d81:	8b 40 14             	mov    0x14(%eax),%eax
    9d84:	83 f8 02             	cmp    $0x2,%eax
    9d87:	75 0f                	jne    9d98 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    9d89:	8b 45 10             	mov    0x10(%ebp),%eax
    9d8c:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    9d8f:	85 c0                	test   %eax,%eax
    9d91:	75 05                	jne    9d98 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    9d93:	e9 1c 01 00 00       	jmp    9eb4 <III_antialias+0x212>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9d98:	8b 45 10             	mov    0x10(%ebp),%eax
    9d9b:	8b 40 10             	mov    0x10(%eax),%eax
    9d9e:	85 c0                	test   %eax,%eax
    9da0:	74 1e                	je     9dc0 <III_antialias+0x11e>
    9da2:	8b 45 10             	mov    0x10(%ebp),%eax
    9da5:	8b 40 18             	mov    0x18(%eax),%eax
    9da8:	85 c0                	test   %eax,%eax
    9daa:	74 14                	je     9dc0 <III_antialias+0x11e>
     (gr_info->block_type == 2))
    9dac:	8b 45 10             	mov    0x10(%ebp),%eax
    9daf:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9db2:	83 f8 02             	cmp    $0x2,%eax
    9db5:	75 09                	jne    9dc0 <III_antialias+0x11e>
     (gr_info->block_type == 2))
      sblim = 1;
    9db7:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    9dbe:	eb 07                	jmp    9dc7 <III_antialias+0x125>
   else
      sblim = SBLIMIT-1;
    9dc0:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    9dc7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9dce:	e9 d5 00 00 00       	jmp    9ea8 <III_antialias+0x206>
      for(ss=0;ss<8;ss++) {
    9dd3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9dda:	e9 bb 00 00 00       	jmp    9e9a <III_antialias+0x1f8>
         bu = xr[sb][17-ss];
    9ddf:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9de2:	89 d0                	mov    %edx,%eax
    9de4:	c1 e0 03             	shl    $0x3,%eax
    9de7:	01 d0                	add    %edx,%eax
    9de9:	c1 e0 04             	shl    $0x4,%eax
    9dec:	89 c2                	mov    %eax,%edx
    9dee:	8b 45 08             	mov    0x8(%ebp),%eax
    9df1:	01 c2                	add    %eax,%edx
    9df3:	b8 11 00 00 00       	mov    $0x11,%eax
    9df8:	2b 45 f4             	sub    -0xc(%ebp),%eax
    9dfb:	dd 04 c2             	fldl   (%edx,%eax,8)
    9dfe:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    9e01:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e04:	8d 50 01             	lea    0x1(%eax),%edx
    9e07:	89 d0                	mov    %edx,%eax
    9e09:	c1 e0 03             	shl    $0x3,%eax
    9e0c:	01 d0                	add    %edx,%eax
    9e0e:	c1 e0 04             	shl    $0x4,%eax
    9e11:	89 c2                	mov    %eax,%edx
    9e13:	8b 45 08             	mov    0x8(%ebp),%eax
    9e16:	01 c2                	add    %eax,%edx
    9e18:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9e1b:	dd 04 c2             	fldl   (%edx,%eax,8)
    9e1e:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    9e21:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9e24:	89 d0                	mov    %edx,%eax
    9e26:	c1 e0 03             	shl    $0x3,%eax
    9e29:	01 d0                	add    %edx,%eax
    9e2b:	c1 e0 04             	shl    $0x4,%eax
    9e2e:	89 c2                	mov    %eax,%edx
    9e30:	8b 45 0c             	mov    0xc(%ebp),%eax
    9e33:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9e36:	b8 11 00 00 00       	mov    $0x11,%eax
    9e3b:	2b 45 f4             	sub    -0xc(%ebp),%eax
    9e3e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9e41:	dd 04 d5 a0 f2 00 00 	fldl   0xf2a0(,%edx,8)
    9e48:	dc 4d d8             	fmull  -0x28(%ebp)
    9e4b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9e4e:	dd 04 d5 e0 f2 00 00 	fldl   0xf2e0(,%edx,8)
    9e55:	dc 4d d0             	fmull  -0x30(%ebp)
    9e58:	de e9                	fsubrp %st,%st(1)
    9e5a:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    9e5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e60:	8d 50 01             	lea    0x1(%eax),%edx
    9e63:	89 d0                	mov    %edx,%eax
    9e65:	c1 e0 03             	shl    $0x3,%eax
    9e68:	01 d0                	add    %edx,%eax
    9e6a:	c1 e0 04             	shl    $0x4,%eax
    9e6d:	89 c2                	mov    %eax,%edx
    9e6f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9e72:	01 c2                	add    %eax,%edx
    9e74:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9e77:	dd 04 c5 a0 f2 00 00 	fldl   0xf2a0(,%eax,8)
    9e7e:	dc 4d d0             	fmull  -0x30(%ebp)
    9e81:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9e84:	dd 04 c5 e0 f2 00 00 	fldl   0xf2e0(,%eax,8)
    9e8b:	dc 4d d8             	fmull  -0x28(%ebp)
    9e8e:	de c1                	faddp  %st,%st(1)
    9e90:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9e93:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    9e96:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9e9a:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    9e9e:	0f 8e 3b ff ff ff    	jle    9ddf <III_antialias+0x13d>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    9ea4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9ea8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9eab:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    9eae:	0f 8c 1f ff ff ff    	jl     9dd3 <III_antialias+0x131>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    9eb4:	c9                   	leave  
    9eb5:	c3                   	ret    

00009eb6 <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    9eb6:	55                   	push   %ebp
    9eb7:	89 e5                	mov    %esp,%ebp
    9eb9:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    9ebf:	a1 20 f3 00 00       	mov    0xf320,%eax
    9ec4:	85 c0                	test   %eax,%eax
    9ec6:	0f 85 59 02 00 00    	jne    a125 <inv_mdct+0x26f>

    /* type 0 */
      for(i=0;i<36;i++)
    9ecc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9ed3:	eb 29                	jmp    9efe <inv_mdct+0x48>
         win[0][i] = sin( PI/36 *(i+0.5) );
    9ed5:	db 45 f4             	fildl  -0xc(%ebp)
    9ed8:	dd 05 50 d7 00 00    	fldl   0xd750
    9ede:	de c1                	faddp  %st,%st(1)
    9ee0:	dd 05 58 d7 00 00    	fldl   0xd758
    9ee6:	de c9                	fmulp  %st,%st(1)
    9ee8:	dd 1c 24             	fstpl  (%esp)
    9eeb:	e8 53 a8 ff ff       	call   4743 <sin>
    9ef0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9ef3:	dd 1c c5 40 f3 00 00 	fstpl  0xf340(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    9efa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9efe:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9f02:	7e d1                	jle    9ed5 <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    9f04:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9f0b:	eb 2c                	jmp    9f39 <inv_mdct+0x83>
         win[1][i] = sin( PI/36 *(i+0.5) );
    9f0d:	db 45 f4             	fildl  -0xc(%ebp)
    9f10:	dd 05 50 d7 00 00    	fldl   0xd750
    9f16:	de c1                	faddp  %st,%st(1)
    9f18:	dd 05 58 d7 00 00    	fldl   0xd758
    9f1e:	de c9                	fmulp  %st,%st(1)
    9f20:	dd 1c 24             	fstpl  (%esp)
    9f23:	e8 1b a8 ff ff       	call   4743 <sin>
    9f28:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f2b:	83 c0 24             	add    $0x24,%eax
    9f2e:	dd 1c c5 40 f3 00 00 	fstpl  0xf340(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    9f35:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9f39:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9f3d:	7e ce                	jle    9f0d <inv_mdct+0x57>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    9f3f:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    9f46:	eb 13                	jmp    9f5b <inv_mdct+0xa5>
         win[1][i] = 1.0;
    9f48:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f4b:	83 c0 24             	add    $0x24,%eax
    9f4e:	d9 e8                	fld1   
    9f50:	dd 1c c5 40 f3 00 00 	fstpl  0xf340(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    9f57:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9f5b:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    9f5f:	7e e7                	jle    9f48 <inv_mdct+0x92>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    9f61:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    9f68:	eb 34                	jmp    9f9e <inv_mdct+0xe8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    9f6a:	db 45 f4             	fildl  -0xc(%ebp)
    9f6d:	dd 05 50 d7 00 00    	fldl   0xd750
    9f73:	de c1                	faddp  %st,%st(1)
    9f75:	dd 05 60 d7 00 00    	fldl   0xd760
    9f7b:	de e9                	fsubrp %st,%st(1)
    9f7d:	dd 05 40 d7 00 00    	fldl   0xd740
    9f83:	de c9                	fmulp  %st,%st(1)
    9f85:	dd 1c 24             	fstpl  (%esp)
    9f88:	e8 b6 a7 ff ff       	call   4743 <sin>
    9f8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f90:	83 c0 24             	add    $0x24,%eax
    9f93:	dd 1c c5 40 f3 00 00 	fstpl  0xf340(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    9f9a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9f9e:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    9fa2:	7e c6                	jle    9f6a <inv_mdct+0xb4>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    9fa4:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    9fab:	eb 13                	jmp    9fc0 <inv_mdct+0x10a>
         win[1][i] = 0.0;
    9fad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fb0:	83 c0 24             	add    $0x24,%eax
    9fb3:	d9 ee                	fldz   
    9fb5:	dd 1c c5 40 f3 00 00 	fstpl  0xf340(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    9fbc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9fc0:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9fc4:	7e e7                	jle    9fad <inv_mdct+0xf7>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    9fc6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9fcd:	eb 13                	jmp    9fe2 <inv_mdct+0x12c>
         win[3][i] = 0.0;
    9fcf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fd2:	83 c0 6c             	add    $0x6c,%eax
    9fd5:	d9 ee                	fldz   
    9fd7:	dd 1c c5 40 f3 00 00 	fstpl  0xf340(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    9fde:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9fe2:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    9fe6:	7e e7                	jle    9fcf <inv_mdct+0x119>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    9fe8:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    9fef:	eb 34                	jmp    a025 <inv_mdct+0x16f>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    9ff1:	db 45 f4             	fildl  -0xc(%ebp)
    9ff4:	dd 05 50 d7 00 00    	fldl   0xd750
    9ffa:	de c1                	faddp  %st,%st(1)
    9ffc:	dd 05 68 d7 00 00    	fldl   0xd768
    a002:	de e9                	fsubrp %st,%st(1)
    a004:	dd 05 40 d7 00 00    	fldl   0xd740
    a00a:	de c9                	fmulp  %st,%st(1)
    a00c:	dd 1c 24             	fstpl  (%esp)
    a00f:	e8 2f a7 ff ff       	call   4743 <sin>
    a014:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a017:	83 c0 6c             	add    $0x6c,%eax
    a01a:	dd 1c c5 40 f3 00 00 	fstpl  0xf340(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    a021:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a025:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a029:	7e c6                	jle    9ff1 <inv_mdct+0x13b>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    a02b:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    a032:	eb 13                	jmp    a047 <inv_mdct+0x191>
         win[3][i] =1.0;
    a034:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a037:	83 c0 6c             	add    $0x6c,%eax
    a03a:	d9 e8                	fld1   
    a03c:	dd 1c c5 40 f3 00 00 	fstpl  0xf340(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    a043:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a047:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a04b:	7e e7                	jle    a034 <inv_mdct+0x17e>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    a04d:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    a054:	eb 2c                	jmp    a082 <inv_mdct+0x1cc>
         win[3][i] = sin( PI/36*(i+0.5) );
    a056:	db 45 f4             	fildl  -0xc(%ebp)
    a059:	dd 05 50 d7 00 00    	fldl   0xd750
    a05f:	de c1                	faddp  %st,%st(1)
    a061:	dd 05 58 d7 00 00    	fldl   0xd758
    a067:	de c9                	fmulp  %st,%st(1)
    a069:	dd 1c 24             	fstpl  (%esp)
    a06c:	e8 d2 a6 ff ff       	call   4743 <sin>
    a071:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a074:	83 c0 6c             	add    $0x6c,%eax
    a077:	dd 1c c5 40 f3 00 00 	fstpl  0xf340(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    a07e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a082:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a086:	7e ce                	jle    a056 <inv_mdct+0x1a0>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    a088:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a08f:	eb 2c                	jmp    a0bd <inv_mdct+0x207>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    a091:	db 45 f4             	fildl  -0xc(%ebp)
    a094:	dd 05 50 d7 00 00    	fldl   0xd750
    a09a:	de c1                	faddp  %st,%st(1)
    a09c:	dd 05 40 d7 00 00    	fldl   0xd740
    a0a2:	de c9                	fmulp  %st,%st(1)
    a0a4:	dd 1c 24             	fstpl  (%esp)
    a0a7:	e8 97 a6 ff ff       	call   4743 <sin>
    a0ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a0af:	83 c0 48             	add    $0x48,%eax
    a0b2:	dd 1c c5 40 f3 00 00 	fstpl  0xf340(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    a0b9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a0bd:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    a0c1:	7e ce                	jle    a091 <inv_mdct+0x1db>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    a0c3:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    a0ca:	eb 13                	jmp    a0df <inv_mdct+0x229>
         win[2][i] = 0.0 ;
    a0cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a0cf:	83 c0 48             	add    $0x48,%eax
    a0d2:	d9 ee                	fldz   
    a0d4:	dd 1c c5 40 f3 00 00 	fstpl  0xf340(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    a0db:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a0df:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a0e3:	7e e7                	jle    a0cc <inv_mdct+0x216>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    a0e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a0ec:	eb 21                	jmp    a10f <inv_mdct+0x259>
         COS[i] = cos(PI/(2*36) * i);
    a0ee:	db 45 f4             	fildl  -0xc(%ebp)
    a0f1:	dd 05 70 d7 00 00    	fldl   0xd770
    a0f7:	de c9                	fmulp  %st,%st(1)
    a0f9:	dd 1c 24             	fstpl  (%esp)
    a0fc:	e8 e1 a6 ff ff       	call   47e2 <cos>
    a101:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a104:	dd 1c c5 c0 f7 00 00 	fstpl  0xf7c0(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    a10b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a10f:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    a116:	7e d6                	jle    a0ee <inv_mdct+0x238>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    a118:	a1 20 f3 00 00       	mov    0xf320,%eax
    a11d:	83 c0 01             	add    $0x1,%eax
    a120:	a3 20 f3 00 00       	mov    %eax,0xf320
    }

    for(i=0;i<36;i++)
    a125:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a12c:	eb 17                	jmp    a145 <inv_mdct+0x28f>
       out[i]=0;
    a12e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a131:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a138:	8b 45 0c             	mov    0xc(%ebp),%eax
    a13b:	01 d0                	add    %edx,%eax
    a13d:	d9 ee                	fldz   
    a13f:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    a141:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a145:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    a149:	7e e3                	jle    a12e <inv_mdct+0x278>
       out[i]=0;

    if(block_type == 2){
    a14b:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    a14f:	0f 85 85 01 00 00    	jne    a2da <inv_mdct+0x424>
       N=12;
    a155:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    a15c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a163:	e9 63 01 00 00       	jmp    a2cb <inv_mdct+0x415>
          for(p= 0;p<N;p++){
    a168:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a16f:	e9 df 00 00 00       	jmp    a253 <inv_mdct+0x39d>
             sum = 0.0;
    a174:	d9 ee                	fldz   
    a176:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    a179:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a180:	e9 8f 00 00 00       	jmp    a214 <inv_mdct+0x35e>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    a185:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a188:	89 d0                	mov    %edx,%eax
    a18a:	01 c0                	add    %eax,%eax
    a18c:	01 c2                	add    %eax,%edx
    a18e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a191:	01 d0                	add    %edx,%eax
    a193:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a19a:	8b 45 08             	mov    0x8(%ebp),%eax
    a19d:	01 d0                	add    %edx,%eax
    a19f:	dd 00                	fldl   (%eax)
    a1a1:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
    a1a7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a1aa:	01 c0                	add    %eax,%eax
    a1ac:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    a1b2:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    a1b8:	dd 05 78 d7 00 00    	fldl   0xd778
    a1be:	de f1                	fdivp  %st,%st(1)
    a1c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a1c3:	01 c0                	add    %eax,%eax
    a1c5:	8d 50 01             	lea    0x1(%eax),%edx
    a1c8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a1cb:	89 c1                	mov    %eax,%ecx
    a1cd:	c1 e9 1f             	shr    $0x1f,%ecx
    a1d0:	01 c8                	add    %ecx,%eax
    a1d2:	d1 f8                	sar    %eax
    a1d4:	01 d0                	add    %edx,%eax
    a1d6:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    a1dc:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    a1e2:	de c9                	fmulp  %st,%st(1)
    a1e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a1e7:	01 c0                	add    %eax,%eax
    a1e9:	83 c0 01             	add    $0x1,%eax
    a1ec:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    a1f2:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    a1f8:	de c9                	fmulp  %st,%st(1)
    a1fa:	dd 1c 24             	fstpl  (%esp)
    a1fd:	e8 e0 a5 ff ff       	call   47e2 <cos>
    a202:	dc 8d 68 ff ff ff    	fmull  -0x98(%ebp)
    a208:	dd 45 e0             	fldl   -0x20(%ebp)
    a20b:	de c1                	faddp  %st,%st(1)
    a20d:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    a210:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a214:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a217:	89 c2                	mov    %eax,%edx
    a219:	c1 ea 1f             	shr    $0x1f,%edx
    a21c:	01 d0                	add    %edx,%eax
    a21e:	d1 f8                	sar    %eax
    a220:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a223:	0f 8f 5c ff ff ff    	jg     a185 <inv_mdct+0x2cf>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    a229:	8b 55 10             	mov    0x10(%ebp),%edx
    a22c:	89 d0                	mov    %edx,%eax
    a22e:	c1 e0 03             	shl    $0x3,%eax
    a231:	01 d0                	add    %edx,%eax
    a233:	c1 e0 02             	shl    $0x2,%eax
    a236:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a239:	01 d0                	add    %edx,%eax
    a23b:	dd 04 c5 40 f3 00 00 	fldl   0xf340(,%eax,8)
    a242:	dc 4d e0             	fmull  -0x20(%ebp)
    a245:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a248:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    a24f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a253:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a256:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a259:	0f 8c 15 ff ff ff    	jl     a174 <inv_mdct+0x2be>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    a25f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a266:	eb 57                	jmp    a2bf <inv_mdct+0x409>
             out[6*i+p+6] += tmp[p];
    a268:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a26b:	89 d0                	mov    %edx,%eax
    a26d:	01 c0                	add    %eax,%eax
    a26f:	01 d0                	add    %edx,%eax
    a271:	01 c0                	add    %eax,%eax
    a273:	89 c2                	mov    %eax,%edx
    a275:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a278:	01 d0                	add    %edx,%eax
    a27a:	83 c0 06             	add    $0x6,%eax
    a27d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a284:	8b 45 0c             	mov    0xc(%ebp),%eax
    a287:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a28a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a28d:	89 d0                	mov    %edx,%eax
    a28f:	01 c0                	add    %eax,%eax
    a291:	01 d0                	add    %edx,%eax
    a293:	01 c0                	add    %eax,%eax
    a295:	89 c2                	mov    %eax,%edx
    a297:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a29a:	01 d0                	add    %edx,%eax
    a29c:	83 c0 06             	add    $0x6,%eax
    a29f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a2a6:	8b 45 0c             	mov    0xc(%ebp),%eax
    a2a9:	01 d0                	add    %edx,%eax
    a2ab:	dd 00                	fldl   (%eax)
    a2ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a2b0:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    a2b7:	de c1                	faddp  %st,%st(1)
    a2b9:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    a2bb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a2bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a2c2:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a2c5:	7c a1                	jl     a268 <inv_mdct+0x3b2>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    a2c7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a2cb:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    a2cf:	0f 8e 93 fe ff ff    	jle    a168 <inv_mdct+0x2b2>
    a2d5:	e9 da 00 00 00       	jmp    a3b4 <inv_mdct+0x4fe>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    a2da:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    a2e1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a2e8:	e9 bb 00 00 00       	jmp    a3a8 <inv_mdct+0x4f2>
         sum = 0.0;
    a2ed:	d9 ee                	fldz   
    a2ef:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    a2f2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a2f9:	eb 6a                	jmp    a365 <inv_mdct+0x4af>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    a2fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a2fe:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a305:	8b 45 08             	mov    0x8(%ebp),%eax
    a308:	01 d0                	add    %edx,%eax
    a30a:	dd 00                	fldl   (%eax)
    a30c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a30f:	01 c0                	add    %eax,%eax
    a311:	8d 50 01             	lea    0x1(%eax),%edx
    a314:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a317:	89 c1                	mov    %eax,%ecx
    a319:	c1 e9 1f             	shr    $0x1f,%ecx
    a31c:	01 c8                	add    %ecx,%eax
    a31e:	d1 f8                	sar    %eax
    a320:	01 c2                	add    %eax,%edx
    a322:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a325:	01 c0                	add    %eax,%eax
    a327:	83 c0 01             	add    $0x1,%eax
    a32a:	89 d1                	mov    %edx,%ecx
    a32c:	0f af c8             	imul   %eax,%ecx
    a32f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a334:	89 c8                	mov    %ecx,%eax
    a336:	f7 ea                	imul   %edx
    a338:	c1 fa 05             	sar    $0x5,%edx
    a33b:	89 c8                	mov    %ecx,%eax
    a33d:	c1 f8 1f             	sar    $0x1f,%eax
    a340:	29 c2                	sub    %eax,%edx
    a342:	89 d0                	mov    %edx,%eax
    a344:	c1 e0 03             	shl    $0x3,%eax
    a347:	01 d0                	add    %edx,%eax
    a349:	c1 e0 04             	shl    $0x4,%eax
    a34c:	29 c1                	sub    %eax,%ecx
    a34e:	89 ca                	mov    %ecx,%edx
    a350:	dd 04 d5 c0 f7 00 00 	fldl   0xf7c0(,%edx,8)
    a357:	de c9                	fmulp  %st,%st(1)
    a359:	dd 45 e0             	fldl   -0x20(%ebp)
    a35c:	de c1                	faddp  %st,%st(1)
    a35e:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    a361:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a365:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a368:	89 c2                	mov    %eax,%edx
    a36a:	c1 ea 1f             	shr    $0x1f,%edx
    a36d:	01 d0                	add    %edx,%eax
    a36f:	d1 f8                	sar    %eax
    a371:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a374:	7f 85                	jg     a2fb <inv_mdct+0x445>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    a376:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a379:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a380:	8b 45 0c             	mov    0xc(%ebp),%eax
    a383:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a386:	8b 55 10             	mov    0x10(%ebp),%edx
    a389:	89 d0                	mov    %edx,%eax
    a38b:	c1 e0 03             	shl    $0x3,%eax
    a38e:	01 d0                	add    %edx,%eax
    a390:	c1 e0 02             	shl    $0x2,%eax
    a393:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a396:	01 d0                	add    %edx,%eax
    a398:	dd 04 c5 40 f3 00 00 	fldl   0xf340(,%eax,8)
    a39f:	dc 4d e0             	fmull  -0x20(%ebp)
    a3a2:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    a3a4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a3a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a3ab:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a3ae:	0f 8c 39 ff ff ff    	jl     a2ed <inv_mdct+0x437>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    a3b4:	c9                   	leave  
    a3b5:	c3                   	ret    

0000a3b6 <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    a3b6:	55                   	push   %ebp
    a3b7:	89 e5                	mov    %esp,%ebp
    a3b9:	53                   	push   %ebx
    a3ba:	81 ec 54 01 00 00    	sub    $0x154,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    a3c0:	a1 44 f2 00 00       	mov    0xf244,%eax
    a3c5:	85 c0                	test   %eax,%eax
    a3c7:	74 6f                	je     a438 <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    a3c9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a3d0:	eb 56                	jmp    a428 <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    a3d2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a3d9:	eb 43                	jmp    a41e <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    a3db:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a3e2:	eb 30                	jmp    a414 <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    a3e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a3e7:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a3ea:	89 c2                	mov    %eax,%edx
    a3ec:	c1 e2 03             	shl    $0x3,%edx
    a3ef:	01 c2                	add    %eax,%edx
    a3f1:	8d 04 12             	lea    (%edx,%edx,1),%eax
    a3f4:	89 c2                	mov    %eax,%edx
    a3f6:	89 c8                	mov    %ecx,%eax
    a3f8:	c1 e0 03             	shl    $0x3,%eax
    a3fb:	01 c8                	add    %ecx,%eax
    a3fd:	c1 e0 06             	shl    $0x6,%eax
    a400:	01 c2                	add    %eax,%edx
    a402:	8b 45 e8             	mov    -0x18(%ebp),%eax
    a405:	01 d0                	add    %edx,%eax
    a407:	d9 ee                	fldz   
    a409:	dd 1c c5 40 fc 00 00 	fstpl  0xfc40(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    a410:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    a414:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    a418:	7e ca                	jle    a3e4 <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    a41a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a41e:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    a422:	7e b7                	jle    a3db <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    a424:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a428:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    a42c:	7e a4                	jle    a3d2 <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    a42e:	c7 05 44 f2 00 00 00 	movl   $0x0,0xf244
    a435:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    a438:	8b 45 18             	mov    0x18(%ebp),%eax
    a43b:	8b 40 10             	mov    0x10(%eax),%eax
    a43e:	85 c0                	test   %eax,%eax
    a440:	74 10                	je     a452 <III_hybrid+0x9c>
    a442:	8b 45 18             	mov    0x18(%ebp),%eax
    a445:	8b 40 18             	mov    0x18(%eax),%eax
    a448:	85 c0                	test   %eax,%eax
    a44a:	74 06                	je     a452 <III_hybrid+0x9c>
    a44c:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    a450:	7e 08                	jle    a45a <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    a452:	8b 45 18             	mov    0x18(%ebp),%eax
    a455:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    a458:	eb 05                	jmp    a45f <III_hybrid+0xa9>
    a45a:	b8 00 00 00 00       	mov    $0x0,%eax
    a45f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    a462:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    a465:	89 44 24 08          	mov    %eax,0x8(%esp)
    a469:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    a46f:	89 44 24 04          	mov    %eax,0x4(%esp)
    a473:	8b 45 08             	mov    0x8(%ebp),%eax
    a476:	89 04 24             	mov    %eax,(%esp)
    a479:	e8 38 fa ff ff       	call   9eb6 <inv_mdct>

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    a47e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a485:	e9 83 00 00 00       	jmp    a50d <III_hybrid+0x157>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    a48a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a48d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a494:	8b 45 0c             	mov    0xc(%ebp),%eax
    a497:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    a49a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a49d:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    a4a4:	8b 45 10             	mov    0x10(%ebp),%eax
    a4a7:	8b 4d 14             	mov    0x14(%ebp),%ecx
    a4aa:	89 c2                	mov    %eax,%edx
    a4ac:	c1 e2 03             	shl    $0x3,%edx
    a4af:	01 c2                	add    %eax,%edx
    a4b1:	8d 04 12             	lea    (%edx,%edx,1),%eax
    a4b4:	89 c2                	mov    %eax,%edx
    a4b6:	89 c8                	mov    %ecx,%eax
    a4b8:	c1 e0 03             	shl    $0x3,%eax
    a4bb:	01 c8                	add    %ecx,%eax
    a4bd:	c1 e0 06             	shl    $0x6,%eax
    a4c0:	01 c2                	add    %eax,%edx
    a4c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a4c5:	01 d0                	add    %edx,%eax
    a4c7:	dd 04 c5 40 fc 00 00 	fldl   0xfc40(,%eax,8)
    a4ce:	de c1                	faddp  %st,%st(1)
    a4d0:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    a4d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a4d5:	83 c0 12             	add    $0x12,%eax
    a4d8:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    a4df:	8b 45 10             	mov    0x10(%ebp),%eax
    a4e2:	8b 4d 14             	mov    0x14(%ebp),%ecx
    a4e5:	89 c2                	mov    %eax,%edx
    a4e7:	c1 e2 03             	shl    $0x3,%edx
    a4ea:	01 c2                	add    %eax,%edx
    a4ec:	8d 04 12             	lea    (%edx,%edx,1),%eax
    a4ef:	89 c2                	mov    %eax,%edx
    a4f1:	89 c8                	mov    %ecx,%eax
    a4f3:	c1 e0 03             	shl    $0x3,%eax
    a4f6:	01 c8                	add    %ecx,%eax
    a4f8:	c1 e0 06             	shl    $0x6,%eax
    a4fb:	01 c2                	add    %eax,%edx
    a4fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a500:	01 d0                	add    %edx,%eax
    a502:	dd 1c c5 40 fc 00 00 	fstpl  0xfc40(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    a509:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a50d:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a511:	0f 8e 73 ff ff ff    	jle    a48a <III_hybrid+0xd4>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    a517:	81 c4 54 01 00 00    	add    $0x154,%esp
    a51d:	5b                   	pop    %ebx
    a51e:	5d                   	pop    %ebp
    a51f:	c3                   	ret    

0000a520 <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    a520:	55                   	push   %ebp
    a521:	89 e5                	mov    %esp,%ebp
    a523:	57                   	push   %edi
    a524:	56                   	push   %esi
    a525:	53                   	push   %ebx
    a526:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    a529:	be 00 00 00 00       	mov    $0x0,%esi
    a52e:	e9 1c 01 00 00       	jmp    a64f <create_syn_filter+0x12f>
		for (k=0; k<32; k++) {
    a533:	bb 00 00 00 00       	mov    $0x0,%ebx
    a538:	e9 06 01 00 00       	jmp    a643 <create_syn_filter+0x123>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    a53d:	89 f0                	mov    %esi,%eax
    a53f:	c1 e0 08             	shl    $0x8,%eax
    a542:	89 c2                	mov    %eax,%edx
    a544:	8b 45 08             	mov    0x8(%ebp),%eax
    a547:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    a54a:	89 75 e0             	mov    %esi,-0x20(%ebp)
    a54d:	db 45 e0             	fildl  -0x20(%ebp)
    a550:	dd 05 80 d7 00 00    	fldl   0xd780
    a556:	de c9                	fmulp  %st,%st(1)
    a558:	dd 05 88 d7 00 00    	fldl   0xd788
    a55e:	de c1                	faddp  %st,%st(1)
    a560:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    a563:	83 c0 01             	add    $0x1,%eax
    a566:	89 45 e0             	mov    %eax,-0x20(%ebp)
    a569:	db 45 e0             	fildl  -0x20(%ebp)
    a56c:	de c9                	fmulp  %st,%st(1)
    a56e:	dd 1c 24             	fstpl  (%esp)
    a571:	e8 6c a2 ff ff       	call   47e2 <cos>
    a576:	dd 05 90 d7 00 00    	fldl   0xd790
    a57c:	de c9                	fmulp  %st,%st(1)
    a57e:	dd 1c df             	fstpl  (%edi,%ebx,8)
    a581:	dd 04 df             	fldl   (%edi,%ebx,8)
    a584:	d9 ee                	fldz   
    a586:	d9 c9                	fxch   %st(1)
    a588:	df e9                	fucomip %st(1),%st
    a58a:	dd d8                	fstp   %st(0)
    a58c:	72 47                	jb     a5d5 <create_syn_filter+0xb5>
				filter[i][k] = (int)(filter[i][k]+0.5);
    a58e:	89 f0                	mov    %esi,%eax
    a590:	c1 e0 08             	shl    $0x8,%eax
    a593:	89 c2                	mov    %eax,%edx
    a595:	8b 45 08             	mov    0x8(%ebp),%eax
    a598:	01 c2                	add    %eax,%edx
    a59a:	89 f0                	mov    %esi,%eax
    a59c:	c1 e0 08             	shl    $0x8,%eax
    a59f:	89 c1                	mov    %eax,%ecx
    a5a1:	8b 45 08             	mov    0x8(%ebp),%eax
    a5a4:	01 c8                	add    %ecx,%eax
    a5a6:	dd 04 d8             	fldl   (%eax,%ebx,8)
    a5a9:	dd 05 50 d7 00 00    	fldl   0xd750
    a5af:	de c1                	faddp  %st,%st(1)
    a5b1:	d9 7d e6             	fnstcw -0x1a(%ebp)
    a5b4:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    a5b8:	b4 0c                	mov    $0xc,%ah
    a5ba:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    a5be:	d9 6d e4             	fldcw  -0x1c(%ebp)
    a5c1:	db 5d e0             	fistpl -0x20(%ebp)
    a5c4:	d9 6d e6             	fldcw  -0x1a(%ebp)
    a5c7:	8b 45 e0             	mov    -0x20(%ebp),%eax
    a5ca:	89 45 e0             	mov    %eax,-0x20(%ebp)
    a5cd:	db 45 e0             	fildl  -0x20(%ebp)
    a5d0:	dd 1c da             	fstpl  (%edx,%ebx,8)
    a5d3:	eb 45                	jmp    a61a <create_syn_filter+0xfa>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    a5d5:	89 f0                	mov    %esi,%eax
    a5d7:	c1 e0 08             	shl    $0x8,%eax
    a5da:	89 c2                	mov    %eax,%edx
    a5dc:	8b 45 08             	mov    0x8(%ebp),%eax
    a5df:	01 c2                	add    %eax,%edx
    a5e1:	89 f0                	mov    %esi,%eax
    a5e3:	c1 e0 08             	shl    $0x8,%eax
    a5e6:	89 c1                	mov    %eax,%ecx
    a5e8:	8b 45 08             	mov    0x8(%ebp),%eax
    a5eb:	01 c8                	add    %ecx,%eax
    a5ed:	dd 04 d8             	fldl   (%eax,%ebx,8)
    a5f0:	dd 05 50 d7 00 00    	fldl   0xd750
    a5f6:	de e9                	fsubrp %st,%st(1)
    a5f8:	d9 7d e6             	fnstcw -0x1a(%ebp)
    a5fb:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    a5ff:	b4 0c                	mov    $0xc,%ah
    a601:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    a605:	d9 6d e4             	fldcw  -0x1c(%ebp)
    a608:	db 5d e0             	fistpl -0x20(%ebp)
    a60b:	d9 6d e6             	fldcw  -0x1a(%ebp)
    a60e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    a611:	89 45 e0             	mov    %eax,-0x20(%ebp)
    a614:	db 45 e0             	fildl  -0x20(%ebp)
    a617:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    a61a:	89 f0                	mov    %esi,%eax
    a61c:	c1 e0 08             	shl    $0x8,%eax
    a61f:	89 c2                	mov    %eax,%edx
    a621:	8b 45 08             	mov    0x8(%ebp),%eax
    a624:	01 d0                	add    %edx,%eax
    a626:	89 f2                	mov    %esi,%edx
    a628:	89 d1                	mov    %edx,%ecx
    a62a:	c1 e1 08             	shl    $0x8,%ecx
    a62d:	8b 55 08             	mov    0x8(%ebp),%edx
    a630:	01 ca                	add    %ecx,%edx
    a632:	dd 04 da             	fldl   (%edx,%ebx,8)
    a635:	dd 05 98 d7 00 00    	fldl   0xd798
    a63b:	de c9                	fmulp  %st,%st(1)
    a63d:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    a640:	83 c3 01             	add    $0x1,%ebx
    a643:	83 fb 1f             	cmp    $0x1f,%ebx
    a646:	0f 8e f1 fe ff ff    	jle    a53d <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    a64c:	83 c6 01             	add    $0x1,%esi
    a64f:	83 fe 3f             	cmp    $0x3f,%esi
    a652:	0f 8e db fe ff ff    	jle    a533 <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    a658:	83 c4 1c             	add    $0x1c,%esp
    a65b:	5b                   	pop    %ebx
    a65c:	5e                   	pop    %esi
    a65d:	5f                   	pop    %edi
    a65e:	5d                   	pop    %ebp
    a65f:	c3                   	ret    

0000a660 <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    a660:	55                   	push   %ebp
    a661:	89 e5                	mov    %esp,%ebp
    a663:	57                   	push   %edi
    a664:	56                   	push   %esi
    a665:	53                   	push   %ebx
    a666:	81 ec 14 10 00 00    	sub    $0x1014,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    a66c:	8d 95 e8 ef ff ff    	lea    -0x1018(%ebp),%edx
    a672:	bb 00 c7 00 00       	mov    $0xc700,%ebx
    a677:	b8 00 04 00 00       	mov    $0x400,%eax
    a67c:	89 d7                	mov    %edx,%edi
    a67e:	89 de                	mov    %ebx,%esi
    a680:	89 c1                	mov    %eax,%ecx
    a682:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    a684:	8d 85 e8 ef ff ff    	lea    -0x1018(%ebp),%eax
    a68a:	89 45 ec             	mov    %eax,-0x14(%ebp)
}
    a68d:	81 c4 14 10 00 00    	add    $0x1014,%esp
    a693:	5b                   	pop    %ebx
    a694:	5e                   	pop    %esi
    a695:	5f                   	pop    %edi
    a696:	5d                   	pop    %ebp
    a697:	c3                   	ret    

0000a698 <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    a698:	55                   	push   %ebp
    a699:	89 e5                	mov    %esp,%ebp
    a69b:	57                   	push   %edi
    a69c:	56                   	push   %esi
    a69d:	53                   	push   %ebx
    a69e:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    a6a1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    a6a8:	a1 48 f2 00 00       	mov    0xf248,%eax
    a6ad:	85 c0                	test   %eax,%eax
    a6af:	74 6f                	je     a720 <SubBandSynthesis+0x88>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    a6b1:	c7 44 24 04 00 d7 00 	movl   $0xd700,0x4(%esp)
    a6b8:	00 
    a6b9:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    a6c0:	e8 15 a8 ff ff       	call   4eda <mem_alloc>
    a6c5:	a3 40 20 01 00       	mov    %eax,0x12040
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    a6ca:	c7 44 24 04 03 d7 00 	movl   $0xd703,0x4(%esp)
    a6d1:	00 
    a6d2:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    a6d9:	e8 fc a7 ff ff       	call   4eda <mem_alloc>
    a6de:	a3 44 20 01 00       	mov    %eax,0x12044
		create_syn_filter(*filter);
    a6e3:	a1 44 20 01 00       	mov    0x12044,%eax
    a6e8:	89 04 24             	mov    %eax,(%esp)
    a6eb:	e8 30 fe ff ff       	call   a520 <create_syn_filter>
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    a6f0:	c7 44 24 04 06 d7 00 	movl   $0xd706,0x4(%esp)
    a6f7:	00 
    a6f8:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    a6ff:	e8 d6 a7 ff ff       	call   4eda <mem_alloc>
    a704:	a3 48 20 01 00       	mov    %eax,0x12048
		read_syn_window(window);
    a709:	a1 48 20 01 00       	mov    0x12048,%eax
    a70e:	89 04 24             	mov    %eax,(%esp)
    a711:	e8 4a ff ff ff       	call   a660 <read_syn_window>
		init = 0;
    a716:	c7 05 48 f2 00 00 00 	movl   $0x0,0xf248
    a71d:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    a720:	8b 45 0c             	mov    0xc(%ebp),%eax
    a723:	8b 04 85 4c f2 00 00 	mov    0xf24c(,%eax,4),%eax
    a72a:	83 e8 40             	sub    $0x40,%eax
    a72d:	25 ff 03 00 00       	and    $0x3ff,%eax
    a732:	89 c2                	mov    %eax,%edx
    a734:	8b 45 0c             	mov    0xc(%ebp),%eax
    a737:	89 14 85 4c f2 00 00 	mov    %edx,0xf24c(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    a73e:	8b 15 40 20 01 00    	mov    0x12040,%edx
    a744:	8b 45 0c             	mov    0xc(%ebp),%eax
    a747:	8b 04 85 4c f2 00 00 	mov    0xf24c(,%eax,4),%eax
    a74e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a751:	c1 e1 0a             	shl    $0xa,%ecx
    a754:	01 c8                	add    %ecx,%eax
    a756:	c1 e0 03             	shl    $0x3,%eax
    a759:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    a75c:	bb 00 00 00 00       	mov    $0x0,%ebx
    a761:	eb 40                	jmp    a7a3 <SubBandSynthesis+0x10b>
		sum = 0;
    a763:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    a765:	be 00 00 00 00       	mov    $0x0,%esi
    a76a:	eb 26                	jmp    a792 <SubBandSynthesis+0xfa>
			sum += bandPtr[k] * (*filter)[i][k];
    a76c:	89 f0                	mov    %esi,%eax
    a76e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a775:	8b 45 08             	mov    0x8(%ebp),%eax
    a778:	01 d0                	add    %edx,%eax
    a77a:	dd 00                	fldl   (%eax)
    a77c:	a1 44 20 01 00       	mov    0x12044,%eax
    a781:	89 da                	mov    %ebx,%edx
    a783:	c1 e2 05             	shl    $0x5,%edx
    a786:	01 f2                	add    %esi,%edx
    a788:	dd 04 d0             	fldl   (%eax,%edx,8)
    a78b:	de c9                	fmulp  %st,%st(1)
    a78d:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    a78f:	83 c6 01             	add    $0x1,%esi
    a792:	83 fe 1f             	cmp    $0x1f,%esi
    a795:	7e d5                	jle    a76c <SubBandSynthesis+0xd4>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    a797:	89 d8                	mov    %ebx,%eax
    a799:	c1 e0 03             	shl    $0x3,%eax
    a79c:	01 f8                	add    %edi,%eax
    a79e:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    a7a0:	83 c3 01             	add    $0x1,%ebx
    a7a3:	83 fb 3f             	cmp    $0x3f,%ebx
    a7a6:	7e bb                	jle    a763 <SubBandSynthesis+0xcb>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    a7a8:	bf 00 00 00 00       	mov    $0x0,%edi
    a7ad:	e9 c7 00 00 00       	jmp    a879 <SubBandSynthesis+0x1e1>
		sum = 0;
    a7b2:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    a7b4:	bb 00 00 00 00       	mov    $0x0,%ebx
    a7b9:	eb 4c                	jmp    a807 <SubBandSynthesis+0x16f>
			k = j + (i<<5);
    a7bb:	89 d8                	mov    %ebx,%eax
    a7bd:	c1 e0 05             	shl    $0x5,%eax
    a7c0:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a7c3:	a1 48 20 01 00       	mov    0x12048,%eax
    a7c8:	89 f2                	mov    %esi,%edx
    a7ca:	c1 e2 03             	shl    $0x3,%edx
    a7cd:	01 d0                	add    %edx,%eax
    a7cf:	dd 00                	fldl   (%eax)
    a7d1:	a1 40 20 01 00       	mov    0x12040,%eax
    a7d6:	8d 53 01             	lea    0x1(%ebx),%edx
    a7d9:	d1 fa                	sar    %edx
    a7db:	c1 e2 06             	shl    $0x6,%edx
    a7de:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    a7e1:	8b 55 0c             	mov    0xc(%ebp),%edx
    a7e4:	8b 14 95 4c f2 00 00 	mov    0xf24c(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a7eb:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    a7ed:	89 d1                	mov    %edx,%ecx
    a7ef:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a7f5:	8b 55 0c             	mov    0xc(%ebp),%edx
    a7f8:	c1 e2 0a             	shl    $0xa,%edx
    a7fb:	01 ca                	add    %ecx,%edx
    a7fd:	dd 04 d0             	fldl   (%eax,%edx,8)
    a800:	de c9                	fmulp  %st,%st(1)
    a802:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    a804:	83 c3 01             	add    $0x1,%ebx
    a807:	83 fb 0f             	cmp    $0xf,%ebx
    a80a:	7e af                	jle    a7bb <SubBandSynthesis+0x123>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    a80c:	dd 05 a0 d7 00 00    	fldl   0xd7a0
    a812:	de c9                	fmulp  %st,%st(1)
    a814:	d9 7d d6             	fnstcw -0x2a(%ebp)
    a817:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    a81b:	b4 0c                	mov    $0xc,%ah
    a81d:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    a821:	d9 6d d4             	fldcw  -0x2c(%ebp)
    a824:	db 5d e0             	fistpl -0x20(%ebp)
    a827:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    a82a:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    a831:	7e 15                	jle    a848 <SubBandSynthesis+0x1b0>
    a833:	89 f8                	mov    %edi,%eax
    a835:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a838:	8b 45 10             	mov    0x10(%ebp),%eax
    a83b:	01 d0                	add    %edx,%eax
    a83d:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    a842:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a846:	eb 2e                	jmp    a876 <SubBandSynthesis+0x1de>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    a848:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    a84f:	7d 15                	jge    a866 <SubBandSynthesis+0x1ce>
    a851:	89 f8                	mov    %edi,%eax
    a853:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a856:	8b 45 10             	mov    0x10(%ebp),%eax
    a859:	01 d0                	add    %edx,%eax
    a85b:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    a860:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a864:	eb 10                	jmp    a876 <SubBandSynthesis+0x1de>
			else                           samples[j] = foo;
    a866:	89 f8                	mov    %edi,%eax
    a868:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a86b:	8b 45 10             	mov    0x10(%ebp),%eax
    a86e:	01 c2                	add    %eax,%edx
    a870:	8b 45 e0             	mov    -0x20(%ebp),%eax
    a873:	66 89 02             	mov    %ax,(%edx)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    a876:	83 c7 01             	add    $0x1,%edi
    a879:	83 ff 1f             	cmp    $0x1f,%edi
    a87c:	0f 8e 30 ff ff ff    	jle    a7b2 <SubBandSynthesis+0x11a>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    a882:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    a885:	83 c4 2c             	add    $0x2c,%esp
    a888:	5b                   	pop    %ebx
    a889:	5e                   	pop    %esi
    a88a:	5f                   	pop    %edi
    a88b:	5d                   	pop    %ebp
    a88c:	c3                   	ret    

0000a88d <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    a88d:	55                   	push   %ebp
    a88e:	89 e5                	mov    %esp,%ebp
    a890:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    a893:	8b 45 10             	mov    0x10(%ebp),%eax
    a896:	8b 40 08             	mov    0x8(%eax),%eax
    a899:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    a89c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    a8a3:	eb 75                	jmp    a91a <out_fifo+0x8d>
    a8a5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    a8ac:	eb 62                	jmp    a910 <out_fifo+0x83>
            (*psampFrames)++;
    a8ae:	8b 45 14             	mov    0x14(%ebp),%eax
    a8b1:	8b 00                	mov    (%eax),%eax
    a8b3:	8d 50 01             	lea    0x1(%eax),%edx
    a8b6:	8b 45 14             	mov    0x14(%ebp),%eax
    a8b9:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    a8bb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a8c2:	eb 40                	jmp    a904 <out_fifo+0x77>
                if (!(k%1600) && k) {
    a8c4:	8b 0d 4c 20 01 00    	mov    0x1204c,%ecx
    a8ca:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    a8cf:	89 c8                	mov    %ecx,%eax
    a8d1:	f7 ea                	imul   %edx
    a8d3:	c1 fa 09             	sar    $0x9,%edx
    a8d6:	89 c8                	mov    %ecx,%eax
    a8d8:	c1 f8 1f             	sar    $0x1f,%eax
    a8db:	29 c2                	sub    %eax,%edx
    a8dd:	89 d0                	mov    %edx,%eax
    a8df:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    a8e5:	29 c1                	sub    %eax,%ecx
    a8e7:	89 c8                	mov    %ecx,%eax
    a8e9:	85 c0                	test   %eax,%eax
    a8eb:	75 13                	jne    a900 <out_fifo+0x73>
    a8ed:	a1 4c 20 01 00       	mov    0x1204c,%eax
    a8f2:	85 c0                	test   %eax,%eax
    a8f4:	74 0a                	je     a900 <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    a8f6:	c7 05 4c 20 01 00 00 	movl   $0x0,0x1204c
    a8fd:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    a900:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a904:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a907:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a90a:	7c b8                	jl     a8c4 <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    a90c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    a910:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    a914:	7e 98                	jle    a8ae <out_fifo+0x21>
    a916:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    a91a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    a91d:	3b 45 0c             	cmp    0xc(%ebp),%eax
    a920:	7c 83                	jl     a8a5 <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    a922:	c9                   	leave  
    a923:	c3                   	ret    

0000a924 <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    a924:	55                   	push   %ebp
    a925:	89 e5                	mov    %esp,%ebp
    a927:	83 ec 18             	sub    $0x18,%esp
    *old_crc = getbits(bs, 16);
    a92a:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
    a931:	00 
    a932:	8b 45 08             	mov    0x8(%ebp),%eax
    a935:	89 04 24             	mov    %eax,(%esp)
    a938:	e8 8b a8 ff ff       	call   51c8 <getbits>
    a93d:	8b 55 0c             	mov    0xc(%ebp),%edx
    a940:	89 02                	mov    %eax,(%edx)
}
    a942:	c9                   	leave  
    a943:	c3                   	ret    

0000a944 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    a944:	55                   	push   %ebp
    a945:	89 e5                	mov    %esp,%ebp
    a947:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    a94a:	8b 45 08             	mov    0x8(%ebp),%eax
    a94d:	8b 40 0c             	mov    0xc(%eax),%eax
    a950:	83 c0 1e             	add    $0x1e,%eax
    a953:	8b 14 85 a0 ed 00 00 	mov    0xeda0(,%eax,4),%edx
    a95a:	89 d0                	mov    %edx,%eax
    a95c:	c1 e0 03             	shl    $0x3,%eax
    a95f:	01 d0                	add    %edx,%eax
    a961:	c1 e0 04             	shl    $0x4,%eax
			/ s_freq[fr_ps.header->sampling_frequency];
    a964:	89 45 ec             	mov    %eax,-0x14(%ebp)
    a967:	db 45 ec             	fildl  -0x14(%ebp)
    a96a:	8b 45 08             	mov    0x8(%ebp),%eax
    a96d:	8b 40 10             	mov    0x10(%eax),%eax
    a970:	dd 04 c5 60 ee 00 00 	fldl   0xee60(,%eax,8)
    a977:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    a979:	d9 7d ea             	fnstcw -0x16(%ebp)
    a97c:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    a980:	b4 0c                	mov    $0xc,%ah
    a982:	66 89 45 e8          	mov    %ax,-0x18(%ebp)
    a986:	d9 6d e8             	fldcw  -0x18(%ebp)
    a989:	db 5d fc             	fistpl -0x4(%ebp)
    a98c:	d9 6d ea             	fldcw  -0x16(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    a98f:	8b 45 08             	mov    0x8(%ebp),%eax
    a992:	8b 40 14             	mov    0x14(%eax),%eax
    a995:	85 c0                	test   %eax,%eax
    a997:	74 04                	je     a99d <main_data_slots+0x59>
    a999:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    a99d:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    a9a1:	8b 45 08             	mov    0x8(%ebp),%eax
    a9a4:	8b 40 08             	mov    0x8(%eax),%eax
    a9a7:	85 c0                	test   %eax,%eax
    a9a9:	74 04                	je     a9af <main_data_slots+0x6b>
		nSlots -= 2;
    a9ab:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    a9af:	8b 45 10             	mov    0x10(%ebp),%eax
    a9b2:	83 f8 01             	cmp    $0x1,%eax
    a9b5:	75 06                	jne    a9bd <main_data_slots+0x79>
		nSlots -= 17;
    a9b7:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    a9bb:	eb 04                	jmp    a9c1 <main_data_slots+0x7d>
	else
		nSlots -=32;
    a9bd:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    a9c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    a9c4:	c9                   	leave  
    a9c5:	c3                   	ret    
