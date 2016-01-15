
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
//         ++str2;
//     }
//     return *str1-*str2;
// }

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
      7c:	05 0c 47 01 00       	add    $0x1470c,%eax
      81:	c6 00 00             	movb   $0x0,(%eax)
//     return *str1-*str2;
// }

void init_keyContent() {
	int i;
	for (i=0; i<MAX_KEYLENGTH; i++)
      84:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
      88:	83 7d fc 13          	cmpl   $0x13,-0x4(%ebp)
      8c:	7e eb                	jle    79 <init_keyContent+0xf>
		keyContent.content[i] = 0;
	keyContent.length = 0;
      8e:	c7 05 20 47 01 00 00 	movl   $0x0,0x14720
      95:	00 00 00 
}
      98:	c9                   	leave  
      99:	c3                   	ret    

0000009a <draw_searchbox>:

void draw_searchbox() {
      9a:	55                   	push   %ebp
      9b:	89 e5                	mov    %esp,%ebp
      9d:	83 ec 38             	sub    $0x38,%esp
	createClickable(&cm, initRect(10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
      a0:	8d 45 e8             	lea    -0x18(%ebp),%eax
      a3:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
      aa:	00 
      ab:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
      b2:	00 
      b3:	c7 44 24 08 23 00 00 	movl   $0x23,0x8(%esp)
      ba:	00 
      bb:	c7 44 24 04 a4 01 00 	movl   $0x1a4,0x4(%esp)
      c2:	00 
      c3:	89 04 24             	mov    %eax,(%esp)
      c6:	e8 c9 4f 00 00       	call   5094 <initRect>
      cb:	83 ec 04             	sub    $0x4,%esp
      ce:	c7 44 24 18 ee 17 00 	movl   $0x17ee,0x18(%esp)
      d5:	00 
      d6:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
      dd:	00 
      de:	8b 45 e8             	mov    -0x18(%ebp),%eax
      e1:	89 44 24 04          	mov    %eax,0x4(%esp)
      e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
      e8:	89 44 24 08          	mov    %eax,0x8(%esp)
      ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
      ef:	89 44 24 0c          	mov    %eax,0xc(%esp)
      f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
      f6:	89 44 24 10          	mov    %eax,0x10(%esp)
      fa:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
     101:	e8 7a 50 00 00       	call   5180 <createClickable>
				- (BUTTON_HEIGHT + 3), 100, BUTTON_HEIGHT), MSG_LPRESS, h_searchbox);
	if (isSearching == 0) {
     106:	a1 e0 3d 01 00       	mov    0x13de0,%eax
     10b:	85 c0                	test   %eax,%eax
     10d:	75 49                	jne    158 <draw_searchbox+0xbe>
		fill_rect(context, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
     10f:	c7 44 24 1c ff ff 00 	movl   $0xffff,0x1c(%esp)
     116:	00 
     117:	c7 44 24 18 20 00 00 	movl   $0x20,0x18(%esp)
     11e:	00 
     11f:	c7 44 24 14 64 00 00 	movl   $0x64,0x14(%esp)
     126:	00 
     127:	c7 44 24 10 23 00 00 	movl   $0x23,0x10(%esp)
     12e:	00 
     12f:	c7 44 24 0c a4 01 00 	movl   $0x1a4,0xc(%esp)
     136:	00 
     137:	a1 00 47 01 00       	mov    0x14700,%eax
     13c:	89 04 24             	mov    %eax,(%esp)
     13f:	a1 04 47 01 00       	mov    0x14704,%eax
     144:	89 44 24 04          	mov    %eax,0x4(%esp)
     148:	a1 08 47 01 00       	mov    0x14708,%eax
     14d:	89 44 24 08          	mov    %eax,0x8(%esp)
     151:	e8 f4 3a 00 00       	call   3c4a <fill_rect>
     156:	eb 47                	jmp    19f <draw_searchbox+0x105>
				- (BUTTON_HEIGHT + 3), 100, BUTTON_HEIGHT, 0xFFFF);
	}
	else {
		fill_rect(context, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
     158:	c7 44 24 1c cc cc 00 	movl   $0xcccc,0x1c(%esp)
     15f:	00 
     160:	c7 44 24 18 20 00 00 	movl   $0x20,0x18(%esp)
     167:	00 
     168:	c7 44 24 14 64 00 00 	movl   $0x64,0x14(%esp)
     16f:	00 
     170:	c7 44 24 10 23 00 00 	movl   $0x23,0x10(%esp)
     177:	00 
     178:	c7 44 24 0c a4 01 00 	movl   $0x1a4,0xc(%esp)
     17f:	00 
     180:	a1 00 47 01 00       	mov    0x14700,%eax
     185:	89 04 24             	mov    %eax,(%esp)
     188:	a1 04 47 01 00       	mov    0x14704,%eax
     18d:	89 44 24 04          	mov    %eax,0x4(%esp)
     191:	a1 08 47 01 00       	mov    0x14708,%eax
     196:	89 44 24 08          	mov    %eax,0x8(%esp)
     19a:	e8 ab 3a 00 00       	call   3c4a <fill_rect>
				- (BUTTON_HEIGHT + 3), 100, BUTTON_HEIGHT, 0xCCCC);
	}
}
     19f:	c9                   	leave  
     1a0:	c3                   	ret    

000001a1 <fileSortByName>:

void fileSortByName() {
     1a1:	55                   	push   %ebp
     1a2:	89 e5                	mov    %esp,%ebp
     1a4:	53                   	push   %ebx
     1a5:	83 ec 54             	sub    $0x54,%esp
	updateFileList(context);
     1a8:	a1 00 47 01 00       	mov    0x14700,%eax
     1ad:	89 04 24             	mov    %eax,(%esp)
     1b0:	a1 04 47 01 00       	mov    0x14704,%eax
     1b5:	89 44 24 04          	mov    %eax,0x4(%esp)
     1b9:	a1 08 47 01 00       	mov    0x14708,%eax
     1be:	89 44 24 08          	mov    %eax,0x8(%esp)
     1c2:	e8 81 0c 00 00       	call   e48 <updateFileList>
	struct fileItem *head;
	head = fileItemList;
     1c7:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
     1cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int tempItemCounter = 0;
     1cf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    struct fileItem *first; 
    struct fileItem *t;  
    struct fileItem *p; 
    struct fileItem *q; 
  
    first = head->next; 
     1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1d9:	8b 40 2c             	mov    0x2c(%eax),%eax
     1dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
    head->next = 0; 
     1df:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1e2:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
  
    while (first != 0) 
     1e9:	e9 b8 00 00 00       	jmp    2a6 <fileSortByName+0x105>
    {
    	tempItemCounter++; 
     1ee:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
        if (flag_fileSort == 0) {
     1f2:	a1 c8 0f 01 00       	mov    0x10fc8,%eax
     1f7:	85 c0                	test   %eax,%eax
     1f9:	75 41                	jne    23c <fileSortByName+0x9b>
	        for (t = first, q = head; ((q != 0) && (strcmp(q->name, t->name) < 0)); p = q, q = q->next)
     1fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
     1fe:	89 45 e8             	mov    %eax,-0x18(%ebp)
     201:	8b 45 f4             	mov    -0xc(%ebp),%eax
     204:	89 45 e0             	mov    %eax,-0x20(%ebp)
     207:	eb 0f                	jmp    218 <fileSortByName+0x77>
     209:	8b 45 e0             	mov    -0x20(%ebp),%eax
     20c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     20f:	8b 45 e0             	mov    -0x20(%ebp),%eax
     212:	8b 40 2c             	mov    0x2c(%eax),%eax
     215:	89 45 e0             	mov    %eax,-0x20(%ebp)
     218:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     21c:	74 5d                	je     27b <fileSortByName+0xda>
     21e:	8b 45 e8             	mov    -0x18(%ebp),%eax
     221:	8b 50 14             	mov    0x14(%eax),%edx
     224:	8b 45 e0             	mov    -0x20(%ebp),%eax
     227:	8b 40 14             	mov    0x14(%eax),%eax
     22a:	89 54 24 04          	mov    %edx,0x4(%esp)
     22e:	89 04 24             	mov    %eax,(%esp)
     231:	e8 a2 55 00 00       	call   57d8 <strcmp>
     236:	85 c0                	test   %eax,%eax
     238:	78 cf                	js     209 <fileSortByName+0x68>
     23a:	eb 3f                	jmp    27b <fileSortByName+0xda>
	        {

	        } 
        }
        else{
	        for (t = first, q = head; ((q != 0) && (strcmp(q->name, t->name) > 0)); p = q, q = q->next)
     23c:	8b 45 ec             	mov    -0x14(%ebp),%eax
     23f:	89 45 e8             	mov    %eax,-0x18(%ebp)
     242:	8b 45 f4             	mov    -0xc(%ebp),%eax
     245:	89 45 e0             	mov    %eax,-0x20(%ebp)
     248:	eb 0f                	jmp    259 <fileSortByName+0xb8>
     24a:	8b 45 e0             	mov    -0x20(%ebp),%eax
     24d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     250:	8b 45 e0             	mov    -0x20(%ebp),%eax
     253:	8b 40 2c             	mov    0x2c(%eax),%eax
     256:	89 45 e0             	mov    %eax,-0x20(%ebp)
     259:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     25d:	74 1c                	je     27b <fileSortByName+0xda>
     25f:	8b 45 e8             	mov    -0x18(%ebp),%eax
     262:	8b 50 14             	mov    0x14(%eax),%edx
     265:	8b 45 e0             	mov    -0x20(%ebp),%eax
     268:	8b 40 14             	mov    0x14(%eax),%eax
     26b:	89 54 24 04          	mov    %edx,0x4(%esp)
     26f:	89 04 24             	mov    %eax,(%esp)
     272:	e8 61 55 00 00       	call   57d8 <strcmp>
     277:	85 c0                	test   %eax,%eax
     279:	7f cf                	jg     24a <fileSortByName+0xa9>
	        {

	        }
        }
       
        first = first->next;  
     27b:	8b 45 ec             	mov    -0x14(%ebp),%eax
     27e:	8b 40 2c             	mov    0x2c(%eax),%eax
     281:	89 45 ec             	mov    %eax,-0x14(%ebp)
    
        if (q == head)   
     284:	8b 45 e0             	mov    -0x20(%ebp),%eax
     287:	3b 45 f4             	cmp    -0xc(%ebp),%eax
     28a:	75 08                	jne    294 <fileSortByName+0xf3>
        {  
            head = t;  
     28c:	8b 45 e8             	mov    -0x18(%ebp),%eax
     28f:	89 45 f4             	mov    %eax,-0xc(%ebp)
     292:	eb 09                	jmp    29d <fileSortByName+0xfc>
        }  
        else   
        {  
            p->next = t;  
     294:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     297:	8b 55 e8             	mov    -0x18(%ebp),%edx
     29a:	89 50 2c             	mov    %edx,0x2c(%eax)
        }  
        t->next = q; 
     29d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     2a0:	8b 55 e0             	mov    -0x20(%ebp),%edx
     2a3:	89 50 2c             	mov    %edx,0x2c(%eax)
    struct fileItem *q; 
  
    first = head->next; 
    head->next = 0; 
  
    while (first != 0) 
     2a6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     2aa:	0f 85 3e ff ff ff    	jne    1ee <fileSortByName+0x4d>
            p->next = t;  
        }  
        t->next = q; 
    }  

    if (flag_fileSort)
     2b0:	a1 c8 0f 01 00       	mov    0x10fc8,%eax
     2b5:	85 c0                	test   %eax,%eax
     2b7:	74 0c                	je     2c5 <fileSortByName+0x124>
    	flag_fileSort = 0;
     2b9:	c7 05 c8 0f 01 00 00 	movl   $0x0,0x10fc8
     2c0:	00 00 00 
     2c3:	eb 0a                	jmp    2cf <fileSortByName+0x12e>
    else
    	flag_fileSort = 1;
     2c5:	c7 05 c8 0f 01 00 01 	movl   $0x1,0x10fc8
     2cc:	00 00 00 
    p = head;
     2cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     2d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	while(p != 0) {
     2d5:	eb 5a                	jmp    331 <fileSortByName+0x190>
		p->pos = getPos(context, tempItemCounter--);
     2d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
     2da:	8d 50 ff             	lea    -0x1(%eax),%edx
     2dd:	89 55 f0             	mov    %edx,-0x10(%ebp)
     2e0:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
     2e3:	8d 55 c8             	lea    -0x38(%ebp),%edx
     2e6:	89 44 24 10          	mov    %eax,0x10(%esp)
     2ea:	a1 00 47 01 00       	mov    0x14700,%eax
     2ef:	89 44 24 04          	mov    %eax,0x4(%esp)
     2f3:	a1 04 47 01 00       	mov    0x14704,%eax
     2f8:	89 44 24 08          	mov    %eax,0x8(%esp)
     2fc:	a1 08 47 01 00       	mov    0x14708,%eax
     301:	89 44 24 0c          	mov    %eax,0xc(%esp)
     305:	89 14 24             	mov    %edx,(%esp)
     308:	e8 2a 10 00 00       	call   1337 <getPos>
     30d:	83 ec 04             	sub    $0x4,%esp
     310:	8b 45 c8             	mov    -0x38(%ebp),%eax
     313:	89 43 18             	mov    %eax,0x18(%ebx)
     316:	8b 45 cc             	mov    -0x34(%ebp),%eax
     319:	89 43 1c             	mov    %eax,0x1c(%ebx)
     31c:	8b 45 d0             	mov    -0x30(%ebp),%eax
     31f:	89 43 20             	mov    %eax,0x20(%ebx)
     322:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     325:	89 43 24             	mov    %eax,0x24(%ebx)
		p = p->next;
     328:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     32b:	8b 40 2c             	mov    0x2c(%eax),%eax
     32e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if (flag_fileSort)
    	flag_fileSort = 0;
    else
    	flag_fileSort = 1;
    p = head;
	while(p != 0) {
     331:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     335:	75 a0                	jne    2d7 <fileSortByName+0x136>
		p->pos = getPos(context, tempItemCounter--);
		p = p->next;
	}

    fileItemList = head;
     337:	8b 45 f4             	mov    -0xc(%ebp),%eax
     33a:	a3 d0 0f 01 00       	mov    %eax,0x10fd0
}
     33f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     342:	c9                   	leave  
     343:	c3                   	ret    

00000344 <addFileItem>:

// 文件项列表相关操作
void addFileItem(struct stat st, char *name, Rect pos) {
     344:	55                   	push   %ebp
     345:	89 e5                	mov    %esp,%ebp
     347:	53                   	push   %ebx
     348:	83 ec 44             	sub    $0x44,%esp
	//int i;
	struct fileItem *temp = (struct fileItem *) malloc(sizeof(struct fileItem));
     34b:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
     352:	e8 68 5b 00 00       	call   5ebf <malloc>
     357:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
     35a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
     361:	e8 59 5b 00 00       	call   5ebf <malloc>
     366:	8b 55 f4             	mov    -0xc(%ebp),%edx
     369:	89 42 14             	mov    %eax,0x14(%edx)
	strcpy(temp->name, name);
     36c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     36f:	8b 40 14             	mov    0x14(%eax),%eax
     372:	8b 55 1c             	mov    0x1c(%ebp),%edx
     375:	89 54 24 04          	mov    %edx,0x4(%esp)
     379:	89 04 24             	mov    %eax,(%esp)
     37c:	e8 27 54 00 00       	call   57a8 <strcpy>
//    for (i = 0; name[i] != 0; i++)
//    	{
//    		printf(0, "%d : %c\n", i, name[i]);
//    	}
	//printf(0, "copying name\n");
	temp->st = st;
     381:	8b 45 f4             	mov    -0xc(%ebp),%eax
     384:	8b 55 08             	mov    0x8(%ebp),%edx
     387:	89 10                	mov    %edx,(%eax)
     389:	8b 55 0c             	mov    0xc(%ebp),%edx
     38c:	89 50 04             	mov    %edx,0x4(%eax)
     38f:	8b 55 10             	mov    0x10(%ebp),%edx
     392:	89 50 08             	mov    %edx,0x8(%eax)
     395:	8b 55 14             	mov    0x14(%ebp),%edx
     398:	89 50 0c             	mov    %edx,0xc(%eax)
     39b:	8b 55 18             	mov    0x18(%ebp),%edx
     39e:	89 50 10             	mov    %edx,0x10(%eax)
	temp->pos = getPos(context, itemCounter);
     3a1:	8b 15 d4 0f 01 00    	mov    0x10fd4,%edx
     3a7:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     3aa:	8d 45 d8             	lea    -0x28(%ebp),%eax
     3ad:	89 54 24 10          	mov    %edx,0x10(%esp)
     3b1:	8b 15 00 47 01 00    	mov    0x14700,%edx
     3b7:	89 54 24 04          	mov    %edx,0x4(%esp)
     3bb:	8b 15 04 47 01 00    	mov    0x14704,%edx
     3c1:	89 54 24 08          	mov    %edx,0x8(%esp)
     3c5:	8b 15 08 47 01 00    	mov    0x14708,%edx
     3cb:	89 54 24 0c          	mov    %edx,0xc(%esp)
     3cf:	89 04 24             	mov    %eax,(%esp)
     3d2:	e8 60 0f 00 00       	call   1337 <getPos>
     3d7:	83 ec 04             	sub    $0x4,%esp
     3da:	8b 45 d8             	mov    -0x28(%ebp),%eax
     3dd:	89 43 18             	mov    %eax,0x18(%ebx)
     3e0:	8b 45 dc             	mov    -0x24(%ebp),%eax
     3e3:	89 43 1c             	mov    %eax,0x1c(%ebx)
     3e6:	8b 45 e0             	mov    -0x20(%ebp),%eax
     3e9:	89 43 20             	mov    %eax,0x20(%ebx)
     3ec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     3ef:	89 43 24             	mov    %eax,0x24(%ebx)
	temp->next = fileItemList;
     3f2:	8b 15 d0 0f 01 00    	mov    0x10fd0,%edx
     3f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3fb:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
     3fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
     401:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
     408:	8b 45 f4             	mov    -0xc(%ebp),%eax
     40b:	a3 d0 0f 01 00       	mov    %eax,0x10fd0
}
     410:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     413:	c9                   	leave  
     414:	c3                   	ret    

00000415 <freeFileItemList>:

void freeFileItemList() {
     415:	55                   	push   %ebp
     416:	89 e5                	mov    %esp,%ebp
     418:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
     41b:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
     420:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     423:	eb 28                	jmp    44d <freeFileItemList+0x38>
		temp = p;
     425:	8b 45 f4             	mov    -0xc(%ebp),%eax
     428:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
     42b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     42e:	8b 40 2c             	mov    0x2c(%eax),%eax
     431:	89 45 f4             	mov    %eax,-0xc(%ebp)
		free(temp->name);
     434:	8b 45 f0             	mov    -0x10(%ebp),%eax
     437:	8b 40 14             	mov    0x14(%eax),%eax
     43a:	89 04 24             	mov    %eax,(%esp)
     43d:	e8 44 59 00 00       	call   5d86 <free>
		free(temp);
     442:	8b 45 f0             	mov    -0x10(%ebp),%eax
     445:	89 04 24             	mov    %eax,(%esp)
     448:	e8 39 59 00 00       	call   5d86 <free>
}

void freeFileItemList() {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
     44d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     451:	75 d2                	jne    425 <freeFileItemList+0x10>
		temp = p;
		p = p->next;
		free(temp->name);
		free(temp);
	}
	fileItemList = 0;
     453:	c7 05 d0 0f 01 00 00 	movl   $0x0,0x10fd0
     45a:	00 00 00 
}
     45d:	c9                   	leave  
     45e:	c3                   	ret    

0000045f <fmtname>:

// 文件信息相关操作
char* fmtname(char *path) {
     45f:	55                   	push   %ebp
     460:	89 e5                	mov    %esp,%ebp
     462:	83 ec 28             	sub    $0x28,%esp
	//static char buf[DIRSIZ+1];
	char *p;

	// Find first character after last slash.
	for (p = path + strlen(path); p >= path && *p != '/'; p--)
     465:	8b 45 08             	mov    0x8(%ebp),%eax
     468:	89 04 24             	mov    %eax,(%esp)
     46b:	e8 a7 53 00 00       	call   5817 <strlen>
     470:	8b 55 08             	mov    0x8(%ebp),%edx
     473:	01 d0                	add    %edx,%eax
     475:	89 45 f4             	mov    %eax,-0xc(%ebp)
     478:	eb 04                	jmp    47e <fmtname+0x1f>
     47a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     47e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     481:	3b 45 08             	cmp    0x8(%ebp),%eax
     484:	72 0a                	jb     490 <fmtname+0x31>
     486:	8b 45 f4             	mov    -0xc(%ebp),%eax
     489:	0f b6 00             	movzbl (%eax),%eax
     48c:	3c 2f                	cmp    $0x2f,%al
     48e:	75 ea                	jne    47a <fmtname+0x1b>
		;
	p++;
     490:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

	return p;
     494:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     497:	c9                   	leave  
     498:	c3                   	ret    

00000499 <isListable>:

int isListable(char *name, short type) {
     499:	55                   	push   %ebp
     49a:	89 e5                	mov    %esp,%ebp
     49c:	83 ec 14             	sub    $0x14,%esp
     49f:	8b 45 0c             	mov    0xc(%ebp),%eax
     4a2:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	char *p = name;
     4a6:	8b 45 08             	mov    0x8(%ebp),%eax
     4a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (*p == '.') return 0;
     4ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
     4af:	0f b6 00             	movzbl (%eax),%eax
     4b2:	3c 2e                	cmp    $0x2e,%al
     4b4:	75 07                	jne    4bd <isListable+0x24>
     4b6:	b8 00 00 00 00       	mov    $0x0,%eax
     4bb:	eb 34                	jmp    4f1 <isListable+0x58>
	if (type == T_DIR) return 1;
     4bd:	66 83 7d ec 01       	cmpw   $0x1,-0x14(%ebp)
     4c2:	75 07                	jne    4cb <isListable+0x32>
     4c4:	b8 01 00 00 00       	mov    $0x1,%eax
     4c9:	eb 26                	jmp    4f1 <isListable+0x58>
	while (*p != 0) {
     4cb:	eb 15                	jmp    4e2 <isListable+0x49>
		if (*p == '.')
     4cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
     4d0:	0f b6 00             	movzbl (%eax),%eax
     4d3:	3c 2e                	cmp    $0x2e,%al
     4d5:	75 07                	jne    4de <isListable+0x45>
			return 1;
     4d7:	b8 01 00 00 00       	mov    $0x1,%eax
     4dc:	eb 13                	jmp    4f1 <isListable+0x58>
		p++;
     4de:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)

int isListable(char *name, short type) {
	char *p = name;
	if (*p == '.') return 0;
	if (type == T_DIR) return 1;
	while (*p != 0) {
     4e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
     4e5:	0f b6 00             	movzbl (%eax),%eax
     4e8:	84 c0                	test   %al,%al
     4ea:	75 e1                	jne    4cd <isListable+0x34>
		if (*p == '.')
			return 1;
		p++;
	}
	return 0;
     4ec:	b8 00 00 00 00       	mov    $0x0,%eax
}
     4f1:	c9                   	leave  
     4f2:	c3                   	ret    

000004f3 <list>:

void list(char *path) {
     4f3:	55                   	push   %ebp
     4f4:	89 e5                	mov    %esp,%ebp
     4f6:	57                   	push   %edi
     4f7:	56                   	push   %esi
     4f8:	53                   	push   %ebx
     4f9:	81 ec 7c 02 00 00    	sub    $0x27c,%esp
	char buf[512], *p;
	int fd;
	struct dirent de;
	struct stat st;

	itemCounter = 0;
     4ff:	c7 05 d4 0f 01 00 00 	movl   $0x0,0x10fd4
     506:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     509:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     510:	00 
     511:	8b 45 08             	mov    0x8(%ebp),%eax
     514:	89 04 24             	mov    %eax,(%esp)
     517:	e8 0f 55 00 00       	call   5a2b <open>
     51c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     51f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     523:	79 20                	jns    545 <list+0x52>
		printf(2, "ls: cannot open %s\n", path);
     525:	8b 45 08             	mov    0x8(%ebp),%eax
     528:	89 44 24 08          	mov    %eax,0x8(%esp)
     52c:	c7 44 24 04 40 c2 00 	movl   $0xc240,0x4(%esp)
     533:	00 
     534:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     53b:	e8 93 56 00 00       	call   5bd3 <printf>
		return;
     540:	e9 8f 02 00 00       	jmp    7d4 <list+0x2e1>
	}

	if (fstat(fd, &st) < 0) {
     545:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     54b:	89 44 24 04          	mov    %eax,0x4(%esp)
     54f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     552:	89 04 24             	mov    %eax,(%esp)
     555:	e8 e9 54 00 00       	call   5a43 <fstat>
     55a:	85 c0                	test   %eax,%eax
     55c:	79 2b                	jns    589 <list+0x96>
		printf(2, "ls: cannot stat %s\n", path);
     55e:	8b 45 08             	mov    0x8(%ebp),%eax
     561:	89 44 24 08          	mov    %eax,0x8(%esp)
     565:	c7 44 24 04 54 c2 00 	movl   $0xc254,0x4(%esp)
     56c:	00 
     56d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     574:	e8 5a 56 00 00       	call   5bd3 <printf>
		close(fd);
     579:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     57c:	89 04 24             	mov    %eax,(%esp)
     57f:	e8 8f 54 00 00       	call   5a13 <close>
		return;
     584:	e9 4b 02 00 00       	jmp    7d4 <list+0x2e1>
	}

	switch (st.type) {
     589:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     590:	98                   	cwtl   
     591:	83 f8 01             	cmp    $0x1,%eax
     594:	74 53                	je     5e9 <list+0xf6>
     596:	83 f8 02             	cmp    $0x2,%eax
     599:	0f 85 2a 02 00 00    	jne    7c9 <list+0x2d6>
	case T_FILE:
		printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
     59f:	8b bd bc fd ff ff    	mov    -0x244(%ebp),%edi
     5a5:	8b b5 b4 fd ff ff    	mov    -0x24c(%ebp),%esi
     5ab:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     5b2:	0f bf d8             	movswl %ax,%ebx
     5b5:	8b 45 08             	mov    0x8(%ebp),%eax
     5b8:	89 04 24             	mov    %eax,(%esp)
     5bb:	e8 9f fe ff ff       	call   45f <fmtname>
     5c0:	89 7c 24 14          	mov    %edi,0x14(%esp)
     5c4:	89 74 24 10          	mov    %esi,0x10(%esp)
     5c8:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     5cc:	89 44 24 08          	mov    %eax,0x8(%esp)
     5d0:	c7 44 24 04 68 c2 00 	movl   $0xc268,0x4(%esp)
     5d7:	00 
     5d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     5df:	e8 ef 55 00 00       	call   5bd3 <printf>
		break;
     5e4:	e9 e0 01 00 00       	jmp    7c9 <list+0x2d6>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     5e9:	8b 45 08             	mov    0x8(%ebp),%eax
     5ec:	89 04 24             	mov    %eax,(%esp)
     5ef:	e8 23 52 00 00       	call   5817 <strlen>
     5f4:	83 c0 10             	add    $0x10,%eax
     5f7:	3d 00 02 00 00       	cmp    $0x200,%eax
     5fc:	76 19                	jbe    617 <list+0x124>
			printf(1, "ls: path too long\n");
     5fe:	c7 44 24 04 75 c2 00 	movl   $0xc275,0x4(%esp)
     605:	00 
     606:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     60d:	e8 c1 55 00 00       	call   5bd3 <printf>
			break;
     612:	e9 b2 01 00 00       	jmp    7c9 <list+0x2d6>
		}
		strcpy(buf, path);
     617:	8b 45 08             	mov    0x8(%ebp),%eax
     61a:	89 44 24 04          	mov    %eax,0x4(%esp)
     61e:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     624:	89 04 24             	mov    %eax,(%esp)
     627:	e8 7c 51 00 00       	call   57a8 <strcpy>
		p = buf + strlen(buf);
     62c:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     632:	89 04 24             	mov    %eax,(%esp)
     635:	e8 dd 51 00 00       	call   5817 <strlen>
     63a:	8d 95 d0 fd ff ff    	lea    -0x230(%ebp),%edx
     640:	01 d0                	add    %edx,%eax
     642:	89 45 e0             	mov    %eax,-0x20(%ebp)
		*p++ = '/';
     645:	8b 45 e0             	mov    -0x20(%ebp),%eax
     648:	8d 50 01             	lea    0x1(%eax),%edx
     64b:	89 55 e0             	mov    %edx,-0x20(%ebp)
     64e:	c6 00 2f             	movb   $0x2f,(%eax)
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     651:	e9 4c 01 00 00       	jmp    7a2 <list+0x2af>
			if (de.inum == 0)
     656:	0f b7 85 c0 fd ff ff 	movzwl -0x240(%ebp),%eax
     65d:	66 85 c0             	test   %ax,%ax
     660:	75 05                	jne    667 <list+0x174>
				continue;
     662:	e9 3b 01 00 00       	jmp    7a2 <list+0x2af>
			memmove(p, de.name, DIRSIZ);
     667:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
     66e:	00 
     66f:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     675:	83 c0 02             	add    $0x2,%eax
     678:	89 44 24 04          	mov    %eax,0x4(%esp)
     67c:	8b 45 e0             	mov    -0x20(%ebp),%eax
     67f:	89 04 24             	mov    %eax,(%esp)
     682:	e8 1f 53 00 00       	call   59a6 <memmove>
			p[DIRSIZ] = 0;
     687:	8b 45 e0             	mov    -0x20(%ebp),%eax
     68a:	83 c0 0e             	add    $0xe,%eax
     68d:	c6 00 00             	movb   $0x0,(%eax)
			if (stat(buf, &st) < 0) {
     690:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     696:	89 44 24 04          	mov    %eax,0x4(%esp)
     69a:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     6a0:	89 04 24             	mov    %eax,(%esp)
     6a3:	e8 63 52 00 00       	call   590b <stat>
     6a8:	85 c0                	test   %eax,%eax
     6aa:	79 23                	jns    6cf <list+0x1dc>
				printf(1, "ls: cannot stat %s\n", buf);
     6ac:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     6b2:	89 44 24 08          	mov    %eax,0x8(%esp)
     6b6:	c7 44 24 04 54 c2 00 	movl   $0xc254,0x4(%esp)
     6bd:	00 
     6be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     6c5:	e8 09 55 00 00       	call   5bd3 <printf>
				continue;
     6ca:	e9 d3 00 00 00       	jmp    7a2 <list+0x2af>
			}
			if (isListable(fmtname(buf), st.type)) {
     6cf:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     6d6:	0f bf d8             	movswl %ax,%ebx
     6d9:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     6df:	89 04 24             	mov    %eax,(%esp)
     6e2:	e8 78 fd ff ff       	call   45f <fmtname>
     6e7:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     6eb:	89 04 24             	mov    %eax,(%esp)
     6ee:	e8 a6 fd ff ff       	call   499 <isListable>
     6f3:	85 c0                	test   %eax,%eax
     6f5:	0f 84 a7 00 00 00    	je     7a2 <list+0x2af>
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
     6fb:	8b 15 d4 0f 01 00    	mov    0x10fd4,%edx
     701:	8d 45 d0             	lea    -0x30(%ebp),%eax
     704:	89 54 24 10          	mov    %edx,0x10(%esp)
     708:	8b 15 00 47 01 00    	mov    0x14700,%edx
     70e:	89 54 24 04          	mov    %edx,0x4(%esp)
     712:	8b 15 04 47 01 00    	mov    0x14704,%edx
     718:	89 54 24 08          	mov    %edx,0x8(%esp)
     71c:	8b 15 08 47 01 00    	mov    0x14708,%edx
     722:	89 54 24 0c          	mov    %edx,0xc(%esp)
     726:	89 04 24             	mov    %eax,(%esp)
     729:	e8 09 0c 00 00       	call   1337 <getPos>
     72e:	83 ec 04             	sub    $0x4,%esp
     731:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     737:	89 04 24             	mov    %eax,(%esp)
     73a:	e8 20 fd ff ff       	call   45f <fmtname>
     73f:	8b 55 d0             	mov    -0x30(%ebp),%edx
     742:	89 54 24 18          	mov    %edx,0x18(%esp)
     746:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     749:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     74d:	8b 55 d8             	mov    -0x28(%ebp),%edx
     750:	89 54 24 20          	mov    %edx,0x20(%esp)
     754:	8b 55 dc             	mov    -0x24(%ebp),%edx
     757:	89 54 24 24          	mov    %edx,0x24(%esp)
     75b:	89 44 24 14          	mov    %eax,0x14(%esp)
     75f:	8b 85 ac fd ff ff    	mov    -0x254(%ebp),%eax
     765:	89 04 24             	mov    %eax,(%esp)
     768:	8b 85 b0 fd ff ff    	mov    -0x250(%ebp),%eax
     76e:	89 44 24 04          	mov    %eax,0x4(%esp)
     772:	8b 85 b4 fd ff ff    	mov    -0x24c(%ebp),%eax
     778:	89 44 24 08          	mov    %eax,0x8(%esp)
     77c:	8b 85 b8 fd ff ff    	mov    -0x248(%ebp),%eax
     782:	89 44 24 0c          	mov    %eax,0xc(%esp)
     786:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
     78c:	89 44 24 10          	mov    %eax,0x10(%esp)
     790:	e8 af fb ff ff       	call   344 <addFileItem>
				itemCounter++;
     795:	a1 d4 0f 01 00       	mov    0x10fd4,%eax
     79a:	83 c0 01             	add    $0x1,%eax
     79d:	a3 d4 0f 01 00       	mov    %eax,0x10fd4
			break;
		}
		strcpy(buf, path);
		p = buf + strlen(buf);
		*p++ = '/';
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     7a2:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
     7a9:	00 
     7aa:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     7b0:	89 44 24 04          	mov    %eax,0x4(%esp)
     7b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7b7:	89 04 24             	mov    %eax,(%esp)
     7ba:	e8 44 52 00 00       	call   5a03 <read>
     7bf:	83 f8 10             	cmp    $0x10,%eax
     7c2:	0f 84 8e fe ff ff    	je     656 <list+0x163>
			if (isListable(fmtname(buf), st.type)) {
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
				itemCounter++;
			}
		}
		break;
     7c8:	90                   	nop
	}
	close(fd);
     7c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7cc:	89 04 24             	mov    %eax,(%esp)
     7cf:	e8 3f 52 00 00       	call   5a13 <close>
}
     7d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7d7:	5b                   	pop    %ebx
     7d8:	5e                   	pop    %esi
     7d9:	5f                   	pop    %edi
     7da:	5d                   	pop    %ebp
     7db:	c3                   	ret    

000007dc <drawItem>:
#define FILE_ICON_BIG 0
#define FILE_ICON_SMALL 1
#define FOLDER_ICON_BIG 2
#define FOLDER_ICON_SMALL 3

void drawItem(Context context, char *name, struct stat st, Rect rect, int chosen) {
     7dc:	55                   	push   %ebp
     7dd:	89 e5                	mov    %esp,%ebp
     7df:	53                   	push   %ebx
     7e0:	83 ec 34             	sub    $0x34,%esp
	//cprintf("draw finder Item: type=%d counter=%d\n", type, n);
	unsigned short nameColor;
	if (chosen == 0) 
     7e3:	83 7d 3c 00          	cmpl   $0x0,0x3c(%ebp)
     7e7:	75 0b                	jne    7f4 <drawItem+0x18>
		nameColor = 0x0;
     7e9:	66 c7 45 f6 00 00    	movw   $0x0,-0xa(%ebp)
     7ef:	e9 9a 00 00 00       	jmp    88e <drawItem+0xb2>
	else if (chosen == 1)
     7f4:	83 7d 3c 01          	cmpl   $0x1,0x3c(%ebp)
     7f8:	75 4b                	jne    845 <drawItem+0x69>
	{
		nameColor = 0xFFFF;
     7fa:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
     800:	8b 45 38             	mov    0x38(%ebp),%eax
     803:	89 c3                	mov    %eax,%ebx
     805:	8b 45 34             	mov    0x34(%ebp),%eax
     808:	89 c1                	mov    %eax,%ecx
     80a:	8b 45 30             	mov    0x30(%ebp),%eax
     80d:	89 c2                	mov    %eax,%edx
     80f:	8b 45 2c             	mov    0x2c(%ebp),%eax
     812:	c7 44 24 1c 10 21 00 	movl   $0x2110,0x1c(%esp)
     819:	00 
     81a:	89 5c 24 18          	mov    %ebx,0x18(%esp)
     81e:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     822:	89 54 24 10          	mov    %edx,0x10(%esp)
     826:	89 44 24 0c          	mov    %eax,0xc(%esp)
     82a:	8b 45 08             	mov    0x8(%ebp),%eax
     82d:	89 04 24             	mov    %eax,(%esp)
     830:	8b 45 0c             	mov    0xc(%ebp),%eax
     833:	89 44 24 04          	mov    %eax,0x4(%esp)
     837:	8b 45 10             	mov    0x10(%ebp),%eax
     83a:	89 44 24 08          	mov    %eax,0x8(%esp)
     83e:	e8 07 34 00 00       	call   3c4a <fill_rect>
     843:	eb 49                	jmp    88e <drawItem+0xb2>
	} else
	{
		nameColor = 0xFFFF;
     845:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0);
     84b:	8b 45 38             	mov    0x38(%ebp),%eax
     84e:	89 c3                	mov    %eax,%ebx
     850:	8b 45 34             	mov    0x34(%ebp),%eax
     853:	89 c1                	mov    %eax,%ecx
     855:	8b 45 30             	mov    0x30(%ebp),%eax
     858:	89 c2                	mov    %eax,%edx
     85a:	8b 45 2c             	mov    0x2c(%ebp),%eax
     85d:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     864:	00 
     865:	89 5c 24 18          	mov    %ebx,0x18(%esp)
     869:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     86d:	89 54 24 10          	mov    %edx,0x10(%esp)
     871:	89 44 24 0c          	mov    %eax,0xc(%esp)
     875:	8b 45 08             	mov    0x8(%ebp),%eax
     878:	89 04 24             	mov    %eax,(%esp)
     87b:	8b 45 0c             	mov    0xc(%ebp),%eax
     87e:	89 44 24 04          	mov    %eax,0x4(%esp)
     882:	8b 45 10             	mov    0x10(%ebp),%eax
     885:	89 44 24 08          	mov    %eax,0x8(%esp)
     889:	e8 bc 33 00 00       	call   3c4a <fill_rect>
	}
	if (style == ICON_STYLE) {
     88e:	a1 64 06 01 00       	mov    0x10664,%eax
     893:	83 f8 01             	cmp    $0x1,%eax
     896:	0f 85 13 01 00 00    	jne    9af <drawItem+0x1d3>
		switch (st.type) {
     89c:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     8a0:	98                   	cwtl   
     8a1:	83 f8 01             	cmp    $0x1,%eax
     8a4:	74 53                	je     8f9 <drawItem+0x11d>
     8a6:	83 f8 02             	cmp    $0x2,%eax
     8a9:	0f 85 93 00 00 00    	jne    942 <drawItem+0x166>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     8af:	8b 45 30             	mov    0x30(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     8b2:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     8b5:	8b 45 2c             	mov    0x2c(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     8b8:	83 c0 19             	add    $0x19,%eax
     8bb:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     8bf:	89 44 24 18          	mov    %eax,0x18(%esp)
     8c3:	a1 a8 06 01 00       	mov    0x106a8,%eax
     8c8:	89 44 24 0c          	mov    %eax,0xc(%esp)
     8cc:	a1 ac 06 01 00       	mov    0x106ac,%eax
     8d1:	89 44 24 10          	mov    %eax,0x10(%esp)
     8d5:	a1 b0 06 01 00       	mov    0x106b0,%eax
     8da:	89 44 24 14          	mov    %eax,0x14(%esp)
     8de:	8b 45 08             	mov    0x8(%ebp),%eax
     8e1:	89 04 24             	mov    %eax,(%esp)
     8e4:	8b 45 0c             	mov    0xc(%ebp),%eax
     8e7:	89 44 24 04          	mov    %eax,0x4(%esp)
     8eb:	8b 45 10             	mov    0x10(%ebp),%eax
     8ee:	89 44 24 08          	mov    %eax,0x8(%esp)
     8f2:	e8 f2 39 00 00       	call   42e9 <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     8f7:	eb 49                	jmp    942 <drawItem+0x166>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     8f9:	8b 45 30             	mov    0x30(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     8fc:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     8ff:	8b 45 2c             	mov    0x2c(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     902:	83 c0 19             	add    $0x19,%eax
     905:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     909:	89 44 24 18          	mov    %eax,0x18(%esp)
     90d:	a1 10 07 01 00       	mov    0x10710,%eax
     912:	89 44 24 0c          	mov    %eax,0xc(%esp)
     916:	a1 14 07 01 00       	mov    0x10714,%eax
     91b:	89 44 24 10          	mov    %eax,0x10(%esp)
     91f:	a1 18 07 01 00       	mov    0x10718,%eax
     924:	89 44 24 14          	mov    %eax,0x14(%esp)
     928:	8b 45 08             	mov    0x8(%ebp),%eax
     92b:	89 04 24             	mov    %eax,(%esp)
     92e:	8b 45 0c             	mov    0xc(%ebp),%eax
     931:	89 44 24 04          	mov    %eax,0x4(%esp)
     935:	8b 45 10             	mov    0x10(%ebp),%eax
     938:	89 44 24 08          	mov    %eax,0x8(%esp)
     93c:	e8 a8 39 00 00       	call   42e9 <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     941:	90                   	nop
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
     942:	8b 45 14             	mov    0x14(%ebp),%eax
     945:	89 04 24             	mov    %eax,(%esp)
     948:	e8 ca 4e 00 00       	call   5817 <strlen>
     94d:	89 c2                	mov    %eax,%edx
     94f:	b8 00 00 00 00       	mov    $0x0,%eax
     954:	29 d0                	sub    %edx,%eax
     956:	c1 e0 02             	shl    $0x2,%eax
     959:	83 c0 30             	add    $0x30,%eax
     95c:	89 45 f0             	mov    %eax,-0x10(%ebp)
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
     95f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     963:	79 07                	jns    96c <drawItem+0x190>
			indent = 0;
     965:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
     96c:	8b 45 30             	mov    0x30(%ebp),%eax
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
			indent = 0;
		puts_str(context, name, nameColor, rect.start.x + indent,
     96f:	8d 48 46             	lea    0x46(%eax),%ecx
     972:	8b 55 2c             	mov    0x2c(%ebp),%edx
     975:	8b 45 f0             	mov    -0x10(%ebp),%eax
     978:	01 c2                	add    %eax,%edx
     97a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     97e:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     982:	89 54 24 14          	mov    %edx,0x14(%esp)
     986:	89 44 24 10          	mov    %eax,0x10(%esp)
     98a:	8b 45 14             	mov    0x14(%ebp),%eax
     98d:	89 44 24 0c          	mov    %eax,0xc(%esp)
     991:	8b 45 08             	mov    0x8(%ebp),%eax
     994:	89 04 24             	mov    %eax,(%esp)
     997:	8b 45 0c             	mov    0xc(%ebp),%eax
     99a:	89 44 24 04          	mov    %eax,0x4(%esp)
     99e:	8b 45 10             	mov    0x10(%ebp),%eax
     9a1:	89 44 24 08          	mov    %eax,0x8(%esp)
     9a5:	e8 7f 38 00 00       	call   4229 <puts_str>
     9aa:	e9 33 01 00 00       	jmp    ae2 <drawItem+0x306>
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
     9af:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     9b3:	98                   	cwtl   
     9b4:	83 f8 01             	cmp    $0x1,%eax
     9b7:	0f 84 a0 00 00 00    	je     a5d <drawItem+0x281>
     9bd:	83 f8 02             	cmp    $0x2,%eax
     9c0:	0f 85 e0 00 00 00    	jne    aa6 <drawItem+0x2ca>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     9c6:	8b 45 30             	mov    0x30(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     9c9:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     9cc:	8b 45 2c             	mov    0x2c(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     9cf:	83 c0 08             	add    $0x8,%eax
     9d2:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     9d6:	89 44 24 18          	mov    %eax,0x18(%esp)
     9da:	a1 dc 06 01 00       	mov    0x106dc,%eax
     9df:	89 44 24 0c          	mov    %eax,0xc(%esp)
     9e3:	a1 e0 06 01 00       	mov    0x106e0,%eax
     9e8:	89 44 24 10          	mov    %eax,0x10(%esp)
     9ec:	a1 e4 06 01 00       	mov    0x106e4,%eax
     9f1:	89 44 24 14          	mov    %eax,0x14(%esp)
     9f5:	8b 45 08             	mov    0x8(%ebp),%eax
     9f8:	89 04 24             	mov    %eax,(%esp)
     9fb:	8b 45 0c             	mov    0xc(%ebp),%eax
     9fe:	89 44 24 04          	mov    %eax,0x4(%esp)
     a02:	8b 45 10             	mov    0x10(%ebp),%eax
     a05:	89 44 24 08          	mov    %eax,0x8(%esp)
     a09:	e8 db 38 00 00       	call   42e9 <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
     a0e:	8b 45 28             	mov    0x28(%ebp),%eax
     a11:	89 04 24             	mov    %eax,(%esp)
     a14:	e8 cf 00 00 00       	call   ae8 <sizeFormat>
     a19:	89 45 ec             	mov    %eax,-0x14(%ebp)
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
     a1c:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
     a1f:	8d 48 03             	lea    0x3(%eax),%ecx
     a22:	8b 45 2c             	mov    0x2c(%ebp),%eax
     a25:	8d 90 c8 00 00 00    	lea    0xc8(%eax),%edx
     a2b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     a2f:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     a33:	89 54 24 14          	mov    %edx,0x14(%esp)
     a37:	89 44 24 10          	mov    %eax,0x10(%esp)
     a3b:	8b 45 ec             	mov    -0x14(%ebp),%eax
     a3e:	89 44 24 0c          	mov    %eax,0xc(%esp)
     a42:	8b 45 08             	mov    0x8(%ebp),%eax
     a45:	89 04 24             	mov    %eax,(%esp)
     a48:	8b 45 0c             	mov    0xc(%ebp),%eax
     a4b:	89 44 24 04          	mov    %eax,0x4(%esp)
     a4f:	8b 45 10             	mov    0x10(%ebp),%eax
     a52:	89 44 24 08          	mov    %eax,0x8(%esp)
     a56:	e8 ce 37 00 00       	call   4229 <puts_str>
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     a5b:	eb 49                	jmp    aa6 <drawItem+0x2ca>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     a5d:	8b 45 30             	mov    0x30(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     a60:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     a63:	8b 45 2c             	mov    0x2c(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     a66:	83 c0 08             	add    $0x8,%eax
     a69:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     a6d:	89 44 24 18          	mov    %eax,0x18(%esp)
     a71:	a1 44 07 01 00       	mov    0x10744,%eax
     a76:	89 44 24 0c          	mov    %eax,0xc(%esp)
     a7a:	a1 48 07 01 00       	mov    0x10748,%eax
     a7f:	89 44 24 10          	mov    %eax,0x10(%esp)
     a83:	a1 4c 07 01 00       	mov    0x1074c,%eax
     a88:	89 44 24 14          	mov    %eax,0x14(%esp)
     a8c:	8b 45 08             	mov    0x8(%ebp),%eax
     a8f:	89 04 24             	mov    %eax,(%esp)
     a92:	8b 45 0c             	mov    0xc(%ebp),%eax
     a95:	89 44 24 04          	mov    %eax,0x4(%esp)
     a99:	8b 45 10             	mov    0x10(%ebp),%eax
     a9c:	89 44 24 08          	mov    %eax,0x8(%esp)
     aa0:	e8 44 38 00 00       	call   42e9 <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     aa5:	90                   	nop
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
				rect.start.y + LIST_ITEM_OFFSET_Y);
     aa6:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
     aa9:	8d 48 03             	lea    0x3(%eax),%ecx
     aac:	8b 45 2c             	mov    0x2c(%ebp),%eax
     aaf:	8d 50 28             	lea    0x28(%eax),%edx
     ab2:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     ab6:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     aba:	89 54 24 14          	mov    %edx,0x14(%esp)
     abe:	89 44 24 10          	mov    %eax,0x10(%esp)
     ac2:	8b 45 14             	mov    0x14(%ebp),%eax
     ac5:	89 44 24 0c          	mov    %eax,0xc(%esp)
     ac9:	8b 45 08             	mov    0x8(%ebp),%eax
     acc:	89 04 24             	mov    %eax,(%esp)
     acf:	8b 45 0c             	mov    0xc(%ebp),%eax
     ad2:	89 44 24 04          	mov    %eax,0x4(%esp)
     ad6:	8b 45 10             	mov    0x10(%ebp),%eax
     ad9:	89 44 24 08          	mov    %eax,0x8(%esp)
     add:	e8 47 37 00 00       	call   4229 <puts_str>
				rect.start.y + LIST_ITEM_OFFSET_Y);
	}
}
     ae2:	83 c4 34             	add    $0x34,%esp
     ae5:	5b                   	pop    %ebx
     ae6:	5d                   	pop    %ebp
     ae7:	c3                   	ret    

00000ae8 <sizeFormat>:

char *sizeFormat(uint size){
     ae8:	55                   	push   %ebp
     ae9:	89 e5                	mov    %esp,%ebp
     aeb:	53                   	push   %ebx
     aec:	83 ec 24             	sub    $0x24,%esp
	char* result = (char *) malloc(12 * sizeof(char));
     aef:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     af6:	e8 c4 53 00 00       	call   5ebf <malloc>
     afb:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int n = 0;
     afe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (size > 0x400) 
     b05:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
     b0c:	0f 86 8b 00 00 00    	jbe    b9d <sizeFormat+0xb5>
	{
		size = size / (0x400);
     b12:	8b 45 08             	mov    0x8(%ebp),%eax
     b15:	c1 e8 0a             	shr    $0xa,%eax
     b18:	89 45 08             	mov    %eax,0x8(%ebp)
		do{
			result[n++] = (size % 10) + '0';
     b1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b1e:	8d 50 01             	lea    0x1(%eax),%edx
     b21:	89 55 f4             	mov    %edx,-0xc(%ebp)
     b24:	89 c2                	mov    %eax,%edx
     b26:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b29:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     b2c:	8b 4d 08             	mov    0x8(%ebp),%ecx
     b2f:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     b34:	89 c8                	mov    %ecx,%eax
     b36:	f7 e2                	mul    %edx
     b38:	c1 ea 03             	shr    $0x3,%edx
     b3b:	89 d0                	mov    %edx,%eax
     b3d:	c1 e0 02             	shl    $0x2,%eax
     b40:	01 d0                	add    %edx,%eax
     b42:	01 c0                	add    %eax,%eax
     b44:	29 c1                	sub    %eax,%ecx
     b46:	89 ca                	mov    %ecx,%edx
     b48:	89 d0                	mov    %edx,%eax
     b4a:	83 c0 30             	add    $0x30,%eax
     b4d:	88 03                	mov    %al,(%ebx)
			size /= 10;
     b4f:	8b 45 08             	mov    0x8(%ebp),%eax
     b52:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     b57:	f7 e2                	mul    %edx
     b59:	89 d0                	mov    %edx,%eax
     b5b:	c1 e8 03             	shr    $0x3,%eax
     b5e:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     b61:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     b65:	75 b4                	jne    b1b <sizeFormat+0x33>
		result[n++] = 'K';
     b67:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b6a:	8d 50 01             	lea    0x1(%eax),%edx
     b6d:	89 55 f4             	mov    %edx,-0xc(%ebp)
     b70:	89 c2                	mov    %eax,%edx
     b72:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b75:	01 d0                	add    %edx,%eax
     b77:	c6 00 4b             	movb   $0x4b,(%eax)
		result[n++] = 'b';
     b7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b7d:	8d 50 01             	lea    0x1(%eax),%edx
     b80:	89 55 f4             	mov    %edx,-0xc(%ebp)
     b83:	89 c2                	mov    %eax,%edx
     b85:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b88:	01 d0                	add    %edx,%eax
     b8a:	c6 00 62             	movb   $0x62,(%eax)
		result[n] = 0;
     b8d:	8b 55 f4             	mov    -0xc(%ebp),%edx
     b90:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b93:	01 d0                	add    %edx,%eax
     b95:	c6 00 00             	movb   $0x0,(%eax)
     b98:	e9 a3 00 00 00       	jmp    c40 <sizeFormat+0x158>
	}
	else 
	{
		do{
			result[n++] = (size % 10) + '0';
     b9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ba0:	8d 50 01             	lea    0x1(%eax),%edx
     ba3:	89 55 f4             	mov    %edx,-0xc(%ebp)
     ba6:	89 c2                	mov    %eax,%edx
     ba8:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bab:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     bae:	8b 4d 08             	mov    0x8(%ebp),%ecx
     bb1:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     bb6:	89 c8                	mov    %ecx,%eax
     bb8:	f7 e2                	mul    %edx
     bba:	c1 ea 03             	shr    $0x3,%edx
     bbd:	89 d0                	mov    %edx,%eax
     bbf:	c1 e0 02             	shl    $0x2,%eax
     bc2:	01 d0                	add    %edx,%eax
     bc4:	01 c0                	add    %eax,%eax
     bc6:	29 c1                	sub    %eax,%ecx
     bc8:	89 ca                	mov    %ecx,%edx
     bca:	89 d0                	mov    %edx,%eax
     bcc:	83 c0 30             	add    $0x30,%eax
     bcf:	88 03                	mov    %al,(%ebx)
			size /= 10;
     bd1:	8b 45 08             	mov    0x8(%ebp),%eax
     bd4:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     bd9:	f7 e2                	mul    %edx
     bdb:	89 d0                	mov    %edx,%eax
     bdd:	c1 e8 03             	shr    $0x3,%eax
     be0:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     be3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     be7:	75 b4                	jne    b9d <sizeFormat+0xb5>
		result[n++] = 'b';
     be9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bec:	8d 50 01             	lea    0x1(%eax),%edx
     bef:	89 55 f4             	mov    %edx,-0xc(%ebp)
     bf2:	89 c2                	mov    %eax,%edx
     bf4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bf7:	01 d0                	add    %edx,%eax
     bf9:	c6 00 62             	movb   $0x62,(%eax)
		result[n++] = 'y';
     bfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bff:	8d 50 01             	lea    0x1(%eax),%edx
     c02:	89 55 f4             	mov    %edx,-0xc(%ebp)
     c05:	89 c2                	mov    %eax,%edx
     c07:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c0a:	01 d0                	add    %edx,%eax
     c0c:	c6 00 79             	movb   $0x79,(%eax)
		result[n++] = 't';
     c0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c12:	8d 50 01             	lea    0x1(%eax),%edx
     c15:	89 55 f4             	mov    %edx,-0xc(%ebp)
     c18:	89 c2                	mov    %eax,%edx
     c1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c1d:	01 d0                	add    %edx,%eax
     c1f:	c6 00 74             	movb   $0x74,(%eax)
		result[n++] = 'e';
     c22:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c25:	8d 50 01             	lea    0x1(%eax),%edx
     c28:	89 55 f4             	mov    %edx,-0xc(%ebp)
     c2b:	89 c2                	mov    %eax,%edx
     c2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c30:	01 d0                	add    %edx,%eax
     c32:	c6 00 65             	movb   $0x65,(%eax)
		result[n] = 0;
     c35:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c38:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c3b:	01 d0                	add    %edx,%eax
     c3d:	c6 00 00             	movb   $0x0,(%eax)
	}
	return result;
     c40:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     c43:	83 c4 24             	add    $0x24,%esp
     c46:	5b                   	pop    %ebx
     c47:	5d                   	pop    %ebp
     c48:	c3                   	ret    

00000c49 <drawFinderWnd>:
		10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "cut.bmp",
		2 * BUTTON_WIDTH + 7, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }  };

void drawFinderWnd(Context context) {
     c49:	55                   	push   %ebp
     c4a:	89 e5                	mov    %esp,%ebp
     c4c:	83 ec 28             	sub    $0x28,%esp
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
     c4f:	8b 45 0c             	mov    0xc(%ebp),%eax
     c52:	83 e8 01             	sub    $0x1,%eax
     c55:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     c5c:	00 
     c5d:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     c64:	00 
     c65:	89 44 24 14          	mov    %eax,0x14(%esp)
     c69:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     c70:	00 
     c71:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     c78:	00 
     c79:	8b 45 08             	mov    0x8(%ebp),%eax
     c7c:	89 04 24             	mov    %eax,(%esp)
     c7f:	8b 45 0c             	mov    0xc(%ebp),%eax
     c82:	89 44 24 04          	mov    %eax,0x4(%esp)
     c86:	8b 45 10             	mov    0x10(%ebp),%eax
     c89:	89 44 24 08          	mov    %eax,0x8(%esp)
     c8d:	e8 2d 37 00 00       	call   43bf <draw_line>
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
     c92:	8b 45 10             	mov    0x10(%ebp),%eax

void drawFinderWnd(Context context) {
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
     c95:	8d 48 ff             	lea    -0x1(%eax),%ecx
     c98:	8b 45 0c             	mov    0xc(%ebp),%eax
     c9b:	8d 50 ff             	lea    -0x1(%eax),%edx
     c9e:	8b 45 0c             	mov    0xc(%ebp),%eax
     ca1:	83 e8 01             	sub    $0x1,%eax
     ca4:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     cab:	00 
     cac:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     cb0:	89 54 24 14          	mov    %edx,0x14(%esp)
     cb4:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     cbb:	00 
     cbc:	89 44 24 0c          	mov    %eax,0xc(%esp)
     cc0:	8b 45 08             	mov    0x8(%ebp),%eax
     cc3:	89 04 24             	mov    %eax,(%esp)
     cc6:	8b 45 0c             	mov    0xc(%ebp),%eax
     cc9:	89 44 24 04          	mov    %eax,0x4(%esp)
     ccd:	8b 45 10             	mov    0x10(%ebp),%eax
     cd0:	89 44 24 08          	mov    %eax,0x8(%esp)
     cd4:	e8 e6 36 00 00       	call   43bf <draw_line>
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     cd9:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     cdc:	8d 48 ff             	lea    -0x1(%eax),%ecx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     cdf:	8b 45 0c             	mov    0xc(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     ce2:	8d 50 ff             	lea    -0x1(%eax),%edx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     ce5:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     ce8:	83 e8 01             	sub    $0x1,%eax
     ceb:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     cf2:	00 
     cf3:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     cf7:	89 54 24 14          	mov    %edx,0x14(%esp)
     cfb:	89 44 24 10          	mov    %eax,0x10(%esp)
     cff:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     d06:	00 
     d07:	8b 45 08             	mov    0x8(%ebp),%eax
     d0a:	89 04 24             	mov    %eax,(%esp)
     d0d:	8b 45 0c             	mov    0xc(%ebp),%eax
     d10:	89 44 24 04          	mov    %eax,0x4(%esp)
     d14:	8b 45 10             	mov    0x10(%ebp),%eax
     d17:	89 44 24 08          	mov    %eax,0x8(%esp)
     d1b:	e8 9f 36 00 00       	call   43bf <draw_line>
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0, context.height - 1, 0, 0, BORDERLINE_COLOR);
     d20:	8b 45 10             	mov    0x10(%ebp),%eax
     d23:	83 e8 01             	sub    $0x1,%eax
     d26:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     d2d:	00 
     d2e:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     d35:	00 
     d36:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
     d3d:	00 
     d3e:	89 44 24 10          	mov    %eax,0x10(%esp)
     d42:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     d49:	00 
     d4a:	8b 45 08             	mov    0x8(%ebp),%eax
     d4d:	89 04 24             	mov    %eax,(%esp)
     d50:	8b 45 0c             	mov    0xc(%ebp),%eax
     d53:	89 44 24 04          	mov    %eax,0x4(%esp)
     d57:	8b 45 10             	mov    0x10(%ebp),%eax
     d5a:	89 44 24 08          	mov    %eax,0x8(%esp)
     d5e:	e8 5c 36 00 00       	call   43bf <draw_line>
	fill_rect(context, 1, 1, context.width - 2, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT,
     d63:	8b 45 0c             	mov    0xc(%ebp),%eax
     d66:	83 e8 02             	sub    $0x2,%eax
     d69:	c7 44 24 1c 18 c6 00 	movl   $0xc618,0x1c(%esp)
     d70:	00 
     d71:	c7 44 24 18 46 00 00 	movl   $0x46,0x18(%esp)
     d78:	00 
     d79:	89 44 24 14          	mov    %eax,0x14(%esp)
     d7d:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     d84:	00 
     d85:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     d8c:	00 
     d8d:	8b 45 08             	mov    0x8(%ebp),%eax
     d90:	89 04 24             	mov    %eax,(%esp)
     d93:	8b 45 0c             	mov    0xc(%ebp),%eax
     d96:	89 44 24 04          	mov    %eax,0x4(%esp)
     d9a:	8b 45 10             	mov    0x10(%ebp),%eax
     d9d:	89 44 24 08          	mov    %eax,0x8(%esp)
     da1:	e8 a4 2e 00 00       	call   3c4a <fill_rect>
			TOOLSBAR_COLOR);
	puts_str(context, currentPath, 0, 42, 3);
     da6:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
     dad:	00 
     dae:	c7 44 24 14 2a 00 00 	movl   $0x2a,0x14(%esp)
     db5:	00 
     db6:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     dbd:	00 
     dbe:	c7 44 24 0c 40 47 01 	movl   $0x14740,0xc(%esp)
     dc5:	00 
     dc6:	8b 45 08             	mov    0x8(%ebp),%eax
     dc9:	89 04 24             	mov    %eax,(%esp)
     dcc:	8b 45 0c             	mov    0xc(%ebp),%eax
     dcf:	89 44 24 04          	mov    %eax,0x4(%esp)
     dd3:	8b 45 10             	mov    0x10(%ebp),%eax
     dd6:	89 44 24 08          	mov    %eax,0x8(%esp)
     dda:	e8 4a 34 00 00       	call   4229 <puts_str>
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     ddf:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
     de6:	00 
     de7:	c7 44 24 0c 60 07 01 	movl   $0x10760,0xc(%esp)
     dee:	00 
     def:	8b 45 08             	mov    0x8(%ebp),%eax
     df2:	89 04 24             	mov    %eax,(%esp)
     df5:	8b 45 0c             	mov    0xc(%ebp),%eax
     df8:	89 44 24 04          	mov    %eax,0x4(%esp)
     dfc:	8b 45 10             	mov    0x10(%ebp),%eax
     dff:	89 44 24 08          	mov    %eax,0x8(%esp)
     e03:	e8 92 39 00 00       	call   479a <draw_iconlist>
	draw_searchbox();
     e08:	e8 8d f2 ff ff       	call   9a <draw_searchbox>
	puts_str(context, keyContent.content, 0, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
     e0d:	c7 44 24 18 28 00 00 	movl   $0x28,0x18(%esp)
     e14:	00 
     e15:	c7 44 24 14 a4 01 00 	movl   $0x1a4,0x14(%esp)
     e1c:	00 
     e1d:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     e24:	00 
     e25:	c7 44 24 0c 0c 47 01 	movl   $0x1470c,0xc(%esp)
     e2c:	00 
     e2d:	8b 45 08             	mov    0x8(%ebp),%eax
     e30:	89 04 24             	mov    %eax,(%esp)
     e33:	8b 45 0c             	mov    0xc(%ebp),%eax
     e36:	89 44 24 04          	mov    %eax,0x4(%esp)
     e3a:	8b 45 10             	mov    0x10(%ebp),%eax
     e3d:	89 44 24 08          	mov    %eax,0x8(%esp)
     e41:	e8 e3 33 00 00       	call   4229 <puts_str>
				- (BUTTON_HEIGHT + 3) + 5);


}
     e46:	c9                   	leave  
     e47:	c3                   	ret    

00000e48 <updateFileList>:

void updateFileList(Context context) {
     e48:	55                   	push   %ebp
     e49:	89 e5                	mov    %esp,%ebp
     e4b:	53                   	push   %ebx
     e4c:	83 ec 44             	sub    $0x44,%esp
	struct fileItem *p, *q;
	int tempItemCounter = 0;
     e4f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	freeFileItemList();
     e56:	e8 ba f5 ff ff       	call   415 <freeFileItemList>
	list(".");
     e5b:	c7 04 24 88 c2 00 00 	movl   $0xc288,(%esp)
     e62:	e8 8c f6 ff ff       	call   4f3 <list>
	if (keyContent.length <= 0)
     e67:	a1 20 47 01 00       	mov    0x14720,%eax
     e6c:	85 c0                	test   %eax,%eax
     e6e:	7f 05                	jg     e75 <updateFileList+0x2d>
		return;
     e70:	e9 1d 01 00 00       	jmp    f92 <updateFileList+0x14a>
	p = fileItemList;
     e75:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
     e7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	q = 0;
     e7d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	while(p != 0) {
     e84:	e9 9d 00 00 00       	jmp    f26 <updateFileList+0xde>
		if(!strstr(p->name, keyContent.content)) {
     e89:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e8c:	8b 40 14             	mov    0x14(%eax),%eax
     e8f:	c7 44 24 04 0c 47 01 	movl   $0x1470c,0x4(%esp)
     e96:	00 
     e97:	89 04 24             	mov    %eax,(%esp)
     e9a:	e8 61 f1 ff ff       	call   0 <strstr>
     e9f:	85 c0                	test   %eax,%eax
     ea1:	75 70                	jne    f13 <updateFileList+0xcb>
			if(q == 0) {
     ea3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     ea7:	75 30                	jne    ed9 <updateFileList+0x91>
				fileItemList = fileItemList->next;
     ea9:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
     eae:	8b 40 2c             	mov    0x2c(%eax),%eax
     eb1:	a3 d0 0f 01 00       	mov    %eax,0x10fd0
				free(p->name);
     eb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     eb9:	8b 40 14             	mov    0x14(%eax),%eax
     ebc:	89 04 24             	mov    %eax,(%esp)
     ebf:	e8 c2 4e 00 00       	call   5d86 <free>
				free(p);
     ec4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ec7:	89 04 24             	mov    %eax,(%esp)
     eca:	e8 b7 4e 00 00       	call   5d86 <free>
				p = fileItemList;
     ecf:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
     ed4:	89 45 f4             	mov    %eax,-0xc(%ebp)
     ed7:	eb 4d                	jmp    f26 <updateFileList+0xde>
			}
			else {
				q->next = p->next;
     ed9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     edc:	8b 50 2c             	mov    0x2c(%eax),%edx
     edf:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ee2:	89 50 2c             	mov    %edx,0x2c(%eax)
				p->next = 0;
     ee5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ee8:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
				free(p->name);
     eef:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ef2:	8b 40 14             	mov    0x14(%eax),%eax
     ef5:	89 04 24             	mov    %eax,(%esp)
     ef8:	e8 89 4e 00 00       	call   5d86 <free>
				free(p);
     efd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f00:	89 04 24             	mov    %eax,(%esp)
     f03:	e8 7e 4e 00 00       	call   5d86 <free>
				p = q->next;
     f08:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f0b:	8b 40 2c             	mov    0x2c(%eax),%eax
     f0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
     f11:	eb 13                	jmp    f26 <updateFileList+0xde>
			}
		}
		else {
			tempItemCounter++;
     f13:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
			q = p;
     f17:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f1a:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p = p->next;
     f1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f20:	8b 40 2c             	mov    0x2c(%eax),%eax
     f23:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list(".");
	if (keyContent.length <= 0)
		return;
	p = fileItemList;
	q = 0;
	while(p != 0) {
     f26:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     f2a:	0f 85 59 ff ff ff    	jne    e89 <updateFileList+0x41>
			tempItemCounter++;
			q = p;
			p = p->next;
		}
	}
	p = fileItemList;
     f30:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
     f35:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0) {
     f38:	eb 52                	jmp    f8c <updateFileList+0x144>
		p->pos = getPos(context, --tempItemCounter);
     f3a:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
     f3e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     f41:	8d 45 d8             	lea    -0x28(%ebp),%eax
     f44:	8b 55 ec             	mov    -0x14(%ebp),%edx
     f47:	89 54 24 10          	mov    %edx,0x10(%esp)
     f4b:	8b 55 08             	mov    0x8(%ebp),%edx
     f4e:	89 54 24 04          	mov    %edx,0x4(%esp)
     f52:	8b 55 0c             	mov    0xc(%ebp),%edx
     f55:	89 54 24 08          	mov    %edx,0x8(%esp)
     f59:	8b 55 10             	mov    0x10(%ebp),%edx
     f5c:	89 54 24 0c          	mov    %edx,0xc(%esp)
     f60:	89 04 24             	mov    %eax,(%esp)
     f63:	e8 cf 03 00 00       	call   1337 <getPos>
     f68:	83 ec 04             	sub    $0x4,%esp
     f6b:	8b 45 d8             	mov    -0x28(%ebp),%eax
     f6e:	89 43 18             	mov    %eax,0x18(%ebx)
     f71:	8b 45 dc             	mov    -0x24(%ebp),%eax
     f74:	89 43 1c             	mov    %eax,0x1c(%ebx)
     f77:	8b 45 e0             	mov    -0x20(%ebp),%eax
     f7a:	89 43 20             	mov    %eax,0x20(%ebx)
     f7d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f80:	89 43 24             	mov    %eax,0x24(%ebx)
		p = p->next;
     f83:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f86:	8b 40 2c             	mov    0x2c(%eax),%eax
     f89:	89 45 f4             	mov    %eax,-0xc(%ebp)
			q = p;
			p = p->next;
		}
	}
	p = fileItemList;
	while(p != 0) {
     f8c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     f90:	75 a8                	jne    f3a <updateFileList+0xf2>
		p->pos = getPos(context, --tempItemCounter);
		p = p->next;
	}
}
     f92:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f95:	c9                   	leave  
     f96:	c3                   	ret    

00000f97 <drawFinderContent>:

void drawFinderContent(Context context) {
     f97:	55                   	push   %ebp
     f98:	89 e5                	mov    %esp,%ebp
     f9a:	83 ec 58             	sub    $0x58,%esp
	struct fileItem *p;
	//int tempItemCounter = 0;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
     f9d:	c7 45 f0 46 00 00 00 	movl   $0x46,-0x10(%ebp)
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
     fa4:	a1 64 06 01 00       	mov    0x10664,%eax
     fa9:	83 f8 02             	cmp    $0x2,%eax
     fac:	75 04                	jne    fb2 <drawFinderContent+0x1b>
     fae:	83 45 f0 1c          	addl   $0x1c,-0x10(%ebp)
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
     fb2:	8b 45 10             	mov    0x10(%ebp),%eax
     fb5:	83 e8 48             	sub    $0x48,%eax
	//int tempItemCounter = 0;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
     fb8:	89 c1                	mov    %eax,%ecx
     fba:	8b 45 0c             	mov    0xc(%ebp),%eax
     fbd:	83 e8 02             	sub    $0x2,%eax
     fc0:	89 c2                	mov    %eax,%edx
     fc2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     fc5:	c7 44 24 1c ff ff 00 	movl   $0xffff,0x1c(%esp)
     fcc:	00 
     fcd:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     fd1:	89 54 24 14          	mov    %edx,0x14(%esp)
     fd5:	89 44 24 10          	mov    %eax,0x10(%esp)
     fd9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     fe0:	00 
     fe1:	8b 45 08             	mov    0x8(%ebp),%eax
     fe4:	89 04 24             	mov    %eax,(%esp)
     fe7:	8b 45 0c             	mov    0xc(%ebp),%eax
     fea:	89 44 24 04          	mov    %eax,0x4(%esp)
     fee:	8b 45 10             	mov    0x10(%ebp),%eax
     ff1:	89 44 24 08          	mov    %eax,0x8(%esp)
     ff5:	e8 50 2c 00 00       	call   3c4a <fill_rect>
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     ffa:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     ffd:	8d 48 ff             	lea    -0x1(%eax),%ecx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
    1000:	8b 45 0c             	mov    0xc(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
    1003:	8d 50 ff             	lea    -0x1(%eax),%edx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
    1006:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
    1009:	83 e8 01             	sub    $0x1,%eax
    100c:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    1013:	00 
    1014:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    1018:	89 54 24 14          	mov    %edx,0x14(%esp)
    101c:	89 44 24 10          	mov    %eax,0x10(%esp)
    1020:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1027:	00 
    1028:	8b 45 08             	mov    0x8(%ebp),%eax
    102b:	89 04 24             	mov    %eax,(%esp)
    102e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1031:	89 44 24 04          	mov    %eax,0x4(%esp)
    1035:	8b 45 10             	mov    0x10(%ebp),%eax
    1038:	89 44 24 08          	mov    %eax,0x8(%esp)
    103c:	e8 7e 33 00 00       	call   43bf <draw_line>
//	q = 0;
	// if (keyContent.length == 0) {
	// 	printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
//		freeFileItemList();
//		list(".");
		p = fileItemList;
    1041:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
    1046:	89 45 f4             	mov    %eax,-0xc(%ebp)
		while (p != 0) {
    1049:	eb 7a                	jmp    10c5 <drawFinderContent+0x12e>
			//printf(0, "draw item\n");
			drawItem(context, p->name, p->st, p->pos, p->chosen);
    104b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    104e:	8b 40 28             	mov    0x28(%eax),%eax
    1051:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1054:	8b 52 14             	mov    0x14(%edx),%edx
    1057:	89 44 24 34          	mov    %eax,0x34(%esp)
    105b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    105e:	8b 48 18             	mov    0x18(%eax),%ecx
    1061:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    1065:	8b 48 1c             	mov    0x1c(%eax),%ecx
    1068:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    106c:	8b 48 20             	mov    0x20(%eax),%ecx
    106f:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
    1073:	8b 40 24             	mov    0x24(%eax),%eax
    1076:	89 44 24 30          	mov    %eax,0x30(%esp)
    107a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    107d:	8b 08                	mov    (%eax),%ecx
    107f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    1083:	8b 48 04             	mov    0x4(%eax),%ecx
    1086:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    108a:	8b 48 08             	mov    0x8(%eax),%ecx
    108d:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    1091:	8b 48 0c             	mov    0xc(%eax),%ecx
    1094:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    1098:	8b 40 10             	mov    0x10(%eax),%eax
    109b:	89 44 24 20          	mov    %eax,0x20(%esp)
    109f:	89 54 24 0c          	mov    %edx,0xc(%esp)
    10a3:	8b 45 08             	mov    0x8(%ebp),%eax
    10a6:	89 04 24             	mov    %eax,(%esp)
    10a9:	8b 45 0c             	mov    0xc(%ebp),%eax
    10ac:	89 44 24 04          	mov    %eax,0x4(%esp)
    10b0:	8b 45 10             	mov    0x10(%ebp),%eax
    10b3:	89 44 24 08          	mov    %eax,0x8(%esp)
    10b7:	e8 20 f7 ff ff       	call   7dc <drawItem>
			p = p->next;
    10bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10bf:	8b 40 2c             	mov    0x2c(%eax),%eax
    10c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// if (keyContent.length == 0) {
	// 	printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
//		freeFileItemList();
//		list(".");
		p = fileItemList;
		while (p != 0) {
    10c5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    10c9:	75 80                	jne    104b <drawFinderContent+0xb4>
	// 		p = p->next;
			
	// 	}
	// }

	if (style == LIST_STYLE)
    10cb:	a1 64 06 01 00       	mov    0x10664,%eax
    10d0:	83 f8 02             	cmp    $0x2,%eax
    10d3:	0f 85 39 01 00 00    	jne    1212 <drawFinderContent+0x27b>
		{
			fill_rect(context, 1, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_FILENAME - 2, TAGBAR_HEIGHT, TAGBAR_COLOR);
    10d9:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
    10e0:	00 
    10e1:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
    10e8:	00 
    10e9:	c7 44 24 14 26 00 00 	movl   $0x26,0x14(%esp)
    10f0:	00 
    10f1:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
    10f8:	00 
    10f9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1100:	00 
    1101:	8b 45 08             	mov    0x8(%ebp),%eax
    1104:	89 04 24             	mov    %eax,(%esp)
    1107:	8b 45 0c             	mov    0xc(%ebp),%eax
    110a:	89 44 24 04          	mov    %eax,0x4(%esp)
    110e:	8b 45 10             	mov    0x10(%ebp),%eax
    1111:	89 44 24 08          	mov    %eax,0x8(%esp)
    1115:	e8 30 2b 00 00       	call   3c4a <fill_rect>
			fill_rect(context, LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
    111a:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
    1121:	00 
    1122:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
    1129:	00 
    112a:	c7 44 24 14 9f 00 00 	movl   $0x9f,0x14(%esp)
    1131:	00 
    1132:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
    1139:	00 
    113a:	c7 44 24 0c 28 00 00 	movl   $0x28,0xc(%esp)
    1141:	00 
    1142:	8b 45 08             	mov    0x8(%ebp),%eax
    1145:	89 04 24             	mov    %eax,(%esp)
    1148:	8b 45 0c             	mov    0xc(%ebp),%eax
    114b:	89 44 24 04          	mov    %eax,0x4(%esp)
    114f:	8b 45 10             	mov    0x10(%ebp),%eax
    1152:	89 44 24 08          	mov    %eax,0x8(%esp)
    1156:	e8 ef 2a 00 00       	call   3c4a <fill_rect>
			fill_rect(context, LIST_ITEM_SIZE, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, context.width - LIST_ITEM_SIZE - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
    115b:	8b 45 0c             	mov    0xc(%ebp),%eax
    115e:	2d c9 00 00 00       	sub    $0xc9,%eax
    1163:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
    116a:	00 
    116b:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
    1172:	00 
    1173:	89 44 24 14          	mov    %eax,0x14(%esp)
    1177:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
    117e:	00 
    117f:	c7 44 24 0c c8 00 00 	movl   $0xc8,0xc(%esp)
    1186:	00 
    1187:	8b 45 08             	mov    0x8(%ebp),%eax
    118a:	89 04 24             	mov    %eax,(%esp)
    118d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1190:	89 44 24 04          	mov    %eax,0x4(%esp)
    1194:	8b 45 10             	mov    0x10(%ebp),%eax
    1197:	89 44 24 08          	mov    %eax,0x8(%esp)
    119b:	e8 aa 2a 00 00       	call   3c4a <fill_rect>
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
    11a0:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
    11a7:	00 
    11a8:	c7 44 24 14 2b 00 00 	movl   $0x2b,0x14(%esp)
    11af:	00 
    11b0:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    11b7:	00 
    11b8:	c7 44 24 0c 8a c2 00 	movl   $0xc28a,0xc(%esp)
    11bf:	00 
    11c0:	8b 45 08             	mov    0x8(%ebp),%eax
    11c3:	89 04 24             	mov    %eax,(%esp)
    11c6:	8b 45 0c             	mov    0xc(%ebp),%eax
    11c9:	89 44 24 04          	mov    %eax,0x4(%esp)
    11cd:	8b 45 10             	mov    0x10(%ebp),%eax
    11d0:	89 44 24 08          	mov    %eax,0x8(%esp)
    11d4:	e8 50 30 00 00       	call   4229 <puts_str>
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
    11d9:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
    11e0:	00 
    11e1:	c7 44 24 14 cb 00 00 	movl   $0xcb,0x14(%esp)
    11e8:	00 
    11e9:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    11f0:	00 
    11f1:	c7 44 24 0c 8f c2 00 	movl   $0xc28f,0xc(%esp)
    11f8:	00 
    11f9:	8b 45 08             	mov    0x8(%ebp),%eax
    11fc:	89 04 24             	mov    %eax,(%esp)
    11ff:	8b 45 0c             	mov    0xc(%ebp),%eax
    1202:	89 44 24 04          	mov    %eax,0x4(%esp)
    1206:	8b 45 10             	mov    0x10(%ebp),%eax
    1209:	89 44 24 08          	mov    %eax,0x8(%esp)
    120d:	e8 17 30 00 00       	call   4229 <puts_str>
		}
}
    1212:	c9                   	leave  
    1213:	c3                   	ret    

00001214 <int2str>:

char * int2str(int i)
{
    1214:	55                   	push   %ebp
    1215:	89 e5                	mov    %esp,%ebp
    1217:	53                   	push   %ebx
    1218:	83 ec 24             	sub    $0x24,%esp
	int j;
	int n = 0;
    121b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	char *result = (char *)malloc(4*sizeof(char));
    1222:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    1229:	e8 91 4c 00 00       	call   5ebf <malloc>
    122e:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
    1231:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    1238:	e8 82 4c 00 00       	call   5ebf <malloc>
    123d:	89 45 e8             	mov    %eax,-0x18(%ebp)
	do{
		result[n++] = (i % 10) + '0';
    1240:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1243:	8d 50 01             	lea    0x1(%eax),%edx
    1246:	89 55 f0             	mov    %edx,-0x10(%ebp)
    1249:	89 c2                	mov    %eax,%edx
    124b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    124e:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    1251:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1254:	ba 67 66 66 66       	mov    $0x66666667,%edx
    1259:	89 c8                	mov    %ecx,%eax
    125b:	f7 ea                	imul   %edx
    125d:	c1 fa 02             	sar    $0x2,%edx
    1260:	89 c8                	mov    %ecx,%eax
    1262:	c1 f8 1f             	sar    $0x1f,%eax
    1265:	29 c2                	sub    %eax,%edx
    1267:	89 d0                	mov    %edx,%eax
    1269:	c1 e0 02             	shl    $0x2,%eax
    126c:	01 d0                	add    %edx,%eax
    126e:	01 c0                	add    %eax,%eax
    1270:	29 c1                	sub    %eax,%ecx
    1272:	89 ca                	mov    %ecx,%edx
    1274:	89 d0                	mov    %edx,%eax
    1276:	83 c0 30             	add    $0x30,%eax
    1279:	88 03                	mov    %al,(%ebx)
		i /= 10;
    127b:	8b 4d 08             	mov    0x8(%ebp),%ecx
    127e:	ba 67 66 66 66       	mov    $0x66666667,%edx
    1283:	89 c8                	mov    %ecx,%eax
    1285:	f7 ea                	imul   %edx
    1287:	c1 fa 02             	sar    $0x2,%edx
    128a:	89 c8                	mov    %ecx,%eax
    128c:	c1 f8 1f             	sar    $0x1f,%eax
    128f:	29 c2                	sub    %eax,%edx
    1291:	89 d0                	mov    %edx,%eax
    1293:	89 45 08             	mov    %eax,0x8(%ebp)
	}while (i!=0);
    1296:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    129a:	75 a4                	jne    1240 <int2str+0x2c>
	result[n] = 0;
    129c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    129f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12a2:	01 d0                	add    %edx,%eax
    12a4:	c6 00 00             	movb   $0x0,(%eax)

	for (j = 0; j < n; j++)
    12a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    12ae:	eb 21                	jmp    12d1 <int2str+0xbd>
	{
		temp[j] = result[n-1-j];
    12b0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    12b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    12b6:	01 c2                	add    %eax,%edx
    12b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12bb:	83 e8 01             	sub    $0x1,%eax
    12be:	2b 45 f4             	sub    -0xc(%ebp),%eax
    12c1:	89 c1                	mov    %eax,%ecx
    12c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12c6:	01 c8                	add    %ecx,%eax
    12c8:	0f b6 00             	movzbl (%eax),%eax
    12cb:	88 02                	mov    %al,(%edx)
		result[n++] = (i % 10) + '0';
		i /= 10;
	}while (i!=0);
	result[n] = 0;

	for (j = 0; j < n; j++)
    12cd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    12d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12d4:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    12d7:	7c d7                	jl     12b0 <int2str+0x9c>
	{
		temp[j] = result[n-1-j];
	}
	temp[n] = 0;
    12d9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    12dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    12df:	01 d0                	add    %edx,%eax
    12e1:	c6 00 00             	movb   $0x0,(%eax)
	free(result);
    12e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12e7:	89 04 24             	mov    %eax,(%esp)
    12ea:	e8 97 4a 00 00       	call   5d86 <free>
	return temp;
    12ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
}
    12f2:	83 c4 24             	add    $0x24,%esp
    12f5:	5b                   	pop    %ebx
    12f6:	5d                   	pop    %ebp
    12f7:	c3                   	ret    

000012f8 <printItemList>:

void printItemList() {
    12f8:	55                   	push   %ebp
    12f9:	89 e5                	mov    %esp,%ebp
    12fb:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *p;
	p = fileItemList;
    12fe:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
    1303:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    1306:	eb 27                	jmp    132f <printItemList+0x37>
		printf(0, "%s\n", p->name);
    1308:	8b 45 f4             	mov    -0xc(%ebp),%eax
    130b:	8b 40 14             	mov    0x14(%eax),%eax
    130e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1312:	c7 44 24 04 94 c2 00 	movl   $0xc294,0x4(%esp)
    1319:	00 
    131a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1321:	e8 ad 48 00 00       	call   5bd3 <printf>
		p = p->next;
    1326:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1329:	8b 40 2c             	mov    0x2c(%eax),%eax
    132c:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void printItemList() {
	struct fileItem *p;
	p = fileItemList;
	while (p != 0) {
    132f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1333:	75 d3                	jne    1308 <printItemList+0x10>
		printf(0, "%s\n", p->name);
		p = p->next;
	}
}
    1335:	c9                   	leave  
    1336:	c3                   	ret    

00001337 <getPos>:

Rect getPos(Context context, int n) {
    1337:	55                   	push   %ebp
    1338:	89 e5                	mov    %esp,%ebp
    133a:	83 ec 48             	sub    $0x48,%esp
	if (style == ICON_STYLE) {
    133d:	a1 64 06 01 00       	mov    0x10664,%eax
    1342:	83 f8 01             	cmp    $0x1,%eax
    1345:	0f 85 80 00 00 00    	jne    13cb <getPos+0x94>
		int m = context.width / (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
    134b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    134e:	ba 7f e0 07 7e       	mov    $0x7e07e07f,%edx
    1353:	89 c8                	mov    %ecx,%eax
    1355:	f7 ea                	imul   %edx
    1357:	c1 fa 06             	sar    $0x6,%edx
    135a:	89 c8                	mov    %ecx,%eax
    135c:	c1 f8 1f             	sar    $0x1f,%eax
    135f:	29 c2                	sub    %eax,%edx
    1361:	89 d0                	mov    %edx,%eax
    1363:	89 45 f4             	mov    %eax,-0xc(%ebp)
		int r = n / m;
    1366:	8b 45 18             	mov    0x18(%ebp),%eax
    1369:	99                   	cltd   
    136a:	f7 7d f4             	idivl  -0xc(%ebp)
    136d:	89 45 f0             	mov    %eax,-0x10(%ebp)
		int c = n % m;
    1370:	8b 45 18             	mov    0x18(%ebp),%eax
    1373:	99                   	cltd   
    1374:	f7 7d f4             	idivl  -0xc(%ebp)
    1377:	89 55 ec             	mov    %edx,-0x14(%ebp)
		int y_top = r * (ICON_ITEM_HEIGHT + ICON_ITEM_GAP_Y)+ TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + ICON_ITEM_GAP_Y;
    137a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    137d:	6b c0 73             	imul   $0x73,%eax,%eax
    1380:	83 c0 5a             	add    $0x5a,%eax
    1383:	89 45 e8             	mov    %eax,-0x18(%ebp)
		int x_left = c * (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
    1386:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1389:	01 c0                	add    %eax,%eax
    138b:	89 c2                	mov    %eax,%edx
    138d:	c1 e2 06             	shl    $0x6,%edx
    1390:	01 d0                	add    %edx,%eax
    1392:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		return initRect(x_left, y_top + scrollOffset, ICON_ITEM_WIDTH,
    1395:	8b 15 c0 0f 01 00    	mov    0x10fc0,%edx
    139b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    139e:	01 c2                	add    %eax,%edx
    13a0:	8b 45 08             	mov    0x8(%ebp),%eax
    13a3:	c7 44 24 10 5f 00 00 	movl   $0x5f,0x10(%esp)
    13aa:	00 
    13ab:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
    13b2:	00 
    13b3:	89 54 24 08          	mov    %edx,0x8(%esp)
    13b7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    13ba:	89 54 24 04          	mov    %edx,0x4(%esp)
    13be:	89 04 24             	mov    %eax,(%esp)
    13c1:	e8 ce 3c 00 00       	call   5094 <initRect>
    13c6:	83 ec 04             	sub    $0x4,%esp
    13c9:	eb 3d                	jmp    1408 <getPos+0xd1>
				ICON_ITEM_HEIGHT);
	} else {
		return initRect(0, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT + n * (LIST_ITEM_HEIGHT + LIST_ITEM_GAP) + scrollOffset, context.width,
    13cb:	8b 4d 10             	mov    0x10(%ebp),%ecx
    13ce:	8b 55 18             	mov    0x18(%ebp),%edx
    13d1:	89 d0                	mov    %edx,%eax
    13d3:	c1 e0 05             	shl    $0x5,%eax
    13d6:	29 d0                	sub    %edx,%eax
    13d8:	8d 50 62             	lea    0x62(%eax),%edx
    13db:	a1 c0 0f 01 00       	mov    0x10fc0,%eax
    13e0:	01 c2                	add    %eax,%edx
    13e2:	8b 45 08             	mov    0x8(%ebp),%eax
    13e5:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    13ec:	00 
    13ed:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    13f1:	89 54 24 08          	mov    %edx,0x8(%esp)
    13f5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    13fc:	00 
    13fd:	89 04 24             	mov    %eax,(%esp)
    1400:	e8 8f 3c 00 00       	call   5094 <initRect>
    1405:	83 ec 04             	sub    $0x4,%esp
				LIST_ITEM_HEIGHT);
	}
}
    1408:	8b 45 08             	mov    0x8(%ebp),%eax
    140b:	c9                   	leave  
    140c:	c2 04 00             	ret    $0x4

0000140f <addItemEvent>:

// 事件处理相关操作
void addItemEvent(ClickableManager *cm, struct fileItem item) {
    140f:	55                   	push   %ebp
    1410:	89 e5                	mov    %esp,%ebp
    1412:	83 ec 28             	sub    $0x28,%esp
	if (style == ICON_STYLE) {
    1415:	a1 64 06 01 00       	mov    0x10664,%eax
    141a:	83 f8 01             	cmp    $0x1,%eax
    141d:	75 0d                	jne    142c <addItemEvent+0x1d>
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)
    141f:	8b 45 28             	mov    0x28(%ebp),%eax
    1422:	83 f8 45             	cmp    $0x45,%eax
    1425:	7f 12                	jg     1439 <addItemEvent+0x2a>
			return;
    1427:	e9 e0 00 00 00       	jmp    150c <addItemEvent+0xfd>
	} else {
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)
    142c:	8b 45 28             	mov    0x28(%ebp),%eax
    142f:	83 f8 61             	cmp    $0x61,%eax
    1432:	7f 05                	jg     1439 <addItemEvent+0x2a>
			return;
    1434:	e9 d3 00 00 00       	jmp    150c <addItemEvent+0xfd>
	}
	switch (item.st.type) {
    1439:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    143d:	98                   	cwtl   
    143e:	83 f8 01             	cmp    $0x1,%eax
    1441:	74 45                	je     1488 <addItemEvent+0x79>
    1443:	83 f8 02             	cmp    $0x2,%eax
    1446:	0f 85 ac 00 00 00    	jne    14f8 <addItemEvent+0xe9>
	case T_FILE:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
    144c:	c7 44 24 18 98 2f 00 	movl   $0x2f98,0x18(%esp)
    1453:	00 
    1454:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    145b:	00 
    145c:	8b 45 24             	mov    0x24(%ebp),%eax
    145f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1463:	8b 45 28             	mov    0x28(%ebp),%eax
    1466:	89 44 24 08          	mov    %eax,0x8(%esp)
    146a:	8b 45 2c             	mov    0x2c(%ebp),%eax
    146d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1471:	8b 45 30             	mov    0x30(%ebp),%eax
    1474:	89 44 24 10          	mov    %eax,0x10(%esp)
    1478:	8b 45 08             	mov    0x8(%ebp),%eax
    147b:	89 04 24             	mov    %eax,(%esp)
    147e:	e8 fd 3c 00 00       	call   5180 <createClickable>
		break;
    1483:	e9 84 00 00 00       	jmp    150c <addItemEvent+0xfd>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
    1488:	c7 44 24 18 98 2f 00 	movl   $0x2f98,0x18(%esp)
    148f:	00 
    1490:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    1497:	00 
    1498:	8b 45 24             	mov    0x24(%ebp),%eax
    149b:	89 44 24 04          	mov    %eax,0x4(%esp)
    149f:	8b 45 28             	mov    0x28(%ebp),%eax
    14a2:	89 44 24 08          	mov    %eax,0x8(%esp)
    14a6:	8b 45 2c             	mov    0x2c(%ebp),%eax
    14a9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    14ad:	8b 45 30             	mov    0x30(%ebp),%eax
    14b0:	89 44 24 10          	mov    %eax,0x10(%esp)
    14b4:	8b 45 08             	mov    0x8(%ebp),%eax
    14b7:	89 04 24             	mov    %eax,(%esp)
    14ba:	e8 c1 3c 00 00       	call   5180 <createClickable>
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_enterDir);
    14bf:	c7 44 24 18 06 1d 00 	movl   $0x1d06,0x18(%esp)
    14c6:	00 
    14c7:	c7 44 24 14 04 00 00 	movl   $0x4,0x14(%esp)
    14ce:	00 
    14cf:	8b 45 24             	mov    0x24(%ebp),%eax
    14d2:	89 44 24 04          	mov    %eax,0x4(%esp)
    14d6:	8b 45 28             	mov    0x28(%ebp),%eax
    14d9:	89 44 24 08          	mov    %eax,0x8(%esp)
    14dd:	8b 45 2c             	mov    0x2c(%ebp),%eax
    14e0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    14e4:	8b 45 30             	mov    0x30(%ebp),%eax
    14e7:	89 44 24 10          	mov    %eax,0x10(%esp)
    14eb:	8b 45 08             	mov    0x8(%ebp),%eax
    14ee:	89 04 24             	mov    %eax,(%esp)
    14f1:	e8 8a 3c 00 00       	call   5180 <createClickable>
		break;
    14f6:	eb 14                	jmp    150c <addItemEvent+0xfd>
	default:
		printf(0, "unknown file type!");
    14f8:	c7 44 24 04 98 c2 00 	movl   $0xc298,0x4(%esp)
    14ff:	00 
    1500:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1507:	e8 c7 46 00 00       	call   5bd3 <printf>
	}
}
    150c:	c9                   	leave  
    150d:	c3                   	ret    

0000150e <addListEvent>:

void addListEvent(ClickableManager *cm) {
    150e:	55                   	push   %ebp
    150f:	89 e5                	mov    %esp,%ebp
    1511:	83 ec 58             	sub    $0x58,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
    1514:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
    1519:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    151c:	eb 70                	jmp    158e <addListEvent+0x80>
		temp = p;
    151e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1521:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
    1524:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1527:	8b 40 2c             	mov    0x2c(%eax),%eax
    152a:	89 45 f4             	mov    %eax,-0xc(%ebp)
		addItemEvent(cm, *temp);
    152d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1530:	8b 10                	mov    (%eax),%edx
    1532:	89 54 24 04          	mov    %edx,0x4(%esp)
    1536:	8b 50 04             	mov    0x4(%eax),%edx
    1539:	89 54 24 08          	mov    %edx,0x8(%esp)
    153d:	8b 50 08             	mov    0x8(%eax),%edx
    1540:	89 54 24 0c          	mov    %edx,0xc(%esp)
    1544:	8b 50 0c             	mov    0xc(%eax),%edx
    1547:	89 54 24 10          	mov    %edx,0x10(%esp)
    154b:	8b 50 10             	mov    0x10(%eax),%edx
    154e:	89 54 24 14          	mov    %edx,0x14(%esp)
    1552:	8b 50 14             	mov    0x14(%eax),%edx
    1555:	89 54 24 18          	mov    %edx,0x18(%esp)
    1559:	8b 50 18             	mov    0x18(%eax),%edx
    155c:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    1560:	8b 50 1c             	mov    0x1c(%eax),%edx
    1563:	89 54 24 20          	mov    %edx,0x20(%esp)
    1567:	8b 50 20             	mov    0x20(%eax),%edx
    156a:	89 54 24 24          	mov    %edx,0x24(%esp)
    156e:	8b 50 24             	mov    0x24(%eax),%edx
    1571:	89 54 24 28          	mov    %edx,0x28(%esp)
    1575:	8b 50 28             	mov    0x28(%eax),%edx
    1578:	89 54 24 2c          	mov    %edx,0x2c(%esp)
    157c:	8b 40 2c             	mov    0x2c(%eax),%eax
    157f:	89 44 24 30          	mov    %eax,0x30(%esp)
    1583:	8b 45 08             	mov    0x8(%ebp),%eax
    1586:	89 04 24             	mov    %eax,(%esp)
    1589:	e8 81 fe ff ff       	call   140f <addItemEvent>
}

void addListEvent(ClickableManager *cm) {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
    158e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1592:	75 8a                	jne    151e <addListEvent+0x10>
		temp = p;
		p = p->next;
		addItemEvent(cm, *temp);
	}
}
    1594:	c9                   	leave  
    1595:	c3                   	ret    

00001596 <addWndEvent>:

Handler wndEvents[] = { h_closeWnd, h_empty, h_chvm2, h_chvm1, h_newFolder,
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile, h_searchbox, h_rename};

void addWndEvent(ClickableManager *cm) {
    1596:	55                   	push   %ebp
    1597:	89 e5                	mov    %esp,%ebp
    1599:	57                   	push   %edi
    159a:	56                   	push   %esi
    159b:	53                   	push   %ebx
    159c:	83 ec 5c             	sub    $0x5c,%esp
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
    159f:	c7 45 e0 0f 00 00 00 	movl   $0xf,-0x20(%ebp)
	for (i = 0; i < n; i++) {
    15a6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    15ad:	e9 96 00 00 00       	jmp    1648 <addWndEvent+0xb2>
		createClickable(cm,
    15b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15b5:	8b 1c 85 80 0a 01 00 	mov    0x10a80(,%eax,4),%ebx
    15bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15bf:	6b c0 34             	imul   $0x34,%eax,%eax
    15c2:	05 80 07 01 00       	add    $0x10780,%eax
    15c7:	8b 78 10             	mov    0x10(%eax),%edi
    15ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15cd:	6b c0 34             	imul   $0x34,%eax,%eax
    15d0:	05 80 07 01 00       	add    $0x10780,%eax
    15d5:	8b 70 0c             	mov    0xc(%eax),%esi
    15d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15db:	6b c0 34             	imul   $0x34,%eax,%eax
    15de:	05 80 07 01 00       	add    $0x10780,%eax
    15e3:	8b 48 04             	mov    0x4(%eax),%ecx
    15e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15e9:	6b c0 34             	imul   $0x34,%eax,%eax
    15ec:	05 80 07 01 00       	add    $0x10780,%eax
    15f1:	8b 10                	mov    (%eax),%edx
    15f3:	8d 45 c0             	lea    -0x40(%ebp),%eax
    15f6:	89 7c 24 10          	mov    %edi,0x10(%esp)
    15fa:	89 74 24 0c          	mov    %esi,0xc(%esp)
    15fe:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1602:	89 54 24 04          	mov    %edx,0x4(%esp)
    1606:	89 04 24             	mov    %eax,(%esp)
    1609:	e8 86 3a 00 00       	call   5094 <initRect>
    160e:	83 ec 04             	sub    $0x4,%esp
    1611:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    1615:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    161c:	00 
    161d:	8b 45 c0             	mov    -0x40(%ebp),%eax
    1620:	89 44 24 04          	mov    %eax,0x4(%esp)
    1624:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1627:	89 44 24 08          	mov    %eax,0x8(%esp)
    162b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    162e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1632:	8b 45 cc             	mov    -0x34(%ebp),%eax
    1635:	89 44 24 10          	mov    %eax,0x10(%esp)
    1639:	8b 45 08             	mov    0x8(%ebp),%eax
    163c:	89 04 24             	mov    %eax,(%esp)
    163f:	e8 3c 3b 00 00       	call   5180 <createClickable>
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile, h_searchbox, h_rename};

void addWndEvent(ClickableManager *cm) {
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
	for (i = 0; i < n; i++) {
    1644:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1648:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    164b:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    164e:	0f 8c 5e ff ff ff    	jl     15b2 <addWndEvent+0x1c>
		createClickable(cm,
				initRect(wndRes[i].position_x, wndRes[i].position_y,
						wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
				wndEvents[i]);
	}
	createClickable(cm, initRect(LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT), MSG_LPRESS, h_fileSortByName);
    1654:	8d 45 d0             	lea    -0x30(%ebp),%eax
    1657:	c7 44 24 10 1c 00 00 	movl   $0x1c,0x10(%esp)
    165e:	00 
    165f:	c7 44 24 0c 9f 00 00 	movl   $0x9f,0xc(%esp)
    1666:	00 
    1667:	c7 44 24 08 47 00 00 	movl   $0x47,0x8(%esp)
    166e:	00 
    166f:	c7 44 24 04 28 00 00 	movl   $0x28,0x4(%esp)
    1676:	00 
    1677:	89 04 24             	mov    %eax,(%esp)
    167a:	e8 15 3a 00 00       	call   5094 <initRect>
    167f:	83 ec 04             	sub    $0x4,%esp
    1682:	c7 44 24 18 21 17 00 	movl   $0x1721,0x18(%esp)
    1689:	00 
    168a:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    1691:	00 
    1692:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1695:	89 44 24 04          	mov    %eax,0x4(%esp)
    1699:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    169c:	89 44 24 08          	mov    %eax,0x8(%esp)
    16a0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    16a3:	89 44 24 0c          	mov    %eax,0xc(%esp)
    16a7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    16aa:	89 44 24 10          	mov    %eax,0x10(%esp)
    16ae:	8b 45 08             	mov    0x8(%ebp),%eax
    16b1:	89 04 24             	mov    %eax,(%esp)
    16b4:	e8 c7 3a 00 00       	call   5180 <createClickable>
}
    16b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16bc:	5b                   	pop    %ebx
    16bd:	5e                   	pop    %esi
    16be:	5f                   	pop    %edi
    16bf:	5d                   	pop    %ebp
    16c0:	c3                   	ret    

000016c1 <getFileItem>:

struct fileItem * getFileItem(Point point) {
    16c1:	55                   	push   %ebp
    16c2:	89 e5                	mov    %esp,%ebp
    16c4:	83 ec 38             	sub    $0x38,%esp
	struct fileItem *p = fileItemList;
    16c7:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
    16cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    16cf:	eb 43                	jmp    1714 <getFileItem+0x53>
		if (isIn(point, p->pos)) {
    16d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16d4:	8b 50 18             	mov    0x18(%eax),%edx
    16d7:	89 54 24 08          	mov    %edx,0x8(%esp)
    16db:	8b 50 1c             	mov    0x1c(%eax),%edx
    16de:	89 54 24 0c          	mov    %edx,0xc(%esp)
    16e2:	8b 50 20             	mov    0x20(%eax),%edx
    16e5:	89 54 24 10          	mov    %edx,0x10(%esp)
    16e9:	8b 40 24             	mov    0x24(%eax),%eax
    16ec:	89 44 24 14          	mov    %eax,0x14(%esp)
    16f0:	8b 45 08             	mov    0x8(%ebp),%eax
    16f3:	8b 55 0c             	mov    0xc(%ebp),%edx
    16f6:	89 04 24             	mov    %eax,(%esp)
    16f9:	89 54 24 04          	mov    %edx,0x4(%esp)
    16fd:	e8 ed 39 00 00       	call   50ef <isIn>
    1702:	85 c0                	test   %eax,%eax
    1704:	74 05                	je     170b <getFileItem+0x4a>
			return p;
    1706:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1709:	eb 14                	jmp    171f <getFileItem+0x5e>
		}
		p = p->next;
    170b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    170e:	8b 40 2c             	mov    0x2c(%eax),%eax
    1711:	89 45 f4             	mov    %eax,-0xc(%ebp)
	createClickable(cm, initRect(LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT), MSG_LPRESS, h_fileSortByName);
}

struct fileItem * getFileItem(Point point) {
	struct fileItem *p = fileItemList;
	while (p != 0) {
    1714:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1718:	75 b7                	jne    16d1 <getFileItem+0x10>
		if (isIn(point, p->pos)) {
			return p;
		}
		p = p->next;
	}
	return 0;
    171a:	b8 00 00 00 00       	mov    $0x0,%eax
}
    171f:	c9                   	leave  
    1720:	c3                   	ret    

00001721 <h_fileSortByName>:

void h_fileSortByName(Point p) {
    1721:	55                   	push   %ebp
    1722:	89 e5                	mov    %esp,%ebp
    1724:	83 ec 38             	sub    $0x38,%esp
	printf(0, "askjhdas\n");
    1727:	c7 44 24 04 ab c2 00 	movl   $0xc2ab,0x4(%esp)
    172e:	00 
    172f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1736:	e8 98 44 00 00       	call   5bd3 <printf>
	fileSortByName();
    173b:	e8 61 ea ff ff       	call   1a1 <fileSortByName>
	drawFinderContent(context);
    1740:	a1 00 47 01 00       	mov    0x14700,%eax
    1745:	89 04 24             	mov    %eax,(%esp)
    1748:	a1 04 47 01 00       	mov    0x14704,%eax
    174d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1751:	a1 08 47 01 00       	mov    0x14708,%eax
    1756:	89 44 24 08          	mov    %eax,0x8(%esp)
    175a:	e8 38 f8 ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    175f:	a1 00 47 01 00       	mov    0x14700,%eax
    1764:	89 04 24             	mov    %eax,(%esp)
    1767:	a1 04 47 01 00       	mov    0x14704,%eax
    176c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1770:	a1 08 47 01 00       	mov    0x14708,%eax
    1775:	89 44 24 08          	mov    %eax,0x8(%esp)
    1779:	e8 cb f4 ff ff       	call   c49 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    177e:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1781:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1788:	00 
    1789:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1790:	00 
    1791:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1798:	00 
    1799:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    17a0:	00 
    17a1:	89 04 24             	mov    %eax,(%esp)
    17a4:	e8 eb 38 00 00       	call   5094 <initRect>
    17a9:	83 ec 04             	sub    $0x4,%esp
    17ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17af:	89 44 24 04          	mov    %eax,0x4(%esp)
    17b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17b6:	89 44 24 08          	mov    %eax,0x8(%esp)
    17ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17bd:	89 44 24 0c          	mov    %eax,0xc(%esp)
    17c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17c4:	89 44 24 10          	mov    %eax,0x10(%esp)
    17c8:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    17cf:	e8 c3 3a 00 00       	call   5297 <deleteClickable>
	addWndEvent(&cm);
    17d4:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    17db:	e8 b6 fd ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    17e0:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    17e7:	e8 22 fd ff ff       	call   150e <addListEvent>
}
    17ec:	c9                   	leave  
    17ed:	c3                   	ret    

000017ee <h_searchbox>:

void h_searchbox(Point p) {
    17ee:	55                   	push   %ebp
    17ef:	89 e5                	mov    %esp,%ebp
	isSearching = 1;
    17f1:	c7 05 e0 3d 01 00 01 	movl   $0x1,0x13de0
    17f8:	00 00 00 
}
    17fb:	5d                   	pop    %ebp
    17fc:	c3                   	ret    

000017fd <scrollList>:

void scrollList(int offset) {
    17fd:	55                   	push   %ebp
    17fe:	89 e5                	mov    %esp,%ebp
    1800:	83 ec 10             	sub    $0x10,%esp
	struct fileItem *q = fileItemList;
    1803:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
    1808:	89 45 fc             	mov    %eax,-0x4(%ebp)
	while (q != 0){
    180b:	eb 1a                	jmp    1827 <scrollList+0x2a>
		q->pos.start.y += offset;
    180d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1810:	8b 50 1c             	mov    0x1c(%eax),%edx
    1813:	8b 45 08             	mov    0x8(%ebp),%eax
    1816:	01 c2                	add    %eax,%edx
    1818:	8b 45 fc             	mov    -0x4(%ebp),%eax
    181b:	89 50 1c             	mov    %edx,0x1c(%eax)
		q = q->next;
    181e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1821:	8b 40 2c             	mov    0x2c(%eax),%eax
    1824:	89 45 fc             	mov    %eax,-0x4(%ebp)
	isSearching = 1;
}

void scrollList(int offset) {
	struct fileItem *q = fileItemList;
	while (q != 0){
    1827:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
    182b:	75 e0                	jne    180d <scrollList+0x10>
		q->pos.start.y += offset;
		q = q->next;
	}
	scrollOffset += offset;
    182d:	8b 15 c0 0f 01 00    	mov    0x10fc0,%edx
    1833:	8b 45 08             	mov    0x8(%ebp),%eax
    1836:	01 d0                	add    %edx,%eax
    1838:	a3 c0 0f 01 00       	mov    %eax,0x10fc0
}
    183d:	c9                   	leave  
    183e:	c3                   	ret    

0000183f <scrollDown>:

void scrollDown() {
    183f:	55                   	push   %ebp
    1840:	89 e5                	mov    %esp,%ebp
    1842:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    1845:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
    184a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// while (q != 0)
	// {
	// 	p = q;
	// 	q = q->next;
	// }
	printf(0, "have you ever had sex?%d\n%d", fileItemList->pos.start.y, (WINDOW_HEIGHT - LIST_ITEM_HEIGHT));
    184d:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
    1852:	8b 40 1c             	mov    0x1c(%eax),%eax
    1855:	c7 44 24 0c a4 01 00 	movl   $0x1a4,0xc(%esp)
    185c:	00 
    185d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1861:	c7 44 24 04 b5 c2 00 	movl   $0xc2b5,0x4(%esp)
    1868:	00 
    1869:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1870:	e8 5e 43 00 00       	call   5bd3 <printf>
	if (style == ICON_STYLE){
    1875:	a1 64 06 01 00       	mov    0x10664,%eax
    187a:	83 f8 01             	cmp    $0x1,%eax
    187d:	75 41                	jne    18c0 <scrollDown+0x81>
		if(q->pos.start.y > (WINDOW_HEIGHT - ICON_ITEM_HEIGHT)){
    187f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1882:	8b 40 1c             	mov    0x1c(%eax),%eax
    1885:	3d 63 01 00 00       	cmp    $0x163,%eax
    188a:	7e 73                	jle    18ff <scrollDown+0xc0>
			if(q->pos.start.y > WINDOW_HEIGHT){
    188c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    188f:	8b 40 1c             	mov    0x1c(%eax),%eax
    1892:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    1897:	7e 0e                	jle    18a7 <scrollDown+0x68>
				scrollList(-SCROLL_UNIT);
    1899:	c7 04 24 e2 ff ff ff 	movl   $0xffffffe2,(%esp)
    18a0:	e8 58 ff ff ff       	call   17fd <scrollList>
    18a5:	eb 58                	jmp    18ff <scrollDown+0xc0>
			}
			else{
				scrollList(-(q->pos.start.y - (WINDOW_HEIGHT - ICON_ITEM_HEIGHT)));
    18a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18aa:	8b 40 1c             	mov    0x1c(%eax),%eax
    18ad:	ba 63 01 00 00       	mov    $0x163,%edx
    18b2:	29 c2                	sub    %eax,%edx
    18b4:	89 d0                	mov    %edx,%eax
    18b6:	89 04 24             	mov    %eax,(%esp)
    18b9:	e8 3f ff ff ff       	call   17fd <scrollList>
    18be:	eb 3f                	jmp    18ff <scrollDown+0xc0>
			}
		}
	}
	else{
		if(q->pos.start.y > (WINDOW_HEIGHT - LIST_ITEM_HEIGHT)){
    18c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18c3:	8b 40 1c             	mov    0x1c(%eax),%eax
    18c6:	3d a4 01 00 00       	cmp    $0x1a4,%eax
    18cb:	7e 32                	jle    18ff <scrollDown+0xc0>
			if(q->pos.start.y > WINDOW_HEIGHT){
    18cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18d0:	8b 40 1c             	mov    0x1c(%eax),%eax
    18d3:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    18d8:	7e 0e                	jle    18e8 <scrollDown+0xa9>
				scrollList(-SCROLL_UNIT);
    18da:	c7 04 24 e2 ff ff ff 	movl   $0xffffffe2,(%esp)
    18e1:	e8 17 ff ff ff       	call   17fd <scrollList>
    18e6:	eb 17                	jmp    18ff <scrollDown+0xc0>
			}
			else{
				scrollList(-(q->pos.start.y - (WINDOW_HEIGHT - LIST_ITEM_HEIGHT)));
    18e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18eb:	8b 40 1c             	mov    0x1c(%eax),%eax
    18ee:	ba a4 01 00 00       	mov    $0x1a4,%edx
    18f3:	29 c2                	sub    %eax,%edx
    18f5:	89 d0                	mov    %edx,%eax
    18f7:	89 04 24             	mov    %eax,(%esp)
    18fa:	e8 fe fe ff ff       	call   17fd <scrollList>
			}
		}
	}
	//printf(0, "tryingToScrollDown, current Offset %d\n", scrollOffset);
	printf(0, "scrollDown, current Offset %d\n", scrollOffset);
    18ff:	a1 c0 0f 01 00       	mov    0x10fc0,%eax
    1904:	89 44 24 08          	mov    %eax,0x8(%esp)
    1908:	c7 44 24 04 d4 c2 00 	movl   $0xc2d4,0x4(%esp)
    190f:	00 
    1910:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1917:	e8 b7 42 00 00       	call   5bd3 <printf>
}
    191c:	c9                   	leave  
    191d:	c3                   	ret    

0000191e <h_scrollDown>:

void h_scrollDown(Point p) {
    191e:	55                   	push   %ebp
    191f:	89 e5                	mov    %esp,%ebp
    1921:	83 ec 38             	sub    $0x38,%esp
	scrollDown();
    1924:	e8 16 ff ff ff       	call   183f <scrollDown>
//	updateFileList(context);
//	fileSortByName();
	drawFinderContent(context);
    1929:	a1 00 47 01 00       	mov    0x14700,%eax
    192e:	89 04 24             	mov    %eax,(%esp)
    1931:	a1 04 47 01 00       	mov    0x14704,%eax
    1936:	89 44 24 04          	mov    %eax,0x4(%esp)
    193a:	a1 08 47 01 00       	mov    0x14708,%eax
    193f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1943:	e8 4f f6 ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    1948:	a1 00 47 01 00       	mov    0x14700,%eax
    194d:	89 04 24             	mov    %eax,(%esp)
    1950:	a1 04 47 01 00       	mov    0x14704,%eax
    1955:	89 44 24 04          	mov    %eax,0x4(%esp)
    1959:	a1 08 47 01 00       	mov    0x14708,%eax
    195e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1962:	e8 e2 f2 ff ff       	call   c49 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1967:	8d 45 e8             	lea    -0x18(%ebp),%eax
    196a:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1971:	00 
    1972:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1979:	00 
    197a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1981:	00 
    1982:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1989:	00 
    198a:	89 04 24             	mov    %eax,(%esp)
    198d:	e8 02 37 00 00       	call   5094 <initRect>
    1992:	83 ec 04             	sub    $0x4,%esp
    1995:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1998:	89 44 24 04          	mov    %eax,0x4(%esp)
    199c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    199f:	89 44 24 08          	mov    %eax,0x8(%esp)
    19a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19a6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    19aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19ad:	89 44 24 10          	mov    %eax,0x10(%esp)
    19b1:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    19b8:	e8 da 38 00 00       	call   5297 <deleteClickable>
	addWndEvent(&cm);
    19bd:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    19c4:	e8 cd fb ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    19c9:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    19d0:	e8 39 fb ff ff       	call   150e <addListEvent>
}
    19d5:	c9                   	leave  
    19d6:	c3                   	ret    

000019d7 <scrollUp>:

void scrollUp() {
    19d7:	55                   	push   %ebp
    19d8:	89 e5                	mov    %esp,%ebp
    19da:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    19dd:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
    19e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p;
	while (q != 0)
    19e5:	eb 0f                	jmp    19f6 <scrollUp+0x1f>
	{
		p = q;
    19e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
		q = q->next;
    19ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19f0:	8b 40 2c             	mov    0x2c(%eax),%eax
    19f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void scrollUp() {
	struct fileItem *q = fileItemList;
	struct fileItem *p;
	while (q != 0)
    19f6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    19fa:	75 eb                	jne    19e7 <scrollUp+0x10>
	{
		p = q;
		q = q->next;
	}
	printf(0, "the first file's y is tmd:%d\n", p->pos.start.y);
    19fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19ff:	8b 40 1c             	mov    0x1c(%eax),%eax
    1a02:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a06:	c7 44 24 04 f3 c2 00 	movl   $0xc2f3,0x4(%esp)
    1a0d:	00 
    1a0e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a15:	e8 b9 41 00 00       	call   5bd3 <printf>
	printf(0, "have you ever had sex?%d\n", fileItemList->pos.start.y);
    1a1a:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
    1a1f:	8b 40 1c             	mov    0x1c(%eax),%eax
    1a22:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a26:	c7 44 24 04 11 c3 00 	movl   $0xc311,0x4(%esp)
    1a2d:	00 
    1a2e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a35:	e8 99 41 00 00       	call   5bd3 <printf>
	if (style == ICON_STYLE){
    1a3a:	a1 64 06 01 00       	mov    0x10664,%eax
    1a3f:	83 f8 01             	cmp    $0x1,%eax
    1a42:	75 3d                	jne    1a81 <scrollUp+0xaa>
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)){
    1a44:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a47:	8b 40 1c             	mov    0x1c(%eax),%eax
    1a4a:	83 f8 45             	cmp    $0x45,%eax
    1a4d:	7f 6d                	jg     1abc <scrollUp+0xe5>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - ICON_ITEM_HEIGHT)){
    1a4f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a52:	8b 40 1c             	mov    0x1c(%eax),%eax
    1a55:	83 f8 e7             	cmp    $0xffffffe7,%eax
    1a58:	7d 0e                	jge    1a68 <scrollUp+0x91>
				scrollList(SCROLL_UNIT);
    1a5a:	c7 04 24 1e 00 00 00 	movl   $0x1e,(%esp)
    1a61:	e8 97 fd ff ff       	call   17fd <scrollList>
    1a66:	eb 54                	jmp    1abc <scrollUp+0xe5>
			}
			else{
				scrollList((TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - p->pos.start.y);
    1a68:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a6b:	8b 40 1c             	mov    0x1c(%eax),%eax
    1a6e:	ba 46 00 00 00       	mov    $0x46,%edx
    1a73:	29 c2                	sub    %eax,%edx
    1a75:	89 d0                	mov    %edx,%eax
    1a77:	89 04 24             	mov    %eax,(%esp)
    1a7a:	e8 7e fd ff ff       	call   17fd <scrollList>
    1a7f:	eb 3b                	jmp    1abc <scrollUp+0xe5>
			}
		}
	}
	else{
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)){
    1a81:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a84:	8b 40 1c             	mov    0x1c(%eax),%eax
    1a87:	83 f8 61             	cmp    $0x61,%eax
    1a8a:	7f 30                	jg     1abc <scrollUp+0xe5>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - LIST_ITEM_HEIGHT)){
    1a8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a8f:	8b 40 1c             	mov    0x1c(%eax),%eax
    1a92:	83 f8 43             	cmp    $0x43,%eax
    1a95:	7f 0e                	jg     1aa5 <scrollUp+0xce>
				scrollList(SCROLL_UNIT);
    1a97:	c7 04 24 1e 00 00 00 	movl   $0x1e,(%esp)
    1a9e:	e8 5a fd ff ff       	call   17fd <scrollList>
    1aa3:	eb 17                	jmp    1abc <scrollUp+0xe5>
			}
			else{
				scrollList((TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT) - p->pos.start.y);
    1aa5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1aa8:	8b 40 1c             	mov    0x1c(%eax),%eax
    1aab:	ba 62 00 00 00       	mov    $0x62,%edx
    1ab0:	29 c2                	sub    %eax,%edx
    1ab2:	89 d0                	mov    %edx,%eax
    1ab4:	89 04 24             	mov    %eax,(%esp)
    1ab7:	e8 41 fd ff ff       	call   17fd <scrollList>
			}
		}
	}
	//printf(0, "tryingToScrollUp, current Offset %d\n", scrollOffset);
	printf(0, "scrollUp, current Offset %d\n", scrollOffset);
    1abc:	a1 c0 0f 01 00       	mov    0x10fc0,%eax
    1ac1:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ac5:	c7 44 24 04 2b c3 00 	movl   $0xc32b,0x4(%esp)
    1acc:	00 
    1acd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ad4:	e8 fa 40 00 00       	call   5bd3 <printf>
}
    1ad9:	c9                   	leave  
    1ada:	c3                   	ret    

00001adb <h_scrollUp>:

void h_scrollUp(Point p) {
    1adb:	55                   	push   %ebp
    1adc:	89 e5                	mov    %esp,%ebp
    1ade:	83 ec 38             	sub    $0x38,%esp
	scrollUp();
    1ae1:	e8 f1 fe ff ff       	call   19d7 <scrollUp>
//	updateFileList(context);
//	fileSortByName();
	drawFinderContent(context);
    1ae6:	a1 00 47 01 00       	mov    0x14700,%eax
    1aeb:	89 04 24             	mov    %eax,(%esp)
    1aee:	a1 04 47 01 00       	mov    0x14704,%eax
    1af3:	89 44 24 04          	mov    %eax,0x4(%esp)
    1af7:	a1 08 47 01 00       	mov    0x14708,%eax
    1afc:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b00:	e8 92 f4 ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    1b05:	a1 00 47 01 00       	mov    0x14700,%eax
    1b0a:	89 04 24             	mov    %eax,(%esp)
    1b0d:	a1 04 47 01 00       	mov    0x14704,%eax
    1b12:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b16:	a1 08 47 01 00       	mov    0x14708,%eax
    1b1b:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b1f:	e8 25 f1 ff ff       	call   c49 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1b24:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1b27:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1b2e:	00 
    1b2f:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1b36:	00 
    1b37:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1b3e:	00 
    1b3f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1b46:	00 
    1b47:	89 04 24             	mov    %eax,(%esp)
    1b4a:	e8 45 35 00 00       	call   5094 <initRect>
    1b4f:	83 ec 04             	sub    $0x4,%esp
    1b52:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1b55:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b59:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b5c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b60:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b63:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1b67:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b6a:	89 44 24 10          	mov    %eax,0x10(%esp)
    1b6e:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    1b75:	e8 1d 37 00 00       	call   5297 <deleteClickable>
	addWndEvent(&cm);
    1b7a:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    1b81:	e8 10 fa ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    1b86:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    1b8d:	e8 7c f9 ff ff       	call   150e <addListEvent>
}
    1b92:	c9                   	leave  
    1b93:	c3                   	ret    

00001b94 <updatePath>:

void updatePath(char *name) {
    1b94:	55                   	push   %ebp
    1b95:	89 e5                	mov    %esp,%ebp
    1b97:	83 ec 28             	sub    $0x28,%esp
	//printf(2, "cd success\r\n");
	int n = strlen(name);
    1b9a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b9d:	89 04 24             	mov    %eax,(%esp)
    1ba0:	e8 72 3c 00 00       	call   5817 <strlen>
    1ba5:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int i;
	if (n == 2 && name[0] == '.' && name[1] == '.')
    1ba8:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    1bac:	0f 85 84 00 00 00    	jne    1c36 <updatePath+0xa2>
    1bb2:	8b 45 08             	mov    0x8(%ebp),%eax
    1bb5:	0f b6 00             	movzbl (%eax),%eax
    1bb8:	3c 2e                	cmp    $0x2e,%al
    1bba:	75 7a                	jne    1c36 <updatePath+0xa2>
    1bbc:	8b 45 08             	mov    0x8(%ebp),%eax
    1bbf:	83 c0 01             	add    $0x1,%eax
    1bc2:	0f b6 00             	movzbl (%eax),%eax
    1bc5:	3c 2e                	cmp    $0x2e,%al
    1bc7:	75 6d                	jne    1c36 <updatePath+0xa2>
	{
		if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    1bc9:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    1bd0:	e8 42 3c 00 00       	call   5817 <strlen>
    1bd5:	83 f8 01             	cmp    $0x1,%eax
    1bd8:	75 0b                	jne    1be5 <updatePath+0x51>
    1bda:	0f b6 05 40 47 01 00 	movzbl 0x14740,%eax
    1be1:	3c 2f                	cmp    $0x2f,%al
    1be3:	74 4f                	je     1c34 <updatePath+0xa0>
		{
			int tmpn = strlen(currentPath);
    1be5:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    1bec:	e8 26 3c 00 00       	call   5817 <strlen>
    1bf1:	89 45 ec             	mov    %eax,-0x14(%ebp)
			currentPath[tmpn - 1] = '\0';
    1bf4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1bf7:	83 e8 01             	sub    $0x1,%eax
    1bfa:	c6 80 40 47 01 00 00 	movb   $0x0,0x14740(%eax)
			for (i = tmpn - 2; i > 0; i--)
    1c01:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1c04:	83 e8 02             	sub    $0x2,%eax
    1c07:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1c0a:	eb 22                	jmp    1c2e <updatePath+0x9a>
			{
				if (currentPath[i] != '/')
    1c0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c0f:	05 40 47 01 00       	add    $0x14740,%eax
    1c14:	0f b6 00             	movzbl (%eax),%eax
    1c17:	3c 2f                	cmp    $0x2f,%al
    1c19:	74 11                	je     1c2c <updatePath+0x98>
					currentPath[i] = '\0';
    1c1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c1e:	05 40 47 01 00       	add    $0x14740,%eax
    1c23:	c6 00 00             	movb   $0x0,(%eax)
	{
		if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
		{
			int tmpn = strlen(currentPath);
			currentPath[tmpn - 1] = '\0';
			for (i = tmpn - 2; i > 0; i--)
    1c26:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    1c2a:	eb 02                	jmp    1c2e <updatePath+0x9a>
			{
				if (currentPath[i] != '/')
					currentPath[i] = '\0';
				else
					break;
    1c2c:	eb 06                	jmp    1c34 <updatePath+0xa0>
	{
		if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
		{
			int tmpn = strlen(currentPath);
			currentPath[tmpn - 1] = '\0';
			for (i = tmpn - 2; i > 0; i--)
    1c2e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1c32:	7f d8                	jg     1c0c <updatePath+0x78>
	//printf(2, "cd success\r\n");
	int n = strlen(name);
	int i;
	if (n == 2 && name[0] == '.' && name[1] == '.')
	{
		if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    1c34:	eb 4e                	jmp    1c84 <updatePath+0xf0>
			}
		}
	}
	else
	{
		int tmpn = strlen(currentPath);
    1c36:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    1c3d:	e8 d5 3b 00 00       	call   5817 <strlen>
    1c42:	89 45 e8             	mov    %eax,-0x18(%ebp)
		strcpy(currentPath + tmpn, name);
    1c45:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1c48:	8d 90 40 47 01 00    	lea    0x14740(%eax),%edx
    1c4e:	8b 45 08             	mov    0x8(%ebp),%eax
    1c51:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c55:	89 14 24             	mov    %edx,(%esp)
    1c58:	e8 4b 3b 00 00       	call   57a8 <strcpy>
		tmpn = strlen(currentPath);
    1c5d:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    1c64:	e8 ae 3b 00 00       	call   5817 <strlen>
    1c69:	89 45 e8             	mov    %eax,-0x18(%ebp)
		currentPath[tmpn] = '/';
    1c6c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1c6f:	05 40 47 01 00       	add    $0x14740,%eax
    1c74:	c6 00 2f             	movb   $0x2f,(%eax)
		currentPath[tmpn + 1] = '\0';
    1c77:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1c7a:	83 c0 01             	add    $0x1,%eax
    1c7d:	c6 80 40 47 01 00 00 	movb   $0x0,0x14740(%eax)
	}
}
    1c84:	c9                   	leave  
    1c85:	c3                   	ret    

00001c86 <enterDir>:

// Handlers
void enterDir(char *name) {
    1c86:	55                   	push   %ebp
    1c87:	89 e5                	mov    %esp,%ebp
    1c89:	83 ec 18             	sub    $0x18,%esp
	scrollOffset = 0;
    1c8c:	c7 05 c0 0f 01 00 00 	movl   $0x0,0x10fc0
    1c93:	00 00 00 
	printf(0, "entering : %s\n", name);
    1c96:	8b 45 08             	mov    0x8(%ebp),%eax
    1c99:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c9d:	c7 44 24 04 48 c3 00 	movl   $0xc348,0x4(%esp)
    1ca4:	00 
    1ca5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1cac:	e8 22 3f 00 00       	call   5bd3 <printf>
	if (chdir(name) < 0)
    1cb1:	8b 45 08             	mov    0x8(%ebp),%eax
    1cb4:	89 04 24             	mov    %eax,(%esp)
    1cb7:	e8 9f 3d 00 00       	call   5a5b <chdir>
    1cbc:	85 c0                	test   %eax,%eax
    1cbe:	79 1d                	jns    1cdd <enterDir+0x57>
		printf(2, "cannot cd %s\n", name);
    1cc0:	8b 45 08             	mov    0x8(%ebp),%eax
    1cc3:	89 44 24 08          	mov    %eax,0x8(%esp)
    1cc7:	c7 44 24 04 57 c3 00 	movl   $0xc357,0x4(%esp)
    1cce:	00 
    1ccf:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1cd6:	e8 f8 3e 00 00       	call   5bd3 <printf>
    1cdb:	eb 0b                	jmp    1ce8 <enterDir+0x62>
	else
		updatePath(name);
    1cdd:	8b 45 08             	mov    0x8(%ebp),%eax
    1ce0:	89 04 24             	mov    %eax,(%esp)
    1ce3:	e8 ac fe ff ff       	call   1b94 <updatePath>
	printf(0, "currentPath: %s\n", currentPath);
    1ce8:	c7 44 24 08 40 47 01 	movl   $0x14740,0x8(%esp)
    1cef:	00 
    1cf0:	c7 44 24 04 65 c3 00 	movl   $0xc365,0x4(%esp)
    1cf7:	00 
    1cf8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1cff:	e8 cf 3e 00 00       	call   5bd3 <printf>
}
    1d04:	c9                   	leave  
    1d05:	c3                   	ret    

00001d06 <h_enterDir>:

void h_enterDir(Point p) {
    1d06:	55                   	push   %ebp
    1d07:	89 e5                	mov    %esp,%ebp
    1d09:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *temp = getFileItem(p);
    1d0c:	8b 45 08             	mov    0x8(%ebp),%eax
    1d0f:	8b 55 0c             	mov    0xc(%ebp),%edx
    1d12:	89 04 24             	mov    %eax,(%esp)
    1d15:	89 54 24 04          	mov    %edx,0x4(%esp)
    1d19:	e8 a3 f9 ff ff       	call   16c1 <getFileItem>
    1d1e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	enterDir(temp->name);
    1d21:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d24:	8b 40 14             	mov    0x14(%eax),%eax
    1d27:	89 04 24             	mov    %eax,(%esp)
    1d2a:	e8 57 ff ff ff       	call   1c86 <enterDir>
	updateFileList(context);
    1d2f:	a1 00 47 01 00       	mov    0x14700,%eax
    1d34:	89 04 24             	mov    %eax,(%esp)
    1d37:	a1 04 47 01 00       	mov    0x14704,%eax
    1d3c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d40:	a1 08 47 01 00       	mov    0x14708,%eax
    1d45:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d49:	e8 fa f0 ff ff       	call   e48 <updateFileList>
	drawFinderContent(context);
    1d4e:	a1 00 47 01 00       	mov    0x14700,%eax
    1d53:	89 04 24             	mov    %eax,(%esp)
    1d56:	a1 04 47 01 00       	mov    0x14704,%eax
    1d5b:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d5f:	a1 08 47 01 00       	mov    0x14708,%eax
    1d64:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d68:	e8 2a f2 ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    1d6d:	a1 00 47 01 00       	mov    0x14700,%eax
    1d72:	89 04 24             	mov    %eax,(%esp)
    1d75:	a1 04 47 01 00       	mov    0x14704,%eax
    1d7a:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d7e:	a1 08 47 01 00       	mov    0x14708,%eax
    1d83:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d87:	e8 bd ee ff ff       	call   c49 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1d8c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1d8f:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1d96:	00 
    1d97:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1d9e:	00 
    1d9f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1da6:	00 
    1da7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1dae:	00 
    1daf:	89 04 24             	mov    %eax,(%esp)
    1db2:	e8 dd 32 00 00       	call   5094 <initRect>
    1db7:	83 ec 04             	sub    $0x4,%esp
    1dba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1dbd:	89 44 24 04          	mov    %eax,0x4(%esp)
    1dc1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1dc4:	89 44 24 08          	mov    %eax,0x8(%esp)
    1dc8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1dcb:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1dcf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1dd2:	89 44 24 10          	mov    %eax,0x10(%esp)
    1dd6:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    1ddd:	e8 b5 34 00 00       	call   5297 <deleteClickable>
	addWndEvent(&cm);
    1de2:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    1de9:	e8 a8 f7 ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    1dee:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    1df5:	e8 14 f7 ff ff       	call   150e <addListEvent>
}
    1dfa:	c9                   	leave  
    1dfb:	c3                   	ret    

00001dfc <newFile>:

void newFile(char *name) {
    1dfc:	55                   	push   %ebp
    1dfd:	89 e5                	mov    %esp,%ebp
    1dff:	83 ec 28             	sub    $0x28,%esp
	int fd;
	int n = strlen(name);
    1e02:	8b 45 08             	mov    0x8(%ebp),%eax
    1e05:	89 04 24             	mov    %eax,(%esp)
    1e08:	e8 0a 3a 00 00       	call   5817 <strlen>
    1e0d:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 8;
    1e10:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
	int counter;
	while ((fd = open(name, 0)) > 0)
    1e17:	eb 60                	jmp    1e79 <newFile+0x7d>
	{
		n = strlen(name);
    1e19:	8b 45 08             	mov    0x8(%ebp),%eax
    1e1c:	89 04 24             	mov    %eax,(%esp)
    1e1f:	e8 f3 39 00 00       	call   5817 <strlen>
    1e24:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    1e27:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e2a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1e2d:	75 09                	jne    1e38 <newFile+0x3c>
		{
			counter = 1;
    1e2f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1e36:	eb 17                	jmp    1e4f <newFile+0x53>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    1e38:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1e3b:	8b 45 08             	mov    0x8(%ebp),%eax
    1e3e:	01 d0                	add    %edx,%eax
    1e40:	89 04 24             	mov    %eax,(%esp)
    1e43:	e8 11 3b 00 00       	call   5959 <atoi>
    1e48:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    1e4b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    1e4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e52:	89 04 24             	mov    %eax,(%esp)
    1e55:	e8 ba f3 ff ff       	call   1214 <int2str>
    1e5a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1e5d:	8b 55 08             	mov    0x8(%ebp),%edx
    1e60:	01 ca                	add    %ecx,%edx
    1e62:	89 44 24 04          	mov    %eax,0x4(%esp)
    1e66:	89 14 24             	mov    %edx,(%esp)
    1e69:	e8 3a 39 00 00       	call   57a8 <strcpy>
		close(fd);
    1e6e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e71:	89 04 24             	mov    %eax,(%esp)
    1e74:	e8 9a 3b 00 00       	call   5a13 <close>
void newFile(char *name) {
	int fd;
	int n = strlen(name);
	int baseLen = 8;
	int counter;
	while ((fd = open(name, 0)) > 0)
    1e79:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1e80:	00 
    1e81:	8b 45 08             	mov    0x8(%ebp),%eax
    1e84:	89 04 24             	mov    %eax,(%esp)
    1e87:	e8 9f 3b 00 00       	call   5a2b <open>
    1e8c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1e8f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1e93:	7f 84                	jg     1e19 <newFile+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		close(fd);
	}
	if ((fd = open(name, O_CREATE)) < 0) {
    1e95:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    1e9c:	00 
    1e9d:	8b 45 08             	mov    0x8(%ebp),%eax
    1ea0:	89 04 24             	mov    %eax,(%esp)
    1ea3:	e8 83 3b 00 00       	call   5a2b <open>
    1ea8:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1eab:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1eaf:	79 20                	jns    1ed1 <newFile+0xd5>
		printf(0, "cat: cannot open %s\n", name);
    1eb1:	8b 45 08             	mov    0x8(%ebp),%eax
    1eb4:	89 44 24 08          	mov    %eax,0x8(%esp)
    1eb8:	c7 44 24 04 76 c3 00 	movl   $0xc376,0x4(%esp)
    1ebf:	00 
    1ec0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ec7:	e8 07 3d 00 00       	call   5bd3 <printf>
		exit();
    1ecc:	e8 1a 3b 00 00       	call   59eb <exit>
	}
	close(fd);
    1ed1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ed4:	89 04 24             	mov    %eax,(%esp)
    1ed7:	e8 37 3b 00 00       	call   5a13 <close>
}
    1edc:	c9                   	leave  
    1edd:	c3                   	ret    

00001ede <h_newFile>:

void h_newFile(Point p) {
    1ede:	55                   	push   %ebp
    1edf:	89 e5                	mov    %esp,%ebp
    1ee1:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "file.txt";
    1ee4:	c7 45 c8 66 69 6c 65 	movl   $0x656c6966,-0x38(%ebp)
    1eeb:	c7 45 cc 2e 74 78 74 	movl   $0x7478742e,-0x34(%ebp)
    1ef2:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    1ef9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    1f00:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1f07:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    1f0e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1f15:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFile(nf);
    1f1c:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1f1f:	89 04 24             	mov    %eax,(%esp)
    1f22:	e8 d5 fe ff ff       	call   1dfc <newFile>
	updateFileList(context);
    1f27:	a1 00 47 01 00       	mov    0x14700,%eax
    1f2c:	89 04 24             	mov    %eax,(%esp)
    1f2f:	a1 04 47 01 00       	mov    0x14704,%eax
    1f34:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f38:	a1 08 47 01 00       	mov    0x14708,%eax
    1f3d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f41:	e8 02 ef ff ff       	call   e48 <updateFileList>
	drawFinderContent(context);
    1f46:	a1 00 47 01 00       	mov    0x14700,%eax
    1f4b:	89 04 24             	mov    %eax,(%esp)
    1f4e:	a1 04 47 01 00       	mov    0x14704,%eax
    1f53:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f57:	a1 08 47 01 00       	mov    0x14708,%eax
    1f5c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f60:	e8 32 f0 ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    1f65:	a1 00 47 01 00       	mov    0x14700,%eax
    1f6a:	89 04 24             	mov    %eax,(%esp)
    1f6d:	a1 04 47 01 00       	mov    0x14704,%eax
    1f72:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f76:	a1 08 47 01 00       	mov    0x14708,%eax
    1f7b:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f7f:	e8 c5 ec ff ff       	call   c49 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1f84:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1f87:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1f8e:	00 
    1f8f:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1f96:	00 
    1f97:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1f9e:	00 
    1f9f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1fa6:	00 
    1fa7:	89 04 24             	mov    %eax,(%esp)
    1faa:	e8 e5 30 00 00       	call   5094 <initRect>
    1faf:	83 ec 04             	sub    $0x4,%esp
    1fb2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1fb5:	89 44 24 04          	mov    %eax,0x4(%esp)
    1fb9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1fbc:	89 44 24 08          	mov    %eax,0x8(%esp)
    1fc0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1fc3:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1fc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1fca:	89 44 24 10          	mov    %eax,0x10(%esp)
    1fce:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    1fd5:	e8 bd 32 00 00       	call   5297 <deleteClickable>
	addWndEvent(&cm);
    1fda:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    1fe1:	e8 b0 f5 ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    1fe6:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    1fed:	e8 1c f5 ff ff       	call   150e <addListEvent>
}
    1ff2:	c9                   	leave  
    1ff3:	c3                   	ret    

00001ff4 <newFolder>:

void newFolder(char *name) {
    1ff4:	55                   	push   %ebp
    1ff5:	89 e5                	mov    %esp,%ebp
    1ff7:	83 ec 28             	sub    $0x28,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
    1ffa:	8b 45 08             	mov    0x8(%ebp),%eax
    1ffd:	89 04 24             	mov    %eax,(%esp)
    2000:	e8 12 38 00 00       	call   5817 <strlen>
    2005:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 9;
    2008:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%ebp)
	int counter;
	while (mkdir(name) < 0) {
    200f:	eb 55                	jmp    2066 <newFolder+0x72>
		n = strlen(name);
    2011:	8b 45 08             	mov    0x8(%ebp),%eax
    2014:	89 04 24             	mov    %eax,(%esp)
    2017:	e8 fb 37 00 00       	call   5817 <strlen>
    201c:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    201f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2022:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    2025:	75 09                	jne    2030 <newFolder+0x3c>
		{
			counter = 1;
    2027:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    202e:	eb 17                	jmp    2047 <newFolder+0x53>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    2030:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2033:	8b 45 08             	mov    0x8(%ebp),%eax
    2036:	01 d0                	add    %edx,%eax
    2038:	89 04 24             	mov    %eax,(%esp)
    203b:	e8 19 39 00 00       	call   5959 <atoi>
    2040:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    2043:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    2047:	8b 45 f4             	mov    -0xc(%ebp),%eax
    204a:	89 04 24             	mov    %eax,(%esp)
    204d:	e8 c2 f1 ff ff       	call   1214 <int2str>
    2052:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    2055:	8b 55 08             	mov    0x8(%ebp),%edx
    2058:	01 ca                	add    %ecx,%edx
    205a:	89 44 24 04          	mov    %eax,0x4(%esp)
    205e:	89 14 24             	mov    %edx,(%esp)
    2061:	e8 42 37 00 00       	call   57a8 <strcpy>
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    2066:	8b 45 08             	mov    0x8(%ebp),%eax
    2069:	89 04 24             	mov    %eax,(%esp)
    206c:	e8 e2 39 00 00       	call   5a53 <mkdir>
    2071:	85 c0                	test   %eax,%eax
    2073:	78 9c                	js     2011 <newFolder+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		//printf(0, "mkdir: %s failed to create\n", newfolder);
	}
}
    2075:	c9                   	leave  
    2076:	c3                   	ret    

00002077 <h_newFolder>:

void h_newFolder(Point p) {
    2077:	55                   	push   %ebp
    2078:	89 e5                	mov    %esp,%ebp
    207a:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "newFolder";
    207d:	c7 45 c8 6e 65 77 46 	movl   $0x4677656e,-0x38(%ebp)
    2084:	c7 45 cc 6f 6c 64 65 	movl   $0x65646c6f,-0x34(%ebp)
    208b:	c7 45 d0 72 00 00 00 	movl   $0x72,-0x30(%ebp)
    2092:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    2099:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    20a0:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    20a7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    20ae:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFolder(nf);
    20b5:	8d 45 c8             	lea    -0x38(%ebp),%eax
    20b8:	89 04 24             	mov    %eax,(%esp)
    20bb:	e8 34 ff ff ff       	call   1ff4 <newFolder>
	printf(0, "new folder!\n");
    20c0:	c7 44 24 04 8b c3 00 	movl   $0xc38b,0x4(%esp)
    20c7:	00 
    20c8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    20cf:	e8 ff 3a 00 00       	call   5bd3 <printf>
	updateFileList(context);
    20d4:	a1 00 47 01 00       	mov    0x14700,%eax
    20d9:	89 04 24             	mov    %eax,(%esp)
    20dc:	a1 04 47 01 00       	mov    0x14704,%eax
    20e1:	89 44 24 04          	mov    %eax,0x4(%esp)
    20e5:	a1 08 47 01 00       	mov    0x14708,%eax
    20ea:	89 44 24 08          	mov    %eax,0x8(%esp)
    20ee:	e8 55 ed ff ff       	call   e48 <updateFileList>
	printItemList();
    20f3:	e8 00 f2 ff ff       	call   12f8 <printItemList>
	drawFinderContent(context);
    20f8:	a1 00 47 01 00       	mov    0x14700,%eax
    20fd:	89 04 24             	mov    %eax,(%esp)
    2100:	a1 04 47 01 00       	mov    0x14704,%eax
    2105:	89 44 24 04          	mov    %eax,0x4(%esp)
    2109:	a1 08 47 01 00       	mov    0x14708,%eax
    210e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2112:	e8 80 ee ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    2117:	a1 00 47 01 00       	mov    0x14700,%eax
    211c:	89 04 24             	mov    %eax,(%esp)
    211f:	a1 04 47 01 00       	mov    0x14704,%eax
    2124:	89 44 24 04          	mov    %eax,0x4(%esp)
    2128:	a1 08 47 01 00       	mov    0x14708,%eax
    212d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2131:	e8 13 eb ff ff       	call   c49 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2136:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2139:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    2140:	00 
    2141:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2148:	00 
    2149:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2150:	00 
    2151:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2158:	00 
    2159:	89 04 24             	mov    %eax,(%esp)
    215c:	e8 33 2f 00 00       	call   5094 <initRect>
    2161:	83 ec 04             	sub    $0x4,%esp
    2164:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2167:	89 44 24 04          	mov    %eax,0x4(%esp)
    216b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    216e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2172:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2175:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2179:	8b 45 f4             	mov    -0xc(%ebp),%eax
    217c:	89 44 24 10          	mov    %eax,0x10(%esp)
    2180:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    2187:	e8 0b 31 00 00       	call   5297 <deleteClickable>
	addWndEvent(&cm);
    218c:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    2193:	e8 fe f3 ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    2198:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    219f:	e8 6a f3 ff ff       	call   150e <addListEvent>
}
    21a4:	c9                   	leave  
    21a5:	c3                   	ret    

000021a6 <deleteFile>:

void deleteFile(char *name)
{
    21a6:	55                   	push   %ebp
    21a7:	89 e5                	mov    %esp,%ebp
    21a9:	83 ec 28             	sub    $0x28,%esp
	printf(0, "currently having sex with %s\n", name);
    21ac:	8b 45 08             	mov    0x8(%ebp),%eax
    21af:	89 44 24 08          	mov    %eax,0x8(%esp)
    21b3:	c7 44 24 04 98 c3 00 	movl   $0xc398,0x4(%esp)
    21ba:	00 
    21bb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    21c2:	e8 0c 3a 00 00       	call   5bd3 <printf>
	if(unlink(name) < 0){
    21c7:	8b 45 08             	mov    0x8(%ebp),%eax
    21ca:	89 04 24             	mov    %eax,(%esp)
    21cd:	e8 69 38 00 00       	call   5a3b <unlink>
    21d2:	85 c0                	test   %eax,%eax
    21d4:	0f 89 c9 00 00 00    	jns    22a3 <deleteFile+0xfd>
		if (chdir(name) < 0){
    21da:	8b 45 08             	mov    0x8(%ebp),%eax
    21dd:	89 04 24             	mov    %eax,(%esp)
    21e0:	e8 76 38 00 00       	call   5a5b <chdir>
    21e5:	85 c0                	test   %eax,%eax
    21e7:	79 20                	jns    2209 <deleteFile+0x63>
			printf(2, "rm: %s failed to delete\n", name);
    21e9:	8b 45 08             	mov    0x8(%ebp),%eax
    21ec:	89 44 24 08          	mov    %eax,0x8(%esp)
    21f0:	c7 44 24 04 b6 c3 00 	movl   $0xc3b6,0x4(%esp)
    21f7:	00 
    21f8:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    21ff:	e8 cf 39 00 00       	call   5bd3 <printf>
    2204:	e9 9a 00 00 00       	jmp    22a3 <deleteFile+0xfd>
		}
		else{
			updateFileList(context);
    2209:	a1 00 47 01 00       	mov    0x14700,%eax
    220e:	89 04 24             	mov    %eax,(%esp)
    2211:	a1 04 47 01 00       	mov    0x14704,%eax
    2216:	89 44 24 04          	mov    %eax,0x4(%esp)
    221a:	a1 08 47 01 00       	mov    0x14708,%eax
    221f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2223:	e8 20 ec ff ff       	call   e48 <updateFileList>
			struct fileItem *p;
			p = fileItemList;
    2228:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
    222d:	89 45 f4             	mov    %eax,-0xc(%ebp)
			while (p != 0) {
    2230:	eb 35                	jmp    2267 <deleteFile+0xc1>
				deleteFile(p->name);
    2232:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2235:	8b 40 14             	mov    0x14(%eax),%eax
    2238:	89 04 24             	mov    %eax,(%esp)
    223b:	e8 66 ff ff ff       	call   21a6 <deleteFile>
				updateFileList(context);
    2240:	a1 00 47 01 00       	mov    0x14700,%eax
    2245:	89 04 24             	mov    %eax,(%esp)
    2248:	a1 04 47 01 00       	mov    0x14704,%eax
    224d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2251:	a1 08 47 01 00       	mov    0x14708,%eax
    2256:	89 44 24 08          	mov    %eax,0x8(%esp)
    225a:	e8 e9 eb ff ff       	call   e48 <updateFileList>
				p = fileItemList;
    225f:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
    2264:	89 45 f4             	mov    %eax,-0xc(%ebp)
		}
		else{
			updateFileList(context);
			struct fileItem *p;
			p = fileItemList;
			while (p != 0) {
    2267:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    226b:	75 c5                	jne    2232 <deleteFile+0x8c>
				deleteFile(p->name);
				updateFileList(context);
				p = fileItemList;
			}
			chdir("..");
    226d:	c7 04 24 cf c3 00 00 	movl   $0xc3cf,(%esp)
    2274:	e8 e2 37 00 00       	call   5a5b <chdir>
			updateFileList(context);
    2279:	a1 00 47 01 00       	mov    0x14700,%eax
    227e:	89 04 24             	mov    %eax,(%esp)
    2281:	a1 04 47 01 00       	mov    0x14704,%eax
    2286:	89 44 24 04          	mov    %eax,0x4(%esp)
    228a:	a1 08 47 01 00       	mov    0x14708,%eax
    228f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2293:	e8 b0 eb ff ff       	call   e48 <updateFileList>
			unlink(name);
    2298:	8b 45 08             	mov    0x8(%ebp),%eax
    229b:	89 04 24             	mov    %eax,(%esp)
    229e:	e8 98 37 00 00       	call   5a3b <unlink>
		}
	}
}
    22a3:	c9                   	leave  
    22a4:	c3                   	ret    

000022a5 <h_deleteFile>:
void h_deleteFile(Point p) {
    22a5:	55                   	push   %ebp
    22a6:	89 e5                	mov    %esp,%ebp
    22a8:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *q = fileItemList;
    22ab:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
    22b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
    22b3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    22ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
    22bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
    22c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
	printf(0, "hi1\n");
    22c6:	c7 44 24 04 d2 c3 00 	movl   $0xc3d2,0x4(%esp)
    22cd:	00 
    22ce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    22d5:	e8 f9 38 00 00       	call   5bd3 <printf>
	while (q != 0)
    22da:	e9 8d 00 00 00       	jmp    236c <h_deleteFile+0xc7>
	{
		printf(0, "hi2\n");
    22df:	c7 44 24 04 d7 c3 00 	movl   $0xc3d7,0x4(%esp)
    22e6:	00 
    22e7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    22ee:	e8 e0 38 00 00       	call   5bd3 <printf>
		if (q->chosen)
    22f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22f6:	8b 40 28             	mov    0x28(%eax),%eax
    22f9:	85 c0                	test   %eax,%eax
    22fb:	74 66                	je     2363 <h_deleteFile+0xbe>
		{
			p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
    22fd:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
    2304:	e8 b6 3b 00 00       	call   5ebf <malloc>
    2309:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    230c:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    2313:	e8 a7 3b 00 00       	call   5ebf <malloc>
    2318:	8b 55 f0             	mov    -0x10(%ebp),%edx
    231b:	89 42 14             	mov    %eax,0x14(%edx)
			strcpy(p1->name, q->name);
    231e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2321:	8b 50 14             	mov    0x14(%eax),%edx
    2324:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2327:	8b 40 14             	mov    0x14(%eax),%eax
    232a:	89 54 24 04          	mov    %edx,0x4(%esp)
    232e:	89 04 24             	mov    %eax,(%esp)
    2331:	e8 72 34 00 00       	call   57a8 <strcpy>
			if(head == 0)
    2336:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    233a:	75 0e                	jne    234a <h_deleteFile+0xa5>
			{
				head = p1;
    233c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    233f:	89 45 ec             	mov    %eax,-0x14(%ebp)
				p2 = p1;
    2342:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2345:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2348:	eb 0f                	jmp    2359 <h_deleteFile+0xb4>
			} else {
				p2->next = p1;
    234a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    234d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2350:	89 50 2c             	mov    %edx,0x2c(%eax)
				p2 = p1;
    2353:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2356:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}
			p1->next = 0;
    2359:	8b 45 f0             	mov    -0x10(%ebp),%eax
    235c:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
		}
		q = q->next;
    2363:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2366:	8b 40 2c             	mov    0x2c(%eax),%eax
    2369:	89 45 f4             	mov    %eax,-0xc(%ebp)
void h_deleteFile(Point p) {
	struct fileItem *q = fileItemList;
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
	printf(0, "hi1\n");
	while (q != 0)
    236c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2370:	0f 85 69 ff ff ff    	jne    22df <h_deleteFile+0x3a>
			}
			p1->next = 0;
		}
		q = q->next;
	}
	p1 = head;
    2376:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2379:	89 45 f0             	mov    %eax,-0x10(%ebp)
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
    237c:	c7 44 24 04 dc c3 00 	movl   $0xc3dc,0x4(%esp)
    2383:	00 
    2384:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    238b:	e8 43 38 00 00       	call   5bd3 <printf>
	while (p1 != 0)
    2390:	eb 17                	jmp    23a9 <h_deleteFile+0x104>
	{
		deleteFile(p1->name);
    2392:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2395:	8b 40 14             	mov    0x14(%eax),%eax
    2398:	89 04 24             	mov    %eax,(%esp)
    239b:	e8 06 fe ff ff       	call   21a6 <deleteFile>
		p1 = p1->next;
    23a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    23a3:	8b 40 2c             	mov    0x2c(%eax),%eax
    23a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
		}
		q = q->next;
	}
	p1 = head;
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
	while (p1 != 0)
    23a9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    23ad:	75 e3                	jne    2392 <h_deleteFile+0xed>
	{
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
    23af:	c7 44 24 04 44 c4 00 	movl   $0xc444,0x4(%esp)
    23b6:	00 
    23b7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23be:	e8 10 38 00 00       	call   5bd3 <printf>
	p1 = head;
    23c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    23c6:	89 45 f0             	mov    %eax,-0x10(%ebp)
	while (p1 != 0) {
    23c9:	eb 46                	jmp    2411 <h_deleteFile+0x16c>
		p2 = p1;
    23cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    23ce:	89 45 e8             	mov    %eax,-0x18(%ebp)
		printf(0, "freeing %s\n", p2->name);
    23d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    23d4:	8b 40 14             	mov    0x14(%eax),%eax
    23d7:	89 44 24 08          	mov    %eax,0x8(%esp)
    23db:	c7 44 24 04 5a c4 00 	movl   $0xc45a,0x4(%esp)
    23e2:	00 
    23e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23ea:	e8 e4 37 00 00       	call   5bd3 <printf>
		p1 = p1->next;
    23ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
    23f2:	8b 40 2c             	mov    0x2c(%eax),%eax
    23f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
		free(p2->name);
    23f8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    23fb:	8b 40 14             	mov    0x14(%eax),%eax
    23fe:	89 04 24             	mov    %eax,(%esp)
    2401:	e8 80 39 00 00       	call   5d86 <free>
		free(p2);
    2406:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2409:	89 04 24             	mov    %eax,(%esp)
    240c:	e8 75 39 00 00       	call   5d86 <free>
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
	p1 = head;
	while (p1 != 0) {
    2411:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2415:	75 b4                	jne    23cb <h_deleteFile+0x126>
		printf(0, "freeing %s\n", p2->name);
		p1 = p1->next;
		free(p2->name);
		free(p2);
	}
	printf(0, "done freeing!~~~\n");
    2417:	c7 44 24 04 66 c4 00 	movl   $0xc466,0x4(%esp)
    241e:	00 
    241f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2426:	e8 a8 37 00 00       	call   5bd3 <printf>
	updateFileList(context);
    242b:	a1 00 47 01 00       	mov    0x14700,%eax
    2430:	89 04 24             	mov    %eax,(%esp)
    2433:	a1 04 47 01 00       	mov    0x14704,%eax
    2438:	89 44 24 04          	mov    %eax,0x4(%esp)
    243c:	a1 08 47 01 00       	mov    0x14708,%eax
    2441:	89 44 24 08          	mov    %eax,0x8(%esp)
    2445:	e8 fe e9 ff ff       	call   e48 <updateFileList>
	printItemList();
    244a:	e8 a9 ee ff ff       	call   12f8 <printItemList>
	drawFinderContent(context);
    244f:	a1 00 47 01 00       	mov    0x14700,%eax
    2454:	89 04 24             	mov    %eax,(%esp)
    2457:	a1 04 47 01 00       	mov    0x14704,%eax
    245c:	89 44 24 04          	mov    %eax,0x4(%esp)
    2460:	a1 08 47 01 00       	mov    0x14708,%eax
    2465:	89 44 24 08          	mov    %eax,0x8(%esp)
    2469:	e8 29 eb ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    246e:	a1 00 47 01 00       	mov    0x14700,%eax
    2473:	89 04 24             	mov    %eax,(%esp)
    2476:	a1 04 47 01 00       	mov    0x14704,%eax
    247b:	89 44 24 04          	mov    %eax,0x4(%esp)
    247f:	a1 08 47 01 00       	mov    0x14708,%eax
    2484:	89 44 24 08          	mov    %eax,0x8(%esp)
    2488:	e8 bc e7 ff ff       	call   c49 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    248d:	8d 45 d8             	lea    -0x28(%ebp),%eax
    2490:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    2497:	00 
    2498:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    249f:	00 
    24a0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    24a7:	00 
    24a8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    24af:	00 
    24b0:	89 04 24             	mov    %eax,(%esp)
    24b3:	e8 dc 2b 00 00       	call   5094 <initRect>
    24b8:	83 ec 04             	sub    $0x4,%esp
    24bb:	8b 45 d8             	mov    -0x28(%ebp),%eax
    24be:	89 44 24 04          	mov    %eax,0x4(%esp)
    24c2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    24c5:	89 44 24 08          	mov    %eax,0x8(%esp)
    24c9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    24cc:	89 44 24 0c          	mov    %eax,0xc(%esp)
    24d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    24d3:	89 44 24 10          	mov    %eax,0x10(%esp)
    24d7:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    24de:	e8 b4 2d 00 00       	call   5297 <deleteClickable>
	addWndEvent(&cm);
    24e3:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    24ea:	e8 a7 f0 ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    24ef:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    24f6:	e8 13 f0 ff ff       	call   150e <addListEvent>
}
    24fb:	c9                   	leave  
    24fc:	c3                   	ret    

000024fd <saveRename>:

void saveRename(){
    24fd:	55                   	push   %ebp
    24fe:	89 e5                	mov    %esp,%ebp
    2500:	53                   	push   %ebx
    2501:	81 ec 24 02 00 00    	sub    $0x224,%esp
	char tempName[MAX_NAME_LEN];
	char tempNameFrom[MAX_NAME_LEN];
	int i;
	strcpy(tempNameFrom, currentPath);
    2507:	c7 44 24 04 40 47 01 	movl   $0x14740,0x4(%esp)
    250e:	00 
    250f:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    2515:	89 04 24             	mov    %eax,(%esp)
    2518:	e8 8b 32 00 00       	call   57a8 <strcpy>
	strcpy(tempName, currentlyRenaming->name);
    251d:	a1 cc 0f 01 00       	mov    0x10fcc,%eax
    2522:	8b 40 14             	mov    0x14(%eax),%eax
    2525:	89 44 24 04          	mov    %eax,0x4(%esp)
    2529:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
    252f:	89 04 24             	mov    %eax,(%esp)
    2532:	e8 71 32 00 00       	call   57a8 <strcpy>
	strcpy(tempNameFrom + strlen(tempNameFrom), renameFrom);
    2537:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    253d:	89 04 24             	mov    %eax,(%esp)
    2540:	e8 d2 32 00 00       	call   5817 <strlen>
    2545:	8d 95 f4 fd ff ff    	lea    -0x20c(%ebp),%edx
    254b:	01 d0                	add    %edx,%eax
    254d:	c7 44 24 04 00 46 01 	movl   $0x14600,0x4(%esp)
    2554:	00 
    2555:	89 04 24             	mov    %eax,(%esp)
    2558:	e8 4b 32 00 00       	call   57a8 <strcpy>
	printf(0, "why? %s", tempName);
    255d:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
    2563:	89 44 24 08          	mov    %eax,0x8(%esp)
    2567:	c7 44 24 04 78 c4 00 	movl   $0xc478,0x4(%esp)
    256e:	00 
    256f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2576:	e8 58 36 00 00       	call   5bd3 <printf>
	if(currentlyRenaming->st.type != T_DIR){
    257b:	a1 cc 0f 01 00       	mov    0x10fcc,%eax
    2580:	0f b7 00             	movzwl (%eax),%eax
    2583:	66 83 f8 01          	cmp    $0x1,%ax
    2587:	74 7c                	je     2605 <saveRename+0x108>
		for(i = 0; i < strlen(tempName); i++){
    2589:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2590:	eb 42                	jmp    25d4 <saveRename+0xd7>
			if(tempName[i] == '.'){
    2592:	8d 95 f4 fe ff ff    	lea    -0x10c(%ebp),%edx
    2598:	8b 45 f4             	mov    -0xc(%ebp),%eax
    259b:	01 d0                	add    %edx,%eax
    259d:	0f b6 00             	movzbl (%eax),%eax
    25a0:	3c 2e                	cmp    $0x2e,%al
    25a2:	75 2c                	jne    25d0 <saveRename+0xd3>
				if(pasteJustFile(tempNameFrom, tempName)){
    25a4:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
    25aa:	89 44 24 04          	mov    %eax,0x4(%esp)
    25ae:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    25b4:	89 04 24             	mov    %eax,(%esp)
    25b7:	e8 5c 03 00 00       	call   2918 <pasteJustFile>
    25bc:	85 c0                	test   %eax,%eax
    25be:	74 10                	je     25d0 <saveRename+0xd3>
					deleteFile(tempNameFrom);
    25c0:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    25c6:	89 04 24             	mov    %eax,(%esp)
    25c9:	e8 d8 fb ff ff       	call   21a6 <deleteFile>
    25ce:	eb 7d                	jmp    264d <saveRename+0x150>
	strcpy(tempNameFrom, currentPath);
	strcpy(tempName, currentlyRenaming->name);
	strcpy(tempNameFrom + strlen(tempNameFrom), renameFrom);
	printf(0, "why? %s", tempName);
	if(currentlyRenaming->st.type != T_DIR){
		for(i = 0; i < strlen(tempName); i++){
    25d0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    25d4:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    25d7:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
    25dd:	89 04 24             	mov    %eax,(%esp)
    25e0:	e8 32 32 00 00       	call   5817 <strlen>
    25e5:	39 c3                	cmp    %eax,%ebx
    25e7:	72 a9                	jb     2592 <saveRename+0x95>
					deleteFile(tempNameFrom);
					return;
				}
			}
		}
		tempName[i] = '.';
    25e9:	8d 95 f4 fe ff ff    	lea    -0x10c(%ebp),%edx
    25ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25f2:	01 d0                	add    %edx,%eax
    25f4:	c6 00 2e             	movb   $0x2e,(%eax)
		tempName[i + 1] = 0;
    25f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25fa:	83 c0 01             	add    $0x1,%eax
    25fd:	c6 84 05 f4 fe ff ff 	movb   $0x0,-0x10c(%ebp,%eax,1)
    2604:	00 
	}
	printf(0, "renameFrom is %s\n", tempNameFrom);
    2605:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    260b:	89 44 24 08          	mov    %eax,0x8(%esp)
    260f:	c7 44 24 04 80 c4 00 	movl   $0xc480,0x4(%esp)
    2616:	00 
    2617:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    261e:	e8 b0 35 00 00       	call   5bd3 <printf>
	if(pasteJustFile(tempNameFrom, tempName))
    2623:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
    2629:	89 44 24 04          	mov    %eax,0x4(%esp)
    262d:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    2633:	89 04 24             	mov    %eax,(%esp)
    2636:	e8 dd 02 00 00       	call   2918 <pasteJustFile>
    263b:	85 c0                	test   %eax,%eax
    263d:	74 0e                	je     264d <saveRename+0x150>
		deleteFile(tempNameFrom);
    263f:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    2645:	89 04 24             	mov    %eax,(%esp)
    2648:	e8 59 fb ff ff       	call   21a6 <deleteFile>
}
    264d:	81 c4 24 02 00 00    	add    $0x224,%esp
    2653:	5b                   	pop    %ebx
    2654:	5d                   	pop    %ebp
    2655:	c3                   	ret    

00002656 <unrename>:

void unrename(){
    2656:	55                   	push   %ebp
    2657:	89 e5                	mov    %esp,%ebp
    2659:	83 ec 38             	sub    $0x38,%esp
	printf(0, "renaming! currentlyRenaming: %s\n", currentlyRenaming->name);
    265c:	a1 cc 0f 01 00       	mov    0x10fcc,%eax
    2661:	8b 40 14             	mov    0x14(%eax),%eax
    2664:	89 44 24 08          	mov    %eax,0x8(%esp)
    2668:	c7 44 24 04 94 c4 00 	movl   $0xc494,0x4(%esp)
    266f:	00 
    2670:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2677:	e8 57 35 00 00       	call   5bd3 <printf>
	saveRename();
    267c:	e8 7c fe ff ff       	call   24fd <saveRename>
	currentlyRenaming->chosen = 1;
    2681:	a1 cc 0f 01 00       	mov    0x10fcc,%eax
    2686:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	currentlyRenaming = 0;
    268d:	c7 05 cc 0f 01 00 00 	movl   $0x0,0x10fcc
    2694:	00 00 00 
	renaming = 0;
    2697:	c7 05 54 48 01 00 00 	movl   $0x0,0x14854
    269e:	00 00 00 
	freeFileItemList();
    26a1:	e8 6f dd ff ff       	call   415 <freeFileItemList>
	list(".");
    26a6:	c7 04 24 88 c2 00 00 	movl   $0xc288,(%esp)
    26ad:	e8 41 de ff ff       	call   4f3 <list>
	printItemList();
    26b2:	e8 41 ec ff ff       	call   12f8 <printItemList>
	drawFinderContent(context);
    26b7:	a1 00 47 01 00       	mov    0x14700,%eax
    26bc:	89 04 24             	mov    %eax,(%esp)
    26bf:	a1 04 47 01 00       	mov    0x14704,%eax
    26c4:	89 44 24 04          	mov    %eax,0x4(%esp)
    26c8:	a1 08 47 01 00       	mov    0x14708,%eax
    26cd:	89 44 24 08          	mov    %eax,0x8(%esp)
    26d1:	e8 c1 e8 ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    26d6:	a1 00 47 01 00       	mov    0x14700,%eax
    26db:	89 04 24             	mov    %eax,(%esp)
    26de:	a1 04 47 01 00       	mov    0x14704,%eax
    26e3:	89 44 24 04          	mov    %eax,0x4(%esp)
    26e7:	a1 08 47 01 00       	mov    0x14708,%eax
    26ec:	89 44 24 08          	mov    %eax,0x8(%esp)
    26f0:	e8 54 e5 ff ff       	call   c49 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    26f5:	8d 45 e8             	lea    -0x18(%ebp),%eax
    26f8:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    26ff:	00 
    2700:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2707:	00 
    2708:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    270f:	00 
    2710:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2717:	00 
    2718:	89 04 24             	mov    %eax,(%esp)
    271b:	e8 74 29 00 00       	call   5094 <initRect>
    2720:	83 ec 04             	sub    $0x4,%esp
    2723:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2726:	89 44 24 04          	mov    %eax,0x4(%esp)
    272a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    272d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2731:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2734:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2738:	8b 45 f4             	mov    -0xc(%ebp),%eax
    273b:	89 44 24 10          	mov    %eax,0x10(%esp)
    273f:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    2746:	e8 4c 2b 00 00       	call   5297 <deleteClickable>
	addWndEvent(&cm);
    274b:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    2752:	e8 3f ee ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    2757:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    275e:	e8 ab ed ff ff       	call   150e <addListEvent>
}
    2763:	c9                   	leave  
    2764:	c3                   	ret    

00002765 <copyFile>:

void copyFile(){
    2765:	55                   	push   %ebp
    2766:	89 e5                	mov    %esp,%ebp
    2768:	56                   	push   %esi
    2769:	53                   	push   %ebx
    276a:	83 ec 20             	sub    $0x20,%esp
	int fd;
	struct fileItem *p = fileItemList;
    276d:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
    2772:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0){
    2775:	e9 0f 01 00 00       	jmp    2889 <copyFile+0x124>
		if (p->chosen == 1){
    277a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    277d:	8b 40 28             	mov    0x28(%eax),%eax
    2780:	83 f8 01             	cmp    $0x1,%eax
    2783:	0f 85 f7 00 00 00    	jne    2880 <copyFile+0x11b>
			if(lenOfWaited >= MAX_COPY_SIZE){
    2789:	a1 58 48 01 00       	mov    0x14858,%eax
    278e:	83 f8 07             	cmp    $0x7,%eax
    2791:	7e 22                	jle    27b5 <copyFile+0x50>
				printf(0, "Too Much Files To Copy %d\n", lenOfWaited);
    2793:	a1 58 48 01 00       	mov    0x14858,%eax
    2798:	89 44 24 08          	mov    %eax,0x8(%esp)
    279c:	c7 44 24 04 b5 c4 00 	movl   $0xc4b5,0x4(%esp)
    27a3:	00 
    27a4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    27ab:	e8 23 34 00 00       	call   5bd3 <printf>
    27b0:	e9 cb 00 00 00       	jmp    2880 <copyFile+0x11b>
			}
			else{
				if((fd = open(p->name, O_RDONLY)) >= 0){
    27b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27b8:	8b 40 14             	mov    0x14(%eax),%eax
    27bb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    27c2:	00 
    27c3:	89 04 24             	mov    %eax,(%esp)
    27c6:	e8 60 32 00 00       	call   5a2b <open>
    27cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    27ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    27d2:	0f 88 8a 00 00 00    	js     2862 <copyFile+0xfd>
					strcpy(filesWaited[lenOfWaited], currentPath);
    27d8:	a1 58 48 01 00       	mov    0x14858,%eax
    27dd:	c1 e0 08             	shl    $0x8,%eax
    27e0:	05 00 3e 01 00       	add    $0x13e00,%eax
    27e5:	c7 44 24 04 40 47 01 	movl   $0x14740,0x4(%esp)
    27ec:	00 
    27ed:	89 04 24             	mov    %eax,(%esp)
    27f0:	e8 b3 2f 00 00       	call   57a8 <strcpy>
					strcpy(filesWaited[lenOfWaited] + strlen(currentPath), p->name);
    27f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27f8:	8b 58 14             	mov    0x14(%eax),%ebx
    27fb:	a1 58 48 01 00       	mov    0x14858,%eax
    2800:	c1 e0 08             	shl    $0x8,%eax
    2803:	8d b0 00 3e 01 00    	lea    0x13e00(%eax),%esi
    2809:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    2810:	e8 02 30 00 00       	call   5817 <strlen>
    2815:	01 f0                	add    %esi,%eax
    2817:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    281b:	89 04 24             	mov    %eax,(%esp)
    281e:	e8 85 2f 00 00       	call   57a8 <strcpy>
					printf(0, "Open File %s Succeed\n", filesWaited[lenOfWaited]);
    2823:	a1 58 48 01 00       	mov    0x14858,%eax
    2828:	c1 e0 08             	shl    $0x8,%eax
    282b:	05 00 3e 01 00       	add    $0x13e00,%eax
    2830:	89 44 24 08          	mov    %eax,0x8(%esp)
    2834:	c7 44 24 04 d0 c4 00 	movl   $0xc4d0,0x4(%esp)
    283b:	00 
    283c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2843:	e8 8b 33 00 00       	call   5bd3 <printf>
					lenOfWaited++;
    2848:	a1 58 48 01 00       	mov    0x14858,%eax
    284d:	83 c0 01             	add    $0x1,%eax
    2850:	a3 58 48 01 00       	mov    %eax,0x14858
					close(fd);
    2855:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2858:	89 04 24             	mov    %eax,(%esp)
    285b:	e8 b3 31 00 00       	call   5a13 <close>
    2860:	eb 1e                	jmp    2880 <copyFile+0x11b>
				}
				else{
					printf(0, "Open File %s Failed\n", p->name);
    2862:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2865:	8b 40 14             	mov    0x14(%eax),%eax
    2868:	89 44 24 08          	mov    %eax,0x8(%esp)
    286c:	c7 44 24 04 e6 c4 00 	movl   $0xc4e6,0x4(%esp)
    2873:	00 
    2874:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    287b:	e8 53 33 00 00       	call   5bd3 <printf>
				}
			}
		}
		p = p->next;
    2880:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2883:	8b 40 2c             	mov    0x2c(%eax),%eax
    2886:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void copyFile(){
	int fd;
	struct fileItem *p = fileItemList;
	while(p != 0){
    2889:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    288d:	0f 85 e7 fe ff ff    	jne    277a <copyFile+0x15>
				}
			}
		}
		p = p->next;
	}
}
    2893:	83 c4 20             	add    $0x20,%esp
    2896:	5b                   	pop    %ebx
    2897:	5e                   	pop    %esi
    2898:	5d                   	pop    %ebp
    2899:	c3                   	ret    

0000289a <h_copyFile>:

void h_copyFile(Point p){
    289a:	55                   	push   %ebp
    289b:	89 e5                	mov    %esp,%ebp
    289d:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 0;
    28a0:	c7 05 c4 0f 01 00 00 	movl   $0x0,0x10fc4
    28a7:	00 00 00 
	lenOfWaited = 0;
    28aa:	c7 05 58 48 01 00 00 	movl   $0x0,0x14858
    28b1:	00 00 00 
	copyFile();
    28b4:	e8 ac fe ff ff       	call   2765 <copyFile>
}
    28b9:	c9                   	leave  
    28ba:	c3                   	ret    

000028bb <moveFile>:

void moveFile(){
    28bb:	55                   	push   %ebp
    28bc:	89 e5                	mov    %esp,%ebp
    28be:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < lenOfWaited; i++)
    28c1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    28c8:	eb 17                	jmp    28e1 <moveFile+0x26>
		deleteFile(filesWaited[i]);
    28ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28cd:	c1 e0 08             	shl    $0x8,%eax
    28d0:	05 00 3e 01 00       	add    $0x13e00,%eax
    28d5:	89 04 24             	mov    %eax,(%esp)
    28d8:	e8 c9 f8 ff ff       	call   21a6 <deleteFile>
	copyFile();
}

void moveFile(){
	int i;
	for (i = 0; i < lenOfWaited; i++)
    28dd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    28e1:	a1 58 48 01 00       	mov    0x14858,%eax
    28e6:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    28e9:	7c df                	jl     28ca <moveFile+0xf>
		deleteFile(filesWaited[i]);
	lenOfWaited = 0;
    28eb:	c7 05 58 48 01 00 00 	movl   $0x0,0x14858
    28f2:	00 00 00 
}
    28f5:	c9                   	leave  
    28f6:	c3                   	ret    

000028f7 <h_cutFile>:

void h_cutFile(Point p){
    28f7:	55                   	push   %ebp
    28f8:	89 e5                	mov    %esp,%ebp
    28fa:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 1;
    28fd:	c7 05 c4 0f 01 00 01 	movl   $0x1,0x10fc4
    2904:	00 00 00 
	lenOfWaited = 0;
    2907:	c7 05 58 48 01 00 00 	movl   $0x0,0x14858
    290e:	00 00 00 
	copyFile();
    2911:	e8 4f fe ff ff       	call   2765 <copyFile>
}
    2916:	c9                   	leave  
    2917:	c3                   	ret    

00002918 <pasteJustFile>:

int pasteJustFile(char *src, char *filename){
    2918:	55                   	push   %ebp
    2919:	89 e5                	mov    %esp,%ebp
    291b:	81 ec 48 02 00 00    	sub    $0x248,%esp
	printf(0, "currentPath: %s, copying from %s, to %s~\n", currentPath, src, filename);
    2921:	8b 45 0c             	mov    0xc(%ebp),%eax
    2924:	89 44 24 10          	mov    %eax,0x10(%esp)
    2928:	8b 45 08             	mov    0x8(%ebp),%eax
    292b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    292f:	c7 44 24 08 40 47 01 	movl   $0x14740,0x8(%esp)
    2936:	00 
    2937:	c7 44 24 04 fc c4 00 	movl   $0xc4fc,0x4(%esp)
    293e:	00 
    293f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2946:	e8 88 32 00 00       	call   5bd3 <printf>
	int size = 0;
    294b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	int file_src, file_dest;
	struct fileItem *p;
	struct fileItem *p1, *head, *p2;
	char* buff = (char*)malloc(4096 * sizeof(char));
    2952:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2959:	e8 61 35 00 00       	call   5ebf <malloc>
    295e:	89 45 d8             	mov    %eax,-0x28(%ebp)
	char tempSrc[MAX_NAME_LEN];
	char tempName[MAX_NAME_LEN];
	memset(tempName, '\0', sizeof(tempName)/sizeof(char));
    2961:	c7 44 24 08 00 01 00 	movl   $0x100,0x8(%esp)
    2968:	00 
    2969:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2970:	00 
    2971:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
    2977:	89 04 24             	mov    %eax,(%esp)
    297a:	e8 bf 2e 00 00       	call   583e <memset>
	memset(tempSrc, '\0', sizeof(tempSrc)/sizeof(char));
    297f:	c7 44 24 08 00 01 00 	movl   $0x100,0x8(%esp)
    2986:	00 
    2987:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    298e:	00 
    298f:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    2995:	89 04 24             	mov    %eax,(%esp)
    2998:	e8 a1 2e 00 00       	call   583e <memset>
	memset(buff, 0, 4096);
    299d:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
    29a4:	00 
    29a5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    29ac:	00 
    29ad:	8b 45 d8             	mov    -0x28(%ebp),%eax
    29b0:	89 04 24             	mov    %eax,(%esp)
    29b3:	e8 86 2e 00 00       	call   583e <memset>
	if(chdir(filename) >= 0){
    29b8:	8b 45 0c             	mov    0xc(%ebp),%eax
    29bb:	89 04 24             	mov    %eax,(%esp)
    29be:	e8 98 30 00 00       	call   5a5b <chdir>
    29c3:	85 c0                	test   %eax,%eax
    29c5:	78 3c                	js     2a03 <pasteJustFile+0xeb>
		printf(0, "Directory %s already exist\n", filename);
    29c7:	8b 45 0c             	mov    0xc(%ebp),%eax
    29ca:	89 44 24 08          	mov    %eax,0x8(%esp)
    29ce:	c7 44 24 04 26 c5 00 	movl   $0xc526,0x4(%esp)
    29d5:	00 
    29d6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    29dd:	e8 f1 31 00 00       	call   5bd3 <printf>
		free(buff);
    29e2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    29e5:	89 04 24             	mov    %eax,(%esp)
    29e8:	e8 99 33 00 00       	call   5d86 <free>
		chdir("..");
    29ed:	c7 04 24 cf c3 00 00 	movl   $0xc3cf,(%esp)
    29f4:	e8 62 30 00 00       	call   5a5b <chdir>
		return 0;
    29f9:	b8 00 00 00 00       	mov    $0x0,%eax
    29fe:	e9 c9 03 00 00       	jmp    2dcc <pasteJustFile+0x4b4>
	}
	else if(chdir(src) >= 0){
    2a03:	8b 45 08             	mov    0x8(%ebp),%eax
    2a06:	89 04 24             	mov    %eax,(%esp)
    2a09:	e8 4d 30 00 00       	call   5a5b <chdir>
    2a0e:	85 c0                	test   %eax,%eax
    2a10:	0f 88 67 02 00 00    	js     2c7d <pasteJustFile+0x365>
		freeFileItemList();
    2a16:	e8 fa d9 ff ff       	call   415 <freeFileItemList>
		list(".");
    2a1b:	c7 04 24 88 c2 00 00 	movl   $0xc288,(%esp)
    2a22:	e8 cc da ff ff       	call   4f3 <list>
		chdir(currentPath);
    2a27:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    2a2e:	e8 28 30 00 00       	call   5a5b <chdir>
		mkdir(filename);
    2a33:	8b 45 0c             	mov    0xc(%ebp),%eax
    2a36:	89 04 24             	mov    %eax,(%esp)
    2a39:	e8 15 30 00 00       	call   5a53 <mkdir>
		updatePath(filename);
    2a3e:	8b 45 0c             	mov    0xc(%ebp),%eax
    2a41:	89 04 24             	mov    %eax,(%esp)
    2a44:	e8 4b f1 ff ff       	call   1b94 <updatePath>
		chdir(currentPath);
    2a49:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    2a50:	e8 06 30 00 00       	call   5a5b <chdir>
        head = p1 = p2 = 0;
    2a55:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    2a5c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2a5f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2a62:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2a65:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        p = fileItemList;
    2a68:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
    2a6d:	89 45 ec             	mov    %eax,-0x14(%ebp)
	    printf(0, "hello1\n");
    2a70:	c7 44 24 04 42 c5 00 	movl   $0xc542,0x4(%esp)
    2a77:	00 
    2a78:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2a7f:	e8 4f 31 00 00       	call   5bd3 <printf>
		while (p != 0)
    2a84:	e9 83 00 00 00       	jmp    2b0c <pasteJustFile+0x1f4>
		{
			printf(0, "hello2\n");
    2a89:	c7 44 24 04 4a c5 00 	movl   $0xc54a,0x4(%esp)
    2a90:	00 
    2a91:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2a98:	e8 36 31 00 00       	call   5bd3 <printf>
			p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
    2a9d:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
    2aa4:	e8 16 34 00 00       	call   5ebf <malloc>
    2aa9:	89 45 e8             	mov    %eax,-0x18(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    2aac:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    2ab3:	e8 07 34 00 00       	call   5ebf <malloc>
    2ab8:	8b 55 e8             	mov    -0x18(%ebp),%edx
    2abb:	89 42 14             	mov    %eax,0x14(%edx)
			strcpy(p1->name, p->name);
    2abe:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ac1:	8b 50 14             	mov    0x14(%eax),%edx
    2ac4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ac7:	8b 40 14             	mov    0x14(%eax),%eax
    2aca:	89 54 24 04          	mov    %edx,0x4(%esp)
    2ace:	89 04 24             	mov    %eax,(%esp)
    2ad1:	e8 d2 2c 00 00       	call   57a8 <strcpy>
			if(head == 0)
    2ad6:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2ada:	75 0e                	jne    2aea <pasteJustFile+0x1d2>
			{
				head = p1;
    2adc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2adf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
				p2 = p1;
    2ae2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ae5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2ae8:	eb 0f                	jmp    2af9 <pasteJustFile+0x1e1>
			} else {
				p2->next = p1;
    2aea:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2aed:	8b 55 e8             	mov    -0x18(%ebp),%edx
    2af0:	89 50 2c             	mov    %edx,0x2c(%eax)
				p2 = p1;
    2af3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2af6:	89 45 e0             	mov    %eax,-0x20(%ebp)
			}
			p1->next = 0;
    2af9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2afc:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
			p = p->next;
    2b03:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b06:	8b 40 2c             	mov    0x2c(%eax),%eax
    2b09:	89 45 ec             	mov    %eax,-0x14(%ebp)
		updatePath(filename);
		chdir(currentPath);
        head = p1 = p2 = 0;
        p = fileItemList;
	    printf(0, "hello1\n");
		while (p != 0)
    2b0c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2b10:	0f 85 73 ff ff ff    	jne    2a89 <pasteJustFile+0x171>
				p2 = p1;
			}
			p1->next = 0;
			p = p->next;
		}
		p1 = head;
    2b16:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b19:	89 45 e8             	mov    %eax,-0x18(%ebp)
		while(p1 != 0){
    2b1c:	e9 e1 00 00 00       	jmp    2c02 <pasteJustFile+0x2ea>
			strcpy(tempSrc, src);
    2b21:	8b 45 08             	mov    0x8(%ebp),%eax
    2b24:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b28:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    2b2e:	89 04 24             	mov    %eax,(%esp)
    2b31:	e8 72 2c 00 00       	call   57a8 <strcpy>
			strcpy(tempName, p1->name);
    2b36:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2b39:	8b 40 14             	mov    0x14(%eax),%eax
    2b3c:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b40:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
    2b46:	89 04 24             	mov    %eax,(%esp)
    2b49:	e8 5a 2c 00 00       	call   57a8 <strcpy>
			tempSrc[strlen(tempSrc) + 1] = 0;
    2b4e:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    2b54:	89 04 24             	mov    %eax,(%esp)
    2b57:	e8 bb 2c 00 00       	call   5817 <strlen>
    2b5c:	83 c0 01             	add    $0x1,%eax
    2b5f:	c6 84 05 d8 fe ff ff 	movb   $0x0,-0x128(%ebp,%eax,1)
    2b66:	00 
			tempSrc[strlen(tempSrc)] = '/';
    2b67:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    2b6d:	89 04 24             	mov    %eax,(%esp)
    2b70:	e8 a2 2c 00 00       	call   5817 <strlen>
    2b75:	c6 84 05 d8 fe ff ff 	movb   $0x2f,-0x128(%ebp,%eax,1)
    2b7c:	2f 
			strcpy(tempSrc+strlen(tempSrc), tempName);
    2b7d:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    2b83:	89 04 24             	mov    %eax,(%esp)
    2b86:	e8 8c 2c 00 00       	call   5817 <strlen>
    2b8b:	8d 95 d8 fe ff ff    	lea    -0x128(%ebp),%edx
    2b91:	01 c2                	add    %eax,%edx
    2b93:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
    2b99:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b9d:	89 14 24             	mov    %edx,(%esp)
    2ba0:	e8 03 2c 00 00       	call   57a8 <strcpy>
			pasteJustFile(tempSrc, tempName);
    2ba5:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
    2bab:	89 44 24 04          	mov    %eax,0x4(%esp)
    2baf:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    2bb5:	89 04 24             	mov    %eax,(%esp)
    2bb8:	e8 5b fd ff ff       	call   2918 <pasteJustFile>
			memset(tempName, '\0', sizeof(tempName)/sizeof(char));
    2bbd:	c7 44 24 08 00 01 00 	movl   $0x100,0x8(%esp)
    2bc4:	00 
    2bc5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2bcc:	00 
    2bcd:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
    2bd3:	89 04 24             	mov    %eax,(%esp)
    2bd6:	e8 63 2c 00 00       	call   583e <memset>
			memset(tempSrc, '\0', sizeof(tempSrc)/sizeof(char));
    2bdb:	c7 44 24 08 00 01 00 	movl   $0x100,0x8(%esp)
    2be2:	00 
    2be3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2bea:	00 
    2beb:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    2bf1:	89 04 24             	mov    %eax,(%esp)
    2bf4:	e8 45 2c 00 00       	call   583e <memset>
			p1 = p1->next;
    2bf9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2bfc:	8b 40 2c             	mov    0x2c(%eax),%eax
    2bff:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}
			p1->next = 0;
			p = p->next;
		}
		p1 = head;
		while(p1 != 0){
    2c02:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2c06:	0f 85 15 ff ff ff    	jne    2b21 <pasteJustFile+0x209>
			pasteJustFile(tempSrc, tempName);
			memset(tempName, '\0', sizeof(tempName)/sizeof(char));
			memset(tempSrc, '\0', sizeof(tempSrc)/sizeof(char));
			p1 = p1->next;
		}
		chdir("..");
    2c0c:	c7 04 24 cf c3 00 00 	movl   $0xc3cf,(%esp)
    2c13:	e8 43 2e 00 00       	call   5a5b <chdir>
		updatePath("..");
    2c18:	c7 04 24 cf c3 00 00 	movl   $0xc3cf,(%esp)
    2c1f:	e8 70 ef ff ff       	call   1b94 <updatePath>
		p1 = head;
    2c24:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2c27:	89 45 e8             	mov    %eax,-0x18(%ebp)
		while (p1 != 0) {
    2c2a:	eb 46                	jmp    2c72 <pasteJustFile+0x35a>
			p2 = p1;
    2c2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2c2f:	89 45 e0             	mov    %eax,-0x20(%ebp)
			printf(0, "freeing %s\n", p2->name);
    2c32:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2c35:	8b 40 14             	mov    0x14(%eax),%eax
    2c38:	89 44 24 08          	mov    %eax,0x8(%esp)
    2c3c:	c7 44 24 04 5a c4 00 	movl   $0xc45a,0x4(%esp)
    2c43:	00 
    2c44:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c4b:	e8 83 2f 00 00       	call   5bd3 <printf>
			p1 = p1->next;
    2c50:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2c53:	8b 40 2c             	mov    0x2c(%eax),%eax
    2c56:	89 45 e8             	mov    %eax,-0x18(%ebp)
			free(p2->name);
    2c59:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2c5c:	8b 40 14             	mov    0x14(%eax),%eax
    2c5f:	89 04 24             	mov    %eax,(%esp)
    2c62:	e8 1f 31 00 00       	call   5d86 <free>
			free(p2);
    2c67:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2c6a:	89 04 24             	mov    %eax,(%esp)
    2c6d:	e8 14 31 00 00       	call   5d86 <free>
			p1 = p1->next;
		}
		chdir("..");
		updatePath("..");
		p1 = head;
		while (p1 != 0) {
    2c72:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2c76:	75 b4                	jne    2c2c <pasteJustFile+0x314>
    2c78:	e9 15 01 00 00       	jmp    2d92 <pasteJustFile+0x47a>
			free(p2->name);
			free(p2);
		}
	}
	else{
		file_src = open(src, O_RDONLY);
    2c7d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2c84:	00 
    2c85:	8b 45 08             	mov    0x8(%ebp),%eax
    2c88:	89 04 24             	mov    %eax,(%esp)
    2c8b:	e8 9b 2d 00 00       	call   5a2b <open>
    2c90:	89 45 f4             	mov    %eax,-0xc(%ebp)
		if((file_dest = open(filename, O_RDONLY)) >= 0){
    2c93:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2c9a:	00 
    2c9b:	8b 45 0c             	mov    0xc(%ebp),%eax
    2c9e:	89 04 24             	mov    %eax,(%esp)
    2ca1:	e8 85 2d 00 00       	call   5a2b <open>
    2ca6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2ca9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2cad:	78 46                	js     2cf5 <pasteJustFile+0x3dd>
			printf(0, "File %s already exist\n", filename);
    2caf:	8b 45 0c             	mov    0xc(%ebp),%eax
    2cb2:	89 44 24 08          	mov    %eax,0x8(%esp)
    2cb6:	c7 44 24 04 52 c5 00 	movl   $0xc552,0x4(%esp)
    2cbd:	00 
    2cbe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2cc5:	e8 09 2f 00 00       	call   5bd3 <printf>
			close(file_dest);
    2cca:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2ccd:	89 04 24             	mov    %eax,(%esp)
    2cd0:	e8 3e 2d 00 00       	call   5a13 <close>
			close(file_src);
    2cd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2cd8:	89 04 24             	mov    %eax,(%esp)
    2cdb:	e8 33 2d 00 00       	call   5a13 <close>
			free(buff);
    2ce0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2ce3:	89 04 24             	mov    %eax,(%esp)
    2ce6:	e8 9b 30 00 00       	call   5d86 <free>
			return 0;
    2ceb:	b8 00 00 00 00       	mov    $0x0,%eax
    2cf0:	e9 d7 00 00 00       	jmp    2dcc <pasteJustFile+0x4b4>
		}
		else{
			file_dest = open(filename, O_CREATE);
    2cf5:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2cfc:	00 
    2cfd:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d00:	89 04 24             	mov    %eax,(%esp)
    2d03:	e8 23 2d 00 00       	call   5a2b <open>
    2d08:	89 45 f0             	mov    %eax,-0x10(%ebp)
			while((size = read(file_src, buff, 4096)) > 0)
    2d0b:	eb 19                	jmp    2d26 <pasteJustFile+0x40e>
				write(file_dest, buff, size);
    2d0d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2d10:	89 44 24 08          	mov    %eax,0x8(%esp)
    2d14:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2d17:	89 44 24 04          	mov    %eax,0x4(%esp)
    2d1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d1e:	89 04 24             	mov    %eax,(%esp)
    2d21:	e8 e5 2c 00 00       	call   5a0b <write>
			free(buff);
			return 0;
		}
		else{
			file_dest = open(filename, O_CREATE);
			while((size = read(file_src, buff, 4096)) > 0)
    2d26:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
    2d2d:	00 
    2d2e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2d31:	89 44 24 04          	mov    %eax,0x4(%esp)
    2d35:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d38:	89 04 24             	mov    %eax,(%esp)
    2d3b:	e8 c3 2c 00 00       	call   5a03 <read>
    2d40:	89 45 dc             	mov    %eax,-0x24(%ebp)
    2d43:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    2d47:	7f c4                	jg     2d0d <pasteJustFile+0x3f5>
				write(file_dest, buff, size);
			if(size < 0)
    2d49:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    2d4d:	79 43                	jns    2d92 <pasteJustFile+0x47a>
			{
				//printf(2, "copy file error!!!\r\n");
				printf(0, "File %s error\n", filename);
    2d4f:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d52:	89 44 24 08          	mov    %eax,0x8(%esp)
    2d56:	c7 44 24 04 69 c5 00 	movl   $0xc569,0x4(%esp)
    2d5d:	00 
    2d5e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d65:	e8 69 2e 00 00       	call   5bd3 <printf>
				close(file_dest);
    2d6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d6d:	89 04 24             	mov    %eax,(%esp)
    2d70:	e8 9e 2c 00 00       	call   5a13 <close>
				close(file_src);
    2d75:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d78:	89 04 24             	mov    %eax,(%esp)
    2d7b:	e8 93 2c 00 00       	call   5a13 <close>
				free(buff);
    2d80:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2d83:	89 04 24             	mov    %eax,(%esp)
    2d86:	e8 fb 2f 00 00       	call   5d86 <free>
				return 0;
    2d8b:	b8 00 00 00 00       	mov    $0x0,%eax
    2d90:	eb 3a                	jmp    2dcc <pasteJustFile+0x4b4>
			}
		}
	}
	close(file_dest);
    2d92:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d95:	89 04 24             	mov    %eax,(%esp)
    2d98:	e8 76 2c 00 00       	call   5a13 <close>
	close(file_src);
    2d9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2da0:	89 04 24             	mov    %eax,(%esp)
    2da3:	e8 6b 2c 00 00       	call   5a13 <close>
	free(buff);
    2da8:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2dab:	89 04 24             	mov    %eax,(%esp)
    2dae:	e8 d3 2f 00 00       	call   5d86 <free>
	printf(0,"copy end\n");
    2db3:	c7 44 24 04 78 c5 00 	movl   $0xc578,0x4(%esp)
    2dba:	00 
    2dbb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2dc2:	e8 0c 2e 00 00       	call   5bd3 <printf>
	return 1;
    2dc7:	b8 01 00 00 00       	mov    $0x1,%eax
}
    2dcc:	c9                   	leave  
    2dcd:	c3                   	ret    

00002dce <pasteFile>:

void pasteFile(){
    2dce:	55                   	push   %ebp
    2dcf:	89 e5                	mov    %esp,%ebp
    2dd1:	83 ec 28             	sub    $0x28,%esp
	int i,j;
	char *filename;
	for(i = 0; i < lenOfWaited; i++){
    2dd4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2ddb:	e9 c1 00 00 00       	jmp    2ea1 <pasteFile+0xd3>
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
    2de0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2de3:	c1 e0 08             	shl    $0x8,%eax
    2de6:	05 00 3e 01 00       	add    $0x13e00,%eax
    2deb:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2def:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2df2:	89 44 24 08          	mov    %eax,0x8(%esp)
    2df6:	c7 44 24 04 82 c5 00 	movl   $0xc582,0x4(%esp)
    2dfd:	00 
    2dfe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e05:	e8 c9 2d 00 00       	call   5bd3 <printf>
		for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    2e0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e0d:	c1 e0 08             	shl    $0x8,%eax
    2e10:	05 00 3e 01 00       	add    $0x13e00,%eax
    2e15:	89 04 24             	mov    %eax,(%esp)
    2e18:	e8 fa 29 00 00       	call   5817 <strlen>
    2e1d:	83 e8 01             	sub    $0x1,%eax
    2e20:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2e23:	eb 35                	jmp    2e5a <pasteFile+0x8c>
			if (*(filesWaited[i]+j) == '/'){
    2e25:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e28:	c1 e0 08             	shl    $0x8,%eax
    2e2b:	8d 90 00 3e 01 00    	lea    0x13e00(%eax),%edx
    2e31:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e34:	01 d0                	add    %edx,%eax
    2e36:	0f b6 00             	movzbl (%eax),%eax
    2e39:	3c 2f                	cmp    $0x2f,%al
    2e3b:	75 19                	jne    2e56 <pasteFile+0x88>
				filename = filesWaited[i] + j + 1;
    2e3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e40:	c1 e0 08             	shl    $0x8,%eax
    2e43:	8d 90 00 3e 01 00    	lea    0x13e00(%eax),%edx
    2e49:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e4c:	83 c0 01             	add    $0x1,%eax
    2e4f:	01 d0                	add    %edx,%eax
    2e51:	89 45 ec             	mov    %eax,-0x14(%ebp)
				break;
    2e54:	eb 0a                	jmp    2e60 <pasteFile+0x92>
void pasteFile(){
	int i,j;
	char *filename;
	for(i = 0; i < lenOfWaited; i++){
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
		for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    2e56:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    2e5a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2e5e:	79 c5                	jns    2e25 <pasteFile+0x57>
			if (*(filesWaited[i]+j) == '/'){
				filename = filesWaited[i] + j + 1;
				break;
			}
		}
		printf(0, "NO.%d file %s name get\n", i, filename);
    2e60:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2e63:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2e67:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e6a:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e6e:	c7 44 24 04 9f c5 00 	movl   $0xc59f,0x4(%esp)
    2e75:	00 
    2e76:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e7d:	e8 51 2d 00 00       	call   5bd3 <printf>
		pasteJustFile(filesWaited[i], filename);
    2e82:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e85:	c1 e0 08             	shl    $0x8,%eax
    2e88:	8d 90 00 3e 01 00    	lea    0x13e00(%eax),%edx
    2e8e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2e91:	89 44 24 04          	mov    %eax,0x4(%esp)
    2e95:	89 14 24             	mov    %edx,(%esp)
    2e98:	e8 7b fa ff ff       	call   2918 <pasteJustFile>
}

void pasteFile(){
	int i,j;
	char *filename;
	for(i = 0; i < lenOfWaited; i++){
    2e9d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2ea1:	a1 58 48 01 00       	mov    0x14858,%eax
    2ea6:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    2ea9:	0f 8c 31 ff ff ff    	jl     2de0 <pasteFile+0x12>
			}
		}
		printf(0, "NO.%d file %s name get\n", i, filename);
		pasteJustFile(filesWaited[i], filename);
	}
}
    2eaf:	c9                   	leave  
    2eb0:	c3                   	ret    

00002eb1 <h_pasteFile>:

void h_pasteFile(Point p){
    2eb1:	55                   	push   %ebp
    2eb2:	89 e5                	mov    %esp,%ebp
    2eb4:	83 ec 38             	sub    $0x38,%esp
	pasteFile();
    2eb7:	e8 12 ff ff ff       	call   2dce <pasteFile>
	if(copyOrCut == 1)
    2ebc:	a1 c4 0f 01 00       	mov    0x10fc4,%eax
    2ec1:	83 f8 01             	cmp    $0x1,%eax
    2ec4:	75 05                	jne    2ecb <h_pasteFile+0x1a>
		moveFile();
    2ec6:	e8 f0 f9 ff ff       	call   28bb <moveFile>
    updateFileList(context);
    2ecb:	a1 00 47 01 00       	mov    0x14700,%eax
    2ed0:	89 04 24             	mov    %eax,(%esp)
    2ed3:	a1 04 47 01 00       	mov    0x14704,%eax
    2ed8:	89 44 24 04          	mov    %eax,0x4(%esp)
    2edc:	a1 08 47 01 00       	mov    0x14708,%eax
    2ee1:	89 44 24 08          	mov    %eax,0x8(%esp)
    2ee5:	e8 5e df ff ff       	call   e48 <updateFileList>
	drawFinderContent(context);
    2eea:	a1 00 47 01 00       	mov    0x14700,%eax
    2eef:	89 04 24             	mov    %eax,(%esp)
    2ef2:	a1 04 47 01 00       	mov    0x14704,%eax
    2ef7:	89 44 24 04          	mov    %eax,0x4(%esp)
    2efb:	a1 08 47 01 00       	mov    0x14708,%eax
    2f00:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f04:	e8 8e e0 ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    2f09:	a1 00 47 01 00       	mov    0x14700,%eax
    2f0e:	89 04 24             	mov    %eax,(%esp)
    2f11:	a1 04 47 01 00       	mov    0x14704,%eax
    2f16:	89 44 24 04          	mov    %eax,0x4(%esp)
    2f1a:	a1 08 47 01 00       	mov    0x14708,%eax
    2f1f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f23:	e8 21 dd ff ff       	call   c49 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2f28:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2f2b:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    2f32:	00 
    2f33:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2f3a:	00 
    2f3b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2f42:	00 
    2f43:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2f4a:	00 
    2f4b:	89 04 24             	mov    %eax,(%esp)
    2f4e:	e8 41 21 00 00       	call   5094 <initRect>
    2f53:	83 ec 04             	sub    $0x4,%esp
    2f56:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2f59:	89 44 24 04          	mov    %eax,0x4(%esp)
    2f5d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2f60:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f64:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f67:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2f6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f6e:	89 44 24 10          	mov    %eax,0x10(%esp)
    2f72:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    2f79:	e8 19 23 00 00       	call   5297 <deleteClickable>
	addWndEvent(&cm);
    2f7e:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    2f85:	e8 0c e6 ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    2f8a:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    2f91:	e8 78 e5 ff ff       	call   150e <addListEvent>
}
    2f96:	c9                   	leave  
    2f97:	c3                   	ret    

00002f98 <h_chooseFile>:

void h_chooseFile(Point p) {
    2f98:	55                   	push   %ebp
    2f99:	89 e5                	mov    %esp,%ebp
    2f9b:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = getFileItem(p);
    2f9e:	8b 45 08             	mov    0x8(%ebp),%eax
    2fa1:	8b 55 0c             	mov    0xc(%ebp),%edx
    2fa4:	89 04 24             	mov    %eax,(%esp)
    2fa7:	89 54 24 04          	mov    %edx,0x4(%esp)
    2fab:	e8 11 e7 ff ff       	call   16c1 <getFileItem>
    2fb0:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (temp->chosen != 0)
    2fb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2fb6:	8b 40 28             	mov    0x28(%eax),%eax
    2fb9:	85 c0                	test   %eax,%eax
    2fbb:	74 20                	je     2fdd <h_chooseFile+0x45>
	{
		printf(0, "unchooseFile!\n");
    2fbd:	c7 44 24 04 b7 c5 00 	movl   $0xc5b7,0x4(%esp)
    2fc4:	00 
    2fc5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fcc:	e8 02 2c 00 00       	call   5bd3 <printf>
		temp->chosen = 0;
    2fd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2fd4:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    2fdb:	eb 1e                	jmp    2ffb <h_chooseFile+0x63>
	}
	else
	{
		printf(0, "chooseFile!\n");
    2fdd:	c7 44 24 04 c6 c5 00 	movl   $0xc5c6,0x4(%esp)
    2fe4:	00 
    2fe5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fec:	e8 e2 2b 00 00       	call   5bd3 <printf>
		temp->chosen = 1;
    2ff1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ff4:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    2ffb:	a1 00 47 01 00       	mov    0x14700,%eax
    3000:	89 04 24             	mov    %eax,(%esp)
    3003:	a1 04 47 01 00       	mov    0x14704,%eax
    3008:	89 44 24 04          	mov    %eax,0x4(%esp)
    300c:	a1 08 47 01 00       	mov    0x14708,%eax
    3011:	89 44 24 08          	mov    %eax,0x8(%esp)
    3015:	e8 7d df ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    301a:	a1 00 47 01 00       	mov    0x14700,%eax
    301f:	89 04 24             	mov    %eax,(%esp)
    3022:	a1 04 47 01 00       	mov    0x14704,%eax
    3027:	89 44 24 04          	mov    %eax,0x4(%esp)
    302b:	a1 08 47 01 00       	mov    0x14708,%eax
    3030:	89 44 24 08          	mov    %eax,0x8(%esp)
    3034:	e8 10 dc ff ff       	call   c49 <drawFinderWnd>
}
    3039:	c9                   	leave  
    303a:	c3                   	ret    

0000303b <h_closeWnd>:

void h_closeWnd(Point p) {
    303b:	55                   	push   %ebp
    303c:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    303e:	c7 05 60 06 01 00 00 	movl   $0x0,0x10660
    3045:	00 00 00 
}
    3048:	5d                   	pop    %ebp
    3049:	c3                   	ret    

0000304a <h_chvm1>:

void h_chvm1(Point p) {
    304a:	55                   	push   %ebp
    304b:	89 e5                	mov    %esp,%ebp
    304d:	83 ec 38             	sub    $0x38,%esp
	style = ICON_STYLE;
    3050:	c7 05 64 06 01 00 01 	movl   $0x1,0x10664
    3057:	00 00 00 
	updateFileList(context);
    305a:	a1 00 47 01 00       	mov    0x14700,%eax
    305f:	89 04 24             	mov    %eax,(%esp)
    3062:	a1 04 47 01 00       	mov    0x14704,%eax
    3067:	89 44 24 04          	mov    %eax,0x4(%esp)
    306b:	a1 08 47 01 00       	mov    0x14708,%eax
    3070:	89 44 24 08          	mov    %eax,0x8(%esp)
    3074:	e8 cf dd ff ff       	call   e48 <updateFileList>
		drawFinderContent(context);
    3079:	a1 00 47 01 00       	mov    0x14700,%eax
    307e:	89 04 24             	mov    %eax,(%esp)
    3081:	a1 04 47 01 00       	mov    0x14704,%eax
    3086:	89 44 24 04          	mov    %eax,0x4(%esp)
    308a:	a1 08 47 01 00       	mov    0x14708,%eax
    308f:	89 44 24 08          	mov    %eax,0x8(%esp)
    3093:	e8 ff de ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    3098:	a1 00 47 01 00       	mov    0x14700,%eax
    309d:	89 04 24             	mov    %eax,(%esp)
    30a0:	a1 04 47 01 00       	mov    0x14704,%eax
    30a5:	89 44 24 04          	mov    %eax,0x4(%esp)
    30a9:	a1 08 47 01 00       	mov    0x14708,%eax
    30ae:	89 44 24 08          	mov    %eax,0x8(%esp)
    30b2:	e8 92 db ff ff       	call   c49 <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    30b7:	8d 45 e8             	lea    -0x18(%ebp),%eax
    30ba:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    30c1:	00 
    30c2:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    30c9:	00 
    30ca:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    30d1:	00 
    30d2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    30d9:	00 
    30da:	89 04 24             	mov    %eax,(%esp)
    30dd:	e8 b2 1f 00 00       	call   5094 <initRect>
    30e2:	83 ec 04             	sub    $0x4,%esp
    30e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    30e8:	89 44 24 04          	mov    %eax,0x4(%esp)
    30ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
    30ef:	89 44 24 08          	mov    %eax,0x8(%esp)
    30f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    30f6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    30fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30fd:	89 44 24 10          	mov    %eax,0x10(%esp)
    3101:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    3108:	e8 8a 21 00 00       	call   5297 <deleteClickable>
			addWndEvent(&cm);
    310d:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    3114:	e8 7d e4 ff ff       	call   1596 <addWndEvent>
			addListEvent(&cm);
    3119:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    3120:	e8 e9 e3 ff ff       	call   150e <addListEvent>
}
    3125:	c9                   	leave  
    3126:	c3                   	ret    

00003127 <h_chvm2>:

void h_chvm2(Point p) {
    3127:	55                   	push   %ebp
    3128:	89 e5                	mov    %esp,%ebp
    312a:	83 ec 38             	sub    $0x38,%esp
	style = LIST_STYLE;
    312d:	c7 05 64 06 01 00 02 	movl   $0x2,0x10664
    3134:	00 00 00 
	updateFileList(context);
    3137:	a1 00 47 01 00       	mov    0x14700,%eax
    313c:	89 04 24             	mov    %eax,(%esp)
    313f:	a1 04 47 01 00       	mov    0x14704,%eax
    3144:	89 44 24 04          	mov    %eax,0x4(%esp)
    3148:	a1 08 47 01 00       	mov    0x14708,%eax
    314d:	89 44 24 08          	mov    %eax,0x8(%esp)
    3151:	e8 f2 dc ff ff       	call   e48 <updateFileList>
		drawFinderContent(context);
    3156:	a1 00 47 01 00       	mov    0x14700,%eax
    315b:	89 04 24             	mov    %eax,(%esp)
    315e:	a1 04 47 01 00       	mov    0x14704,%eax
    3163:	89 44 24 04          	mov    %eax,0x4(%esp)
    3167:	a1 08 47 01 00       	mov    0x14708,%eax
    316c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3170:	e8 22 de ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    3175:	a1 00 47 01 00       	mov    0x14700,%eax
    317a:	89 04 24             	mov    %eax,(%esp)
    317d:	a1 04 47 01 00       	mov    0x14704,%eax
    3182:	89 44 24 04          	mov    %eax,0x4(%esp)
    3186:	a1 08 47 01 00       	mov    0x14708,%eax
    318b:	89 44 24 08          	mov    %eax,0x8(%esp)
    318f:	e8 b5 da ff ff       	call   c49 <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    3194:	8d 45 e8             	lea    -0x18(%ebp),%eax
    3197:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    319e:	00 
    319f:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    31a6:	00 
    31a7:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    31ae:	00 
    31af:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    31b6:	00 
    31b7:	89 04 24             	mov    %eax,(%esp)
    31ba:	e8 d5 1e 00 00       	call   5094 <initRect>
    31bf:	83 ec 04             	sub    $0x4,%esp
    31c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    31c5:	89 44 24 04          	mov    %eax,0x4(%esp)
    31c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    31cc:	89 44 24 08          	mov    %eax,0x8(%esp)
    31d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    31d3:	89 44 24 0c          	mov    %eax,0xc(%esp)
    31d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31da:	89 44 24 10          	mov    %eax,0x10(%esp)
    31de:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    31e5:	e8 ad 20 00 00       	call   5297 <deleteClickable>
			addWndEvent(&cm);
    31ea:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    31f1:	e8 a0 e3 ff ff       	call   1596 <addWndEvent>
			addListEvent(&cm);
    31f6:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    31fd:	e8 0c e3 ff ff       	call   150e <addListEvent>
}
    3202:	c9                   	leave  
    3203:	c3                   	ret    

00003204 <h_goUp>:

void h_goUp(Point p) {
    3204:	55                   	push   %ebp
    3205:	89 e5                	mov    %esp,%ebp
    3207:	83 ec 38             	sub    $0x38,%esp
	enterDir("..");
    320a:	c7 04 24 cf c3 00 00 	movl   $0xc3cf,(%esp)
    3211:	e8 70 ea ff ff       	call   1c86 <enterDir>
	updateFileList(context);
    3216:	a1 00 47 01 00       	mov    0x14700,%eax
    321b:	89 04 24             	mov    %eax,(%esp)
    321e:	a1 04 47 01 00       	mov    0x14704,%eax
    3223:	89 44 24 04          	mov    %eax,0x4(%esp)
    3227:	a1 08 47 01 00       	mov    0x14708,%eax
    322c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3230:	e8 13 dc ff ff       	call   e48 <updateFileList>
	drawFinderContent(context);
    3235:	a1 00 47 01 00       	mov    0x14700,%eax
    323a:	89 04 24             	mov    %eax,(%esp)
    323d:	a1 04 47 01 00       	mov    0x14704,%eax
    3242:	89 44 24 04          	mov    %eax,0x4(%esp)
    3246:	a1 08 47 01 00       	mov    0x14708,%eax
    324b:	89 44 24 08          	mov    %eax,0x8(%esp)
    324f:	e8 43 dd ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    3254:	a1 00 47 01 00       	mov    0x14700,%eax
    3259:	89 04 24             	mov    %eax,(%esp)
    325c:	a1 04 47 01 00       	mov    0x14704,%eax
    3261:	89 44 24 04          	mov    %eax,0x4(%esp)
    3265:	a1 08 47 01 00       	mov    0x14708,%eax
    326a:	89 44 24 08          	mov    %eax,0x8(%esp)
    326e:	e8 d6 d9 ff ff       	call   c49 <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    3273:	8d 45 e8             	lea    -0x18(%ebp),%eax
    3276:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    327d:	00 
    327e:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    3285:	00 
    3286:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    328d:	00 
    328e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3295:	00 
    3296:	89 04 24             	mov    %eax,(%esp)
    3299:	e8 f6 1d 00 00       	call   5094 <initRect>
    329e:	83 ec 04             	sub    $0x4,%esp
    32a1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    32a4:	89 44 24 04          	mov    %eax,0x4(%esp)
    32a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    32ab:	89 44 24 08          	mov    %eax,0x8(%esp)
    32af:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32b2:	89 44 24 0c          	mov    %eax,0xc(%esp)
    32b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32b9:	89 44 24 10          	mov    %eax,0x10(%esp)
    32bd:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    32c4:	e8 ce 1f 00 00       	call   5297 <deleteClickable>
	addWndEvent(&cm);
    32c9:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    32d0:	e8 c1 e2 ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    32d5:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    32dc:	e8 2d e2 ff ff       	call   150e <addListEvent>
}
    32e1:	c9                   	leave  
    32e2:	c3                   	ret    

000032e3 <h_empty>:

void h_empty(Point p) {
    32e3:	55                   	push   %ebp
    32e4:	89 e5                	mov    %esp,%ebp

}
    32e6:	5d                   	pop    %ebp
    32e7:	c3                   	ret    

000032e8 <rename>:

void rename() {
    32e8:	55                   	push   %ebp
    32e9:	89 e5                	mov    %esp,%ebp
    32eb:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = fileItemList;
    32ee:	a1 d0 0f 01 00       	mov    0x10fd0,%eax
    32f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (temp != 0){
    32f6:	eb 48                	jmp    3340 <rename+0x58>
		if (temp->chosen == 1){
    32f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32fb:	8b 40 28             	mov    0x28(%eax),%eax
    32fe:	83 f8 01             	cmp    $0x1,%eax
    3301:	75 34                	jne    3337 <rename+0x4f>
			currentlyRenaming = temp;
    3303:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3306:	a3 cc 0f 01 00       	mov    %eax,0x10fcc
			temp->chosen = 2;
    330b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    330e:	c7 40 28 02 00 00 00 	movl   $0x2,0x28(%eax)
			strcpy(renameFrom, temp->name);
    3315:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3318:	8b 40 14             	mov    0x14(%eax),%eax
    331b:	89 44 24 04          	mov    %eax,0x4(%esp)
    331f:	c7 04 24 00 46 01 00 	movl   $0x14600,(%esp)
    3326:	e8 7d 24 00 00       	call   57a8 <strcpy>
			renaming = 1;
    332b:	c7 05 54 48 01 00 01 	movl   $0x1,0x14854
    3332:	00 00 00 
			break;
    3335:	eb 0f                	jmp    3346 <rename+0x5e>
		}
		else
			temp = temp->next;
    3337:	8b 45 f4             	mov    -0xc(%ebp),%eax
    333a:	8b 40 2c             	mov    0x2c(%eax),%eax
    333d:	89 45 f4             	mov    %eax,-0xc(%ebp)

}

void rename() {
	struct fileItem *temp = fileItemList;
	while (temp != 0){
    3340:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3344:	75 b2                	jne    32f8 <rename+0x10>
			break;
		}
		else
			temp = temp->next;
	}
}
    3346:	c9                   	leave  
    3347:	c3                   	ret    

00003348 <h_rename>:

void h_rename(Point p) {
    3348:	55                   	push   %ebp
    3349:	89 e5                	mov    %esp,%ebp
    334b:	83 ec 18             	sub    $0x18,%esp
	rename();
    334e:	e8 95 ff ff ff       	call   32e8 <rename>
	drawFinderContent(context);
    3353:	a1 00 47 01 00       	mov    0x14700,%eax
    3358:	89 04 24             	mov    %eax,(%esp)
    335b:	a1 04 47 01 00       	mov    0x14704,%eax
    3360:	89 44 24 04          	mov    %eax,0x4(%esp)
    3364:	a1 08 47 01 00       	mov    0x14708,%eax
    3369:	89 44 24 08          	mov    %eax,0x8(%esp)
    336d:	e8 25 dc ff ff       	call   f97 <drawFinderContent>
	drawFinderWnd(context);
    3372:	a1 00 47 01 00       	mov    0x14700,%eax
    3377:	89 04 24             	mov    %eax,(%esp)
    337a:	a1 04 47 01 00       	mov    0x14704,%eax
    337f:	89 44 24 04          	mov    %eax,0x4(%esp)
    3383:	a1 08 47 01 00       	mov    0x14708,%eax
    3388:	89 44 24 08          	mov    %eax,0x8(%esp)
    338c:	e8 b8 d8 ff ff       	call   c49 <drawFinderWnd>
}
    3391:	c9                   	leave  
    3392:	c3                   	ret    

00003393 <main>:

int main(int argc, char *argv[]) {
    3393:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    3397:	83 e4 f0             	and    $0xfffffff0,%esp
    339a:	ff 71 fc             	pushl  -0x4(%ecx)
    339d:	55                   	push   %ebp
    339e:	89 e5                	mov    %esp,%ebp
    33a0:	56                   	push   %esi
    33a1:	53                   	push   %ebx
    33a2:	51                   	push   %ecx
    33a3:	81 ec ac 00 00 00    	sub    $0xac,%esp
	struct Msg msg;
	char key;

	Point p;

	init_keyContent();
    33a9:	e8 bc cc ff ff       	call   6a <init_keyContent>
	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    33ae:	c7 44 24 08 c2 01 00 	movl   $0x1c2,0x8(%esp)
    33b5:	00 
    33b6:	c7 44 24 04 58 02 00 	movl   $0x258,0x4(%esp)
    33bd:	00 
    33be:	c7 04 24 00 47 01 00 	movl   $0x14700,(%esp)
    33c5:	e8 94 07 00 00       	call   3b5e <init_context>
    33ca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    33cd:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
    33d3:	8b 15 00 47 01 00    	mov    0x14700,%edx
    33d9:	89 54 24 04          	mov    %edx,0x4(%esp)
    33dd:	8b 15 04 47 01 00    	mov    0x14704,%edx
    33e3:	89 54 24 08          	mov    %edx,0x8(%esp)
    33e7:	8b 15 08 47 01 00    	mov    0x14708,%edx
    33ed:	89 54 24 0c          	mov    %edx,0xc(%esp)
    33f1:	89 04 24             	mov    %eax,(%esp)
    33f4:	e8 39 1d 00 00       	call   5132 <initClickManager>
    33f9:	83 ec 04             	sub    $0x4,%esp
    33fc:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
    3402:	a3 40 48 01 00       	mov    %eax,0x14840
    3407:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
    340d:	a3 44 48 01 00       	mov    %eax,0x14844
    3412:	8b 45 80             	mov    -0x80(%ebp),%eax
    3415:	a3 48 48 01 00       	mov    %eax,0x14848
    341a:	8b 45 84             	mov    -0x7c(%ebp),%eax
    341d:	a3 4c 48 01 00       	mov    %eax,0x1484c
    3422:	8b 45 88             	mov    -0x78(%ebp),%eax
    3425:	a3 50 48 01 00       	mov    %eax,0x14850
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    342a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
    3431:	00 
    3432:	c7 04 24 60 07 01 00 	movl   $0x10760,(%esp)
    3439:	e8 1a 13 00 00       	call   4758 <load_iconlist>
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    343e:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    3445:	00 
    3446:	c7 04 24 80 06 01 00 	movl   $0x10680,(%esp)
    344d:	e8 06 13 00 00       	call   4758 <load_iconlist>
	//testHandlers();
	strcpy(currentPath, "/");
    3452:	c7 44 24 04 d3 c5 00 	movl   $0xc5d3,0x4(%esp)
    3459:	00 
    345a:	c7 04 24 40 47 01 00 	movl   $0x14740,(%esp)
    3461:	e8 42 23 00 00       	call   57a8 <strcpy>
	mkdir("userfolder");
    3466:	c7 04 24 d5 c5 00 00 	movl   $0xc5d5,(%esp)
    346d:	e8 e1 25 00 00       	call   5a53 <mkdir>
	enterDir("userfolder");
    3472:	c7 04 24 d5 c5 00 00 	movl   $0xc5d5,(%esp)
    3479:	e8 08 e8 ff ff       	call   1c86 <enterDir>
	updateFileList(context);
    347e:	a1 00 47 01 00       	mov    0x14700,%eax
    3483:	89 04 24             	mov    %eax,(%esp)
    3486:	a1 04 47 01 00       	mov    0x14704,%eax
    348b:	89 44 24 04          	mov    %eax,0x4(%esp)
    348f:	a1 08 47 01 00       	mov    0x14708,%eax
    3494:	89 44 24 08          	mov    %eax,0x8(%esp)
    3498:	e8 ab d9 ff ff       	call   e48 <updateFileList>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    349d:	8d 45 c0             	lea    -0x40(%ebp),%eax
    34a0:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    34a7:	00 
    34a8:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    34af:	00 
    34b0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    34b7:	00 
    34b8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    34bf:	00 
    34c0:	89 04 24             	mov    %eax,(%esp)
    34c3:	e8 cc 1b 00 00       	call   5094 <initRect>
    34c8:	83 ec 04             	sub    $0x4,%esp
    34cb:	8b 45 c0             	mov    -0x40(%ebp),%eax
    34ce:	89 44 24 04          	mov    %eax,0x4(%esp)
    34d2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    34d5:	89 44 24 08          	mov    %eax,0x8(%esp)
    34d9:	8b 45 c8             	mov    -0x38(%ebp),%eax
    34dc:	89 44 24 0c          	mov    %eax,0xc(%esp)
    34e0:	8b 45 cc             	mov    -0x34(%ebp),%eax
    34e3:	89 44 24 10          	mov    %eax,0x10(%esp)
    34e7:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    34ee:	e8 a4 1d 00 00       	call   5297 <deleteClickable>
	addWndEvent(&cm);
    34f3:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    34fa:	e8 97 e0 ff ff       	call   1596 <addWndEvent>
	addListEvent(&cm);
    34ff:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    3506:	e8 03 e0 ff ff       	call   150e <addListEvent>
	lenOfWaited = 0;
    350b:	c7 05 58 48 01 00 00 	movl   $0x0,0x14858
    3512:	00 00 00 
	while (isRun) {
    3515:	e9 14 05 00 00       	jmp    3a2e <main+0x69b>
		getMsg(&msg);
    351a:	8d 45 a8             	lea    -0x58(%ebp),%eax
    351d:	89 04 24             	mov    %eax,(%esp)
    3520:	e8 66 25 00 00       	call   5a8b <getMsg>
		switch (msg.msg_type) {
    3525:	8b 45 a8             	mov    -0x58(%ebp),%eax
    3528:	83 f8 08             	cmp    $0x8,%eax
    352b:	0f 87 fc 04 00 00    	ja     3a2d <main+0x69a>
    3531:	8b 04 85 e0 c5 00 00 	mov    0xc5e0(,%eax,4),%eax
    3538:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    353a:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    353d:	8b 55 ac             	mov    -0x54(%ebp),%edx
    3540:	8d 45 a0             	lea    -0x60(%ebp),%eax
    3543:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    3547:	89 54 24 04          	mov    %edx,0x4(%esp)
    354b:	89 04 24             	mov    %eax,(%esp)
    354e:	e8 1a 1b 00 00       	call   506d <initPoint>
    3553:	83 ec 04             	sub    $0x4,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    3556:	8b 0d 44 48 01 00    	mov    0x14844,%ecx
    355c:	8b 45 a0             	mov    -0x60(%ebp),%eax
    355f:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    3562:	89 44 24 04          	mov    %eax,0x4(%esp)
    3566:	89 54 24 08          	mov    %edx,0x8(%esp)
    356a:	89 0c 24             	mov    %ecx,(%esp)
    356d:	e8 05 1e 00 00       	call   5377 <executeHandler>
    3572:	85 c0                	test   %eax,%eax
    3574:	74 19                	je     358f <main+0x1fc>
				updateWindow(winid, context.addr);
    3576:	a1 00 47 01 00       	mov    0x14700,%eax
    357b:	89 44 24 04          	mov    %eax,0x4(%esp)
    357f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3582:	89 04 24             	mov    %eax,(%esp)
    3585:	e8 19 25 00 00       	call   5aa3 <updateWindow>
			}
			break;
    358a:	e9 9f 04 00 00       	jmp    3a2e <main+0x69b>
    358f:	e9 9a 04 00 00       	jmp    3a2e <main+0x69b>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderContent(context);
    3594:	a1 00 47 01 00       	mov    0x14700,%eax
    3599:	89 04 24             	mov    %eax,(%esp)
    359c:	a1 04 47 01 00       	mov    0x14704,%eax
    35a1:	89 44 24 04          	mov    %eax,0x4(%esp)
    35a5:	a1 08 47 01 00       	mov    0x14708,%eax
    35aa:	89 44 24 08          	mov    %eax,0x8(%esp)
    35ae:	e8 e4 d9 ff ff       	call   f97 <drawFinderContent>
			drawFinderWnd(context);
    35b3:	a1 00 47 01 00       	mov    0x14700,%eax
    35b8:	89 04 24             	mov    %eax,(%esp)
    35bb:	a1 04 47 01 00       	mov    0x14704,%eax
    35c0:	89 44 24 04          	mov    %eax,0x4(%esp)
    35c4:	a1 08 47 01 00       	mov    0x14708,%eax
    35c9:	89 44 24 08          	mov    %eax,0x8(%esp)
    35cd:	e8 77 d6 ff ff       	call   c49 <drawFinderWnd>
			updateWindow(winid, context.addr);
    35d2:	a1 00 47 01 00       	mov    0x14700,%eax
    35d7:	89 44 24 04          	mov    %eax,0x4(%esp)
    35db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    35de:	89 04 24             	mov    %eax,(%esp)
    35e1:	e8 bd 24 00 00       	call   5aa3 <updateWindow>
			break;
    35e6:	e9 43 04 00 00       	jmp    3a2e <main+0x69b>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    35eb:	8b 75 b8             	mov    -0x48(%ebp),%esi
    35ee:	8b 5d b4             	mov    -0x4c(%ebp),%ebx
    35f1:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    35f4:	8b 55 ac             	mov    -0x54(%ebp),%edx
    35f7:	a1 00 47 01 00       	mov    0x14700,%eax
    35fc:	89 74 24 14          	mov    %esi,0x14(%esp)
    3600:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    3604:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    3608:	89 54 24 08          	mov    %edx,0x8(%esp)
    360c:	89 44 24 04          	mov    %eax,0x4(%esp)
    3610:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3613:	89 04 24             	mov    %eax,(%esp)
    3616:	e8 90 24 00 00       	call   5aab <updatePartialWindow>
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    361b:	e9 0e 04 00 00       	jmp    3a2e <main+0x69b>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    3620:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    3623:	8b 55 ac             	mov    -0x54(%ebp),%edx
    3626:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
    362c:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    3630:	89 54 24 04          	mov    %edx,0x4(%esp)
    3634:	89 04 24             	mov    %eax,(%esp)
    3637:	e8 31 1a 00 00       	call   506d <initPoint>
    363c:	83 ec 04             	sub    $0x4,%esp
    363f:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    3645:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
    364b:	89 45 a0             	mov    %eax,-0x60(%ebp)
    364e:	89 55 a4             	mov    %edx,-0x5c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			// if (executeHandler(cm.left_click, p)) {
			// 	updateWindow(winid, context.addr);
			// }
			if(renaming == 1){
    3651:	a1 54 48 01 00       	mov    0x14854,%eax
    3656:	83 f8 01             	cmp    $0x1,%eax
    3659:	75 19                	jne    3674 <main+0x2e1>
				unrename();
    365b:	e8 f6 ef ff ff       	call   2656 <unrename>
				updateWindow(winid, context.addr);
    3660:	a1 00 47 01 00       	mov    0x14700,%eax
    3665:	89 44 24 04          	mov    %eax,0x4(%esp)
    3669:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    366c:	89 04 24             	mov    %eax,(%esp)
    366f:	e8 2f 24 00 00       	call   5aa3 <updateWindow>
			}
			executeHandler(cm.left_click, p);
    3674:	8b 0d 40 48 01 00    	mov    0x14840,%ecx
    367a:	8b 45 a0             	mov    -0x60(%ebp),%eax
    367d:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    3680:	89 44 24 04          	mov    %eax,0x4(%esp)
    3684:	89 54 24 08          	mov    %edx,0x8(%esp)
    3688:	89 0c 24             	mov    %ecx,(%esp)
    368b:	e8 e7 1c 00 00       	call   5377 <executeHandler>
			draw_searchbox();
    3690:	e8 05 ca ff ff       	call   9a <draw_searchbox>
			puts_str(context, keyContent.content, 0, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
    3695:	c7 44 24 18 28 00 00 	movl   $0x28,0x18(%esp)
    369c:	00 
    369d:	c7 44 24 14 a4 01 00 	movl   $0x1a4,0x14(%esp)
    36a4:	00 
    36a5:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    36ac:	00 
    36ad:	c7 44 24 0c 0c 47 01 	movl   $0x1470c,0xc(%esp)
    36b4:	00 
    36b5:	a1 00 47 01 00       	mov    0x14700,%eax
    36ba:	89 04 24             	mov    %eax,(%esp)
    36bd:	a1 04 47 01 00       	mov    0x14704,%eax
    36c2:	89 44 24 04          	mov    %eax,0x4(%esp)
    36c6:	a1 08 47 01 00       	mov    0x14708,%eax
    36cb:	89 44 24 08          	mov    %eax,0x8(%esp)
    36cf:	e8 55 0b 00 00       	call   4229 <puts_str>
				- (BUTTON_HEIGHT + 3) + 5);
			updateWindow(winid, context.addr);
    36d4:	a1 00 47 01 00       	mov    0x14700,%eax
    36d9:	89 44 24 04          	mov    %eax,0x4(%esp)
    36dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    36e0:	89 04 24             	mov    %eax,(%esp)
    36e3:	e8 bb 23 00 00       	call   5aa3 <updateWindow>
			break;
    36e8:	e9 41 03 00 00       	jmp    3a2e <main+0x69b>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    36ed:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    36f0:	8b 55 ac             	mov    -0x54(%ebp),%edx
    36f3:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
    36f9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    36fd:	89 54 24 04          	mov    %edx,0x4(%esp)
    3701:	89 04 24             	mov    %eax,(%esp)
    3704:	e8 64 19 00 00       	call   506d <initPoint>
    3709:	83 ec 04             	sub    $0x4,%esp
    370c:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    3712:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
    3718:	89 45 a0             	mov    %eax,-0x60(%ebp)
    371b:	89 55 a4             	mov    %edx,-0x5c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    371e:	8b 0d 48 48 01 00    	mov    0x14848,%ecx
    3724:	8b 45 a0             	mov    -0x60(%ebp),%eax
    3727:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    372a:	89 44 24 04          	mov    %eax,0x4(%esp)
    372e:	89 54 24 08          	mov    %edx,0x8(%esp)
    3732:	89 0c 24             	mov    %ecx,(%esp)
    3735:	e8 3d 1c 00 00       	call   5377 <executeHandler>
    373a:	85 c0                	test   %eax,%eax
    373c:	74 19                	je     3757 <main+0x3c4>
				updateWindow(winid, context.addr);
    373e:	a1 00 47 01 00       	mov    0x14700,%eax
    3743:	89 44 24 04          	mov    %eax,0x4(%esp)
    3747:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    374a:	89 04 24             	mov    %eax,(%esp)
    374d:	e8 51 23 00 00       	call   5aa3 <updateWindow>
			}
			break;
    3752:	e9 d7 02 00 00       	jmp    3a2e <main+0x69b>
    3757:	e9 d2 02 00 00       	jmp    3a2e <main+0x69b>
		case MSG_KEYDOWN:
			key = msg.concrete_msg.msg_key.key;
    375c:	0f b6 45 ac          	movzbl -0x54(%ebp),%eax
    3760:	88 45 e3             	mov    %al,-0x1d(%ebp)
			if (isSearching) {
    3763:	a1 e0 3d 01 00       	mov    0x13de0,%eax
    3768:	85 c0                	test   %eax,%eax
    376a:	0f 84 8b 01 00 00    	je     38fb <main+0x568>
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (keyContent.length<MAX_KEYLENGTH)) {
    3770:	80 7d e3 5f          	cmpb   $0x5f,-0x1d(%ebp)
    3774:	74 2a                	je     37a0 <main+0x40d>
    3776:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    377a:	74 24                	je     37a0 <main+0x40d>
    377c:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    3780:	7e 06                	jle    3788 <main+0x3f5>
    3782:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    3786:	7e 18                	jle    37a0 <main+0x40d>
    3788:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    378c:	7e 06                	jle    3794 <main+0x401>
    378e:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    3792:	7e 0c                	jle    37a0 <main+0x40d>
    3794:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    3798:	7e 50                	jle    37ea <main+0x457>
    379a:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    379e:	7f 4a                	jg     37ea <main+0x457>
    37a0:	a1 20 47 01 00       	mov    0x14720,%eax
    37a5:	83 f8 13             	cmp    $0x13,%eax
    37a8:	7f 40                	jg     37ea <main+0x457>
					keyContent.content[keyContent.length++] = key;
    37aa:	a1 20 47 01 00       	mov    0x14720,%eax
    37af:	8d 50 01             	lea    0x1(%eax),%edx
    37b2:	89 15 20 47 01 00    	mov    %edx,0x14720
    37b8:	0f b6 55 e3          	movzbl -0x1d(%ebp),%edx
    37bc:	88 90 0c 47 01 00    	mov    %dl,0x1470c(%eax)
					scrollOffset = 0;
    37c2:	c7 05 c0 0f 01 00 00 	movl   $0x0,0x10fc0
    37c9:	00 00 00 
					printf(0, "%s\n", keyContent.content);
    37cc:	c7 44 24 08 0c 47 01 	movl   $0x1470c,0x8(%esp)
    37d3:	00 
    37d4:	c7 44 24 04 94 c2 00 	movl   $0xc294,0x4(%esp)
    37db:	00 
    37dc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    37e3:	e8 eb 23 00 00       	call   5bd3 <printf>
    37e8:	eb 32                	jmp    381c <main+0x489>
				}
				else if (key == 8 && keyContent.length > 0) {
    37ea:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    37ee:	75 2c                	jne    381c <main+0x489>
    37f0:	a1 20 47 01 00       	mov    0x14720,%eax
    37f5:	85 c0                	test   %eax,%eax
    37f7:	7e 23                	jle    381c <main+0x489>
					keyContent.content[--keyContent.length] = 0;
    37f9:	a1 20 47 01 00       	mov    0x14720,%eax
    37fe:	83 e8 01             	sub    $0x1,%eax
    3801:	a3 20 47 01 00       	mov    %eax,0x14720
    3806:	a1 20 47 01 00       	mov    0x14720,%eax
    380b:	c6 80 0c 47 01 00 00 	movb   $0x0,0x1470c(%eax)
					scrollOffset = 0;
    3812:	c7 05 c0 0f 01 00 00 	movl   $0x0,0x10fc0
    3819:	00 00 00 
				}
				deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    381c:	8d 45 d0             	lea    -0x30(%ebp),%eax
    381f:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    3826:	00 
    3827:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    382e:	00 
    382f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    3836:	00 
    3837:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    383e:	00 
    383f:	89 04 24             	mov    %eax,(%esp)
    3842:	e8 4d 18 00 00       	call   5094 <initRect>
    3847:	83 ec 04             	sub    $0x4,%esp
    384a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    384d:	89 44 24 04          	mov    %eax,0x4(%esp)
    3851:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3854:	89 44 24 08          	mov    %eax,0x8(%esp)
    3858:	8b 45 d8             	mov    -0x28(%ebp),%eax
    385b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    385f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3862:	89 44 24 10          	mov    %eax,0x10(%esp)
    3866:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    386d:	e8 25 1a 00 00       	call   5297 <deleteClickable>
				addWndEvent(&cm);
    3872:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    3879:	e8 18 dd ff ff       	call   1596 <addWndEvent>
				updateFileList(context);
    387e:	a1 00 47 01 00       	mov    0x14700,%eax
    3883:	89 04 24             	mov    %eax,(%esp)
    3886:	a1 04 47 01 00       	mov    0x14704,%eax
    388b:	89 44 24 04          	mov    %eax,0x4(%esp)
    388f:	a1 08 47 01 00       	mov    0x14708,%eax
    3894:	89 44 24 08          	mov    %eax,0x8(%esp)
    3898:	e8 ab d5 ff ff       	call   e48 <updateFileList>
				addListEvent(&cm);
    389d:	c7 04 24 40 48 01 00 	movl   $0x14840,(%esp)
    38a4:	e8 65 dc ff ff       	call   150e <addListEvent>
				drawFinderContent(context);
    38a9:	a1 00 47 01 00       	mov    0x14700,%eax
    38ae:	89 04 24             	mov    %eax,(%esp)
    38b1:	a1 04 47 01 00       	mov    0x14704,%eax
    38b6:	89 44 24 04          	mov    %eax,0x4(%esp)
    38ba:	a1 08 47 01 00       	mov    0x14708,%eax
    38bf:	89 44 24 08          	mov    %eax,0x8(%esp)
    38c3:	e8 cf d6 ff ff       	call   f97 <drawFinderContent>
				drawFinderWnd(context);
    38c8:	a1 00 47 01 00       	mov    0x14700,%eax
    38cd:	89 04 24             	mov    %eax,(%esp)
    38d0:	a1 04 47 01 00       	mov    0x14704,%eax
    38d5:	89 44 24 04          	mov    %eax,0x4(%esp)
    38d9:	a1 08 47 01 00       	mov    0x14708,%eax
    38de:	89 44 24 08          	mov    %eax,0x8(%esp)
    38e2:	e8 62 d3 ff ff       	call   c49 <drawFinderWnd>
				updateWindow(winid, context.addr);
    38e7:	a1 00 47 01 00       	mov    0x14700,%eax
    38ec:	89 44 24 04          	mov    %eax,0x4(%esp)
    38f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    38f3:	89 04 24             	mov    %eax,(%esp)
    38f6:	e8 a8 21 00 00       	call   5aa3 <updateWindow>
			}
			if (renaming) {
    38fb:	a1 54 48 01 00       	mov    0x14854,%eax
    3900:	85 c0                	test   %eax,%eax
    3902:	0f 84 23 01 00 00    	je     3a2b <main+0x698>
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (strlen(currentlyRenaming->name)<30)) {
    3908:	80 7d e3 5f          	cmpb   $0x5f,-0x1d(%ebp)
    390c:	74 2a                	je     3938 <main+0x5a5>
    390e:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    3912:	74 24                	je     3938 <main+0x5a5>
    3914:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    3918:	7e 06                	jle    3920 <main+0x58d>
    391a:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    391e:	7e 18                	jle    3938 <main+0x5a5>
    3920:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    3924:	7e 06                	jle    392c <main+0x599>
    3926:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    392a:	7e 0c                	jle    3938 <main+0x5a5>
    392c:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    3930:	7e 5e                	jle    3990 <main+0x5fd>
    3932:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    3936:	7f 58                	jg     3990 <main+0x5fd>
    3938:	a1 cc 0f 01 00       	mov    0x10fcc,%eax
    393d:	8b 40 14             	mov    0x14(%eax),%eax
    3940:	89 04 24             	mov    %eax,(%esp)
    3943:	e8 cf 1e 00 00       	call   5817 <strlen>
    3948:	83 f8 1d             	cmp    $0x1d,%eax
    394b:	77 43                	ja     3990 <main+0x5fd>
					currentlyRenaming->name[strlen(currentlyRenaming->name) + 1] = 0;
    394d:	a1 cc 0f 01 00       	mov    0x10fcc,%eax
    3952:	8b 58 14             	mov    0x14(%eax),%ebx
    3955:	a1 cc 0f 01 00       	mov    0x10fcc,%eax
    395a:	8b 40 14             	mov    0x14(%eax),%eax
    395d:	89 04 24             	mov    %eax,(%esp)
    3960:	e8 b2 1e 00 00       	call   5817 <strlen>
    3965:	83 c0 01             	add    $0x1,%eax
    3968:	01 d8                	add    %ebx,%eax
    396a:	c6 00 00             	movb   $0x0,(%eax)
					currentlyRenaming->name[strlen(currentlyRenaming->name)] = key;
    396d:	a1 cc 0f 01 00       	mov    0x10fcc,%eax
    3972:	8b 58 14             	mov    0x14(%eax),%ebx
    3975:	a1 cc 0f 01 00       	mov    0x10fcc,%eax
    397a:	8b 40 14             	mov    0x14(%eax),%eax
    397d:	89 04 24             	mov    %eax,(%esp)
    3980:	e8 92 1e 00 00       	call   5817 <strlen>
    3985:	8d 14 03             	lea    (%ebx,%eax,1),%edx
    3988:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
    398c:	88 02                	mov    %al,(%edx)
    398e:	eb 47                	jmp    39d7 <main+0x644>
				}
				else if (key == 8 && (strlen(currentlyRenaming->name)>0)) {
    3990:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    3994:	75 36                	jne    39cc <main+0x639>
    3996:	a1 cc 0f 01 00       	mov    0x10fcc,%eax
    399b:	8b 40 14             	mov    0x14(%eax),%eax
    399e:	89 04 24             	mov    %eax,(%esp)
    39a1:	e8 71 1e 00 00       	call   5817 <strlen>
    39a6:	85 c0                	test   %eax,%eax
    39a8:	74 22                	je     39cc <main+0x639>
					currentlyRenaming->name[strlen(currentlyRenaming->name) - 1] = 0;
    39aa:	a1 cc 0f 01 00       	mov    0x10fcc,%eax
    39af:	8b 58 14             	mov    0x14(%eax),%ebx
    39b2:	a1 cc 0f 01 00       	mov    0x10fcc,%eax
    39b7:	8b 40 14             	mov    0x14(%eax),%eax
    39ba:	89 04 24             	mov    %eax,(%esp)
    39bd:	e8 55 1e 00 00       	call   5817 <strlen>
    39c2:	83 e8 01             	sub    $0x1,%eax
    39c5:	01 d8                	add    %ebx,%eax
    39c7:	c6 00 00             	movb   $0x0,(%eax)
    39ca:	eb 0b                	jmp    39d7 <main+0x644>
				} else if (key == '\n') {
    39cc:	80 7d e3 0a          	cmpb   $0xa,-0x1d(%ebp)
    39d0:	75 05                	jne    39d7 <main+0x644>
					unrename();
    39d2:	e8 7f ec ff ff       	call   2656 <unrename>
				}
				drawFinderContent(context);
    39d7:	a1 00 47 01 00       	mov    0x14700,%eax
    39dc:	89 04 24             	mov    %eax,(%esp)
    39df:	a1 04 47 01 00       	mov    0x14704,%eax
    39e4:	89 44 24 04          	mov    %eax,0x4(%esp)
    39e8:	a1 08 47 01 00       	mov    0x14708,%eax
    39ed:	89 44 24 08          	mov    %eax,0x8(%esp)
    39f1:	e8 a1 d5 ff ff       	call   f97 <drawFinderContent>
				drawFinderWnd(context);
    39f6:	a1 00 47 01 00       	mov    0x14700,%eax
    39fb:	89 04 24             	mov    %eax,(%esp)
    39fe:	a1 04 47 01 00       	mov    0x14704,%eax
    3a03:	89 44 24 04          	mov    %eax,0x4(%esp)
    3a07:	a1 08 47 01 00       	mov    0x14708,%eax
    3a0c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3a10:	e8 34 d2 ff ff       	call   c49 <drawFinderWnd>
				updateWindow(winid, context.addr);
    3a15:	a1 00 47 01 00       	mov    0x14700,%eax
    3a1a:	89 44 24 04          	mov    %eax,0x4(%esp)
    3a1e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a21:	89 04 24             	mov    %eax,(%esp)
    3a24:	e8 7a 20 00 00       	call   5aa3 <updateWindow>
			}
			break;
    3a29:	eb 03                	jmp    3a2e <main+0x69b>
    3a2b:	eb 01                	jmp    3a2e <main+0x69b>
		default:
			break;
    3a2d:	90                   	nop
	updateFileList(context);
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	lenOfWaited = 0;
	while (isRun) {
    3a2e:	a1 60 06 01 00       	mov    0x10660,%eax
    3a33:	85 c0                	test   %eax,%eax
    3a35:	0f 85 df fa ff ff    	jne    351a <main+0x187>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    3a3b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a3e:	89 44 24 04          	mov    %eax,0x4(%esp)
    3a42:	c7 04 24 00 47 01 00 	movl   $0x14700,(%esp)
    3a49:	e8 93 01 00 00       	call   3be1 <free_context>
	exit();
    3a4e:	e8 98 1f 00 00       	call   59eb <exit>

00003a53 <testHandlers>:
}

void testHandlers() {
    3a53:	55                   	push   %ebp
    3a54:	89 e5                	mov    %esp,%ebp
    3a56:	83 ec 18             	sub    $0x18,%esp

	list(".");
    3a59:	c7 04 24 88 c2 00 00 	movl   $0xc288,(%esp)
    3a60:	e8 8e ca ff ff       	call   4f3 <list>
	printf(0, "original list:\n");
    3a65:	c7 44 24 04 04 c6 00 	movl   $0xc604,0x4(%esp)
    3a6c:	00 
    3a6d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3a74:	e8 5a 21 00 00       	call   5bd3 <printf>
	printItemList();
    3a79:	e8 7a d8 ff ff       	call   12f8 <printItemList>
	printf(0, "\n");
    3a7e:	c7 44 24 04 14 c6 00 	movl   $0xc614,0x4(%esp)
    3a85:	00 
    3a86:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3a8d:	e8 41 21 00 00       	call   5bd3 <printf>
	printf(0, "new a folder:\n");
    3a92:	c7 44 24 04 16 c6 00 	movl   $0xc616,0x4(%esp)
    3a99:	00 
    3a9a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3aa1:	e8 2d 21 00 00       	call   5bd3 <printf>
	newFolder("newfolder");
    3aa6:	c7 04 24 25 c6 00 00 	movl   $0xc625,(%esp)
    3aad:	e8 42 e5 ff ff       	call   1ff4 <newFolder>
	freeFileItemList();
    3ab2:	e8 5e c9 ff ff       	call   415 <freeFileItemList>
	list(".");
    3ab7:	c7 04 24 88 c2 00 00 	movl   $0xc288,(%esp)
    3abe:	e8 30 ca ff ff       	call   4f3 <list>
	printItemList();
    3ac3:	e8 30 d8 ff ff       	call   12f8 <printItemList>
	printf(0, "\n");
    3ac8:	c7 44 24 04 14 c6 00 	movl   $0xc614,0x4(%esp)
    3acf:	00 
    3ad0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3ad7:	e8 f7 20 00 00       	call   5bd3 <printf>
	printf(0, "enter new folder:\n");
    3adc:	c7 44 24 04 2f c6 00 	movl   $0xc62f,0x4(%esp)
    3ae3:	00 
    3ae4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3aeb:	e8 e3 20 00 00       	call   5bd3 <printf>
	enterDir("newfolder");
    3af0:	c7 04 24 25 c6 00 00 	movl   $0xc625,(%esp)
    3af7:	e8 8a e1 ff ff       	call   1c86 <enterDir>
	freeFileItemList();
    3afc:	e8 14 c9 ff ff       	call   415 <freeFileItemList>
	list(".");
    3b01:	c7 04 24 88 c2 00 00 	movl   $0xc288,(%esp)
    3b08:	e8 e6 c9 ff ff       	call   4f3 <list>
	printItemList();
    3b0d:	e8 e6 d7 ff ff       	call   12f8 <printItemList>
	printf(0, "\n");
    3b12:	c7 44 24 04 14 c6 00 	movl   $0xc614,0x4(%esp)
    3b19:	00 
    3b1a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3b21:	e8 ad 20 00 00       	call   5bd3 <printf>
	printf(0, "new a file:\n");
    3b26:	c7 44 24 04 42 c6 00 	movl   $0xc642,0x4(%esp)
    3b2d:	00 
    3b2e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3b35:	e8 99 20 00 00       	call   5bd3 <printf>
	newFile("newfile.txt");
    3b3a:	c7 04 24 4f c6 00 00 	movl   $0xc64f,(%esp)
    3b41:	e8 b6 e2 ff ff       	call   1dfc <newFile>
	freeFileItemList();
    3b46:	e8 ca c8 ff ff       	call   415 <freeFileItemList>
	list(".");
    3b4b:	c7 04 24 88 c2 00 00 	movl   $0xc288,(%esp)
    3b52:	e8 9c c9 ff ff       	call   4f3 <list>
	printItemList();
    3b57:	e8 9c d7 ff ff       	call   12f8 <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    3b5c:	c9                   	leave  
    3b5d:	c3                   	ret    

00003b5e <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    3b5e:	55                   	push   %ebp
    3b5f:	89 e5                	mov    %esp,%ebp
    3b61:	83 ec 18             	sub    $0x18,%esp
    context_ptr->width = width;
    3b64:	8b 45 08             	mov    0x8(%ebp),%eax
    3b67:	8b 55 0c             	mov    0xc(%ebp),%edx
    3b6a:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    3b6d:	8b 45 08             	mov    0x8(%ebp),%eax
    3b70:	8b 55 10             	mov    0x10(%ebp),%edx
    3b73:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    3b76:	8b 55 0c             	mov    0xc(%ebp),%edx
    3b79:	8b 45 10             	mov    0x10(%ebp),%eax
    3b7c:	0f af c2             	imul   %edx,%eax
    3b7f:	01 c0                	add    %eax,%eax
    3b81:	89 04 24             	mov    %eax,(%esp)
    3b84:	e8 36 23 00 00       	call   5ebf <malloc>
    3b89:	8b 55 08             	mov    0x8(%ebp),%edx
    3b8c:	89 02                	mov    %eax,(%edx)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    3b8e:	8b 55 0c             	mov    0xc(%ebp),%edx
    3b91:	8b 45 10             	mov    0x10(%ebp),%eax
    3b94:	0f af c2             	imul   %edx,%eax
    3b97:	8d 14 00             	lea    (%eax,%eax,1),%edx
    3b9a:	8b 45 08             	mov    0x8(%ebp),%eax
    3b9d:	8b 00                	mov    (%eax),%eax
    3b9f:	89 54 24 08          	mov    %edx,0x8(%esp)
    3ba3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3baa:	00 
    3bab:	89 04 24             	mov    %eax,(%esp)
    3bae:	e8 8b 1c 00 00       	call   583e <memset>
    initializeASCII();
    3bb3:	e8 93 01 00 00       	call   3d4b <initializeASCII>
    initializeGBK();
    3bb8:	e8 17 03 00 00       	call   3ed4 <initializeGBK>
    return createWindow(0, 0, width, height);
    3bbd:	8b 45 10             	mov    0x10(%ebp),%eax
    3bc0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3bc4:	8b 45 0c             	mov    0xc(%ebp),%eax
    3bc7:	89 44 24 08          	mov    %eax,0x8(%esp)
    3bcb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3bd2:	00 
    3bd3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3bda:	e8 b4 1e 00 00       	call   5a93 <createWindow>
}
    3bdf:	c9                   	leave  
    3be0:	c3                   	ret    

00003be1 <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    3be1:	55                   	push   %ebp
    3be2:	89 e5                	mov    %esp,%ebp
    3be4:	83 ec 18             	sub    $0x18,%esp
    free(context_ptr->addr);
    3be7:	8b 45 08             	mov    0x8(%ebp),%eax
    3bea:	8b 00                	mov    (%eax),%eax
    3bec:	89 04 24             	mov    %eax,(%esp)
    3bef:	e8 92 21 00 00       	call   5d86 <free>
    freeASCII();
    3bf4:	e8 c6 02 00 00       	call   3ebf <freeASCII>
    freeGBK();
    3bf9:	e8 7e 03 00 00       	call   3f7c <freeGBK>
    destroyWindow(winid);
    3bfe:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c01:	89 04 24             	mov    %eax,(%esp)
    3c04:	e8 92 1e 00 00       	call   5a9b <destroyWindow>
}
    3c09:	c9                   	leave  
    3c0a:	c3                   	ret    

00003c0b <draw_point>:
*             then do nothing!
*/

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    3c0b:	55                   	push   %ebp
    3c0c:	89 e5                	mov    %esp,%ebp
    3c0e:	83 ec 04             	sub    $0x4,%esp
    3c11:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3c14:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width) 
    3c18:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c1b:	3b 45 14             	cmp    0x14(%ebp),%eax
    3c1e:	77 02                	ja     3c22 <draw_point+0x17>
    return;
    3c20:	eb 26                	jmp    3c48 <draw_point+0x3d>
  if(y >= c.height)
    3c22:	8b 45 10             	mov    0x10(%ebp),%eax
    3c25:	3b 45 18             	cmp    0x18(%ebp),%eax
    3c28:	77 02                	ja     3c2c <draw_point+0x21>
    return;
    3c2a:	eb 1c                	jmp    3c48 <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    3c2c:	8b 55 08             	mov    0x8(%ebp),%edx
    3c2f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c32:	0f af 45 18          	imul   0x18(%ebp),%eax
    3c36:	89 c1                	mov    %eax,%ecx
    3c38:	8b 45 14             	mov    0x14(%ebp),%eax
    3c3b:	01 c8                	add    %ecx,%eax
    3c3d:	01 c0                	add    %eax,%eax
    3c3f:	01 c2                	add    %eax,%edx
    3c41:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    3c45:	66 89 02             	mov    %ax,(%edx)
}
    3c48:	c9                   	leave  
    3c49:	c3                   	ret    

00003c4a <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    3c4a:	55                   	push   %ebp
    3c4b:	89 e5                	mov    %esp,%ebp
    3c4d:	83 ec 2c             	sub    $0x2c,%esp
    3c50:	8b 45 24             	mov    0x24(%ebp),%eax
    3c53:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    3c57:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3c5a:	8b 55 14             	mov    0x14(%ebp),%edx
    3c5d:	01 c2                	add    %eax,%edx
    3c5f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c62:	39 c2                	cmp    %eax,%edx
    3c64:	0f 46 c2             	cmovbe %edx,%eax
    3c67:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height; 
    3c6a:	8b 45 20             	mov    0x20(%ebp),%eax
    3c6d:	8b 55 18             	mov    0x18(%ebp),%edx
    3c70:	01 c2                	add    %eax,%edx
    3c72:	8b 45 10             	mov    0x10(%ebp),%eax
    3c75:	39 c2                	cmp    %eax,%edx
    3c77:	0f 46 c2             	cmovbe %edx,%eax
    3c7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    3c7d:	8b 45 18             	mov    0x18(%ebp),%eax
    3c80:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3c83:	eb 47                	jmp    3ccc <fill_rect+0x82>
	{
		for (x = bx; x < mx; x++)
    3c85:	8b 45 14             	mov    0x14(%ebp),%eax
    3c88:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3c8b:	eb 33                	jmp    3cc0 <fill_rect+0x76>
		{
			draw_point(c, x, y, color);
    3c8d:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    3c91:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3c94:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3c97:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3c9b:	89 54 24 10          	mov    %edx,0x10(%esp)
    3c9f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3ca3:	8b 45 08             	mov    0x8(%ebp),%eax
    3ca6:	89 04 24             	mov    %eax,(%esp)
    3ca9:	8b 45 0c             	mov    0xc(%ebp),%eax
    3cac:	89 44 24 04          	mov    %eax,0x4(%esp)
    3cb0:	8b 45 10             	mov    0x10(%ebp),%eax
    3cb3:	89 44 24 08          	mov    %eax,0x8(%esp)
    3cb7:	e8 4f ff ff ff       	call   3c0b <draw_point>
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    3cbc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3cc0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3cc3:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3cc6:	7c c5                	jl     3c8d <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
    3cc8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3ccc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3ccf:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3cd2:	7c b1                	jl     3c85 <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    3cd4:	c9                   	leave  
    3cd5:	c3                   	ret    

00003cd6 <printBinary>:

void printBinary(char c)
{
    3cd6:	55                   	push   %ebp
    3cd7:	89 e5                	mov    %esp,%ebp
    3cd9:	83 ec 28             	sub    $0x28,%esp
    3cdc:	8b 45 08             	mov    0x8(%ebp),%eax
    3cdf:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    3ce2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3ce9:	eb 44                	jmp    3d2f <printBinary+0x59>
	{
		if(((c << i) & 0x80) != 0)
    3ceb:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    3cef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3cf2:	89 c1                	mov    %eax,%ecx
    3cf4:	d3 e2                	shl    %cl,%edx
    3cf6:	89 d0                	mov    %edx,%eax
    3cf8:	25 80 00 00 00       	and    $0x80,%eax
    3cfd:	85 c0                	test   %eax,%eax
    3cff:	74 16                	je     3d17 <printBinary+0x41>
		{
			printf(0, "1");
    3d01:	c7 44 24 04 5b c6 00 	movl   $0xc65b,0x4(%esp)
    3d08:	00 
    3d09:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d10:	e8 be 1e 00 00       	call   5bd3 <printf>
    3d15:	eb 14                	jmp    3d2b <printBinary+0x55>
		}
		else
		{
			printf(0, "0");
    3d17:	c7 44 24 04 5d c6 00 	movl   $0xc65d,0x4(%esp)
    3d1e:	00 
    3d1f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d26:	e8 a8 1e 00 00       	call   5bd3 <printf>
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    3d2b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3d2f:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    3d33:	7e b6                	jle    3ceb <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    3d35:	c7 44 24 04 5f c6 00 	movl   $0xc65f,0x4(%esp)
    3d3c:	00 
    3d3d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d44:	e8 8a 1e 00 00       	call   5bd3 <printf>
}
    3d49:	c9                   	leave  
    3d4a:	c3                   	ret    

00003d4b <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    3d4b:	55                   	push   %ebp
    3d4c:	89 e5                	mov    %esp,%ebp
    3d4e:	56                   	push   %esi
    3d4f:	53                   	push   %ebx
    3d50:	83 ec 30             	sub    $0x30,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    3d53:	c7 44 24 04 61 c6 00 	movl   $0xc661,0x4(%esp)
    3d5a:	00 
    3d5b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d62:	e8 6c 1e 00 00       	call   5bd3 <printf>
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    3d67:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3d6e:	00 
    3d6f:	c7 04 24 74 c6 00 00 	movl   $0xc674,(%esp)
    3d76:	e8 b0 1c 00 00       	call   5a2b <open>
    3d7b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    3d7e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3d82:	79 21                	jns    3da5 <initializeASCII+0x5a>
	  printf(0,"cannot open %s\n", HANKAKU);
    3d84:	c7 44 24 08 74 c6 00 	movl   $0xc674,0x8(%esp)
    3d8b:	00 
    3d8c:	c7 44 24 04 80 c6 00 	movl   $0xc680,0x4(%esp)
    3d93:	00 
    3d94:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d9b:	e8 33 1e 00 00       	call   5bd3 <printf>
	  return;
    3da0:	e9 13 01 00 00       	jmp    3eb8 <initializeASCII+0x16d>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    3da5:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    3dac:	e8 0e 21 00 00       	call   5ebf <malloc>
    3db1:	a3 60 48 01 00       	mov    %eax,0x14860
	for (i = 0; i < ASCII_NUM; i++)
    3db6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3dbd:	eb 12                	jmp    3dd1 <initializeASCII+0x86>
	{
		hankaku[i] = 0;
    3dbf:	8b 15 60 48 01 00    	mov    0x14860,%edx
    3dc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3dc8:	01 d0                	add    %edx,%eax
    3dca:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    3dcd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3dd1:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    3dd8:	7e e5                	jle    3dbf <initializeASCII+0x74>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    3dda:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    3de1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    3de8:	e9 84 00 00 00       	jmp    3e71 <initializeASCII+0x126>
	{
		for (i = 0; i < n; i++){
    3ded:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3df4:	eb 73                	jmp    3e69 <initializeASCII+0x11e>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    3df6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3df9:	05 80 48 01 00       	add    $0x14880,%eax
    3dfe:	0f b6 00             	movzbl (%eax),%eax
    3e01:	3c 2a                	cmp    $0x2a,%al
    3e03:	74 0f                	je     3e14 <initializeASCII+0xc9>
    3e05:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e08:	05 80 48 01 00       	add    $0x14880,%eax
    3e0d:	0f b6 00             	movzbl (%eax),%eax
    3e10:	3c 2e                	cmp    $0x2e,%al
    3e12:	75 51                	jne    3e65 <initializeASCII+0x11a>
			{
				if (buf[i] == '*')
    3e14:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e17:	05 80 48 01 00       	add    $0x14880,%eax
    3e1c:	0f b6 00             	movzbl (%eax),%eax
    3e1f:	3c 2a                	cmp    $0x2a,%al
    3e21:	75 2d                	jne    3e50 <initializeASCII+0x105>
				{
					hankaku[y] |= (0x80 >> x);
    3e23:	8b 15 60 48 01 00    	mov    0x14860,%edx
    3e29:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3e2c:	01 c2                	add    %eax,%edx
    3e2e:	8b 0d 60 48 01 00    	mov    0x14860,%ecx
    3e34:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3e37:	01 c8                	add    %ecx,%eax
    3e39:	0f b6 00             	movzbl (%eax),%eax
    3e3c:	89 c3                	mov    %eax,%ebx
    3e3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3e41:	be 80 00 00 00       	mov    $0x80,%esi
    3e46:	89 c1                	mov    %eax,%ecx
    3e48:	d3 fe                	sar    %cl,%esi
    3e4a:	89 f0                	mov    %esi,%eax
    3e4c:	09 d8                	or     %ebx,%eax
    3e4e:	88 02                	mov    %al,(%edx)
				}
				x ++;
    3e50:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    3e54:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    3e58:	7e 0b                	jle    3e65 <initializeASCII+0x11a>
				{
					x = 0;
    3e5a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    3e61:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    3e65:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3e69:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e6c:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    3e6f:	7c 85                	jl     3df6 <initializeASCII+0xab>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    3e71:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    3e78:	00 
    3e79:	c7 44 24 04 80 48 01 	movl   $0x14880,0x4(%esp)
    3e80:	00 
    3e81:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3e84:	89 04 24             	mov    %eax,(%esp)
    3e87:	e8 77 1b 00 00       	call   5a03 <read>
    3e8c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3e8f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3e93:	0f 8f 54 ff ff ff    	jg     3ded <initializeASCII+0xa2>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    3e99:	c7 44 24 04 90 c6 00 	movl   $0xc690,0x4(%esp)
    3ea0:	00 
    3ea1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3ea8:	e8 26 1d 00 00       	call   5bd3 <printf>
	close(fd);
    3ead:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3eb0:	89 04 24             	mov    %eax,(%esp)
    3eb3:	e8 5b 1b 00 00       	call   5a13 <close>
}
    3eb8:	83 c4 30             	add    $0x30,%esp
    3ebb:	5b                   	pop    %ebx
    3ebc:	5e                   	pop    %esi
    3ebd:	5d                   	pop    %ebp
    3ebe:	c3                   	ret    

00003ebf <freeASCII>:

void freeASCII(){
    3ebf:	55                   	push   %ebp
    3ec0:	89 e5                	mov    %esp,%ebp
    3ec2:	83 ec 18             	sub    $0x18,%esp
	free(hankaku);
    3ec5:	a1 60 48 01 00       	mov    0x14860,%eax
    3eca:	89 04 24             	mov    %eax,(%esp)
    3ecd:	e8 b4 1e 00 00       	call   5d86 <free>
}
    3ed2:	c9                   	leave  
    3ed3:	c3                   	ret    

00003ed4 <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    3ed4:	55                   	push   %ebp
    3ed5:	89 e5                	mov    %esp,%ebp
    3ed7:	83 ec 28             	sub    $0x28,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    3eda:	c7 44 24 04 ad c6 00 	movl   $0xc6ad,0x4(%esp)
    3ee1:	00 
    3ee2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3ee9:	e8 e5 1c 00 00       	call   5bd3 <printf>
	if((fd = open(HZK16, 0)) < 0){
    3eee:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3ef5:	00 
    3ef6:	c7 04 24 be c6 00 00 	movl   $0xc6be,(%esp)
    3efd:	e8 29 1b 00 00       	call   5a2b <open>
    3f02:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3f05:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3f09:	79 1e                	jns    3f29 <initializeGBK+0x55>
		printf(0,"cannot open %s\n", HZK16);
    3f0b:	c7 44 24 08 be c6 00 	movl   $0xc6be,0x8(%esp)
    3f12:	00 
    3f13:	c7 44 24 04 80 c6 00 	movl   $0xc680,0x4(%esp)
    3f1a:	00 
    3f1b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3f22:	e8 ac 1c 00 00       	call   5bd3 <printf>
		return;
    3f27:	eb 51                	jmp    3f7a <initializeGBK+0xa6>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    3f29:	c7 04 24 78 69 00 00 	movl   $0x6978,(%esp)
    3f30:	e8 8a 1f 00 00       	call   5ebf <malloc>
    3f35:	a3 64 48 01 00       	mov    %eax,0x14864
	fontFile.size = read(fd, fontFile.buf, 27000);
    3f3a:	a1 64 48 01 00       	mov    0x14864,%eax
    3f3f:	c7 44 24 08 78 69 00 	movl   $0x6978,0x8(%esp)
    3f46:	00 
    3f47:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f4e:	89 04 24             	mov    %eax,(%esp)
    3f51:	e8 ad 1a 00 00       	call   5a03 <read>
    3f56:	a3 68 48 01 00       	mov    %eax,0x14868
	printf(0,"initialzing gbk complete!\n");
    3f5b:	c7 44 24 04 c8 c6 00 	movl   $0xc6c8,0x4(%esp)
    3f62:	00 
    3f63:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3f6a:	e8 64 1c 00 00       	call   5bd3 <printf>
	close(fd);
    3f6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f72:	89 04 24             	mov    %eax,(%esp)
    3f75:	e8 99 1a 00 00       	call   5a13 <close>
}
    3f7a:	c9                   	leave  
    3f7b:	c3                   	ret    

00003f7c <freeGBK>:

void freeGBK(){
    3f7c:	55                   	push   %ebp
    3f7d:	89 e5                	mov    %esp,%ebp
    3f7f:	83 ec 18             	sub    $0x18,%esp
	free(fontFile.buf);
    3f82:	a1 64 48 01 00       	mov    0x14864,%eax
    3f87:	89 04 24             	mov    %eax,(%esp)
    3f8a:	e8 f7 1d 00 00       	call   5d86 <free>
}
    3f8f:	c9                   	leave  
    3f90:	c3                   	ret    

00003f91 <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    3f91:	55                   	push   %ebp
    3f92:	89 e5                	mov    %esp,%ebp
    3f94:	53                   	push   %ebx
    3f95:	83 ec 30             	sub    $0x30,%esp
    3f98:	8b 55 14             	mov    0x14(%ebp),%edx
    3f9b:	8b 45 18             	mov    0x18(%ebp),%eax
    3f9e:	88 55 e8             	mov    %dl,-0x18(%ebp)
    3fa1:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    3fa5:	8b 45 20             	mov    0x20(%ebp),%eax
    3fa8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3fab:	eb 7f                	jmp    402c <put_ascii+0x9b>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    3fad:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    3fb4:	eb 6c                	jmp    4022 <put_ascii+0x91>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    3fb6:	a1 60 48 01 00       	mov    0x14860,%eax
    3fbb:	0f b6 55 e8          	movzbl -0x18(%ebp),%edx
    3fbf:	c1 e2 04             	shl    $0x4,%edx
    3fc2:	89 d1                	mov    %edx,%ecx
    3fc4:	8b 55 20             	mov    0x20(%ebp),%edx
    3fc7:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3fca:	29 d3                	sub    %edx,%ebx
    3fcc:	89 da                	mov    %ebx,%edx
    3fce:	01 ca                	add    %ecx,%edx
    3fd0:	01 d0                	add    %edx,%eax
    3fd2:	0f b6 00             	movzbl (%eax),%eax
    3fd5:	0f b6 d0             	movzbl %al,%edx
    3fd8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fdb:	89 c1                	mov    %eax,%ecx
    3fdd:	d3 e2                	shl    %cl,%edx
    3fdf:	89 d0                	mov    %edx,%eax
    3fe1:	25 80 00 00 00       	and    $0x80,%eax
    3fe6:	85 c0                	test   %eax,%eax
    3fe8:	74 34                	je     401e <put_ascii+0x8d>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    3fea:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    3fee:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3ff1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3ff4:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    3ff7:	01 d8                	add    %ebx,%eax
    3ff9:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3ffd:	89 54 24 10          	mov    %edx,0x10(%esp)
    4001:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4005:	8b 45 08             	mov    0x8(%ebp),%eax
    4008:	89 04 24             	mov    %eax,(%esp)
    400b:	8b 45 0c             	mov    0xc(%ebp),%eax
    400e:	89 44 24 04          	mov    %eax,0x4(%esp)
    4012:	8b 45 10             	mov    0x10(%ebp),%eax
    4015:	89 44 24 08          	mov    %eax,0x8(%esp)
    4019:	e8 ed fb ff ff       	call   3c0b <draw_point>
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    401e:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    4022:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    4026:	7e 8e                	jle    3fb6 <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    4028:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    402c:	8b 45 20             	mov    0x20(%ebp),%eax
    402f:	83 c0 10             	add    $0x10,%eax
    4032:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    4035:	0f 8f 72 ff ff ff    	jg     3fad <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    403b:	83 c4 30             	add    $0x30,%esp
    403e:	5b                   	pop    %ebx
    403f:	5d                   	pop    %ebp
    4040:	c3                   	ret    

00004041 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    4041:	55                   	push   %ebp
    4042:	89 e5                	mov    %esp,%ebp
    4044:	53                   	push   %ebx
    4045:	83 ec 34             	sub    $0x34,%esp
    4048:	8b 55 14             	mov    0x14(%ebp),%edx
    404b:	8b 45 18             	mov    0x18(%ebp),%eax
    404e:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    4052:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    4056:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    405a:	0f b6 c0             	movzbl %al,%eax
    405d:	3d a0 00 00 00       	cmp    $0xa0,%eax
    4062:	0f 8e 40 01 00 00    	jle    41a8 <put_gbk+0x167>
    4068:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    406c:	66 c1 f8 08          	sar    $0x8,%ax
    4070:	98                   	cwtl   
    4071:	0f b6 c0             	movzbl %al,%eax
    4074:	3d a0 00 00 00       	cmp    $0xa0,%eax
    4079:	0f 8e 29 01 00 00    	jle    41a8 <put_gbk+0x167>
		hzk16Base = fontFile.buf;
    407f:	a1 64 48 01 00       	mov    0x14864,%eax
    4084:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    4087:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    408b:	0f b6 c0             	movzbl %al,%eax
    408e:	2d a1 00 00 00       	sub    $0xa1,%eax
    4093:	6b c0 5e             	imul   $0x5e,%eax,%eax
    4096:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    409a:	66 c1 fa 08          	sar    $0x8,%dx
    409e:	0f bf d2             	movswl %dx,%edx
    40a1:	0f b6 d2             	movzbl %dl,%edx
    40a4:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    40aa:	01 d0                	add    %edx,%eax
    40ac:	c1 e0 05             	shl    $0x5,%eax
    40af:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    40b2:	8b 45 20             	mov    0x20(%ebp),%eax
    40b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    40b8:	e9 da 00 00 00       	jmp    4197 <put_gbk+0x156>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    40bd:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    40c4:	eb 58                	jmp    411e <put_gbk+0xdd>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    40c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    40c9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    40cc:	01 d0                	add    %edx,%eax
    40ce:	0f b6 00             	movzbl (%eax),%eax
    40d1:	0f b6 d0             	movzbl %al,%edx
    40d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40d7:	89 c1                	mov    %eax,%ecx
    40d9:	d3 e2                	shl    %cl,%edx
    40db:	89 d0                	mov    %edx,%eax
    40dd:	25 80 00 00 00       	and    $0x80,%eax
    40e2:	85 c0                	test   %eax,%eax
    40e4:	74 34                	je     411a <put_gbk+0xd9>
					draw_point(c, x + tmpX, tmpY, colorNum);
    40e6:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    40ea:	8b 55 f4             	mov    -0xc(%ebp),%edx
    40ed:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40f0:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    40f3:	01 d8                	add    %ebx,%eax
    40f5:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    40f9:	89 54 24 10          	mov    %edx,0x10(%esp)
    40fd:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4101:	8b 45 08             	mov    0x8(%ebp),%eax
    4104:	89 04 24             	mov    %eax,(%esp)
    4107:	8b 45 0c             	mov    0xc(%ebp),%eax
    410a:	89 44 24 04          	mov    %eax,0x4(%esp)
    410e:	8b 45 10             	mov    0x10(%ebp),%eax
    4111:	89 44 24 08          	mov    %eax,0x8(%esp)
    4115:	e8 f1 fa ff ff       	call   3c0b <draw_point>
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    411a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    411e:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    4122:	7e a2                	jle    40c6 <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    4124:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    4128:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    412f:	eb 58                	jmp    4189 <put_gbk+0x148>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    4131:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4134:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4137:	01 d0                	add    %edx,%eax
    4139:	0f b6 00             	movzbl (%eax),%eax
    413c:	0f b6 d0             	movzbl %al,%edx
    413f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4142:	89 c1                	mov    %eax,%ecx
    4144:	d3 e2                	shl    %cl,%edx
    4146:	89 d0                	mov    %edx,%eax
    4148:	25 80 00 00 00       	and    $0x80,%eax
    414d:	85 c0                	test   %eax,%eax
    414f:	74 34                	je     4185 <put_gbk+0x144>
					draw_point(c, x + tmpX, tmpY, colorNum);
    4151:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    4155:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4158:	8b 45 f8             	mov    -0x8(%ebp),%eax
    415b:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    415e:	01 d8                	add    %ebx,%eax
    4160:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    4164:	89 54 24 10          	mov    %edx,0x10(%esp)
    4168:	89 44 24 0c          	mov    %eax,0xc(%esp)
    416c:	8b 45 08             	mov    0x8(%ebp),%eax
    416f:	89 04 24             	mov    %eax,(%esp)
    4172:	8b 45 0c             	mov    0xc(%ebp),%eax
    4175:	89 44 24 04          	mov    %eax,0x4(%esp)
    4179:	8b 45 10             	mov    0x10(%ebp),%eax
    417c:	89 44 24 08          	mov    %eax,0x8(%esp)
    4180:	e8 86 fa ff ff       	call   3c0b <draw_point>
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    4185:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    4189:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    418d:	7e a2                	jle    4131 <put_gbk+0xf0>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    418f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    4193:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4197:	8b 45 20             	mov    0x20(%ebp),%eax
    419a:	83 c0 10             	add    $0x10,%eax
    419d:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    41a0:	0f 8f 17 ff ff ff    	jg     40bd <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    41a6:	eb 7b                	jmp    4223 <put_gbk+0x1e2>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    41a8:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    41ac:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    41b0:	0f b6 c0             	movzbl %al,%eax
    41b3:	8b 4d 20             	mov    0x20(%ebp),%ecx
    41b6:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    41ba:	8b 4d 1c             	mov    0x1c(%ebp),%ecx
    41bd:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    41c1:	89 54 24 10          	mov    %edx,0x10(%esp)
    41c5:	89 44 24 0c          	mov    %eax,0xc(%esp)
    41c9:	8b 45 08             	mov    0x8(%ebp),%eax
    41cc:	89 04 24             	mov    %eax,(%esp)
    41cf:	8b 45 0c             	mov    0xc(%ebp),%eax
    41d2:	89 44 24 04          	mov    %eax,0x4(%esp)
    41d6:	8b 45 10             	mov    0x10(%ebp),%eax
    41d9:	89 44 24 08          	mov    %eax,0x8(%esp)
    41dd:	e8 af fd ff ff       	call   3f91 <put_ascii>
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    41e2:	8b 45 1c             	mov    0x1c(%ebp),%eax
    41e5:	8d 58 08             	lea    0x8(%eax),%ebx
    41e8:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    41ec:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    41f0:	66 c1 f8 08          	sar    $0x8,%ax
    41f4:	0f b6 c0             	movzbl %al,%eax
    41f7:	8b 4d 20             	mov    0x20(%ebp),%ecx
    41fa:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    41fe:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    4202:	89 54 24 10          	mov    %edx,0x10(%esp)
    4206:	89 44 24 0c          	mov    %eax,0xc(%esp)
    420a:	8b 45 08             	mov    0x8(%ebp),%eax
    420d:	89 04 24             	mov    %eax,(%esp)
    4210:	8b 45 0c             	mov    0xc(%ebp),%eax
    4213:	89 44 24 04          	mov    %eax,0x4(%esp)
    4217:	8b 45 10             	mov    0x10(%ebp),%eax
    421a:	89 44 24 08          	mov    %eax,0x8(%esp)
    421e:	e8 6e fd ff ff       	call   3f91 <put_ascii>
	}
}
    4223:	83 c4 34             	add    $0x34,%esp
    4226:	5b                   	pop    %ebx
    4227:	5d                   	pop    %ebp
    4228:	c3                   	ret    

00004229 <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    4229:	55                   	push   %ebp
    422a:	89 e5                	mov    %esp,%ebp
    422c:	83 ec 38             	sub    $0x38,%esp
    422f:	8b 45 18             	mov    0x18(%ebp),%eax
    4232:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    4236:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    423d:	8b 45 14             	mov    0x14(%ebp),%eax
    4240:	89 04 24             	mov    %eax,(%esp)
    4243:	e8 cf 15 00 00       	call   5817 <strlen>
    4248:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    424b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4252:	8b 45 1c             	mov    0x1c(%ebp),%eax
    4255:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4258:	eb 49                	jmp    42a3 <puts_str+0x7a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    425a:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    425e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    4261:	8b 45 14             	mov    0x14(%ebp),%eax
    4264:	01 c8                	add    %ecx,%eax
    4266:	0f b6 00             	movzbl (%eax),%eax
    4269:	0f b6 c0             	movzbl %al,%eax
    426c:	8b 4d 20             	mov    0x20(%ebp),%ecx
    426f:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    4273:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    4276:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    427a:	89 54 24 10          	mov    %edx,0x10(%esp)
    427e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4282:	8b 45 08             	mov    0x8(%ebp),%eax
    4285:	89 04 24             	mov    %eax,(%esp)
    4288:	8b 45 0c             	mov    0xc(%ebp),%eax
    428b:	89 44 24 04          	mov    %eax,0x4(%esp)
    428f:	8b 45 10             	mov    0x10(%ebp),%eax
    4292:	89 44 24 08          	mov    %eax,0x8(%esp)
    4296:	e8 f6 fc ff ff       	call   3f91 <put_ascii>
			xTmp += 8;
    429b:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    429f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    42a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    42a6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    42a9:	72 af                	jb     425a <puts_str+0x31>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    42ab:	c9                   	leave  
    42ac:	c3                   	ret    

000042ad <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    42ad:	55                   	push   %ebp
    42ae:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    42b0:	8b 45 10             	mov    0x10(%ebp),%eax
    42b3:	8d 50 07             	lea    0x7(%eax),%edx
    42b6:	85 c0                	test   %eax,%eax
    42b8:	0f 48 c2             	cmovs  %edx,%eax
    42bb:	c1 f8 03             	sar    $0x3,%eax
    42be:	89 c2                	mov    %eax,%edx
    42c0:	8b 45 0c             	mov    0xc(%ebp),%eax
    42c3:	8d 48 03             	lea    0x3(%eax),%ecx
    42c6:	85 c0                	test   %eax,%eax
    42c8:	0f 48 c1             	cmovs  %ecx,%eax
    42cb:	c1 f8 02             	sar    $0x2,%eax
    42ce:	c1 e0 05             	shl    $0x5,%eax
    42d1:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    42d4:	8b 45 08             	mov    0x8(%ebp),%eax
    42d7:	8d 50 07             	lea    0x7(%eax),%edx
    42da:	85 c0                	test   %eax,%eax
    42dc:	0f 48 c2             	cmovs  %edx,%eax
    42df:	c1 f8 03             	sar    $0x3,%eax
    42e2:	c1 e0 0b             	shl    $0xb,%eax
    42e5:	01 c8                	add    %ecx,%eax
}
    42e7:	5d                   	pop    %ebp
    42e8:	c3                   	ret    

000042e9 <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    42e9:	55                   	push   %ebp
    42ea:	89 e5                	mov    %esp,%ebp
    42ec:	53                   	push   %ebx
    42ed:	83 ec 28             	sub    $0x28,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    42f0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    42f7:	e9 b1 00 00 00       	jmp    43ad <draw_picture+0xc4>
	{
		for (j = 0; j < pic.width; j++)
    42fc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4303:	e9 95 00 00 00       	jmp    439d <draw_picture+0xb4>
		{
			rgb = pic.data[i*pic.width+j];
    4308:	8b 55 14             	mov    0x14(%ebp),%edx
    430b:	8b 45 18             	mov    0x18(%ebp),%eax
    430e:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    4312:	89 c1                	mov    %eax,%ecx
    4314:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4317:	01 c8                	add    %ecx,%eax
    4319:	c1 e0 02             	shl    $0x2,%eax
    431c:	01 d0                	add    %edx,%eax
    431e:	8b 00                	mov    (%eax),%eax
    4320:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    4323:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    4327:	3c 01                	cmp    $0x1,%al
    4329:	75 02                	jne    432d <draw_picture+0x44>
    432b:	eb 6c                	jmp    4399 <draw_picture+0xb0>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    432d:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    4331:	0f b6 c8             	movzbl %al,%ecx
    4334:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4338:	0f b6 d0             	movzbl %al,%edx
    433b:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    433f:	0f b6 c0             	movzbl %al,%eax
    4342:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    4346:	89 54 24 04          	mov    %edx,0x4(%esp)
    434a:	89 04 24             	mov    %eax,(%esp)
    434d:	e8 5b ff ff ff       	call   42ad <_RGB16BIT565>
    4352:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    4356:	0f b7 4d f2          	movzwl -0xe(%ebp),%ecx
    435a:	8b 45 1c             	mov    0x1c(%ebp),%eax
    435d:	83 e8 01             	sub    $0x1,%eax
    4360:	2b 45 f8             	sub    -0x8(%ebp),%eax
    4363:	89 c2                	mov    %eax,%edx
    4365:	8b 45 24             	mov    0x24(%ebp),%eax
    4368:	01 d0                	add    %edx,%eax
    436a:	89 c2                	mov    %eax,%edx
    436c:	8b 45 20             	mov    0x20(%ebp),%eax
    436f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    4372:	01 d8                	add    %ebx,%eax
    4374:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    4378:	89 54 24 10          	mov    %edx,0x10(%esp)
    437c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4380:	8b 45 08             	mov    0x8(%ebp),%eax
    4383:	89 04 24             	mov    %eax,(%esp)
    4386:	8b 45 0c             	mov    0xc(%ebp),%eax
    4389:	89 44 24 04          	mov    %eax,0x4(%esp)
    438d:	8b 45 10             	mov    0x10(%ebp),%eax
    4390:	89 44 24 08          	mov    %eax,0x8(%esp)
    4394:	e8 72 f8 ff ff       	call   3c0b <draw_point>
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    4399:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    439d:	8b 45 18             	mov    0x18(%ebp),%eax
    43a0:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    43a3:	0f 8f 5f ff ff ff    	jg     4308 <draw_picture+0x1f>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    43a9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    43ad:	8b 45 1c             	mov    0x1c(%ebp),%eax
    43b0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    43b3:	0f 8f 43 ff ff ff    	jg     42fc <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    43b9:	83 c4 28             	add    $0x28,%esp
    43bc:	5b                   	pop    %ebx
    43bd:	5d                   	pop    %ebp
    43be:	c3                   	ret    

000043bf <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    43bf:	55                   	push   %ebp
    43c0:	89 e5                	mov    %esp,%ebp
    43c2:	83 ec 3c             	sub    $0x3c,%esp
    43c5:	8b 45 24             	mov    0x24(%ebp),%eax
    43c8:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    43cc:	8b 45 14             	mov    0x14(%ebp),%eax
    43cf:	8b 55 1c             	mov    0x1c(%ebp),%edx
    43d2:	29 c2                	sub    %eax,%edx
    43d4:	89 d0                	mov    %edx,%eax
    43d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    43d9:	8b 45 18             	mov    0x18(%ebp),%eax
    43dc:	8b 55 20             	mov    0x20(%ebp),%edx
    43df:	29 c2                	sub    %eax,%edx
    43e1:	89 d0                	mov    %edx,%eax
    43e3:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    43e6:	8b 45 14             	mov    0x14(%ebp),%eax
    43e9:	c1 e0 0a             	shl    $0xa,%eax
    43ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    43ef:	8b 45 18             	mov    0x18(%ebp),%eax
    43f2:	c1 e0 0a             	shl    $0xa,%eax
    43f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    43f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    43fb:	c1 f8 1f             	sar    $0x1f,%eax
    43fe:	31 45 fc             	xor    %eax,-0x4(%ebp)
    4401:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    4404:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4407:	c1 f8 1f             	sar    $0x1f,%eax
    440a:	31 45 f8             	xor    %eax,-0x8(%ebp)
    440d:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    4410:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4413:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4416:	7c 57                	jl     446f <draw_line+0xb0>
		len = dx + 1;
    4418:	8b 45 fc             	mov    -0x4(%ebp),%eax
    441b:	83 c0 01             	add    $0x1,%eax
    441e:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    4421:	8b 45 1c             	mov    0x1c(%ebp),%eax
    4424:	3b 45 14             	cmp    0x14(%ebp),%eax
    4427:	7e 07                	jle    4430 <draw_line+0x71>
    4429:	b8 00 04 00 00       	mov    $0x400,%eax
    442e:	eb 05                	jmp    4435 <draw_line+0x76>
    4430:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    4435:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    4438:	8b 45 20             	mov    0x20(%ebp),%eax
    443b:	3b 45 18             	cmp    0x18(%ebp),%eax
    443e:	7c 16                	jl     4456 <draw_line+0x97>
    4440:	8b 45 18             	mov    0x18(%ebp),%eax
    4443:	8b 55 20             	mov    0x20(%ebp),%edx
    4446:	29 c2                	sub    %eax,%edx
    4448:	89 d0                	mov    %edx,%eax
    444a:	83 c0 01             	add    $0x1,%eax
    444d:	c1 e0 0a             	shl    $0xa,%eax
    4450:	99                   	cltd   
    4451:	f7 7d ec             	idivl  -0x14(%ebp)
    4454:	eb 14                	jmp    446a <draw_line+0xab>
    4456:	8b 45 18             	mov    0x18(%ebp),%eax
    4459:	8b 55 20             	mov    0x20(%ebp),%edx
    445c:	29 c2                	sub    %eax,%edx
    445e:	89 d0                	mov    %edx,%eax
    4460:	83 e8 01             	sub    $0x1,%eax
    4463:	c1 e0 0a             	shl    $0xa,%eax
    4466:	99                   	cltd   
    4467:	f7 7d ec             	idivl  -0x14(%ebp)
    446a:	89 45 f8             	mov    %eax,-0x8(%ebp)
    446d:	eb 55                	jmp    44c4 <draw_line+0x105>
	}
	else {
		len = dy + 1;
    446f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4472:	83 c0 01             	add    $0x1,%eax
    4475:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    4478:	8b 45 20             	mov    0x20(%ebp),%eax
    447b:	3b 45 18             	cmp    0x18(%ebp),%eax
    447e:	7e 07                	jle    4487 <draw_line+0xc8>
    4480:	b8 00 04 00 00       	mov    $0x400,%eax
    4485:	eb 05                	jmp    448c <draw_line+0xcd>
    4487:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    448c:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    448f:	8b 45 1c             	mov    0x1c(%ebp),%eax
    4492:	3b 45 14             	cmp    0x14(%ebp),%eax
    4495:	7c 16                	jl     44ad <draw_line+0xee>
    4497:	8b 45 14             	mov    0x14(%ebp),%eax
    449a:	8b 55 1c             	mov    0x1c(%ebp),%edx
    449d:	29 c2                	sub    %eax,%edx
    449f:	89 d0                	mov    %edx,%eax
    44a1:	83 c0 01             	add    $0x1,%eax
    44a4:	c1 e0 0a             	shl    $0xa,%eax
    44a7:	99                   	cltd   
    44a8:	f7 7d ec             	idivl  -0x14(%ebp)
    44ab:	eb 14                	jmp    44c1 <draw_line+0x102>
    44ad:	8b 45 14             	mov    0x14(%ebp),%eax
    44b0:	8b 55 1c             	mov    0x1c(%ebp),%edx
    44b3:	29 c2                	sub    %eax,%edx
    44b5:	89 d0                	mov    %edx,%eax
    44b7:	83 e8 01             	sub    $0x1,%eax
    44ba:	c1 e0 0a             	shl    $0xa,%eax
    44bd:	99                   	cltd   
    44be:	f7 7d ec             	idivl  -0x14(%ebp)
    44c1:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    44c4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    44cb:	eb 47                	jmp    4514 <draw_line+0x155>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    44cd:	0f b7 4d dc          	movzwl -0x24(%ebp),%ecx
    44d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    44d4:	c1 f8 0a             	sar    $0xa,%eax
    44d7:	89 c2                	mov    %eax,%edx
    44d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44dc:	c1 f8 0a             	sar    $0xa,%eax
    44df:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    44e3:	89 54 24 10          	mov    %edx,0x10(%esp)
    44e7:	89 44 24 0c          	mov    %eax,0xc(%esp)
    44eb:	8b 45 08             	mov    0x8(%ebp),%eax
    44ee:	89 04 24             	mov    %eax,(%esp)
    44f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    44f4:	89 44 24 04          	mov    %eax,0x4(%esp)
    44f8:	8b 45 10             	mov    0x10(%ebp),%eax
    44fb:	89 44 24 08          	mov    %eax,0x8(%esp)
    44ff:	e8 07 f7 ff ff       	call   3c0b <draw_point>
		y += dy;
    4504:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4507:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    450a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    450d:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    4510:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    4514:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4517:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    451a:	7c b1                	jl     44cd <draw_line+0x10e>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    451c:	c9                   	leave  
    451d:	c3                   	ret    

0000451e <draw_window>:

void
draw_window(Context c, char *title)
{
    451e:	55                   	push   %ebp
    451f:	89 e5                	mov    %esp,%ebp
    4521:	83 ec 38             	sub    $0x38,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    4524:	8b 45 0c             	mov    0xc(%ebp),%eax
    4527:	83 e8 01             	sub    $0x1,%eax
    452a:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    4531:	00 
    4532:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    4539:	00 
    453a:	89 44 24 14          	mov    %eax,0x14(%esp)
    453e:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    4545:	00 
    4546:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    454d:	00 
    454e:	8b 45 08             	mov    0x8(%ebp),%eax
    4551:	89 04 24             	mov    %eax,(%esp)
    4554:	8b 45 0c             	mov    0xc(%ebp),%eax
    4557:	89 44 24 04          	mov    %eax,0x4(%esp)
    455b:	8b 45 10             	mov    0x10(%ebp),%eax
    455e:	89 44 24 08          	mov    %eax,0x8(%esp)
    4562:	e8 58 fe ff ff       	call   43bf <draw_line>
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    4567:	8b 45 10             	mov    0x10(%ebp),%eax
    456a:	8d 48 ff             	lea    -0x1(%eax),%ecx
    456d:	8b 45 0c             	mov    0xc(%ebp),%eax
    4570:	8d 50 ff             	lea    -0x1(%eax),%edx
    4573:	8b 45 0c             	mov    0xc(%ebp),%eax
    4576:	83 e8 01             	sub    $0x1,%eax
    4579:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    4580:	00 
    4581:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    4585:	89 54 24 14          	mov    %edx,0x14(%esp)
    4589:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    4590:	00 
    4591:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4595:	8b 45 08             	mov    0x8(%ebp),%eax
    4598:	89 04 24             	mov    %eax,(%esp)
    459b:	8b 45 0c             	mov    0xc(%ebp),%eax
    459e:	89 44 24 04          	mov    %eax,0x4(%esp)
    45a2:	8b 45 10             	mov    0x10(%ebp),%eax
    45a5:	89 44 24 08          	mov    %eax,0x8(%esp)
    45a9:	e8 11 fe ff ff       	call   43bf <draw_line>
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    45ae:	8b 45 10             	mov    0x10(%ebp),%eax
    45b1:	8d 48 ff             	lea    -0x1(%eax),%ecx
    45b4:	8b 45 10             	mov    0x10(%ebp),%eax
    45b7:	8d 50 ff             	lea    -0x1(%eax),%edx
    45ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    45bd:	83 e8 01             	sub    $0x1,%eax
    45c0:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    45c7:	00 
    45c8:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    45cc:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    45d3:	00 
    45d4:	89 54 24 10          	mov    %edx,0x10(%esp)
    45d8:	89 44 24 0c          	mov    %eax,0xc(%esp)
    45dc:	8b 45 08             	mov    0x8(%ebp),%eax
    45df:	89 04 24             	mov    %eax,(%esp)
    45e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    45e5:	89 44 24 04          	mov    %eax,0x4(%esp)
    45e9:	8b 45 10             	mov    0x10(%ebp),%eax
    45ec:	89 44 24 08          	mov    %eax,0x8(%esp)
    45f0:	e8 ca fd ff ff       	call   43bf <draw_line>
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    45f5:	8b 45 10             	mov    0x10(%ebp),%eax
    45f8:	83 e8 01             	sub    $0x1,%eax
    45fb:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    4602:	00 
    4603:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    460a:	00 
    460b:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    4612:	00 
    4613:	89 44 24 10          	mov    %eax,0x10(%esp)
    4617:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    461e:	00 
    461f:	8b 45 08             	mov    0x8(%ebp),%eax
    4622:	89 04 24             	mov    %eax,(%esp)
    4625:	8b 45 0c             	mov    0xc(%ebp),%eax
    4628:	89 44 24 04          	mov    %eax,0x4(%esp)
    462c:	8b 45 10             	mov    0x10(%ebp),%eax
    462f:	89 44 24 08          	mov    %eax,0x8(%esp)
    4633:	e8 87 fd ff ff       	call   43bf <draw_line>
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    4638:	8b 45 0c             	mov    0xc(%ebp),%eax
    463b:	83 e8 02             	sub    $0x2,%eax
    463e:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    4645:	00 
    4646:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    464d:	00 
    464e:	89 44 24 14          	mov    %eax,0x14(%esp)
    4652:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    4659:	00 
    465a:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    4661:	00 
    4662:	8b 45 08             	mov    0x8(%ebp),%eax
    4665:	89 04 24             	mov    %eax,(%esp)
    4668:	8b 45 0c             	mov    0xc(%ebp),%eax
    466b:	89 44 24 04          	mov    %eax,0x4(%esp)
    466f:	8b 45 10             	mov    0x10(%ebp),%eax
    4672:	89 44 24 08          	mov    %eax,0x8(%esp)
    4676:	e8 cf f5 ff ff       	call   3c4a <fill_rect>
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    467b:	8b 45 0c             	mov    0xc(%ebp),%eax
    467e:	83 e8 02             	sub    $0x2,%eax
    4681:	89 c2                	mov    %eax,%edx
    4683:	8b 45 10             	mov    0x10(%ebp),%eax
    4686:	83 e8 15             	sub    $0x15,%eax
    4689:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    4690:	00 
    4691:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    4698:	00 
    4699:	89 54 24 14          	mov    %edx,0x14(%esp)
    469d:	89 44 24 10          	mov    %eax,0x10(%esp)
    46a1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    46a8:	00 
    46a9:	8b 45 08             	mov    0x8(%ebp),%eax
    46ac:	89 04 24             	mov    %eax,(%esp)
    46af:	8b 45 0c             	mov    0xc(%ebp),%eax
    46b2:	89 44 24 04          	mov    %eax,0x4(%esp)
    46b6:	8b 45 10             	mov    0x10(%ebp),%eax
    46b9:	89 44 24 08          	mov    %eax,0x8(%esp)
    46bd:	e8 88 f5 ff ff       	call   3c4a <fill_rect>

  loadBitmap(&pic, "close.bmp");
    46c2:	c7 44 24 04 e3 c6 00 	movl   $0xc6e3,0x4(%esp)
    46c9:	00 
    46ca:	8d 45 ec             	lea    -0x14(%ebp),%eax
    46cd:	89 04 24             	mov    %eax,(%esp)
    46d0:	e8 44 01 00 00       	call   4819 <loadBitmap>
  draw_picture(c, pic, 3, 3);
    46d5:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
    46dc:	00 
    46dd:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
    46e4:	00 
    46e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    46e8:	89 44 24 0c          	mov    %eax,0xc(%esp)
    46ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
    46ef:	89 44 24 10          	mov    %eax,0x10(%esp)
    46f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    46f6:	89 44 24 14          	mov    %eax,0x14(%esp)
    46fa:	8b 45 08             	mov    0x8(%ebp),%eax
    46fd:	89 04 24             	mov    %eax,(%esp)
    4700:	8b 45 0c             	mov    0xc(%ebp),%eax
    4703:	89 44 24 04          	mov    %eax,0x4(%esp)
    4707:	8b 45 10             	mov    0x10(%ebp),%eax
    470a:	89 44 24 08          	mov    %eax,0x8(%esp)
    470e:	e8 d6 fb ff ff       	call   42e9 <draw_picture>
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    4713:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
    471a:	00 
    471b:	c7 44 24 14 19 00 00 	movl   $0x19,0x14(%esp)
    4722:	00 
    4723:	c7 44 24 10 ff ff 00 	movl   $0xffff,0x10(%esp)
    472a:	00 
    472b:	8b 45 14             	mov    0x14(%ebp),%eax
    472e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4732:	8b 45 08             	mov    0x8(%ebp),%eax
    4735:	89 04 24             	mov    %eax,(%esp)
    4738:	8b 45 0c             	mov    0xc(%ebp),%eax
    473b:	89 44 24 04          	mov    %eax,0x4(%esp)
    473f:	8b 45 10             	mov    0x10(%ebp),%eax
    4742:	89 44 24 08          	mov    %eax,0x8(%esp)
    4746:	e8 de fa ff ff       	call   4229 <puts_str>
  freepic(&pic);
    474b:	8d 45 ec             	lea    -0x14(%ebp),%eax
    474e:	89 04 24             	mov    %eax,(%esp)
    4751:	e8 6f 06 00 00       	call   4dc5 <freepic>
}
    4756:	c9                   	leave  
    4757:	c3                   	ret    

00004758 <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    4758:	55                   	push   %ebp
    4759:	89 e5                	mov    %esp,%ebp
    475b:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < len; i++)
    475e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4765:	eb 29                	jmp    4790 <load_iconlist+0x38>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    4767:	8b 45 f4             	mov    -0xc(%ebp),%eax
    476a:	6b d0 34             	imul   $0x34,%eax,%edx
    476d:	8b 45 08             	mov    0x8(%ebp),%eax
    4770:	01 d0                	add    %edx,%eax
    4772:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4775:	6b ca 34             	imul   $0x34,%edx,%ecx
    4778:	8b 55 08             	mov    0x8(%ebp),%edx
    477b:	01 ca                	add    %ecx,%edx
    477d:	83 c2 28             	add    $0x28,%edx
    4780:	89 44 24 04          	mov    %eax,0x4(%esp)
    4784:	89 14 24             	mov    %edx,(%esp)
    4787:	e8 8d 00 00 00       	call   4819 <loadBitmap>
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    478c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4790:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4793:	3b 45 0c             	cmp    0xc(%ebp),%eax
    4796:	7c cf                	jl     4767 <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    4798:	c9                   	leave  
    4799:	c3                   	ret    

0000479a <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    479a:	55                   	push   %ebp
    479b:	89 e5                	mov    %esp,%ebp
    479d:	53                   	push   %ebx
    479e:	83 ec 30             	sub    $0x30,%esp
    int i;
    for (i = 0; i < len; i++)
    47a1:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    47a8:	eb 61                	jmp    480b <draw_iconlist+0x71>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    47aa:	8b 45 f8             	mov    -0x8(%ebp),%eax
    47ad:	6b d0 34             	imul   $0x34,%eax,%edx
    47b0:	8b 45 14             	mov    0x14(%ebp),%eax
    47b3:	01 d0                	add    %edx,%eax
    47b5:	8b 48 24             	mov    0x24(%eax),%ecx
    47b8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    47bb:	6b d0 34             	imul   $0x34,%eax,%edx
    47be:	8b 45 14             	mov    0x14(%ebp),%eax
    47c1:	01 d0                	add    %edx,%eax
    47c3:	8b 50 20             	mov    0x20(%eax),%edx
    47c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    47c9:	6b d8 34             	imul   $0x34,%eax,%ebx
    47cc:	8b 45 14             	mov    0x14(%ebp),%eax
    47cf:	01 d8                	add    %ebx,%eax
    47d1:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    47d5:	89 54 24 18          	mov    %edx,0x18(%esp)
    47d9:	8b 50 28             	mov    0x28(%eax),%edx
    47dc:	89 54 24 0c          	mov    %edx,0xc(%esp)
    47e0:	8b 50 2c             	mov    0x2c(%eax),%edx
    47e3:	89 54 24 10          	mov    %edx,0x10(%esp)
    47e7:	8b 40 30             	mov    0x30(%eax),%eax
    47ea:	89 44 24 14          	mov    %eax,0x14(%esp)
    47ee:	8b 45 08             	mov    0x8(%ebp),%eax
    47f1:	89 04 24             	mov    %eax,(%esp)
    47f4:	8b 45 0c             	mov    0xc(%ebp),%eax
    47f7:	89 44 24 04          	mov    %eax,0x4(%esp)
    47fb:	8b 45 10             	mov    0x10(%ebp),%eax
    47fe:	89 44 24 08          	mov    %eax,0x8(%esp)
    4802:	e8 e2 fa ff ff       	call   42e9 <draw_picture>
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    4807:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    480b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    480e:	3b 45 18             	cmp    0x18(%ebp),%eax
    4811:	7c 97                	jl     47aa <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    4813:	83 c4 30             	add    $0x30,%esp
    4816:	5b                   	pop    %ebx
    4817:	5d                   	pop    %ebp
    4818:	c3                   	ret    

00004819 <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    4819:	55                   	push   %ebp
    481a:	89 e5                	mov    %esp,%ebp
    481c:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    4822:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    4829:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4830:	00 
    4831:	8b 45 0c             	mov    0xc(%ebp),%eax
    4834:	89 04 24             	mov    %eax,(%esp)
    4837:	e8 ef 11 00 00       	call   5a2b <open>
    483c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    483f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    4843:	79 20                	jns    4865 <loadBitmap+0x4c>
		printf(0, "cannot open %s\n", pic_name);
    4845:	8b 45 0c             	mov    0xc(%ebp),%eax
    4848:	89 44 24 08          	mov    %eax,0x8(%esp)
    484c:	c7 44 24 04 f0 c6 00 	movl   $0xc6f0,0x4(%esp)
    4853:	00 
    4854:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    485b:	e8 73 13 00 00       	call   5bd3 <printf>
		return;
    4860:	e9 ef 02 00 00       	jmp    4b54 <loadBitmap+0x33b>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    4865:	8b 45 0c             	mov    0xc(%ebp),%eax
    4868:	89 44 24 08          	mov    %eax,0x8(%esp)
    486c:	c7 44 24 04 00 c7 00 	movl   $0xc700,0x4(%esp)
    4873:	00 
    4874:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    487b:	e8 53 13 00 00       	call   5bd3 <printf>
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    4880:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    4887:	e8 33 16 00 00       	call   5ebf <malloc>
    488c:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    488f:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
    4896:	00 
    4897:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    489a:	89 44 24 04          	mov    %eax,0x4(%esp)
    489e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    48a1:	89 04 24             	mov    %eax,(%esp)
    48a4:	e8 5a 11 00 00       	call   5a03 <read>
    48a9:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    48ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    48af:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    48b2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    48b5:	0f b7 00             	movzwl (%eax),%eax
    48b8:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    48bc:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    48c0:	66 3d 42 4d          	cmp    $0x4d42,%ax
    48c4:	74 19                	je     48df <loadBitmap+0xc6>
		printf(0, "file is not .bmp file!");
    48c6:	c7 44 24 04 14 c7 00 	movl   $0xc714,0x4(%esp)
    48cd:	00 
    48ce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    48d5:	e8 f9 12 00 00       	call   5bd3 <printf>
		return;
    48da:	e9 75 02 00 00       	jmp    4b54 <loadBitmap+0x33b>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    48df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    48e2:	83 c0 02             	add    $0x2,%eax
    48e5:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    48e8:	8b 45 d8             	mov    -0x28(%ebp),%eax
    48eb:	8b 00                	mov    (%eax),%eax
    48ed:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    48f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    48f3:	83 c0 06             	add    $0x6,%eax
    48f6:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    48f9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    48fc:	0f b7 00             	movzwl (%eax),%eax
    48ff:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    4903:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4906:	83 c0 08             	add    $0x8,%eax
    4909:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    490c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    490f:	0f b7 00             	movzwl (%eax),%eax
    4912:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    4916:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4919:	83 c0 0a             	add    $0xa,%eax
    491c:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    491f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4922:	8b 00                	mov    (%eax),%eax
    4924:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    4927:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    492e:	00 
    492f:	8d 45 84             	lea    -0x7c(%ebp),%eax
    4932:	89 44 24 04          	mov    %eax,0x4(%esp)
    4936:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4939:	89 04 24             	mov    %eax,(%esp)
    493c:	e8 c2 10 00 00       	call   5a03 <read>
	width = bitInfoHead.biWidth;
    4941:	8b 45 88             	mov    -0x78(%ebp),%eax
    4944:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    4947:	8b 45 8c             	mov    -0x74(%ebp),%eax
    494a:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    494d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4950:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    4954:	c1 e0 02             	shl    $0x2,%eax
    4957:	89 44 24 10          	mov    %eax,0x10(%esp)
    495b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    495e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4962:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4965:	89 44 24 08          	mov    %eax,0x8(%esp)
    4969:	c7 44 24 04 2c c7 00 	movl   $0xc72c,0x4(%esp)
    4970:	00 
    4971:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4978:	e8 56 12 00 00       	call   5bd3 <printf>
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    497d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    4981:	75 14                	jne    4997 <loadBitmap+0x17e>
		printf(0, "0");
    4983:	c7 44 24 04 51 c7 00 	movl   $0xc751,0x4(%esp)
    498a:	00 
    498b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4992:	e8 3c 12 00 00       	call   5bd3 <printf>
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    4997:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    499b:	0f b7 c0             	movzwl %ax,%eax
    499e:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    49a2:	83 c0 1f             	add    $0x1f,%eax
    49a5:	8d 50 1f             	lea    0x1f(%eax),%edx
    49a8:	85 c0                	test   %eax,%eax
    49aa:	0f 48 c2             	cmovs  %edx,%eax
    49ad:	c1 f8 05             	sar    $0x5,%eax
    49b0:	c1 e0 02             	shl    $0x2,%eax
    49b3:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    49b6:	8b 45 d0             	mov    -0x30(%ebp),%eax
    49b9:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    49bd:	89 04 24             	mov    %eax,(%esp)
    49c0:	e8 fa 14 00 00       	call   5ebf <malloc>
    49c5:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    49c8:	8b 55 d0             	mov    -0x30(%ebp),%edx
    49cb:	8b 45 cc             	mov    -0x34(%ebp),%eax
    49ce:	0f af c2             	imul   %edx,%eax
    49d1:	89 44 24 08          	mov    %eax,0x8(%esp)
    49d5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    49dc:	00 
    49dd:	8b 45 c8             	mov    -0x38(%ebp),%eax
    49e0:	89 04 24             	mov    %eax,(%esp)
    49e3:	e8 56 0e 00 00       	call   583e <memset>
	long nData = height * l_width;
    49e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    49eb:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    49ef:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    49f2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    49f5:	89 44 24 08          	mov    %eax,0x8(%esp)
    49f9:	8b 45 c8             	mov    -0x38(%ebp),%eax
    49fc:	89 44 24 04          	mov    %eax,0x4(%esp)
    4a00:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4a03:	89 04 24             	mov    %eax,(%esp)
    4a06:	e8 f8 0f 00 00       	call   5a03 <read>

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    4a0b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4a0e:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    4a12:	c1 e0 02             	shl    $0x2,%eax
    4a15:	89 04 24             	mov    %eax,(%esp)
    4a18:	e8 a2 14 00 00       	call   5ebf <malloc>
    4a1d:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    4a20:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    4a23:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4a26:	0f af c2             	imul   %edx,%eax
    4a29:	c1 e0 02             	shl    $0x2,%eax
    4a2c:	89 44 24 08          	mov    %eax,0x8(%esp)
    4a30:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4a37:	00 
    4a38:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4a3b:	89 04 24             	mov    %eax,(%esp)
    4a3e:	e8 fb 0d 00 00       	call   583e <memset>
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    4a43:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    4a47:	66 83 f8 17          	cmp    $0x17,%ax
    4a4b:	77 19                	ja     4a66 <loadBitmap+0x24d>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    4a4d:	c7 44 24 04 54 c7 00 	movl   $0xc754,0x4(%esp)
    4a54:	00 
    4a55:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4a5c:	e8 72 11 00 00       	call   5bd3 <printf>
		return;
    4a61:	e9 ee 00 00 00       	jmp    4b54 <loadBitmap+0x33b>
	} else	//位图为24位真彩色
	{
		index = 0;
    4a66:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    4a6d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4a74:	e9 94 00 00 00       	jmp    4b0d <loadBitmap+0x2f4>
			for (j = 0; j < width; j++) {
    4a79:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4a80:	eb 7b                	jmp    4afd <loadBitmap+0x2e4>
				k = i * l_width + j * 3;
    4a82:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a85:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    4a89:	89 c1                	mov    %eax,%ecx
    4a8b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4a8e:	89 d0                	mov    %edx,%eax
    4a90:	01 c0                	add    %eax,%eax
    4a92:	01 d0                	add    %edx,%eax
    4a94:	01 c8                	add    %ecx,%eax
    4a96:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    4a99:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4a9c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    4aa3:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4aa6:	01 c2                	add    %eax,%edx
    4aa8:	8b 45 bc             	mov    -0x44(%ebp),%eax
    4aab:	8d 48 02             	lea    0x2(%eax),%ecx
    4aae:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4ab1:	01 c8                	add    %ecx,%eax
    4ab3:	0f b6 00             	movzbl (%eax),%eax
    4ab6:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    4ab9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4abc:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    4ac3:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4ac6:	01 c2                	add    %eax,%edx
    4ac8:	8b 45 bc             	mov    -0x44(%ebp),%eax
    4acb:	8d 48 01             	lea    0x1(%eax),%ecx
    4ace:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4ad1:	01 c8                	add    %ecx,%eax
    4ad3:	0f b6 00             	movzbl (%eax),%eax
    4ad6:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    4ad9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4adc:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    4ae3:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4ae6:	01 c2                	add    %eax,%edx
    4ae8:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    4aeb:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4aee:	01 c8                	add    %ecx,%eax
    4af0:	0f b6 00             	movzbl (%eax),%eax
    4af3:	88 02                	mov    %al,(%edx)
				index++;
    4af5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    4af9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4afd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4b00:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    4b03:	0f 8c 79 ff ff ff    	jl     4a82 <loadBitmap+0x269>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    4b09:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4b0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4b10:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    4b13:	0f 8c 60 ff ff ff    	jl     4a79 <loadBitmap+0x260>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    4b19:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4b1c:	89 04 24             	mov    %eax,(%esp)
    4b1f:	e8 ef 0e 00 00       	call   5a13 <close>

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    4b24:	8b 45 08             	mov    0x8(%ebp),%eax
    4b27:	8b 55 c0             	mov    -0x40(%ebp),%edx
    4b2a:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    4b2c:	8b 45 08             	mov    0x8(%ebp),%eax
    4b2f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    4b32:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    4b35:	8b 45 08             	mov    0x8(%ebp),%eax
    4b38:	8b 55 d0             	mov    -0x30(%ebp),%edx
    4b3b:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    4b3e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4b41:	89 04 24             	mov    %eax,(%esp)
    4b44:	e8 3d 12 00 00       	call   5d86 <free>
	free(BmpFileHeader);
    4b49:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4b4c:	89 04 24             	mov    %eax,(%esp)
    4b4f:	e8 32 12 00 00       	call   5d86 <free>
	//printf("\n");
}
    4b54:	c9                   	leave  
    4b55:	c3                   	ret    

00004b56 <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    4b56:	55                   	push   %ebp
    4b57:	89 e5                	mov    %esp,%ebp
    4b59:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图文件头:\n");
    4b5c:	c7 44 24 04 74 c7 00 	movl   $0xc774,0x4(%esp)
    4b63:	00 
    4b64:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4b6b:	e8 63 10 00 00       	call   5bd3 <printf>
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    4b70:	8b 45 08             	mov    0x8(%ebp),%eax
    4b73:	0f b7 00             	movzwl (%eax),%eax
    4b76:	0f b7 c0             	movzwl %ax,%eax
    4b79:	89 44 24 08          	mov    %eax,0x8(%esp)
    4b7d:	c7 44 24 04 86 c7 00 	movl   $0xc786,0x4(%esp)
    4b84:	00 
    4b85:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4b8c:	e8 42 10 00 00       	call   5bd3 <printf>
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    4b91:	8b 45 08             	mov    0x8(%ebp),%eax
    4b94:	8b 40 04             	mov    0x4(%eax),%eax
    4b97:	89 44 24 08          	mov    %eax,0x8(%esp)
    4b9b:	c7 44 24 04 a4 c7 00 	movl   $0xc7a4,0x4(%esp)
    4ba2:	00 
    4ba3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4baa:	e8 24 10 00 00       	call   5bd3 <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    4baf:	8b 45 08             	mov    0x8(%ebp),%eax
    4bb2:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    4bb6:	0f b7 c0             	movzwl %ax,%eax
    4bb9:	89 44 24 08          	mov    %eax,0x8(%esp)
    4bbd:	c7 44 24 04 b5 c7 00 	movl   $0xc7b5,0x4(%esp)
    4bc4:	00 
    4bc5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4bcc:	e8 02 10 00 00       	call   5bd3 <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    4bd1:	8b 45 08             	mov    0x8(%ebp),%eax
    4bd4:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    4bd8:	0f b7 c0             	movzwl %ax,%eax
    4bdb:	89 44 24 08          	mov    %eax,0x8(%esp)
    4bdf:	c7 44 24 04 b5 c7 00 	movl   $0xc7b5,0x4(%esp)
    4be6:	00 
    4be7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4bee:	e8 e0 0f 00 00       	call   5bd3 <printf>
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    4bf3:	8b 45 08             	mov    0x8(%ebp),%eax
    4bf6:	8b 40 0c             	mov    0xc(%eax),%eax
    4bf9:	89 44 24 08          	mov    %eax,0x8(%esp)
    4bfd:	c7 44 24 04 c4 c7 00 	movl   $0xc7c4,0x4(%esp)
    4c04:	00 
    4c05:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c0c:	e8 c2 0f 00 00       	call   5bd3 <printf>
}
    4c11:	c9                   	leave  
    4c12:	c3                   	ret    

00004c13 <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    4c13:	55                   	push   %ebp
    4c14:	89 e5                	mov    %esp,%ebp
    4c16:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图信息头:\n");
    4c19:	c7 44 24 04 ed c7 00 	movl   $0xc7ed,0x4(%esp)
    4c20:	00 
    4c21:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c28:	e8 a6 0f 00 00       	call   5bd3 <printf>
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    4c2d:	8b 45 08             	mov    0x8(%ebp),%eax
    4c30:	8b 00                	mov    (%eax),%eax
    4c32:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c36:	c7 44 24 04 ff c7 00 	movl   $0xc7ff,0x4(%esp)
    4c3d:	00 
    4c3e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c45:	e8 89 0f 00 00       	call   5bd3 <printf>
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    4c4a:	8b 45 08             	mov    0x8(%ebp),%eax
    4c4d:	8b 40 04             	mov    0x4(%eax),%eax
    4c50:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c54:	c7 44 24 04 16 c8 00 	movl   $0xc816,0x4(%esp)
    4c5b:	00 
    4c5c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c63:	e8 6b 0f 00 00       	call   5bd3 <printf>
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    4c68:	8b 45 08             	mov    0x8(%ebp),%eax
    4c6b:	8b 40 08             	mov    0x8(%eax),%eax
    4c6e:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c72:	c7 44 24 04 24 c8 00 	movl   $0xc824,0x4(%esp)
    4c79:	00 
    4c7a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c81:	e8 4d 0f 00 00       	call   5bd3 <printf>
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    4c86:	8b 45 08             	mov    0x8(%ebp),%eax
    4c89:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    4c8d:	0f b7 c0             	movzwl %ax,%eax
    4c90:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c94:	c7 44 24 04 32 c8 00 	movl   $0xc832,0x4(%esp)
    4c9b:	00 
    4c9c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4ca3:	e8 2b 0f 00 00       	call   5bd3 <printf>
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    4ca8:	8b 45 08             	mov    0x8(%ebp),%eax
    4cab:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    4caf:	0f b7 c0             	movzwl %ax,%eax
    4cb2:	89 44 24 08          	mov    %eax,0x8(%esp)
    4cb6:	c7 44 24 04 48 c8 00 	movl   $0xc848,0x4(%esp)
    4cbd:	00 
    4cbe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4cc5:	e8 09 0f 00 00       	call   5bd3 <printf>
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    4cca:	8b 45 08             	mov    0x8(%ebp),%eax
    4ccd:	8b 40 10             	mov    0x10(%eax),%eax
    4cd0:	89 44 24 08          	mov    %eax,0x8(%esp)
    4cd4:	c7 44 24 04 69 c8 00 	movl   $0xc869,0x4(%esp)
    4cdb:	00 
    4cdc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4ce3:	e8 eb 0e 00 00       	call   5bd3 <printf>
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    4ce8:	8b 45 08             	mov    0x8(%ebp),%eax
    4ceb:	8b 40 14             	mov    0x14(%eax),%eax
    4cee:	89 44 24 08          	mov    %eax,0x8(%esp)
    4cf2:	c7 44 24 04 7c c8 00 	movl   $0xc87c,0x4(%esp)
    4cf9:	00 
    4cfa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4d01:	e8 cd 0e 00 00       	call   5bd3 <printf>
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    4d06:	8b 45 08             	mov    0x8(%ebp),%eax
    4d09:	8b 40 18             	mov    0x18(%eax),%eax
    4d0c:	89 44 24 08          	mov    %eax,0x8(%esp)
    4d10:	c7 44 24 04 b0 c8 00 	movl   $0xc8b0,0x4(%esp)
    4d17:	00 
    4d18:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4d1f:	e8 af 0e 00 00       	call   5bd3 <printf>
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    4d24:	8b 45 08             	mov    0x8(%ebp),%eax
    4d27:	8b 40 1c             	mov    0x1c(%eax),%eax
    4d2a:	89 44 24 08          	mov    %eax,0x8(%esp)
    4d2e:	c7 44 24 04 c5 c8 00 	movl   $0xc8c5,0x4(%esp)
    4d35:	00 
    4d36:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4d3d:	e8 91 0e 00 00       	call   5bd3 <printf>
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    4d42:	8b 45 08             	mov    0x8(%ebp),%eax
    4d45:	8b 40 20             	mov    0x20(%eax),%eax
    4d48:	89 44 24 08          	mov    %eax,0x8(%esp)
    4d4c:	c7 44 24 04 da c8 00 	movl   $0xc8da,0x4(%esp)
    4d53:	00 
    4d54:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4d5b:	e8 73 0e 00 00       	call   5bd3 <printf>
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    4d60:	8b 45 08             	mov    0x8(%ebp),%eax
    4d63:	8b 40 24             	mov    0x24(%eax),%eax
    4d66:	89 44 24 08          	mov    %eax,0x8(%esp)
    4d6a:	c7 44 24 04 f1 c8 00 	movl   $0xc8f1,0x4(%esp)
    4d71:	00 
    4d72:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4d79:	e8 55 0e 00 00       	call   5bd3 <printf>
}
    4d7e:	c9                   	leave  
    4d7f:	c3                   	ret    

00004d80 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    4d80:	55                   	push   %ebp
    4d81:	89 e5                	mov    %esp,%ebp
    4d83:	83 ec 28             	sub    $0x28,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    4d86:	8b 45 08             	mov    0x8(%ebp),%eax
    4d89:	0f b6 00             	movzbl (%eax),%eax
    4d8c:	0f b6 c8             	movzbl %al,%ecx
    4d8f:	8b 45 08             	mov    0x8(%ebp),%eax
    4d92:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4d96:	0f b6 d0             	movzbl %al,%edx
    4d99:	8b 45 08             	mov    0x8(%ebp),%eax
    4d9c:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    4da0:	0f b6 c0             	movzbl %al,%eax
    4da3:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4da7:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4dab:	89 44 24 08          	mov    %eax,0x8(%esp)
    4daf:	c7 44 24 04 05 c9 00 	movl   $0xc905,0x4(%esp)
    4db6:	00 
    4db7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4dbe:	e8 10 0e 00 00       	call   5bd3 <printf>
}
    4dc3:	c9                   	leave  
    4dc4:	c3                   	ret    

00004dc5 <freepic>:

void freepic(PICNODE *pic) {
    4dc5:	55                   	push   %ebp
    4dc6:	89 e5                	mov    %esp,%ebp
    4dc8:	83 ec 18             	sub    $0x18,%esp
	free(pic->data);
    4dcb:	8b 45 08             	mov    0x8(%ebp),%eax
    4dce:	8b 00                	mov    (%eax),%eax
    4dd0:	89 04 24             	mov    %eax,(%esp)
    4dd3:	e8 ae 0f 00 00       	call   5d86 <free>
}
    4dd8:	c9                   	leave  
    4dd9:	c3                   	ret    

00004dda <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    4dda:	55                   	push   %ebp
    4ddb:	89 e5                	mov    %esp,%ebp
    4ddd:	53                   	push   %ebx
    4dde:	81 ec 84 00 00 00    	sub    $0x84,%esp
	int W = 15;
    4de4:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    4deb:	8d 45 dc             	lea    -0x24(%ebp),%eax
    4dee:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4df1:	89 54 24 10          	mov    %edx,0x10(%esp)
    4df5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    4df8:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4dfc:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    4e03:	00 
    4e04:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4e0b:	00 
    4e0c:	89 04 24             	mov    %eax,(%esp)
    4e0f:	e8 80 02 00 00       	call   5094 <initRect>
    4e14:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    4e17:	8b 45 08             	mov    0x8(%ebp),%eax
    4e1a:	8b 40 04             	mov    0x4(%eax),%eax
    4e1d:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4e20:	89 c2                	mov    %eax,%edx
    4e22:	8d 45 cc             	lea    -0x34(%ebp),%eax
    4e25:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    4e28:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4e2c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    4e2f:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    4e33:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    4e3a:	00 
    4e3b:	89 54 24 04          	mov    %edx,0x4(%esp)
    4e3f:	89 04 24             	mov    %eax,(%esp)
    4e42:	e8 4d 02 00 00       	call   5094 <initRect>
    4e47:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    4e4a:	8b 45 08             	mov    0x8(%ebp),%eax
    4e4d:	8b 40 08             	mov    0x8(%eax),%eax
    4e50:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4e53:	89 c1                	mov    %eax,%ecx
    4e55:	8b 45 08             	mov    0x8(%ebp),%eax
    4e58:	8b 40 04             	mov    0x4(%eax),%eax
    4e5b:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4e5e:	89 c2                	mov    %eax,%edx
    4e60:	8d 45 bc             	lea    -0x44(%ebp),%eax
    4e63:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    4e66:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    4e6a:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    4e6d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    4e71:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    4e75:	89 54 24 04          	mov    %edx,0x4(%esp)
    4e79:	89 04 24             	mov    %eax,(%esp)
    4e7c:	e8 13 02 00 00       	call   5094 <initRect>
    4e81:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    4e84:	8b 45 08             	mov    0x8(%ebp),%eax
    4e87:	8b 40 08             	mov    0x8(%eax),%eax
    4e8a:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4e8d:	89 c2                	mov    %eax,%edx
    4e8f:	8d 45 ac             	lea    -0x54(%ebp),%eax
    4e92:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    4e95:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4e99:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    4e9c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    4ea0:	89 54 24 08          	mov    %edx,0x8(%esp)
    4ea4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4eab:	00 
    4eac:	89 04 24             	mov    %eax,(%esp)
    4eaf:	e8 e0 01 00 00       	call   5094 <initRect>
    4eb4:	83 ec 04             	sub    $0x4,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    4eb7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4ebe:	e9 96 01 00 00       	jmp    5059 <set_icon_alpha+0x27f>
		for (j = 0; j < pic->height; j++) {
    4ec3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4eca:	e9 77 01 00 00       	jmp    5046 <set_icon_alpha+0x26c>
			p = initPoint(i, j);
    4ecf:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4ed2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4ed5:	89 54 24 08          	mov    %edx,0x8(%esp)
    4ed9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4edc:	89 54 24 04          	mov    %edx,0x4(%esp)
    4ee0:	89 04 24             	mov    %eax,(%esp)
    4ee3:	e8 85 01 00 00       	call   506d <initPoint>
    4ee8:	83 ec 04             	sub    $0x4,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    4eeb:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4eee:	89 44 24 08          	mov    %eax,0x8(%esp)
    4ef2:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4ef5:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4ef9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4efc:	89 44 24 10          	mov    %eax,0x10(%esp)
    4f00:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4f03:	89 44 24 14          	mov    %eax,0x14(%esp)
    4f07:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4f0a:	8b 55 a8             	mov    -0x58(%ebp),%edx
    4f0d:	89 04 24             	mov    %eax,(%esp)
    4f10:	89 54 24 04          	mov    %edx,0x4(%esp)
    4f14:	e8 d6 01 00 00       	call   50ef <isIn>
    4f19:	85 c0                	test   %eax,%eax
    4f1b:	0f 85 9a 00 00 00    	jne    4fbb <set_icon_alpha+0x1e1>
    4f21:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4f24:	89 44 24 08          	mov    %eax,0x8(%esp)
    4f28:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4f2b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4f2f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4f32:	89 44 24 10          	mov    %eax,0x10(%esp)
    4f36:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4f39:	89 44 24 14          	mov    %eax,0x14(%esp)
    4f3d:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4f40:	8b 55 a8             	mov    -0x58(%ebp),%edx
    4f43:	89 04 24             	mov    %eax,(%esp)
    4f46:	89 54 24 04          	mov    %edx,0x4(%esp)
    4f4a:	e8 a0 01 00 00       	call   50ef <isIn>
    4f4f:	85 c0                	test   %eax,%eax
    4f51:	75 68                	jne    4fbb <set_icon_alpha+0x1e1>
    4f53:	8b 45 bc             	mov    -0x44(%ebp),%eax
    4f56:	89 44 24 08          	mov    %eax,0x8(%esp)
    4f5a:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4f5d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4f61:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4f64:	89 44 24 10          	mov    %eax,0x10(%esp)
    4f68:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4f6b:	89 44 24 14          	mov    %eax,0x14(%esp)
    4f6f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4f72:	8b 55 a8             	mov    -0x58(%ebp),%edx
    4f75:	89 04 24             	mov    %eax,(%esp)
    4f78:	89 54 24 04          	mov    %edx,0x4(%esp)
    4f7c:	e8 6e 01 00 00       	call   50ef <isIn>
    4f81:	85 c0                	test   %eax,%eax
    4f83:	75 36                	jne    4fbb <set_icon_alpha+0x1e1>
    4f85:	8b 45 ac             	mov    -0x54(%ebp),%eax
    4f88:	89 44 24 08          	mov    %eax,0x8(%esp)
    4f8c:	8b 45 b0             	mov    -0x50(%ebp),%eax
    4f8f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4f93:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    4f96:	89 44 24 10          	mov    %eax,0x10(%esp)
    4f9a:	8b 45 b8             	mov    -0x48(%ebp),%eax
    4f9d:	89 44 24 14          	mov    %eax,0x14(%esp)
    4fa1:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    4fa4:	8b 55 a8             	mov    -0x58(%ebp),%edx
    4fa7:	89 04 24             	mov    %eax,(%esp)
    4faa:	89 54 24 04          	mov    %edx,0x4(%esp)
    4fae:	e8 3c 01 00 00       	call   50ef <isIn>
    4fb3:	85 c0                	test   %eax,%eax
    4fb5:	0f 84 87 00 00 00    	je     5042 <set_icon_alpha+0x268>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    4fbb:	8b 45 08             	mov    0x8(%ebp),%eax
    4fbe:	8b 10                	mov    (%eax),%edx
    4fc0:	8b 45 08             	mov    0x8(%ebp),%eax
    4fc3:	8b 40 04             	mov    0x4(%eax),%eax
    4fc6:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    4fca:	89 c1                	mov    %eax,%ecx
    4fcc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4fcf:	01 c8                	add    %ecx,%eax
    4fd1:	c1 e0 02             	shl    $0x2,%eax
    4fd4:	01 d0                	add    %edx,%eax
    4fd6:	0f b6 00             	movzbl (%eax),%eax
    4fd9:	3c ff                	cmp    $0xff,%al
    4fdb:	75 65                	jne    5042 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    4fdd:	8b 45 08             	mov    0x8(%ebp),%eax
    4fe0:	8b 10                	mov    (%eax),%edx
    4fe2:	8b 45 08             	mov    0x8(%ebp),%eax
    4fe5:	8b 40 04             	mov    0x4(%eax),%eax
    4fe8:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    4fec:	89 c1                	mov    %eax,%ecx
    4fee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4ff1:	01 c8                	add    %ecx,%eax
    4ff3:	c1 e0 02             	shl    $0x2,%eax
    4ff6:	01 d0                	add    %edx,%eax
    4ff8:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4ffc:	3c ff                	cmp    $0xff,%al
    4ffe:	75 42                	jne    5042 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    5000:	8b 45 08             	mov    0x8(%ebp),%eax
    5003:	8b 10                	mov    (%eax),%edx
    5005:	8b 45 08             	mov    0x8(%ebp),%eax
    5008:	8b 40 04             	mov    0x4(%eax),%eax
    500b:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    500f:	89 c1                	mov    %eax,%ecx
    5011:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5014:	01 c8                	add    %ecx,%eax
    5016:	c1 e0 02             	shl    $0x2,%eax
    5019:	01 d0                	add    %edx,%eax
    501b:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    501f:	3c ff                	cmp    $0xff,%al
    5021:	75 1f                	jne    5042 <set_icon_alpha+0x268>
					pic->data[j * pic->width + i].rgbReserved = 1;
    5023:	8b 45 08             	mov    0x8(%ebp),%eax
    5026:	8b 10                	mov    (%eax),%edx
    5028:	8b 45 08             	mov    0x8(%ebp),%eax
    502b:	8b 40 04             	mov    0x4(%eax),%eax
    502e:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    5032:	89 c1                	mov    %eax,%ecx
    5034:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5037:	01 c8                	add    %ecx,%eax
    5039:	c1 e0 02             	shl    $0x2,%eax
    503c:	01 d0                	add    %edx,%eax
    503e:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    5042:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5046:	8b 45 08             	mov    0x8(%ebp),%eax
    5049:	8b 40 08             	mov    0x8(%eax),%eax
    504c:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    504f:	0f 8f 7a fe ff ff    	jg     4ecf <set_icon_alpha+0xf5>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    5055:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5059:	8b 45 08             	mov    0x8(%ebp),%eax
    505c:	8b 40 04             	mov    0x4(%eax),%eax
    505f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    5062:	0f 8f 5b fe ff ff    	jg     4ec3 <set_icon_alpha+0xe9>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    5068:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    506b:	c9                   	leave  
    506c:	c3                   	ret    

0000506d <initPoint>:
#include "message.h"
#include "types.h"
#include "user.h"
#include "finder.h"
Point initPoint(int x, int y)
{
    506d:	55                   	push   %ebp
    506e:	89 e5                	mov    %esp,%ebp
    5070:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    5073:	8b 45 0c             	mov    0xc(%ebp),%eax
    5076:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    5079:	8b 45 10             	mov    0x10(%ebp),%eax
    507c:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    507f:	8b 4d 08             	mov    0x8(%ebp),%ecx
    5082:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5085:	8b 55 fc             	mov    -0x4(%ebp),%edx
    5088:	89 01                	mov    %eax,(%ecx)
    508a:	89 51 04             	mov    %edx,0x4(%ecx)
}
    508d:	8b 45 08             	mov    0x8(%ebp),%eax
    5090:	c9                   	leave  
    5091:	c2 04 00             	ret    $0x4

00005094 <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    5094:	55                   	push   %ebp
    5095:	89 e5                	mov    %esp,%ebp
    5097:	83 ec 24             	sub    $0x24,%esp
	Rect r;
	r.start = initPoint(x, y);
    509a:	8d 45 e8             	lea    -0x18(%ebp),%eax
    509d:	8b 55 10             	mov    0x10(%ebp),%edx
    50a0:	89 54 24 08          	mov    %edx,0x8(%esp)
    50a4:	8b 55 0c             	mov    0xc(%ebp),%edx
    50a7:	89 54 24 04          	mov    %edx,0x4(%esp)
    50ab:	89 04 24             	mov    %eax,(%esp)
    50ae:	e8 ba ff ff ff       	call   506d <initPoint>
    50b3:	83 ec 04             	sub    $0x4,%esp
    50b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    50b9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    50bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    50bf:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    50c2:	8b 45 14             	mov    0x14(%ebp),%eax
    50c5:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    50c8:	8b 45 18             	mov    0x18(%ebp),%eax
    50cb:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    50ce:	8b 45 08             	mov    0x8(%ebp),%eax
    50d1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    50d4:	89 10                	mov    %edx,(%eax)
    50d6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    50d9:	89 50 04             	mov    %edx,0x4(%eax)
    50dc:	8b 55 f8             	mov    -0x8(%ebp),%edx
    50df:	89 50 08             	mov    %edx,0x8(%eax)
    50e2:	8b 55 fc             	mov    -0x4(%ebp),%edx
    50e5:	89 50 0c             	mov    %edx,0xc(%eax)
}
    50e8:	8b 45 08             	mov    0x8(%ebp),%eax
    50eb:	c9                   	leave  
    50ec:	c2 04 00             	ret    $0x4

000050ef <isIn>:

int isIn(Point p, Rect r)
{
    50ef:	55                   	push   %ebp
    50f0:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    50f2:	8b 55 08             	mov    0x8(%ebp),%edx
    50f5:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    50f8:	39 c2                	cmp    %eax,%edx
    50fa:	7c 2f                	jl     512b <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    50fc:	8b 45 08             	mov    0x8(%ebp),%eax
    50ff:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5102:	8b 55 18             	mov    0x18(%ebp),%edx
    5105:	01 ca                	add    %ecx,%edx
    5107:	39 d0                	cmp    %edx,%eax
    5109:	7d 20                	jge    512b <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    510b:	8b 55 0c             	mov    0xc(%ebp),%edx
    510e:	8b 45 14             	mov    0x14(%ebp),%eax
    5111:	39 c2                	cmp    %eax,%edx
    5113:	7c 16                	jl     512b <isIn+0x3c>
    5115:	8b 45 0c             	mov    0xc(%ebp),%eax
    5118:	8b 4d 14             	mov    0x14(%ebp),%ecx
    511b:	8b 55 1c             	mov    0x1c(%ebp),%edx
    511e:	01 ca                	add    %ecx,%edx
    5120:	39 d0                	cmp    %edx,%eax
    5122:	7d 07                	jge    512b <isIn+0x3c>
    5124:	b8 01 00 00 00       	mov    $0x1,%eax
    5129:	eb 05                	jmp    5130 <isIn+0x41>
    512b:	b8 00 00 00 00       	mov    $0x0,%eax
}
    5130:	5d                   	pop    %ebp
    5131:	c3                   	ret    

00005132 <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    5132:	55                   	push   %ebp
    5133:	89 e5                	mov    %esp,%ebp
    5135:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    5138:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    513f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    5146:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    514d:	8b 45 10             	mov    0x10(%ebp),%eax
    5150:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    5153:	8b 45 14             	mov    0x14(%ebp),%eax
    5156:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    5159:	8b 45 08             	mov    0x8(%ebp),%eax
    515c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    515f:	89 10                	mov    %edx,(%eax)
    5161:	8b 55 f0             	mov    -0x10(%ebp),%edx
    5164:	89 50 04             	mov    %edx,0x4(%eax)
    5167:	8b 55 f4             	mov    -0xc(%ebp),%edx
    516a:	89 50 08             	mov    %edx,0x8(%eax)
    516d:	8b 55 f8             	mov    -0x8(%ebp),%edx
    5170:	89 50 0c             	mov    %edx,0xc(%eax)
    5173:	8b 55 fc             	mov    -0x4(%ebp),%edx
    5176:	89 50 10             	mov    %edx,0x10(%eax)
}
    5179:	8b 45 08             	mov    0x8(%ebp),%eax
    517c:	c9                   	leave  
    517d:	c2 04 00             	ret    $0x4

00005180 <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    5180:	55                   	push   %ebp
    5181:	89 e5                	mov    %esp,%ebp
    5183:	83 ec 28             	sub    $0x28,%esp
	switch (MsgType)
    5186:	8b 45 1c             	mov    0x1c(%ebp),%eax
    5189:	83 f8 03             	cmp    $0x3,%eax
    518c:	74 72                	je     5200 <createClickable+0x80>
    518e:	83 f8 04             	cmp    $0x4,%eax
    5191:	74 0a                	je     519d <createClickable+0x1d>
    5193:	83 f8 02             	cmp    $0x2,%eax
    5196:	74 38                	je     51d0 <createClickable+0x50>
    5198:	e9 96 00 00 00       	jmp    5233 <createClickable+0xb3>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    519d:	8b 45 08             	mov    0x8(%ebp),%eax
    51a0:	8d 50 04             	lea    0x4(%eax),%edx
    51a3:	8b 45 20             	mov    0x20(%ebp),%eax
    51a6:	89 44 24 14          	mov    %eax,0x14(%esp)
    51aa:	8b 45 0c             	mov    0xc(%ebp),%eax
    51ad:	89 44 24 04          	mov    %eax,0x4(%esp)
    51b1:	8b 45 10             	mov    0x10(%ebp),%eax
    51b4:	89 44 24 08          	mov    %eax,0x8(%esp)
    51b8:	8b 45 14             	mov    0x14(%ebp),%eax
    51bb:	89 44 24 0c          	mov    %eax,0xc(%esp)
    51bf:	8b 45 18             	mov    0x18(%ebp),%eax
    51c2:	89 44 24 10          	mov    %eax,0x10(%esp)
    51c6:	89 14 24             	mov    %edx,(%esp)
    51c9:	e8 7c 00 00 00       	call   524a <addClickable>
	        break;
    51ce:	eb 78                	jmp    5248 <createClickable+0xc8>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    51d0:	8b 45 08             	mov    0x8(%ebp),%eax
    51d3:	8b 55 20             	mov    0x20(%ebp),%edx
    51d6:	89 54 24 14          	mov    %edx,0x14(%esp)
    51da:	8b 55 0c             	mov    0xc(%ebp),%edx
    51dd:	89 54 24 04          	mov    %edx,0x4(%esp)
    51e1:	8b 55 10             	mov    0x10(%ebp),%edx
    51e4:	89 54 24 08          	mov    %edx,0x8(%esp)
    51e8:	8b 55 14             	mov    0x14(%ebp),%edx
    51eb:	89 54 24 0c          	mov    %edx,0xc(%esp)
    51ef:	8b 55 18             	mov    0x18(%ebp),%edx
    51f2:	89 54 24 10          	mov    %edx,0x10(%esp)
    51f6:	89 04 24             	mov    %eax,(%esp)
    51f9:	e8 4c 00 00 00       	call   524a <addClickable>
	    	break;
    51fe:	eb 48                	jmp    5248 <createClickable+0xc8>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    5200:	8b 45 08             	mov    0x8(%ebp),%eax
    5203:	8d 50 08             	lea    0x8(%eax),%edx
    5206:	8b 45 20             	mov    0x20(%ebp),%eax
    5209:	89 44 24 14          	mov    %eax,0x14(%esp)
    520d:	8b 45 0c             	mov    0xc(%ebp),%eax
    5210:	89 44 24 04          	mov    %eax,0x4(%esp)
    5214:	8b 45 10             	mov    0x10(%ebp),%eax
    5217:	89 44 24 08          	mov    %eax,0x8(%esp)
    521b:	8b 45 14             	mov    0x14(%ebp),%eax
    521e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5222:	8b 45 18             	mov    0x18(%ebp),%eax
    5225:	89 44 24 10          	mov    %eax,0x10(%esp)
    5229:	89 14 24             	mov    %edx,(%esp)
    522c:	e8 19 00 00 00       	call   524a <addClickable>
	    	break;
    5231:	eb 15                	jmp    5248 <createClickable+0xc8>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    5233:	c7 44 24 04 14 c9 00 	movl   $0xc914,0x4(%esp)
    523a:	00 
    523b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5242:	e8 8c 09 00 00       	call   5bd3 <printf>
	    	break;
    5247:	90                   	nop
	}
}
    5248:	c9                   	leave  
    5249:	c3                   	ret    

0000524a <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    524a:	55                   	push   %ebp
    524b:	89 e5                	mov    %esp,%ebp
    524d:	83 ec 28             	sub    $0x28,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    5250:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
    5257:	e8 63 0c 00 00       	call   5ebf <malloc>
    525c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    525f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5262:	8b 55 0c             	mov    0xc(%ebp),%edx
    5265:	89 10                	mov    %edx,(%eax)
    5267:	8b 55 10             	mov    0x10(%ebp),%edx
    526a:	89 50 04             	mov    %edx,0x4(%eax)
    526d:	8b 55 14             	mov    0x14(%ebp),%edx
    5270:	89 50 08             	mov    %edx,0x8(%eax)
    5273:	8b 55 18             	mov    0x18(%ebp),%edx
    5276:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    5279:	8b 45 f4             	mov    -0xc(%ebp),%eax
    527c:	8b 55 1c             	mov    0x1c(%ebp),%edx
    527f:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    5282:	8b 45 08             	mov    0x8(%ebp),%eax
    5285:	8b 10                	mov    (%eax),%edx
    5287:	8b 45 f4             	mov    -0xc(%ebp),%eax
    528a:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    528d:	8b 45 08             	mov    0x8(%ebp),%eax
    5290:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5293:	89 10                	mov    %edx,(%eax)
}
    5295:	c9                   	leave  
    5296:	c3                   	ret    

00005297 <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    5297:	55                   	push   %ebp
    5298:	89 e5                	mov    %esp,%ebp
    529a:	83 ec 38             	sub    $0x38,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    529d:	8b 45 08             	mov    0x8(%ebp),%eax
    52a0:	8b 00                	mov    (%eax),%eax
    52a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    52a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    52a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    52ab:	e9 bb 00 00 00       	jmp    536b <deleteClickable+0xd4>
	{
		if (isIn(cur->area.start, region))
    52b0:	8b 45 0c             	mov    0xc(%ebp),%eax
    52b3:	89 44 24 08          	mov    %eax,0x8(%esp)
    52b7:	8b 45 10             	mov    0x10(%ebp),%eax
    52ba:	89 44 24 0c          	mov    %eax,0xc(%esp)
    52be:	8b 45 14             	mov    0x14(%ebp),%eax
    52c1:	89 44 24 10          	mov    %eax,0x10(%esp)
    52c5:	8b 45 18             	mov    0x18(%ebp),%eax
    52c8:	89 44 24 14          	mov    %eax,0x14(%esp)
    52cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    52cf:	8b 50 04             	mov    0x4(%eax),%edx
    52d2:	8b 00                	mov    (%eax),%eax
    52d4:	89 04 24             	mov    %eax,(%esp)
    52d7:	89 54 24 04          	mov    %edx,0x4(%esp)
    52db:	e8 0f fe ff ff       	call   50ef <isIn>
    52e0:	85 c0                	test   %eax,%eax
    52e2:	74 60                	je     5344 <deleteClickable+0xad>
		{
			//如果当前指针指向头部
			if (cur == *head)
    52e4:	8b 45 08             	mov    0x8(%ebp),%eax
    52e7:	8b 00                	mov    (%eax),%eax
    52e9:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    52ec:	75 2e                	jne    531c <deleteClickable+0x85>
			{
				//删除头节点
				temp = *head;
    52ee:	8b 45 08             	mov    0x8(%ebp),%eax
    52f1:	8b 00                	mov    (%eax),%eax
    52f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    52f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    52f9:	8b 50 14             	mov    0x14(%eax),%edx
    52fc:	8b 45 08             	mov    0x8(%ebp),%eax
    52ff:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    5301:	8b 45 08             	mov    0x8(%ebp),%eax
    5304:	8b 00                	mov    (%eax),%eax
    5306:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5309:	8b 45 f4             	mov    -0xc(%ebp),%eax
    530c:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    530f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5312:	89 04 24             	mov    %eax,(%esp)
    5315:	e8 6c 0a 00 00       	call   5d86 <free>
    531a:	eb 4f                	jmp    536b <deleteClickable+0xd4>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    531c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    531f:	8b 50 14             	mov    0x14(%eax),%edx
    5322:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5325:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    5328:	8b 45 f0             	mov    -0x10(%ebp),%eax
    532b:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    532e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5331:	8b 40 14             	mov    0x14(%eax),%eax
    5334:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    5337:	8b 45 ec             	mov    -0x14(%ebp),%eax
    533a:	89 04 24             	mov    %eax,(%esp)
    533d:	e8 44 0a 00 00       	call   5d86 <free>
    5342:	eb 27                	jmp    536b <deleteClickable+0xd4>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    5344:	8b 45 08             	mov    0x8(%ebp),%eax
    5347:	8b 00                	mov    (%eax),%eax
    5349:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    534c:	75 0b                	jne    5359 <deleteClickable+0xc2>
			{
				cur = cur->next;
    534e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5351:	8b 40 14             	mov    0x14(%eax),%eax
    5354:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5357:	eb 12                	jmp    536b <deleteClickable+0xd4>
			}
			else
			{
				cur = cur->next;
    5359:	8b 45 f0             	mov    -0x10(%ebp),%eax
    535c:	8b 40 14             	mov    0x14(%eax),%eax
    535f:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    5362:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5365:	8b 40 14             	mov    0x14(%eax),%eax
    5368:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    536b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    536f:	0f 85 3b ff ff ff    	jne    52b0 <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    5375:	c9                   	leave  
    5376:	c3                   	ret    

00005377 <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    5377:	55                   	push   %ebp
    5378:	89 e5                	mov    %esp,%ebp
    537a:	83 ec 38             	sub    $0x38,%esp
	Clickable *cur = head;
    537d:	8b 45 08             	mov    0x8(%ebp),%eax
    5380:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    5383:	eb 6d                	jmp    53f2 <executeHandler+0x7b>
	{
		if (isIn(click, cur->area))
    5385:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5388:	8b 10                	mov    (%eax),%edx
    538a:	89 54 24 08          	mov    %edx,0x8(%esp)
    538e:	8b 50 04             	mov    0x4(%eax),%edx
    5391:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5395:	8b 50 08             	mov    0x8(%eax),%edx
    5398:	89 54 24 10          	mov    %edx,0x10(%esp)
    539c:	8b 40 0c             	mov    0xc(%eax),%eax
    539f:	89 44 24 14          	mov    %eax,0x14(%esp)
    53a3:	8b 45 0c             	mov    0xc(%ebp),%eax
    53a6:	8b 55 10             	mov    0x10(%ebp),%edx
    53a9:	89 04 24             	mov    %eax,(%esp)
    53ac:	89 54 24 04          	mov    %edx,0x4(%esp)
    53b0:	e8 3a fd ff ff       	call   50ef <isIn>
    53b5:	85 c0                	test   %eax,%eax
    53b7:	74 30                	je     53e9 <executeHandler+0x72>
		{
			renaming = 0;
    53b9:	c7 05 54 48 01 00 00 	movl   $0x0,0x14854
    53c0:	00 00 00 
			isSearching = 0;
    53c3:	c7 05 e0 3d 01 00 00 	movl   $0x0,0x13de0
    53ca:	00 00 00 
			cur->handler(click);
    53cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    53d0:	8b 48 10             	mov    0x10(%eax),%ecx
    53d3:	8b 45 0c             	mov    0xc(%ebp),%eax
    53d6:	8b 55 10             	mov    0x10(%ebp),%edx
    53d9:	89 04 24             	mov    %eax,(%esp)
    53dc:	89 54 24 04          	mov    %edx,0x4(%esp)
    53e0:	ff d1                	call   *%ecx
			return 1;
    53e2:	b8 01 00 00 00       	mov    $0x1,%eax
    53e7:	eb 4d                	jmp    5436 <executeHandler+0xbf>
		}
		cur = cur->next;
    53e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    53ec:	8b 40 14             	mov    0x14(%eax),%eax
    53ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    53f2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    53f6:	75 8d                	jne    5385 <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	isSearching = 0;
    53f8:	c7 05 e0 3d 01 00 00 	movl   $0x0,0x13de0
    53ff:	00 00 00 
	if (renaming == 1){
    5402:	a1 54 48 01 00       	mov    0x14854,%eax
    5407:	83 f8 01             	cmp    $0x1,%eax
    540a:	75 11                	jne    541d <executeHandler+0xa6>
		renaming = 0;
    540c:	c7 05 54 48 01 00 00 	movl   $0x0,0x14854
    5413:	00 00 00 
		return 1;
    5416:	b8 01 00 00 00       	mov    $0x1,%eax
    541b:	eb 19                	jmp    5436 <executeHandler+0xbf>
	}
	printf(0, "execute: none!\n");
    541d:	c7 44 24 04 42 c9 00 	movl   $0xc942,0x4(%esp)
    5424:	00 
    5425:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    542c:	e8 a2 07 00 00       	call   5bd3 <printf>
	return 0;
    5431:	b8 00 00 00 00       	mov    $0x0,%eax
}
    5436:	c9                   	leave  
    5437:	c3                   	ret    

00005438 <printClickable>:

void printClickable(Clickable *c)
{
    5438:	55                   	push   %ebp
    5439:	89 e5                	mov    %esp,%ebp
    543b:	53                   	push   %ebx
    543c:	83 ec 24             	sub    $0x24,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    543f:	8b 45 08             	mov    0x8(%ebp),%eax
    5442:	8b 58 0c             	mov    0xc(%eax),%ebx
    5445:	8b 45 08             	mov    0x8(%ebp),%eax
    5448:	8b 48 08             	mov    0x8(%eax),%ecx
    544b:	8b 45 08             	mov    0x8(%ebp),%eax
    544e:	8b 50 04             	mov    0x4(%eax),%edx
    5451:	8b 45 08             	mov    0x8(%ebp),%eax
    5454:	8b 00                	mov    (%eax),%eax
    5456:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    545a:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    545e:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5462:	89 44 24 08          	mov    %eax,0x8(%esp)
    5466:	c7 44 24 04 52 c9 00 	movl   $0xc952,0x4(%esp)
    546d:	00 
    546e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5475:	e8 59 07 00 00       	call   5bd3 <printf>
}
    547a:	83 c4 24             	add    $0x24,%esp
    547d:	5b                   	pop    %ebx
    547e:	5d                   	pop    %ebp
    547f:	c3                   	ret    

00005480 <printClickableList>:

void printClickableList(Clickable *head)
{
    5480:	55                   	push   %ebp
    5481:	89 e5                	mov    %esp,%ebp
    5483:	83 ec 28             	sub    $0x28,%esp
	Clickable *cur = head;
    5486:	8b 45 08             	mov    0x8(%ebp),%eax
    5489:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    548c:	c7 44 24 04 64 c9 00 	movl   $0xc964,0x4(%esp)
    5493:	00 
    5494:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    549b:	e8 33 07 00 00       	call   5bd3 <printf>
	while(cur != 0)
    54a0:	eb 14                	jmp    54b6 <printClickableList+0x36>
	{
		printClickable(cur);
    54a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54a5:	89 04 24             	mov    %eax,(%esp)
    54a8:	e8 8b ff ff ff       	call   5438 <printClickable>
		cur = cur->next;
    54ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    54b0:	8b 40 14             	mov    0x14(%eax),%eax
    54b3:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    54b6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    54ba:	75 e6                	jne    54a2 <printClickableList+0x22>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    54bc:	c7 44 24 04 75 c9 00 	movl   $0xc975,0x4(%esp)
    54c3:	00 
    54c4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    54cb:	e8 03 07 00 00       	call   5bd3 <printf>
}
    54d0:	c9                   	leave  
    54d1:	c3                   	ret    

000054d2 <testHanler>:

void testHanler(struct Point p)
{
    54d2:	55                   	push   %ebp
    54d3:	89 e5                	mov    %esp,%ebp
    54d5:	83 ec 18             	sub    $0x18,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    54d8:	8b 55 0c             	mov    0xc(%ebp),%edx
    54db:	8b 45 08             	mov    0x8(%ebp),%eax
    54de:	89 54 24 0c          	mov    %edx,0xc(%esp)
    54e2:	89 44 24 08          	mov    %eax,0x8(%esp)
    54e6:	c7 44 24 04 77 c9 00 	movl   $0xc977,0x4(%esp)
    54ed:	00 
    54ee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    54f5:	e8 d9 06 00 00       	call   5bd3 <printf>
}
    54fa:	c9                   	leave  
    54fb:	c3                   	ret    

000054fc <testClickable>:
void testClickable(struct Context c)
{
    54fc:	55                   	push   %ebp
    54fd:	89 e5                	mov    %esp,%ebp
    54ff:	81 ec 98 00 00 00    	sub    $0x98,%esp
	ClickableManager cm = initClickManager(c);
    5505:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    5508:	8b 55 08             	mov    0x8(%ebp),%edx
    550b:	89 54 24 04          	mov    %edx,0x4(%esp)
    550f:	8b 55 0c             	mov    0xc(%ebp),%edx
    5512:	89 54 24 08          	mov    %edx,0x8(%esp)
    5516:	8b 55 10             	mov    0x10(%ebp),%edx
    5519:	89 54 24 0c          	mov    %edx,0xc(%esp)
    551d:	89 04 24             	mov    %eax,(%esp)
    5520:	e8 0d fc ff ff       	call   5132 <initClickManager>
    5525:	83 ec 04             	sub    $0x4,%esp

	Rect r1 = initRect(5,5,20,20);
    5528:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    552b:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    5532:	00 
    5533:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    553a:	00 
    553b:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    5542:	00 
    5543:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    554a:	00 
    554b:	89 04 24             	mov    %eax,(%esp)
    554e:	e8 41 fb ff ff       	call   5094 <initRect>
    5553:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(20,20,20,20);
    5556:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    5559:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    5560:	00 
    5561:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    5568:	00 
    5569:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
    5570:	00 
    5571:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
    5578:	00 
    5579:	89 04 24             	mov    %eax,(%esp)
    557c:	e8 13 fb ff ff       	call   5094 <initRect>
    5581:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(50,50,15,15);
    5584:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    5587:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
    558e:	00 
    558f:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%esp)
    5596:	00 
    5597:	c7 44 24 08 32 00 00 	movl   $0x32,0x8(%esp)
    559e:	00 
    559f:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
    55a6:	00 
    55a7:	89 04 24             	mov    %eax,(%esp)
    55aa:	e8 e5 fa ff ff       	call   5094 <initRect>
    55af:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0,0,30,30);
    55b2:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    55b5:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    55bc:	00 
    55bd:	c7 44 24 0c 1e 00 00 	movl   $0x1e,0xc(%esp)
    55c4:	00 
    55c5:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    55cc:	00 
    55cd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    55d4:	00 
    55d5:	89 04 24             	mov    %eax,(%esp)
    55d8:	e8 b7 fa ff ff       	call   5094 <initRect>
    55dd:	83 ec 04             	sub    $0x4,%esp
	Point p1 = initPoint(23, 23);
    55e0:	8d 45 9c             	lea    -0x64(%ebp),%eax
    55e3:	c7 44 24 08 17 00 00 	movl   $0x17,0x8(%esp)
    55ea:	00 
    55eb:	c7 44 24 04 17 00 00 	movl   $0x17,0x4(%esp)
    55f2:	00 
    55f3:	89 04 24             	mov    %eax,(%esp)
    55f6:	e8 72 fa ff ff       	call   506d <initPoint>
    55fb:	83 ec 04             	sub    $0x4,%esp
	Point p2 = initPoint(70, 70);
    55fe:	8d 45 94             	lea    -0x6c(%ebp),%eax
    5601:	c7 44 24 08 46 00 00 	movl   $0x46,0x8(%esp)
    5608:	00 
    5609:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
    5610:	00 
    5611:	89 04 24             	mov    %eax,(%esp)
    5614:	e8 54 fa ff ff       	call   506d <initPoint>
    5619:	83 ec 04             	sub    $0x4,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    561c:	c7 44 24 18 d2 54 00 	movl   $0x54d2,0x18(%esp)
    5623:	00 
    5624:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    562b:	00 
    562c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    562f:	89 44 24 04          	mov    %eax,0x4(%esp)
    5633:	8b 45 d8             	mov    -0x28(%ebp),%eax
    5636:	89 44 24 08          	mov    %eax,0x8(%esp)
    563a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    563d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5641:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5644:	89 44 24 10          	mov    %eax,0x10(%esp)
    5648:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    564b:	89 04 24             	mov    %eax,(%esp)
    564e:	e8 2d fb ff ff       	call   5180 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    5653:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5656:	89 44 24 08          	mov    %eax,0x8(%esp)
    565a:	c7 44 24 04 8b c9 00 	movl   $0xc98b,0x4(%esp)
    5661:	00 
    5662:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5669:	e8 65 05 00 00       	call   5bd3 <printf>
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    566e:	c7 44 24 18 d2 54 00 	movl   $0x54d2,0x18(%esp)
    5675:	00 
    5676:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    567d:	00 
    567e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    5681:	89 44 24 04          	mov    %eax,0x4(%esp)
    5685:	8b 45 c8             	mov    -0x38(%ebp),%eax
    5688:	89 44 24 08          	mov    %eax,0x8(%esp)
    568c:	8b 45 cc             	mov    -0x34(%ebp),%eax
    568f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5693:	8b 45 d0             	mov    -0x30(%ebp),%eax
    5696:	89 44 24 10          	mov    %eax,0x10(%esp)
    569a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    569d:	89 04 24             	mov    %eax,(%esp)
    56a0:	e8 db fa ff ff       	call   5180 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    56a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    56a8:	89 44 24 08          	mov    %eax,0x8(%esp)
    56ac:	c7 44 24 04 8b c9 00 	movl   $0xc98b,0x4(%esp)
    56b3:	00 
    56b4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    56bb:	e8 13 05 00 00       	call   5bd3 <printf>
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    56c0:	c7 44 24 18 d2 54 00 	movl   $0x54d2,0x18(%esp)
    56c7:	00 
    56c8:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    56cf:	00 
    56d0:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    56d3:	89 44 24 04          	mov    %eax,0x4(%esp)
    56d7:	8b 45 b8             	mov    -0x48(%ebp),%eax
    56da:	89 44 24 08          	mov    %eax,0x8(%esp)
    56de:	8b 45 bc             	mov    -0x44(%ebp),%eax
    56e1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    56e5:	8b 45 c0             	mov    -0x40(%ebp),%eax
    56e8:	89 44 24 10          	mov    %eax,0x10(%esp)
    56ec:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    56ef:	89 04 24             	mov    %eax,(%esp)
    56f2:	e8 89 fa ff ff       	call   5180 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    56f7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    56fa:	89 44 24 08          	mov    %eax,0x8(%esp)
    56fe:	c7 44 24 04 8b c9 00 	movl   $0xc98b,0x4(%esp)
    5705:	00 
    5706:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    570d:	e8 c1 04 00 00       	call   5bd3 <printf>
	printClickableList(cm.left_click);
    5712:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5715:	89 04 24             	mov    %eax,(%esp)
    5718:	e8 63 fd ff ff       	call   5480 <printClickableList>
	executeHandler(cm.left_click, p1);
    571d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    5720:	8b 45 9c             	mov    -0x64(%ebp),%eax
    5723:	8b 55 a0             	mov    -0x60(%ebp),%edx
    5726:	89 44 24 04          	mov    %eax,0x4(%esp)
    572a:	89 54 24 08          	mov    %edx,0x8(%esp)
    572e:	89 0c 24             	mov    %ecx,(%esp)
    5731:	e8 41 fc ff ff       	call   5377 <executeHandler>
	executeHandler(cm.left_click, p2);
    5736:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    5739:	8b 45 94             	mov    -0x6c(%ebp),%eax
    573c:	8b 55 98             	mov    -0x68(%ebp),%edx
    573f:	89 44 24 04          	mov    %eax,0x4(%esp)
    5743:	89 54 24 08          	mov    %edx,0x8(%esp)
    5747:	89 0c 24             	mov    %ecx,(%esp)
    574a:	e8 28 fc ff ff       	call   5377 <executeHandler>
	deleteClickable(&cm.left_click, r4);
    574f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    5752:	89 44 24 04          	mov    %eax,0x4(%esp)
    5756:	8b 45 a8             	mov    -0x58(%ebp),%eax
    5759:	89 44 24 08          	mov    %eax,0x8(%esp)
    575d:	8b 45 ac             	mov    -0x54(%ebp),%eax
    5760:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5764:	8b 45 b0             	mov    -0x50(%ebp),%eax
    5767:	89 44 24 10          	mov    %eax,0x10(%esp)
    576b:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    576e:	89 04 24             	mov    %eax,(%esp)
    5771:	e8 21 fb ff ff       	call   5297 <deleteClickable>
	printClickableList(cm.left_click);
    5776:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5779:	89 04 24             	mov    %eax,(%esp)
    577c:	e8 ff fc ff ff       	call   5480 <printClickableList>
}
    5781:	c9                   	leave  
    5782:	c3                   	ret    

00005783 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    5783:	55                   	push   %ebp
    5784:	89 e5                	mov    %esp,%ebp
    5786:	57                   	push   %edi
    5787:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    5788:	8b 4d 08             	mov    0x8(%ebp),%ecx
    578b:	8b 55 10             	mov    0x10(%ebp),%edx
    578e:	8b 45 0c             	mov    0xc(%ebp),%eax
    5791:	89 cb                	mov    %ecx,%ebx
    5793:	89 df                	mov    %ebx,%edi
    5795:	89 d1                	mov    %edx,%ecx
    5797:	fc                   	cld    
    5798:	f3 aa                	rep stos %al,%es:(%edi)
    579a:	89 ca                	mov    %ecx,%edx
    579c:	89 fb                	mov    %edi,%ebx
    579e:	89 5d 08             	mov    %ebx,0x8(%ebp)
    57a1:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    57a4:	5b                   	pop    %ebx
    57a5:	5f                   	pop    %edi
    57a6:	5d                   	pop    %ebp
    57a7:	c3                   	ret    

000057a8 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    57a8:	55                   	push   %ebp
    57a9:	89 e5                	mov    %esp,%ebp
    57ab:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    57ae:	8b 45 08             	mov    0x8(%ebp),%eax
    57b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    57b4:	90                   	nop
    57b5:	8b 45 08             	mov    0x8(%ebp),%eax
    57b8:	8d 50 01             	lea    0x1(%eax),%edx
    57bb:	89 55 08             	mov    %edx,0x8(%ebp)
    57be:	8b 55 0c             	mov    0xc(%ebp),%edx
    57c1:	8d 4a 01             	lea    0x1(%edx),%ecx
    57c4:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    57c7:	0f b6 12             	movzbl (%edx),%edx
    57ca:	88 10                	mov    %dl,(%eax)
    57cc:	0f b6 00             	movzbl (%eax),%eax
    57cf:	84 c0                	test   %al,%al
    57d1:	75 e2                	jne    57b5 <strcpy+0xd>
    ;
  return os;
    57d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    57d6:	c9                   	leave  
    57d7:	c3                   	ret    

000057d8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    57d8:	55                   	push   %ebp
    57d9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    57db:	eb 08                	jmp    57e5 <strcmp+0xd>
    p++, q++;
    57dd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    57e1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    57e5:	8b 45 08             	mov    0x8(%ebp),%eax
    57e8:	0f b6 00             	movzbl (%eax),%eax
    57eb:	84 c0                	test   %al,%al
    57ed:	74 10                	je     57ff <strcmp+0x27>
    57ef:	8b 45 08             	mov    0x8(%ebp),%eax
    57f2:	0f b6 10             	movzbl (%eax),%edx
    57f5:	8b 45 0c             	mov    0xc(%ebp),%eax
    57f8:	0f b6 00             	movzbl (%eax),%eax
    57fb:	38 c2                	cmp    %al,%dl
    57fd:	74 de                	je     57dd <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    57ff:	8b 45 08             	mov    0x8(%ebp),%eax
    5802:	0f b6 00             	movzbl (%eax),%eax
    5805:	0f b6 d0             	movzbl %al,%edx
    5808:	8b 45 0c             	mov    0xc(%ebp),%eax
    580b:	0f b6 00             	movzbl (%eax),%eax
    580e:	0f b6 c0             	movzbl %al,%eax
    5811:	29 c2                	sub    %eax,%edx
    5813:	89 d0                	mov    %edx,%eax
}
    5815:	5d                   	pop    %ebp
    5816:	c3                   	ret    

00005817 <strlen>:

uint
strlen(char *s)
{
    5817:	55                   	push   %ebp
    5818:	89 e5                	mov    %esp,%ebp
    581a:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    581d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    5824:	eb 04                	jmp    582a <strlen+0x13>
    5826:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    582a:	8b 55 fc             	mov    -0x4(%ebp),%edx
    582d:	8b 45 08             	mov    0x8(%ebp),%eax
    5830:	01 d0                	add    %edx,%eax
    5832:	0f b6 00             	movzbl (%eax),%eax
    5835:	84 c0                	test   %al,%al
    5837:	75 ed                	jne    5826 <strlen+0xf>
    ;
  return n;
    5839:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    583c:	c9                   	leave  
    583d:	c3                   	ret    

0000583e <memset>:

void*
memset(void *dst, int c, uint n)
{
    583e:	55                   	push   %ebp
    583f:	89 e5                	mov    %esp,%ebp
    5841:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    5844:	8b 45 10             	mov    0x10(%ebp),%eax
    5847:	89 44 24 08          	mov    %eax,0x8(%esp)
    584b:	8b 45 0c             	mov    0xc(%ebp),%eax
    584e:	89 44 24 04          	mov    %eax,0x4(%esp)
    5852:	8b 45 08             	mov    0x8(%ebp),%eax
    5855:	89 04 24             	mov    %eax,(%esp)
    5858:	e8 26 ff ff ff       	call   5783 <stosb>
  return dst;
    585d:	8b 45 08             	mov    0x8(%ebp),%eax
}
    5860:	c9                   	leave  
    5861:	c3                   	ret    

00005862 <strchr>:

char*
strchr(const char *s, char c)
{
    5862:	55                   	push   %ebp
    5863:	89 e5                	mov    %esp,%ebp
    5865:	83 ec 04             	sub    $0x4,%esp
    5868:	8b 45 0c             	mov    0xc(%ebp),%eax
    586b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    586e:	eb 14                	jmp    5884 <strchr+0x22>
    if(*s == c)
    5870:	8b 45 08             	mov    0x8(%ebp),%eax
    5873:	0f b6 00             	movzbl (%eax),%eax
    5876:	3a 45 fc             	cmp    -0x4(%ebp),%al
    5879:	75 05                	jne    5880 <strchr+0x1e>
      return (char*)s;
    587b:	8b 45 08             	mov    0x8(%ebp),%eax
    587e:	eb 13                	jmp    5893 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    5880:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    5884:	8b 45 08             	mov    0x8(%ebp),%eax
    5887:	0f b6 00             	movzbl (%eax),%eax
    588a:	84 c0                	test   %al,%al
    588c:	75 e2                	jne    5870 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    588e:	b8 00 00 00 00       	mov    $0x0,%eax
}
    5893:	c9                   	leave  
    5894:	c3                   	ret    

00005895 <gets>:

char*
gets(char *buf, int max)
{
    5895:	55                   	push   %ebp
    5896:	89 e5                	mov    %esp,%ebp
    5898:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    589b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    58a2:	eb 4c                	jmp    58f0 <gets+0x5b>
    cc = read(0, &c, 1);
    58a4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    58ab:	00 
    58ac:	8d 45 ef             	lea    -0x11(%ebp),%eax
    58af:	89 44 24 04          	mov    %eax,0x4(%esp)
    58b3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    58ba:	e8 44 01 00 00       	call   5a03 <read>
    58bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    58c2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    58c6:	7f 02                	jg     58ca <gets+0x35>
      break;
    58c8:	eb 31                	jmp    58fb <gets+0x66>
    buf[i++] = c;
    58ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    58cd:	8d 50 01             	lea    0x1(%eax),%edx
    58d0:	89 55 f4             	mov    %edx,-0xc(%ebp)
    58d3:	89 c2                	mov    %eax,%edx
    58d5:	8b 45 08             	mov    0x8(%ebp),%eax
    58d8:	01 c2                	add    %eax,%edx
    58da:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    58de:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    58e0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    58e4:	3c 0a                	cmp    $0xa,%al
    58e6:	74 13                	je     58fb <gets+0x66>
    58e8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    58ec:	3c 0d                	cmp    $0xd,%al
    58ee:	74 0b                	je     58fb <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    58f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    58f3:	83 c0 01             	add    $0x1,%eax
    58f6:	3b 45 0c             	cmp    0xc(%ebp),%eax
    58f9:	7c a9                	jl     58a4 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    58fb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    58fe:	8b 45 08             	mov    0x8(%ebp),%eax
    5901:	01 d0                	add    %edx,%eax
    5903:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    5906:	8b 45 08             	mov    0x8(%ebp),%eax
}
    5909:	c9                   	leave  
    590a:	c3                   	ret    

0000590b <stat>:

int
stat(char *n, struct stat *st)
{
    590b:	55                   	push   %ebp
    590c:	89 e5                	mov    %esp,%ebp
    590e:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    5911:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    5918:	00 
    5919:	8b 45 08             	mov    0x8(%ebp),%eax
    591c:	89 04 24             	mov    %eax,(%esp)
    591f:	e8 07 01 00 00       	call   5a2b <open>
    5924:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    5927:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    592b:	79 07                	jns    5934 <stat+0x29>
    return -1;
    592d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    5932:	eb 23                	jmp    5957 <stat+0x4c>
  r = fstat(fd, st);
    5934:	8b 45 0c             	mov    0xc(%ebp),%eax
    5937:	89 44 24 04          	mov    %eax,0x4(%esp)
    593b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    593e:	89 04 24             	mov    %eax,(%esp)
    5941:	e8 fd 00 00 00       	call   5a43 <fstat>
    5946:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    5949:	8b 45 f4             	mov    -0xc(%ebp),%eax
    594c:	89 04 24             	mov    %eax,(%esp)
    594f:	e8 bf 00 00 00       	call   5a13 <close>
  return r;
    5954:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    5957:	c9                   	leave  
    5958:	c3                   	ret    

00005959 <atoi>:

int
atoi(const char *s)
{
    5959:	55                   	push   %ebp
    595a:	89 e5                	mov    %esp,%ebp
    595c:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    595f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    5966:	eb 25                	jmp    598d <atoi+0x34>
    n = n*10 + *s++ - '0';
    5968:	8b 55 fc             	mov    -0x4(%ebp),%edx
    596b:	89 d0                	mov    %edx,%eax
    596d:	c1 e0 02             	shl    $0x2,%eax
    5970:	01 d0                	add    %edx,%eax
    5972:	01 c0                	add    %eax,%eax
    5974:	89 c1                	mov    %eax,%ecx
    5976:	8b 45 08             	mov    0x8(%ebp),%eax
    5979:	8d 50 01             	lea    0x1(%eax),%edx
    597c:	89 55 08             	mov    %edx,0x8(%ebp)
    597f:	0f b6 00             	movzbl (%eax),%eax
    5982:	0f be c0             	movsbl %al,%eax
    5985:	01 c8                	add    %ecx,%eax
    5987:	83 e8 30             	sub    $0x30,%eax
    598a:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    598d:	8b 45 08             	mov    0x8(%ebp),%eax
    5990:	0f b6 00             	movzbl (%eax),%eax
    5993:	3c 2f                	cmp    $0x2f,%al
    5995:	7e 0a                	jle    59a1 <atoi+0x48>
    5997:	8b 45 08             	mov    0x8(%ebp),%eax
    599a:	0f b6 00             	movzbl (%eax),%eax
    599d:	3c 39                	cmp    $0x39,%al
    599f:	7e c7                	jle    5968 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    59a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    59a4:	c9                   	leave  
    59a5:	c3                   	ret    

000059a6 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    59a6:	55                   	push   %ebp
    59a7:	89 e5                	mov    %esp,%ebp
    59a9:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    59ac:	8b 45 08             	mov    0x8(%ebp),%eax
    59af:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    59b2:	8b 45 0c             	mov    0xc(%ebp),%eax
    59b5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    59b8:	eb 17                	jmp    59d1 <memmove+0x2b>
    *dst++ = *src++;
    59ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
    59bd:	8d 50 01             	lea    0x1(%eax),%edx
    59c0:	89 55 fc             	mov    %edx,-0x4(%ebp)
    59c3:	8b 55 f8             	mov    -0x8(%ebp),%edx
    59c6:	8d 4a 01             	lea    0x1(%edx),%ecx
    59c9:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    59cc:	0f b6 12             	movzbl (%edx),%edx
    59cf:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    59d1:	8b 45 10             	mov    0x10(%ebp),%eax
    59d4:	8d 50 ff             	lea    -0x1(%eax),%edx
    59d7:	89 55 10             	mov    %edx,0x10(%ebp)
    59da:	85 c0                	test   %eax,%eax
    59dc:	7f dc                	jg     59ba <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    59de:	8b 45 08             	mov    0x8(%ebp),%eax
}
    59e1:	c9                   	leave  
    59e2:	c3                   	ret    

000059e3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    59e3:	b8 01 00 00 00       	mov    $0x1,%eax
    59e8:	cd 40                	int    $0x40
    59ea:	c3                   	ret    

000059eb <exit>:
SYSCALL(exit)
    59eb:	b8 02 00 00 00       	mov    $0x2,%eax
    59f0:	cd 40                	int    $0x40
    59f2:	c3                   	ret    

000059f3 <wait>:
SYSCALL(wait)
    59f3:	b8 03 00 00 00       	mov    $0x3,%eax
    59f8:	cd 40                	int    $0x40
    59fa:	c3                   	ret    

000059fb <pipe>:
SYSCALL(pipe)
    59fb:	b8 04 00 00 00       	mov    $0x4,%eax
    5a00:	cd 40                	int    $0x40
    5a02:	c3                   	ret    

00005a03 <read>:
SYSCALL(read)
    5a03:	b8 05 00 00 00       	mov    $0x5,%eax
    5a08:	cd 40                	int    $0x40
    5a0a:	c3                   	ret    

00005a0b <write>:
SYSCALL(write)
    5a0b:	b8 10 00 00 00       	mov    $0x10,%eax
    5a10:	cd 40                	int    $0x40
    5a12:	c3                   	ret    

00005a13 <close>:
SYSCALL(close)
    5a13:	b8 15 00 00 00       	mov    $0x15,%eax
    5a18:	cd 40                	int    $0x40
    5a1a:	c3                   	ret    

00005a1b <kill>:
SYSCALL(kill)
    5a1b:	b8 06 00 00 00       	mov    $0x6,%eax
    5a20:	cd 40                	int    $0x40
    5a22:	c3                   	ret    

00005a23 <exec>:
SYSCALL(exec)
    5a23:	b8 07 00 00 00       	mov    $0x7,%eax
    5a28:	cd 40                	int    $0x40
    5a2a:	c3                   	ret    

00005a2b <open>:
SYSCALL(open)
    5a2b:	b8 0f 00 00 00       	mov    $0xf,%eax
    5a30:	cd 40                	int    $0x40
    5a32:	c3                   	ret    

00005a33 <mknod>:
SYSCALL(mknod)
    5a33:	b8 11 00 00 00       	mov    $0x11,%eax
    5a38:	cd 40                	int    $0x40
    5a3a:	c3                   	ret    

00005a3b <unlink>:
SYSCALL(unlink)
    5a3b:	b8 12 00 00 00       	mov    $0x12,%eax
    5a40:	cd 40                	int    $0x40
    5a42:	c3                   	ret    

00005a43 <fstat>:
SYSCALL(fstat)
    5a43:	b8 08 00 00 00       	mov    $0x8,%eax
    5a48:	cd 40                	int    $0x40
    5a4a:	c3                   	ret    

00005a4b <link>:
SYSCALL(link)
    5a4b:	b8 13 00 00 00       	mov    $0x13,%eax
    5a50:	cd 40                	int    $0x40
    5a52:	c3                   	ret    

00005a53 <mkdir>:
SYSCALL(mkdir)
    5a53:	b8 14 00 00 00       	mov    $0x14,%eax
    5a58:	cd 40                	int    $0x40
    5a5a:	c3                   	ret    

00005a5b <chdir>:
SYSCALL(chdir)
    5a5b:	b8 09 00 00 00       	mov    $0x9,%eax
    5a60:	cd 40                	int    $0x40
    5a62:	c3                   	ret    

00005a63 <dup>:
SYSCALL(dup)
    5a63:	b8 0a 00 00 00       	mov    $0xa,%eax
    5a68:	cd 40                	int    $0x40
    5a6a:	c3                   	ret    

00005a6b <getpid>:
SYSCALL(getpid)
    5a6b:	b8 0b 00 00 00       	mov    $0xb,%eax
    5a70:	cd 40                	int    $0x40
    5a72:	c3                   	ret    

00005a73 <sbrk>:
SYSCALL(sbrk)
    5a73:	b8 0c 00 00 00       	mov    $0xc,%eax
    5a78:	cd 40                	int    $0x40
    5a7a:	c3                   	ret    

00005a7b <sleep>:
SYSCALL(sleep)
    5a7b:	b8 0d 00 00 00       	mov    $0xd,%eax
    5a80:	cd 40                	int    $0x40
    5a82:	c3                   	ret    

00005a83 <uptime>:
SYSCALL(uptime)
    5a83:	b8 0e 00 00 00       	mov    $0xe,%eax
    5a88:	cd 40                	int    $0x40
    5a8a:	c3                   	ret    

00005a8b <getMsg>:
SYSCALL(getMsg)
    5a8b:	b8 16 00 00 00       	mov    $0x16,%eax
    5a90:	cd 40                	int    $0x40
    5a92:	c3                   	ret    

00005a93 <createWindow>:
SYSCALL(createWindow)
    5a93:	b8 17 00 00 00       	mov    $0x17,%eax
    5a98:	cd 40                	int    $0x40
    5a9a:	c3                   	ret    

00005a9b <destroyWindow>:
SYSCALL(destroyWindow)
    5a9b:	b8 18 00 00 00       	mov    $0x18,%eax
    5aa0:	cd 40                	int    $0x40
    5aa2:	c3                   	ret    

00005aa3 <updateWindow>:
SYSCALL(updateWindow)
    5aa3:	b8 19 00 00 00       	mov    $0x19,%eax
    5aa8:	cd 40                	int    $0x40
    5aaa:	c3                   	ret    

00005aab <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    5aab:	b8 1a 00 00 00       	mov    $0x1a,%eax
    5ab0:	cd 40                	int    $0x40
    5ab2:	c3                   	ret    

00005ab3 <kwrite>:
SYSCALL(kwrite)
    5ab3:	b8 1c 00 00 00       	mov    $0x1c,%eax
    5ab8:	cd 40                	int    $0x40
    5aba:	c3                   	ret    

00005abb <setSampleRate>:
SYSCALL(setSampleRate)
    5abb:	b8 1b 00 00 00       	mov    $0x1b,%eax
    5ac0:	cd 40                	int    $0x40
    5ac2:	c3                   	ret    

00005ac3 <pause>:
SYSCALL(pause)
    5ac3:	b8 1d 00 00 00       	mov    $0x1d,%eax
    5ac8:	cd 40                	int    $0x40
    5aca:	c3                   	ret    

00005acb <wavdecode>:
SYSCALL(wavdecode)
    5acb:	b8 1e 00 00 00       	mov    $0x1e,%eax
    5ad0:	cd 40                	int    $0x40
    5ad2:	c3                   	ret    

00005ad3 <beginDecode>:
SYSCALL(beginDecode)
    5ad3:	b8 1f 00 00 00       	mov    $0x1f,%eax
    5ad8:	cd 40                	int    $0x40
    5ada:	c3                   	ret    

00005adb <waitForDecode>:
SYSCALL(waitForDecode)
    5adb:	b8 20 00 00 00       	mov    $0x20,%eax
    5ae0:	cd 40                	int    $0x40
    5ae2:	c3                   	ret    

00005ae3 <endDecode>:
SYSCALL(endDecode)
    5ae3:	b8 21 00 00 00       	mov    $0x21,%eax
    5ae8:	cd 40                	int    $0x40
    5aea:	c3                   	ret    

00005aeb <getCoreBuf>:
    5aeb:	b8 22 00 00 00       	mov    $0x22,%eax
    5af0:	cd 40                	int    $0x40
    5af2:	c3                   	ret    

00005af3 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    5af3:	55                   	push   %ebp
    5af4:	89 e5                	mov    %esp,%ebp
    5af6:	83 ec 18             	sub    $0x18,%esp
    5af9:	8b 45 0c             	mov    0xc(%ebp),%eax
    5afc:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    5aff:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    5b06:	00 
    5b07:	8d 45 f4             	lea    -0xc(%ebp),%eax
    5b0a:	89 44 24 04          	mov    %eax,0x4(%esp)
    5b0e:	8b 45 08             	mov    0x8(%ebp),%eax
    5b11:	89 04 24             	mov    %eax,(%esp)
    5b14:	e8 f2 fe ff ff       	call   5a0b <write>
}
    5b19:	c9                   	leave  
    5b1a:	c3                   	ret    

00005b1b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    5b1b:	55                   	push   %ebp
    5b1c:	89 e5                	mov    %esp,%ebp
    5b1e:	56                   	push   %esi
    5b1f:	53                   	push   %ebx
    5b20:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    5b23:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    5b2a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    5b2e:	74 17                	je     5b47 <printint+0x2c>
    5b30:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    5b34:	79 11                	jns    5b47 <printint+0x2c>
    neg = 1;
    5b36:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    5b3d:	8b 45 0c             	mov    0xc(%ebp),%eax
    5b40:	f7 d8                	neg    %eax
    5b42:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5b45:	eb 06                	jmp    5b4d <printint+0x32>
  } else {
    x = xx;
    5b47:	8b 45 0c             	mov    0xc(%ebp),%eax
    5b4a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    5b4d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    5b54:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5b57:	8d 41 01             	lea    0x1(%ecx),%eax
    5b5a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5b5d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    5b60:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5b63:	ba 00 00 00 00       	mov    $0x0,%edx
    5b68:	f7 f3                	div    %ebx
    5b6a:	89 d0                	mov    %edx,%eax
    5b6c:	0f b6 80 bc 0a 01 00 	movzbl 0x10abc(%eax),%eax
    5b73:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    5b77:	8b 75 10             	mov    0x10(%ebp),%esi
    5b7a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5b7d:	ba 00 00 00 00       	mov    $0x0,%edx
    5b82:	f7 f6                	div    %esi
    5b84:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5b87:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5b8b:	75 c7                	jne    5b54 <printint+0x39>
  if(neg)
    5b8d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    5b91:	74 10                	je     5ba3 <printint+0x88>
    buf[i++] = '-';
    5b93:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5b96:	8d 50 01             	lea    0x1(%eax),%edx
    5b99:	89 55 f4             	mov    %edx,-0xc(%ebp)
    5b9c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    5ba1:	eb 1f                	jmp    5bc2 <printint+0xa7>
    5ba3:	eb 1d                	jmp    5bc2 <printint+0xa7>
    putc(fd, buf[i]);
    5ba5:	8d 55 dc             	lea    -0x24(%ebp),%edx
    5ba8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5bab:	01 d0                	add    %edx,%eax
    5bad:	0f b6 00             	movzbl (%eax),%eax
    5bb0:	0f be c0             	movsbl %al,%eax
    5bb3:	89 44 24 04          	mov    %eax,0x4(%esp)
    5bb7:	8b 45 08             	mov    0x8(%ebp),%eax
    5bba:	89 04 24             	mov    %eax,(%esp)
    5bbd:	e8 31 ff ff ff       	call   5af3 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    5bc2:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    5bc6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5bca:	79 d9                	jns    5ba5 <printint+0x8a>
    putc(fd, buf[i]);
}
    5bcc:	83 c4 30             	add    $0x30,%esp
    5bcf:	5b                   	pop    %ebx
    5bd0:	5e                   	pop    %esi
    5bd1:	5d                   	pop    %ebp
    5bd2:	c3                   	ret    

00005bd3 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    5bd3:	55                   	push   %ebp
    5bd4:	89 e5                	mov    %esp,%ebp
    5bd6:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    5bd9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    5be0:	8d 45 0c             	lea    0xc(%ebp),%eax
    5be3:	83 c0 04             	add    $0x4,%eax
    5be6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    5be9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5bf0:	e9 7c 01 00 00       	jmp    5d71 <printf+0x19e>
    c = fmt[i] & 0xff;
    5bf5:	8b 55 0c             	mov    0xc(%ebp),%edx
    5bf8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5bfb:	01 d0                	add    %edx,%eax
    5bfd:	0f b6 00             	movzbl (%eax),%eax
    5c00:	0f be c0             	movsbl %al,%eax
    5c03:	25 ff 00 00 00       	and    $0xff,%eax
    5c08:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    5c0b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5c0f:	75 2c                	jne    5c3d <printf+0x6a>
      if(c == '%'){
    5c11:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    5c15:	75 0c                	jne    5c23 <printf+0x50>
        state = '%';
    5c17:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    5c1e:	e9 4a 01 00 00       	jmp    5d6d <printf+0x19a>
      } else {
        putc(fd, c);
    5c23:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5c26:	0f be c0             	movsbl %al,%eax
    5c29:	89 44 24 04          	mov    %eax,0x4(%esp)
    5c2d:	8b 45 08             	mov    0x8(%ebp),%eax
    5c30:	89 04 24             	mov    %eax,(%esp)
    5c33:	e8 bb fe ff ff       	call   5af3 <putc>
    5c38:	e9 30 01 00 00       	jmp    5d6d <printf+0x19a>
      }
    } else if(state == '%'){
    5c3d:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    5c41:	0f 85 26 01 00 00    	jne    5d6d <printf+0x19a>
      if(c == 'd'){
    5c47:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    5c4b:	75 2d                	jne    5c7a <printf+0xa7>
        printint(fd, *ap, 10, 1);
    5c4d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5c50:	8b 00                	mov    (%eax),%eax
    5c52:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    5c59:	00 
    5c5a:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    5c61:	00 
    5c62:	89 44 24 04          	mov    %eax,0x4(%esp)
    5c66:	8b 45 08             	mov    0x8(%ebp),%eax
    5c69:	89 04 24             	mov    %eax,(%esp)
    5c6c:	e8 aa fe ff ff       	call   5b1b <printint>
        ap++;
    5c71:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    5c75:	e9 ec 00 00 00       	jmp    5d66 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    5c7a:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    5c7e:	74 06                	je     5c86 <printf+0xb3>
    5c80:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    5c84:	75 2d                	jne    5cb3 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    5c86:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5c89:	8b 00                	mov    (%eax),%eax
    5c8b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    5c92:	00 
    5c93:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    5c9a:	00 
    5c9b:	89 44 24 04          	mov    %eax,0x4(%esp)
    5c9f:	8b 45 08             	mov    0x8(%ebp),%eax
    5ca2:	89 04 24             	mov    %eax,(%esp)
    5ca5:	e8 71 fe ff ff       	call   5b1b <printint>
        ap++;
    5caa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    5cae:	e9 b3 00 00 00       	jmp    5d66 <printf+0x193>
      } else if(c == 's'){
    5cb3:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    5cb7:	75 45                	jne    5cfe <printf+0x12b>
        s = (char*)*ap;
    5cb9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5cbc:	8b 00                	mov    (%eax),%eax
    5cbe:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    5cc1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    5cc5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5cc9:	75 09                	jne    5cd4 <printf+0x101>
          s = "(null)";
    5ccb:	c7 45 f4 9b c9 00 00 	movl   $0xc99b,-0xc(%ebp)
        while(*s != 0){
    5cd2:	eb 1e                	jmp    5cf2 <printf+0x11f>
    5cd4:	eb 1c                	jmp    5cf2 <printf+0x11f>
          putc(fd, *s);
    5cd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5cd9:	0f b6 00             	movzbl (%eax),%eax
    5cdc:	0f be c0             	movsbl %al,%eax
    5cdf:	89 44 24 04          	mov    %eax,0x4(%esp)
    5ce3:	8b 45 08             	mov    0x8(%ebp),%eax
    5ce6:	89 04 24             	mov    %eax,(%esp)
    5ce9:	e8 05 fe ff ff       	call   5af3 <putc>
          s++;
    5cee:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    5cf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5cf5:	0f b6 00             	movzbl (%eax),%eax
    5cf8:	84 c0                	test   %al,%al
    5cfa:	75 da                	jne    5cd6 <printf+0x103>
    5cfc:	eb 68                	jmp    5d66 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    5cfe:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    5d02:	75 1d                	jne    5d21 <printf+0x14e>
        putc(fd, *ap);
    5d04:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5d07:	8b 00                	mov    (%eax),%eax
    5d09:	0f be c0             	movsbl %al,%eax
    5d0c:	89 44 24 04          	mov    %eax,0x4(%esp)
    5d10:	8b 45 08             	mov    0x8(%ebp),%eax
    5d13:	89 04 24             	mov    %eax,(%esp)
    5d16:	e8 d8 fd ff ff       	call   5af3 <putc>
        ap++;
    5d1b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    5d1f:	eb 45                	jmp    5d66 <printf+0x193>
      } else if(c == '%'){
    5d21:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    5d25:	75 17                	jne    5d3e <printf+0x16b>
        putc(fd, c);
    5d27:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5d2a:	0f be c0             	movsbl %al,%eax
    5d2d:	89 44 24 04          	mov    %eax,0x4(%esp)
    5d31:	8b 45 08             	mov    0x8(%ebp),%eax
    5d34:	89 04 24             	mov    %eax,(%esp)
    5d37:	e8 b7 fd ff ff       	call   5af3 <putc>
    5d3c:	eb 28                	jmp    5d66 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    5d3e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    5d45:	00 
    5d46:	8b 45 08             	mov    0x8(%ebp),%eax
    5d49:	89 04 24             	mov    %eax,(%esp)
    5d4c:	e8 a2 fd ff ff       	call   5af3 <putc>
        putc(fd, c);
    5d51:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5d54:	0f be c0             	movsbl %al,%eax
    5d57:	89 44 24 04          	mov    %eax,0x4(%esp)
    5d5b:	8b 45 08             	mov    0x8(%ebp),%eax
    5d5e:	89 04 24             	mov    %eax,(%esp)
    5d61:	e8 8d fd ff ff       	call   5af3 <putc>
      }
      state = 0;
    5d66:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    5d6d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5d71:	8b 55 0c             	mov    0xc(%ebp),%edx
    5d74:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5d77:	01 d0                	add    %edx,%eax
    5d79:	0f b6 00             	movzbl (%eax),%eax
    5d7c:	84 c0                	test   %al,%al
    5d7e:	0f 85 71 fe ff ff    	jne    5bf5 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    5d84:	c9                   	leave  
    5d85:	c3                   	ret    

00005d86 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    5d86:	55                   	push   %ebp
    5d87:	89 e5                	mov    %esp,%ebp
    5d89:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    5d8c:	8b 45 08             	mov    0x8(%ebp),%eax
    5d8f:	83 e8 08             	sub    $0x8,%eax
    5d92:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    5d95:	a1 e0 0f 01 00       	mov    0x10fe0,%eax
    5d9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    5d9d:	eb 24                	jmp    5dc3 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    5d9f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5da2:	8b 00                	mov    (%eax),%eax
    5da4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    5da7:	77 12                	ja     5dbb <free+0x35>
    5da9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5dac:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    5daf:	77 24                	ja     5dd5 <free+0x4f>
    5db1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5db4:	8b 00                	mov    (%eax),%eax
    5db6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    5db9:	77 1a                	ja     5dd5 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    5dbb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5dbe:	8b 00                	mov    (%eax),%eax
    5dc0:	89 45 fc             	mov    %eax,-0x4(%ebp)
    5dc3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5dc6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    5dc9:	76 d4                	jbe    5d9f <free+0x19>
    5dcb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5dce:	8b 00                	mov    (%eax),%eax
    5dd0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    5dd3:	76 ca                	jbe    5d9f <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    5dd5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5dd8:	8b 40 04             	mov    0x4(%eax),%eax
    5ddb:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    5de2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5de5:	01 c2                	add    %eax,%edx
    5de7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5dea:	8b 00                	mov    (%eax),%eax
    5dec:	39 c2                	cmp    %eax,%edx
    5dee:	75 24                	jne    5e14 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    5df0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5df3:	8b 50 04             	mov    0x4(%eax),%edx
    5df6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5df9:	8b 00                	mov    (%eax),%eax
    5dfb:	8b 40 04             	mov    0x4(%eax),%eax
    5dfe:	01 c2                	add    %eax,%edx
    5e00:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5e03:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    5e06:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5e09:	8b 00                	mov    (%eax),%eax
    5e0b:	8b 10                	mov    (%eax),%edx
    5e0d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5e10:	89 10                	mov    %edx,(%eax)
    5e12:	eb 0a                	jmp    5e1e <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    5e14:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5e17:	8b 10                	mov    (%eax),%edx
    5e19:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5e1c:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    5e1e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5e21:	8b 40 04             	mov    0x4(%eax),%eax
    5e24:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    5e2b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5e2e:	01 d0                	add    %edx,%eax
    5e30:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    5e33:	75 20                	jne    5e55 <free+0xcf>
    p->s.size += bp->s.size;
    5e35:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5e38:	8b 50 04             	mov    0x4(%eax),%edx
    5e3b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5e3e:	8b 40 04             	mov    0x4(%eax),%eax
    5e41:	01 c2                	add    %eax,%edx
    5e43:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5e46:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    5e49:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5e4c:	8b 10                	mov    (%eax),%edx
    5e4e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5e51:	89 10                	mov    %edx,(%eax)
    5e53:	eb 08                	jmp    5e5d <free+0xd7>
  } else
    p->s.ptr = bp;
    5e55:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5e58:	8b 55 f8             	mov    -0x8(%ebp),%edx
    5e5b:	89 10                	mov    %edx,(%eax)
  freep = p;
    5e5d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5e60:	a3 e0 0f 01 00       	mov    %eax,0x10fe0
}
    5e65:	c9                   	leave  
    5e66:	c3                   	ret    

00005e67 <morecore>:

static Header*
morecore(uint nu)
{
    5e67:	55                   	push   %ebp
    5e68:	89 e5                	mov    %esp,%ebp
    5e6a:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    5e6d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    5e74:	77 07                	ja     5e7d <morecore+0x16>
    nu = 4096;
    5e76:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    5e7d:	8b 45 08             	mov    0x8(%ebp),%eax
    5e80:	c1 e0 03             	shl    $0x3,%eax
    5e83:	89 04 24             	mov    %eax,(%esp)
    5e86:	e8 e8 fb ff ff       	call   5a73 <sbrk>
    5e8b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    5e8e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    5e92:	75 07                	jne    5e9b <morecore+0x34>
    return 0;
    5e94:	b8 00 00 00 00       	mov    $0x0,%eax
    5e99:	eb 22                	jmp    5ebd <morecore+0x56>
  hp = (Header*)p;
    5e9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    5ea1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5ea4:	8b 55 08             	mov    0x8(%ebp),%edx
    5ea7:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    5eaa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5ead:	83 c0 08             	add    $0x8,%eax
    5eb0:	89 04 24             	mov    %eax,(%esp)
    5eb3:	e8 ce fe ff ff       	call   5d86 <free>
  return freep;
    5eb8:	a1 e0 0f 01 00       	mov    0x10fe0,%eax
}
    5ebd:	c9                   	leave  
    5ebe:	c3                   	ret    

00005ebf <malloc>:

void*
malloc(uint nbytes)
{
    5ebf:	55                   	push   %ebp
    5ec0:	89 e5                	mov    %esp,%ebp
    5ec2:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    5ec5:	8b 45 08             	mov    0x8(%ebp),%eax
    5ec8:	83 c0 07             	add    $0x7,%eax
    5ecb:	c1 e8 03             	shr    $0x3,%eax
    5ece:	83 c0 01             	add    $0x1,%eax
    5ed1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    5ed4:	a1 e0 0f 01 00       	mov    0x10fe0,%eax
    5ed9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5edc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    5ee0:	75 23                	jne    5f05 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    5ee2:	c7 45 f0 d8 0f 01 00 	movl   $0x10fd8,-0x10(%ebp)
    5ee9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5eec:	a3 e0 0f 01 00       	mov    %eax,0x10fe0
    5ef1:	a1 e0 0f 01 00       	mov    0x10fe0,%eax
    5ef6:	a3 d8 0f 01 00       	mov    %eax,0x10fd8
    base.s.size = 0;
    5efb:	c7 05 dc 0f 01 00 00 	movl   $0x0,0x10fdc
    5f02:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    5f05:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5f08:	8b 00                	mov    (%eax),%eax
    5f0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    5f0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5f10:	8b 40 04             	mov    0x4(%eax),%eax
    5f13:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    5f16:	72 4d                	jb     5f65 <malloc+0xa6>
      if(p->s.size == nunits)
    5f18:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5f1b:	8b 40 04             	mov    0x4(%eax),%eax
    5f1e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    5f21:	75 0c                	jne    5f2f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    5f23:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5f26:	8b 10                	mov    (%eax),%edx
    5f28:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5f2b:	89 10                	mov    %edx,(%eax)
    5f2d:	eb 26                	jmp    5f55 <malloc+0x96>
      else {
        p->s.size -= nunits;
    5f2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5f32:	8b 40 04             	mov    0x4(%eax),%eax
    5f35:	2b 45 ec             	sub    -0x14(%ebp),%eax
    5f38:	89 c2                	mov    %eax,%edx
    5f3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5f3d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    5f40:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5f43:	8b 40 04             	mov    0x4(%eax),%eax
    5f46:	c1 e0 03             	shl    $0x3,%eax
    5f49:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    5f4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5f4f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5f52:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    5f55:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5f58:	a3 e0 0f 01 00       	mov    %eax,0x10fe0
      return (void*)(p + 1);
    5f5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5f60:	83 c0 08             	add    $0x8,%eax
    5f63:	eb 38                	jmp    5f9d <malloc+0xde>
    }
    if(p == freep)
    5f65:	a1 e0 0f 01 00       	mov    0x10fe0,%eax
    5f6a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    5f6d:	75 1b                	jne    5f8a <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    5f6f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5f72:	89 04 24             	mov    %eax,(%esp)
    5f75:	e8 ed fe ff ff       	call   5e67 <morecore>
    5f7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5f7d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5f81:	75 07                	jne    5f8a <malloc+0xcb>
        return 0;
    5f83:	b8 00 00 00 00       	mov    $0x0,%eax
    5f88:	eb 13                	jmp    5f9d <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    5f8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5f8d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5f90:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5f93:	8b 00                	mov    (%eax),%eax
    5f95:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    5f98:	e9 70 ff ff ff       	jmp    5f0d <malloc+0x4e>
}
    5f9d:	c9                   	leave  
    5f9e:	c3                   	ret    

00005f9f <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    5f9f:	55                   	push   %ebp
    5fa0:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    5fa2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    5fa6:	79 07                	jns    5faf <abs+0x10>
		return x * -1;
    5fa8:	8b 45 08             	mov    0x8(%ebp),%eax
    5fab:	f7 d8                	neg    %eax
    5fad:	eb 03                	jmp    5fb2 <abs+0x13>
	else
		return x;
    5faf:	8b 45 08             	mov    0x8(%ebp),%eax
}
    5fb2:	5d                   	pop    %ebp
    5fb3:	c3                   	ret    

00005fb4 <sin>:
double sin(double x)  
{  
    5fb4:	55                   	push   %ebp
    5fb5:	89 e5                	mov    %esp,%ebp
    5fb7:	83 ec 3c             	sub    $0x3c,%esp
    5fba:	8b 45 08             	mov    0x8(%ebp),%eax
    5fbd:	89 45 c8             	mov    %eax,-0x38(%ebp)
    5fc0:	8b 45 0c             	mov    0xc(%ebp),%eax
    5fc3:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    5fc6:	dd 45 c8             	fldl   -0x38(%ebp)
    5fc9:	dd 5d f8             	fstpl  -0x8(%ebp)
    5fcc:	d9 e8                	fld1   
    5fce:	dd 5d f0             	fstpl  -0x10(%ebp)
    5fd1:	dd 45 c8             	fldl   -0x38(%ebp)
    5fd4:	dd 5d e8             	fstpl  -0x18(%ebp)
    5fd7:	dd 45 c8             	fldl   -0x38(%ebp)
    5fda:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    5fdd:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    5fe4:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    5feb:	eb 50                	jmp    603d <sin+0x89>
	{  
		n = n+1;  
    5fed:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    5ff1:	db 45 dc             	fildl  -0x24(%ebp)
    5ff4:	dc 4d f0             	fmull  -0x10(%ebp)
    5ff7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    5ffa:	83 c0 01             	add    $0x1,%eax
    5ffd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    6000:	db 45 c4             	fildl  -0x3c(%ebp)
    6003:	de c9                	fmulp  %st,%st(1)
    6005:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    6008:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    600c:	dd 45 c8             	fldl   -0x38(%ebp)
    600f:	dc 4d c8             	fmull  -0x38(%ebp)
    6012:	dd 45 e8             	fldl   -0x18(%ebp)
    6015:	de c9                	fmulp  %st,%st(1)
    6017:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    601a:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    601d:	dd 45 e8             	fldl   -0x18(%ebp)
    6020:	dc 75 f0             	fdivl  -0x10(%ebp)
    6023:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    6026:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    602a:	7e 08                	jle    6034 <sin+0x80>
    602c:	dd 45 f8             	fldl   -0x8(%ebp)
    602f:	dc 45 e0             	faddl  -0x20(%ebp)
    6032:	eb 06                	jmp    603a <sin+0x86>
    6034:	dd 45 f8             	fldl   -0x8(%ebp)
    6037:	dc 65 e0             	fsubl  -0x20(%ebp)
    603a:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    603d:	dd 45 e0             	fldl   -0x20(%ebp)
    6040:	dd 05 a8 c9 00 00    	fldl   0xc9a8
    6046:	d9 c9                	fxch   %st(1)
    6048:	df e9                	fucomip %st(1),%st
    604a:	dd d8                	fstp   %st(0)
    604c:	77 9f                	ja     5fed <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    604e:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    6051:	c9                   	leave  
    6052:	c3                   	ret    

00006053 <cos>:
double cos(double x)  
{  
    6053:	55                   	push   %ebp
    6054:	89 e5                	mov    %esp,%ebp
    6056:	83 ec 10             	sub    $0x10,%esp
    6059:	8b 45 08             	mov    0x8(%ebp),%eax
    605c:	89 45 f8             	mov    %eax,-0x8(%ebp)
    605f:	8b 45 0c             	mov    0xc(%ebp),%eax
    6062:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    6065:	dd 05 b0 c9 00 00    	fldl   0xc9b0
    606b:	dc 65 f8             	fsubl  -0x8(%ebp)
    606e:	dd 1c 24             	fstpl  (%esp)
    6071:	e8 3e ff ff ff       	call   5fb4 <sin>
}  
    6076:	c9                   	leave  
    6077:	c3                   	ret    

00006078 <tan>:
double tan(double x)  
{  
    6078:	55                   	push   %ebp
    6079:	89 e5                	mov    %esp,%ebp
    607b:	83 ec 18             	sub    $0x18,%esp
    607e:	8b 45 08             	mov    0x8(%ebp),%eax
    6081:	89 45 f8             	mov    %eax,-0x8(%ebp)
    6084:	8b 45 0c             	mov    0xc(%ebp),%eax
    6087:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    608a:	dd 45 f8             	fldl   -0x8(%ebp)
    608d:	dd 1c 24             	fstpl  (%esp)
    6090:	e8 1f ff ff ff       	call   5fb4 <sin>
    6095:	dd 5d f0             	fstpl  -0x10(%ebp)
    6098:	dd 45 f8             	fldl   -0x8(%ebp)
    609b:	dd 1c 24             	fstpl  (%esp)
    609e:	e8 b0 ff ff ff       	call   6053 <cos>
    60a3:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    60a6:	c9                   	leave  
    60a7:	c3                   	ret    

000060a8 <pow>:

double pow(double x, double y)
{
    60a8:	55                   	push   %ebp
    60a9:	89 e5                	mov    %esp,%ebp
    60ab:	83 ec 48             	sub    $0x48,%esp
    60ae:	8b 45 08             	mov    0x8(%ebp),%eax
    60b1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    60b4:	8b 45 0c             	mov    0xc(%ebp),%eax
    60b7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    60ba:	8b 45 10             	mov    0x10(%ebp),%eax
    60bd:	89 45 d8             	mov    %eax,-0x28(%ebp)
    60c0:	8b 45 14             	mov    0x14(%ebp),%eax
    60c3:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    60c6:	dd 45 e0             	fldl   -0x20(%ebp)
    60c9:	d9 ee                	fldz   
    60cb:	df e9                	fucomip %st(1),%st
    60cd:	dd d8                	fstp   %st(0)
    60cf:	7a 28                	jp     60f9 <pow+0x51>
    60d1:	dd 45 e0             	fldl   -0x20(%ebp)
    60d4:	d9 ee                	fldz   
    60d6:	df e9                	fucomip %st(1),%st
    60d8:	dd d8                	fstp   %st(0)
    60da:	75 1d                	jne    60f9 <pow+0x51>
    60dc:	dd 45 d8             	fldl   -0x28(%ebp)
    60df:	d9 ee                	fldz   
    60e1:	df e9                	fucomip %st(1),%st
    60e3:	dd d8                	fstp   %st(0)
    60e5:	7a 0b                	jp     60f2 <pow+0x4a>
    60e7:	dd 45 d8             	fldl   -0x28(%ebp)
    60ea:	d9 ee                	fldz   
    60ec:	df e9                	fucomip %st(1),%st
    60ee:	dd d8                	fstp   %st(0)
    60f0:	74 07                	je     60f9 <pow+0x51>
    60f2:	d9 ee                	fldz   
    60f4:	e9 30 01 00 00       	jmp    6229 <pow+0x181>
	else if(x==0 && y==0) return 1;
    60f9:	dd 45 e0             	fldl   -0x20(%ebp)
    60fc:	d9 ee                	fldz   
    60fe:	df e9                	fucomip %st(1),%st
    6100:	dd d8                	fstp   %st(0)
    6102:	7a 28                	jp     612c <pow+0x84>
    6104:	dd 45 e0             	fldl   -0x20(%ebp)
    6107:	d9 ee                	fldz   
    6109:	df e9                	fucomip %st(1),%st
    610b:	dd d8                	fstp   %st(0)
    610d:	75 1d                	jne    612c <pow+0x84>
    610f:	dd 45 d8             	fldl   -0x28(%ebp)
    6112:	d9 ee                	fldz   
    6114:	df e9                	fucomip %st(1),%st
    6116:	dd d8                	fstp   %st(0)
    6118:	7a 12                	jp     612c <pow+0x84>
    611a:	dd 45 d8             	fldl   -0x28(%ebp)
    611d:	d9 ee                	fldz   
    611f:	df e9                	fucomip %st(1),%st
    6121:	dd d8                	fstp   %st(0)
    6123:	75 07                	jne    612c <pow+0x84>
    6125:	d9 e8                	fld1   
    6127:	e9 fd 00 00 00       	jmp    6229 <pow+0x181>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    612c:	d9 ee                	fldz   
    612e:	dd 45 d8             	fldl   -0x28(%ebp)
    6131:	d9 c9                	fxch   %st(1)
    6133:	df e9                	fucomip %st(1),%st
    6135:	dd d8                	fstp   %st(0)
    6137:	76 1d                	jbe    6156 <pow+0xae>
    6139:	dd 45 d8             	fldl   -0x28(%ebp)
    613c:	d9 e0                	fchs   
    613e:	dd 5c 24 08          	fstpl  0x8(%esp)
    6142:	dd 45 e0             	fldl   -0x20(%ebp)
    6145:	dd 1c 24             	fstpl  (%esp)
    6148:	e8 5b ff ff ff       	call   60a8 <pow>
    614d:	d9 e8                	fld1   
    614f:	de f1                	fdivp  %st,%st(1)
    6151:	e9 d3 00 00 00       	jmp    6229 <pow+0x181>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    6156:	d9 ee                	fldz   
    6158:	dd 45 e0             	fldl   -0x20(%ebp)
    615b:	d9 c9                	fxch   %st(1)
    615d:	df e9                	fucomip %st(1),%st
    615f:	dd d8                	fstp   %st(0)
    6161:	76 40                	jbe    61a3 <pow+0xfb>
    6163:	dd 45 d8             	fldl   -0x28(%ebp)
    6166:	d9 7d d6             	fnstcw -0x2a(%ebp)
    6169:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    616d:	b4 0c                	mov    $0xc,%ah
    616f:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    6173:	d9 6d d4             	fldcw  -0x2c(%ebp)
    6176:	db 5d d0             	fistpl -0x30(%ebp)
    6179:	d9 6d d6             	fldcw  -0x2a(%ebp)
    617c:	8b 45 d0             	mov    -0x30(%ebp),%eax
    617f:	89 45 d0             	mov    %eax,-0x30(%ebp)
    6182:	db 45 d0             	fildl  -0x30(%ebp)
    6185:	dd 45 d8             	fldl   -0x28(%ebp)
    6188:	de e1                	fsubp  %st,%st(1)
    618a:	d9 ee                	fldz   
    618c:	df e9                	fucomip %st(1),%st
    618e:	7a 0a                	jp     619a <pow+0xf2>
    6190:	d9 ee                	fldz   
    6192:	df e9                	fucomip %st(1),%st
    6194:	dd d8                	fstp   %st(0)
    6196:	74 0b                	je     61a3 <pow+0xfb>
    6198:	eb 02                	jmp    619c <pow+0xf4>
    619a:	dd d8                	fstp   %st(0)
    619c:	d9 ee                	fldz   
    619e:	e9 86 00 00 00       	jmp    6229 <pow+0x181>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    61a3:	d9 ee                	fldz   
    61a5:	dd 45 e0             	fldl   -0x20(%ebp)
    61a8:	d9 c9                	fxch   %st(1)
    61aa:	df e9                	fucomip %st(1),%st
    61ac:	dd d8                	fstp   %st(0)
    61ae:	76 63                	jbe    6213 <pow+0x16b>
    61b0:	dd 45 d8             	fldl   -0x28(%ebp)
    61b3:	d9 7d d6             	fnstcw -0x2a(%ebp)
    61b6:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    61ba:	b4 0c                	mov    $0xc,%ah
    61bc:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    61c0:	d9 6d d4             	fldcw  -0x2c(%ebp)
    61c3:	db 5d d0             	fistpl -0x30(%ebp)
    61c6:	d9 6d d6             	fldcw  -0x2a(%ebp)
    61c9:	8b 45 d0             	mov    -0x30(%ebp),%eax
    61cc:	89 45 d0             	mov    %eax,-0x30(%ebp)
    61cf:	db 45 d0             	fildl  -0x30(%ebp)
    61d2:	dd 45 d8             	fldl   -0x28(%ebp)
    61d5:	de e1                	fsubp  %st,%st(1)
    61d7:	d9 ee                	fldz   
    61d9:	df e9                	fucomip %st(1),%st
    61db:	7a 34                	jp     6211 <pow+0x169>
    61dd:	d9 ee                	fldz   
    61df:	df e9                	fucomip %st(1),%st
    61e1:	dd d8                	fstp   %st(0)
    61e3:	75 2e                	jne    6213 <pow+0x16b>
	{
		double powint=1;
    61e5:	d9 e8                	fld1   
    61e7:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    61ea:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    61f1:	eb 0d                	jmp    6200 <pow+0x158>
    61f3:	dd 45 f0             	fldl   -0x10(%ebp)
    61f6:	dc 4d e0             	fmull  -0x20(%ebp)
    61f9:	dd 5d f0             	fstpl  -0x10(%ebp)
    61fc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6200:	db 45 ec             	fildl  -0x14(%ebp)
    6203:	dd 45 d8             	fldl   -0x28(%ebp)
    6206:	df e9                	fucomip %st(1),%st
    6208:	dd d8                	fstp   %st(0)
    620a:	73 e7                	jae    61f3 <pow+0x14b>
		return powint;
    620c:	dd 45 f0             	fldl   -0x10(%ebp)
    620f:	eb 18                	jmp    6229 <pow+0x181>
    6211:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    6213:	dd 45 e0             	fldl   -0x20(%ebp)
    6216:	dd 1c 24             	fstpl  (%esp)
    6219:	e8 36 00 00 00       	call   6254 <ln>
    621e:	dc 4d d8             	fmull  -0x28(%ebp)
    6221:	dd 1c 24             	fstpl  (%esp)
    6224:	e8 0e 02 00 00       	call   6437 <exp>
}
    6229:	c9                   	leave  
    622a:	c3                   	ret    

0000622b <sqrt>:
// 求根
double sqrt(double x)
{
    622b:	55                   	push   %ebp
    622c:	89 e5                	mov    %esp,%ebp
    622e:	83 ec 28             	sub    $0x28,%esp
    6231:	8b 45 08             	mov    0x8(%ebp),%eax
    6234:	89 45 f0             	mov    %eax,-0x10(%ebp)
    6237:	8b 45 0c             	mov    0xc(%ebp),%eax
    623a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    623d:	dd 05 b8 c9 00 00    	fldl   0xc9b8
    6243:	dd 5c 24 08          	fstpl  0x8(%esp)
    6247:	dd 45 f0             	fldl   -0x10(%ebp)
    624a:	dd 1c 24             	fstpl  (%esp)
    624d:	e8 56 fe ff ff       	call   60a8 <pow>
}
    6252:	c9                   	leave  
    6253:	c3                   	ret    

00006254 <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    6254:	55                   	push   %ebp
    6255:	89 e5                	mov    %esp,%ebp
    6257:	81 ec 88 00 00 00    	sub    $0x88,%esp
    625d:	8b 45 08             	mov    0x8(%ebp),%eax
    6260:	89 45 90             	mov    %eax,-0x70(%ebp)
    6263:	8b 45 0c             	mov    0xc(%ebp),%eax
    6266:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    6269:	dd 45 90             	fldl   -0x70(%ebp)
    626c:	d9 e8                	fld1   
    626e:	de e9                	fsubrp %st,%st(1)
    6270:	dd 5d c0             	fstpl  -0x40(%ebp)
    6273:	d9 ee                	fldz   
    6275:	dd 5d f0             	fstpl  -0x10(%ebp)
    6278:	d9 ee                	fldz   
    627a:	dd 5d b8             	fstpl  -0x48(%ebp)
    627d:	d9 ee                	fldz   
    627f:	dd 5d b0             	fstpl  -0x50(%ebp)
    6282:	d9 ee                	fldz   
    6284:	dd 5d e8             	fstpl  -0x18(%ebp)
    6287:	d9 e8                	fld1   
    6289:	dd 5d e0             	fstpl  -0x20(%ebp)
    628c:	d9 e8                	fld1   
    628e:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    6291:	dd 45 90             	fldl   -0x70(%ebp)
    6294:	d9 e8                	fld1   
    6296:	df e9                	fucomip %st(1),%st
    6298:	dd d8                	fstp   %st(0)
    629a:	7a 12                	jp     62ae <ln+0x5a>
    629c:	dd 45 90             	fldl   -0x70(%ebp)
    629f:	d9 e8                	fld1   
    62a1:	df e9                	fucomip %st(1),%st
    62a3:	dd d8                	fstp   %st(0)
    62a5:	75 07                	jne    62ae <ln+0x5a>
    62a7:	d9 ee                	fldz   
    62a9:	e9 87 01 00 00       	jmp    6435 <ln+0x1e1>
	else if(x>2) return -ln(1/x);
    62ae:	dd 45 90             	fldl   -0x70(%ebp)
    62b1:	dd 05 c0 c9 00 00    	fldl   0xc9c0
    62b7:	d9 c9                	fxch   %st(1)
    62b9:	df e9                	fucomip %st(1),%st
    62bb:	dd d8                	fstp   %st(0)
    62bd:	76 14                	jbe    62d3 <ln+0x7f>
    62bf:	d9 e8                	fld1   
    62c1:	dc 75 90             	fdivl  -0x70(%ebp)
    62c4:	dd 1c 24             	fstpl  (%esp)
    62c7:	e8 88 ff ff ff       	call   6254 <ln>
    62cc:	d9 e0                	fchs   
    62ce:	e9 62 01 00 00       	jmp    6435 <ln+0x1e1>
	else if(x<.1)
    62d3:	dd 05 c8 c9 00 00    	fldl   0xc9c8
    62d9:	dd 45 90             	fldl   -0x70(%ebp)
    62dc:	d9 c9                	fxch   %st(1)
    62de:	df e9                	fucomip %st(1),%st
    62e0:	dd d8                	fstp   %st(0)
    62e2:	76 59                	jbe    633d <ln+0xe9>
	{
		double n=-1;
    62e4:	d9 e8                	fld1   
    62e6:	d9 e0                	fchs   
    62e8:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    62eb:	dd 45 c8             	fldl   -0x38(%ebp)
    62ee:	dd 05 d0 c9 00 00    	fldl   0xc9d0
    62f4:	de e9                	fsubrp %st,%st(1)
    62f6:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    62f9:	dd 45 c8             	fldl   -0x38(%ebp)
    62fc:	dd 1c 24             	fstpl  (%esp)
    62ff:	e8 33 01 00 00       	call   6437 <exp>
    6304:	dd 45 90             	fldl   -0x70(%ebp)
    6307:	de f1                	fdivp  %st,%st(1)
    6309:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    630c:	dd 45 a0             	fldl   -0x60(%ebp)
    630f:	dd 05 c0 c9 00 00    	fldl   0xc9c0
    6315:	d9 c9                	fxch   %st(1)
    6317:	df e9                	fucomip %st(1),%st
    6319:	dd d8                	fstp   %st(0)
    631b:	77 ce                	ja     62eb <ln+0x97>
    631d:	d9 e8                	fld1   
    631f:	dd 45 a0             	fldl   -0x60(%ebp)
    6322:	d9 c9                	fxch   %st(1)
    6324:	df e9                	fucomip %st(1),%st
    6326:	dd d8                	fstp   %st(0)
    6328:	77 c1                	ja     62eb <ln+0x97>
		return ln(a)+n;
    632a:	dd 45 a0             	fldl   -0x60(%ebp)
    632d:	dd 1c 24             	fstpl  (%esp)
    6330:	e8 1f ff ff ff       	call   6254 <ln>
    6335:	dc 45 c8             	faddl  -0x38(%ebp)
    6338:	e9 f8 00 00 00       	jmp    6435 <ln+0x1e1>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    633d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    6344:	d9 e8                	fld1   
    6346:	dd 5d d8             	fstpl  -0x28(%ebp)
    6349:	e9 b6 00 00 00       	jmp    6404 <ln+0x1b0>
	{
		ln_tmp=ln_px;
    634e:	dd 45 e8             	fldl   -0x18(%ebp)
    6351:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    6354:	dd 45 d8             	fldl   -0x28(%ebp)
    6357:	dc 4d c0             	fmull  -0x40(%ebp)
    635a:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    635d:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    6361:	75 0d                	jne    6370 <ln+0x11c>
    6363:	db 45 d4             	fildl  -0x2c(%ebp)
    6366:	dd 45 d8             	fldl   -0x28(%ebp)
    6369:	de f1                	fdivp  %st,%st(1)
    636b:	dd 5d d8             	fstpl  -0x28(%ebp)
    636e:	eb 13                	jmp    6383 <ln+0x12f>
		else tmp=tmp/-l;
    6370:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6373:	f7 d8                	neg    %eax
    6375:	89 45 8c             	mov    %eax,-0x74(%ebp)
    6378:	db 45 8c             	fildl  -0x74(%ebp)
    637b:	dd 45 d8             	fldl   -0x28(%ebp)
    637e:	de f1                	fdivp  %st,%st(1)
    6380:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    6383:	dd 45 f0             	fldl   -0x10(%ebp)
    6386:	dc 45 d8             	faddl  -0x28(%ebp)
    6389:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    638c:	dd 45 d8             	fldl   -0x28(%ebp)
    638f:	d9 e0                	fchs   
    6391:	dc 4d c0             	fmull  -0x40(%ebp)
    6394:	db 45 d4             	fildl  -0x2c(%ebp)
    6397:	de c9                	fmulp  %st,%st(1)
    6399:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    639c:	83 c0 01             	add    $0x1,%eax
    639f:	89 45 8c             	mov    %eax,-0x74(%ebp)
    63a2:	db 45 8c             	fildl  -0x74(%ebp)
    63a5:	de f9                	fdivrp %st,%st(1)
    63a7:	dc 45 f0             	faddl  -0x10(%ebp)
    63aa:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    63ad:	dd 45 d8             	fldl   -0x28(%ebp)
    63b0:	dc 4d c0             	fmull  -0x40(%ebp)
    63b3:	dc 4d c0             	fmull  -0x40(%ebp)
    63b6:	db 45 d4             	fildl  -0x2c(%ebp)
    63b9:	de c9                	fmulp  %st,%st(1)
    63bb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    63be:	83 c0 02             	add    $0x2,%eax
    63c1:	89 45 8c             	mov    %eax,-0x74(%ebp)
    63c4:	db 45 8c             	fildl  -0x74(%ebp)
    63c7:	de f9                	fdivrp %st,%st(1)
    63c9:	dc 45 b8             	faddl  -0x48(%ebp)
    63cc:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    63cf:	dd 45 b0             	fldl   -0x50(%ebp)
    63d2:	dc 65 b8             	fsubl  -0x48(%ebp)
    63d5:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    63d8:	dd 45 a8             	fldl   -0x58(%ebp)
    63db:	dc 4d a8             	fmull  -0x58(%ebp)
    63de:	dd 45 b8             	fldl   -0x48(%ebp)
    63e1:	d8 c0                	fadd   %st(0),%st
    63e3:	dd 45 b0             	fldl   -0x50(%ebp)
    63e6:	de e1                	fsubp  %st,%st(1)
    63e8:	dc 45 f0             	faddl  -0x10(%ebp)
    63eb:	de f9                	fdivrp %st,%st(1)
    63ed:	dd 45 b0             	fldl   -0x50(%ebp)
    63f0:	de e1                	fsubp  %st,%st(1)
    63f2:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    63f5:	db 45 d4             	fildl  -0x2c(%ebp)
    63f8:	dd 45 d8             	fldl   -0x28(%ebp)
    63fb:	de c9                	fmulp  %st,%st(1)
    63fd:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    6400:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    6404:	dd 45 e8             	fldl   -0x18(%ebp)
    6407:	dc 65 e0             	fsubl  -0x20(%ebp)
    640a:	dd 05 d8 c9 00 00    	fldl   0xc9d8
    6410:	d9 c9                	fxch   %st(1)
    6412:	df e9                	fucomip %st(1),%st
    6414:	dd d8                	fstp   %st(0)
    6416:	0f 87 32 ff ff ff    	ja     634e <ln+0xfa>
    641c:	dd 45 e8             	fldl   -0x18(%ebp)
    641f:	dc 65 e0             	fsubl  -0x20(%ebp)
    6422:	dd 05 e0 c9 00 00    	fldl   0xc9e0
    6428:	df e9                	fucomip %st(1),%st
    642a:	dd d8                	fstp   %st(0)
    642c:	0f 87 1c ff ff ff    	ja     634e <ln+0xfa>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    6432:	dd 45 e8             	fldl   -0x18(%ebp)
}
    6435:	c9                   	leave  
    6436:	c3                   	ret    

00006437 <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    6437:	55                   	push   %ebp
    6438:	89 e5                	mov    %esp,%ebp
    643a:	83 ec 78             	sub    $0x78,%esp
    643d:	8b 45 08             	mov    0x8(%ebp),%eax
    6440:	89 45 a0             	mov    %eax,-0x60(%ebp)
    6443:	8b 45 0c             	mov    0xc(%ebp),%eax
    6446:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    6449:	dd 45 a0             	fldl   -0x60(%ebp)
    644c:	dd 5d c0             	fstpl  -0x40(%ebp)
    644f:	d9 ee                	fldz   
    6451:	dd 5d f0             	fstpl  -0x10(%ebp)
    6454:	d9 ee                	fldz   
    6456:	dd 5d b8             	fstpl  -0x48(%ebp)
    6459:	d9 ee                	fldz   
    645b:	dd 5d b0             	fstpl  -0x50(%ebp)
    645e:	d9 ee                	fldz   
    6460:	dd 5d e8             	fstpl  -0x18(%ebp)
    6463:	d9 e8                	fld1   
    6465:	dd 5d e0             	fstpl  -0x20(%ebp)
    6468:	d9 e8                	fld1   
    646a:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    646d:	dd 45 a0             	fldl   -0x60(%ebp)
    6470:	d9 ee                	fldz   
    6472:	df e9                	fucomip %st(1),%st
    6474:	dd d8                	fstp   %st(0)
    6476:	7a 12                	jp     648a <exp+0x53>
    6478:	dd 45 a0             	fldl   -0x60(%ebp)
    647b:	d9 ee                	fldz   
    647d:	df e9                	fucomip %st(1),%st
    647f:	dd d8                	fstp   %st(0)
    6481:	75 07                	jne    648a <exp+0x53>
    6483:	d9 e8                	fld1   
    6485:	e9 08 01 00 00       	jmp    6592 <exp+0x15b>
	if(x<0) return 1/exp(-x); 
    648a:	d9 ee                	fldz   
    648c:	dd 45 a0             	fldl   -0x60(%ebp)
    648f:	d9 c9                	fxch   %st(1)
    6491:	df e9                	fucomip %st(1),%st
    6493:	dd d8                	fstp   %st(0)
    6495:	76 16                	jbe    64ad <exp+0x76>
    6497:	dd 45 a0             	fldl   -0x60(%ebp)
    649a:	d9 e0                	fchs   
    649c:	dd 1c 24             	fstpl  (%esp)
    649f:	e8 93 ff ff ff       	call   6437 <exp>
    64a4:	d9 e8                	fld1   
    64a6:	de f1                	fdivp  %st,%st(1)
    64a8:	e9 e5 00 00 00       	jmp    6592 <exp+0x15b>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    64ad:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    64b4:	d9 e8                	fld1   
    64b6:	dd 5d d0             	fstpl  -0x30(%ebp)
    64b9:	e9 92 00 00 00       	jmp    6550 <exp+0x119>
	{
		ex_tmp=ex_px;
    64be:	dd 45 e8             	fldl   -0x18(%ebp)
    64c1:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    64c4:	dd 45 d0             	fldl   -0x30(%ebp)
    64c7:	dc 4d c0             	fmull  -0x40(%ebp)
    64ca:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    64cd:	db 45 cc             	fildl  -0x34(%ebp)
    64d0:	dd 45 d0             	fldl   -0x30(%ebp)
    64d3:	de f1                	fdivp  %st,%st(1)
    64d5:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    64d8:	dd 45 f0             	fldl   -0x10(%ebp)
    64db:	dc 45 d0             	faddl  -0x30(%ebp)
    64de:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    64e1:	dd 45 d0             	fldl   -0x30(%ebp)
    64e4:	dc 4d c0             	fmull  -0x40(%ebp)
    64e7:	8b 45 cc             	mov    -0x34(%ebp),%eax
    64ea:	83 c0 01             	add    $0x1,%eax
    64ed:	89 45 9c             	mov    %eax,-0x64(%ebp)
    64f0:	db 45 9c             	fildl  -0x64(%ebp)
    64f3:	de f9                	fdivrp %st,%st(1)
    64f5:	dc 45 f0             	faddl  -0x10(%ebp)
    64f8:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    64fb:	dd 45 d0             	fldl   -0x30(%ebp)
    64fe:	dc 4d c0             	fmull  -0x40(%ebp)
    6501:	dc 4d c0             	fmull  -0x40(%ebp)
    6504:	8b 45 cc             	mov    -0x34(%ebp),%eax
    6507:	83 c0 01             	add    $0x1,%eax
    650a:	89 45 9c             	mov    %eax,-0x64(%ebp)
    650d:	db 45 9c             	fildl  -0x64(%ebp)
    6510:	de f9                	fdivrp %st,%st(1)
    6512:	8b 45 cc             	mov    -0x34(%ebp),%eax
    6515:	83 c0 02             	add    $0x2,%eax
    6518:	89 45 9c             	mov    %eax,-0x64(%ebp)
    651b:	db 45 9c             	fildl  -0x64(%ebp)
    651e:	de f9                	fdivrp %st,%st(1)
    6520:	dc 45 b8             	faddl  -0x48(%ebp)
    6523:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    6526:	dd 45 b0             	fldl   -0x50(%ebp)
    6529:	dc 65 b8             	fsubl  -0x48(%ebp)
    652c:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    652f:	dd 45 d8             	fldl   -0x28(%ebp)
    6532:	dc 4d d8             	fmull  -0x28(%ebp)
    6535:	dd 45 b8             	fldl   -0x48(%ebp)
    6538:	d8 c0                	fadd   %st(0),%st
    653a:	dd 45 b0             	fldl   -0x50(%ebp)
    653d:	de e1                	fsubp  %st,%st(1)
    653f:	dc 45 f0             	faddl  -0x10(%ebp)
    6542:	de f9                	fdivrp %st,%st(1)
    6544:	dd 45 b0             	fldl   -0x50(%ebp)
    6547:	de e1                	fsubp  %st,%st(1)
    6549:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    654c:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    6550:	dd 45 e8             	fldl   -0x18(%ebp)
    6553:	dc 65 e0             	fsubl  -0x20(%ebp)
    6556:	dd 05 e8 c9 00 00    	fldl   0xc9e8
    655c:	d9 c9                	fxch   %st(1)
    655e:	df e9                	fucomip %st(1),%st
    6560:	dd d8                	fstp   %st(0)
    6562:	77 12                	ja     6576 <exp+0x13f>
    6564:	dd 45 e8             	fldl   -0x18(%ebp)
    6567:	dc 65 e0             	fsubl  -0x20(%ebp)
    656a:	dd 05 f0 c9 00 00    	fldl   0xc9f0
    6570:	df e9                	fucomip %st(1),%st
    6572:	dd d8                	fstp   %st(0)
    6574:	76 15                	jbe    658b <exp+0x154>
    6576:	dd 45 d8             	fldl   -0x28(%ebp)
    6579:	dd 05 e8 c9 00 00    	fldl   0xc9e8
    657f:	d9 c9                	fxch   %st(1)
    6581:	df e9                	fucomip %st(1),%st
    6583:	dd d8                	fstp   %st(0)
    6585:	0f 87 33 ff ff ff    	ja     64be <exp+0x87>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    658b:	dd 45 e8             	fldl   -0x18(%ebp)
    658e:	d9 e8                	fld1   
    6590:	de c1                	faddp  %st,%st(1)
    6592:	c9                   	leave  
    6593:	c3                   	ret    

00006594 <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    6594:	55                   	push   %ebp
    6595:	89 e5                	mov    %esp,%ebp
    6597:	83 ec 78             	sub    $0x78,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    659a:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    659e:	8b 45 08             	mov    0x8(%ebp),%eax
    65a1:	89 44 24 04          	mov    %eax,0x4(%esp)
    65a5:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    65a8:	89 04 24             	mov    %eax,(%esp)
    65ab:	e8 f8 f1 ff ff       	call   57a8 <strcpy>
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    65b0:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    65b7:	00 
    65b8:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    65bb:	89 04 24             	mov    %eax,(%esp)
    65be:	e8 68 f4 ff ff       	call   5a2b <open>
    65c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    65c6:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    65ca:	75 1b                	jne    65e7 <OpenTableFile+0x53>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    65cc:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    65cf:	89 44 24 08          	mov    %eax,0x8(%esp)
    65d3:	c7 44 24 04 24 ca 00 	movl   $0xca24,0x4(%esp)
    65da:	00 
    65db:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    65e2:	e8 ec f5 ff ff       	call   5bd3 <printf>
    }
    return f;
    65e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    65ea:	c9                   	leave  
    65eb:	c3                   	ret    

000065ec <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    65ec:	55                   	push   %ebp
    65ed:	89 e5                	mov    %esp,%ebp
    65ef:	57                   	push   %edi
    65f0:	56                   	push   %esi
    65f1:	53                   	push   %ebx
    65f2:	83 ec 3c             	sub    $0x3c,%esp
	layer *info = fr_ps->header;
    65f5:	8b 45 08             	mov    0x8(%ebp),%eax
    65f8:	8b 00                	mov    (%eax),%eax
    65fa:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    65fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6600:	8b 78 14             	mov    0x14(%eax),%edi
    6603:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6606:	8b 70 10             	mov    0x10(%eax),%esi
    6609:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    660c:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    660f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6612:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    6615:	85 c0                	test   %eax,%eax
    6617:	0f 94 c0             	sete   %al
    661a:	0f b6 c8             	movzbl %al,%ecx
    661d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6620:	8b 50 04             	mov    0x4(%eax),%edx
    6623:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6626:	8b 00                	mov    (%eax),%eax
    6628:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    662c:	89 74 24 18          	mov    %esi,0x18(%esp)
    6630:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    6634:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    6638:	89 54 24 0c          	mov    %edx,0xc(%esp)
    663c:	89 44 24 08          	mov    %eax,0x8(%esp)
    6640:	c7 44 24 04 44 ca 00 	movl   $0xca44,0x4(%esp)
    6647:	00 
    6648:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    664f:	e8 7f f5 ff ff       	call   5bd3 <printf>
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    6654:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6657:	8b 78 2c             	mov    0x2c(%eax),%edi
    665a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    665d:	8b 70 28             	mov    0x28(%eax),%esi
    6660:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6663:	8b 58 24             	mov    0x24(%eax),%ebx
    6666:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6669:	8b 48 20             	mov    0x20(%eax),%ecx
    666c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    666f:	8b 50 1c             	mov    0x1c(%eax),%edx
    6672:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6675:	8b 40 18             	mov    0x18(%eax),%eax
    6678:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    667c:	89 74 24 18          	mov    %esi,0x18(%esp)
    6680:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    6684:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    6688:	89 54 24 0c          	mov    %edx,0xc(%esp)
    668c:	89 44 24 08          	mov    %eax,0x8(%esp)
    6690:	c7 44 24 04 84 ca 00 	movl   $0xca84,0x4(%esp)
    6697:	00 
    6698:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    669f:	e8 2f f5 ff ff       	call   5bd3 <printf>
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    66a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    66a7:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    66aa:	8b 0c 85 e0 0b 01 00 	mov    0x10be0(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    66b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    66b4:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    66b7:	dd 04 c5 c0 0b 01 00 	fldl   0x10bc0(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    66be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    66c1:	8b 40 04             	mov    0x4(%eax),%eax
    66c4:	8d 50 ff             	lea    -0x1(%eax),%edx
    66c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    66ca:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    66cd:	89 d0                	mov    %edx,%eax
    66cf:	c1 e0 04             	shl    $0x4,%eax
    66d2:	29 d0                	sub    %edx,%eax
    66d4:	01 d8                	add    %ebx,%eax
    66d6:	8b 14 85 00 0b 01 00 	mov    0x10b00(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    66dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    66e0:	8b 40 04             	mov    0x4(%eax),%eax
    66e3:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    66e6:	8b 04 85 e0 0a 01 00 	mov    0x10ae0(,%eax,4),%eax
    66ed:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    66f1:	dd 5c 24 10          	fstpl  0x10(%esp)
    66f5:	89 54 24 0c          	mov    %edx,0xc(%esp)
    66f9:	89 44 24 08          	mov    %eax,0x8(%esp)
    66fd:	c7 44 24 04 ac ca 00 	movl   $0xcaac,0x4(%esp)
    6704:	00 
    6705:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    670c:	e8 c2 f4 ff ff       	call   5bd3 <printf>
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    6711:	8b 45 08             	mov    0x8(%ebp),%eax
    6714:	8b 48 08             	mov    0x8(%eax),%ecx
    6717:	8b 45 08             	mov    0x8(%ebp),%eax
    671a:	8b 50 0c             	mov    0xc(%eax),%edx
    671d:	8b 45 08             	mov    0x8(%ebp),%eax
    6720:	8b 40 10             	mov    0x10(%eax),%eax
    6723:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    6727:	89 54 24 0c          	mov    %edx,0xc(%esp)
    672b:	89 44 24 08          	mov    %eax,0x8(%esp)
    672f:	c7 44 24 04 db ca 00 	movl   $0xcadb,0x4(%esp)
    6736:	00 
    6737:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    673e:	e8 90 f4 ff ff       	call   5bd3 <printf>
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    6743:	83 c4 3c             	add    $0x3c,%esp
    6746:	5b                   	pop    %ebx
    6747:	5e                   	pop    %esi
    6748:	5f                   	pop    %edi
    6749:	5d                   	pop    %ebp
    674a:	c3                   	ret    

0000674b <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    674b:	55                   	push   %ebp
    674c:	89 e5                	mov    %esp,%ebp
    674e:	83 ec 28             	sub    $0x28,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    6751:	8b 45 08             	mov    0x8(%ebp),%eax
    6754:	89 04 24             	mov    %eax,(%esp)
    6757:	e8 63 f7 ff ff       	call   5ebf <malloc>
    675c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    675f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    6763:	74 1c                	je     6781 <mem_alloc+0x36>
		memset(ptr, 0, block);
    6765:	8b 45 08             	mov    0x8(%ebp),%eax
    6768:	89 44 24 08          	mov    %eax,0x8(%esp)
    676c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    6773:	00 
    6774:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6777:	89 04 24             	mov    %eax,(%esp)
    677a:	e8 bf f0 ff ff       	call   583e <memset>
    677f:	eb 20                	jmp    67a1 <mem_alloc+0x56>
	else{
		printf(0, "Unable to allocate %s\n", item);
    6781:	8b 45 0c             	mov    0xc(%ebp),%eax
    6784:	89 44 24 08          	mov    %eax,0x8(%esp)
    6788:	c7 44 24 04 f5 ca 00 	movl   $0xcaf5,0x4(%esp)
    678f:	00 
    6790:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6797:	e8 37 f4 ff ff       	call   5bd3 <printf>
		exit();
    679c:	e8 4a f2 ff ff       	call   59eb <exit>
	}
	return ptr;
    67a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    67a4:	c9                   	leave  
    67a5:	c3                   	ret    

000067a6 <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    67a6:	55                   	push   %ebp
    67a7:	89 e5                	mov    %esp,%ebp
    67a9:	83 ec 18             	sub    $0x18,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    67ac:	8b 45 0c             	mov    0xc(%ebp),%eax
    67af:	c7 44 24 04 0c cb 00 	movl   $0xcb0c,0x4(%esp)
    67b6:	00 
    67b7:	89 04 24             	mov    %eax,(%esp)
    67ba:	e8 8c ff ff ff       	call   674b <mem_alloc>
    67bf:	8b 55 08             	mov    0x8(%ebp),%edx
    67c2:	89 42 04             	mov    %eax,0x4(%edx)
	bs->buf_size = size;
    67c5:	8b 45 08             	mov    0x8(%ebp),%eax
    67c8:	8b 55 0c             	mov    0xc(%ebp),%edx
    67cb:	89 50 08             	mov    %edx,0x8(%eax)
}
    67ce:	c9                   	leave  
    67cf:	c3                   	ret    

000067d0 <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    67d0:	55                   	push   %ebp
    67d1:	89 e5                	mov    %esp,%ebp
    67d3:	83 ec 18             	sub    $0x18,%esp
	free(bs->buf);
    67d6:	8b 45 08             	mov    0x8(%ebp),%eax
    67d9:	8b 40 04             	mov    0x4(%eax),%eax
    67dc:	89 04 24             	mov    %eax,(%esp)
    67df:	e8 a2 f5 ff ff       	call   5d86 <free>
}
    67e4:	c9                   	leave  
    67e5:	c3                   	ret    

000067e6 <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    67e6:	55                   	push   %ebp
    67e7:	89 e5                	mov    %esp,%ebp
    67e9:	83 ec 18             	sub    $0x18,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    67ec:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    67f3:	00 
    67f4:	8b 45 0c             	mov    0xc(%ebp),%eax
    67f7:	89 04 24             	mov    %eax,(%esp)
    67fa:	e8 2c f2 ff ff       	call   5a2b <open>
    67ff:	8b 55 08             	mov    0x8(%ebp),%edx
    6802:	89 02                	mov    %eax,(%edx)
    6804:	8b 45 08             	mov    0x8(%ebp),%eax
    6807:	8b 00                	mov    (%eax),%eax
    6809:	83 f8 ff             	cmp    $0xffffffff,%eax
    680c:	75 20                	jne    682e <open_bit_stream_r+0x48>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    680e:	8b 45 0c             	mov    0xc(%ebp),%eax
    6811:	89 44 24 08          	mov    %eax,0x8(%esp)
    6815:	c7 44 24 04 13 cb 00 	movl   $0xcb13,0x4(%esp)
    681c:	00 
    681d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6824:	e8 aa f3 ff ff       	call   5bd3 <printf>
		exit();
    6829:	e8 bd f1 ff ff       	call   59eb <exit>
	}

	bs->format = BINARY;
    682e:	8b 45 08             	mov    0x8(%ebp),%eax
    6831:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    6835:	8b 45 10             	mov    0x10(%ebp),%eax
    6838:	89 44 24 04          	mov    %eax,0x4(%esp)
    683c:	8b 45 08             	mov    0x8(%ebp),%eax
    683f:	89 04 24             	mov    %eax,(%esp)
    6842:	e8 5f ff ff ff       	call   67a6 <alloc_buffer>
	bs->buf_byte_idx=0;
    6847:	8b 45 08             	mov    0x8(%ebp),%eax
    684a:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    6851:	8b 45 08             	mov    0x8(%ebp),%eax
    6854:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    685b:	8b 45 08             	mov    0x8(%ebp),%eax
    685e:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    6865:	8b 45 08             	mov    0x8(%ebp),%eax
    6868:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    686f:	8b 45 08             	mov    0x8(%ebp),%eax
    6872:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    6879:	8b 45 08             	mov    0x8(%ebp),%eax
    687c:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    6883:	c9                   	leave  
    6884:	c3                   	ret    

00006885 <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    6885:	55                   	push   %ebp
    6886:	89 e5                	mov    %esp,%ebp
    6888:	83 ec 18             	sub    $0x18,%esp
	close(bs->pt);
    688b:	8b 45 08             	mov    0x8(%ebp),%eax
    688e:	8b 00                	mov    (%eax),%eax
    6890:	89 04 24             	mov    %eax,(%esp)
    6893:	e8 7b f1 ff ff       	call   5a13 <close>
	desalloc_buffer(bs);
    6898:	8b 45 08             	mov    0x8(%ebp),%eax
    689b:	89 04 24             	mov    %eax,(%esp)
    689e:	e8 2d ff ff ff       	call   67d0 <desalloc_buffer>
}
    68a3:	c9                   	leave  
    68a4:	c3                   	ret    

000068a5 <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    68a5:	55                   	push   %ebp
    68a6:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    68a8:	8b 45 08             	mov    0x8(%ebp),%eax
    68ab:	8b 40 20             	mov    0x20(%eax),%eax
}
    68ae:	5d                   	pop    %ebp
    68af:	c3                   	ret    

000068b0 <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    68b0:	55                   	push   %ebp
    68b1:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    68b3:	8b 45 08             	mov    0x8(%ebp),%eax
    68b6:	8b 40 0c             	mov    0xc(%eax),%eax
}
    68b9:	5d                   	pop    %ebp
    68ba:	c3                   	ret    

000068bb <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    68bb:	55                   	push   %ebp
    68bc:	89 e5                	mov    %esp,%ebp
    68be:	56                   	push   %esi
    68bf:	53                   	push   %ebx
    68c0:	83 ec 10             	sub    $0x10,%esp
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    68c3:	8b 45 08             	mov    0x8(%ebp),%eax
    68c6:	8b 40 08             	mov    0x8(%eax),%eax
    68c9:	8d 50 fe             	lea    -0x2(%eax),%edx
    68cc:	8b 45 08             	mov    0x8(%ebp),%eax
    68cf:	8b 40 10             	mov    0x10(%eax),%eax
    68d2:	89 d3                	mov    %edx,%ebx
    68d4:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    68d6:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    68db:	eb 35                	jmp    6912 <refill_buffer+0x57>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    68dd:	8b 45 08             	mov    0x8(%ebp),%eax
    68e0:	8b 50 04             	mov    0x4(%eax),%edx
    68e3:	89 d8                	mov    %ebx,%eax
    68e5:	8d 58 ff             	lea    -0x1(%eax),%ebx
    68e8:	01 c2                	add    %eax,%edx
    68ea:	8b 45 08             	mov    0x8(%ebp),%eax
    68ed:	8b 00                	mov    (%eax),%eax
    68ef:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    68f6:	00 
    68f7:	89 54 24 04          	mov    %edx,0x4(%esp)
    68fb:	89 04 24             	mov    %eax,(%esp)
    68fe:	e8 00 f1 ff ff       	call   5a03 <read>
    6903:	89 c6                	mov    %eax,%esi
		if (!n)
    6905:	85 f6                	test   %esi,%esi
    6907:	75 09                	jne    6912 <refill_buffer+0x57>
		bs->eob= i+1;
    6909:	8d 53 01             	lea    0x1(%ebx),%edx
    690c:	8b 45 08             	mov    0x8(%ebp),%eax
    690f:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    6912:	85 db                	test   %ebx,%ebx
    6914:	78 0a                	js     6920 <refill_buffer+0x65>
    6916:	8b 45 08             	mov    0x8(%ebp),%eax
    6919:	8b 40 1c             	mov    0x1c(%eax),%eax
    691c:	85 c0                	test   %eax,%eax
    691e:	74 bd                	je     68dd <refill_buffer+0x22>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    6920:	83 c4 10             	add    $0x10,%esp
    6923:	5b                   	pop    %ebx
    6924:	5e                   	pop    %esi
    6925:	5d                   	pop    %ebp
    6926:	c3                   	ret    

00006927 <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    6927:	55                   	push   %ebp
    6928:	89 e5                	mov    %esp,%ebp
    692a:	53                   	push   %ebx
    692b:	83 ec 24             	sub    $0x24,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    692e:	8b 45 08             	mov    0x8(%ebp),%eax
    6931:	8b 40 0c             	mov    0xc(%eax),%eax
    6934:	8d 50 01             	lea    0x1(%eax),%edx
    6937:	8b 45 08             	mov    0x8(%ebp),%eax
    693a:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    693d:	8b 45 08             	mov    0x8(%ebp),%eax
    6940:	8b 40 14             	mov    0x14(%eax),%eax
    6943:	85 c0                	test   %eax,%eax
    6945:	0f 85 9f 00 00 00    	jne    69ea <get1bit+0xc3>
        bs->buf_bit_idx = 8;
    694b:	8b 45 08             	mov    0x8(%ebp),%eax
    694e:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    6955:	8b 45 08             	mov    0x8(%ebp),%eax
    6958:	8b 40 10             	mov    0x10(%eax),%eax
    695b:	8d 50 ff             	lea    -0x1(%eax),%edx
    695e:	8b 45 08             	mov    0x8(%ebp),%eax
    6961:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    6964:	8b 45 08             	mov    0x8(%ebp),%eax
    6967:	8b 40 10             	mov    0x10(%eax),%eax
    696a:	83 f8 03             	cmp    $0x3,%eax
    696d:	7e 10                	jle    697f <get1bit+0x58>
    696f:	8b 45 08             	mov    0x8(%ebp),%eax
    6972:	8b 50 10             	mov    0x10(%eax),%edx
    6975:	8b 45 08             	mov    0x8(%ebp),%eax
    6978:	8b 40 1c             	mov    0x1c(%eax),%eax
    697b:	39 c2                	cmp    %eax,%edx
    697d:	7d 6b                	jge    69ea <get1bit+0xc3>
             if (bs->eob)
    697f:	8b 45 08             	mov    0x8(%ebp),%eax
    6982:	8b 40 1c             	mov    0x1c(%eax),%eax
    6985:	85 c0                	test   %eax,%eax
    6987:	74 0c                	je     6995 <get1bit+0x6e>
                bs->eobs = TRUE;
    6989:	8b 45 08             	mov    0x8(%ebp),%eax
    698c:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    6993:	eb 55                	jmp    69ea <get1bit+0xc3>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    6995:	8b 45 08             	mov    0x8(%ebp),%eax
    6998:	8b 58 10             	mov    0x10(%eax),%ebx
    699b:	eb 2f                	jmp    69cc <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    699d:	8b 45 08             	mov    0x8(%ebp),%eax
    69a0:	8b 50 04             	mov    0x4(%eax),%edx
    69a3:	8b 45 08             	mov    0x8(%ebp),%eax
    69a6:	8b 40 08             	mov    0x8(%eax),%eax
    69a9:	8d 48 ff             	lea    -0x1(%eax),%ecx
    69ac:	8b 45 08             	mov    0x8(%ebp),%eax
    69af:	8b 40 10             	mov    0x10(%eax),%eax
    69b2:	29 c1                	sub    %eax,%ecx
    69b4:	89 c8                	mov    %ecx,%eax
    69b6:	01 d8                	add    %ebx,%eax
    69b8:	01 c2                	add    %eax,%edx
    69ba:	8b 45 08             	mov    0x8(%ebp),%eax
    69bd:	8b 48 04             	mov    0x4(%eax),%ecx
    69c0:	89 d8                	mov    %ebx,%eax
    69c2:	01 c8                	add    %ecx,%eax
    69c4:	0f b6 00             	movzbl (%eax),%eax
    69c7:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    69c9:	83 eb 01             	sub    $0x1,%ebx
    69cc:	85 db                	test   %ebx,%ebx
    69ce:	79 cd                	jns    699d <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    69d0:	8b 45 08             	mov    0x8(%ebp),%eax
    69d3:	89 04 24             	mov    %eax,(%esp)
    69d6:	e8 e0 fe ff ff       	call   68bb <refill_buffer>
                bs->buf_byte_idx = bs->buf_size-1;
    69db:	8b 45 08             	mov    0x8(%ebp),%eax
    69de:	8b 40 08             	mov    0x8(%eax),%eax
    69e1:	8d 50 ff             	lea    -0x1(%eax),%edx
    69e4:	8b 45 08             	mov    0x8(%ebp),%eax
    69e7:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    69ea:	8b 45 08             	mov    0x8(%ebp),%eax
    69ed:	8b 50 04             	mov    0x4(%eax),%edx
    69f0:	8b 45 08             	mov    0x8(%ebp),%eax
    69f3:	8b 40 10             	mov    0x10(%eax),%eax
    69f6:	01 d0                	add    %edx,%eax
    69f8:	0f b6 00             	movzbl (%eax),%eax
    69fb:	0f b6 d0             	movzbl %al,%edx
    69fe:	8b 45 08             	mov    0x8(%ebp),%eax
    6a01:	8b 40 14             	mov    0x14(%eax),%eax
    6a04:	83 e8 01             	sub    $0x1,%eax
    6a07:	8b 04 85 00 0c 01 00 	mov    0x10c00(,%eax,4),%eax
    6a0e:	21 d0                	and    %edx,%eax
    6a10:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    6a13:	8b 45 08             	mov    0x8(%ebp),%eax
    6a16:	8b 40 14             	mov    0x14(%eax),%eax
    6a19:	83 e8 01             	sub    $0x1,%eax
    6a1c:	89 c1                	mov    %eax,%ecx
    6a1e:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    6a21:	8b 45 08             	mov    0x8(%ebp),%eax
    6a24:	8b 40 14             	mov    0x14(%eax),%eax
    6a27:	8d 50 ff             	lea    -0x1(%eax),%edx
    6a2a:	8b 45 08             	mov    0x8(%ebp),%eax
    6a2d:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    6a30:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    6a33:	83 c4 24             	add    $0x24,%esp
    6a36:	5b                   	pop    %ebx
    6a37:	5d                   	pop    %ebp
    6a38:	c3                   	ret    

00006a39 <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    6a39:	55                   	push   %ebp
    6a3a:	89 e5                	mov    %esp,%ebp
    6a3c:	57                   	push   %edi
    6a3d:	56                   	push   %esi
    6a3e:	53                   	push   %ebx
    6a3f:	83 ec 2c             	sub    $0x2c,%esp
	unsigned long val=0;
    6a42:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    6a49:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    6a4c:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    6a50:	7e 1c                	jle    6a6e <getbits+0x35>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    6a52:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
    6a59:	00 
    6a5a:	c7 44 24 04 2c cb 00 	movl   $0xcb2c,0x4(%esp)
    6a61:	00 
    6a62:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6a69:	e8 65 f1 ff ff       	call   5bd3 <printf>

	bs->totbit += N;
    6a6e:	8b 45 08             	mov    0x8(%ebp),%eax
    6a71:	8b 50 0c             	mov    0xc(%eax),%edx
    6a74:	8b 45 0c             	mov    0xc(%ebp),%eax
    6a77:	01 c2                	add    %eax,%edx
    6a79:	8b 45 08             	mov    0x8(%ebp),%eax
    6a7c:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    6a7f:	e9 0a 01 00 00       	jmp    6b8e <getbits+0x155>
		if (!bs->buf_bit_idx) {
    6a84:	8b 45 08             	mov    0x8(%ebp),%eax
    6a87:	8b 40 14             	mov    0x14(%eax),%eax
    6a8a:	85 c0                	test   %eax,%eax
    6a8c:	0f 85 9f 00 00 00    	jne    6b31 <getbits+0xf8>
			bs->buf_bit_idx = 8;
    6a92:	8b 45 08             	mov    0x8(%ebp),%eax
    6a95:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    6a9c:	8b 45 08             	mov    0x8(%ebp),%eax
    6a9f:	8b 40 10             	mov    0x10(%eax),%eax
    6aa2:	8d 50 ff             	lea    -0x1(%eax),%edx
    6aa5:	8b 45 08             	mov    0x8(%ebp),%eax
    6aa8:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    6aab:	8b 45 08             	mov    0x8(%ebp),%eax
    6aae:	8b 40 10             	mov    0x10(%eax),%eax
    6ab1:	83 f8 03             	cmp    $0x3,%eax
    6ab4:	7e 10                	jle    6ac6 <getbits+0x8d>
    6ab6:	8b 45 08             	mov    0x8(%ebp),%eax
    6ab9:	8b 50 10             	mov    0x10(%eax),%edx
    6abc:	8b 45 08             	mov    0x8(%ebp),%eax
    6abf:	8b 40 1c             	mov    0x1c(%eax),%eax
    6ac2:	39 c2                	cmp    %eax,%edx
    6ac4:	7d 6b                	jge    6b31 <getbits+0xf8>
				if (bs->eob)
    6ac6:	8b 45 08             	mov    0x8(%ebp),%eax
    6ac9:	8b 40 1c             	mov    0x1c(%eax),%eax
    6acc:	85 c0                	test   %eax,%eax
    6ace:	74 0c                	je     6adc <getbits+0xa3>
					bs->eobs = TRUE;
    6ad0:	8b 45 08             	mov    0x8(%ebp),%eax
    6ad3:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    6ada:	eb 55                	jmp    6b31 <getbits+0xf8>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    6adc:	8b 45 08             	mov    0x8(%ebp),%eax
    6adf:	8b 70 10             	mov    0x10(%eax),%esi
    6ae2:	eb 2f                	jmp    6b13 <getbits+0xda>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    6ae4:	8b 45 08             	mov    0x8(%ebp),%eax
    6ae7:	8b 50 04             	mov    0x4(%eax),%edx
    6aea:	8b 45 08             	mov    0x8(%ebp),%eax
    6aed:	8b 40 08             	mov    0x8(%eax),%eax
    6af0:	8d 48 ff             	lea    -0x1(%eax),%ecx
    6af3:	8b 45 08             	mov    0x8(%ebp),%eax
    6af6:	8b 40 10             	mov    0x10(%eax),%eax
    6af9:	29 c1                	sub    %eax,%ecx
    6afb:	89 c8                	mov    %ecx,%eax
    6afd:	01 f0                	add    %esi,%eax
    6aff:	01 c2                	add    %eax,%edx
    6b01:	8b 45 08             	mov    0x8(%ebp),%eax
    6b04:	8b 48 04             	mov    0x4(%eax),%ecx
    6b07:	89 f0                	mov    %esi,%eax
    6b09:	01 c8                	add    %ecx,%eax
    6b0b:	0f b6 00             	movzbl (%eax),%eax
    6b0e:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    6b10:	83 ee 01             	sub    $0x1,%esi
    6b13:	85 f6                	test   %esi,%esi
    6b15:	79 cd                	jns    6ae4 <getbits+0xab>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    6b17:	8b 45 08             	mov    0x8(%ebp),%eax
    6b1a:	89 04 24             	mov    %eax,(%esp)
    6b1d:	e8 99 fd ff ff       	call   68bb <refill_buffer>
					bs->buf_byte_idx = bs->buf_size-1;
    6b22:	8b 45 08             	mov    0x8(%ebp),%eax
    6b25:	8b 40 08             	mov    0x8(%eax),%eax
    6b28:	8d 50 ff             	lea    -0x1(%eax),%edx
    6b2b:	8b 45 08             	mov    0x8(%ebp),%eax
    6b2e:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    6b31:	8b 45 08             	mov    0x8(%ebp),%eax
    6b34:	8b 40 14             	mov    0x14(%eax),%eax
    6b37:	39 d8                	cmp    %ebx,%eax
    6b39:	0f 4f c3             	cmovg  %ebx,%eax
    6b3c:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    6b3e:	8b 45 08             	mov    0x8(%ebp),%eax
    6b41:	8b 50 04             	mov    0x4(%eax),%edx
    6b44:	8b 45 08             	mov    0x8(%ebp),%eax
    6b47:	8b 40 10             	mov    0x10(%eax),%eax
    6b4a:	01 d0                	add    %edx,%eax
    6b4c:	0f b6 00             	movzbl (%eax),%eax
    6b4f:	0f b6 d0             	movzbl %al,%edx
    6b52:	8b 45 08             	mov    0x8(%ebp),%eax
    6b55:	8b 40 14             	mov    0x14(%eax),%eax
    6b58:	8b 04 85 20 0c 01 00 	mov    0x10c20(,%eax,4),%eax
    6b5f:	89 d7                	mov    %edx,%edi
    6b61:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    6b63:	8b 45 08             	mov    0x8(%ebp),%eax
    6b66:	8b 40 14             	mov    0x14(%eax),%eax
    6b69:	29 f0                	sub    %esi,%eax
    6b6b:	89 c1                	mov    %eax,%ecx
    6b6d:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    6b6f:	89 d8                	mov    %ebx,%eax
    6b71:	29 f0                	sub    %esi,%eax
    6b73:	89 c1                	mov    %eax,%ecx
    6b75:	d3 e7                	shl    %cl,%edi
    6b77:	89 f8                	mov    %edi,%eax
    6b79:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    6b7c:	8b 45 08             	mov    0x8(%ebp),%eax
    6b7f:	8b 40 14             	mov    0x14(%eax),%eax
    6b82:	29 f0                	sub    %esi,%eax
    6b84:	89 c2                	mov    %eax,%edx
    6b86:	8b 45 08             	mov    0x8(%ebp),%eax
    6b89:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    6b8c:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    6b8e:	85 db                	test   %ebx,%ebx
    6b90:	0f 8f ee fe ff ff    	jg     6a84 <getbits+0x4b>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    6b96:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    6b99:	83 c4 2c             	add    $0x2c,%esp
    6b9c:	5b                   	pop    %ebx
    6b9d:	5e                   	pop    %esi
    6b9e:	5f                   	pop    %edi
    6b9f:	5d                   	pop    %ebp
    6ba0:	c3                   	ret    

00006ba1 <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    6ba1:	55                   	push   %ebp
    6ba2:	89 e5                	mov    %esp,%ebp
    6ba4:	83 ec 38             	sub    $0x38,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    6ba7:	db 45 10             	fildl  0x10(%ebp)
    6baa:	dd 5c 24 08          	fstpl  0x8(%esp)
    6bae:	dd 05 98 cb 00 00    	fldl   0xcb98
    6bb4:	dd 1c 24             	fstpl  (%esp)
    6bb7:	e8 ec f4 ff ff       	call   60a8 <pow>
    6bbc:	d9 7d e6             	fnstcw -0x1a(%ebp)
    6bbf:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    6bc3:	b4 0c                	mov    $0xc,%ah
    6bc5:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    6bc9:	d9 6d e4             	fldcw  -0x1c(%ebp)
    6bcc:	db 5d e0             	fistpl -0x20(%ebp)
    6bcf:	d9 6d e6             	fldcw  -0x1a(%ebp)
    6bd2:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6bd5:	83 e8 01             	sub    $0x1,%eax
    6bd8:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    6bdb:	8b 45 08             	mov    0x8(%ebp),%eax
    6bde:	89 04 24             	mov    %eax,(%esp)
    6be1:	e8 ca fc ff ff       	call   68b0 <sstell>
    6be6:	83 e0 07             	and    $0x7,%eax
    6be9:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    6bec:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    6bf0:	74 17                	je     6c09 <seek_sync+0x68>
		getbits(bs, (int)(ALIGNING-aligning));
    6bf2:	b8 08 00 00 00       	mov    $0x8,%eax
    6bf7:	2b 45 ec             	sub    -0x14(%ebp),%eax
    6bfa:	89 44 24 04          	mov    %eax,0x4(%esp)
    6bfe:	8b 45 08             	mov    0x8(%ebp),%eax
    6c01:	89 04 24             	mov    %eax,(%esp)
    6c04:	e8 30 fe ff ff       	call   6a39 <getbits>

	val = getbits(bs, N);
    6c09:	8b 45 10             	mov    0x10(%ebp),%eax
    6c0c:	89 44 24 04          	mov    %eax,0x4(%esp)
    6c10:	8b 45 08             	mov    0x8(%ebp),%eax
    6c13:	89 04 24             	mov    %eax,(%esp)
    6c16:	e8 1e fe ff ff       	call   6a39 <getbits>
    6c1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    6c1e:	eb 1a                	jmp    6c3a <seek_sync+0x99>
		val <<= ALIGNING;
    6c20:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    6c24:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    6c2b:	00 
    6c2c:	8b 45 08             	mov    0x8(%ebp),%eax
    6c2f:	89 04 24             	mov    %eax,(%esp)
    6c32:	e8 02 fe ff ff       	call   6a39 <getbits>
    6c37:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    6c3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6c3d:	23 45 f4             	and    -0xc(%ebp),%eax
    6c40:	3b 45 0c             	cmp    0xc(%ebp),%eax
    6c43:	74 0f                	je     6c54 <seek_sync+0xb3>
    6c45:	8b 45 08             	mov    0x8(%ebp),%eax
    6c48:	89 04 24             	mov    %eax,(%esp)
    6c4b:	e8 55 fc ff ff       	call   68a5 <end_bs>
    6c50:	85 c0                	test   %eax,%eax
    6c52:	74 cc                	je     6c20 <seek_sync+0x7f>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    6c54:	8b 45 08             	mov    0x8(%ebp),%eax
    6c57:	89 04 24             	mov    %eax,(%esp)
    6c5a:	e8 46 fc ff ff       	call   68a5 <end_bs>
    6c5f:	85 c0                	test   %eax,%eax
    6c61:	74 07                	je     6c6a <seek_sync+0xc9>
		return(0);
    6c63:	b8 00 00 00 00       	mov    $0x0,%eax
    6c68:	eb 05                	jmp    6c6f <seek_sync+0xce>
	else
		return(1);
    6c6a:	b8 01 00 00 00       	mov    $0x1,%eax
}
    6c6f:	c9                   	leave  
    6c70:	c3                   	ret    

00006c71 <js_bound>:

int js_bound(int lay, int m_ext)
{
    6c71:	55                   	push   %ebp
    6c72:	89 e5                	mov    %esp,%ebp
    6c74:	83 ec 18             	sub    $0x18,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    6c77:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    6c7b:	7e 12                	jle    6c8f <js_bound+0x1e>
    6c7d:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    6c81:	7f 0c                	jg     6c8f <js_bound+0x1e>
    6c83:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    6c87:	78 06                	js     6c8f <js_bound+0x1e>
    6c89:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    6c8d:	7e 27                	jle    6cb6 <js_bound+0x45>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    6c8f:	8b 45 0c             	mov    0xc(%ebp),%eax
    6c92:	89 44 24 0c          	mov    %eax,0xc(%esp)
    6c96:	8b 45 08             	mov    0x8(%ebp),%eax
    6c99:	89 44 24 08          	mov    %eax,0x8(%esp)
    6c9d:	c7 44 24 04 60 cb 00 	movl   $0xcb60,0x4(%esp)
    6ca4:	00 
    6ca5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6cac:	e8 22 ef ff ff       	call   5bd3 <printf>
        exit();
    6cb1:	e8 35 ed ff ff       	call   59eb <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    6cb6:	8b 45 08             	mov    0x8(%ebp),%eax
    6cb9:	83 e8 01             	sub    $0x1,%eax
    6cbc:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    6cc3:	8b 45 0c             	mov    0xc(%ebp),%eax
    6cc6:	01 d0                	add    %edx,%eax
    6cc8:	8b 04 85 60 0c 01 00 	mov    0x10c60(,%eax,4),%eax
}
    6ccf:	c9                   	leave  
    6cd0:	c3                   	ret    

00006cd1 <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    6cd1:	55                   	push   %ebp
    6cd2:	89 e5                	mov    %esp,%ebp
    6cd4:	83 ec 28             	sub    $0x28,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    6cd7:	8b 45 08             	mov    0x8(%ebp),%eax
    6cda:	8b 00                	mov    (%eax),%eax
    6cdc:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    6cdf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6ce2:	8b 50 1c             	mov    0x1c(%eax),%edx
    6ce5:	8b 45 08             	mov    0x8(%ebp),%eax
    6ce8:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    6ceb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6cee:	8b 40 1c             	mov    0x1c(%eax),%eax
    6cf1:	83 f8 03             	cmp    $0x3,%eax
    6cf4:	75 07                	jne    6cfd <hdr_to_frps+0x2c>
    6cf6:	b8 01 00 00 00       	mov    $0x1,%eax
    6cfb:	eb 05                	jmp    6d02 <hdr_to_frps+0x31>
    6cfd:	b8 02 00 00 00       	mov    $0x2,%eax
    6d02:	8b 55 08             	mov    0x8(%ebp),%edx
    6d05:	89 42 08             	mov    %eax,0x8(%edx)
	fr_ps->sblimit = SBLIMIT;
    6d08:	8b 45 08             	mov    0x8(%ebp),%eax
    6d0b:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    6d12:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6d15:	8b 40 1c             	mov    0x1c(%eax),%eax
    6d18:	83 f8 01             	cmp    $0x1,%eax
    6d1b:	75 20                	jne    6d3d <hdr_to_frps+0x6c>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    6d1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6d20:	8b 50 20             	mov    0x20(%eax),%edx
    6d23:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6d26:	8b 40 04             	mov    0x4(%eax),%eax
    6d29:	89 54 24 04          	mov    %edx,0x4(%esp)
    6d2d:	89 04 24             	mov    %eax,(%esp)
    6d30:	e8 3c ff ff ff       	call   6c71 <js_bound>
    6d35:	8b 55 08             	mov    0x8(%ebp),%edx
    6d38:	89 42 0c             	mov    %eax,0xc(%edx)
    6d3b:	eb 0c                	jmp    6d49 <hdr_to_frps+0x78>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    6d3d:	8b 45 08             	mov    0x8(%ebp),%eax
    6d40:	8b 50 10             	mov    0x10(%eax),%edx
    6d43:	8b 45 08             	mov    0x8(%ebp),%eax
    6d46:	89 50 0c             	mov    %edx,0xc(%eax)
}
    6d49:	c9                   	leave  
    6d4a:	c3                   	ret    

00006d4b <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    6d4b:	55                   	push   %ebp
    6d4c:	89 e5                	mov    %esp,%ebp
    6d4e:	83 ec 18             	sub    $0x18,%esp
	if (N != 8) {
    6d51:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    6d55:	74 19                	je     6d70 <hputbuf+0x25>
		printf(0,"Not Supported yet!!\n");
    6d57:	c7 44 24 04 83 cb 00 	movl   $0xcb83,0x4(%esp)
    6d5e:	00 
    6d5f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6d66:	e8 68 ee ff ff       	call   5bd3 <printf>
		exit();
    6d6b:	e8 7b ec ff ff       	call   59eb <exit>
	}
	getCoreBuf(1, val);
    6d70:	8b 45 08             	mov    0x8(%ebp),%eax
    6d73:	89 44 24 04          	mov    %eax,0x4(%esp)
    6d77:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    6d7e:	e8 68 ed ff ff       	call   5aeb <getCoreBuf>
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    6d83:	c9                   	leave  
    6d84:	c3                   	ret    

00006d85 <hsstell>:

unsigned long hsstell()
{
    6d85:	55                   	push   %ebp
    6d86:	89 e5                	mov    %esp,%ebp
    6d88:	83 ec 18             	sub    $0x18,%esp
	return getCoreBuf(2, 0);
    6d8b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    6d92:	00 
    6d93:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    6d9a:	e8 4c ed ff ff       	call   5aeb <getCoreBuf>
//	return(totbit);
}
    6d9f:	c9                   	leave  
    6da0:	c3                   	ret    

00006da1 <hgetbits>:

unsigned long hgetbits(int N)
{
    6da1:	55                   	push   %ebp
    6da2:	89 e5                	mov    %esp,%ebp
    6da4:	83 ec 18             	sub    $0x18,%esp

	return getCoreBuf(3, N);
    6da7:	8b 45 08             	mov    0x8(%ebp),%eax
    6daa:	89 44 24 04          	mov    %eax,0x4(%esp)
    6dae:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    6db5:	e8 31 ed ff ff       	call   5aeb <getCoreBuf>
}
    6dba:	c9                   	leave  
    6dbb:	c3                   	ret    

00006dbc <hget1bit>:


unsigned int hget1bit()
{
    6dbc:	55                   	push   %ebp
    6dbd:	89 e5                	mov    %esp,%ebp
    6dbf:	83 ec 18             	sub    $0x18,%esp
	return(hgetbits(1));
    6dc2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    6dc9:	e8 d3 ff ff ff       	call   6da1 <hgetbits>
}
    6dce:	c9                   	leave  
    6dcf:	c3                   	ret    

00006dd0 <rewindNbits>:


void rewindNbits(int N)
{
    6dd0:	55                   	push   %ebp
    6dd1:	89 e5                	mov    %esp,%ebp
    6dd3:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(4, N);
    6dd6:	8b 45 08             	mov    0x8(%ebp),%eax
    6dd9:	89 44 24 04          	mov    %eax,0x4(%esp)
    6ddd:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    6de4:	e8 02 ed ff ff       	call   5aeb <getCoreBuf>
}
    6de9:	c9                   	leave  
    6dea:	c3                   	ret    

00006deb <rewindNbytes>:


void rewindNbytes(int N)
{
    6deb:	55                   	push   %ebp
    6dec:	89 e5                	mov    %esp,%ebp
    6dee:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(5, N);
    6df1:	8b 45 08             	mov    0x8(%ebp),%eax
    6df4:	89 44 24 04          	mov    %eax,0x4(%esp)
    6df8:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    6dff:	e8 e7 ec ff ff       	call   5aeb <getCoreBuf>
}
    6e04:	c9                   	leave  
    6e05:	c3                   	ret    

00006e06 <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    6e06:	55                   	push   %ebp
    6e07:	89 e5                	mov    %esp,%ebp
    6e09:	57                   	push   %edi
    6e0a:	56                   	push   %esi
    6e0b:	53                   	push   %ebx
    6e0c:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    6e12:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    6e16:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    6e1a:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    6e1e:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    6e22:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    6e26:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    6e2a:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    6e2e:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    6e32:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    6e36:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    6e3a:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    6e3e:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    6e42:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    6e46:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    6e4a:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    6e4e:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    6e52:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    6e56:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    6e5a:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    6e5e:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    6e62:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    6e66:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    6e6a:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    6e6e:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    6e72:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    6e76:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    6e7a:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    6e7e:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    6e82:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    6e86:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    6e8a:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    6e8e:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    6e92:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    6e96:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    6e9a:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    6e9e:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    6ea2:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    6ea6:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    6eaa:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    6eae:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    6eb2:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    6eb6:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    6eba:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    6ebe:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    6ec2:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    6ec6:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    6eca:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    6ece:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    6ed2:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    6ed6:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    6eda:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    6ede:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    6ee2:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    6ee6:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    6eea:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    6eee:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    6ef2:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    6ef6:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    6efa:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    6efe:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    6f02:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    6f06:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    6f0a:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    6f0e:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    6f12:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    6f16:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    6f1a:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    6f1e:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    6f22:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    6f26:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    6f2a:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    6f2e:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    6f32:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    6f36:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    6f3a:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    6f3e:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    6f42:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    6f46:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    6f4a:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    6f4e:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    6f52:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    6f56:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    6f5a:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    6f61:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    6f68:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    6f6f:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    6f76:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    6f7d:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    6f84:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    6f8b:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    6f92:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    6f99:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    6fa0:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    6fa7:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    6fae:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    6fb5:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    6fbc:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    6fc3:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    6fca:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    6fd1:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    6fd8:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    6fdf:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    6fe6:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    6fed:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    6ff4:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    6ffb:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    7002:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    7009:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    7010:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    7017:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    701e:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    7022:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    7026:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    702a:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    702e:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    7032:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    7036:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    703a:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    703e:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    7042:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    7046:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    704a:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    704e:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    7052:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    7056:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    705a:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    705e:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    7062:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    7066:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    706a:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    706e:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    7072:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    7076:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    707a:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    707e:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    7082:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    7086:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    708a:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    708e:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    7092:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    7096:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    709a:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    709e:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    70a2:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    70a6:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    70ad:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    70b4:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    70bb:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    70c2:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    70c9:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    70d0:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    70d7:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    70de:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    70e5:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    70ec:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    70f3:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    70fa:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    7101:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    7108:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    710f:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    7116:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    711d:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    7124:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    712b:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    7132:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    7139:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    7140:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    7147:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    714e:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    7155:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    715c:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    7163:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    716a:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    7171:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    7178:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    717f:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    7186:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    718d:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    7194:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    719b:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    71a2:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    71a9:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    71b0:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    71b7:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    71be:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    71c5:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    71cc:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    71d3:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    71da:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    71e1:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    71e8:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    71ef:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    71f6:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    71fd:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    7204:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    720b:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    7212:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    7219:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    7220:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    7227:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    722e:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    7235:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    723c:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    7243:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    724a:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    7251:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    7258:	8d 95 98 fe ff ff    	lea    -0x168(%ebp),%edx
    725e:	b8 a0 cb 00 00       	mov    $0xcba0,%eax
    7263:	b9 23 00 00 00       	mov    $0x23,%ecx
    7268:	89 d7                	mov    %edx,%edi
    726a:	89 c6                	mov    %eax,%esi
    726c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    726e:	89 f0                	mov    %esi,%eax
    7270:	89 fa                	mov    %edi,%edx
    7272:	0f b7 08             	movzwl (%eax),%ecx
    7275:	66 89 0a             	mov    %cx,(%edx)
    7278:	83 c2 02             	add    $0x2,%edx
    727b:	83 c0 02             	add    $0x2,%eax

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    727e:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    7284:	ba 40 cc 00 00       	mov    $0xcc40,%edx
    7289:	bb 8e 00 00 00       	mov    $0x8e,%ebx
    728e:	89 c1                	mov    %eax,%ecx
    7290:	83 e1 02             	and    $0x2,%ecx
    7293:	85 c9                	test   %ecx,%ecx
    7295:	74 0f                	je     72a6 <read_decoder_table+0x4a0>
    7297:	0f b7 0a             	movzwl (%edx),%ecx
    729a:	66 89 08             	mov    %cx,(%eax)
    729d:	83 c0 02             	add    $0x2,%eax
    72a0:	83 c2 02             	add    $0x2,%edx
    72a3:	83 eb 02             	sub    $0x2,%ebx
    72a6:	89 d9                	mov    %ebx,%ecx
    72a8:	c1 e9 02             	shr    $0x2,%ecx
    72ab:	89 c7                	mov    %eax,%edi
    72ad:	89 d6                	mov    %edx,%esi
    72af:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    72b1:	89 f2                	mov    %esi,%edx
    72b3:	89 f8                	mov    %edi,%eax
    72b5:	b9 00 00 00 00       	mov    $0x0,%ecx
    72ba:	89 de                	mov    %ebx,%esi
    72bc:	83 e6 02             	and    $0x2,%esi
    72bf:	85 f6                	test   %esi,%esi
    72c1:	74 0b                	je     72ce <read_decoder_table+0x4c8>
    72c3:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    72c7:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    72cb:	83 c1 02             	add    $0x2,%ecx
    72ce:	83 e3 01             	and    $0x1,%ebx
    72d1:	85 db                	test   %ebx,%ebx
    72d3:	74 07                	je     72dc <read_decoder_table+0x4d6>
    72d5:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    72d9:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    72dc:	8d 95 7c fd ff ff    	lea    -0x284(%ebp),%edx
    72e2:	b8 e0 cc 00 00       	mov    $0xcce0,%eax
    72e7:	b9 23 00 00 00       	mov    $0x23,%ecx
    72ec:	89 d7                	mov    %edx,%edi
    72ee:	89 c6                	mov    %eax,%esi
    72f0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    72f2:	89 f0                	mov    %esi,%eax
    72f4:	89 fa                	mov    %edi,%edx
    72f6:	0f b7 08             	movzwl (%eax),%ecx
    72f9:	66 89 0a             	mov    %cx,(%edx)
    72fc:	83 c2 02             	add    $0x2,%edx
    72ff:	83 c0 02             	add    $0x2,%eax

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    7302:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    7308:	ba 80 cd 00 00       	mov    $0xcd80,%edx
    730d:	bb fe 00 00 00       	mov    $0xfe,%ebx
    7312:	89 c1                	mov    %eax,%ecx
    7314:	83 e1 02             	and    $0x2,%ecx
    7317:	85 c9                	test   %ecx,%ecx
    7319:	74 0f                	je     732a <read_decoder_table+0x524>
    731b:	0f b7 0a             	movzwl (%edx),%ecx
    731e:	66 89 08             	mov    %cx,(%eax)
    7321:	83 c0 02             	add    $0x2,%eax
    7324:	83 c2 02             	add    $0x2,%edx
    7327:	83 eb 02             	sub    $0x2,%ebx
    732a:	89 d9                	mov    %ebx,%ecx
    732c:	c1 e9 02             	shr    $0x2,%ecx
    732f:	89 c7                	mov    %eax,%edi
    7331:	89 d6                	mov    %edx,%esi
    7333:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    7335:	89 f2                	mov    %esi,%edx
    7337:	89 f8                	mov    %edi,%eax
    7339:	b9 00 00 00 00       	mov    $0x0,%ecx
    733e:	89 de                	mov    %ebx,%esi
    7340:	83 e6 02             	and    $0x2,%esi
    7343:	85 f6                	test   %esi,%esi
    7345:	74 0b                	je     7352 <read_decoder_table+0x54c>
    7347:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    734b:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    734f:	83 c1 02             	add    $0x2,%ecx
    7352:	83 e3 01             	and    $0x1,%ebx
    7355:	85 db                	test   %ebx,%ebx
    7357:	74 07                	je     7360 <read_decoder_table+0x55a>
    7359:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    735d:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    7360:	8d 95 80 fb ff ff    	lea    -0x480(%ebp),%edx
    7366:	b8 80 ce 00 00       	mov    $0xce80,%eax
    736b:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    7370:	89 d7                	mov    %edx,%edi
    7372:	89 c6                	mov    %eax,%esi
    7374:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    7376:	89 f0                	mov    %esi,%eax
    7378:	89 fa                	mov    %edi,%edx
    737a:	0f b7 08             	movzwl (%eax),%ecx
    737d:	66 89 0a             	mov    %cx,(%edx)
    7380:	83 c2 02             	add    $0x2,%edx
    7383:	83 c0 02             	add    $0x2,%eax

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    7386:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    738c:	ba 80 cf 00 00       	mov    $0xcf80,%edx
    7391:	bb fe 00 00 00       	mov    $0xfe,%ebx
    7396:	89 c1                	mov    %eax,%ecx
    7398:	83 e1 02             	and    $0x2,%ecx
    739b:	85 c9                	test   %ecx,%ecx
    739d:	74 0f                	je     73ae <read_decoder_table+0x5a8>
    739f:	0f b7 0a             	movzwl (%edx),%ecx
    73a2:	66 89 08             	mov    %cx,(%eax)
    73a5:	83 c0 02             	add    $0x2,%eax
    73a8:	83 c2 02             	add    $0x2,%edx
    73ab:	83 eb 02             	sub    $0x2,%ebx
    73ae:	89 d9                	mov    %ebx,%ecx
    73b0:	c1 e9 02             	shr    $0x2,%ecx
    73b3:	89 c7                	mov    %eax,%edi
    73b5:	89 d6                	mov    %edx,%esi
    73b7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    73b9:	89 f2                	mov    %esi,%edx
    73bb:	89 f8                	mov    %edi,%eax
    73bd:	b9 00 00 00 00       	mov    $0x0,%ecx
    73c2:	89 de                	mov    %ebx,%esi
    73c4:	83 e6 02             	and    $0x2,%esi
    73c7:	85 f6                	test   %esi,%esi
    73c9:	74 0b                	je     73d6 <read_decoder_table+0x5d0>
    73cb:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    73cf:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    73d3:	83 c1 02             	add    $0x2,%ecx
    73d6:	83 e3 01             	and    $0x1,%ebx
    73d9:	85 db                	test   %ebx,%ebx
    73db:	74 07                	je     73e4 <read_decoder_table+0x5de>
    73dd:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    73e1:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    73e4:	8d 95 84 f6 ff ff    	lea    -0x97c(%ebp),%edx
    73ea:	b8 80 d0 00 00       	mov    $0xd080,%eax
    73ef:	b9 ff 00 00 00       	mov    $0xff,%ecx
    73f4:	89 d7                	mov    %edx,%edi
    73f6:	89 c6                	mov    %eax,%esi
    73f8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    73fa:	89 f0                	mov    %esi,%eax
    73fc:	89 fa                	mov    %edi,%edx
    73fe:	0f b7 08             	movzwl (%eax),%ecx
    7401:	66 89 0a             	mov    %cx,(%edx)
    7404:	83 c2 02             	add    $0x2,%edx
    7407:	83 c0 02             	add    $0x2,%eax

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    740a:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    7410:	ba 80 d4 00 00       	mov    $0xd480,%edx
    7415:	bb fe 03 00 00       	mov    $0x3fe,%ebx
    741a:	89 c1                	mov    %eax,%ecx
    741c:	83 e1 02             	and    $0x2,%ecx
    741f:	85 c9                	test   %ecx,%ecx
    7421:	74 0f                	je     7432 <read_decoder_table+0x62c>
    7423:	0f b7 0a             	movzwl (%edx),%ecx
    7426:	66 89 08             	mov    %cx,(%eax)
    7429:	83 c0 02             	add    $0x2,%eax
    742c:	83 c2 02             	add    $0x2,%edx
    742f:	83 eb 02             	sub    $0x2,%ebx
    7432:	89 d9                	mov    %ebx,%ecx
    7434:	c1 e9 02             	shr    $0x2,%ecx
    7437:	89 c7                	mov    %eax,%edi
    7439:	89 d6                	mov    %edx,%esi
    743b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    743d:	89 f2                	mov    %esi,%edx
    743f:	89 f8                	mov    %edi,%eax
    7441:	b9 00 00 00 00       	mov    $0x0,%ecx
    7446:	89 de                	mov    %ebx,%esi
    7448:	83 e6 02             	and    $0x2,%esi
    744b:	85 f6                	test   %esi,%esi
    744d:	74 0b                	je     745a <read_decoder_table+0x654>
    744f:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    7453:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    7457:	83 c1 02             	add    $0x2,%ecx
    745a:	83 e3 01             	and    $0x1,%ebx
    745d:	85 db                	test   %ebx,%ebx
    745f:	74 07                	je     7468 <read_decoder_table+0x662>
    7461:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    7465:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    7468:	8d 95 88 ee ff ff    	lea    -0x1178(%ebp),%edx
    746e:	b8 80 d8 00 00       	mov    $0xd880,%eax
    7473:	b9 ff 00 00 00       	mov    $0xff,%ecx
    7478:	89 d7                	mov    %edx,%edi
    747a:	89 c6                	mov    %eax,%esi
    747c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    747e:	89 f0                	mov    %esi,%eax
    7480:	89 fa                	mov    %edi,%edx
    7482:	0f b7 08             	movzwl (%eax),%ecx
    7485:	66 89 0a             	mov    %cx,(%edx)
    7488:	83 c2 02             	add    $0x2,%edx
    748b:	83 c0 02             	add    $0x2,%eax

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    748e:	8d 95 88 ea ff ff    	lea    -0x1578(%ebp),%edx
    7494:	bb 80 dc 00 00       	mov    $0xdc80,%ebx
    7499:	b8 00 01 00 00       	mov    $0x100,%eax
    749e:	89 d7                	mov    %edx,%edi
    74a0:	89 de                	mov    %ebx,%esi
    74a2:	89 c1                	mov    %eax,%ecx
    74a4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    74a6:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    74ad:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    74b4:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    74bb:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    74c2:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    74c9:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    74d0:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    74d7:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    74de:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    74e5:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    74ec:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    74f3:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    74fa:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    7501:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    7508:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    750f:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    7516:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    751d:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    7524:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    752b:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    7532:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    7539:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    7540:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    7547:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    754e:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    7555:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    755c:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    7563:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    756a:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    7571:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    7578:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    757f:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    7586:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    758d:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    7594:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    759b:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    75a2:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    75a9:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    75b0:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    75b7:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    75be:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    75c5:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    75cc:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    75d3:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    75da:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    75e1:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    75e8:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    75ef:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    75f6:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    75fd:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    7604:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    760b:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    7612:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    7619:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    7620:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    7627:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    762e:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    7635:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    763c:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    7643:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    764a:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    7651:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    7658:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    765f:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    7666:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    766d:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    7674:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    767b:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    7682:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    7689:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    7690:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    7697:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    769e:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    76a5:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    76ac:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    76b3:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    76ba:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    76c1:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    76c8:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    76cf:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    76d6:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    76dd:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    76e4:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    76eb:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    76f2:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    76f9:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    7700:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    7707:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    770e:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    7715:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    771c:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    7723:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    772a:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    7731:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    7738:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    773f:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    7746:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    774d:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    7754:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    775b:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    7762:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    7769:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    7770:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    7777:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    777e:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    7785:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    778c:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    7793:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    779a:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    77a1:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    77a8:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    77af:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    77b6:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    77bd:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    77c4:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    77cb:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    77d2:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    77d9:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    77e0:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    77e7:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    77ee:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    77f5:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    77fc:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    7803:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    780a:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    7811:	30 00 
    7813:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    781a:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    7821:	00 00 00 
    7824:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    782b:	00 00 00 
    782e:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    7835:	00 00 00 
    7838:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    783f:	00 00 00 
    7842:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    7849:	ff ff ff 
    784c:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    7853:	00 00 00 
    7856:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    785d:	00 00 00 
    7860:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    7867:	00 00 00 
    786a:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    7871:	00 00 00 
    7874:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    787b:	31 00 
    787d:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    7884:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    788b:	00 00 00 
    788e:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    7895:	00 00 00 
    7898:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    789f:	00 00 00 
    78a2:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    78a9:	00 00 00 
    78ac:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    78b3:	ff ff ff 
    78b6:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    78bd:	00 00 00 
    78c0:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    78c7:	00 00 00 
    78ca:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    78cd:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    78d3:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    78da:	00 00 00 
    78dd:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    78e4:	32 00 
    78e6:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    78ed:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    78f4:	00 00 00 
    78f7:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    78fe:	00 00 00 
    7901:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    7908:	00 00 00 
    790b:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    7912:	00 00 00 
    7915:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    791c:	ff ff ff 
    791f:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    7926:	00 00 00 
    7929:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    7930:	00 00 00 
    7933:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    7936:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    793c:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    7943:	00 00 00 
    7946:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    794d:	33 00 
    794f:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    7956:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    795d:	00 00 00 
    7960:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    7967:	00 00 00 
    796a:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    7971:	00 00 00 
    7974:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    797b:	00 00 00 
    797e:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    7985:	ff ff ff 
    7988:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    798f:	00 00 00 
    7992:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    7999:	00 00 00 
    799c:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    799f:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    79a5:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    79ac:	00 00 00 
    79af:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    79b6:	34 00 
    79b8:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    79bf:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    79c6:	00 00 00 
    79c9:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    79d0:	00 00 00 
    79d3:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    79da:	00 00 00 
    79dd:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    79e4:	00 00 00 
    79e7:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    79ee:	ff ff ff 
    79f1:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    79f8:	00 00 00 
    79fb:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    7a02:	00 00 00 
    7a05:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    7a0c:	00 00 00 
    7a0f:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    7a16:	00 00 00 
    7a19:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    7a20:	35 00 
    7a22:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    7a29:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    7a30:	00 00 00 
    7a33:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    7a3a:	00 00 00 
    7a3d:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    7a44:	00 00 00 
    7a47:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    7a4e:	00 00 00 
    7a51:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    7a58:	ff ff ff 
    7a5b:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    7a62:	00 00 00 
    7a65:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    7a6c:	00 00 00 
    7a6f:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    7a75:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    7a7b:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    7a82:	00 00 00 
    7a85:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    7a8c:	36 00 
    7a8e:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    7a95:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    7a9c:	00 00 00 
    7a9f:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    7aa6:	00 00 00 
    7aa9:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    7ab0:	00 00 00 
    7ab3:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    7aba:	00 00 00 
    7abd:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    7ac4:	ff ff ff 
    7ac7:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    7ace:	00 00 00 
    7ad1:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    7ad8:	00 00 00 
    7adb:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    7ae1:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    7ae7:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    7aee:	00 00 00 
    7af1:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    7af8:	37 00 
    7afa:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    7b01:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    7b08:	00 00 00 
    7b0b:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    7b12:	00 00 00 
    7b15:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    7b1c:	00 00 00 
    7b1f:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    7b26:	00 00 00 
    7b29:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    7b30:	ff ff ff 
    7b33:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    7b3a:	00 00 00 
    7b3d:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    7b44:	00 00 00 
    7b47:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    7b4d:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    7b53:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    7b5a:	00 00 00 
    7b5d:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    7b64:	38 00 
    7b66:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    7b6d:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    7b74:	00 00 00 
    7b77:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    7b7e:	00 00 00 
    7b81:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    7b88:	00 00 00 
    7b8b:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    7b92:	00 00 00 
    7b95:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    7b9c:	ff ff ff 
    7b9f:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    7ba6:	00 00 00 
    7ba9:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    7bb0:	00 00 00 
    7bb3:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    7bb9:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    7bbf:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    7bc6:	00 00 00 
    7bc9:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    7bd0:	39 00 
    7bd2:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    7bd9:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    7be0:	00 00 00 
    7be3:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    7bea:	00 00 00 
    7bed:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    7bf4:	00 00 00 
    7bf7:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    7bfe:	00 00 00 
    7c01:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    7c08:	ff ff ff 
    7c0b:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    7c12:	00 00 00 
    7c15:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    7c1c:	00 00 00 
    7c1f:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    7c25:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    7c2b:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    7c32:	00 00 00 
    7c35:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    7c3c:	31 30 
    7c3e:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    7c45:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    7c4c:	00 00 00 
    7c4f:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    7c56:	00 00 00 
    7c59:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    7c60:	00 00 00 
    7c63:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    7c6a:	00 00 00 
    7c6d:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    7c74:	ff ff ff 
    7c77:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    7c7e:	00 00 00 
    7c81:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    7c88:	00 00 00 
    7c8b:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    7c91:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    7c97:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    7c9e:	00 00 00 
    7ca1:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    7ca8:	31 31 
    7caa:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    7cb1:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    7cb8:	00 00 00 
    7cbb:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    7cc2:	00 00 00 
    7cc5:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    7ccc:	00 00 00 
    7ccf:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    7cd6:	00 00 00 
    7cd9:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    7ce0:	ff ff ff 
    7ce3:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    7cea:	00 00 00 
    7ced:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    7cf4:	00 00 00 
    7cf7:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    7cfd:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    7d03:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    7d0a:	00 00 00 
    7d0d:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    7d14:	31 32 
    7d16:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    7d1d:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    7d24:	00 00 00 
    7d27:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    7d2e:	00 00 00 
    7d31:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    7d38:	00 00 00 
    7d3b:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    7d42:	00 00 00 
    7d45:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    7d4c:	ff ff ff 
    7d4f:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    7d56:	00 00 00 
    7d59:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    7d60:	00 00 00 
    7d63:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    7d69:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    7d6f:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    7d76:	00 00 00 
    7d79:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    7d80:	31 33 
    7d82:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    7d89:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    7d90:	00 00 00 
    7d93:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    7d9a:	00 00 00 
    7d9d:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    7da4:	00 00 00 
    7da7:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    7dae:	00 00 00 
    7db1:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    7db8:	ff ff ff 
    7dbb:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    7dc2:	00 00 00 
    7dc5:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    7dcc:	00 00 00 
    7dcf:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    7dd5:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    7ddb:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    7de2:	01 00 00 
    7de5:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    7dec:	31 34 
    7dee:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    7df5:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    7dfc:	00 00 00 
    7dff:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    7e06:	00 00 00 
    7e09:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    7e10:	00 00 00 
    7e13:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    7e1a:	00 00 00 
    7e1d:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    7e24:	ff ff ff 
    7e27:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    7e2e:	00 00 00 
    7e31:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    7e38:	00 00 00 
    7e3b:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    7e42:	00 00 00 
    7e45:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    7e4c:	00 00 00 
    7e4f:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    7e56:	31 35 
    7e58:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    7e5f:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    7e66:	00 00 00 
    7e69:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    7e70:	00 00 00 
    7e73:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    7e7a:	00 00 00 
    7e7d:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    7e84:	00 00 00 
    7e87:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    7e8e:	ff ff ff 
    7e91:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    7e98:	00 00 00 
    7e9b:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    7ea2:	00 00 00 
    7ea5:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    7eab:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    7eb1:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    7eb8:	01 00 00 
    7ebb:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    7ec2:	31 36 
    7ec4:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    7ecb:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    7ed2:	00 00 00 
    7ed5:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    7edc:	00 00 00 
    7edf:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    7ee6:	00 00 00 
    7ee9:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    7ef0:	00 00 00 
    7ef3:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    7efa:	ff ff ff 
    7efd:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    7f04:	00 00 00 
    7f07:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    7f0e:	00 00 00 
    7f11:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7f17:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    7f1d:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    7f24:	01 00 00 
    7f27:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    7f2e:	31 37 
    7f30:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    7f37:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    7f3e:	00 00 00 
    7f41:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    7f48:	00 00 00 
    7f4b:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    7f52:	00 00 00 
    7f55:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    7f5c:	00 00 00 
    7f5f:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    7f66:	00 00 00 
    7f69:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    7f70:	00 00 00 
    7f73:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    7f7a:	00 00 00 
    7f7d:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7f83:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    7f89:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    7f90:	01 00 00 
    7f93:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    7f9a:	31 38 
    7f9c:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    7fa3:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    7faa:	00 00 00 
    7fad:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    7fb4:	00 00 00 
    7fb7:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    7fbe:	00 00 00 
    7fc1:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    7fc8:	00 00 00 
    7fcb:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    7fd2:	00 00 00 
    7fd5:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    7fdc:	00 00 00 
    7fdf:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    7fe6:	00 00 00 
    7fe9:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    7fef:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    7ff5:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    7ffc:	01 00 00 
    7fff:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    8006:	31 39 
    8008:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    800f:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    8016:	00 00 00 
    8019:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    8020:	00 00 00 
    8023:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    802a:	00 00 00 
    802d:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    8034:	00 00 00 
    8037:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    803e:	00 00 00 
    8041:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    8048:	00 00 00 
    804b:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    8052:	00 00 00 
    8055:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    805b:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    8061:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    8068:	01 00 00 
    806b:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    8072:	32 30 
    8074:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    807b:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    8082:	00 00 00 
    8085:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    808c:	00 00 00 
    808f:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    8096:	00 00 00 
    8099:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    80a0:	00 00 00 
    80a3:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    80aa:	00 00 00 
    80ad:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    80b4:	00 00 00 
    80b7:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    80be:	00 00 00 
    80c1:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    80c7:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    80cd:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    80d4:	01 00 00 
    80d7:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    80de:	32 31 
    80e0:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    80e7:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    80ee:	00 00 00 
    80f1:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    80f8:	00 00 00 
    80fb:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    8102:	00 00 00 
    8105:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    810c:	00 00 00 
    810f:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    8116:	00 00 00 
    8119:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    8120:	00 00 00 
    8123:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    812a:	00 00 00 
    812d:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    8133:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    8139:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    8140:	01 00 00 
    8143:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    814a:	32 32 
    814c:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    8153:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    815a:	00 00 00 
    815d:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    8164:	00 00 00 
    8167:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    816e:	00 00 00 
    8171:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    8178:	03 00 00 
    817b:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    8182:	00 00 00 
    8185:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    818c:	00 00 00 
    818f:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    8196:	00 00 00 
    8199:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    819f:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    81a5:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    81ac:	01 00 00 
    81af:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    81b6:	32 33 
    81b8:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    81bf:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    81c6:	00 00 00 
    81c9:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    81d0:	00 00 00 
    81d3:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    81da:	00 00 00 
    81dd:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    81e4:	1f 00 00 
    81e7:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    81ee:	00 00 00 
    81f1:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    81f8:	00 00 00 
    81fb:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    8202:	00 00 00 
    8205:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    820b:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    8211:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    8218:	01 00 00 
    821b:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    8222:	32 34 
    8224:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    822b:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    8232:	00 00 00 
    8235:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    823c:	00 00 00 
    823f:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    8246:	00 00 00 
    8249:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    8250:	00 00 00 
    8253:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    825a:	ff ff ff 
    825d:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    8264:	00 00 00 
    8267:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    826e:	00 00 00 
    8271:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    8277:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    827d:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    8284:	02 00 00 
    8287:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    828e:	32 35 
    8290:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    8297:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    829e:	00 00 00 
    82a1:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    82a8:	00 00 00 
    82ab:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    82b2:	00 00 00 
    82b5:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    82bc:	00 00 00 
    82bf:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    82c6:	00 00 00 
    82c9:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    82d0:	00 00 00 
    82d3:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    82da:	00 00 00 
    82dd:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    82e3:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    82e9:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    82f0:	02 00 00 
    82f3:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    82fa:	32 36 
    82fc:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    8303:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    830a:	00 00 00 
    830d:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    8314:	00 00 00 
    8317:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    831e:	00 00 00 
    8321:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    8328:	00 00 00 
    832b:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    8332:	00 00 00 
    8335:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    833c:	00 00 00 
    833f:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    8346:	00 00 00 
    8349:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    834f:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    8355:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    835c:	02 00 00 
    835f:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    8366:	32 37 
    8368:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    836f:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    8376:	00 00 00 
    8379:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    8380:	00 00 00 
    8383:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    838a:	00 00 00 
    838d:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    8394:	00 00 00 
    8397:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    839e:	00 00 00 
    83a1:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    83a8:	00 00 00 
    83ab:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    83b2:	00 00 00 
    83b5:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    83bb:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    83c1:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    83c8:	02 00 00 
    83cb:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    83d2:	32 38 
    83d4:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    83db:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    83e2:	00 00 00 
    83e5:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    83ec:	00 00 00 
    83ef:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    83f6:	00 00 00 
    83f9:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    8400:	00 00 00 
    8403:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    840a:	00 00 00 
    840d:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    8414:	00 00 00 
    8417:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    841e:	00 00 00 
    8421:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    8427:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    842d:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    8434:	02 00 00 
    8437:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    843e:	32 39 
    8440:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    8447:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    844e:	00 00 00 
    8451:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    8458:	00 00 00 
    845b:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    8462:	00 00 00 
    8465:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    846c:	01 00 00 
    846f:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    8476:	00 00 00 
    8479:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    8480:	00 00 00 
    8483:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    848a:	00 00 00 
    848d:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    8493:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    8499:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    84a0:	02 00 00 
    84a3:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    84aa:	33 30 
    84ac:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    84b3:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    84ba:	00 00 00 
    84bd:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    84c4:	00 00 00 
    84c7:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    84ce:	00 00 00 
    84d1:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    84d8:	07 00 00 
    84db:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    84e2:	00 00 00 
    84e5:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    84ec:	00 00 00 
    84ef:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    84f6:	00 00 00 
    84f9:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    84ff:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    8505:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    850c:	02 00 00 
    850f:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    8516:	33 31 
    8518:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    851f:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    8526:	00 00 00 
    8529:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    8530:	00 00 00 
    8533:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    853a:	00 00 00 
    853d:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    8544:	1f 00 00 
    8547:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    854e:	00 00 00 
    8551:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    8558:	00 00 00 
    855b:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    8562:	00 00 00 
    8565:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    856b:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    8571:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    8578:	02 00 00 
    857b:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    8582:	33 32 
    8584:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    858b:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    8592:	00 00 00 
    8595:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    859c:	00 00 00 
    859f:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    85a6:	00 00 00 
    85a9:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    85b0:	00 00 00 
    85b3:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    85ba:	ff ff ff 
    85bd:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    85c4:	00 00 00 
    85c7:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    85ce:	00 00 00 
    85d1:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    85d7:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    85dd:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    85e4:	00 00 00 
    85e7:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    85ee:	33 33 
    85f0:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    85f7:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    85fe:	00 00 00 
    8601:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    8608:	00 00 00 
    860b:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    8612:	00 00 00 
    8615:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    861c:	00 00 00 
    861f:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    8626:	ff ff ff 
    8629:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    8630:	00 00 00 
    8633:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    863a:	00 00 00 
    863d:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    8643:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    8649:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    8650:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    8653:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    8659:	5b                   	pop    %ebx
    865a:	5e                   	pop    %esi
    865b:	5f                   	pop    %edi
    865c:	5d                   	pop    %ebp
    865d:	c3                   	ret    

0000865e <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    865e:	55                   	push   %ebp
    865f:	89 e5                	mov    %esp,%ebp
    8661:	53                   	push   %ebx
    8662:	83 ec 24             	sub    $0x24,%esp
  HUFFBITS level;
  int point = 0;
    8665:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    866c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    8673:	a1 90 0c 01 00       	mov    0x10c90,%eax
    8678:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    867b:	8b 45 08             	mov    0x8(%ebp),%eax
    867e:	8b 40 20             	mov    0x20(%eax),%eax
    8681:	85 c0                	test   %eax,%eax
    8683:	75 0a                	jne    868f <huffman_decoder+0x31>
    8685:	b8 02 00 00 00       	mov    $0x2,%eax
    868a:	e9 0d 03 00 00       	jmp    899c <huffman_decoder+0x33e>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    868f:	8b 45 08             	mov    0x8(%ebp),%eax
    8692:	8b 40 24             	mov    0x24(%eax),%eax
    8695:	85 c0                	test   %eax,%eax
    8697:	75 1d                	jne    86b6 <huffman_decoder+0x58>
  {  *x = *y = 0;
    8699:	8b 45 10             	mov    0x10(%ebp),%eax
    869c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    86a2:	8b 45 10             	mov    0x10(%ebp),%eax
    86a5:	8b 10                	mov    (%eax),%edx
    86a7:	8b 45 0c             	mov    0xc(%ebp),%eax
    86aa:	89 10                	mov    %edx,(%eax)
     return 0;
    86ac:	b8 00 00 00 00       	mov    $0x0,%eax
    86b1:	e9 e6 02 00 00       	jmp    899c <huffman_decoder+0x33e>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    86b6:	8b 45 08             	mov    0x8(%ebp),%eax
    86b9:	8b 40 20             	mov    0x20(%eax),%eax
    86bc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    86bf:	01 d2                	add    %edx,%edx
    86c1:	01 d0                	add    %edx,%eax
    86c3:	0f b6 00             	movzbl (%eax),%eax
    86c6:	84 c0                	test   %al,%al
    86c8:	75 46                	jne    8710 <huffman_decoder+0xb2>
      *x = h->val[point][1] >> 4;
    86ca:	8b 45 08             	mov    0x8(%ebp),%eax
    86cd:	8b 40 20             	mov    0x20(%eax),%eax
    86d0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    86d3:	01 d2                	add    %edx,%edx
    86d5:	01 d0                	add    %edx,%eax
    86d7:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    86db:	c0 e8 04             	shr    $0x4,%al
    86de:	0f b6 d0             	movzbl %al,%edx
    86e1:	8b 45 0c             	mov    0xc(%ebp),%eax
    86e4:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    86e6:	8b 45 08             	mov    0x8(%ebp),%eax
    86e9:	8b 40 20             	mov    0x20(%eax),%eax
    86ec:	8b 55 f0             	mov    -0x10(%ebp),%edx
    86ef:	01 d2                	add    %edx,%edx
    86f1:	01 d0                	add    %edx,%eax
    86f3:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    86f7:	0f b6 c0             	movzbl %al,%eax
    86fa:	83 e0 0f             	and    $0xf,%eax
    86fd:	89 c2                	mov    %eax,%edx
    86ff:	8b 45 10             	mov    0x10(%ebp),%eax
    8702:	89 10                	mov    %edx,(%eax)

      error = 0;
    8704:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    870b:	e9 af 00 00 00       	jmp    87bf <huffman_decoder+0x161>
    } 
    if (hget1bit()) {
    8710:	e8 a7 e6 ff ff       	call   6dbc <hget1bit>
    8715:	85 c0                	test   %eax,%eax
    8717:	74 47                	je     8760 <huffman_decoder+0x102>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    8719:	eb 17                	jmp    8732 <huffman_decoder+0xd4>
    871b:	8b 45 08             	mov    0x8(%ebp),%eax
    871e:	8b 40 20             	mov    0x20(%eax),%eax
    8721:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8724:	01 d2                	add    %edx,%edx
    8726:	01 d0                	add    %edx,%eax
    8728:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    872c:	0f b6 c0             	movzbl %al,%eax
    872f:	01 45 f0             	add    %eax,-0x10(%ebp)
    8732:	8b 45 08             	mov    0x8(%ebp),%eax
    8735:	8b 40 20             	mov    0x20(%eax),%eax
    8738:	8b 55 f0             	mov    -0x10(%ebp),%edx
    873b:	01 d2                	add    %edx,%edx
    873d:	01 d0                	add    %edx,%eax
    873f:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    8743:	3c f9                	cmp    $0xf9,%al
    8745:	77 d4                	ja     871b <huffman_decoder+0xbd>
      point += h->val[point][1];
    8747:	8b 45 08             	mov    0x8(%ebp),%eax
    874a:	8b 40 20             	mov    0x20(%eax),%eax
    874d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8750:	01 d2                	add    %edx,%edx
    8752:	01 d0                	add    %edx,%eax
    8754:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    8758:	0f b6 c0             	movzbl %al,%eax
    875b:	01 45 f0             	add    %eax,-0x10(%ebp)
    875e:	eb 42                	jmp    87a2 <huffman_decoder+0x144>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    8760:	eb 16                	jmp    8778 <huffman_decoder+0x11a>
    8762:	8b 45 08             	mov    0x8(%ebp),%eax
    8765:	8b 40 20             	mov    0x20(%eax),%eax
    8768:	8b 55 f0             	mov    -0x10(%ebp),%edx
    876b:	01 d2                	add    %edx,%edx
    876d:	01 d0                	add    %edx,%eax
    876f:	0f b6 00             	movzbl (%eax),%eax
    8772:	0f b6 c0             	movzbl %al,%eax
    8775:	01 45 f0             	add    %eax,-0x10(%ebp)
    8778:	8b 45 08             	mov    0x8(%ebp),%eax
    877b:	8b 40 20             	mov    0x20(%eax),%eax
    877e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8781:	01 d2                	add    %edx,%edx
    8783:	01 d0                	add    %edx,%eax
    8785:	0f b6 00             	movzbl (%eax),%eax
    8788:	3c f9                	cmp    $0xf9,%al
    878a:	77 d6                	ja     8762 <huffman_decoder+0x104>
      point += h->val[point][0];
    878c:	8b 45 08             	mov    0x8(%ebp),%eax
    878f:	8b 40 20             	mov    0x20(%eax),%eax
    8792:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8795:	01 d2                	add    %edx,%edx
    8797:	01 d0                	add    %edx,%eax
    8799:	0f b6 00             	movzbl (%eax),%eax
    879c:	0f b6 c0             	movzbl %al,%eax
    879f:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    87a2:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    87a5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    87a9:	0f 85 07 ff ff ff    	jne    86b6 <huffman_decoder+0x58>
    87af:	8b 55 f0             	mov    -0x10(%ebp),%edx
    87b2:	a1 a4 4a 01 00       	mov    0x14aa4,%eax
    87b7:	39 c2                	cmp    %eax,%edx
    87b9:	0f 82 f7 fe ff ff    	jb     86b6 <huffman_decoder+0x58>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    87bf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    87c3:	74 24                	je     87e9 <huffman_decoder+0x18b>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    87c5:	8b 45 08             	mov    0x8(%ebp),%eax
    87c8:	8b 40 04             	mov    0x4(%eax),%eax
    87cb:	83 e8 01             	sub    $0x1,%eax
    87ce:	01 c0                	add    %eax,%eax
    87d0:	89 c2                	mov    %eax,%edx
    87d2:	8b 45 0c             	mov    0xc(%ebp),%eax
    87d5:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    87d7:	8b 45 08             	mov    0x8(%ebp),%eax
    87da:	8b 40 08             	mov    0x8(%eax),%eax
    87dd:	83 e8 01             	sub    $0x1,%eax
    87e0:	01 c0                	add    %eax,%eax
    87e2:	89 c2                	mov    %eax,%edx
    87e4:	8b 45 10             	mov    0x10(%ebp),%eax
    87e7:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    87e9:	8b 45 08             	mov    0x8(%ebp),%eax
    87ec:	0f b6 00             	movzbl (%eax),%eax
    87ef:	3c 33                	cmp    $0x33,%al
    87f1:	0f 85 ec 00 00 00    	jne    88e3 <huffman_decoder+0x285>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    87f7:	8b 45 08             	mov    0x8(%ebp),%eax
    87fa:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    87fe:	3c 32                	cmp    $0x32,%al
    8800:	74 0f                	je     8811 <huffman_decoder+0x1b3>
    8802:	8b 45 08             	mov    0x8(%ebp),%eax
    8805:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    8809:	3c 33                	cmp    $0x33,%al
    880b:	0f 85 d2 00 00 00    	jne    88e3 <huffman_decoder+0x285>
     *v = (*y>>3) & 1;
    8811:	8b 45 10             	mov    0x10(%ebp),%eax
    8814:	8b 00                	mov    (%eax),%eax
    8816:	c1 f8 03             	sar    $0x3,%eax
    8819:	83 e0 01             	and    $0x1,%eax
    881c:	89 c2                	mov    %eax,%edx
    881e:	8b 45 14             	mov    0x14(%ebp),%eax
    8821:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    8823:	8b 45 10             	mov    0x10(%ebp),%eax
    8826:	8b 00                	mov    (%eax),%eax
    8828:	c1 f8 02             	sar    $0x2,%eax
    882b:	83 e0 01             	and    $0x1,%eax
    882e:	89 c2                	mov    %eax,%edx
    8830:	8b 45 18             	mov    0x18(%ebp),%eax
    8833:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    8835:	8b 45 10             	mov    0x10(%ebp),%eax
    8838:	8b 00                	mov    (%eax),%eax
    883a:	d1 f8                	sar    %eax
    883c:	83 e0 01             	and    $0x1,%eax
    883f:	89 c2                	mov    %eax,%edx
    8841:	8b 45 0c             	mov    0xc(%ebp),%eax
    8844:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    8846:	8b 45 10             	mov    0x10(%ebp),%eax
    8849:	8b 00                	mov    (%eax),%eax
    884b:	83 e0 01             	and    $0x1,%eax
    884e:	89 c2                	mov    %eax,%edx
    8850:	8b 45 10             	mov    0x10(%ebp),%eax
    8853:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    8855:	8b 45 14             	mov    0x14(%ebp),%eax
    8858:	8b 00                	mov    (%eax),%eax
    885a:	85 c0                	test   %eax,%eax
    885c:	74 18                	je     8876 <huffman_decoder+0x218>
        if (hget1bit() == 1) *v = -*v;
    885e:	e8 59 e5 ff ff       	call   6dbc <hget1bit>
    8863:	83 f8 01             	cmp    $0x1,%eax
    8866:	75 0e                	jne    8876 <huffman_decoder+0x218>
    8868:	8b 45 14             	mov    0x14(%ebp),%eax
    886b:	8b 00                	mov    (%eax),%eax
    886d:	f7 d8                	neg    %eax
    886f:	89 c2                	mov    %eax,%edx
    8871:	8b 45 14             	mov    0x14(%ebp),%eax
    8874:	89 10                	mov    %edx,(%eax)
     if (*w)
    8876:	8b 45 18             	mov    0x18(%ebp),%eax
    8879:	8b 00                	mov    (%eax),%eax
    887b:	85 c0                	test   %eax,%eax
    887d:	74 18                	je     8897 <huffman_decoder+0x239>
        if (hget1bit() == 1) *w = -*w;
    887f:	e8 38 e5 ff ff       	call   6dbc <hget1bit>
    8884:	83 f8 01             	cmp    $0x1,%eax
    8887:	75 0e                	jne    8897 <huffman_decoder+0x239>
    8889:	8b 45 18             	mov    0x18(%ebp),%eax
    888c:	8b 00                	mov    (%eax),%eax
    888e:	f7 d8                	neg    %eax
    8890:	89 c2                	mov    %eax,%edx
    8892:	8b 45 18             	mov    0x18(%ebp),%eax
    8895:	89 10                	mov    %edx,(%eax)
     if (*x)
    8897:	8b 45 0c             	mov    0xc(%ebp),%eax
    889a:	8b 00                	mov    (%eax),%eax
    889c:	85 c0                	test   %eax,%eax
    889e:	74 18                	je     88b8 <huffman_decoder+0x25a>
        if (hget1bit() == 1) *x = -*x;
    88a0:	e8 17 e5 ff ff       	call   6dbc <hget1bit>
    88a5:	83 f8 01             	cmp    $0x1,%eax
    88a8:	75 0e                	jne    88b8 <huffman_decoder+0x25a>
    88aa:	8b 45 0c             	mov    0xc(%ebp),%eax
    88ad:	8b 00                	mov    (%eax),%eax
    88af:	f7 d8                	neg    %eax
    88b1:	89 c2                	mov    %eax,%edx
    88b3:	8b 45 0c             	mov    0xc(%ebp),%eax
    88b6:	89 10                	mov    %edx,(%eax)
     if (*y)
    88b8:	8b 45 10             	mov    0x10(%ebp),%eax
    88bb:	8b 00                	mov    (%eax),%eax
    88bd:	85 c0                	test   %eax,%eax
    88bf:	74 1d                	je     88de <huffman_decoder+0x280>
        if (hget1bit() == 1) *y = -*y;
    88c1:	e8 f6 e4 ff ff       	call   6dbc <hget1bit>
    88c6:	83 f8 01             	cmp    $0x1,%eax
    88c9:	75 13                	jne    88de <huffman_decoder+0x280>
    88cb:	8b 45 10             	mov    0x10(%ebp),%eax
    88ce:	8b 00                	mov    (%eax),%eax
    88d0:	f7 d8                	neg    %eax
    88d2:	89 c2                	mov    %eax,%edx
    88d4:	8b 45 10             	mov    0x10(%ebp),%eax
    88d7:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    88d9:	e9 bb 00 00 00       	jmp    8999 <huffman_decoder+0x33b>
    88de:	e9 b6 00 00 00       	jmp    8999 <huffman_decoder+0x33b>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    88e3:	8b 45 08             	mov    0x8(%ebp),%eax
    88e6:	8b 40 0c             	mov    0xc(%eax),%eax
    88e9:	85 c0                	test   %eax,%eax
    88eb:	74 30                	je     891d <huffman_decoder+0x2bf>
       if ((h->xlen-1) == *x) 
    88ed:	8b 45 08             	mov    0x8(%ebp),%eax
    88f0:	8b 40 04             	mov    0x4(%eax),%eax
    88f3:	8d 50 ff             	lea    -0x1(%eax),%edx
    88f6:	8b 45 0c             	mov    0xc(%ebp),%eax
    88f9:	8b 00                	mov    (%eax),%eax
    88fb:	39 c2                	cmp    %eax,%edx
    88fd:	75 1e                	jne    891d <huffman_decoder+0x2bf>
         *x += hgetbits(h->linbits);
    88ff:	8b 45 0c             	mov    0xc(%ebp),%eax
    8902:	8b 00                	mov    (%eax),%eax
    8904:	89 c3                	mov    %eax,%ebx
    8906:	8b 45 08             	mov    0x8(%ebp),%eax
    8909:	8b 40 0c             	mov    0xc(%eax),%eax
    890c:	89 04 24             	mov    %eax,(%esp)
    890f:	e8 8d e4 ff ff       	call   6da1 <hgetbits>
    8914:	01 d8                	add    %ebx,%eax
    8916:	89 c2                	mov    %eax,%edx
    8918:	8b 45 0c             	mov    0xc(%ebp),%eax
    891b:	89 10                	mov    %edx,(%eax)
     if (*x)
    891d:	8b 45 0c             	mov    0xc(%ebp),%eax
    8920:	8b 00                	mov    (%eax),%eax
    8922:	85 c0                	test   %eax,%eax
    8924:	74 18                	je     893e <huffman_decoder+0x2e0>
        if (hget1bit() == 1) *x = -*x;
    8926:	e8 91 e4 ff ff       	call   6dbc <hget1bit>
    892b:	83 f8 01             	cmp    $0x1,%eax
    892e:	75 0e                	jne    893e <huffman_decoder+0x2e0>
    8930:	8b 45 0c             	mov    0xc(%ebp),%eax
    8933:	8b 00                	mov    (%eax),%eax
    8935:	f7 d8                	neg    %eax
    8937:	89 c2                	mov    %eax,%edx
    8939:	8b 45 0c             	mov    0xc(%ebp),%eax
    893c:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    893e:	8b 45 08             	mov    0x8(%ebp),%eax
    8941:	8b 40 0c             	mov    0xc(%eax),%eax
    8944:	85 c0                	test   %eax,%eax
    8946:	74 30                	je     8978 <huffman_decoder+0x31a>
       if ((h->ylen-1) == *y)
    8948:	8b 45 08             	mov    0x8(%ebp),%eax
    894b:	8b 40 08             	mov    0x8(%eax),%eax
    894e:	8d 50 ff             	lea    -0x1(%eax),%edx
    8951:	8b 45 10             	mov    0x10(%ebp),%eax
    8954:	8b 00                	mov    (%eax),%eax
    8956:	39 c2                	cmp    %eax,%edx
    8958:	75 1e                	jne    8978 <huffman_decoder+0x31a>
         *y += hgetbits(h->linbits);
    895a:	8b 45 10             	mov    0x10(%ebp),%eax
    895d:	8b 00                	mov    (%eax),%eax
    895f:	89 c3                	mov    %eax,%ebx
    8961:	8b 45 08             	mov    0x8(%ebp),%eax
    8964:	8b 40 0c             	mov    0xc(%eax),%eax
    8967:	89 04 24             	mov    %eax,(%esp)
    896a:	e8 32 e4 ff ff       	call   6da1 <hgetbits>
    896f:	01 d8                	add    %ebx,%eax
    8971:	89 c2                	mov    %eax,%edx
    8973:	8b 45 10             	mov    0x10(%ebp),%eax
    8976:	89 10                	mov    %edx,(%eax)
     if (*y)
    8978:	8b 45 10             	mov    0x10(%ebp),%eax
    897b:	8b 00                	mov    (%eax),%eax
    897d:	85 c0                	test   %eax,%eax
    897f:	74 18                	je     8999 <huffman_decoder+0x33b>
        if (hget1bit() == 1) *y = -*y;
    8981:	e8 36 e4 ff ff       	call   6dbc <hget1bit>
    8986:	83 f8 01             	cmp    $0x1,%eax
    8989:	75 0e                	jne    8999 <huffman_decoder+0x33b>
    898b:	8b 45 10             	mov    0x10(%ebp),%eax
    898e:	8b 00                	mov    (%eax),%eax
    8990:	f7 d8                	neg    %eax
    8992:	89 c2                	mov    %eax,%edx
    8994:	8b 45 10             	mov    0x10(%ebp),%eax
    8997:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    8999:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    899c:	83 c4 24             	add    $0x24,%esp
    899f:	5b                   	pop    %ebx
    89a0:	5d                   	pop    %ebp
    89a1:	c3                   	ret    

000089a2 <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    89a2:	55                   	push   %ebp
    89a3:	89 e5                	mov    %esp,%ebp
    89a5:	83 ec 28             	sub    $0x28,%esp
    layer *hdr = fr_ps->header;
    89a8:	8b 45 0c             	mov    0xc(%ebp),%eax
    89ab:	8b 00                	mov    (%eax),%eax
    89ad:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    89b0:	8b 45 08             	mov    0x8(%ebp),%eax
    89b3:	89 04 24             	mov    %eax,(%esp)
    89b6:	e8 6c df ff ff       	call   6927 <get1bit>
    89bb:	89 c2                	mov    %eax,%edx
    89bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    89c0:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    89c2:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    89c9:	00 
    89ca:	8b 45 08             	mov    0x8(%ebp),%eax
    89cd:	89 04 24             	mov    %eax,(%esp)
    89d0:	e8 64 e0 ff ff       	call   6a39 <getbits>
    89d5:	ba 04 00 00 00       	mov    $0x4,%edx
    89da:	29 c2                	sub    %eax,%edx
    89dc:	89 d0                	mov    %edx,%eax
    89de:	89 c2                	mov    %eax,%edx
    89e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    89e3:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    89e6:	8b 45 08             	mov    0x8(%ebp),%eax
    89e9:	89 04 24             	mov    %eax,(%esp)
    89ec:	e8 36 df ff ff       	call   6927 <get1bit>
    89f1:	85 c0                	test   %eax,%eax
    89f3:	0f 94 c0             	sete   %al
    89f6:	0f b6 d0             	movzbl %al,%edx
    89f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    89fc:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    89ff:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    8a06:	00 
    8a07:	8b 45 08             	mov    0x8(%ebp),%eax
    8a0a:	89 04 24             	mov    %eax,(%esp)
    8a0d:	e8 27 e0 ff ff       	call   6a39 <getbits>
    8a12:	89 c2                	mov    %eax,%edx
    8a14:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a17:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    8a1a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8a21:	00 
    8a22:	8b 45 08             	mov    0x8(%ebp),%eax
    8a25:	89 04 24             	mov    %eax,(%esp)
    8a28:	e8 0c e0 ff ff       	call   6a39 <getbits>
    8a2d:	89 c2                	mov    %eax,%edx
    8a2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a32:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    8a35:	8b 45 08             	mov    0x8(%ebp),%eax
    8a38:	89 04 24             	mov    %eax,(%esp)
    8a3b:	e8 e7 de ff ff       	call   6927 <get1bit>
    8a40:	89 c2                	mov    %eax,%edx
    8a42:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a45:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    8a48:	8b 45 08             	mov    0x8(%ebp),%eax
    8a4b:	89 04 24             	mov    %eax,(%esp)
    8a4e:	e8 d4 de ff ff       	call   6927 <get1bit>
    8a53:	89 c2                	mov    %eax,%edx
    8a55:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a58:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    8a5b:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8a62:	00 
    8a63:	8b 45 08             	mov    0x8(%ebp),%eax
    8a66:	89 04 24             	mov    %eax,(%esp)
    8a69:	e8 cb df ff ff       	call   6a39 <getbits>
    8a6e:	89 c2                	mov    %eax,%edx
    8a70:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a73:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    8a76:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8a7d:	00 
    8a7e:	8b 45 08             	mov    0x8(%ebp),%eax
    8a81:	89 04 24             	mov    %eax,(%esp)
    8a84:	e8 b0 df ff ff       	call   6a39 <getbits>
    8a89:	89 c2                	mov    %eax,%edx
    8a8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8a8e:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    8a91:	8b 45 08             	mov    0x8(%ebp),%eax
    8a94:	89 04 24             	mov    %eax,(%esp)
    8a97:	e8 8b de ff ff       	call   6927 <get1bit>
    8a9c:	89 c2                	mov    %eax,%edx
    8a9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8aa1:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    8aa4:	8b 45 08             	mov    0x8(%ebp),%eax
    8aa7:	89 04 24             	mov    %eax,(%esp)
    8aaa:	e8 78 de ff ff       	call   6927 <get1bit>
    8aaf:	89 c2                	mov    %eax,%edx
    8ab1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8ab4:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    8ab7:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8abe:	00 
    8abf:	8b 45 08             	mov    0x8(%ebp),%eax
    8ac2:	89 04 24             	mov    %eax,(%esp)
    8ac5:	e8 6f df ff ff       	call   6a39 <getbits>
    8aca:	89 c2                	mov    %eax,%edx
    8acc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8acf:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    8ad2:	c9                   	leave  
    8ad3:	c3                   	ret    

00008ad4 <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    8ad4:	55                   	push   %ebp
    8ad5:	89 e5                	mov    %esp,%ebp
    8ad7:	56                   	push   %esi
    8ad8:	53                   	push   %ebx
    8ad9:	83 ec 20             	sub    $0x20,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    8adc:	8b 45 10             	mov    0x10(%ebp),%eax
    8adf:	8b 40 08             	mov    0x8(%eax),%eax
    8ae2:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    8ae5:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    8aec:	00 
    8aed:	8b 45 08             	mov    0x8(%ebp),%eax
    8af0:	89 04 24             	mov    %eax,(%esp)
    8af3:	e8 41 df ff ff       	call   6a39 <getbits>
    8af8:	8b 55 0c             	mov    0xc(%ebp),%edx
    8afb:	89 02                	mov    %eax,(%edx)
	if (stereo == 1)
    8afd:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    8b01:	75 1b                	jne    8b1e <III_get_side_info+0x4a>
		si->private_bits = getbits(bs,5);
    8b03:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    8b0a:	00 
    8b0b:	8b 45 08             	mov    0x8(%ebp),%eax
    8b0e:	89 04 24             	mov    %eax,(%esp)
    8b11:	e8 23 df ff ff       	call   6a39 <getbits>
    8b16:	8b 55 0c             	mov    0xc(%ebp),%edx
    8b19:	89 42 04             	mov    %eax,0x4(%edx)
    8b1c:	eb 19                	jmp    8b37 <III_get_side_info+0x63>
	else
		si->private_bits = getbits(bs,3);
    8b1e:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    8b25:	00 
    8b26:	8b 45 08             	mov    0x8(%ebp),%eax
    8b29:	89 04 24             	mov    %eax,(%esp)
    8b2c:	e8 08 df ff ff       	call   6a39 <getbits>
    8b31:	8b 55 0c             	mov    0xc(%ebp),%edx
    8b34:	89 42 04             	mov    %eax,0x4(%edx)

	for (ch=0; ch<stereo; ch++)
    8b37:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8b3e:	eb 3d                	jmp    8b7d <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    8b40:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8b47:	eb 2a                	jmp    8b73 <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    8b49:	8b 45 08             	mov    0x8(%ebp),%eax
    8b4c:	89 04 24             	mov    %eax,(%esp)
    8b4f:	e8 d3 dd ff ff       	call   6927 <get1bit>
    8b54:	89 c1                	mov    %eax,%ecx
    8b56:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8b59:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8b5c:	89 d0                	mov    %edx,%eax
    8b5e:	c1 e0 02             	shl    $0x2,%eax
    8b61:	01 d0                	add    %edx,%eax
    8b63:	c1 e0 03             	shl    $0x3,%eax
    8b66:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8b69:	01 d0                	add    %edx,%eax
    8b6b:	89 4c 83 08          	mov    %ecx,0x8(%ebx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    8b6f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8b73:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    8b77:	7e d0                	jle    8b49 <III_get_side_info+0x75>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    8b79:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8b7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8b80:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    8b83:	7c bb                	jl     8b40 <III_get_side_info+0x6c>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    8b85:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8b8c:	e9 c5 05 00 00       	jmp    9156 <III_get_side_info+0x682>
		for (ch=0; ch<stereo; ch++) {
    8b91:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8b98:	e9 a9 05 00 00       	jmp    9146 <III_get_side_info+0x672>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    8b9d:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    8ba4:	00 
    8ba5:	8b 45 08             	mov    0x8(%ebp),%eax
    8ba8:	89 04 24             	mov    %eax,(%esp)
    8bab:	e8 89 de ff ff       	call   6a39 <getbits>
    8bb0:	89 c3                	mov    %eax,%ebx
    8bb2:	8b 75 0c             	mov    0xc(%ebp),%esi
    8bb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8bb8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8bbb:	89 c2                	mov    %eax,%edx
    8bbd:	c1 e2 03             	shl    $0x3,%edx
    8bc0:	01 c2                	add    %eax,%edx
    8bc2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8bc9:	89 c2                	mov    %eax,%edx
    8bcb:	89 c8                	mov    %ecx,%eax
    8bcd:	c1 e0 02             	shl    $0x2,%eax
    8bd0:	01 c8                	add    %ecx,%eax
    8bd2:	c1 e0 05             	shl    $0x5,%eax
    8bd5:	01 d0                	add    %edx,%eax
    8bd7:	01 f0                	add    %esi,%eax
    8bd9:	83 c0 18             	add    $0x18,%eax
    8bdc:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    8bde:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    8be5:	00 
    8be6:	8b 45 08             	mov    0x8(%ebp),%eax
    8be9:	89 04 24             	mov    %eax,(%esp)
    8bec:	e8 48 de ff ff       	call   6a39 <getbits>
    8bf1:	89 c3                	mov    %eax,%ebx
    8bf3:	8b 75 0c             	mov    0xc(%ebp),%esi
    8bf6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8bf9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8bfc:	89 c2                	mov    %eax,%edx
    8bfe:	c1 e2 03             	shl    $0x3,%edx
    8c01:	01 c2                	add    %eax,%edx
    8c03:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8c0a:	89 c2                	mov    %eax,%edx
    8c0c:	89 c8                	mov    %ecx,%eax
    8c0e:	c1 e0 02             	shl    $0x2,%eax
    8c11:	01 c8                	add    %ecx,%eax
    8c13:	c1 e0 05             	shl    $0x5,%eax
    8c16:	01 d0                	add    %edx,%eax
    8c18:	01 f0                	add    %esi,%eax
    8c1a:	83 c0 1c             	add    $0x1c,%eax
    8c1d:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    8c1f:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    8c26:	00 
    8c27:	8b 45 08             	mov    0x8(%ebp),%eax
    8c2a:	89 04 24             	mov    %eax,(%esp)
    8c2d:	e8 07 de ff ff       	call   6a39 <getbits>
    8c32:	89 c3                	mov    %eax,%ebx
    8c34:	8b 75 0c             	mov    0xc(%ebp),%esi
    8c37:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8c3a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8c3d:	89 c2                	mov    %eax,%edx
    8c3f:	c1 e2 03             	shl    $0x3,%edx
    8c42:	01 c2                	add    %eax,%edx
    8c44:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8c4b:	89 c2                	mov    %eax,%edx
    8c4d:	89 c8                	mov    %ecx,%eax
    8c4f:	c1 e0 02             	shl    $0x2,%eax
    8c52:	01 c8                	add    %ecx,%eax
    8c54:	c1 e0 05             	shl    $0x5,%eax
    8c57:	01 d0                	add    %edx,%eax
    8c59:	01 f0                	add    %esi,%eax
    8c5b:	83 c0 20             	add    $0x20,%eax
    8c5e:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    8c60:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    8c67:	00 
    8c68:	8b 45 08             	mov    0x8(%ebp),%eax
    8c6b:	89 04 24             	mov    %eax,(%esp)
    8c6e:	e8 c6 dd ff ff       	call   6a39 <getbits>
    8c73:	89 c3                	mov    %eax,%ebx
    8c75:	8b 75 0c             	mov    0xc(%ebp),%esi
    8c78:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8c7b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8c7e:	89 c2                	mov    %eax,%edx
    8c80:	c1 e2 03             	shl    $0x3,%edx
    8c83:	01 c2                	add    %eax,%edx
    8c85:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8c8c:	89 c2                	mov    %eax,%edx
    8c8e:	89 c8                	mov    %ecx,%eax
    8c90:	c1 e0 02             	shl    $0x2,%eax
    8c93:	01 c8                	add    %ecx,%eax
    8c95:	c1 e0 05             	shl    $0x5,%eax
    8c98:	01 d0                	add    %edx,%eax
    8c9a:	01 f0                	add    %esi,%eax
    8c9c:	83 c0 24             	add    $0x24,%eax
    8c9f:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    8ca1:	8b 45 08             	mov    0x8(%ebp),%eax
    8ca4:	89 04 24             	mov    %eax,(%esp)
    8ca7:	e8 7b dc ff ff       	call   6927 <get1bit>
    8cac:	89 c3                	mov    %eax,%ebx
    8cae:	8b 75 0c             	mov    0xc(%ebp),%esi
    8cb1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8cb4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8cb7:	89 c2                	mov    %eax,%edx
    8cb9:	c1 e2 03             	shl    $0x3,%edx
    8cbc:	01 c2                	add    %eax,%edx
    8cbe:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8cc5:	89 c2                	mov    %eax,%edx
    8cc7:	89 c8                	mov    %ecx,%eax
    8cc9:	c1 e0 02             	shl    $0x2,%eax
    8ccc:	01 c8                	add    %ecx,%eax
    8cce:	c1 e0 05             	shl    $0x5,%eax
    8cd1:	01 d0                	add    %edx,%eax
    8cd3:	01 f0                	add    %esi,%eax
    8cd5:	83 c0 28             	add    $0x28,%eax
    8cd8:	89 18                	mov    %ebx,(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    8cda:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8cdd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8ce0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8ce3:	89 c2                	mov    %eax,%edx
    8ce5:	c1 e2 03             	shl    $0x3,%edx
    8ce8:	01 c2                	add    %eax,%edx
    8cea:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8cf1:	89 c2                	mov    %eax,%edx
    8cf3:	89 c8                	mov    %ecx,%eax
    8cf5:	c1 e0 02             	shl    $0x2,%eax
    8cf8:	01 c8                	add    %ecx,%eax
    8cfa:	c1 e0 05             	shl    $0x5,%eax
    8cfd:	01 d0                	add    %edx,%eax
    8cff:	01 d8                	add    %ebx,%eax
    8d01:	83 c0 28             	add    $0x28,%eax
    8d04:	8b 00                	mov    (%eax),%eax
    8d06:	85 c0                	test   %eax,%eax
    8d08:	0f 84 82 02 00 00    	je     8f90 <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    8d0e:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8d15:	00 
    8d16:	8b 45 08             	mov    0x8(%ebp),%eax
    8d19:	89 04 24             	mov    %eax,(%esp)
    8d1c:	e8 18 dd ff ff       	call   6a39 <getbits>
    8d21:	89 c3                	mov    %eax,%ebx
    8d23:	8b 75 0c             	mov    0xc(%ebp),%esi
    8d26:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8d29:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8d2c:	89 c2                	mov    %eax,%edx
    8d2e:	c1 e2 03             	shl    $0x3,%edx
    8d31:	01 c2                	add    %eax,%edx
    8d33:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8d3a:	89 c2                	mov    %eax,%edx
    8d3c:	89 c8                	mov    %ecx,%eax
    8d3e:	c1 e0 02             	shl    $0x2,%eax
    8d41:	01 c8                	add    %ecx,%eax
    8d43:	c1 e0 05             	shl    $0x5,%eax
    8d46:	01 d0                	add    %edx,%eax
    8d48:	01 f0                	add    %esi,%eax
    8d4a:	83 c0 2c             	add    $0x2c,%eax
    8d4d:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    8d4f:	8b 45 08             	mov    0x8(%ebp),%eax
    8d52:	89 04 24             	mov    %eax,(%esp)
    8d55:	e8 cd db ff ff       	call   6927 <get1bit>
    8d5a:	89 c3                	mov    %eax,%ebx
    8d5c:	8b 75 0c             	mov    0xc(%ebp),%esi
    8d5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8d62:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8d65:	89 c2                	mov    %eax,%edx
    8d67:	c1 e2 03             	shl    $0x3,%edx
    8d6a:	01 c2                	add    %eax,%edx
    8d6c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8d73:	89 c2                	mov    %eax,%edx
    8d75:	89 c8                	mov    %ecx,%eax
    8d77:	c1 e0 02             	shl    $0x2,%eax
    8d7a:	01 c8                	add    %ecx,%eax
    8d7c:	c1 e0 05             	shl    $0x5,%eax
    8d7f:	01 d0                	add    %edx,%eax
    8d81:	01 f0                	add    %esi,%eax
    8d83:	83 c0 30             	add    $0x30,%eax
    8d86:	89 18                	mov    %ebx,(%eax)
				for (i=0; i<2; i++)
    8d88:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8d8f:	eb 46                	jmp    8dd7 <III_get_side_info+0x303>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    8d91:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    8d98:	00 
    8d99:	8b 45 08             	mov    0x8(%ebp),%eax
    8d9c:	89 04 24             	mov    %eax,(%esp)
    8d9f:	e8 95 dc ff ff       	call   6a39 <getbits>
    8da4:	89 c3                	mov    %eax,%ebx
    8da6:	8b 75 0c             	mov    0xc(%ebp),%esi
    8da9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8dac:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8daf:	89 c2                	mov    %eax,%edx
    8db1:	c1 e2 03             	shl    $0x3,%edx
    8db4:	01 c2                	add    %eax,%edx
    8db6:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8db9:	89 c2                	mov    %eax,%edx
    8dbb:	89 c8                	mov    %ecx,%eax
    8dbd:	c1 e0 02             	shl    $0x2,%eax
    8dc0:	01 c8                	add    %ecx,%eax
    8dc2:	c1 e0 03             	shl    $0x3,%eax
    8dc5:	01 c2                	add    %eax,%edx
    8dc7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8dca:	01 d0                	add    %edx,%eax
    8dcc:	83 c0 08             	add    $0x8,%eax
    8dcf:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    8dd3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8dd7:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    8ddb:	7e b4                	jle    8d91 <III_get_side_info+0x2bd>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    8ddd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8de4:	eb 46                	jmp    8e2c <III_get_side_info+0x358>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    8de6:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    8ded:	00 
    8dee:	8b 45 08             	mov    0x8(%ebp),%eax
    8df1:	89 04 24             	mov    %eax,(%esp)
    8df4:	e8 40 dc ff ff       	call   6a39 <getbits>
    8df9:	89 c3                	mov    %eax,%ebx
    8dfb:	8b 75 0c             	mov    0xc(%ebp),%esi
    8dfe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8e01:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8e04:	89 c2                	mov    %eax,%edx
    8e06:	c1 e2 03             	shl    $0x3,%edx
    8e09:	01 c2                	add    %eax,%edx
    8e0b:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8e0e:	89 c2                	mov    %eax,%edx
    8e10:	89 c8                	mov    %ecx,%eax
    8e12:	c1 e0 02             	shl    $0x2,%eax
    8e15:	01 c8                	add    %ecx,%eax
    8e17:	c1 e0 03             	shl    $0x3,%eax
    8e1a:	01 c2                	add    %eax,%edx
    8e1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8e1f:	01 d0                	add    %edx,%eax
    8e21:	83 c0 0c             	add    $0xc,%eax
    8e24:	89 5c 86 10          	mov    %ebx,0x10(%esi,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    8e28:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8e2c:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8e30:	7e b4                	jle    8de6 <III_get_side_info+0x312>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    8e32:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8e35:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8e38:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8e3b:	89 c2                	mov    %eax,%edx
    8e3d:	c1 e2 03             	shl    $0x3,%edx
    8e40:	01 c2                	add    %eax,%edx
    8e42:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8e49:	89 c2                	mov    %eax,%edx
    8e4b:	89 c8                	mov    %ecx,%eax
    8e4d:	c1 e0 02             	shl    $0x2,%eax
    8e50:	01 c8                	add    %ecx,%eax
    8e52:	c1 e0 05             	shl    $0x5,%eax
    8e55:	01 d0                	add    %edx,%eax
    8e57:	01 d8                	add    %ebx,%eax
    8e59:	83 c0 2c             	add    $0x2c,%eax
    8e5c:	8b 00                	mov    (%eax),%eax
    8e5e:	85 c0                	test   %eax,%eax
    8e60:	75 05                	jne    8e67 <III_get_side_info+0x393>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    8e62:	e8 84 cb ff ff       	call   59eb <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    8e67:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8e6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8e6d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8e70:	89 c2                	mov    %eax,%edx
    8e72:	c1 e2 03             	shl    $0x3,%edx
    8e75:	01 c2                	add    %eax,%edx
    8e77:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8e7e:	89 c2                	mov    %eax,%edx
    8e80:	89 c8                	mov    %ecx,%eax
    8e82:	c1 e0 02             	shl    $0x2,%eax
    8e85:	01 c8                	add    %ecx,%eax
    8e87:	c1 e0 05             	shl    $0x5,%eax
    8e8a:	01 d0                	add    %edx,%eax
    8e8c:	01 d8                	add    %ebx,%eax
    8e8e:	83 c0 2c             	add    $0x2c,%eax
    8e91:	8b 00                	mov    (%eax),%eax
    8e93:	83 f8 02             	cmp    $0x2,%eax
    8e96:	75 62                	jne    8efa <III_get_side_info+0x426>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    8e98:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8e9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8e9e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8ea1:	89 c2                	mov    %eax,%edx
    8ea3:	c1 e2 03             	shl    $0x3,%edx
    8ea6:	01 c2                	add    %eax,%edx
    8ea8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8eaf:	89 c2                	mov    %eax,%edx
    8eb1:	89 c8                	mov    %ecx,%eax
    8eb3:	c1 e0 02             	shl    $0x2,%eax
    8eb6:	01 c8                	add    %ecx,%eax
    8eb8:	c1 e0 05             	shl    $0x5,%eax
    8ebb:	01 d0                	add    %edx,%eax
    8ebd:	01 d8                	add    %ebx,%eax
    8ebf:	83 c0 30             	add    $0x30,%eax
    8ec2:	8b 00                	mov    (%eax),%eax
    8ec4:	85 c0                	test   %eax,%eax
    8ec6:	75 32                	jne    8efa <III_get_side_info+0x426>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    8ec8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8ecb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8ece:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8ed1:	89 c2                	mov    %eax,%edx
    8ed3:	c1 e2 03             	shl    $0x3,%edx
    8ed6:	01 c2                	add    %eax,%edx
    8ed8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8edf:	89 c2                	mov    %eax,%edx
    8ee1:	89 c8                	mov    %ecx,%eax
    8ee3:	c1 e0 02             	shl    $0x2,%eax
    8ee6:	01 c8                	add    %ecx,%eax
    8ee8:	c1 e0 05             	shl    $0x5,%eax
    8eeb:	01 d0                	add    %edx,%eax
    8eed:	01 d8                	add    %ebx,%eax
    8eef:	83 c0 4c             	add    $0x4c,%eax
    8ef2:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
    8ef8:	eb 30                	jmp    8f2a <III_get_side_info+0x456>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    8efa:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8efd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f00:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8f03:	89 c2                	mov    %eax,%edx
    8f05:	c1 e2 03             	shl    $0x3,%edx
    8f08:	01 c2                	add    %eax,%edx
    8f0a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8f11:	89 c2                	mov    %eax,%edx
    8f13:	89 c8                	mov    %ecx,%eax
    8f15:	c1 e0 02             	shl    $0x2,%eax
    8f18:	01 c8                	add    %ecx,%eax
    8f1a:	c1 e0 05             	shl    $0x5,%eax
    8f1d:	01 d0                	add    %edx,%eax
    8f1f:	01 d8                	add    %ebx,%eax
    8f21:	83 c0 4c             	add    $0x4c,%eax
    8f24:	c7 00 07 00 00 00    	movl   $0x7,(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    8f2a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8f2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f30:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8f33:	89 c2                	mov    %eax,%edx
    8f35:	c1 e2 03             	shl    $0x3,%edx
    8f38:	01 c2                	add    %eax,%edx
    8f3a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8f41:	89 c2                	mov    %eax,%edx
    8f43:	89 c8                	mov    %ecx,%eax
    8f45:	c1 e0 02             	shl    $0x2,%eax
    8f48:	01 c8                	add    %ecx,%eax
    8f4a:	c1 e0 05             	shl    $0x5,%eax
    8f4d:	01 d0                	add    %edx,%eax
    8f4f:	01 d8                	add    %ebx,%eax
    8f51:	83 c0 4c             	add    $0x4c,%eax
    8f54:	8b 00                	mov    (%eax),%eax
    8f56:	ba 14 00 00 00       	mov    $0x14,%edx
    8f5b:	89 d3                	mov    %edx,%ebx
    8f5d:	29 c3                	sub    %eax,%ebx
    8f5f:	8b 75 0c             	mov    0xc(%ebp),%esi
    8f62:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f65:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8f68:	89 c2                	mov    %eax,%edx
    8f6a:	c1 e2 03             	shl    $0x3,%edx
    8f6d:	01 c2                	add    %eax,%edx
    8f6f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8f76:	89 c2                	mov    %eax,%edx
    8f78:	89 c8                	mov    %ecx,%eax
    8f7a:	c1 e0 02             	shl    $0x2,%eax
    8f7d:	01 c8                	add    %ecx,%eax
    8f7f:	c1 e0 05             	shl    $0x5,%eax
    8f82:	01 d0                	add    %edx,%eax
    8f84:	01 f0                	add    %esi,%eax
    8f86:	83 c0 50             	add    $0x50,%eax
    8f89:	89 18                	mov    %ebx,(%eax)
    8f8b:	e9 07 01 00 00       	jmp    9097 <III_get_side_info+0x5c3>
			}
			else {
				for (i=0; i<3; i++)
    8f90:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8f97:	eb 46                	jmp    8fdf <III_get_side_info+0x50b>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    8f99:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    8fa0:	00 
    8fa1:	8b 45 08             	mov    0x8(%ebp),%eax
    8fa4:	89 04 24             	mov    %eax,(%esp)
    8fa7:	e8 8d da ff ff       	call   6a39 <getbits>
    8fac:	89 c3                	mov    %eax,%ebx
    8fae:	8b 75 0c             	mov    0xc(%ebp),%esi
    8fb1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8fb4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8fb7:	89 c2                	mov    %eax,%edx
    8fb9:	c1 e2 03             	shl    $0x3,%edx
    8fbc:	01 c2                	add    %eax,%edx
    8fbe:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8fc1:	89 c2                	mov    %eax,%edx
    8fc3:	89 c8                	mov    %ecx,%eax
    8fc5:	c1 e0 02             	shl    $0x2,%eax
    8fc8:	01 c8                	add    %ecx,%eax
    8fca:	c1 e0 03             	shl    $0x3,%eax
    8fcd:	01 c2                	add    %eax,%edx
    8fcf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8fd2:	01 d0                	add    %edx,%eax
    8fd4:	83 c0 08             	add    $0x8,%eax
    8fd7:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    8fdb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8fdf:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8fe3:	7e b4                	jle    8f99 <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    8fe5:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    8fec:	00 
    8fed:	8b 45 08             	mov    0x8(%ebp),%eax
    8ff0:	89 04 24             	mov    %eax,(%esp)
    8ff3:	e8 41 da ff ff       	call   6a39 <getbits>
    8ff8:	89 c3                	mov    %eax,%ebx
    8ffa:	8b 75 0c             	mov    0xc(%ebp),%esi
    8ffd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9000:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    9003:	89 c2                	mov    %eax,%edx
    9005:	c1 e2 03             	shl    $0x3,%edx
    9008:	01 c2                	add    %eax,%edx
    900a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9011:	89 c2                	mov    %eax,%edx
    9013:	89 c8                	mov    %ecx,%eax
    9015:	c1 e0 02             	shl    $0x2,%eax
    9018:	01 c8                	add    %ecx,%eax
    901a:	c1 e0 05             	shl    $0x5,%eax
    901d:	01 d0                	add    %edx,%eax
    901f:	01 f0                	add    %esi,%eax
    9021:	83 c0 4c             	add    $0x4c,%eax
    9024:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    9026:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    902d:	00 
    902e:	8b 45 08             	mov    0x8(%ebp),%eax
    9031:	89 04 24             	mov    %eax,(%esp)
    9034:	e8 00 da ff ff       	call   6a39 <getbits>
    9039:	89 c3                	mov    %eax,%ebx
    903b:	8b 75 0c             	mov    0xc(%ebp),%esi
    903e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9041:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    9044:	89 c2                	mov    %eax,%edx
    9046:	c1 e2 03             	shl    $0x3,%edx
    9049:	01 c2                	add    %eax,%edx
    904b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9052:	89 c2                	mov    %eax,%edx
    9054:	89 c8                	mov    %ecx,%eax
    9056:	c1 e0 02             	shl    $0x2,%eax
    9059:	01 c8                	add    %ecx,%eax
    905b:	c1 e0 05             	shl    $0x5,%eax
    905e:	01 d0                	add    %edx,%eax
    9060:	01 f0                	add    %esi,%eax
    9062:	83 c0 50             	add    $0x50,%eax
    9065:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    9067:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    906a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    906d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    9070:	89 c2                	mov    %eax,%edx
    9072:	c1 e2 03             	shl    $0x3,%edx
    9075:	01 c2                	add    %eax,%edx
    9077:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    907e:	89 c2                	mov    %eax,%edx
    9080:	89 c8                	mov    %ecx,%eax
    9082:	c1 e0 02             	shl    $0x2,%eax
    9085:	01 c8                	add    %ecx,%eax
    9087:	c1 e0 05             	shl    $0x5,%eax
    908a:	01 d0                	add    %edx,%eax
    908c:	01 d8                	add    %ebx,%eax
    908e:	83 c0 2c             	add    $0x2c,%eax
    9091:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    9097:	8b 45 08             	mov    0x8(%ebp),%eax
    909a:	89 04 24             	mov    %eax,(%esp)
    909d:	e8 85 d8 ff ff       	call   6927 <get1bit>
    90a2:	89 c3                	mov    %eax,%ebx
    90a4:	8b 75 0c             	mov    0xc(%ebp),%esi
    90a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    90aa:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    90ad:	89 c2                	mov    %eax,%edx
    90af:	c1 e2 03             	shl    $0x3,%edx
    90b2:	01 c2                	add    %eax,%edx
    90b4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    90bb:	89 c2                	mov    %eax,%edx
    90bd:	89 c8                	mov    %ecx,%eax
    90bf:	c1 e0 02             	shl    $0x2,%eax
    90c2:	01 c8                	add    %ecx,%eax
    90c4:	c1 e0 05             	shl    $0x5,%eax
    90c7:	01 d0                	add    %edx,%eax
    90c9:	01 f0                	add    %esi,%eax
    90cb:	83 c0 54             	add    $0x54,%eax
    90ce:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    90d0:	8b 45 08             	mov    0x8(%ebp),%eax
    90d3:	89 04 24             	mov    %eax,(%esp)
    90d6:	e8 4c d8 ff ff       	call   6927 <get1bit>
    90db:	89 c3                	mov    %eax,%ebx
    90dd:	8b 75 0c             	mov    0xc(%ebp),%esi
    90e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    90e3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    90e6:	89 c2                	mov    %eax,%edx
    90e8:	c1 e2 03             	shl    $0x3,%edx
    90eb:	01 c2                	add    %eax,%edx
    90ed:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    90f4:	89 c2                	mov    %eax,%edx
    90f6:	89 c8                	mov    %ecx,%eax
    90f8:	c1 e0 02             	shl    $0x2,%eax
    90fb:	01 c8                	add    %ecx,%eax
    90fd:	c1 e0 05             	shl    $0x5,%eax
    9100:	01 d0                	add    %edx,%eax
    9102:	01 f0                	add    %esi,%eax
    9104:	83 c0 58             	add    $0x58,%eax
    9107:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    9109:	8b 45 08             	mov    0x8(%ebp),%eax
    910c:	89 04 24             	mov    %eax,(%esp)
    910f:	e8 13 d8 ff ff       	call   6927 <get1bit>
    9114:	89 c3                	mov    %eax,%ebx
    9116:	8b 75 0c             	mov    0xc(%ebp),%esi
    9119:	8b 45 f0             	mov    -0x10(%ebp),%eax
    911c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    911f:	89 c2                	mov    %eax,%edx
    9121:	c1 e2 03             	shl    $0x3,%edx
    9124:	01 c2                	add    %eax,%edx
    9126:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    912d:	89 c2                	mov    %eax,%edx
    912f:	89 c8                	mov    %ecx,%eax
    9131:	c1 e0 02             	shl    $0x2,%eax
    9134:	01 c8                	add    %ecx,%eax
    9136:	c1 e0 05             	shl    $0x5,%eax
    9139:	01 d0                	add    %edx,%eax
    913b:	01 f0                	add    %esi,%eax
    913d:	83 c0 5c             	add    $0x5c,%eax
    9140:	89 18                	mov    %ebx,(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    9142:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9146:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9149:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    914c:	0f 8c 4b fa ff ff    	jl     8b9d <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    9152:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9156:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    915a:	0f 8e 31 fa ff ff    	jle    8b91 <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    9160:	83 c4 20             	add    $0x20,%esp
    9163:	5b                   	pop    %ebx
    9164:	5e                   	pop    %esi
    9165:	5d                   	pop    %ebp
    9166:	c3                   	ret    

00009167 <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    9167:	55                   	push   %ebp
    9168:	89 e5                	mov    %esp,%ebp
    916a:	56                   	push   %esi
    916b:	53                   	push   %ebx
    916c:	83 ec 20             	sub    $0x20,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    916f:	8b 45 10             	mov    0x10(%ebp),%eax
    9172:	89 c2                	mov    %eax,%edx
    9174:	c1 e2 03             	shl    $0x3,%edx
    9177:	01 c2                	add    %eax,%edx
    9179:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9180:	89 c2                	mov    %eax,%edx
    9182:	8b 4d 14             	mov    0x14(%ebp),%ecx
    9185:	89 c8                	mov    %ecx,%eax
    9187:	c1 e0 02             	shl    $0x2,%eax
    918a:	01 c8                	add    %ecx,%eax
    918c:	c1 e0 05             	shl    $0x5,%eax
    918f:	01 d0                	add    %edx,%eax
    9191:	8d 50 10             	lea    0x10(%eax),%edx
    9194:	8b 45 0c             	mov    0xc(%ebp),%eax
    9197:	01 d0                	add    %edx,%eax
    9199:	83 c0 08             	add    $0x8,%eax
    919c:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    919f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    91a2:	8b 40 10             	mov    0x10(%eax),%eax
    91a5:	85 c0                	test   %eax,%eax
    91a7:	0f 84 7e 02 00 00    	je     942b <III_get_scale_factors+0x2c4>
    91ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
    91b0:	8b 40 14             	mov    0x14(%eax),%eax
    91b3:	83 f8 02             	cmp    $0x2,%eax
    91b6:	0f 85 6f 02 00 00    	jne    942b <III_get_scale_factors+0x2c4>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    91bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    91bf:	8b 40 18             	mov    0x18(%eax),%eax
    91c2:	85 c0                	test   %eax,%eax
    91c4:	0f 84 6b 01 00 00    	je     9335 <III_get_scale_factors+0x1ce>
			for (sfb = 0; sfb < 8; sfb++)
    91ca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    91d1:	eb 32                	jmp    9205 <III_get_scale_factors+0x9e>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    91d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    91d6:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    91d9:	8b 04 85 c0 0c 01 00 	mov    0x10cc0(,%eax,4),%eax
    91e0:	89 04 24             	mov    %eax,(%esp)
    91e3:	e8 b9 db ff ff       	call   6da1 <hgetbits>
    91e8:	89 c3                	mov    %eax,%ebx
    91ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
    91ed:	8b 45 14             	mov    0x14(%ebp),%eax
    91f0:	01 c0                	add    %eax,%eax
    91f2:	89 c2                	mov    %eax,%edx
    91f4:	c1 e2 05             	shl    $0x5,%edx
    91f7:	29 c2                	sub    %eax,%edx
    91f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    91fc:	01 d0                	add    %edx,%eax
    91fe:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    9201:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9205:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    9209:	7e c8                	jle    91d3 <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    920b:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    9212:	eb 5c                	jmp    9270 <III_get_scale_factors+0x109>
				for (window=0; window<3; window++)
    9214:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    921b:	eb 49                	jmp    9266 <III_get_scale_factors+0xff>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    921d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9220:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    9223:	8b 04 85 c0 0c 01 00 	mov    0x10cc0(,%eax,4),%eax
    922a:	89 04 24             	mov    %eax,(%esp)
    922d:	e8 6f db ff ff       	call   6da1 <hgetbits>
    9232:	89 c6                	mov    %eax,%esi
    9234:	8b 5d 08             	mov    0x8(%ebp),%ebx
    9237:	8b 55 ec             	mov    -0x14(%ebp),%edx
    923a:	8b 4d 14             	mov    0x14(%ebp),%ecx
    923d:	89 d0                	mov    %edx,%eax
    923f:	01 c0                	add    %eax,%eax
    9241:	01 d0                	add    %edx,%eax
    9243:	c1 e0 02             	shl    $0x2,%eax
    9246:	01 d0                	add    %edx,%eax
    9248:	89 ca                	mov    %ecx,%edx
    924a:	01 d2                	add    %edx,%edx
    924c:	89 d1                	mov    %edx,%ecx
    924e:	c1 e1 05             	shl    $0x5,%ecx
    9251:	29 d1                	sub    %edx,%ecx
    9253:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    9256:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9259:	01 d0                	add    %edx,%eax
    925b:	83 c0 14             	add    $0x14,%eax
    925e:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    9262:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9266:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    926a:	7e b1                	jle    921d <III_get_scale_factors+0xb6>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    926c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9270:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    9274:	7e 9e                	jle    9214 <III_get_scale_factors+0xad>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    9276:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    927d:	eb 5f                	jmp    92de <III_get_scale_factors+0x177>
				for (window=0; window<3; window++)
    927f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9286:	eb 4c                	jmp    92d4 <III_get_scale_factors+0x16d>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    9288:	8b 45 e8             	mov    -0x18(%ebp),%eax
    928b:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    928e:	83 c0 10             	add    $0x10,%eax
    9291:	8b 04 85 c0 0c 01 00 	mov    0x10cc0(,%eax,4),%eax
    9298:	89 04 24             	mov    %eax,(%esp)
    929b:	e8 01 db ff ff       	call   6da1 <hgetbits>
    92a0:	89 c6                	mov    %eax,%esi
    92a2:	8b 5d 08             	mov    0x8(%ebp),%ebx
    92a5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    92a8:	8b 4d 14             	mov    0x14(%ebp),%ecx
    92ab:	89 d0                	mov    %edx,%eax
    92ad:	01 c0                	add    %eax,%eax
    92af:	01 d0                	add    %edx,%eax
    92b1:	c1 e0 02             	shl    $0x2,%eax
    92b4:	01 d0                	add    %edx,%eax
    92b6:	89 ca                	mov    %ecx,%edx
    92b8:	01 d2                	add    %edx,%edx
    92ba:	89 d1                	mov    %edx,%ecx
    92bc:	c1 e1 05             	shl    $0x5,%ecx
    92bf:	29 d1                	sub    %edx,%ecx
    92c1:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    92c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    92c7:	01 d0                	add    %edx,%eax
    92c9:	83 c0 14             	add    $0x14,%eax
    92cc:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    92d0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    92d4:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    92d8:	7e ae                	jle    9288 <III_get_scale_factors+0x121>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    92da:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    92de:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    92e2:	7e 9b                	jle    927f <III_get_scale_factors+0x118>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    92e4:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    92eb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    92f2:	eb 36                	jmp    932a <III_get_scale_factors+0x1c3>
				(*scalefac)[ch].s[window][sfb] = 0;
    92f4:	8b 5d 08             	mov    0x8(%ebp),%ebx
    92f7:	8b 55 ec             	mov    -0x14(%ebp),%edx
    92fa:	8b 4d 14             	mov    0x14(%ebp),%ecx
    92fd:	89 d0                	mov    %edx,%eax
    92ff:	01 c0                	add    %eax,%eax
    9301:	01 d0                	add    %edx,%eax
    9303:	c1 e0 02             	shl    $0x2,%eax
    9306:	01 d0                	add    %edx,%eax
    9308:	89 ca                	mov    %ecx,%edx
    930a:	01 d2                	add    %edx,%edx
    930c:	89 d1                	mov    %edx,%ecx
    930e:	c1 e1 05             	shl    $0x5,%ecx
    9311:	29 d1                	sub    %edx,%ecx
    9313:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    9316:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9319:	01 d0                	add    %edx,%eax
    931b:	83 c0 14             	add    $0x14,%eax
    931e:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    9325:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    9326:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    932a:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    932e:	7e c4                	jle    92f4 <III_get_scale_factors+0x18d>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    9330:	e9 b1 01 00 00       	jmp    94e6 <III_get_scale_factors+0x37f>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    9335:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    933c:	e9 8f 00 00 00       	jmp    93d0 <III_get_scale_factors+0x269>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    9341:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9344:	83 c0 04             	add    $0x4,%eax
    9347:	8b 04 85 a4 0c 01 00 	mov    0x10ca4(,%eax,4),%eax
    934e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9351:	eb 64                	jmp    93b7 <III_get_scale_factors+0x250>
					for (window=0; window<3; window++)
    9353:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    935a:	eb 51                	jmp    93ad <III_get_scale_factors+0x246>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    935c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    935f:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    9362:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9365:	c1 e2 04             	shl    $0x4,%edx
    9368:	01 d0                	add    %edx,%eax
    936a:	8b 04 85 c0 0c 01 00 	mov    0x10cc0(,%eax,4),%eax
    9371:	89 04 24             	mov    %eax,(%esp)
    9374:	e8 28 da ff ff       	call   6da1 <hgetbits>
    9379:	89 c6                	mov    %eax,%esi
    937b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    937e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9381:	8b 4d 14             	mov    0x14(%ebp),%ecx
    9384:	89 d0                	mov    %edx,%eax
    9386:	01 c0                	add    %eax,%eax
    9388:	01 d0                	add    %edx,%eax
    938a:	c1 e0 02             	shl    $0x2,%eax
    938d:	01 d0                	add    %edx,%eax
    938f:	89 ca                	mov    %ecx,%edx
    9391:	01 d2                	add    %edx,%edx
    9393:	89 d1                	mov    %edx,%ecx
    9395:	c1 e1 05             	shl    $0x5,%ecx
    9398:	29 d1                	sub    %edx,%ecx
    939a:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    939d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    93a0:	01 d0                	add    %edx,%eax
    93a2:	83 c0 14             	add    $0x14,%eax
    93a5:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    93a9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    93ad:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    93b1:	7e a9                	jle    935c <III_get_scale_factors+0x1f5>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    93b3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    93b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    93ba:	83 c0 01             	add    $0x1,%eax
    93bd:	83 c0 04             	add    $0x4,%eax
    93c0:	8b 04 85 a4 0c 01 00 	mov    0x10ca4(,%eax,4),%eax
    93c7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    93ca:	7f 87                	jg     9353 <III_get_scale_factors+0x1ec>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    93cc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    93d0:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    93d4:	0f 8e 67 ff ff ff    	jle    9341 <III_get_scale_factors+0x1da>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    93da:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    93e1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    93e8:	eb 36                	jmp    9420 <III_get_scale_factors+0x2b9>
					(*scalefac)[ch].s[window][sfb] = 0;
    93ea:	8b 5d 08             	mov    0x8(%ebp),%ebx
    93ed:	8b 55 ec             	mov    -0x14(%ebp),%edx
    93f0:	8b 4d 14             	mov    0x14(%ebp),%ecx
    93f3:	89 d0                	mov    %edx,%eax
    93f5:	01 c0                	add    %eax,%eax
    93f7:	01 d0                	add    %edx,%eax
    93f9:	c1 e0 02             	shl    $0x2,%eax
    93fc:	01 d0                	add    %edx,%eax
    93fe:	89 ca                	mov    %ecx,%edx
    9400:	01 d2                	add    %edx,%edx
    9402:	89 d1                	mov    %edx,%ecx
    9404:	c1 e1 05             	shl    $0x5,%ecx
    9407:	29 d1                	sub    %edx,%ecx
    9409:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    940c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    940f:	01 d0                	add    %edx,%eax
    9411:	83 c0 14             	add    $0x14,%eax
    9414:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    941b:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    941c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9420:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    9424:	7e c4                	jle    93ea <III_get_scale_factors+0x283>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    9426:	e9 bb 00 00 00       	jmp    94e6 <III_get_scale_factors+0x37f>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    942b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9432:	e9 89 00 00 00       	jmp    94c0 <III_get_scale_factors+0x359>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    9437:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    943a:	8b 55 14             	mov    0x14(%ebp),%edx
    943d:	89 d0                	mov    %edx,%eax
    943f:	c1 e0 02             	shl    $0x2,%eax
    9442:	01 d0                	add    %edx,%eax
    9444:	c1 e0 03             	shl    $0x3,%eax
    9447:	8b 55 f0             	mov    -0x10(%ebp),%edx
    944a:	01 d0                	add    %edx,%eax
    944c:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    9450:	85 c0                	test   %eax,%eax
    9452:	74 06                	je     945a <III_get_scale_factors+0x2f3>
    9454:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    9458:	75 62                	jne    94bc <III_get_scale_factors+0x355>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    945a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    945d:	8b 04 85 a0 0c 01 00 	mov    0x10ca0(,%eax,4),%eax
    9464:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9467:	eb 41                	jmp    94aa <III_get_scale_factors+0x343>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    9469:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    946d:	0f 9f c0             	setg   %al
    9470:	0f b6 d0             	movzbl %al,%edx
    9473:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9476:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    9479:	c1 e2 04             	shl    $0x4,%edx
    947c:	01 d0                	add    %edx,%eax
    947e:	8b 04 85 c0 0c 01 00 	mov    0x10cc0(,%eax,4),%eax
    9485:	89 04 24             	mov    %eax,(%esp)
    9488:	e8 14 d9 ff ff       	call   6da1 <hgetbits>
    948d:	89 c3                	mov    %eax,%ebx
    948f:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9492:	8b 45 14             	mov    0x14(%ebp),%eax
    9495:	01 c0                	add    %eax,%eax
    9497:	89 c2                	mov    %eax,%edx
    9499:	c1 e2 05             	shl    $0x5,%edx
    949c:	29 c2                	sub    %eax,%edx
    949e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    94a1:	01 d0                	add    %edx,%eax
    94a3:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    94a6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    94aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    94ad:	83 c0 01             	add    $0x1,%eax
    94b0:	8b 04 85 a0 0c 01 00 	mov    0x10ca0(,%eax,4),%eax
    94b7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    94ba:	7f ad                	jg     9469 <III_get_scale_factors+0x302>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    94bc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    94c0:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    94c4:	0f 8e 6d ff ff ff    	jle    9437 <III_get_scale_factors+0x2d0>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    94ca:	8b 4d 08             	mov    0x8(%ebp),%ecx
    94cd:	8b 45 14             	mov    0x14(%ebp),%eax
    94d0:	c1 e0 03             	shl    $0x3,%eax
    94d3:	89 c2                	mov    %eax,%edx
    94d5:	c1 e2 05             	shl    $0x5,%edx
    94d8:	29 c2                	sub    %eax,%edx
    94da:	8d 04 11             	lea    (%ecx,%edx,1),%eax
    94dd:	83 c0 58             	add    $0x58,%eax
    94e0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    94e6:	83 c4 20             	add    $0x20,%esp
    94e9:	5b                   	pop    %ebx
    94ea:	5e                   	pop    %esi
    94eb:	5d                   	pop    %ebp
    94ec:	c3                   	ret    

000094ed <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    94ed:	55                   	push   %ebp
    94ee:	89 e5                	mov    %esp,%ebp
    94f0:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    94f3:	a1 00 10 01 00       	mov    0x11000,%eax
    94f8:	85 c0                	test   %eax,%eax
    94fa:	74 02                	je     94fe <initialize_huffman+0x11>
    94fc:	eb 0f                	jmp    950d <initialize_huffman+0x20>
	read_decoder_table();
    94fe:	e8 03 d9 ff ff       	call   6e06 <read_decoder_table>
	huffman_initialized = TRUE;
    9503:	c7 05 00 10 01 00 01 	movl   $0x1,0x11000
    950a:	00 00 00 
}
    950d:	c9                   	leave  
    950e:	c3                   	ret    

0000950f <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    950f:	55                   	push   %ebp
    9510:	89 e5                	mov    %esp,%ebp
    9512:	57                   	push   %edi
    9513:	56                   	push   %esi
    9514:	53                   	push   %ebx
    9515:	83 ec 4c             	sub    $0x4c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    9518:	e8 d0 ff ff ff       	call   94ed <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    951d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9520:	8b 45 14             	mov    0x14(%ebp),%eax
    9523:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9526:	89 c2                	mov    %eax,%edx
    9528:	c1 e2 03             	shl    $0x3,%edx
    952b:	01 c2                	add    %eax,%edx
    952d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9534:	89 c2                	mov    %eax,%edx
    9536:	89 c8                	mov    %ecx,%eax
    9538:	c1 e0 02             	shl    $0x2,%eax
    953b:	01 c8                	add    %ecx,%eax
    953d:	c1 e0 05             	shl    $0x5,%eax
    9540:	01 d0                	add    %edx,%eax
    9542:	01 d8                	add    %ebx,%eax
    9544:	83 c0 28             	add    $0x28,%eax
    9547:	8b 00                	mov    (%eax),%eax
    9549:	85 c0                	test   %eax,%eax
    954b:	74 44                	je     9591 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    954d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9550:	8b 45 14             	mov    0x14(%ebp),%eax
    9553:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9556:	89 c2                	mov    %eax,%edx
    9558:	c1 e2 03             	shl    $0x3,%edx
    955b:	01 c2                	add    %eax,%edx
    955d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9564:	89 c2                	mov    %eax,%edx
    9566:	89 c8                	mov    %ecx,%eax
    9568:	c1 e0 02             	shl    $0x2,%eax
    956b:	01 c8                	add    %ecx,%eax
    956d:	c1 e0 05             	shl    $0x5,%eax
    9570:	01 d0                	add    %edx,%eax
    9572:	01 d8                	add    %ebx,%eax
    9574:	83 c0 2c             	add    $0x2c,%eax
    9577:	8b 00                	mov    (%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    9579:	83 f8 02             	cmp    $0x2,%eax
    957c:	75 13                	jne    9591 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    957e:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    9585:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    958c:	e9 cc 00 00 00       	jmp    965d <III_hufman_decode+0x14e>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    9591:	8b 45 1c             	mov    0x1c(%ebp),%eax
    9594:	8b 00                	mov    (%eax),%eax
    9596:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    9599:	8b 75 0c             	mov    0xc(%ebp),%esi
    959c:	8b 45 14             	mov    0x14(%ebp),%eax
    959f:	8b 5d 10             	mov    0x10(%ebp),%ebx
    95a2:	89 c2                	mov    %eax,%edx
    95a4:	c1 e2 03             	shl    $0x3,%edx
    95a7:	01 c2                	add    %eax,%edx
    95a9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    95b0:	89 c2                	mov    %eax,%edx
    95b2:	89 d8                	mov    %ebx,%eax
    95b4:	c1 e0 02             	shl    $0x2,%eax
    95b7:	01 d8                	add    %ebx,%eax
    95b9:	c1 e0 05             	shl    $0x5,%eax
    95bc:	01 d0                	add    %edx,%eax
    95be:	01 f0                	add    %esi,%eax
    95c0:	83 c0 4c             	add    $0x4c,%eax
    95c3:	8b 00                	mov    (%eax),%eax
    95c5:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    95c8:	89 c8                	mov    %ecx,%eax
    95ca:	c1 e0 03             	shl    $0x3,%eax
    95cd:	01 c8                	add    %ecx,%eax
    95cf:	c1 e0 02             	shl    $0x2,%eax
    95d2:	01 c8                	add    %ecx,%eax
    95d4:	01 d0                	add    %edx,%eax
    95d6:	8b 04 85 40 0d 01 00 	mov    0x10d40(,%eax,4),%eax
    95dd:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    95e0:	8b 45 1c             	mov    0x1c(%ebp),%eax
    95e3:	8b 00                	mov    (%eax),%eax
    95e5:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    95e8:	8b 75 0c             	mov    0xc(%ebp),%esi
    95eb:	8b 45 14             	mov    0x14(%ebp),%eax
    95ee:	8b 5d 10             	mov    0x10(%ebp),%ebx
    95f1:	89 c2                	mov    %eax,%edx
    95f3:	c1 e2 03             	shl    $0x3,%edx
    95f6:	01 c2                	add    %eax,%edx
    95f8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    95ff:	89 c2                	mov    %eax,%edx
    9601:	89 d8                	mov    %ebx,%eax
    9603:	c1 e0 02             	shl    $0x2,%eax
    9606:	01 d8                	add    %ebx,%eax
    9608:	c1 e0 05             	shl    $0x5,%eax
    960b:	01 d0                	add    %edx,%eax
    960d:	01 f0                	add    %esi,%eax
    960f:	83 c0 4c             	add    $0x4c,%eax
    9612:	8b 30                	mov    (%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    9614:	8b 7d 0c             	mov    0xc(%ebp),%edi
    9617:	8b 45 14             	mov    0x14(%ebp),%eax
    961a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    961d:	89 c2                	mov    %eax,%edx
    961f:	c1 e2 03             	shl    $0x3,%edx
    9622:	01 c2                	add    %eax,%edx
    9624:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    962b:	89 c2                	mov    %eax,%edx
    962d:	89 d8                	mov    %ebx,%eax
    962f:	c1 e0 02             	shl    $0x2,%eax
    9632:	01 d8                	add    %ebx,%eax
    9634:	c1 e0 05             	shl    $0x5,%eax
    9637:	01 d0                	add    %edx,%eax
    9639:	01 f8                	add    %edi,%eax
    963b:	83 c0 50             	add    $0x50,%eax
    963e:	8b 00                	mov    (%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    9640:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    9642:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    9645:	89 c8                	mov    %ecx,%eax
    9647:	c1 e0 03             	shl    $0x3,%eax
    964a:	01 c8                	add    %ecx,%eax
    964c:	c1 e0 02             	shl    $0x2,%eax
    964f:	01 c8                	add    %ecx,%eax
    9651:	01 d0                	add    %edx,%eax
    9653:	8b 04 85 40 0d 01 00 	mov    0x10d40(,%eax,4),%eax
    965a:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    965d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    9664:	e9 ac 01 00 00       	jmp    9815 <III_hufman_decode+0x306>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    9669:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    966c:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    966f:	7d 43                	jge    96b4 <III_hufman_decode+0x1a5>
    9671:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9674:	8b 45 14             	mov    0x14(%ebp),%eax
    9677:	8b 4d 10             	mov    0x10(%ebp),%ecx
    967a:	89 c2                	mov    %eax,%edx
    967c:	c1 e2 03             	shl    $0x3,%edx
    967f:	01 c2                	add    %eax,%edx
    9681:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9688:	89 c2                	mov    %eax,%edx
    968a:	89 c8                	mov    %ecx,%eax
    968c:	c1 e0 02             	shl    $0x2,%eax
    968f:	01 c8                	add    %ecx,%eax
    9691:	c1 e0 05             	shl    $0x5,%eax
    9694:	01 d0                	add    %edx,%eax
    9696:	01 d8                	add    %ebx,%eax
    9698:	83 c0 34             	add    $0x34,%eax
    969b:	8b 10                	mov    (%eax),%edx
    969d:	89 d0                	mov    %edx,%eax
    969f:	c1 e0 02             	shl    $0x2,%eax
    96a2:	01 d0                	add    %edx,%eax
    96a4:	c1 e0 03             	shl    $0x3,%eax
    96a7:	05 80 4a 01 00       	add    $0x14a80,%eax
    96ac:	89 45 e0             	mov    %eax,-0x20(%ebp)
    96af:	e9 86 00 00 00       	jmp    973a <III_hufman_decode+0x22b>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    96b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    96b7:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    96ba:	7d 40                	jge    96fc <III_hufman_decode+0x1ed>
    96bc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    96bf:	8b 45 14             	mov    0x14(%ebp),%eax
    96c2:	8b 4d 10             	mov    0x10(%ebp),%ecx
    96c5:	89 c2                	mov    %eax,%edx
    96c7:	c1 e2 03             	shl    $0x3,%edx
    96ca:	01 c2                	add    %eax,%edx
    96cc:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    96d3:	89 c2                	mov    %eax,%edx
    96d5:	89 c8                	mov    %ecx,%eax
    96d7:	c1 e0 02             	shl    $0x2,%eax
    96da:	01 c8                	add    %ecx,%eax
    96dc:	c1 e0 05             	shl    $0x5,%eax
    96df:	01 d0                	add    %edx,%eax
    96e1:	01 d8                	add    %ebx,%eax
    96e3:	83 c0 38             	add    $0x38,%eax
    96e6:	8b 10                	mov    (%eax),%edx
    96e8:	89 d0                	mov    %edx,%eax
    96ea:	c1 e0 02             	shl    $0x2,%eax
    96ed:	01 d0                	add    %edx,%eax
    96ef:	c1 e0 03             	shl    $0x3,%eax
    96f2:	05 80 4a 01 00       	add    $0x14a80,%eax
    96f7:	89 45 e0             	mov    %eax,-0x20(%ebp)
    96fa:	eb 3e                	jmp    973a <III_hufman_decode+0x22b>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    96fc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    96ff:	8b 45 14             	mov    0x14(%ebp),%eax
    9702:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9705:	89 c2                	mov    %eax,%edx
    9707:	c1 e2 03             	shl    $0x3,%edx
    970a:	01 c2                	add    %eax,%edx
    970c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9713:	89 c2                	mov    %eax,%edx
    9715:	89 c8                	mov    %ecx,%eax
    9717:	c1 e0 02             	shl    $0x2,%eax
    971a:	01 c8                	add    %ecx,%eax
    971c:	c1 e0 05             	shl    $0x5,%eax
    971f:	01 d0                	add    %edx,%eax
    9721:	01 d8                	add    %ebx,%eax
    9723:	83 c0 3c             	add    $0x3c,%eax
    9726:	8b 10                	mov    (%eax),%edx
    9728:	89 d0                	mov    %edx,%eax
    972a:	c1 e0 02             	shl    $0x2,%eax
    972d:	01 d0                	add    %edx,%eax
    972f:	c1 e0 03             	shl    $0x3,%eax
    9732:	05 80 4a 01 00       	add    $0x14a80,%eax
    9737:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    973a:	8d 45 c8             	lea    -0x38(%ebp),%eax
    973d:	89 44 24 10          	mov    %eax,0x10(%esp)
    9741:	8d 45 cc             	lea    -0x34(%ebp),%eax
    9744:	89 44 24 0c          	mov    %eax,0xc(%esp)
    9748:	8d 45 d0             	lea    -0x30(%ebp),%eax
    974b:	89 44 24 08          	mov    %eax,0x8(%esp)
    974f:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    9752:	89 44 24 04          	mov    %eax,0x4(%esp)
    9756:	8b 45 e0             	mov    -0x20(%ebp),%eax
    9759:	89 04 24             	mov    %eax,(%esp)
    975c:	e8 fd ee ff ff       	call   865e <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = x;
    9761:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9764:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9769:	89 c8                	mov    %ecx,%eax
    976b:	f7 ea                	imul   %edx
    976d:	c1 fa 02             	sar    $0x2,%edx
    9770:	89 c8                	mov    %ecx,%eax
    9772:	c1 f8 1f             	sar    $0x1f,%eax
    9775:	29 c2                	sub    %eax,%edx
    9777:	89 d0                	mov    %edx,%eax
    9779:	89 c2                	mov    %eax,%edx
    977b:	89 d0                	mov    %edx,%eax
    977d:	c1 e0 03             	shl    $0x3,%eax
    9780:	01 d0                	add    %edx,%eax
    9782:	c1 e0 03             	shl    $0x3,%eax
    9785:	89 c2                	mov    %eax,%edx
    9787:	8b 45 08             	mov    0x8(%ebp),%eax
    978a:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    978d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9790:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9795:	89 c8                	mov    %ecx,%eax
    9797:	f7 ea                	imul   %edx
    9799:	c1 fa 02             	sar    $0x2,%edx
    979c:	89 c8                	mov    %ecx,%eax
    979e:	c1 f8 1f             	sar    $0x1f,%eax
    97a1:	29 c2                	sub    %eax,%edx
    97a3:	89 d0                	mov    %edx,%eax
    97a5:	c1 e0 03             	shl    $0x3,%eax
    97a8:	01 d0                	add    %edx,%eax
    97aa:	01 c0                	add    %eax,%eax
    97ac:	29 c1                	sub    %eax,%ecx
    97ae:	89 ca                	mov    %ecx,%edx
    97b0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    97b3:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    97b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    97b9:	8d 48 01             	lea    0x1(%eax),%ecx
    97bc:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    97c1:	89 c8                	mov    %ecx,%eax
    97c3:	f7 ea                	imul   %edx
    97c5:	c1 fa 02             	sar    $0x2,%edx
    97c8:	89 c8                	mov    %ecx,%eax
    97ca:	c1 f8 1f             	sar    $0x1f,%eax
    97cd:	29 c2                	sub    %eax,%edx
    97cf:	89 d0                	mov    %edx,%eax
    97d1:	89 c2                	mov    %eax,%edx
    97d3:	89 d0                	mov    %edx,%eax
    97d5:	c1 e0 03             	shl    $0x3,%eax
    97d8:	01 d0                	add    %edx,%eax
    97da:	c1 e0 03             	shl    $0x3,%eax
    97dd:	89 c2                	mov    %eax,%edx
    97df:	8b 45 08             	mov    0x8(%ebp),%eax
    97e2:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    97e5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    97e8:	8d 48 01             	lea    0x1(%eax),%ecx
    97eb:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    97f0:	89 c8                	mov    %ecx,%eax
    97f2:	f7 ea                	imul   %edx
    97f4:	c1 fa 02             	sar    $0x2,%edx
    97f7:	89 c8                	mov    %ecx,%eax
    97f9:	c1 f8 1f             	sar    $0x1f,%eax
    97fc:	29 c2                	sub    %eax,%edx
    97fe:	89 d0                	mov    %edx,%eax
    9800:	c1 e0 03             	shl    $0x3,%eax
    9803:	01 d0                	add    %edx,%eax
    9805:	01 c0                	add    %eax,%eax
    9807:	29 c1                	sub    %eax,%ecx
    9809:	89 ca                	mov    %ecx,%edx
    980b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    980e:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    9811:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    9815:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    9818:	8b 75 0c             	mov    0xc(%ebp),%esi
    981b:	8b 45 14             	mov    0x14(%ebp),%eax
    981e:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9821:	89 c2                	mov    %eax,%edx
    9823:	c1 e2 03             	shl    $0x3,%edx
    9826:	01 c2                	add    %eax,%edx
    9828:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    982f:	89 c2                	mov    %eax,%edx
    9831:	89 c8                	mov    %ecx,%eax
    9833:	c1 e0 02             	shl    $0x2,%eax
    9836:	01 c8                	add    %ecx,%eax
    9838:	c1 e0 05             	shl    $0x5,%eax
    983b:	01 d0                	add    %edx,%eax
    983d:	01 f0                	add    %esi,%eax
    983f:	83 c0 1c             	add    $0x1c,%eax
    9842:	8b 00                	mov    (%eax),%eax
    9844:	01 c0                	add    %eax,%eax
    9846:	39 c3                	cmp    %eax,%ebx
    9848:	0f 82 1b fe ff ff    	jb     9669 <III_hufman_decode+0x15a>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    984e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9851:	8b 45 14             	mov    0x14(%ebp),%eax
    9854:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9857:	89 c2                	mov    %eax,%edx
    9859:	c1 e2 03             	shl    $0x3,%edx
    985c:	01 c2                	add    %eax,%edx
    985e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9865:	89 c2                	mov    %eax,%edx
    9867:	89 c8                	mov    %ecx,%eax
    9869:	c1 e0 02             	shl    $0x2,%eax
    986c:	01 c8                	add    %ecx,%eax
    986e:	c1 e0 05             	shl    $0x5,%eax
    9871:	01 d0                	add    %edx,%eax
    9873:	01 d8                	add    %ebx,%eax
    9875:	83 c0 5c             	add    $0x5c,%eax
    9878:	8b 00                	mov    (%eax),%eax
    987a:	8d 50 20             	lea    0x20(%eax),%edx
    987d:	89 d0                	mov    %edx,%eax
    987f:	c1 e0 02             	shl    $0x2,%eax
    9882:	01 d0                	add    %edx,%eax
    9884:	c1 e0 03             	shl    $0x3,%eax
    9887:	05 80 4a 01 00       	add    $0x14a80,%eax
    988c:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    988f:	e9 91 01 00 00       	jmp    9a25 <III_hufman_decode+0x516>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    9894:	8d 45 c8             	lea    -0x38(%ebp),%eax
    9897:	89 44 24 10          	mov    %eax,0x10(%esp)
    989b:	8d 45 cc             	lea    -0x34(%ebp),%eax
    989e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    98a2:	8d 45 d0             	lea    -0x30(%ebp),%eax
    98a5:	89 44 24 08          	mov    %eax,0x8(%esp)
    98a9:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    98ac:	89 44 24 04          	mov    %eax,0x4(%esp)
    98b0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    98b3:	89 04 24             	mov    %eax,(%esp)
    98b6:	e8 a3 ed ff ff       	call   865e <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = v;
    98bb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    98be:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    98c3:	89 c8                	mov    %ecx,%eax
    98c5:	f7 ea                	imul   %edx
    98c7:	c1 fa 02             	sar    $0x2,%edx
    98ca:	89 c8                	mov    %ecx,%eax
    98cc:	c1 f8 1f             	sar    $0x1f,%eax
    98cf:	29 c2                	sub    %eax,%edx
    98d1:	89 d0                	mov    %edx,%eax
    98d3:	89 c2                	mov    %eax,%edx
    98d5:	89 d0                	mov    %edx,%eax
    98d7:	c1 e0 03             	shl    $0x3,%eax
    98da:	01 d0                	add    %edx,%eax
    98dc:	c1 e0 03             	shl    $0x3,%eax
    98df:	89 c2                	mov    %eax,%edx
    98e1:	8b 45 08             	mov    0x8(%ebp),%eax
    98e4:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    98e7:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    98ea:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    98ef:	89 c8                	mov    %ecx,%eax
    98f1:	f7 ea                	imul   %edx
    98f3:	c1 fa 02             	sar    $0x2,%edx
    98f6:	89 c8                	mov    %ecx,%eax
    98f8:	c1 f8 1f             	sar    $0x1f,%eax
    98fb:	29 c2                	sub    %eax,%edx
    98fd:	89 d0                	mov    %edx,%eax
    98ff:	c1 e0 03             	shl    $0x3,%eax
    9902:	01 d0                	add    %edx,%eax
    9904:	01 c0                	add    %eax,%eax
    9906:	29 c1                	sub    %eax,%ecx
    9908:	89 ca                	mov    %ecx,%edx
    990a:	8b 45 cc             	mov    -0x34(%ebp),%eax
    990d:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    9910:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9913:	8d 48 01             	lea    0x1(%eax),%ecx
    9916:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    991b:	89 c8                	mov    %ecx,%eax
    991d:	f7 ea                	imul   %edx
    991f:	c1 fa 02             	sar    $0x2,%edx
    9922:	89 c8                	mov    %ecx,%eax
    9924:	c1 f8 1f             	sar    $0x1f,%eax
    9927:	29 c2                	sub    %eax,%edx
    9929:	89 d0                	mov    %edx,%eax
    992b:	89 c2                	mov    %eax,%edx
    992d:	89 d0                	mov    %edx,%eax
    992f:	c1 e0 03             	shl    $0x3,%eax
    9932:	01 d0                	add    %edx,%eax
    9934:	c1 e0 03             	shl    $0x3,%eax
    9937:	89 c2                	mov    %eax,%edx
    9939:	8b 45 08             	mov    0x8(%ebp),%eax
    993c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    993f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9942:	8d 48 01             	lea    0x1(%eax),%ecx
    9945:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    994a:	89 c8                	mov    %ecx,%eax
    994c:	f7 ea                	imul   %edx
    994e:	c1 fa 02             	sar    $0x2,%edx
    9951:	89 c8                	mov    %ecx,%eax
    9953:	c1 f8 1f             	sar    $0x1f,%eax
    9956:	29 c2                	sub    %eax,%edx
    9958:	89 d0                	mov    %edx,%eax
    995a:	c1 e0 03             	shl    $0x3,%eax
    995d:	01 d0                	add    %edx,%eax
    995f:	01 c0                	add    %eax,%eax
    9961:	29 c1                	sub    %eax,%ecx
    9963:	89 ca                	mov    %ecx,%edx
    9965:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9968:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    996b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    996e:	8d 48 02             	lea    0x2(%eax),%ecx
    9971:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9976:	89 c8                	mov    %ecx,%eax
    9978:	f7 ea                	imul   %edx
    997a:	c1 fa 02             	sar    $0x2,%edx
    997d:	89 c8                	mov    %ecx,%eax
    997f:	c1 f8 1f             	sar    $0x1f,%eax
    9982:	29 c2                	sub    %eax,%edx
    9984:	89 d0                	mov    %edx,%eax
    9986:	89 c2                	mov    %eax,%edx
    9988:	89 d0                	mov    %edx,%eax
    998a:	c1 e0 03             	shl    $0x3,%eax
    998d:	01 d0                	add    %edx,%eax
    998f:	c1 e0 03             	shl    $0x3,%eax
    9992:	89 c2                	mov    %eax,%edx
    9994:	8b 45 08             	mov    0x8(%ebp),%eax
    9997:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    999a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    999d:	8d 48 02             	lea    0x2(%eax),%ecx
    99a0:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    99a5:	89 c8                	mov    %ecx,%eax
    99a7:	f7 ea                	imul   %edx
    99a9:	c1 fa 02             	sar    $0x2,%edx
    99ac:	89 c8                	mov    %ecx,%eax
    99ae:	c1 f8 1f             	sar    $0x1f,%eax
    99b1:	29 c2                	sub    %eax,%edx
    99b3:	89 d0                	mov    %edx,%eax
    99b5:	c1 e0 03             	shl    $0x3,%eax
    99b8:	01 d0                	add    %edx,%eax
    99ba:	01 c0                	add    %eax,%eax
    99bc:	29 c1                	sub    %eax,%ecx
    99be:	89 ca                	mov    %ecx,%edx
    99c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    99c3:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    99c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    99c9:	8d 48 03             	lea    0x3(%eax),%ecx
    99cc:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    99d1:	89 c8                	mov    %ecx,%eax
    99d3:	f7 ea                	imul   %edx
    99d5:	c1 fa 02             	sar    $0x2,%edx
    99d8:	89 c8                	mov    %ecx,%eax
    99da:	c1 f8 1f             	sar    $0x1f,%eax
    99dd:	29 c2                	sub    %eax,%edx
    99df:	89 d0                	mov    %edx,%eax
    99e1:	89 c2                	mov    %eax,%edx
    99e3:	89 d0                	mov    %edx,%eax
    99e5:	c1 e0 03             	shl    $0x3,%eax
    99e8:	01 d0                	add    %edx,%eax
    99ea:	c1 e0 03             	shl    $0x3,%eax
    99ed:	89 c2                	mov    %eax,%edx
    99ef:	8b 45 08             	mov    0x8(%ebp),%eax
    99f2:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    99f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    99f8:	8d 48 03             	lea    0x3(%eax),%ecx
    99fb:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9a00:	89 c8                	mov    %ecx,%eax
    9a02:	f7 ea                	imul   %edx
    9a04:	c1 fa 02             	sar    $0x2,%edx
    9a07:	89 c8                	mov    %ecx,%eax
    9a09:	c1 f8 1f             	sar    $0x1f,%eax
    9a0c:	29 c2                	sub    %eax,%edx
    9a0e:	89 d0                	mov    %edx,%eax
    9a10:	c1 e0 03             	shl    $0x3,%eax
    9a13:	01 d0                	add    %edx,%eax
    9a15:	01 c0                	add    %eax,%eax
    9a17:	29 c1                	sub    %eax,%ecx
    9a19:	89 ca                	mov    %ecx,%edx
    9a1b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    9a1e:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    9a21:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    9a25:	e8 5b d3 ff ff       	call   6d85 <hsstell>
    9a2a:	89 c3                	mov    %eax,%ebx
    9a2c:	8b 75 0c             	mov    0xc(%ebp),%esi
    9a2f:	8b 45 14             	mov    0x14(%ebp),%eax
    9a32:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9a35:	89 c2                	mov    %eax,%edx
    9a37:	c1 e2 03             	shl    $0x3,%edx
    9a3a:	01 c2                	add    %eax,%edx
    9a3c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9a43:	89 c2                	mov    %eax,%edx
    9a45:	89 c8                	mov    %ecx,%eax
    9a47:	c1 e0 02             	shl    $0x2,%eax
    9a4a:	01 c8                	add    %ecx,%eax
    9a4c:	c1 e0 05             	shl    $0x5,%eax
    9a4f:	01 d0                	add    %edx,%eax
    9a51:	01 f0                	add    %esi,%eax
    9a53:	83 c0 18             	add    $0x18,%eax
    9a56:	8b 10                	mov    (%eax),%edx
    9a58:	8b 45 18             	mov    0x18(%ebp),%eax
    9a5b:	01 d0                	add    %edx,%eax
    9a5d:	39 c3                	cmp    %eax,%ebx
    9a5f:	73 0d                	jae    9a6e <III_hufman_decode+0x55f>
    9a61:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    9a68:	0f 8e 26 fe ff ff    	jle    9894 <III_hufman_decode+0x385>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    9a6e:	e8 12 d3 ff ff       	call   6d85 <hsstell>
    9a73:	89 c3                	mov    %eax,%ebx
    9a75:	8b 75 0c             	mov    0xc(%ebp),%esi
    9a78:	8b 45 14             	mov    0x14(%ebp),%eax
    9a7b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9a7e:	89 c2                	mov    %eax,%edx
    9a80:	c1 e2 03             	shl    $0x3,%edx
    9a83:	01 c2                	add    %eax,%edx
    9a85:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9a8c:	89 c2                	mov    %eax,%edx
    9a8e:	89 c8                	mov    %ecx,%eax
    9a90:	c1 e0 02             	shl    $0x2,%eax
    9a93:	01 c8                	add    %ecx,%eax
    9a95:	c1 e0 05             	shl    $0x5,%eax
    9a98:	01 d0                	add    %edx,%eax
    9a9a:	01 f0                	add    %esi,%eax
    9a9c:	83 c0 18             	add    $0x18,%eax
    9a9f:	8b 10                	mov    (%eax),%edx
    9aa1:	8b 45 18             	mov    0x18(%ebp),%eax
    9aa4:	01 d0                	add    %edx,%eax
    9aa6:	39 c3                	cmp    %eax,%ebx
    9aa8:	76 48                	jbe    9af2 <III_hufman_decode+0x5e3>
   {  i -=4;
    9aaa:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    9aae:	e8 d2 d2 ff ff       	call   6d85 <hsstell>
    9ab3:	8b 55 18             	mov    0x18(%ebp),%edx
    9ab6:	29 d0                	sub    %edx,%eax
    9ab8:	89 c6                	mov    %eax,%esi
    9aba:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9abd:	8b 45 14             	mov    0x14(%ebp),%eax
    9ac0:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9ac3:	89 c2                	mov    %eax,%edx
    9ac5:	c1 e2 03             	shl    $0x3,%edx
    9ac8:	01 c2                	add    %eax,%edx
    9aca:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9ad1:	89 c2                	mov    %eax,%edx
    9ad3:	89 c8                	mov    %ecx,%eax
    9ad5:	c1 e0 02             	shl    $0x2,%eax
    9ad8:	01 c8                	add    %ecx,%eax
    9ada:	c1 e0 05             	shl    $0x5,%eax
    9add:	01 d0                	add    %edx,%eax
    9adf:	01 d8                	add    %ebx,%eax
    9ae1:	83 c0 18             	add    $0x18,%eax
    9ae4:	8b 00                	mov    (%eax),%eax
    9ae6:	29 c6                	sub    %eax,%esi
    9ae8:	89 f0                	mov    %esi,%eax
    9aea:	89 04 24             	mov    %eax,(%esp)
    9aed:	e8 de d2 ff ff       	call   6dd0 <rewindNbits>
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    9af2:	e8 8e d2 ff ff       	call   6d85 <hsstell>
    9af7:	89 c3                	mov    %eax,%ebx
    9af9:	8b 75 0c             	mov    0xc(%ebp),%esi
    9afc:	8b 45 14             	mov    0x14(%ebp),%eax
    9aff:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9b02:	89 c2                	mov    %eax,%edx
    9b04:	c1 e2 03             	shl    $0x3,%edx
    9b07:	01 c2                	add    %eax,%edx
    9b09:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9b10:	89 c2                	mov    %eax,%edx
    9b12:	89 c8                	mov    %ecx,%eax
    9b14:	c1 e0 02             	shl    $0x2,%eax
    9b17:	01 c8                	add    %ecx,%eax
    9b19:	c1 e0 05             	shl    $0x5,%eax
    9b1c:	01 d0                	add    %edx,%eax
    9b1e:	01 f0                	add    %esi,%eax
    9b20:	83 c0 18             	add    $0x18,%eax
    9b23:	8b 10                	mov    (%eax),%edx
    9b25:	8b 45 18             	mov    0x18(%ebp),%eax
    9b28:	01 d0                	add    %edx,%eax
    9b2a:	39 c3                	cmp    %eax,%ebx
    9b2c:	73 45                	jae    9b73 <III_hufman_decode+0x664>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    9b2e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9b31:	8b 45 14             	mov    0x14(%ebp),%eax
    9b34:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9b37:	89 c2                	mov    %eax,%edx
    9b39:	c1 e2 03             	shl    $0x3,%edx
    9b3c:	01 c2                	add    %eax,%edx
    9b3e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9b45:	89 c2                	mov    %eax,%edx
    9b47:	89 c8                	mov    %ecx,%eax
    9b49:	c1 e0 02             	shl    $0x2,%eax
    9b4c:	01 c8                	add    %ecx,%eax
    9b4e:	c1 e0 05             	shl    $0x5,%eax
    9b51:	01 d0                	add    %edx,%eax
    9b53:	01 d8                	add    %ebx,%eax
    9b55:	83 c0 18             	add    $0x18,%eax
    9b58:	8b 10                	mov    (%eax),%edx
    9b5a:	8b 45 18             	mov    0x18(%ebp),%eax
    9b5d:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9b60:	e8 20 d2 ff ff       	call   6d85 <hsstell>
    9b65:	29 c3                	sub    %eax,%ebx
    9b67:	89 d8                	mov    %ebx,%eax
    9b69:	89 04 24             	mov    %eax,(%esp)
    9b6c:	e8 30 d2 ff ff       	call   6da1 <hgetbits>

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    9b71:	eb 5c                	jmp    9bcf <III_hufman_decode+0x6c0>
    9b73:	eb 5a                	jmp    9bcf <III_hufman_decode+0x6c0>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    9b75:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9b78:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9b7d:	89 c8                	mov    %ecx,%eax
    9b7f:	f7 ea                	imul   %edx
    9b81:	c1 fa 02             	sar    $0x2,%edx
    9b84:	89 c8                	mov    %ecx,%eax
    9b86:	c1 f8 1f             	sar    $0x1f,%eax
    9b89:	29 c2                	sub    %eax,%edx
    9b8b:	89 d0                	mov    %edx,%eax
    9b8d:	89 c2                	mov    %eax,%edx
    9b8f:	89 d0                	mov    %edx,%eax
    9b91:	c1 e0 03             	shl    $0x3,%eax
    9b94:	01 d0                	add    %edx,%eax
    9b96:	c1 e0 03             	shl    $0x3,%eax
    9b99:	89 c2                	mov    %eax,%edx
    9b9b:	8b 45 08             	mov    0x8(%ebp),%eax
    9b9e:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9ba1:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9ba4:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9ba9:	89 c8                	mov    %ecx,%eax
    9bab:	f7 ea                	imul   %edx
    9bad:	c1 fa 02             	sar    $0x2,%edx
    9bb0:	89 c8                	mov    %ecx,%eax
    9bb2:	c1 f8 1f             	sar    $0x1f,%eax
    9bb5:	29 c2                	sub    %eax,%edx
    9bb7:	89 d0                	mov    %edx,%eax
    9bb9:	c1 e0 03             	shl    $0x3,%eax
    9bbc:	01 d0                	add    %edx,%eax
    9bbe:	01 c0                	add    %eax,%eax
    9bc0:	29 c1                	sub    %eax,%ecx
    9bc2:	89 ca                	mov    %ecx,%edx
    9bc4:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    9bcb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9bcf:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    9bd6:	7e 9d                	jle    9b75 <III_hufman_decode+0x666>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    9bd8:	83 c4 4c             	add    $0x4c,%esp
    9bdb:	5b                   	pop    %ebx
    9bdc:	5e                   	pop    %esi
    9bdd:	5f                   	pop    %edi
    9bde:	5d                   	pop    %ebp
    9bdf:	c3                   	ret    

00009be0 <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    9be0:	55                   	push   %ebp
    9be1:	89 e5                	mov    %esp,%ebp
    9be3:	56                   	push   %esi
    9be4:	53                   	push   %ebx
    9be5:	83 ec 50             	sub    $0x50,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    9be8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9bef:	8b 45 1c             	mov    0x1c(%ebp),%eax
    9bf2:	8b 00                	mov    (%eax),%eax
    9bf4:	8b 40 10             	mov    0x10(%eax),%eax
    9bf7:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    9bfa:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    9c01:	8b 45 14             	mov    0x14(%ebp),%eax
    9c04:	8b 40 10             	mov    0x10(%eax),%eax
    9c07:	85 c0                	test   %eax,%eax
    9c09:	74 61                	je     9c6c <III_dequantize_sample+0x8c>
    9c0b:	8b 45 14             	mov    0x14(%ebp),%eax
    9c0e:	8b 40 14             	mov    0x14(%eax),%eax
    9c11:	83 f8 02             	cmp    $0x2,%eax
    9c14:	75 56                	jne    9c6c <III_dequantize_sample+0x8c>
		if (gr_info->mixed_block_flag)
    9c16:	8b 45 14             	mov    0x14(%ebp),%eax
    9c19:	8b 40 18             	mov    0x18(%eax),%eax
    9c1c:	85 c0                	test   %eax,%eax
    9c1e:	74 15                	je     9c35 <III_dequantize_sample+0x55>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    9c20:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9c23:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9c29:	05 44 0d 01 00       	add    $0x10d44,%eax
    9c2e:	8b 00                	mov    (%eax),%eax
    9c30:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    9c33:	eb 4a                	jmp    9c7f <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    9c35:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9c38:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9c3e:	05 94 0d 01 00       	add    $0x10d94,%eax
    9c43:	8b 50 0c             	mov    0xc(%eax),%edx
    9c46:	89 d0                	mov    %edx,%eax
    9c48:	01 c0                	add    %eax,%eax
    9c4a:	01 d0                	add    %edx,%eax
    9c4c:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    9c4f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9c52:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9c58:	05 94 0d 01 00       	add    $0x10d94,%eax
    9c5d:	8b 40 0c             	mov    0xc(%eax),%eax
    9c60:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    9c63:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    9c6a:	eb 13                	jmp    9c7f <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    9c6c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9c6f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9c75:	05 44 0d 01 00       	add    $0x10d44,%eax
    9c7a:	8b 00                	mov    (%eax),%eax
    9c7c:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    9c7f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9c86:	e9 3d 06 00 00       	jmp    a2c8 <III_dequantize_sample+0x6e8>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    9c8b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9c92:	e9 23 06 00 00       	jmp    a2ba <III_dequantize_sample+0x6da>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    9c97:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9c9a:	89 d0                	mov    %edx,%eax
    9c9c:	c1 e0 03             	shl    $0x3,%eax
    9c9f:	01 d0                	add    %edx,%eax
    9ca1:	01 c0                	add    %eax,%eax
    9ca3:	89 c2                	mov    %eax,%edx
    9ca5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9ca8:	01 d0                	add    %edx,%eax
    9caa:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    9cad:	0f 85 9e 02 00 00    	jne    9f51 <III_dequantize_sample+0x371>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    9cb3:	8b 45 14             	mov    0x14(%ebp),%eax
    9cb6:	8b 40 10             	mov    0x10(%eax),%eax
    9cb9:	85 c0                	test   %eax,%eax
    9cbb:	0f 84 6b 02 00 00    	je     9f2c <III_dequantize_sample+0x34c>
    9cc1:	8b 45 14             	mov    0x14(%ebp),%eax
    9cc4:	8b 40 14             	mov    0x14(%eax),%eax
    9cc7:	83 f8 02             	cmp    $0x2,%eax
    9cca:	0f 85 5c 02 00 00    	jne    9f2c <III_dequantize_sample+0x34c>
					if (gr_info->mixed_block_flag) {
    9cd0:	8b 45 14             	mov    0x14(%ebp),%eax
    9cd3:	8b 40 18             	mov    0x18(%eax),%eax
    9cd6:	85 c0                	test   %eax,%eax
    9cd8:	0f 84 af 01 00 00    	je     9e8d <III_dequantize_sample+0x2ad>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    9cde:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9ce1:	89 d0                	mov    %edx,%eax
    9ce3:	c1 e0 03             	shl    $0x3,%eax
    9ce6:	01 d0                	add    %edx,%eax
    9ce8:	01 c0                	add    %eax,%eax
    9cea:	89 c2                	mov    %eax,%edx
    9cec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9cef:	01 c2                	add    %eax,%edx
    9cf1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9cf4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9cfa:	05 60 0d 01 00       	add    $0x10d60,%eax
    9cff:	8b 00                	mov    (%eax),%eax
    9d01:	39 c2                	cmp    %eax,%edx
    9d03:	0f 85 93 00 00 00    	jne    9d9c <III_dequantize_sample+0x1bc>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    9d09:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9d0c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9d12:	05 a0 0d 01 00       	add    $0x10da0,%eax
    9d17:	8b 50 0c             	mov    0xc(%eax),%edx
    9d1a:	89 d0                	mov    %edx,%eax
    9d1c:	01 c0                	add    %eax,%eax
    9d1e:	01 d0                	add    %edx,%eax
    9d20:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    9d23:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    9d2a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9d2d:	8d 48 01             	lea    0x1(%eax),%ecx
    9d30:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9d33:	89 d0                	mov    %edx,%eax
    9d35:	c1 e0 03             	shl    $0x3,%eax
    9d38:	01 d0                	add    %edx,%eax
    9d3a:	c1 e0 02             	shl    $0x2,%eax
    9d3d:	01 d0                	add    %edx,%eax
    9d3f:	01 c8                	add    %ecx,%eax
    9d41:	83 c0 14             	add    $0x14,%eax
    9d44:	8b 0c 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    9d4b:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9d4e:	89 d0                	mov    %edx,%eax
    9d50:	c1 e0 03             	shl    $0x3,%eax
    9d53:	01 d0                	add    %edx,%eax
    9d55:	c1 e0 02             	shl    $0x2,%eax
    9d58:	01 d0                	add    %edx,%eax
    9d5a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9d5d:	01 d0                	add    %edx,%eax
    9d5f:	83 c0 14             	add    $0x14,%eax
    9d62:	8b 04 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    9d69:	29 c1                	sub    %eax,%ecx
    9d6b:	89 c8                	mov    %ecx,%eax
    9d6d:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    9d70:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9d73:	89 d0                	mov    %edx,%eax
    9d75:	c1 e0 03             	shl    $0x3,%eax
    9d78:	01 d0                	add    %edx,%eax
    9d7a:	c1 e0 02             	shl    $0x2,%eax
    9d7d:	01 d0                	add    %edx,%eax
    9d7f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9d82:	01 d0                	add    %edx,%eax
    9d84:	83 c0 14             	add    $0x14,%eax
    9d87:	8b 14 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%edx
    9d8e:	89 d0                	mov    %edx,%eax
    9d90:	01 c0                	add    %eax,%eax
    9d92:	01 d0                	add    %edx,%eax
    9d94:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    9d97:	e9 8e 01 00 00       	jmp    9f2a <III_dequantize_sample+0x34a>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    9d9c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9d9f:	89 d0                	mov    %edx,%eax
    9da1:	c1 e0 03             	shl    $0x3,%eax
    9da4:	01 d0                	add    %edx,%eax
    9da6:	01 c0                	add    %eax,%eax
    9da8:	89 c2                	mov    %eax,%edx
    9daa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9dad:	01 c2                	add    %eax,%edx
    9daf:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9db2:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9db8:	05 60 0d 01 00       	add    $0x10d60,%eax
    9dbd:	8b 00                	mov    (%eax),%eax
    9dbf:	39 c2                	cmp    %eax,%edx
    9dc1:	7d 2a                	jge    9ded <III_dequantize_sample+0x20d>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    9dc3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9dc7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9dca:	8d 48 01             	lea    0x1(%eax),%ecx
    9dcd:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9dd0:	89 d0                	mov    %edx,%eax
    9dd2:	c1 e0 03             	shl    $0x3,%eax
    9dd5:	01 d0                	add    %edx,%eax
    9dd7:	c1 e0 02             	shl    $0x2,%eax
    9dda:	01 d0                	add    %edx,%eax
    9ddc:	01 c8                	add    %ecx,%eax
    9dde:	8b 04 85 40 0d 01 00 	mov    0x10d40(,%eax,4),%eax
    9de5:	89 45 e8             	mov    %eax,-0x18(%ebp)
    9de8:	e9 3d 01 00 00       	jmp    9f2a <III_dequantize_sample+0x34a>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    9ded:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9df1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9df4:	8d 48 01             	lea    0x1(%eax),%ecx
    9df7:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9dfa:	89 d0                	mov    %edx,%eax
    9dfc:	c1 e0 03             	shl    $0x3,%eax
    9dff:	01 d0                	add    %edx,%eax
    9e01:	c1 e0 02             	shl    $0x2,%eax
    9e04:	01 d0                	add    %edx,%eax
    9e06:	01 c8                	add    %ecx,%eax
    9e08:	83 c0 14             	add    $0x14,%eax
    9e0b:	8b 14 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%edx
    9e12:	89 d0                	mov    %edx,%eax
    9e14:	01 c0                	add    %eax,%eax
    9e16:	01 d0                	add    %edx,%eax
    9e18:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    9e1b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9e1e:	8d 48 01             	lea    0x1(%eax),%ecx
    9e21:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9e24:	89 d0                	mov    %edx,%eax
    9e26:	c1 e0 03             	shl    $0x3,%eax
    9e29:	01 d0                	add    %edx,%eax
    9e2b:	c1 e0 02             	shl    $0x2,%eax
    9e2e:	01 d0                	add    %edx,%eax
    9e30:	01 c8                	add    %ecx,%eax
    9e32:	83 c0 14             	add    $0x14,%eax
    9e35:	8b 0c 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    9e3c:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9e3f:	89 d0                	mov    %edx,%eax
    9e41:	c1 e0 03             	shl    $0x3,%eax
    9e44:	01 d0                	add    %edx,%eax
    9e46:	c1 e0 02             	shl    $0x2,%eax
    9e49:	01 d0                	add    %edx,%eax
    9e4b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9e4e:	01 d0                	add    %edx,%eax
    9e50:	83 c0 14             	add    $0x14,%eax
    9e53:	8b 04 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    9e5a:	29 c1                	sub    %eax,%ecx
    9e5c:	89 c8                	mov    %ecx,%eax
    9e5e:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    9e61:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9e64:	89 d0                	mov    %edx,%eax
    9e66:	c1 e0 03             	shl    $0x3,%eax
    9e69:	01 d0                	add    %edx,%eax
    9e6b:	c1 e0 02             	shl    $0x2,%eax
    9e6e:	01 d0                	add    %edx,%eax
    9e70:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9e73:	01 d0                	add    %edx,%eax
    9e75:	83 c0 14             	add    $0x14,%eax
    9e78:	8b 14 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%edx
    9e7f:	89 d0                	mov    %edx,%eax
    9e81:	01 c0                	add    %eax,%eax
    9e83:	01 d0                	add    %edx,%eax
    9e85:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    9e88:	e9 c4 00 00 00       	jmp    9f51 <III_dequantize_sample+0x371>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    9e8d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9e91:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9e94:	8d 48 01             	lea    0x1(%eax),%ecx
    9e97:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9e9a:	89 d0                	mov    %edx,%eax
    9e9c:	c1 e0 03             	shl    $0x3,%eax
    9e9f:	01 d0                	add    %edx,%eax
    9ea1:	c1 e0 02             	shl    $0x2,%eax
    9ea4:	01 d0                	add    %edx,%eax
    9ea6:	01 c8                	add    %ecx,%eax
    9ea8:	83 c0 14             	add    $0x14,%eax
    9eab:	8b 14 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%edx
    9eb2:	89 d0                	mov    %edx,%eax
    9eb4:	01 c0                	add    %eax,%eax
    9eb6:	01 d0                	add    %edx,%eax
    9eb8:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    9ebb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9ebe:	8d 48 01             	lea    0x1(%eax),%ecx
    9ec1:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9ec4:	89 d0                	mov    %edx,%eax
    9ec6:	c1 e0 03             	shl    $0x3,%eax
    9ec9:	01 d0                	add    %edx,%eax
    9ecb:	c1 e0 02             	shl    $0x2,%eax
    9ece:	01 d0                	add    %edx,%eax
    9ed0:	01 c8                	add    %ecx,%eax
    9ed2:	83 c0 14             	add    $0x14,%eax
    9ed5:	8b 0c 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    9edc:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9edf:	89 d0                	mov    %edx,%eax
    9ee1:	c1 e0 03             	shl    $0x3,%eax
    9ee4:	01 d0                	add    %edx,%eax
    9ee6:	c1 e0 02             	shl    $0x2,%eax
    9ee9:	01 d0                	add    %edx,%eax
    9eeb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9eee:	01 d0                	add    %edx,%eax
    9ef0:	83 c0 14             	add    $0x14,%eax
    9ef3:	8b 04 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    9efa:	29 c1                	sub    %eax,%ecx
    9efc:	89 c8                	mov    %ecx,%eax
    9efe:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    9f01:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9f04:	89 d0                	mov    %edx,%eax
    9f06:	c1 e0 03             	shl    $0x3,%eax
    9f09:	01 d0                	add    %edx,%eax
    9f0b:	c1 e0 02             	shl    $0x2,%eax
    9f0e:	01 d0                	add    %edx,%eax
    9f10:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9f13:	01 d0                	add    %edx,%eax
    9f15:	83 c0 14             	add    $0x14,%eax
    9f18:	8b 14 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%edx
    9f1f:	89 d0                	mov    %edx,%eax
    9f21:	01 c0                	add    %eax,%eax
    9f23:	01 d0                	add    %edx,%eax
    9f25:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    9f28:	eb 27                	jmp    9f51 <III_dequantize_sample+0x371>
    9f2a:	eb 25                	jmp    9f51 <III_dequantize_sample+0x371>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    9f2c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9f30:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9f33:	8d 48 01             	lea    0x1(%eax),%ecx
    9f36:	8b 55 dc             	mov    -0x24(%ebp),%edx
    9f39:	89 d0                	mov    %edx,%eax
    9f3b:	c1 e0 03             	shl    $0x3,%eax
    9f3e:	01 d0                	add    %edx,%eax
    9f40:	c1 e0 02             	shl    $0x2,%eax
    9f43:	01 d0                	add    %edx,%eax
    9f45:	01 c8                	add    %ecx,%eax
    9f47:	8b 04 85 40 0d 01 00 	mov    0x10d40(,%eax,4),%eax
    9f4e:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    9f51:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9f54:	89 d0                	mov    %edx,%eax
    9f56:	c1 e0 03             	shl    $0x3,%eax
    9f59:	01 d0                	add    %edx,%eax
    9f5b:	c1 e0 04             	shl    $0x4,%eax
    9f5e:	89 c2                	mov    %eax,%edx
    9f60:	8b 45 0c             	mov    0xc(%ebp),%eax
    9f63:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9f66:	8b 45 14             	mov    0x14(%ebp),%eax
    9f69:	8b 40 08             	mov    0x8(%eax),%eax
    9f6c:	ba 00 00 00 00       	mov    $0x0,%edx
    9f71:	89 45 c8             	mov    %eax,-0x38(%ebp)
    9f74:	89 55 cc             	mov    %edx,-0x34(%ebp)
    9f77:	df 6d c8             	fildll -0x38(%ebp)
    9f7a:	dd 05 b0 f0 00 00    	fldl   0xf0b0
    9f80:	de e9                	fsubrp %st,%st(1)
    9f82:	dd 05 b8 f0 00 00    	fldl   0xf0b8
    9f88:	de c9                	fmulp  %st,%st(1)
    9f8a:	dd 5c 24 08          	fstpl  0x8(%esp)
    9f8e:	dd 05 c0 f0 00 00    	fldl   0xf0c0
    9f94:	dd 1c 24             	fstpl  (%esp)
    9f97:	e8 0c c1 ff ff       	call   60a8 <pow>
    9f9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f9f:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    9fa2:	8b 45 14             	mov    0x14(%ebp),%eax
    9fa5:	8b 40 10             	mov    0x10(%eax),%eax
    9fa8:	85 c0                	test   %eax,%eax
    9faa:	0f 84 86 01 00 00    	je     a136 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    9fb0:	8b 45 14             	mov    0x14(%ebp),%eax
    9fb3:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    9fb6:	83 f8 02             	cmp    $0x2,%eax
    9fb9:	75 0a                	jne    9fc5 <III_dequantize_sample+0x3e5>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    9fbb:	8b 45 14             	mov    0x14(%ebp),%eax
    9fbe:	8b 40 18             	mov    0x18(%eax),%eax
    9fc1:	85 c0                	test   %eax,%eax
    9fc3:	74 27                	je     9fec <III_dequantize_sample+0x40c>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    9fc5:	8b 45 14             	mov    0x14(%ebp),%eax
    9fc8:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    9fcb:	83 f8 02             	cmp    $0x2,%eax
    9fce:	0f 85 62 01 00 00    	jne    a136 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    9fd4:	8b 45 14             	mov    0x14(%ebp),%eax
    9fd7:	8b 40 18             	mov    0x18(%eax),%eax
    9fda:	85 c0                	test   %eax,%eax
    9fdc:	0f 84 54 01 00 00    	je     a136 <III_dequantize_sample+0x556>
    9fe2:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    9fe6:	0f 8e 4a 01 00 00    	jle    a136 <III_dequantize_sample+0x556>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    9fec:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9fef:	89 d0                	mov    %edx,%eax
    9ff1:	c1 e0 03             	shl    $0x3,%eax
    9ff4:	01 d0                	add    %edx,%eax
    9ff6:	c1 e0 04             	shl    $0x4,%eax
    9ff9:	89 c2                	mov    %eax,%edx
    9ffb:	8b 45 0c             	mov    0xc(%ebp),%eax
    9ffe:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    a001:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a004:	89 d0                	mov    %edx,%eax
    a006:	c1 e0 03             	shl    $0x3,%eax
    a009:	01 d0                	add    %edx,%eax
    a00b:	c1 e0 04             	shl    $0x4,%eax
    a00e:	89 c2                	mov    %eax,%edx
    a010:	8b 45 0c             	mov    0xc(%ebp),%eax
    a013:	01 c2                	add    %eax,%edx
    a015:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a018:	dd 04 c2             	fldl   (%edx,%eax,8)
    a01b:	dd 5d c0             	fstpl  -0x40(%ebp)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    a01e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a021:	89 d0                	mov    %edx,%eax
    a023:	c1 e0 03             	shl    $0x3,%eax
    a026:	01 d0                	add    %edx,%eax
    a028:	01 c0                	add    %eax,%eax
    a02a:	89 c2                	mov    %eax,%edx
    a02c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a02f:	01 d0                	add    %edx,%eax
    a031:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    a034:	99                   	cltd   
    a035:	f7 7d e0             	idivl  -0x20(%ebp)
    a038:	89 c2                	mov    %eax,%edx
    a03a:	8b 45 14             	mov    0x14(%ebp),%eax
    a03d:	83 c2 08             	add    $0x8,%edx
    a040:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    a044:	ba 00 00 00 00       	mov    $0x0,%edx
    a049:	89 45 c8             	mov    %eax,-0x38(%ebp)
    a04c:	89 55 cc             	mov    %edx,-0x34(%ebp)
    a04f:	df 6d c8             	fildll -0x38(%ebp)
    a052:	dd 05 c8 f0 00 00    	fldl   0xf0c8
    a058:	de c9                	fmulp  %st,%st(1)
    a05a:	dd 5c 24 08          	fstpl  0x8(%esp)
    a05e:	dd 05 c0 f0 00 00    	fldl   0xf0c0
    a064:	dd 1c 24             	fstpl  (%esp)
    a067:	e8 3c c0 ff ff       	call   60a8 <pow>
    a06c:	dc 4d c0             	fmull  -0x40(%ebp)
    a06f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a072:	dd 1c c3             	fstpl  (%ebx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    a075:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a078:	89 d0                	mov    %edx,%eax
    a07a:	c1 e0 03             	shl    $0x3,%eax
    a07d:	01 d0                	add    %edx,%eax
    a07f:	c1 e0 04             	shl    $0x4,%eax
    a082:	89 c2                	mov    %eax,%edx
    a084:	8b 45 0c             	mov    0xc(%ebp),%eax
    a087:	8d 34 02             	lea    (%edx,%eax,1),%esi
    a08a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a08d:	89 d0                	mov    %edx,%eax
    a08f:	c1 e0 03             	shl    $0x3,%eax
    a092:	01 d0                	add    %edx,%eax
    a094:	c1 e0 04             	shl    $0x4,%eax
    a097:	89 c2                	mov    %eax,%edx
    a099:	8b 45 0c             	mov    0xc(%ebp),%eax
    a09c:	01 c2                	add    %eax,%edx
    a09e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a0a1:	dd 04 c2             	fldl   (%edx,%eax,8)
    a0a4:	dd 5d c0             	fstpl  -0x40(%ebp)
    a0a7:	8b 45 14             	mov    0x14(%ebp),%eax
    a0aa:	8b 40 40             	mov    0x40(%eax),%eax
    a0ad:	ba 00 00 00 00       	mov    $0x0,%edx
    a0b2:	89 45 c8             	mov    %eax,-0x38(%ebp)
    a0b5:	89 55 cc             	mov    %edx,-0x34(%ebp)
    a0b8:	df 6d c8             	fildll -0x38(%ebp)
    a0bb:	d9 e8                	fld1   
    a0bd:	de c1                	faddp  %st,%st(1)
    a0bf:	dd 05 d0 f0 00 00    	fldl   0xf0d0
    a0c5:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    a0c7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a0ca:	89 d0                	mov    %edx,%eax
    a0cc:	c1 e0 03             	shl    $0x3,%eax
    a0cf:	01 d0                	add    %edx,%eax
    a0d1:	01 c0                	add    %eax,%eax
    a0d3:	89 c2                	mov    %eax,%edx
    a0d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a0d8:	01 d0                	add    %edx,%eax
    a0da:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    a0dd:	99                   	cltd   
    a0de:	f7 7d e0             	idivl  -0x20(%ebp)
    a0e1:	89 c2                	mov    %eax,%edx
    a0e3:	8b 5d 10             	mov    0x10(%ebp),%ebx
    a0e6:	8b 4d 18             	mov    0x18(%ebp),%ecx
    a0e9:	89 d0                	mov    %edx,%eax
    a0eb:	01 c0                	add    %eax,%eax
    a0ed:	01 d0                	add    %edx,%eax
    a0ef:	c1 e0 02             	shl    $0x2,%eax
    a0f2:	01 d0                	add    %edx,%eax
    a0f4:	89 ca                	mov    %ecx,%edx
    a0f6:	01 d2                	add    %edx,%edx
    a0f8:	89 d1                	mov    %edx,%ecx
    a0fa:	c1 e1 05             	shl    $0x5,%ecx
    a0fd:	29 d1                	sub    %edx,%ecx
    a0ff:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    a102:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a105:	01 d0                	add    %edx,%eax
    a107:	83 c0 14             	add    $0x14,%eax
    a10a:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    a10e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    a111:	db 45 d4             	fildl  -0x2c(%ebp)
    a114:	de c9                	fmulp  %st,%st(1)
    a116:	dd 5c 24 08          	fstpl  0x8(%esp)
    a11a:	dd 05 c0 f0 00 00    	fldl   0xf0c0
    a120:	dd 1c 24             	fstpl  (%esp)
    a123:	e8 80 bf ff ff       	call   60a8 <pow>
    a128:	dc 4d c0             	fmull  -0x40(%ebp)
    a12b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a12e:	dd 1c c6             	fstpl  (%esi,%eax,8)
    a131:	e9 ab 00 00 00       	jmp    a1e1 <III_dequantize_sample+0x601>
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    a136:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a139:	89 d0                	mov    %edx,%eax
    a13b:	c1 e0 03             	shl    $0x3,%eax
    a13e:	01 d0                	add    %edx,%eax
    a140:	c1 e0 04             	shl    $0x4,%eax
    a143:	89 c2                	mov    %eax,%edx
    a145:	8b 45 0c             	mov    0xc(%ebp),%eax
    a148:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    a14b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a14e:	89 d0                	mov    %edx,%eax
    a150:	c1 e0 03             	shl    $0x3,%eax
    a153:	01 d0                	add    %edx,%eax
    a155:	c1 e0 04             	shl    $0x4,%eax
    a158:	89 c2                	mov    %eax,%edx
    a15a:	8b 45 0c             	mov    0xc(%ebp),%eax
    a15d:	01 c2                	add    %eax,%edx
    a15f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a162:	dd 04 c2             	fldl   (%edx,%eax,8)
    a165:	dd 5d c0             	fstpl  -0x40(%ebp)
    a168:	8b 45 14             	mov    0x14(%ebp),%eax
    a16b:	8b 40 40             	mov    0x40(%eax),%eax
    a16e:	ba 00 00 00 00       	mov    $0x0,%edx
    a173:	89 45 c8             	mov    %eax,-0x38(%ebp)
    a176:	89 55 cc             	mov    %edx,-0x34(%ebp)
    a179:	df 6d c8             	fildll -0x38(%ebp)
    a17c:	d9 e8                	fld1   
    a17e:	de c1                	faddp  %st,%st(1)
    a180:	dd 05 d0 f0 00 00    	fldl   0xf0d0
    a186:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    a188:	8b 4d 10             	mov    0x10(%ebp),%ecx
    a18b:	8b 45 18             	mov    0x18(%ebp),%eax
    a18e:	01 c0                	add    %eax,%eax
    a190:	89 c2                	mov    %eax,%edx
    a192:	c1 e2 05             	shl    $0x5,%edx
    a195:	29 c2                	sub    %eax,%edx
    a197:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a19a:	01 d0                	add    %edx,%eax
    a19c:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    a19f:	89 c2                	mov    %eax,%edx
    a1a1:	8b 45 14             	mov    0x14(%ebp),%eax
    a1a4:	8b 48 3c             	mov    0x3c(%eax),%ecx
    a1a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a1aa:	8b 04 85 00 0f 01 00 	mov    0x10f00(,%eax,4),%eax
    a1b1:	0f af c1             	imul   %ecx,%eax
    a1b4:	01 d0                	add    %edx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    a1b6:	ba 00 00 00 00       	mov    $0x0,%edx
    a1bb:	89 45 c8             	mov    %eax,-0x38(%ebp)
    a1be:	89 55 cc             	mov    %edx,-0x34(%ebp)
    a1c1:	df 6d c8             	fildll -0x38(%ebp)
    a1c4:	de c9                	fmulp  %st,%st(1)
    a1c6:	dd 5c 24 08          	fstpl  0x8(%esp)
    a1ca:	dd 05 c0 f0 00 00    	fldl   0xf0c0
    a1d0:	dd 1c 24             	fstpl  (%esp)
    a1d3:	e8 d0 be ff ff       	call   60a8 <pow>
    a1d8:	dc 4d c0             	fmull  -0x40(%ebp)
    a1db:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a1de:	dd 1c c3             	fstpl  (%ebx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    a1e1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a1e4:	89 d0                	mov    %edx,%eax
    a1e6:	c1 e0 03             	shl    $0x3,%eax
    a1e9:	01 d0                	add    %edx,%eax
    a1eb:	c1 e0 03             	shl    $0x3,%eax
    a1ee:	89 c2                	mov    %eax,%edx
    a1f0:	8b 45 08             	mov    0x8(%ebp),%eax
    a1f3:	01 c2                	add    %eax,%edx
    a1f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a1f8:	8b 04 82             	mov    (%edx,%eax,4),%eax
    a1fb:	c1 e8 1f             	shr    $0x1f,%eax
    a1fe:	0f b6 c0             	movzbl %al,%eax
    a201:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    a204:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a207:	89 d0                	mov    %edx,%eax
    a209:	c1 e0 03             	shl    $0x3,%eax
    a20c:	01 d0                	add    %edx,%eax
    a20e:	c1 e0 04             	shl    $0x4,%eax
    a211:	89 c2                	mov    %eax,%edx
    a213:	8b 45 0c             	mov    0xc(%ebp),%eax
    a216:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    a219:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a21c:	89 d0                	mov    %edx,%eax
    a21e:	c1 e0 03             	shl    $0x3,%eax
    a221:	01 d0                	add    %edx,%eax
    a223:	c1 e0 04             	shl    $0x4,%eax
    a226:	89 c2                	mov    %eax,%edx
    a228:	8b 45 0c             	mov    0xc(%ebp),%eax
    a22b:	01 c2                	add    %eax,%edx
    a22d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a230:	dd 04 c2             	fldl   (%edx,%eax,8)
    a233:	dd 5d c0             	fstpl  -0x40(%ebp)
    a236:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a239:	89 d0                	mov    %edx,%eax
    a23b:	c1 e0 03             	shl    $0x3,%eax
    a23e:	01 d0                	add    %edx,%eax
    a240:	c1 e0 03             	shl    $0x3,%eax
    a243:	89 c2                	mov    %eax,%edx
    a245:	8b 45 08             	mov    0x8(%ebp),%eax
    a248:	01 c2                	add    %eax,%edx
    a24a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a24d:	8b 04 82             	mov    (%edx,%eax,4),%eax
    a250:	89 04 24             	mov    %eax,(%esp)
    a253:	e8 47 bd ff ff       	call   5f9f <abs>
    a258:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    a25b:	db 45 d4             	fildl  -0x2c(%ebp)
    a25e:	dd 05 d8 f0 00 00    	fldl   0xf0d8
    a264:	dd 5c 24 08          	fstpl  0x8(%esp)
    a268:	dd 1c 24             	fstpl  (%esp)
    a26b:	e8 38 be ff ff       	call   60a8 <pow>
    a270:	dc 4d c0             	fmull  -0x40(%ebp)
    a273:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a276:	dd 1c c3             	fstpl  (%ebx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    a279:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    a27d:	74 37                	je     a2b6 <III_dequantize_sample+0x6d6>
    a27f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a282:	89 d0                	mov    %edx,%eax
    a284:	c1 e0 03             	shl    $0x3,%eax
    a287:	01 d0                	add    %edx,%eax
    a289:	c1 e0 04             	shl    $0x4,%eax
    a28c:	89 c2                	mov    %eax,%edx
    a28e:	8b 45 0c             	mov    0xc(%ebp),%eax
    a291:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a294:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a297:	89 d0                	mov    %edx,%eax
    a299:	c1 e0 03             	shl    $0x3,%eax
    a29c:	01 d0                	add    %edx,%eax
    a29e:	c1 e0 04             	shl    $0x4,%eax
    a2a1:	89 c2                	mov    %eax,%edx
    a2a3:	8b 45 0c             	mov    0xc(%ebp),%eax
    a2a6:	01 c2                	add    %eax,%edx
    a2a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a2ab:	dd 04 c2             	fldl   (%edx,%eax,8)
    a2ae:	d9 e0                	fchs   
    a2b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a2b3:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    a2b6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a2ba:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a2be:	0f 8e d3 f9 ff ff    	jle    9c97 <III_dequantize_sample+0xb7>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    a2c4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a2c8:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    a2cc:	0f 8e b9 f9 ff ff    	jle    9c8b <III_dequantize_sample+0xab>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    a2d2:	83 c4 50             	add    $0x50,%esp
    a2d5:	5b                   	pop    %ebx
    a2d6:	5e                   	pop    %esi
    a2d7:	5d                   	pop    %ebp
    a2d8:	c3                   	ret    

0000a2d9 <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    a2d9:	55                   	push   %ebp
    a2da:	89 e5                	mov    %esp,%ebp
    a2dc:	57                   	push   %edi
    a2dd:	56                   	push   %esi
    a2de:	53                   	push   %ebx
    a2df:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    a2e2:	8b 45 14             	mov    0x14(%ebp),%eax
    a2e5:	8b 00                	mov    (%eax),%eax
    a2e7:	8b 40 10             	mov    0x10(%eax),%eax
    a2ea:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    a2ed:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    a2f4:	eb 33                	jmp    a329 <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    a2f6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    a2fd:	eb 20                	jmp    a31f <III_reorder+0x46>
         ro[sb][ss] = 0;
    a2ff:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a302:	89 d0                	mov    %edx,%eax
    a304:	c1 e0 03             	shl    $0x3,%eax
    a307:	01 d0                	add    %edx,%eax
    a309:	c1 e0 04             	shl    $0x4,%eax
    a30c:	89 c2                	mov    %eax,%edx
    a30e:	8b 45 0c             	mov    0xc(%ebp),%eax
    a311:	01 c2                	add    %eax,%edx
    a313:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a316:	d9 ee                	fldz   
    a318:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    a31b:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    a31f:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    a323:	7e da                	jle    a2ff <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    a325:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    a329:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    a32d:	7e c7                	jle    a2f6 <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    a32f:	8b 45 10             	mov    0x10(%ebp),%eax
    a332:	8b 40 10             	mov    0x10(%eax),%eax
    a335:	85 c0                	test   %eax,%eax
    a337:	0f 84 af 03 00 00    	je     a6ec <III_reorder+0x413>
    a33d:	8b 45 10             	mov    0x10(%ebp),%eax
    a340:	8b 40 14             	mov    0x14(%eax),%eax
    a343:	83 f8 02             	cmp    $0x2,%eax
    a346:	0f 85 a0 03 00 00    	jne    a6ec <III_reorder+0x413>
      if (gr_info->mixed_block_flag) {
    a34c:	8b 45 10             	mov    0x10(%ebp),%eax
    a34f:	8b 40 18             	mov    0x18(%eax),%eax
    a352:	85 c0                	test   %eax,%eax
    a354:	0f 84 00 02 00 00    	je     a55a <III_reorder+0x281>
         for (sb=0 ; sb < 2 ; sb++)
    a35a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    a361:	eb 4c                	jmp    a3af <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    a363:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    a36a:	eb 39                	jmp    a3a5 <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    a36c:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a36f:	89 d0                	mov    %edx,%eax
    a371:	c1 e0 03             	shl    $0x3,%eax
    a374:	01 d0                	add    %edx,%eax
    a376:	c1 e0 04             	shl    $0x4,%eax
    a379:	89 c2                	mov    %eax,%edx
    a37b:	8b 45 0c             	mov    0xc(%ebp),%eax
    a37e:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a381:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a384:	89 d0                	mov    %edx,%eax
    a386:	c1 e0 03             	shl    $0x3,%eax
    a389:	01 d0                	add    %edx,%eax
    a38b:	c1 e0 04             	shl    $0x4,%eax
    a38e:	89 c2                	mov    %eax,%edx
    a390:	8b 45 08             	mov    0x8(%ebp),%eax
    a393:	01 c2                	add    %eax,%edx
    a395:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a398:	dd 04 c2             	fldl   (%edx,%eax,8)
    a39b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a39e:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    a3a1:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    a3a5:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    a3a9:	7e c1                	jle    a36c <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    a3ab:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    a3af:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    a3b3:	7e ae                	jle    a363 <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    a3b5:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    a3bc:	8b 45 d0             	mov    -0x30(%ebp),%eax
    a3bf:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a3c5:	05 9c 0d 01 00       	add    $0x10d9c,%eax
    a3ca:	8b 40 0c             	mov    0xc(%eax),%eax
    a3cd:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    a3d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    a3d3:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a3d9:	05 a0 0d 01 00       	add    $0x10da0,%eax
    a3de:	8b 40 0c             	mov    0xc(%eax),%eax
    a3e1:	2b 45 e8             	sub    -0x18(%ebp),%eax
    a3e4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    a3e7:	e9 5f 01 00 00       	jmp    a54b <III_reorder+0x272>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    a3ec:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    a3f3:	e9 fd 00 00 00       	jmp    a4f5 <III_reorder+0x21c>
                  for(freq=0;freq<sfb_lines;freq++) {
    a3f8:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    a3ff:	e9 e1 00 00 00       	jmp    a4e5 <III_reorder+0x20c>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    a404:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a407:	89 d0                	mov    %edx,%eax
    a409:	01 c0                	add    %eax,%eax
    a40b:	01 c2                	add    %eax,%edx
    a40d:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a410:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    a414:	01 c2                	add    %eax,%edx
    a416:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    a419:	01 d0                	add    %edx,%eax
    a41b:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    a41e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a421:	89 d0                	mov    %edx,%eax
    a423:	01 c0                	add    %eax,%eax
    a425:	01 c2                	add    %eax,%edx
    a427:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a42a:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a42d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    a430:	89 d0                	mov    %edx,%eax
    a432:	01 c0                	add    %eax,%eax
    a434:	01 d0                	add    %edx,%eax
    a436:	01 c8                	add    %ecx,%eax
    a438:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    a43b:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    a43e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a443:	89 c8                	mov    %ecx,%eax
    a445:	f7 ea                	imul   %edx
    a447:	c1 fa 02             	sar    $0x2,%edx
    a44a:	89 c8                	mov    %ecx,%eax
    a44c:	c1 f8 1f             	sar    $0x1f,%eax
    a44f:	29 c2                	sub    %eax,%edx
    a451:	89 d0                	mov    %edx,%eax
    a453:	89 c2                	mov    %eax,%edx
    a455:	89 d0                	mov    %edx,%eax
    a457:	c1 e0 03             	shl    $0x3,%eax
    a45a:	01 d0                	add    %edx,%eax
    a45c:	c1 e0 04             	shl    $0x4,%eax
    a45f:	89 c2                	mov    %eax,%edx
    a461:	8b 45 0c             	mov    0xc(%ebp),%eax
    a464:	8d 34 02             	lea    (%edx,%eax,1),%esi
    a467:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    a46a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a46f:	89 d8                	mov    %ebx,%eax
    a471:	f7 ea                	imul   %edx
    a473:	c1 fa 02             	sar    $0x2,%edx
    a476:	89 d8                	mov    %ebx,%eax
    a478:	c1 f8 1f             	sar    $0x1f,%eax
    a47b:	89 d1                	mov    %edx,%ecx
    a47d:	29 c1                	sub    %eax,%ecx
    a47f:	89 c8                	mov    %ecx,%eax
    a481:	c1 e0 03             	shl    $0x3,%eax
    a484:	01 c8                	add    %ecx,%eax
    a486:	01 c0                	add    %eax,%eax
    a488:	29 c3                	sub    %eax,%ebx
    a48a:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    a48c:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    a48f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a494:	89 d8                	mov    %ebx,%eax
    a496:	f7 ea                	imul   %edx
    a498:	c1 fa 02             	sar    $0x2,%edx
    a49b:	89 d8                	mov    %ebx,%eax
    a49d:	c1 f8 1f             	sar    $0x1f,%eax
    a4a0:	29 c2                	sub    %eax,%edx
    a4a2:	89 d0                	mov    %edx,%eax
    a4a4:	89 c2                	mov    %eax,%edx
    a4a6:	89 d0                	mov    %edx,%eax
    a4a8:	c1 e0 03             	shl    $0x3,%eax
    a4ab:	01 d0                	add    %edx,%eax
    a4ad:	c1 e0 04             	shl    $0x4,%eax
    a4b0:	89 c2                	mov    %eax,%edx
    a4b2:	8b 45 08             	mov    0x8(%ebp),%eax
    a4b5:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    a4b8:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    a4bb:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a4c0:	89 d8                	mov    %ebx,%eax
    a4c2:	f7 ea                	imul   %edx
    a4c4:	c1 fa 02             	sar    $0x2,%edx
    a4c7:	89 d8                	mov    %ebx,%eax
    a4c9:	c1 f8 1f             	sar    $0x1f,%eax
    a4cc:	29 c2                	sub    %eax,%edx
    a4ce:	89 d0                	mov    %edx,%eax
    a4d0:	c1 e0 03             	shl    $0x3,%eax
    a4d3:	01 d0                	add    %edx,%eax
    a4d5:	01 c0                	add    %eax,%eax
    a4d7:	29 c3                	sub    %eax,%ebx
    a4d9:	89 da                	mov    %ebx,%edx
    a4db:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    a4de:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    a4e1:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    a4e5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    a4e8:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    a4eb:	0f 8c 13 ff ff ff    	jl     a404 <III_reorder+0x12b>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    a4f1:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    a4f5:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    a4f9:	0f 8e f9 fe ff ff    	jle    a3f8 <III_reorder+0x11f>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    a4ff:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a503:	8b 55 d0             	mov    -0x30(%ebp),%edx
    a506:	89 d0                	mov    %edx,%eax
    a508:	c1 e0 03             	shl    $0x3,%eax
    a50b:	01 d0                	add    %edx,%eax
    a50d:	c1 e0 02             	shl    $0x2,%eax
    a510:	01 d0                	add    %edx,%eax
    a512:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a515:	01 d0                	add    %edx,%eax
    a517:	83 c0 14             	add    $0x14,%eax
    a51a:	8b 04 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%eax
    a521:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    a524:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a527:	8d 48 01             	lea    0x1(%eax),%ecx
    a52a:	8b 55 d0             	mov    -0x30(%ebp),%edx
    a52d:	89 d0                	mov    %edx,%eax
    a52f:	c1 e0 03             	shl    $0x3,%eax
    a532:	01 d0                	add    %edx,%eax
    a534:	c1 e0 02             	shl    $0x2,%eax
    a537:	01 d0                	add    %edx,%eax
    a539:	01 c8                	add    %ecx,%eax
    a53b:	83 c0 14             	add    $0x14,%eax
    a53e:	8b 04 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%eax
    a545:	2b 45 e8             	sub    -0x18(%ebp),%eax
    a548:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    a54b:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    a54f:	0f 8e 97 fe ff ff    	jle    a3ec <III_reorder+0x113>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    a555:	e9 ed 01 00 00       	jmp    a747 <III_reorder+0x46e>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    a55a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a561:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a568:	8b 45 d0             	mov    -0x30(%ebp),%eax
    a56b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a571:	05 94 0d 01 00       	add    $0x10d94,%eax
    a576:	8b 40 0c             	mov    0xc(%eax),%eax
    a579:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a57c:	e9 5f 01 00 00       	jmp    a6e0 <III_reorder+0x407>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    a581:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    a588:	e9 fd 00 00 00       	jmp    a68a <III_reorder+0x3b1>
                  for(freq=0;freq<sfb_lines;freq++) {
    a58d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    a594:	e9 e1 00 00 00       	jmp    a67a <III_reorder+0x3a1>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    a599:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a59c:	89 d0                	mov    %edx,%eax
    a59e:	01 c0                	add    %eax,%eax
    a5a0:	01 c2                	add    %eax,%edx
    a5a2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a5a5:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    a5a9:	01 c2                	add    %eax,%edx
    a5ab:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    a5ae:	01 d0                	add    %edx,%eax
    a5b0:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    a5b3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a5b6:	89 d0                	mov    %edx,%eax
    a5b8:	01 c0                	add    %eax,%eax
    a5ba:	01 c2                	add    %eax,%edx
    a5bc:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a5bf:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a5c2:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    a5c5:	89 d0                	mov    %edx,%eax
    a5c7:	01 c0                	add    %eax,%eax
    a5c9:	01 d0                	add    %edx,%eax
    a5cb:	01 c8                	add    %ecx,%eax
    a5cd:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    a5d0:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    a5d3:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a5d8:	89 c8                	mov    %ecx,%eax
    a5da:	f7 ea                	imul   %edx
    a5dc:	c1 fa 02             	sar    $0x2,%edx
    a5df:	89 c8                	mov    %ecx,%eax
    a5e1:	c1 f8 1f             	sar    $0x1f,%eax
    a5e4:	29 c2                	sub    %eax,%edx
    a5e6:	89 d0                	mov    %edx,%eax
    a5e8:	89 c2                	mov    %eax,%edx
    a5ea:	89 d0                	mov    %edx,%eax
    a5ec:	c1 e0 03             	shl    $0x3,%eax
    a5ef:	01 d0                	add    %edx,%eax
    a5f1:	c1 e0 04             	shl    $0x4,%eax
    a5f4:	89 c2                	mov    %eax,%edx
    a5f6:	8b 45 0c             	mov    0xc(%ebp),%eax
    a5f9:	8d 34 02             	lea    (%edx,%eax,1),%esi
    a5fc:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    a5ff:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a604:	89 d8                	mov    %ebx,%eax
    a606:	f7 ea                	imul   %edx
    a608:	c1 fa 02             	sar    $0x2,%edx
    a60b:	89 d8                	mov    %ebx,%eax
    a60d:	c1 f8 1f             	sar    $0x1f,%eax
    a610:	89 d1                	mov    %edx,%ecx
    a612:	29 c1                	sub    %eax,%ecx
    a614:	89 c8                	mov    %ecx,%eax
    a616:	c1 e0 03             	shl    $0x3,%eax
    a619:	01 c8                	add    %ecx,%eax
    a61b:	01 c0                	add    %eax,%eax
    a61d:	29 c3                	sub    %eax,%ebx
    a61f:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    a621:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    a624:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a629:	89 d8                	mov    %ebx,%eax
    a62b:	f7 ea                	imul   %edx
    a62d:	c1 fa 02             	sar    $0x2,%edx
    a630:	89 d8                	mov    %ebx,%eax
    a632:	c1 f8 1f             	sar    $0x1f,%eax
    a635:	29 c2                	sub    %eax,%edx
    a637:	89 d0                	mov    %edx,%eax
    a639:	89 c2                	mov    %eax,%edx
    a63b:	89 d0                	mov    %edx,%eax
    a63d:	c1 e0 03             	shl    $0x3,%eax
    a640:	01 d0                	add    %edx,%eax
    a642:	c1 e0 04             	shl    $0x4,%eax
    a645:	89 c2                	mov    %eax,%edx
    a647:	8b 45 08             	mov    0x8(%ebp),%eax
    a64a:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    a64d:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    a650:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a655:	89 d8                	mov    %ebx,%eax
    a657:	f7 ea                	imul   %edx
    a659:	c1 fa 02             	sar    $0x2,%edx
    a65c:	89 d8                	mov    %ebx,%eax
    a65e:	c1 f8 1f             	sar    $0x1f,%eax
    a661:	29 c2                	sub    %eax,%edx
    a663:	89 d0                	mov    %edx,%eax
    a665:	c1 e0 03             	shl    $0x3,%eax
    a668:	01 d0                	add    %edx,%eax
    a66a:	01 c0                	add    %eax,%eax
    a66c:	29 c3                	sub    %eax,%ebx
    a66e:	89 da                	mov    %ebx,%edx
    a670:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    a673:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    a676:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    a67a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    a67d:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    a680:	0f 8c 13 ff ff ff    	jl     a599 <III_reorder+0x2c0>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    a686:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    a68a:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    a68e:	0f 8e f9 fe ff ff    	jle    a58d <III_reorder+0x2b4>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    a694:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a698:	8b 55 d0             	mov    -0x30(%ebp),%edx
    a69b:	89 d0                	mov    %edx,%eax
    a69d:	c1 e0 03             	shl    $0x3,%eax
    a6a0:	01 d0                	add    %edx,%eax
    a6a2:	c1 e0 02             	shl    $0x2,%eax
    a6a5:	01 d0                	add    %edx,%eax
    a6a7:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a6aa:	01 d0                	add    %edx,%eax
    a6ac:	83 c0 14             	add    $0x14,%eax
    a6af:	8b 04 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%eax
    a6b6:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    a6b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a6bc:	8d 48 01             	lea    0x1(%eax),%ecx
    a6bf:	8b 55 d0             	mov    -0x30(%ebp),%edx
    a6c2:	89 d0                	mov    %edx,%eax
    a6c4:	c1 e0 03             	shl    $0x3,%eax
    a6c7:	01 d0                	add    %edx,%eax
    a6c9:	c1 e0 02             	shl    $0x2,%eax
    a6cc:	01 d0                	add    %edx,%eax
    a6ce:	01 c8                	add    %ecx,%eax
    a6d0:	83 c0 14             	add    $0x14,%eax
    a6d3:	8b 04 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%eax
    a6da:	2b 45 e8             	sub    -0x18(%ebp),%eax
    a6dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    a6e0:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    a6e4:	0f 8e 97 fe ff ff    	jle    a581 <III_reorder+0x2a8>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    a6ea:	eb 5b                	jmp    a747 <III_reorder+0x46e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    a6ec:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    a6f3:	eb 4c                	jmp    a741 <III_reorder+0x468>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    a6f5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    a6fc:	eb 39                	jmp    a737 <III_reorder+0x45e>
            ro[sb][ss] = xr[sb][ss];
    a6fe:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a701:	89 d0                	mov    %edx,%eax
    a703:	c1 e0 03             	shl    $0x3,%eax
    a706:	01 d0                	add    %edx,%eax
    a708:	c1 e0 04             	shl    $0x4,%eax
    a70b:	89 c2                	mov    %eax,%edx
    a70d:	8b 45 0c             	mov    0xc(%ebp),%eax
    a710:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a713:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a716:	89 d0                	mov    %edx,%eax
    a718:	c1 e0 03             	shl    $0x3,%eax
    a71b:	01 d0                	add    %edx,%eax
    a71d:	c1 e0 04             	shl    $0x4,%eax
    a720:	89 c2                	mov    %eax,%edx
    a722:	8b 45 08             	mov    0x8(%ebp),%eax
    a725:	01 c2                	add    %eax,%edx
    a727:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a72a:	dd 04 c2             	fldl   (%edx,%eax,8)
    a72d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a730:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    a733:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    a737:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    a73b:	7e c1                	jle    a6fe <III_reorder+0x425>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    a73d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    a741:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    a745:	7e ae                	jle    a6f5 <III_reorder+0x41c>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    a747:	83 c4 34             	add    $0x34,%esp
    a74a:	5b                   	pop    %ebx
    a74b:	5e                   	pop    %esi
    a74c:	5f                   	pop    %edi
    a74d:	5d                   	pop    %ebp
    a74e:	c3                   	ret    

0000a74f <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    a74f:	55                   	push   %ebp
    a750:	89 e5                	mov    %esp,%ebp
    a752:	56                   	push   %esi
    a753:	53                   	push   %ebx
    a754:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    a75a:	8b 45 18             	mov    0x18(%ebp),%eax
    a75d:	8b 00                	mov    (%eax),%eax
    a75f:	8b 40 10             	mov    0x10(%eax),%eax
    a762:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    a765:	8b 45 18             	mov    0x18(%ebp),%eax
    a768:	8b 40 08             	mov    0x8(%eax),%eax
    a76b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    a76e:	8b 45 18             	mov    0x18(%ebp),%eax
    a771:	8b 00                	mov    (%eax),%eax
    a773:	8b 40 1c             	mov    0x1c(%eax),%eax
    a776:	83 f8 01             	cmp    $0x1,%eax
    a779:	75 16                	jne    a791 <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    a77b:	8b 45 18             	mov    0x18(%ebp),%eax
    a77e:	8b 00                	mov    (%eax),%eax
    a780:	8b 40 20             	mov    0x20(%eax),%eax
    a783:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    a786:	85 c0                	test   %eax,%eax
    a788:	74 07                	je     a791 <III_stereo+0x42>
    a78a:	b8 01 00 00 00       	mov    $0x1,%eax
    a78f:	eb 05                	jmp    a796 <III_stereo+0x47>
    a791:	b8 00 00 00 00       	mov    $0x0,%eax
    a796:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    a799:	8b 45 18             	mov    0x18(%ebp),%eax
    a79c:	8b 00                	mov    (%eax),%eax
    a79e:	8b 40 1c             	mov    0x1c(%eax),%eax
    a7a1:	83 f8 01             	cmp    $0x1,%eax
    a7a4:	75 16                	jne    a7bc <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    a7a6:	8b 45 18             	mov    0x18(%ebp),%eax
    a7a9:	8b 00                	mov    (%eax),%eax
    a7ab:	8b 40 20             	mov    0x20(%eax),%eax
    a7ae:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    a7b1:	85 c0                	test   %eax,%eax
    a7b3:	74 07                	je     a7bc <III_stereo+0x6d>
    a7b5:	b8 01 00 00 00       	mov    $0x1,%eax
    a7ba:	eb 05                	jmp    a7c1 <III_stereo+0x72>
    a7bc:	b8 00 00 00 00       	mov    $0x0,%eax
    a7c1:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    a7c4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    a7cb:	eb 12                	jmp    a7df <III_stereo+0x90>
      is_pos[i] = 7;
    a7cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    a7d0:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    a7d7:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    a7db:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a7df:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    a7e6:	7e e5                	jle    a7cd <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    a7e8:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    a7ec:	0f 85 18 0a 00 00    	jne    b20a <III_stereo+0xabb>
    a7f2:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    a7f6:	0f 84 0e 0a 00 00    	je     b20a <III_stereo+0xabb>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    a7fc:	8b 45 14             	mov    0x14(%ebp),%eax
    a7ff:	8b 40 10             	mov    0x10(%eax),%eax
    a802:	85 c0                	test   %eax,%eax
    a804:	0f 84 10 08 00 00    	je     b01a <III_stereo+0x8cb>
    a80a:	8b 45 14             	mov    0x14(%ebp),%eax
    a80d:	8b 40 14             	mov    0x14(%eax),%eax
    a810:	83 f8 02             	cmp    $0x2,%eax
    a813:	0f 85 01 08 00 00    	jne    b01a <III_stereo+0x8cb>
      {  if( gr_info->mixed_block_flag )
    a819:	8b 45 14             	mov    0x14(%ebp),%eax
    a81c:	8b 40 18             	mov    0x18(%eax),%eax
    a81f:	85 c0                	test   %eax,%eax
    a821:	0f 84 d0 04 00 00    	je     acf7 <III_stereo+0x5a8>
         {  int max_sfb = 0;
    a827:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    a82e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a835:	e9 1b 03 00 00       	jmp    ab55 <III_stereo+0x406>
            {  int sfbcnt;
               sfbcnt = 2;
    a83a:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    a841:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    a848:	e9 0f 01 00 00       	jmp    a95c <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    a84d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a850:	8d 48 01             	lea    0x1(%eax),%ecx
    a853:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a856:	89 d0                	mov    %edx,%eax
    a858:	c1 e0 03             	shl    $0x3,%eax
    a85b:	01 d0                	add    %edx,%eax
    a85d:	c1 e0 02             	shl    $0x2,%eax
    a860:	01 d0                	add    %edx,%eax
    a862:	01 c8                	add    %ecx,%eax
    a864:	83 c0 14             	add    $0x14,%eax
    a867:	8b 0c 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%ecx
    a86e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a871:	89 d0                	mov    %edx,%eax
    a873:	c1 e0 03             	shl    $0x3,%eax
    a876:	01 d0                	add    %edx,%eax
    a878:	c1 e0 02             	shl    $0x2,%eax
    a87b:	01 d0                	add    %edx,%eax
    a87d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a880:	01 d0                	add    %edx,%eax
    a882:	83 c0 14             	add    $0x14,%eax
    a885:	8b 04 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%eax
    a88c:	29 c1                	sub    %eax,%ecx
    a88e:	89 c8                	mov    %ecx,%eax
    a890:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    a893:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a896:	89 d0                	mov    %edx,%eax
    a898:	c1 e0 03             	shl    $0x3,%eax
    a89b:	01 d0                	add    %edx,%eax
    a89d:	c1 e0 02             	shl    $0x2,%eax
    a8a0:	01 d0                	add    %edx,%eax
    a8a2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a8a5:	01 d0                	add    %edx,%eax
    a8a7:	83 c0 14             	add    $0x14,%eax
    a8aa:	8b 14 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%edx
    a8b1:	89 d0                	mov    %edx,%eax
    a8b3:	01 c0                	add    %eax,%eax
    a8b5:	01 c2                	add    %eax,%edx
    a8b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a8ba:	83 c0 01             	add    $0x1,%eax
    a8bd:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    a8c1:	01 d0                	add    %edx,%eax
    a8c3:	83 e8 01             	sub    $0x1,%eax
    a8c6:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    a8c9:	e9 80 00 00 00       	jmp    a94e <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    a8ce:	8b 45 08             	mov    0x8(%ebp),%eax
    a8d1:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    a8d7:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a8da:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a8df:	89 c8                	mov    %ecx,%eax
    a8e1:	f7 ea                	imul   %edx
    a8e3:	c1 fa 02             	sar    $0x2,%edx
    a8e6:	89 c8                	mov    %ecx,%eax
    a8e8:	c1 f8 1f             	sar    $0x1f,%eax
    a8eb:	89 d3                	mov    %edx,%ebx
    a8ed:	29 c3                	sub    %eax,%ebx
    a8ef:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    a8f2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a8f7:	89 c8                	mov    %ecx,%eax
    a8f9:	f7 ea                	imul   %edx
    a8fb:	c1 fa 02             	sar    $0x2,%edx
    a8fe:	89 c8                	mov    %ecx,%eax
    a900:	c1 f8 1f             	sar    $0x1f,%eax
    a903:	29 c2                	sub    %eax,%edx
    a905:	89 d0                	mov    %edx,%eax
    a907:	c1 e0 03             	shl    $0x3,%eax
    a90a:	01 d0                	add    %edx,%eax
    a90c:	01 c0                	add    %eax,%eax
    a90e:	29 c1                	sub    %eax,%ecx
    a910:	89 ca                	mov    %ecx,%edx
    a912:	89 d8                	mov    %ebx,%eax
    a914:	c1 e0 03             	shl    $0x3,%eax
    a917:	01 d8                	add    %ebx,%eax
    a919:	01 c0                	add    %eax,%eax
    a91b:	01 d0                	add    %edx,%eax
    a91d:	dd 04 c6             	fldl   (%esi,%eax,8)
    a920:	d9 ee                	fldz   
    a922:	df e9                	fucomip %st(1),%st
    a924:	7a 0a                	jp     a930 <III_stereo+0x1e1>
    a926:	d9 ee                	fldz   
    a928:	df e9                	fucomip %st(1),%st
    a92a:	dd d8                	fstp   %st(0)
    a92c:	74 18                	je     a946 <III_stereo+0x1f7>
    a92e:	eb 02                	jmp    a932 <III_stereo+0x1e3>
    a930:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    a932:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a935:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    a938:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    a93f:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    a946:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    a94a:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    a94e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    a952:	0f 8f 76 ff ff ff    	jg     a8ce <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    a958:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    a95c:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    a960:	0f 8f e7 fe ff ff    	jg     a84d <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    a966:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a969:	83 c0 01             	add    $0x1,%eax
    a96c:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    a96f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a972:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    a975:	7e 0b                	jle    a982 <III_stereo+0x233>
                  max_sfb = sfb;
    a977:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a97a:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    a97d:	e9 f5 00 00 00       	jmp    aa77 <III_stereo+0x328>
    a982:	e9 f0 00 00 00       	jmp    aa77 <III_stereo+0x328>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    a987:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a98a:	8d 48 01             	lea    0x1(%eax),%ecx
    a98d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a990:	89 d0                	mov    %edx,%eax
    a992:	c1 e0 03             	shl    $0x3,%eax
    a995:	01 d0                	add    %edx,%eax
    a997:	c1 e0 02             	shl    $0x2,%eax
    a99a:	01 d0                	add    %edx,%eax
    a99c:	01 c8                	add    %ecx,%eax
    a99e:	83 c0 14             	add    $0x14,%eax
    a9a1:	8b 0c 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%ecx
    a9a8:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a9ab:	89 d0                	mov    %edx,%eax
    a9ad:	c1 e0 03             	shl    $0x3,%eax
    a9b0:	01 d0                	add    %edx,%eax
    a9b2:	c1 e0 02             	shl    $0x2,%eax
    a9b5:	01 d0                	add    %edx,%eax
    a9b7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a9ba:	01 d0                	add    %edx,%eax
    a9bc:	83 c0 14             	add    $0x14,%eax
    a9bf:	8b 04 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%eax
    a9c6:	29 c1                	sub    %eax,%ecx
    a9c8:	89 c8                	mov    %ecx,%eax
    a9ca:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    a9cd:	8b 55 c8             	mov    -0x38(%ebp),%edx
    a9d0:	89 d0                	mov    %edx,%eax
    a9d2:	c1 e0 03             	shl    $0x3,%eax
    a9d5:	01 d0                	add    %edx,%eax
    a9d7:	c1 e0 02             	shl    $0x2,%eax
    a9da:	01 d0                	add    %edx,%eax
    a9dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    a9df:	01 d0                	add    %edx,%eax
    a9e1:	83 c0 14             	add    $0x14,%eax
    a9e4:	8b 14 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%edx
    a9eb:	89 d0                	mov    %edx,%eax
    a9ed:	01 c0                	add    %eax,%eax
    a9ef:	01 c2                	add    %eax,%edx
    a9f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a9f4:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    a9f8:	01 d0                	add    %edx,%eax
    a9fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    a9fd:	eb 6e                	jmp    aa6d <III_stereo+0x31e>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    a9ff:	8b 4d 10             	mov    0x10(%ebp),%ecx
    aa02:	8b 55 ec             	mov    -0x14(%ebp),%edx
    aa05:	89 d0                	mov    %edx,%eax
    aa07:	01 c0                	add    %eax,%eax
    aa09:	01 d0                	add    %edx,%eax
    aa0b:	c1 e0 02             	shl    $0x2,%eax
    aa0e:	01 d0                	add    %edx,%eax
    aa10:	8b 55 f4             	mov    -0xc(%ebp),%edx
    aa13:	01 d0                	add    %edx,%eax
    aa15:	83 c0 52             	add    $0x52,%eax
    aa18:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    aa1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aa1f:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    aa26:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aa29:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    aa30:	83 f8 07             	cmp    $0x7,%eax
    aa33:	74 30                	je     aa65 <III_stereo+0x316>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    aa35:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aa38:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    aa3f:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    aa45:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    aa4b:	dd 05 e0 f0 00 00    	fldl   0xf0e0
    aa51:	de c9                	fmulp  %st,%st(1)
    aa53:	dd 1c 24             	fstpl  (%esp)
    aa56:	e8 1d b6 ff ff       	call   6078 <tan>
    aa5b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aa5e:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    aa65:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    aa69:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    aa6d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    aa71:	7f 8c                	jg     a9ff <III_stereo+0x2b0>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    aa73:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    aa77:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    aa7b:	0f 8e 06 ff ff ff    	jle    a987 <III_stereo+0x238>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    aa81:	8b 45 c8             	mov    -0x38(%ebp),%eax
    aa84:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    aa8a:	05 bc 0d 01 00       	add    $0x10dbc,%eax
    aa8f:	8b 50 0c             	mov    0xc(%eax),%edx
    aa92:	8b 45 c8             	mov    -0x38(%ebp),%eax
    aa95:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    aa9b:	05 b8 0d 01 00       	add    $0x10db8,%eax
    aaa0:	8b 40 0c             	mov    0xc(%eax),%eax
    aaa3:	29 c2                	sub    %eax,%edx
    aaa5:	89 d0                	mov    %edx,%eax
    aaa7:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    aaaa:	8b 45 c8             	mov    -0x38(%ebp),%eax
    aaad:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    aab3:	05 b8 0d 01 00       	add    $0x10db8,%eax
    aab8:	8b 50 0c             	mov    0xc(%eax),%edx
    aabb:	89 d0                	mov    %edx,%eax
    aabd:	01 c0                	add    %eax,%eax
    aabf:	01 c2                	add    %eax,%edx
    aac1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    aac4:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    aac8:	01 d0                	add    %edx,%eax
    aaca:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    aacd:	8b 45 c8             	mov    -0x38(%ebp),%eax
    aad0:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    aad6:	05 c0 0d 01 00       	add    $0x10dc0,%eax
    aadb:	8b 50 0c             	mov    0xc(%eax),%edx
    aade:	8b 45 c8             	mov    -0x38(%ebp),%eax
    aae1:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    aae7:	05 bc 0d 01 00       	add    $0x10dbc,%eax
    aaec:	8b 40 0c             	mov    0xc(%eax),%eax
    aaef:	29 c2                	sub    %eax,%edx
    aaf1:	89 d0                	mov    %edx,%eax
    aaf3:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    aaf6:	8b 45 c8             	mov    -0x38(%ebp),%eax
    aaf9:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    aaff:	05 bc 0d 01 00       	add    $0x10dbc,%eax
    ab04:	8b 50 0c             	mov    0xc(%eax),%edx
    ab07:	89 d0                	mov    %edx,%eax
    ab09:	01 c0                	add    %eax,%eax
    ab0b:	01 c2                	add    %eax,%edx
    ab0d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ab10:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    ab14:	01 d0                	add    %edx,%eax
    ab16:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    ab19:	eb 30                	jmp    ab4b <III_stereo+0x3fc>
               {  is_pos[i] = is_pos[sfb];
    ab1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ab1e:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    ab25:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ab28:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    ab2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ab32:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    ab39:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ab3c:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    ab43:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    ab47:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    ab4b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    ab4f:	7f ca                	jg     ab1b <III_stereo+0x3cc>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    ab51:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    ab55:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    ab59:	0f 8e db fc ff ff    	jle    a83a <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    ab5f:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    ab63:	0f 8f 89 01 00 00    	jg     acf2 <III_stereo+0x5a3>
             {  i = 2;
    ab69:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    ab70:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    ab77:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    ab7e:	eb 63                	jmp    abe3 <III_stereo+0x494>
                {  if ( xr[1][i][ss] != 0.0 )
    ab80:	8b 45 08             	mov    0x8(%ebp),%eax
    ab83:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    ab89:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ab8c:	89 d0                	mov    %edx,%eax
    ab8e:	c1 e0 03             	shl    $0x3,%eax
    ab91:	01 d0                	add    %edx,%eax
    ab93:	01 c0                	add    %eax,%eax
    ab95:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    ab98:	01 d0                	add    %edx,%eax
    ab9a:	dd 04 c1             	fldl   (%ecx,%eax,8)
    ab9d:	d9 ee                	fldz   
    ab9f:	df e9                	fucomip %st(1),%st
    aba1:	7a 0a                	jp     abad <III_stereo+0x45e>
    aba3:	d9 ee                	fldz   
    aba5:	df e9                	fucomip %st(1),%st
    aba7:	dd d8                	fstp   %st(0)
    aba9:	74 23                	je     abce <III_stereo+0x47f>
    abab:	eb 02                	jmp    abaf <III_stereo+0x460>
    abad:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    abaf:	8b 55 f0             	mov    -0x10(%ebp),%edx
    abb2:	89 d0                	mov    %edx,%eax
    abb4:	c1 e0 03             	shl    $0x3,%eax
    abb7:	01 d0                	add    %edx,%eax
    abb9:	01 c0                	add    %eax,%eax
    abbb:	89 c2                	mov    %eax,%edx
    abbd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    abc0:	01 d0                	add    %edx,%eax
    abc2:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    abc5:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    abcc:	eb 15                	jmp    abe3 <III_stereo+0x494>
                   } else
                   {  ss--;
    abce:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    abd2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    abd6:	79 0b                	jns    abe3 <III_stereo+0x494>
                      {  i--;
    abd8:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    abdc:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    abe3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    abe7:	79 97                	jns    ab80 <III_stereo+0x431>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    abe9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    abf0:	eb 04                	jmp    abf6 <III_stereo+0x4a7>
                   i++;
    abf2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    abf6:	8b 55 c8             	mov    -0x38(%ebp),%edx
    abf9:	89 d0                	mov    %edx,%eax
    abfb:	c1 e0 03             	shl    $0x3,%eax
    abfe:	01 d0                	add    %edx,%eax
    ac00:	c1 e0 02             	shl    $0x2,%eax
    ac03:	01 d0                	add    %edx,%eax
    ac05:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ac08:	01 d0                	add    %edx,%eax
    ac0a:	8b 04 85 40 0d 01 00 	mov    0x10d40(,%eax,4),%eax
    ac11:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    ac14:	7e dc                	jle    abf2 <III_stereo+0x4a3>
                   i++;
                sfb = i;
    ac16:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ac19:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    ac1c:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ac1f:	89 d0                	mov    %edx,%eax
    ac21:	c1 e0 03             	shl    $0x3,%eax
    ac24:	01 d0                	add    %edx,%eax
    ac26:	c1 e0 02             	shl    $0x2,%eax
    ac29:	01 d0                	add    %edx,%eax
    ac2b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ac2e:	01 d0                	add    %edx,%eax
    ac30:	8b 04 85 40 0d 01 00 	mov    0x10d40(,%eax,4),%eax
    ac37:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    ac3a:	e9 a9 00 00 00       	jmp    ace8 <III_stereo+0x599>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    ac3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ac42:	8d 48 01             	lea    0x1(%eax),%ecx
    ac45:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ac48:	89 d0                	mov    %edx,%eax
    ac4a:	c1 e0 03             	shl    $0x3,%eax
    ac4d:	01 d0                	add    %edx,%eax
    ac4f:	c1 e0 02             	shl    $0x2,%eax
    ac52:	01 d0                	add    %edx,%eax
    ac54:	01 c8                	add    %ecx,%eax
    ac56:	8b 0c 85 40 0d 01 00 	mov    0x10d40(,%eax,4),%ecx
    ac5d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ac60:	89 d0                	mov    %edx,%eax
    ac62:	c1 e0 03             	shl    $0x3,%eax
    ac65:	01 d0                	add    %edx,%eax
    ac67:	c1 e0 02             	shl    $0x2,%eax
    ac6a:	01 d0                	add    %edx,%eax
    ac6c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ac6f:	01 d0                	add    %edx,%eax
    ac71:	8b 04 85 40 0d 01 00 	mov    0x10d40(,%eax,4),%eax
    ac78:	29 c1                	sub    %eax,%ecx
    ac7a:	89 c8                	mov    %ecx,%eax
    ac7c:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    ac7f:	eb 5d                	jmp    acde <III_stereo+0x58f>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    ac81:	8b 45 10             	mov    0x10(%ebp),%eax
    ac84:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ac87:	83 c2 3e             	add    $0x3e,%edx
    ac8a:	8b 14 90             	mov    (%eax,%edx,4),%edx
    ac8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ac90:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    ac97:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ac9a:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    aca1:	83 f8 07             	cmp    $0x7,%eax
    aca4:	74 30                	je     acd6 <III_stereo+0x587>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    aca6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aca9:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    acb0:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    acb6:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    acbc:	dd 05 e0 f0 00 00    	fldl   0xf0e0
    acc2:	de c9                	fmulp  %st,%st(1)
    acc4:	dd 1c 24             	fstpl  (%esp)
    acc7:	e8 ac b3 ff ff       	call   6078 <tan>
    accc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    accf:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    acd6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    acda:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    acde:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    ace2:	7f 9d                	jg     ac81 <III_stereo+0x532>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    ace4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ace8:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    acec:	0f 8e 4d ff ff ff    	jle    ac3f <III_stereo+0x4f0>
    acf2:	e9 1e 03 00 00       	jmp    b015 <III_stereo+0x8c6>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    acf7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    acfe:	e9 08 03 00 00       	jmp    b00b <III_stereo+0x8bc>
            {  int sfbcnt;
               sfbcnt = -1;
    ad03:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    ad0a:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    ad11:	e9 0f 01 00 00       	jmp    ae25 <III_stereo+0x6d6>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    ad16:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ad19:	8d 48 01             	lea    0x1(%eax),%ecx
    ad1c:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ad1f:	89 d0                	mov    %edx,%eax
    ad21:	c1 e0 03             	shl    $0x3,%eax
    ad24:	01 d0                	add    %edx,%eax
    ad26:	c1 e0 02             	shl    $0x2,%eax
    ad29:	01 d0                	add    %edx,%eax
    ad2b:	01 c8                	add    %ecx,%eax
    ad2d:	83 c0 14             	add    $0x14,%eax
    ad30:	8b 0c 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%ecx
    ad37:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ad3a:	89 d0                	mov    %edx,%eax
    ad3c:	c1 e0 03             	shl    $0x3,%eax
    ad3f:	01 d0                	add    %edx,%eax
    ad41:	c1 e0 02             	shl    $0x2,%eax
    ad44:	01 d0                	add    %edx,%eax
    ad46:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ad49:	01 d0                	add    %edx,%eax
    ad4b:	83 c0 14             	add    $0x14,%eax
    ad4e:	8b 04 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%eax
    ad55:	29 c1                	sub    %eax,%ecx
    ad57:	89 c8                	mov    %ecx,%eax
    ad59:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    ad5c:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ad5f:	89 d0                	mov    %edx,%eax
    ad61:	c1 e0 03             	shl    $0x3,%eax
    ad64:	01 d0                	add    %edx,%eax
    ad66:	c1 e0 02             	shl    $0x2,%eax
    ad69:	01 d0                	add    %edx,%eax
    ad6b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ad6e:	01 d0                	add    %edx,%eax
    ad70:	83 c0 14             	add    $0x14,%eax
    ad73:	8b 14 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%edx
    ad7a:	89 d0                	mov    %edx,%eax
    ad7c:	01 c0                	add    %eax,%eax
    ad7e:	01 c2                	add    %eax,%edx
    ad80:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ad83:	83 c0 01             	add    $0x1,%eax
    ad86:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    ad8a:	01 d0                	add    %edx,%eax
    ad8c:	83 e8 01             	sub    $0x1,%eax
    ad8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    ad92:	e9 80 00 00 00       	jmp    ae17 <III_stereo+0x6c8>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    ad97:	8b 45 08             	mov    0x8(%ebp),%eax
    ad9a:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    ada0:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    ada3:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    ada8:	89 c8                	mov    %ecx,%eax
    adaa:	f7 ea                	imul   %edx
    adac:	c1 fa 02             	sar    $0x2,%edx
    adaf:	89 c8                	mov    %ecx,%eax
    adb1:	c1 f8 1f             	sar    $0x1f,%eax
    adb4:	89 d3                	mov    %edx,%ebx
    adb6:	29 c3                	sub    %eax,%ebx
    adb8:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    adbb:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    adc0:	89 c8                	mov    %ecx,%eax
    adc2:	f7 ea                	imul   %edx
    adc4:	c1 fa 02             	sar    $0x2,%edx
    adc7:	89 c8                	mov    %ecx,%eax
    adc9:	c1 f8 1f             	sar    $0x1f,%eax
    adcc:	29 c2                	sub    %eax,%edx
    adce:	89 d0                	mov    %edx,%eax
    add0:	c1 e0 03             	shl    $0x3,%eax
    add3:	01 d0                	add    %edx,%eax
    add5:	01 c0                	add    %eax,%eax
    add7:	29 c1                	sub    %eax,%ecx
    add9:	89 ca                	mov    %ecx,%edx
    addb:	89 d8                	mov    %ebx,%eax
    addd:	c1 e0 03             	shl    $0x3,%eax
    ade0:	01 d8                	add    %ebx,%eax
    ade2:	01 c0                	add    %eax,%eax
    ade4:	01 d0                	add    %edx,%eax
    ade6:	dd 04 c6             	fldl   (%esi,%eax,8)
    ade9:	d9 ee                	fldz   
    adeb:	df e9                	fucomip %st(1),%st
    aded:	7a 0a                	jp     adf9 <III_stereo+0x6aa>
    adef:	d9 ee                	fldz   
    adf1:	df e9                	fucomip %st(1),%st
    adf3:	dd d8                	fstp   %st(0)
    adf5:	74 18                	je     ae0f <III_stereo+0x6c0>
    adf7:	eb 02                	jmp    adfb <III_stereo+0x6ac>
    adf9:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    adfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    adfe:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    ae01:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    ae08:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    ae0f:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    ae13:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    ae17:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    ae1b:	0f 8f 76 ff ff ff    	jg     ad97 <III_stereo+0x648>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    ae21:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    ae25:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    ae29:	0f 89 e7 fe ff ff    	jns    ad16 <III_stereo+0x5c7>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    ae2f:	8b 45 d0             	mov    -0x30(%ebp),%eax
    ae32:	83 c0 01             	add    $0x1,%eax
    ae35:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    ae38:	e9 f0 00 00 00       	jmp    af2d <III_stereo+0x7de>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    ae3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ae40:	8d 48 01             	lea    0x1(%eax),%ecx
    ae43:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ae46:	89 d0                	mov    %edx,%eax
    ae48:	c1 e0 03             	shl    $0x3,%eax
    ae4b:	01 d0                	add    %edx,%eax
    ae4d:	c1 e0 02             	shl    $0x2,%eax
    ae50:	01 d0                	add    %edx,%eax
    ae52:	01 c8                	add    %ecx,%eax
    ae54:	83 c0 14             	add    $0x14,%eax
    ae57:	8b 0c 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%ecx
    ae5e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ae61:	89 d0                	mov    %edx,%eax
    ae63:	c1 e0 03             	shl    $0x3,%eax
    ae66:	01 d0                	add    %edx,%eax
    ae68:	c1 e0 02             	shl    $0x2,%eax
    ae6b:	01 d0                	add    %edx,%eax
    ae6d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ae70:	01 d0                	add    %edx,%eax
    ae72:	83 c0 14             	add    $0x14,%eax
    ae75:	8b 04 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%eax
    ae7c:	29 c1                	sub    %eax,%ecx
    ae7e:	89 c8                	mov    %ecx,%eax
    ae80:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    ae83:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ae86:	89 d0                	mov    %edx,%eax
    ae88:	c1 e0 03             	shl    $0x3,%eax
    ae8b:	01 d0                	add    %edx,%eax
    ae8d:	c1 e0 02             	shl    $0x2,%eax
    ae90:	01 d0                	add    %edx,%eax
    ae92:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ae95:	01 d0                	add    %edx,%eax
    ae97:	83 c0 14             	add    $0x14,%eax
    ae9a:	8b 14 85 4c 0d 01 00 	mov    0x10d4c(,%eax,4),%edx
    aea1:	89 d0                	mov    %edx,%eax
    aea3:	01 c0                	add    %eax,%eax
    aea5:	01 c2                	add    %eax,%edx
    aea7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    aeaa:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    aeae:	01 d0                	add    %edx,%eax
    aeb0:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    aeb3:	eb 6e                	jmp    af23 <III_stereo+0x7d4>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    aeb5:	8b 4d 10             	mov    0x10(%ebp),%ecx
    aeb8:	8b 55 ec             	mov    -0x14(%ebp),%edx
    aebb:	89 d0                	mov    %edx,%eax
    aebd:	01 c0                	add    %eax,%eax
    aebf:	01 d0                	add    %edx,%eax
    aec1:	c1 e0 02             	shl    $0x2,%eax
    aec4:	01 d0                	add    %edx,%eax
    aec6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    aec9:	01 d0                	add    %edx,%eax
    aecb:	83 c0 52             	add    $0x52,%eax
    aece:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    aed2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aed5:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    aedc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aedf:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    aee6:	83 f8 07             	cmp    $0x7,%eax
    aee9:	74 30                	je     af1b <III_stereo+0x7cc>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    aeeb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aeee:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    aef5:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    aefb:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    af01:	dd 05 e0 f0 00 00    	fldl   0xf0e0
    af07:	de c9                	fmulp  %st,%st(1)
    af09:	dd 1c 24             	fstpl  (%esp)
    af0c:	e8 67 b1 ff ff       	call   6078 <tan>
    af11:	8b 45 f0             	mov    -0x10(%ebp),%eax
    af14:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    af1b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    af1f:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    af23:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    af27:	7f 8c                	jg     aeb5 <III_stereo+0x766>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    af29:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    af2d:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    af31:	0f 8e 06 ff ff ff    	jle    ae3d <III_stereo+0x6ee>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    af37:	8b 45 c8             	mov    -0x38(%ebp),%eax
    af3a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    af40:	05 bc 0d 01 00       	add    $0x10dbc,%eax
    af45:	8b 50 0c             	mov    0xc(%eax),%edx
    af48:	8b 45 c8             	mov    -0x38(%ebp),%eax
    af4b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    af51:	05 b8 0d 01 00       	add    $0x10db8,%eax
    af56:	8b 40 0c             	mov    0xc(%eax),%eax
    af59:	29 c2                	sub    %eax,%edx
    af5b:	89 d0                	mov    %edx,%eax
    af5d:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    af60:	8b 45 c8             	mov    -0x38(%ebp),%eax
    af63:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    af69:	05 b8 0d 01 00       	add    $0x10db8,%eax
    af6e:	8b 50 0c             	mov    0xc(%eax),%edx
    af71:	89 d0                	mov    %edx,%eax
    af73:	01 c0                	add    %eax,%eax
    af75:	01 c2                	add    %eax,%edx
    af77:	8b 45 ec             	mov    -0x14(%ebp),%eax
    af7a:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    af7e:	01 d0                	add    %edx,%eax
    af80:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    af83:	8b 45 c8             	mov    -0x38(%ebp),%eax
    af86:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    af8c:	05 c0 0d 01 00       	add    $0x10dc0,%eax
    af91:	8b 50 0c             	mov    0xc(%eax),%edx
    af94:	8b 45 c8             	mov    -0x38(%ebp),%eax
    af97:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    af9d:	05 bc 0d 01 00       	add    $0x10dbc,%eax
    afa2:	8b 40 0c             	mov    0xc(%eax),%eax
    afa5:	29 c2                	sub    %eax,%edx
    afa7:	89 d0                	mov    %edx,%eax
    afa9:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    afac:	8b 45 c8             	mov    -0x38(%ebp),%eax
    afaf:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    afb5:	05 bc 0d 01 00       	add    $0x10dbc,%eax
    afba:	8b 50 0c             	mov    0xc(%eax),%edx
    afbd:	89 d0                	mov    %edx,%eax
    afbf:	01 c0                	add    %eax,%eax
    afc1:	01 c2                	add    %eax,%edx
    afc3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    afc6:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    afca:	01 d0                	add    %edx,%eax
    afcc:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    afcf:	eb 30                	jmp    b001 <III_stereo+0x8b2>
               {  is_pos[i] = is_pos[sfb];
    afd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    afd4:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    afdb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    afde:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    afe5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    afe8:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    afef:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aff2:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    aff9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    affd:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    b001:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    b005:	7f ca                	jg     afd1 <III_stereo+0x882>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    b007:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    b00b:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    b00f:	0f 8e ee fc ff ff    	jle    ad03 <III_stereo+0x5b4>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    b015:	e9 f0 01 00 00       	jmp    b20a <III_stereo+0xabb>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    b01a:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    b021:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    b028:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    b02f:	eb 63                	jmp    b094 <III_stereo+0x945>
         {  if ( xr[1][i][ss] != 0.0 )
    b031:	8b 45 08             	mov    0x8(%ebp),%eax
    b034:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    b03a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b03d:	89 d0                	mov    %edx,%eax
    b03f:	c1 e0 03             	shl    $0x3,%eax
    b042:	01 d0                	add    %edx,%eax
    b044:	01 c0                	add    %eax,%eax
    b046:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b049:	01 d0                	add    %edx,%eax
    b04b:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b04e:	d9 ee                	fldz   
    b050:	df e9                	fucomip %st(1),%st
    b052:	7a 0a                	jp     b05e <III_stereo+0x90f>
    b054:	d9 ee                	fldz   
    b056:	df e9                	fucomip %st(1),%st
    b058:	dd d8                	fstp   %st(0)
    b05a:	74 23                	je     b07f <III_stereo+0x930>
    b05c:	eb 02                	jmp    b060 <III_stereo+0x911>
    b05e:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    b060:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b063:	89 d0                	mov    %edx,%eax
    b065:	c1 e0 03             	shl    $0x3,%eax
    b068:	01 d0                	add    %edx,%eax
    b06a:	01 c0                	add    %eax,%eax
    b06c:	89 c2                	mov    %eax,%edx
    b06e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    b071:	01 d0                	add    %edx,%eax
    b073:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    b076:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    b07d:	eb 15                	jmp    b094 <III_stereo+0x945>
            } else
            {  ss--;
    b07f:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    b083:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    b087:	79 0b                	jns    b094 <III_stereo+0x945>
               {  i--;
    b089:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    b08d:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    b094:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    b098:	79 97                	jns    b031 <III_stereo+0x8e2>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    b09a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    b0a1:	eb 04                	jmp    b0a7 <III_stereo+0x958>
            i++;
    b0a3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    b0a7:	8b 55 c8             	mov    -0x38(%ebp),%edx
    b0aa:	89 d0                	mov    %edx,%eax
    b0ac:	c1 e0 03             	shl    $0x3,%eax
    b0af:	01 d0                	add    %edx,%eax
    b0b1:	c1 e0 02             	shl    $0x2,%eax
    b0b4:	01 d0                	add    %edx,%eax
    b0b6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b0b9:	01 d0                	add    %edx,%eax
    b0bb:	8b 04 85 40 0d 01 00 	mov    0x10d40(,%eax,4),%eax
    b0c2:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    b0c5:	7e dc                	jle    b0a3 <III_stereo+0x954>
            i++;
         sfb = i;
    b0c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b0ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    b0cd:	8b 55 c8             	mov    -0x38(%ebp),%edx
    b0d0:	89 d0                	mov    %edx,%eax
    b0d2:	c1 e0 03             	shl    $0x3,%eax
    b0d5:	01 d0                	add    %edx,%eax
    b0d7:	c1 e0 02             	shl    $0x2,%eax
    b0da:	01 d0                	add    %edx,%eax
    b0dc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b0df:	01 d0                	add    %edx,%eax
    b0e1:	8b 04 85 40 0d 01 00 	mov    0x10d40(,%eax,4),%eax
    b0e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    b0eb:	e9 a9 00 00 00       	jmp    b199 <III_stereo+0xa4a>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    b0f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b0f3:	8d 48 01             	lea    0x1(%eax),%ecx
    b0f6:	8b 55 c8             	mov    -0x38(%ebp),%edx
    b0f9:	89 d0                	mov    %edx,%eax
    b0fb:	c1 e0 03             	shl    $0x3,%eax
    b0fe:	01 d0                	add    %edx,%eax
    b100:	c1 e0 02             	shl    $0x2,%eax
    b103:	01 d0                	add    %edx,%eax
    b105:	01 c8                	add    %ecx,%eax
    b107:	8b 0c 85 40 0d 01 00 	mov    0x10d40(,%eax,4),%ecx
    b10e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    b111:	89 d0                	mov    %edx,%eax
    b113:	c1 e0 03             	shl    $0x3,%eax
    b116:	01 d0                	add    %edx,%eax
    b118:	c1 e0 02             	shl    $0x2,%eax
    b11b:	01 d0                	add    %edx,%eax
    b11d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b120:	01 d0                	add    %edx,%eax
    b122:	8b 04 85 40 0d 01 00 	mov    0x10d40(,%eax,4),%eax
    b129:	29 c1                	sub    %eax,%ecx
    b12b:	89 c8                	mov    %ecx,%eax
    b12d:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    b130:	eb 5d                	jmp    b18f <III_stereo+0xa40>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    b132:	8b 45 10             	mov    0x10(%ebp),%eax
    b135:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b138:	83 c2 3e             	add    $0x3e,%edx
    b13b:	8b 14 90             	mov    (%eax,%edx,4),%edx
    b13e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b141:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    b148:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b14b:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    b152:	83 f8 07             	cmp    $0x7,%eax
    b155:	74 30                	je     b187 <III_stereo+0xa38>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    b157:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b15a:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    b161:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    b167:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    b16d:	dd 05 e0 f0 00 00    	fldl   0xf0e0
    b173:	de c9                	fmulp  %st,%st(1)
    b175:	dd 1c 24             	fstpl  (%esp)
    b178:	e8 fb ae ff ff       	call   6078 <tan>
    b17d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b180:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    b187:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    b18b:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    b18f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    b193:	7f 9d                	jg     b132 <III_stereo+0x9e3>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    b195:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b199:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    b19d:	0f 8e 4d ff ff ff    	jle    b0f0 <III_stereo+0x9a1>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    b1a3:	8b 45 c8             	mov    -0x38(%ebp),%eax
    b1a6:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    b1ac:	05 90 0d 01 00       	add    $0x10d90,%eax
    b1b1:	8b 00                	mov    (%eax),%eax
    b1b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    b1b6:	8b 45 c8             	mov    -0x38(%ebp),%eax
    b1b9:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    b1bf:	05 94 0d 01 00       	add    $0x10d94,%eax
    b1c4:	8b 00                	mov    (%eax),%eax
    b1c6:	ba 40 02 00 00       	mov    $0x240,%edx
    b1cb:	29 c2                	sub    %eax,%edx
    b1cd:	89 d0                	mov    %edx,%eax
    b1cf:	89 45 e8             	mov    %eax,-0x18(%ebp)
    b1d2:	eb 30                	jmp    b204 <III_stereo+0xab5>
         {  is_pos[i] = is_pos[sfb];
    b1d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b1d7:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    b1de:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b1e1:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    b1e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b1eb:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    b1f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b1f5:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    b1fc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    b200:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    b204:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    b208:	7f ca                	jg     b1d4 <III_stereo+0xa85>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    b20a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    b211:	eb 55                	jmp    b268 <III_stereo+0xb19>
      for(sb=0;sb<SBLIMIT;sb++)
    b213:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    b21a:	eb 42                	jmp    b25e <III_stereo+0xb0f>
         for(ss=0;ss<SSLIMIT;ss++)
    b21c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    b223:	eb 2f                	jmp    b254 <III_stereo+0xb05>
            lr[ch][sb][ss] = 0;
    b225:	8b 55 e0             	mov    -0x20(%ebp),%edx
    b228:	89 d0                	mov    %edx,%eax
    b22a:	c1 e0 03             	shl    $0x3,%eax
    b22d:	01 d0                	add    %edx,%eax
    b22f:	c1 e0 09             	shl    $0x9,%eax
    b232:	89 c2                	mov    %eax,%edx
    b234:	8b 45 0c             	mov    0xc(%ebp),%eax
    b237:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    b23a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b23d:	89 d0                	mov    %edx,%eax
    b23f:	c1 e0 03             	shl    $0x3,%eax
    b242:	01 d0                	add    %edx,%eax
    b244:	01 c0                	add    %eax,%eax
    b246:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b249:	01 d0                	add    %edx,%eax
    b24b:	d9 ee                	fldz   
    b24d:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    b250:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b254:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    b258:	7e cb                	jle    b225 <III_stereo+0xad6>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    b25a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    b25e:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    b262:	7e b8                	jle    b21c <III_stereo+0xacd>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    b264:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    b268:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    b26c:	7e a5                	jle    b213 <III_stereo+0xac4>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    b26e:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    b272:	0f 85 3d 02 00 00    	jne    b4b5 <III_stereo+0xd66>
      for(sb=0;sb<SBLIMIT;sb++)
    b278:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    b27f:	e9 25 02 00 00       	jmp    b4a9 <III_stereo+0xd5a>
         for(ss=0;ss<SSLIMIT;ss++) {
    b284:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    b28b:	e9 0b 02 00 00       	jmp    b49b <III_stereo+0xd4c>
            i = (sb*18)+ss;
    b290:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b293:	89 d0                	mov    %edx,%eax
    b295:	c1 e0 03             	shl    $0x3,%eax
    b298:	01 d0                	add    %edx,%eax
    b29a:	01 c0                	add    %eax,%eax
    b29c:	89 c2                	mov    %eax,%edx
    b29e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    b2a1:	01 d0                	add    %edx,%eax
    b2a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    b2a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b2a9:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    b2b0:	83 f8 07             	cmp    $0x7,%eax
    b2b3:	0f 85 2c 01 00 00    	jne    b3e5 <III_stereo+0xc96>
               if ( ms_stereo ) {
    b2b9:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    b2bd:	0f 84 b5 00 00 00    	je     b378 <III_stereo+0xc29>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    b2c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b2c6:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b2c9:	89 d0                	mov    %edx,%eax
    b2cb:	c1 e0 03             	shl    $0x3,%eax
    b2ce:	01 d0                	add    %edx,%eax
    b2d0:	01 c0                	add    %eax,%eax
    b2d2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b2d5:	01 d0                	add    %edx,%eax
    b2d7:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b2da:	8b 45 08             	mov    0x8(%ebp),%eax
    b2dd:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    b2e3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b2e6:	89 d0                	mov    %edx,%eax
    b2e8:	c1 e0 03             	shl    $0x3,%eax
    b2eb:	01 d0                	add    %edx,%eax
    b2ed:	01 c0                	add    %eax,%eax
    b2ef:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b2f2:	01 d0                	add    %edx,%eax
    b2f4:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b2f7:	de c1                	faddp  %st,%st(1)
    b2f9:	dd 05 e8 f0 00 00    	fldl   0xf0e8
    b2ff:	de f9                	fdivrp %st,%st(1)
    b301:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    b304:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b307:	89 d0                	mov    %edx,%eax
    b309:	c1 e0 03             	shl    $0x3,%eax
    b30c:	01 d0                	add    %edx,%eax
    b30e:	01 c0                	add    %eax,%eax
    b310:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b313:	01 d0                	add    %edx,%eax
    b315:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    b318:	8b 45 0c             	mov    0xc(%ebp),%eax
    b31b:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    b321:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b324:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b327:	89 d0                	mov    %edx,%eax
    b329:	c1 e0 03             	shl    $0x3,%eax
    b32c:	01 d0                	add    %edx,%eax
    b32e:	01 c0                	add    %eax,%eax
    b330:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b333:	01 d0                	add    %edx,%eax
    b335:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b338:	8b 45 08             	mov    0x8(%ebp),%eax
    b33b:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    b341:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b344:	89 d0                	mov    %edx,%eax
    b346:	c1 e0 03             	shl    $0x3,%eax
    b349:	01 d0                	add    %edx,%eax
    b34b:	01 c0                	add    %eax,%eax
    b34d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b350:	01 d0                	add    %edx,%eax
    b352:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b355:	de e9                	fsubrp %st,%st(1)
    b357:	dd 05 e8 f0 00 00    	fldl   0xf0e8
    b35d:	de f9                	fdivrp %st,%st(1)
    b35f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b362:	89 d0                	mov    %edx,%eax
    b364:	c1 e0 03             	shl    $0x3,%eax
    b367:	01 d0                	add    %edx,%eax
    b369:	01 c0                	add    %eax,%eax
    b36b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b36e:	01 d0                	add    %edx,%eax
    b370:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    b373:	e9 1f 01 00 00       	jmp    b497 <III_stereo+0xd48>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    b378:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b37b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b37e:	89 d0                	mov    %edx,%eax
    b380:	c1 e0 03             	shl    $0x3,%eax
    b383:	01 d0                	add    %edx,%eax
    b385:	01 c0                	add    %eax,%eax
    b387:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b38a:	01 d0                	add    %edx,%eax
    b38c:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b38f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    b392:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b395:	89 d0                	mov    %edx,%eax
    b397:	c1 e0 03             	shl    $0x3,%eax
    b39a:	01 d0                	add    %edx,%eax
    b39c:	01 c0                	add    %eax,%eax
    b39e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b3a1:	01 d0                	add    %edx,%eax
    b3a3:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    b3a6:	8b 45 0c             	mov    0xc(%ebp),%eax
    b3a9:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    b3af:	8b 45 08             	mov    0x8(%ebp),%eax
    b3b2:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    b3b8:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b3bb:	89 d0                	mov    %edx,%eax
    b3bd:	c1 e0 03             	shl    $0x3,%eax
    b3c0:	01 d0                	add    %edx,%eax
    b3c2:	01 c0                	add    %eax,%eax
    b3c4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b3c7:	01 d0                	add    %edx,%eax
    b3c9:	dd 04 c3             	fldl   (%ebx,%eax,8)
    b3cc:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b3cf:	89 d0                	mov    %edx,%eax
    b3d1:	c1 e0 03             	shl    $0x3,%eax
    b3d4:	01 d0                	add    %edx,%eax
    b3d6:	01 c0                	add    %eax,%eax
    b3d8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b3db:	01 d0                	add    %edx,%eax
    b3dd:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    b3e0:	e9 b2 00 00 00       	jmp    b497 <III_stereo+0xd48>
               }
            }
            else if (i_stereo ) {
    b3e5:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    b3e9:	0f 84 94 00 00 00    	je     b483 <III_stereo+0xd34>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    b3ef:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b3f2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b3f5:	89 d0                	mov    %edx,%eax
    b3f7:	c1 e0 03             	shl    $0x3,%eax
    b3fa:	01 d0                	add    %edx,%eax
    b3fc:	01 c0                	add    %eax,%eax
    b3fe:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b401:	01 d0                	add    %edx,%eax
    b403:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b406:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b409:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    b410:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b413:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    b41a:	d9 e8                	fld1   
    b41c:	de c1                	faddp  %st,%st(1)
    b41e:	de f9                	fdivrp %st,%st(1)
    b420:	de c9                	fmulp  %st,%st(1)
    b422:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    b425:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b428:	89 d0                	mov    %edx,%eax
    b42a:	c1 e0 03             	shl    $0x3,%eax
    b42d:	01 d0                	add    %edx,%eax
    b42f:	01 c0                	add    %eax,%eax
    b431:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b434:	01 d0                	add    %edx,%eax
    b436:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    b439:	8b 45 0c             	mov    0xc(%ebp),%eax
    b43c:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    b442:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b445:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b448:	89 d0                	mov    %edx,%eax
    b44a:	c1 e0 03             	shl    $0x3,%eax
    b44d:	01 d0                	add    %edx,%eax
    b44f:	01 c0                	add    %eax,%eax
    b451:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b454:	01 d0                	add    %edx,%eax
    b456:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b459:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b45c:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    b463:	d9 e8                	fld1   
    b465:	de c1                	faddp  %st,%st(1)
    b467:	d9 e8                	fld1   
    b469:	de f1                	fdivp  %st,%st(1)
    b46b:	de c9                	fmulp  %st,%st(1)
    b46d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b470:	89 d0                	mov    %edx,%eax
    b472:	c1 e0 03             	shl    $0x3,%eax
    b475:	01 d0                	add    %edx,%eax
    b477:	01 c0                	add    %eax,%eax
    b479:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b47c:	01 d0                	add    %edx,%eax
    b47e:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    b481:	eb 14                	jmp    b497 <III_stereo+0xd48>
            }
            else {
               printf(0,"Error in streo processing\n");
    b483:	c7 44 24 04 80 e0 00 	movl   $0xe080,0x4(%esp)
    b48a:	00 
    b48b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    b492:	e8 3c a7 ff ff       	call   5bd3 <printf>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    b497:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b49b:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    b49f:	0f 8e eb fd ff ff    	jle    b290 <III_stereo+0xb41>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    b4a5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    b4a9:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    b4ad:	0f 8e d1 fd ff ff    	jle    b284 <III_stereo+0xb35>
    b4b3:	eb 54                	jmp    b509 <III_stereo+0xdba>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    b4b5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    b4bc:	eb 45                	jmp    b503 <III_stereo+0xdb4>
         for(ss=0;ss<SSLIMIT;ss++)
    b4be:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    b4c5:	eb 32                	jmp    b4f9 <III_stereo+0xdaa>
            lr[0][sb][ss] = xr[0][sb][ss];
    b4c7:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b4ca:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b4cd:	89 d0                	mov    %edx,%eax
    b4cf:	c1 e0 03             	shl    $0x3,%eax
    b4d2:	01 d0                	add    %edx,%eax
    b4d4:	01 c0                	add    %eax,%eax
    b4d6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b4d9:	01 d0                	add    %edx,%eax
    b4db:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b4de:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    b4e1:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b4e4:	89 d0                	mov    %edx,%eax
    b4e6:	c1 e0 03             	shl    $0x3,%eax
    b4e9:	01 d0                	add    %edx,%eax
    b4eb:	01 c0                	add    %eax,%eax
    b4ed:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b4f0:	01 d0                	add    %edx,%eax
    b4f2:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    b4f5:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b4f9:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    b4fd:	7e c8                	jle    b4c7 <III_stereo+0xd78>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    b4ff:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    b503:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    b507:	7e b5                	jle    b4be <III_stereo+0xd6f>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    b509:	81 c4 50 1b 00 00    	add    $0x1b50,%esp
    b50f:	5b                   	pop    %ebx
    b510:	5e                   	pop    %esi
    b511:	5d                   	pop    %ebp
    b512:	c3                   	ret    

0000b513 <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    b513:	55                   	push   %ebp
    b514:	89 e5                	mov    %esp,%ebp
    b516:	83 ec 48             	sub    $0x48,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    b519:	a1 a0 0f 01 00       	mov    0x10fa0,%eax
    b51e:	85 c0                	test   %eax,%eax
    b520:	74 68                	je     b58a <III_antialias+0x77>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    b522:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    b529:	eb 4f                	jmp    b57a <III_antialias+0x67>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    b52b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b52e:	dd 04 c5 60 0f 01 00 	fldl   0x10f60(,%eax,8)
    b535:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b538:	dd 04 c5 60 0f 01 00 	fldl   0x10f60(,%eax,8)
    b53f:	de c9                	fmulp  %st,%st(1)
    b541:	d9 e8                	fld1   
    b543:	de c1                	faddp  %st,%st(1)
    b545:	dd 1c 24             	fstpl  (%esp)
    b548:	e8 de ac ff ff       	call   622b <sqrt>
    b54d:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    b550:	d9 e8                	fld1   
    b552:	dc 75 e0             	fdivl  -0x20(%ebp)
    b555:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b558:	dd 1c c5 20 10 01 00 	fstpl  0x11020(,%eax,8)
         ca[i] = Ci[i]/sq;
    b55f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b562:	dd 04 c5 60 0f 01 00 	fldl   0x10f60(,%eax,8)
    b569:	dc 75 e0             	fdivl  -0x20(%ebp)
    b56c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b56f:	dd 1c c5 60 10 01 00 	fstpl  0x11060(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    b576:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    b57a:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    b57e:	7e ab                	jle    b52b <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    b580:	c7 05 a0 0f 01 00 00 	movl   $0x0,0x10fa0
    b587:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    b58a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    b591:	eb 4c                	jmp    b5df <III_antialias+0xcc>
       for(ss=0;ss<SSLIMIT;ss++)
    b593:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b59a:	eb 39                	jmp    b5d5 <III_antialias+0xc2>
          hybridIn[sb][ss] = xr[sb][ss];
    b59c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b59f:	89 d0                	mov    %edx,%eax
    b5a1:	c1 e0 03             	shl    $0x3,%eax
    b5a4:	01 d0                	add    %edx,%eax
    b5a6:	c1 e0 04             	shl    $0x4,%eax
    b5a9:	89 c2                	mov    %eax,%edx
    b5ab:	8b 45 0c             	mov    0xc(%ebp),%eax
    b5ae:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    b5b1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b5b4:	89 d0                	mov    %edx,%eax
    b5b6:	c1 e0 03             	shl    $0x3,%eax
    b5b9:	01 d0                	add    %edx,%eax
    b5bb:	c1 e0 04             	shl    $0x4,%eax
    b5be:	89 c2                	mov    %eax,%edx
    b5c0:	8b 45 08             	mov    0x8(%ebp),%eax
    b5c3:	01 c2                	add    %eax,%edx
    b5c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b5c8:	dd 04 c2             	fldl   (%edx,%eax,8)
    b5cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b5ce:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    b5d1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b5d5:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    b5d9:	7e c1                	jle    b59c <III_antialias+0x89>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    b5db:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    b5df:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    b5e3:	7e ae                	jle    b593 <III_antialias+0x80>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    b5e5:	8b 45 10             	mov    0x10(%ebp),%eax
    b5e8:	8b 40 10             	mov    0x10(%eax),%eax
    b5eb:	85 c0                	test   %eax,%eax
    b5ed:	74 1a                	je     b609 <III_antialias+0xf6>
    b5ef:	8b 45 10             	mov    0x10(%ebp),%eax
    b5f2:	8b 40 14             	mov    0x14(%eax),%eax
    b5f5:	83 f8 02             	cmp    $0x2,%eax
    b5f8:	75 0f                	jne    b609 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    b5fa:	8b 45 10             	mov    0x10(%ebp),%eax
    b5fd:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    b600:	85 c0                	test   %eax,%eax
    b602:	75 05                	jne    b609 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    b604:	e9 1c 01 00 00       	jmp    b725 <III_antialias+0x212>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    b609:	8b 45 10             	mov    0x10(%ebp),%eax
    b60c:	8b 40 10             	mov    0x10(%eax),%eax
    b60f:	85 c0                	test   %eax,%eax
    b611:	74 1e                	je     b631 <III_antialias+0x11e>
    b613:	8b 45 10             	mov    0x10(%ebp),%eax
    b616:	8b 40 18             	mov    0x18(%eax),%eax
    b619:	85 c0                	test   %eax,%eax
    b61b:	74 14                	je     b631 <III_antialias+0x11e>
     (gr_info->block_type == 2))
    b61d:	8b 45 10             	mov    0x10(%ebp),%eax
    b620:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    b623:	83 f8 02             	cmp    $0x2,%eax
    b626:	75 09                	jne    b631 <III_antialias+0x11e>
     (gr_info->block_type == 2))
      sblim = 1;
    b628:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    b62f:	eb 07                	jmp    b638 <III_antialias+0x125>
   else
      sblim = SBLIMIT-1;
    b631:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    b638:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    b63f:	e9 d5 00 00 00       	jmp    b719 <III_antialias+0x206>
      for(ss=0;ss<8;ss++) {
    b644:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b64b:	e9 bb 00 00 00       	jmp    b70b <III_antialias+0x1f8>
         bu = xr[sb][17-ss];
    b650:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b653:	89 d0                	mov    %edx,%eax
    b655:	c1 e0 03             	shl    $0x3,%eax
    b658:	01 d0                	add    %edx,%eax
    b65a:	c1 e0 04             	shl    $0x4,%eax
    b65d:	89 c2                	mov    %eax,%edx
    b65f:	8b 45 08             	mov    0x8(%ebp),%eax
    b662:	01 c2                	add    %eax,%edx
    b664:	b8 11 00 00 00       	mov    $0x11,%eax
    b669:	2b 45 f4             	sub    -0xc(%ebp),%eax
    b66c:	dd 04 c2             	fldl   (%edx,%eax,8)
    b66f:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    b672:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b675:	8d 50 01             	lea    0x1(%eax),%edx
    b678:	89 d0                	mov    %edx,%eax
    b67a:	c1 e0 03             	shl    $0x3,%eax
    b67d:	01 d0                	add    %edx,%eax
    b67f:	c1 e0 04             	shl    $0x4,%eax
    b682:	89 c2                	mov    %eax,%edx
    b684:	8b 45 08             	mov    0x8(%ebp),%eax
    b687:	01 c2                	add    %eax,%edx
    b689:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b68c:	dd 04 c2             	fldl   (%edx,%eax,8)
    b68f:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    b692:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b695:	89 d0                	mov    %edx,%eax
    b697:	c1 e0 03             	shl    $0x3,%eax
    b69a:	01 d0                	add    %edx,%eax
    b69c:	c1 e0 04             	shl    $0x4,%eax
    b69f:	89 c2                	mov    %eax,%edx
    b6a1:	8b 45 0c             	mov    0xc(%ebp),%eax
    b6a4:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    b6a7:	b8 11 00 00 00       	mov    $0x11,%eax
    b6ac:	2b 45 f4             	sub    -0xc(%ebp),%eax
    b6af:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b6b2:	dd 04 d5 20 10 01 00 	fldl   0x11020(,%edx,8)
    b6b9:	dc 4d d8             	fmull  -0x28(%ebp)
    b6bc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b6bf:	dd 04 d5 60 10 01 00 	fldl   0x11060(,%edx,8)
    b6c6:	dc 4d d0             	fmull  -0x30(%ebp)
    b6c9:	de e9                	fsubrp %st,%st(1)
    b6cb:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    b6ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b6d1:	8d 50 01             	lea    0x1(%eax),%edx
    b6d4:	89 d0                	mov    %edx,%eax
    b6d6:	c1 e0 03             	shl    $0x3,%eax
    b6d9:	01 d0                	add    %edx,%eax
    b6db:	c1 e0 04             	shl    $0x4,%eax
    b6de:	89 c2                	mov    %eax,%edx
    b6e0:	8b 45 0c             	mov    0xc(%ebp),%eax
    b6e3:	01 c2                	add    %eax,%edx
    b6e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b6e8:	dd 04 c5 20 10 01 00 	fldl   0x11020(,%eax,8)
    b6ef:	dc 4d d0             	fmull  -0x30(%ebp)
    b6f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b6f5:	dd 04 c5 60 10 01 00 	fldl   0x11060(,%eax,8)
    b6fc:	dc 4d d8             	fmull  -0x28(%ebp)
    b6ff:	de c1                	faddp  %st,%st(1)
    b701:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b704:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    b707:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b70b:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    b70f:	0f 8e 3b ff ff ff    	jle    b650 <III_antialias+0x13d>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    b715:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    b719:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b71c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    b71f:	0f 8c 1f ff ff ff    	jl     b644 <III_antialias+0x131>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    b725:	c9                   	leave  
    b726:	c3                   	ret    

0000b727 <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    b727:	55                   	push   %ebp
    b728:	89 e5                	mov    %esp,%ebp
    b72a:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    b730:	a1 a0 10 01 00       	mov    0x110a0,%eax
    b735:	85 c0                	test   %eax,%eax
    b737:	0f 85 59 02 00 00    	jne    b996 <inv_mdct+0x26f>

    /* type 0 */
      for(i=0;i<36;i++)
    b73d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b744:	eb 29                	jmp    b76f <inv_mdct+0x48>
         win[0][i] = sin( PI/36 *(i+0.5) );
    b746:	db 45 f4             	fildl  -0xc(%ebp)
    b749:	dd 05 f0 f0 00 00    	fldl   0xf0f0
    b74f:	de c1                	faddp  %st,%st(1)
    b751:	dd 05 f8 f0 00 00    	fldl   0xf0f8
    b757:	de c9                	fmulp  %st,%st(1)
    b759:	dd 1c 24             	fstpl  (%esp)
    b75c:	e8 53 a8 ff ff       	call   5fb4 <sin>
    b761:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b764:	dd 1c c5 c0 10 01 00 	fstpl  0x110c0(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    b76b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b76f:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    b773:	7e d1                	jle    b746 <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    b775:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b77c:	eb 2c                	jmp    b7aa <inv_mdct+0x83>
         win[1][i] = sin( PI/36 *(i+0.5) );
    b77e:	db 45 f4             	fildl  -0xc(%ebp)
    b781:	dd 05 f0 f0 00 00    	fldl   0xf0f0
    b787:	de c1                	faddp  %st,%st(1)
    b789:	dd 05 f8 f0 00 00    	fldl   0xf0f8
    b78f:	de c9                	fmulp  %st,%st(1)
    b791:	dd 1c 24             	fstpl  (%esp)
    b794:	e8 1b a8 ff ff       	call   5fb4 <sin>
    b799:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b79c:	83 c0 24             	add    $0x24,%eax
    b79f:	dd 1c c5 c0 10 01 00 	fstpl  0x110c0(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    b7a6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b7aa:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    b7ae:	7e ce                	jle    b77e <inv_mdct+0x57>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    b7b0:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    b7b7:	eb 13                	jmp    b7cc <inv_mdct+0xa5>
         win[1][i] = 1.0;
    b7b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b7bc:	83 c0 24             	add    $0x24,%eax
    b7bf:	d9 e8                	fld1   
    b7c1:	dd 1c c5 c0 10 01 00 	fstpl  0x110c0(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    b7c8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b7cc:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    b7d0:	7e e7                	jle    b7b9 <inv_mdct+0x92>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    b7d2:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    b7d9:	eb 34                	jmp    b80f <inv_mdct+0xe8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    b7db:	db 45 f4             	fildl  -0xc(%ebp)
    b7de:	dd 05 f0 f0 00 00    	fldl   0xf0f0
    b7e4:	de c1                	faddp  %st,%st(1)
    b7e6:	dd 05 00 f1 00 00    	fldl   0xf100
    b7ec:	de e9                	fsubrp %st,%st(1)
    b7ee:	dd 05 e0 f0 00 00    	fldl   0xf0e0
    b7f4:	de c9                	fmulp  %st,%st(1)
    b7f6:	dd 1c 24             	fstpl  (%esp)
    b7f9:	e8 b6 a7 ff ff       	call   5fb4 <sin>
    b7fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b801:	83 c0 24             	add    $0x24,%eax
    b804:	dd 1c c5 c0 10 01 00 	fstpl  0x110c0(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    b80b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b80f:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    b813:	7e c6                	jle    b7db <inv_mdct+0xb4>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    b815:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    b81c:	eb 13                	jmp    b831 <inv_mdct+0x10a>
         win[1][i] = 0.0;
    b81e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b821:	83 c0 24             	add    $0x24,%eax
    b824:	d9 ee                	fldz   
    b826:	dd 1c c5 c0 10 01 00 	fstpl  0x110c0(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    b82d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b831:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    b835:	7e e7                	jle    b81e <inv_mdct+0xf7>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    b837:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b83e:	eb 13                	jmp    b853 <inv_mdct+0x12c>
         win[3][i] = 0.0;
    b840:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b843:	83 c0 6c             	add    $0x6c,%eax
    b846:	d9 ee                	fldz   
    b848:	dd 1c c5 c0 10 01 00 	fstpl  0x110c0(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    b84f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b853:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    b857:	7e e7                	jle    b840 <inv_mdct+0x119>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    b859:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    b860:	eb 34                	jmp    b896 <inv_mdct+0x16f>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    b862:	db 45 f4             	fildl  -0xc(%ebp)
    b865:	dd 05 f0 f0 00 00    	fldl   0xf0f0
    b86b:	de c1                	faddp  %st,%st(1)
    b86d:	dd 05 08 f1 00 00    	fldl   0xf108
    b873:	de e9                	fsubrp %st,%st(1)
    b875:	dd 05 e0 f0 00 00    	fldl   0xf0e0
    b87b:	de c9                	fmulp  %st,%st(1)
    b87d:	dd 1c 24             	fstpl  (%esp)
    b880:	e8 2f a7 ff ff       	call   5fb4 <sin>
    b885:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b888:	83 c0 6c             	add    $0x6c,%eax
    b88b:	dd 1c c5 c0 10 01 00 	fstpl  0x110c0(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    b892:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b896:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    b89a:	7e c6                	jle    b862 <inv_mdct+0x13b>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    b89c:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    b8a3:	eb 13                	jmp    b8b8 <inv_mdct+0x191>
         win[3][i] =1.0;
    b8a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b8a8:	83 c0 6c             	add    $0x6c,%eax
    b8ab:	d9 e8                	fld1   
    b8ad:	dd 1c c5 c0 10 01 00 	fstpl  0x110c0(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    b8b4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b8b8:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    b8bc:	7e e7                	jle    b8a5 <inv_mdct+0x17e>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    b8be:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    b8c5:	eb 2c                	jmp    b8f3 <inv_mdct+0x1cc>
         win[3][i] = sin( PI/36*(i+0.5) );
    b8c7:	db 45 f4             	fildl  -0xc(%ebp)
    b8ca:	dd 05 f0 f0 00 00    	fldl   0xf0f0
    b8d0:	de c1                	faddp  %st,%st(1)
    b8d2:	dd 05 f8 f0 00 00    	fldl   0xf0f8
    b8d8:	de c9                	fmulp  %st,%st(1)
    b8da:	dd 1c 24             	fstpl  (%esp)
    b8dd:	e8 d2 a6 ff ff       	call   5fb4 <sin>
    b8e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b8e5:	83 c0 6c             	add    $0x6c,%eax
    b8e8:	dd 1c c5 c0 10 01 00 	fstpl  0x110c0(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    b8ef:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b8f3:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    b8f7:	7e ce                	jle    b8c7 <inv_mdct+0x1a0>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    b8f9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b900:	eb 2c                	jmp    b92e <inv_mdct+0x207>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    b902:	db 45 f4             	fildl  -0xc(%ebp)
    b905:	dd 05 f0 f0 00 00    	fldl   0xf0f0
    b90b:	de c1                	faddp  %st,%st(1)
    b90d:	dd 05 e0 f0 00 00    	fldl   0xf0e0
    b913:	de c9                	fmulp  %st,%st(1)
    b915:	dd 1c 24             	fstpl  (%esp)
    b918:	e8 97 a6 ff ff       	call   5fb4 <sin>
    b91d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b920:	83 c0 48             	add    $0x48,%eax
    b923:	dd 1c c5 c0 10 01 00 	fstpl  0x110c0(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    b92a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b92e:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    b932:	7e ce                	jle    b902 <inv_mdct+0x1db>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    b934:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    b93b:	eb 13                	jmp    b950 <inv_mdct+0x229>
         win[2][i] = 0.0 ;
    b93d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b940:	83 c0 48             	add    $0x48,%eax
    b943:	d9 ee                	fldz   
    b945:	dd 1c c5 c0 10 01 00 	fstpl  0x110c0(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    b94c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b950:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    b954:	7e e7                	jle    b93d <inv_mdct+0x216>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    b956:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b95d:	eb 21                	jmp    b980 <inv_mdct+0x259>
         COS[i] = cos(PI/(2*36) * i);
    b95f:	db 45 f4             	fildl  -0xc(%ebp)
    b962:	dd 05 10 f1 00 00    	fldl   0xf110
    b968:	de c9                	fmulp  %st,%st(1)
    b96a:	dd 1c 24             	fstpl  (%esp)
    b96d:	e8 e1 a6 ff ff       	call   6053 <cos>
    b972:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b975:	dd 1c c5 40 15 01 00 	fstpl  0x11540(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    b97c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b980:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    b987:	7e d6                	jle    b95f <inv_mdct+0x238>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    b989:	a1 a0 10 01 00       	mov    0x110a0,%eax
    b98e:	83 c0 01             	add    $0x1,%eax
    b991:	a3 a0 10 01 00       	mov    %eax,0x110a0
    }

    for(i=0;i<36;i++)
    b996:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b99d:	eb 17                	jmp    b9b6 <inv_mdct+0x28f>
       out[i]=0;
    b99f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b9a2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    b9a9:	8b 45 0c             	mov    0xc(%ebp),%eax
    b9ac:	01 d0                	add    %edx,%eax
    b9ae:	d9 ee                	fldz   
    b9b0:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    b9b2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b9b6:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    b9ba:	7e e3                	jle    b99f <inv_mdct+0x278>
       out[i]=0;

    if(block_type == 2){
    b9bc:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    b9c0:	0f 85 85 01 00 00    	jne    bb4b <inv_mdct+0x424>
       N=12;
    b9c6:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    b9cd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b9d4:	e9 63 01 00 00       	jmp    bb3c <inv_mdct+0x415>
          for(p= 0;p<N;p++){
    b9d9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    b9e0:	e9 df 00 00 00       	jmp    bac4 <inv_mdct+0x39d>
             sum = 0.0;
    b9e5:	d9 ee                	fldz   
    b9e7:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    b9ea:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    b9f1:	e9 8f 00 00 00       	jmp    ba85 <inv_mdct+0x35e>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    b9f6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b9f9:	89 d0                	mov    %edx,%eax
    b9fb:	01 c0                	add    %eax,%eax
    b9fd:	01 c2                	add    %eax,%edx
    b9ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ba02:	01 d0                	add    %edx,%eax
    ba04:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    ba0b:	8b 45 08             	mov    0x8(%ebp),%eax
    ba0e:	01 d0                	add    %edx,%eax
    ba10:	dd 00                	fldl   (%eax)
    ba12:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
    ba18:	8b 45 dc             	mov    -0x24(%ebp),%eax
    ba1b:	01 c0                	add    %eax,%eax
    ba1d:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    ba23:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    ba29:	dd 05 18 f1 00 00    	fldl   0xf118
    ba2f:	de f1                	fdivp  %st,%st(1)
    ba31:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ba34:	01 c0                	add    %eax,%eax
    ba36:	8d 50 01             	lea    0x1(%eax),%edx
    ba39:	8b 45 dc             	mov    -0x24(%ebp),%eax
    ba3c:	89 c1                	mov    %eax,%ecx
    ba3e:	c1 e9 1f             	shr    $0x1f,%ecx
    ba41:	01 c8                	add    %ecx,%eax
    ba43:	d1 f8                	sar    %eax
    ba45:	01 d0                	add    %edx,%eax
    ba47:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    ba4d:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    ba53:	de c9                	fmulp  %st,%st(1)
    ba55:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ba58:	01 c0                	add    %eax,%eax
    ba5a:	83 c0 01             	add    $0x1,%eax
    ba5d:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    ba63:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    ba69:	de c9                	fmulp  %st,%st(1)
    ba6b:	dd 1c 24             	fstpl  (%esp)
    ba6e:	e8 e0 a5 ff ff       	call   6053 <cos>
    ba73:	dc 8d 68 ff ff ff    	fmull  -0x98(%ebp)
    ba79:	dd 45 e0             	fldl   -0x20(%ebp)
    ba7c:	de c1                	faddp  %st,%st(1)
    ba7e:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    ba81:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    ba85:	8b 45 dc             	mov    -0x24(%ebp),%eax
    ba88:	89 c2                	mov    %eax,%edx
    ba8a:	c1 ea 1f             	shr    $0x1f,%edx
    ba8d:	01 d0                	add    %edx,%eax
    ba8f:	d1 f8                	sar    %eax
    ba91:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    ba94:	0f 8f 5c ff ff ff    	jg     b9f6 <inv_mdct+0x2cf>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    ba9a:	8b 55 10             	mov    0x10(%ebp),%edx
    ba9d:	89 d0                	mov    %edx,%eax
    ba9f:	c1 e0 03             	shl    $0x3,%eax
    baa2:	01 d0                	add    %edx,%eax
    baa4:	c1 e0 02             	shl    $0x2,%eax
    baa7:	8b 55 ec             	mov    -0x14(%ebp),%edx
    baaa:	01 d0                	add    %edx,%eax
    baac:	dd 04 c5 c0 10 01 00 	fldl   0x110c0(,%eax,8)
    bab3:	dc 4d e0             	fmull  -0x20(%ebp)
    bab6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bab9:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    bac0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    bac4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bac7:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    baca:	0f 8c 15 ff ff ff    	jl     b9e5 <inv_mdct+0x2be>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    bad0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    bad7:	eb 57                	jmp    bb30 <inv_mdct+0x409>
             out[6*i+p+6] += tmp[p];
    bad9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    badc:	89 d0                	mov    %edx,%eax
    bade:	01 c0                	add    %eax,%eax
    bae0:	01 d0                	add    %edx,%eax
    bae2:	01 c0                	add    %eax,%eax
    bae4:	89 c2                	mov    %eax,%edx
    bae6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bae9:	01 d0                	add    %edx,%eax
    baeb:	83 c0 06             	add    $0x6,%eax
    baee:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    baf5:	8b 45 0c             	mov    0xc(%ebp),%eax
    baf8:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    bafb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    bafe:	89 d0                	mov    %edx,%eax
    bb00:	01 c0                	add    %eax,%eax
    bb02:	01 d0                	add    %edx,%eax
    bb04:	01 c0                	add    %eax,%eax
    bb06:	89 c2                	mov    %eax,%edx
    bb08:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bb0b:	01 d0                	add    %edx,%eax
    bb0d:	83 c0 06             	add    $0x6,%eax
    bb10:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    bb17:	8b 45 0c             	mov    0xc(%ebp),%eax
    bb1a:	01 d0                	add    %edx,%eax
    bb1c:	dd 00                	fldl   (%eax)
    bb1e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bb21:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    bb28:	de c1                	faddp  %st,%st(1)
    bb2a:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    bb2c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    bb30:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bb33:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    bb36:	7c a1                	jl     bad9 <inv_mdct+0x3b2>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    bb38:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    bb3c:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    bb40:	0f 8e 93 fe ff ff    	jle    b9d9 <inv_mdct+0x2b2>
    bb46:	e9 da 00 00 00       	jmp    bc25 <inv_mdct+0x4fe>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    bb4b:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    bb52:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    bb59:	e9 bb 00 00 00       	jmp    bc19 <inv_mdct+0x4f2>
         sum = 0.0;
    bb5e:	d9 ee                	fldz   
    bb60:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    bb63:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    bb6a:	eb 6a                	jmp    bbd6 <inv_mdct+0x4af>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    bb6c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    bb6f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    bb76:	8b 45 08             	mov    0x8(%ebp),%eax
    bb79:	01 d0                	add    %edx,%eax
    bb7b:	dd 00                	fldl   (%eax)
    bb7d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bb80:	01 c0                	add    %eax,%eax
    bb82:	8d 50 01             	lea    0x1(%eax),%edx
    bb85:	8b 45 dc             	mov    -0x24(%ebp),%eax
    bb88:	89 c1                	mov    %eax,%ecx
    bb8a:	c1 e9 1f             	shr    $0x1f,%ecx
    bb8d:	01 c8                	add    %ecx,%eax
    bb8f:	d1 f8                	sar    %eax
    bb91:	01 c2                	add    %eax,%edx
    bb93:	8b 45 f0             	mov    -0x10(%ebp),%eax
    bb96:	01 c0                	add    %eax,%eax
    bb98:	83 c0 01             	add    $0x1,%eax
    bb9b:	89 d1                	mov    %edx,%ecx
    bb9d:	0f af c8             	imul   %eax,%ecx
    bba0:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    bba5:	89 c8                	mov    %ecx,%eax
    bba7:	f7 ea                	imul   %edx
    bba9:	c1 fa 05             	sar    $0x5,%edx
    bbac:	89 c8                	mov    %ecx,%eax
    bbae:	c1 f8 1f             	sar    $0x1f,%eax
    bbb1:	29 c2                	sub    %eax,%edx
    bbb3:	89 d0                	mov    %edx,%eax
    bbb5:	c1 e0 03             	shl    $0x3,%eax
    bbb8:	01 d0                	add    %edx,%eax
    bbba:	c1 e0 04             	shl    $0x4,%eax
    bbbd:	29 c1                	sub    %eax,%ecx
    bbbf:	89 ca                	mov    %ecx,%edx
    bbc1:	dd 04 d5 40 15 01 00 	fldl   0x11540(,%edx,8)
    bbc8:	de c9                	fmulp  %st,%st(1)
    bbca:	dd 45 e0             	fldl   -0x20(%ebp)
    bbcd:	de c1                	faddp  %st,%st(1)
    bbcf:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    bbd2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    bbd6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    bbd9:	89 c2                	mov    %eax,%edx
    bbdb:	c1 ea 1f             	shr    $0x1f,%edx
    bbde:	01 d0                	add    %edx,%eax
    bbe0:	d1 f8                	sar    %eax
    bbe2:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    bbe5:	7f 85                	jg     bb6c <inv_mdct+0x445>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    bbe7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bbea:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    bbf1:	8b 45 0c             	mov    0xc(%ebp),%eax
    bbf4:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    bbf7:	8b 55 10             	mov    0x10(%ebp),%edx
    bbfa:	89 d0                	mov    %edx,%eax
    bbfc:	c1 e0 03             	shl    $0x3,%eax
    bbff:	01 d0                	add    %edx,%eax
    bc01:	c1 e0 02             	shl    $0x2,%eax
    bc04:	8b 55 ec             	mov    -0x14(%ebp),%edx
    bc07:	01 d0                	add    %edx,%eax
    bc09:	dd 04 c5 c0 10 01 00 	fldl   0x110c0(,%eax,8)
    bc10:	dc 4d e0             	fmull  -0x20(%ebp)
    bc13:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    bc15:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    bc19:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bc1c:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    bc1f:	0f 8c 39 ff ff ff    	jl     bb5e <inv_mdct+0x437>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    bc25:	c9                   	leave  
    bc26:	c3                   	ret    

0000bc27 <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    bc27:	55                   	push   %ebp
    bc28:	89 e5                	mov    %esp,%ebp
    bc2a:	53                   	push   %ebx
    bc2b:	81 ec 54 01 00 00    	sub    $0x154,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    bc31:	a1 a4 0f 01 00       	mov    0x10fa4,%eax
    bc36:	85 c0                	test   %eax,%eax
    bc38:	74 6f                	je     bca9 <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    bc3a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    bc41:	eb 56                	jmp    bc99 <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    bc43:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    bc4a:	eb 43                	jmp    bc8f <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    bc4c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    bc53:	eb 30                	jmp    bc85 <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    bc55:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bc58:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    bc5b:	89 c2                	mov    %eax,%edx
    bc5d:	c1 e2 03             	shl    $0x3,%edx
    bc60:	01 c2                	add    %eax,%edx
    bc62:	8d 04 12             	lea    (%edx,%edx,1),%eax
    bc65:	89 c2                	mov    %eax,%edx
    bc67:	89 c8                	mov    %ecx,%eax
    bc69:	c1 e0 03             	shl    $0x3,%eax
    bc6c:	01 c8                	add    %ecx,%eax
    bc6e:	c1 e0 06             	shl    $0x6,%eax
    bc71:	01 c2                	add    %eax,%edx
    bc73:	8b 45 e8             	mov    -0x18(%ebp),%eax
    bc76:	01 d0                	add    %edx,%eax
    bc78:	d9 ee                	fldz   
    bc7a:	dd 1c c5 c0 19 01 00 	fstpl  0x119c0(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    bc81:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    bc85:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    bc89:	7e ca                	jle    bc55 <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    bc8b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    bc8f:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    bc93:	7e b7                	jle    bc4c <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    bc95:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    bc99:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    bc9d:	7e a4                	jle    bc43 <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    bc9f:	c7 05 a4 0f 01 00 00 	movl   $0x0,0x10fa4
    bca6:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    bca9:	8b 45 18             	mov    0x18(%ebp),%eax
    bcac:	8b 40 10             	mov    0x10(%eax),%eax
    bcaf:	85 c0                	test   %eax,%eax
    bcb1:	74 10                	je     bcc3 <III_hybrid+0x9c>
    bcb3:	8b 45 18             	mov    0x18(%ebp),%eax
    bcb6:	8b 40 18             	mov    0x18(%eax),%eax
    bcb9:	85 c0                	test   %eax,%eax
    bcbb:	74 06                	je     bcc3 <III_hybrid+0x9c>
    bcbd:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    bcc1:	7e 08                	jle    bccb <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    bcc3:	8b 45 18             	mov    0x18(%ebp),%eax
    bcc6:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    bcc9:	eb 05                	jmp    bcd0 <III_hybrid+0xa9>
    bccb:	b8 00 00 00 00       	mov    $0x0,%eax
    bcd0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    bcd3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    bcd6:	89 44 24 08          	mov    %eax,0x8(%esp)
    bcda:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    bce0:	89 44 24 04          	mov    %eax,0x4(%esp)
    bce4:	8b 45 08             	mov    0x8(%ebp),%eax
    bce7:	89 04 24             	mov    %eax,(%esp)
    bcea:	e8 38 fa ff ff       	call   b727 <inv_mdct>

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    bcef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    bcf6:	e9 83 00 00 00       	jmp    bd7e <III_hybrid+0x157>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    bcfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bcfe:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    bd05:	8b 45 0c             	mov    0xc(%ebp),%eax
    bd08:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    bd0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bd0e:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    bd15:	8b 45 10             	mov    0x10(%ebp),%eax
    bd18:	8b 4d 14             	mov    0x14(%ebp),%ecx
    bd1b:	89 c2                	mov    %eax,%edx
    bd1d:	c1 e2 03             	shl    $0x3,%edx
    bd20:	01 c2                	add    %eax,%edx
    bd22:	8d 04 12             	lea    (%edx,%edx,1),%eax
    bd25:	89 c2                	mov    %eax,%edx
    bd27:	89 c8                	mov    %ecx,%eax
    bd29:	c1 e0 03             	shl    $0x3,%eax
    bd2c:	01 c8                	add    %ecx,%eax
    bd2e:	c1 e0 06             	shl    $0x6,%eax
    bd31:	01 c2                	add    %eax,%edx
    bd33:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bd36:	01 d0                	add    %edx,%eax
    bd38:	dd 04 c5 c0 19 01 00 	fldl   0x119c0(,%eax,8)
    bd3f:	de c1                	faddp  %st,%st(1)
    bd41:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    bd43:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bd46:	83 c0 12             	add    $0x12,%eax
    bd49:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    bd50:	8b 45 10             	mov    0x10(%ebp),%eax
    bd53:	8b 4d 14             	mov    0x14(%ebp),%ecx
    bd56:	89 c2                	mov    %eax,%edx
    bd58:	c1 e2 03             	shl    $0x3,%edx
    bd5b:	01 c2                	add    %eax,%edx
    bd5d:	8d 04 12             	lea    (%edx,%edx,1),%eax
    bd60:	89 c2                	mov    %eax,%edx
    bd62:	89 c8                	mov    %ecx,%eax
    bd64:	c1 e0 03             	shl    $0x3,%eax
    bd67:	01 c8                	add    %ecx,%eax
    bd69:	c1 e0 06             	shl    $0x6,%eax
    bd6c:	01 c2                	add    %eax,%edx
    bd6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bd71:	01 d0                	add    %edx,%eax
    bd73:	dd 1c c5 c0 19 01 00 	fstpl  0x119c0(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    bd7a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    bd7e:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    bd82:	0f 8e 73 ff ff ff    	jle    bcfb <III_hybrid+0xd4>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    bd88:	81 c4 54 01 00 00    	add    $0x154,%esp
    bd8e:	5b                   	pop    %ebx
    bd8f:	5d                   	pop    %ebp
    bd90:	c3                   	ret    

0000bd91 <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    bd91:	55                   	push   %ebp
    bd92:	89 e5                	mov    %esp,%ebp
    bd94:	57                   	push   %edi
    bd95:	56                   	push   %esi
    bd96:	53                   	push   %ebx
    bd97:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    bd9a:	be 00 00 00 00       	mov    $0x0,%esi
    bd9f:	e9 1c 01 00 00       	jmp    bec0 <create_syn_filter+0x12f>
		for (k=0; k<32; k++) {
    bda4:	bb 00 00 00 00       	mov    $0x0,%ebx
    bda9:	e9 06 01 00 00       	jmp    beb4 <create_syn_filter+0x123>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    bdae:	89 f0                	mov    %esi,%eax
    bdb0:	c1 e0 08             	shl    $0x8,%eax
    bdb3:	89 c2                	mov    %eax,%edx
    bdb5:	8b 45 08             	mov    0x8(%ebp),%eax
    bdb8:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    bdbb:	89 75 e0             	mov    %esi,-0x20(%ebp)
    bdbe:	db 45 e0             	fildl  -0x20(%ebp)
    bdc1:	dd 05 20 f1 00 00    	fldl   0xf120
    bdc7:	de c9                	fmulp  %st,%st(1)
    bdc9:	dd 05 28 f1 00 00    	fldl   0xf128
    bdcf:	de c1                	faddp  %st,%st(1)
    bdd1:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    bdd4:	83 c0 01             	add    $0x1,%eax
    bdd7:	89 45 e0             	mov    %eax,-0x20(%ebp)
    bdda:	db 45 e0             	fildl  -0x20(%ebp)
    bddd:	de c9                	fmulp  %st,%st(1)
    bddf:	dd 1c 24             	fstpl  (%esp)
    bde2:	e8 6c a2 ff ff       	call   6053 <cos>
    bde7:	dd 05 30 f1 00 00    	fldl   0xf130
    bded:	de c9                	fmulp  %st,%st(1)
    bdef:	dd 1c df             	fstpl  (%edi,%ebx,8)
    bdf2:	dd 04 df             	fldl   (%edi,%ebx,8)
    bdf5:	d9 ee                	fldz   
    bdf7:	d9 c9                	fxch   %st(1)
    bdf9:	df e9                	fucomip %st(1),%st
    bdfb:	dd d8                	fstp   %st(0)
    bdfd:	72 47                	jb     be46 <create_syn_filter+0xb5>
				filter[i][k] = (int)(filter[i][k]+0.5);
    bdff:	89 f0                	mov    %esi,%eax
    be01:	c1 e0 08             	shl    $0x8,%eax
    be04:	89 c2                	mov    %eax,%edx
    be06:	8b 45 08             	mov    0x8(%ebp),%eax
    be09:	01 c2                	add    %eax,%edx
    be0b:	89 f0                	mov    %esi,%eax
    be0d:	c1 e0 08             	shl    $0x8,%eax
    be10:	89 c1                	mov    %eax,%ecx
    be12:	8b 45 08             	mov    0x8(%ebp),%eax
    be15:	01 c8                	add    %ecx,%eax
    be17:	dd 04 d8             	fldl   (%eax,%ebx,8)
    be1a:	dd 05 f0 f0 00 00    	fldl   0xf0f0
    be20:	de c1                	faddp  %st,%st(1)
    be22:	d9 7d e6             	fnstcw -0x1a(%ebp)
    be25:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    be29:	b4 0c                	mov    $0xc,%ah
    be2b:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    be2f:	d9 6d e4             	fldcw  -0x1c(%ebp)
    be32:	db 5d e0             	fistpl -0x20(%ebp)
    be35:	d9 6d e6             	fldcw  -0x1a(%ebp)
    be38:	8b 45 e0             	mov    -0x20(%ebp),%eax
    be3b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    be3e:	db 45 e0             	fildl  -0x20(%ebp)
    be41:	dd 1c da             	fstpl  (%edx,%ebx,8)
    be44:	eb 45                	jmp    be8b <create_syn_filter+0xfa>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    be46:	89 f0                	mov    %esi,%eax
    be48:	c1 e0 08             	shl    $0x8,%eax
    be4b:	89 c2                	mov    %eax,%edx
    be4d:	8b 45 08             	mov    0x8(%ebp),%eax
    be50:	01 c2                	add    %eax,%edx
    be52:	89 f0                	mov    %esi,%eax
    be54:	c1 e0 08             	shl    $0x8,%eax
    be57:	89 c1                	mov    %eax,%ecx
    be59:	8b 45 08             	mov    0x8(%ebp),%eax
    be5c:	01 c8                	add    %ecx,%eax
    be5e:	dd 04 d8             	fldl   (%eax,%ebx,8)
    be61:	dd 05 f0 f0 00 00    	fldl   0xf0f0
    be67:	de e9                	fsubrp %st,%st(1)
    be69:	d9 7d e6             	fnstcw -0x1a(%ebp)
    be6c:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    be70:	b4 0c                	mov    $0xc,%ah
    be72:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    be76:	d9 6d e4             	fldcw  -0x1c(%ebp)
    be79:	db 5d e0             	fistpl -0x20(%ebp)
    be7c:	d9 6d e6             	fldcw  -0x1a(%ebp)
    be7f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    be82:	89 45 e0             	mov    %eax,-0x20(%ebp)
    be85:	db 45 e0             	fildl  -0x20(%ebp)
    be88:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    be8b:	89 f0                	mov    %esi,%eax
    be8d:	c1 e0 08             	shl    $0x8,%eax
    be90:	89 c2                	mov    %eax,%edx
    be92:	8b 45 08             	mov    0x8(%ebp),%eax
    be95:	01 d0                	add    %edx,%eax
    be97:	89 f2                	mov    %esi,%edx
    be99:	89 d1                	mov    %edx,%ecx
    be9b:	c1 e1 08             	shl    $0x8,%ecx
    be9e:	8b 55 08             	mov    0x8(%ebp),%edx
    bea1:	01 ca                	add    %ecx,%edx
    bea3:	dd 04 da             	fldl   (%edx,%ebx,8)
    bea6:	dd 05 38 f1 00 00    	fldl   0xf138
    beac:	de c9                	fmulp  %st,%st(1)
    beae:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    beb1:	83 c3 01             	add    $0x1,%ebx
    beb4:	83 fb 1f             	cmp    $0x1f,%ebx
    beb7:	0f 8e f1 fe ff ff    	jle    bdae <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    bebd:	83 c6 01             	add    $0x1,%esi
    bec0:	83 fe 3f             	cmp    $0x3f,%esi
    bec3:	0f 8e db fe ff ff    	jle    bda4 <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    bec9:	83 c4 1c             	add    $0x1c,%esp
    becc:	5b                   	pop    %ebx
    becd:	5e                   	pop    %esi
    bece:	5f                   	pop    %edi
    becf:	5d                   	pop    %ebp
    bed0:	c3                   	ret    

0000bed1 <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    bed1:	55                   	push   %ebp
    bed2:	89 e5                	mov    %esp,%ebp
    bed4:	57                   	push   %edi
    bed5:	56                   	push   %esi
    bed6:	53                   	push   %ebx
    bed7:	81 ec 14 10 00 00    	sub    $0x1014,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    bedd:	8d 95 e8 ef ff ff    	lea    -0x1018(%ebp),%edx
    bee3:	bb a0 e0 00 00       	mov    $0xe0a0,%ebx
    bee8:	b8 00 04 00 00       	mov    $0x400,%eax
    beed:	89 d7                	mov    %edx,%edi
    beef:	89 de                	mov    %ebx,%esi
    bef1:	89 c1                	mov    %eax,%ecx
    bef3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    bef5:	8d 85 e8 ef ff ff    	lea    -0x1018(%ebp),%eax
    befb:	89 45 ec             	mov    %eax,-0x14(%ebp)
}
    befe:	81 c4 14 10 00 00    	add    $0x1014,%esp
    bf04:	5b                   	pop    %ebx
    bf05:	5e                   	pop    %esi
    bf06:	5f                   	pop    %edi
    bf07:	5d                   	pop    %ebp
    bf08:	c3                   	ret    

0000bf09 <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    bf09:	55                   	push   %ebp
    bf0a:	89 e5                	mov    %esp,%ebp
    bf0c:	57                   	push   %edi
    bf0d:	56                   	push   %esi
    bf0e:	53                   	push   %ebx
    bf0f:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    bf12:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    bf19:	a1 a8 0f 01 00       	mov    0x10fa8,%eax
    bf1e:	85 c0                	test   %eax,%eax
    bf20:	74 6f                	je     bf91 <SubBandSynthesis+0x88>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    bf22:	c7 44 24 04 a0 f0 00 	movl   $0xf0a0,0x4(%esp)
    bf29:	00 
    bf2a:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    bf31:	e8 15 a8 ff ff       	call   674b <mem_alloc>
    bf36:	a3 c0 3d 01 00       	mov    %eax,0x13dc0
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    bf3b:	c7 44 24 04 a3 f0 00 	movl   $0xf0a3,0x4(%esp)
    bf42:	00 
    bf43:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    bf4a:	e8 fc a7 ff ff       	call   674b <mem_alloc>
    bf4f:	a3 c4 3d 01 00       	mov    %eax,0x13dc4
		create_syn_filter(*filter);
    bf54:	a1 c4 3d 01 00       	mov    0x13dc4,%eax
    bf59:	89 04 24             	mov    %eax,(%esp)
    bf5c:	e8 30 fe ff ff       	call   bd91 <create_syn_filter>
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    bf61:	c7 44 24 04 a6 f0 00 	movl   $0xf0a6,0x4(%esp)
    bf68:	00 
    bf69:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    bf70:	e8 d6 a7 ff ff       	call   674b <mem_alloc>
    bf75:	a3 c8 3d 01 00       	mov    %eax,0x13dc8
		read_syn_window(window);
    bf7a:	a1 c8 3d 01 00       	mov    0x13dc8,%eax
    bf7f:	89 04 24             	mov    %eax,(%esp)
    bf82:	e8 4a ff ff ff       	call   bed1 <read_syn_window>
		init = 0;
    bf87:	c7 05 a8 0f 01 00 00 	movl   $0x0,0x10fa8
    bf8e:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    bf91:	8b 45 0c             	mov    0xc(%ebp),%eax
    bf94:	8b 04 85 ac 0f 01 00 	mov    0x10fac(,%eax,4),%eax
    bf9b:	83 e8 40             	sub    $0x40,%eax
    bf9e:	25 ff 03 00 00       	and    $0x3ff,%eax
    bfa3:	89 c2                	mov    %eax,%edx
    bfa5:	8b 45 0c             	mov    0xc(%ebp),%eax
    bfa8:	89 14 85 ac 0f 01 00 	mov    %edx,0x10fac(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    bfaf:	8b 15 c0 3d 01 00    	mov    0x13dc0,%edx
    bfb5:	8b 45 0c             	mov    0xc(%ebp),%eax
    bfb8:	8b 04 85 ac 0f 01 00 	mov    0x10fac(,%eax,4),%eax
    bfbf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    bfc2:	c1 e1 0a             	shl    $0xa,%ecx
    bfc5:	01 c8                	add    %ecx,%eax
    bfc7:	c1 e0 03             	shl    $0x3,%eax
    bfca:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    bfcd:	bb 00 00 00 00       	mov    $0x0,%ebx
    bfd2:	eb 40                	jmp    c014 <SubBandSynthesis+0x10b>
		sum = 0;
    bfd4:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    bfd6:	be 00 00 00 00       	mov    $0x0,%esi
    bfdb:	eb 26                	jmp    c003 <SubBandSynthesis+0xfa>
			sum += bandPtr[k] * (*filter)[i][k];
    bfdd:	89 f0                	mov    %esi,%eax
    bfdf:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    bfe6:	8b 45 08             	mov    0x8(%ebp),%eax
    bfe9:	01 d0                	add    %edx,%eax
    bfeb:	dd 00                	fldl   (%eax)
    bfed:	a1 c4 3d 01 00       	mov    0x13dc4,%eax
    bff2:	89 da                	mov    %ebx,%edx
    bff4:	c1 e2 05             	shl    $0x5,%edx
    bff7:	01 f2                	add    %esi,%edx
    bff9:	dd 04 d0             	fldl   (%eax,%edx,8)
    bffc:	de c9                	fmulp  %st,%st(1)
    bffe:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    c000:	83 c6 01             	add    $0x1,%esi
    c003:	83 fe 1f             	cmp    $0x1f,%esi
    c006:	7e d5                	jle    bfdd <SubBandSynthesis+0xd4>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    c008:	89 d8                	mov    %ebx,%eax
    c00a:	c1 e0 03             	shl    $0x3,%eax
    c00d:	01 f8                	add    %edi,%eax
    c00f:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    c011:	83 c3 01             	add    $0x1,%ebx
    c014:	83 fb 3f             	cmp    $0x3f,%ebx
    c017:	7e bb                	jle    bfd4 <SubBandSynthesis+0xcb>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    c019:	bf 00 00 00 00       	mov    $0x0,%edi
    c01e:	e9 c7 00 00 00       	jmp    c0ea <SubBandSynthesis+0x1e1>
		sum = 0;
    c023:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    c025:	bb 00 00 00 00       	mov    $0x0,%ebx
    c02a:	eb 4c                	jmp    c078 <SubBandSynthesis+0x16f>
			k = j + (i<<5);
    c02c:	89 d8                	mov    %ebx,%eax
    c02e:	c1 e0 05             	shl    $0x5,%eax
    c031:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    c034:	a1 c8 3d 01 00       	mov    0x13dc8,%eax
    c039:	89 f2                	mov    %esi,%edx
    c03b:	c1 e2 03             	shl    $0x3,%edx
    c03e:	01 d0                	add    %edx,%eax
    c040:	dd 00                	fldl   (%eax)
    c042:	a1 c0 3d 01 00       	mov    0x13dc0,%eax
    c047:	8d 53 01             	lea    0x1(%ebx),%edx
    c04a:	d1 fa                	sar    %edx
    c04c:	c1 e2 06             	shl    $0x6,%edx
    c04f:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    c052:	8b 55 0c             	mov    0xc(%ebp),%edx
    c055:	8b 14 95 ac 0f 01 00 	mov    0x10fac(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    c05c:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    c05e:	89 d1                	mov    %edx,%ecx
    c060:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    c066:	8b 55 0c             	mov    0xc(%ebp),%edx
    c069:	c1 e2 0a             	shl    $0xa,%edx
    c06c:	01 ca                	add    %ecx,%edx
    c06e:	dd 04 d0             	fldl   (%eax,%edx,8)
    c071:	de c9                	fmulp  %st,%st(1)
    c073:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    c075:	83 c3 01             	add    $0x1,%ebx
    c078:	83 fb 0f             	cmp    $0xf,%ebx
    c07b:	7e af                	jle    c02c <SubBandSynthesis+0x123>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    c07d:	dd 05 40 f1 00 00    	fldl   0xf140
    c083:	de c9                	fmulp  %st,%st(1)
    c085:	d9 7d d6             	fnstcw -0x2a(%ebp)
    c088:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    c08c:	b4 0c                	mov    $0xc,%ah
    c08e:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    c092:	d9 6d d4             	fldcw  -0x2c(%ebp)
    c095:	db 5d e0             	fistpl -0x20(%ebp)
    c098:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    c09b:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    c0a2:	7e 15                	jle    c0b9 <SubBandSynthesis+0x1b0>
    c0a4:	89 f8                	mov    %edi,%eax
    c0a6:	8d 14 00             	lea    (%eax,%eax,1),%edx
    c0a9:	8b 45 10             	mov    0x10(%ebp),%eax
    c0ac:	01 d0                	add    %edx,%eax
    c0ae:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    c0b3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    c0b7:	eb 2e                	jmp    c0e7 <SubBandSynthesis+0x1de>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    c0b9:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    c0c0:	7d 15                	jge    c0d7 <SubBandSynthesis+0x1ce>
    c0c2:	89 f8                	mov    %edi,%eax
    c0c4:	8d 14 00             	lea    (%eax,%eax,1),%edx
    c0c7:	8b 45 10             	mov    0x10(%ebp),%eax
    c0ca:	01 d0                	add    %edx,%eax
    c0cc:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    c0d1:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    c0d5:	eb 10                	jmp    c0e7 <SubBandSynthesis+0x1de>
			else                           samples[j] = foo;
    c0d7:	89 f8                	mov    %edi,%eax
    c0d9:	8d 14 00             	lea    (%eax,%eax,1),%edx
    c0dc:	8b 45 10             	mov    0x10(%ebp),%eax
    c0df:	01 c2                	add    %eax,%edx
    c0e1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    c0e4:	66 89 02             	mov    %ax,(%edx)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    c0e7:	83 c7 01             	add    $0x1,%edi
    c0ea:	83 ff 1f             	cmp    $0x1f,%edi
    c0ed:	0f 8e 30 ff ff ff    	jle    c023 <SubBandSynthesis+0x11a>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    c0f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    c0f6:	83 c4 2c             	add    $0x2c,%esp
    c0f9:	5b                   	pop    %ebx
    c0fa:	5e                   	pop    %esi
    c0fb:	5f                   	pop    %edi
    c0fc:	5d                   	pop    %ebp
    c0fd:	c3                   	ret    

0000c0fe <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    c0fe:	55                   	push   %ebp
    c0ff:	89 e5                	mov    %esp,%ebp
    c101:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    c104:	8b 45 10             	mov    0x10(%ebp),%eax
    c107:	8b 40 08             	mov    0x8(%eax),%eax
    c10a:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    c10d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    c114:	eb 75                	jmp    c18b <out_fifo+0x8d>
    c116:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    c11d:	eb 62                	jmp    c181 <out_fifo+0x83>
            (*psampFrames)++;
    c11f:	8b 45 14             	mov    0x14(%ebp),%eax
    c122:	8b 00                	mov    (%eax),%eax
    c124:	8d 50 01             	lea    0x1(%eax),%edx
    c127:	8b 45 14             	mov    0x14(%ebp),%eax
    c12a:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    c12c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    c133:	eb 40                	jmp    c175 <out_fifo+0x77>
                if (!(k%1600) && k) {
    c135:	8b 0d cc 3d 01 00    	mov    0x13dcc,%ecx
    c13b:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    c140:	89 c8                	mov    %ecx,%eax
    c142:	f7 ea                	imul   %edx
    c144:	c1 fa 09             	sar    $0x9,%edx
    c147:	89 c8                	mov    %ecx,%eax
    c149:	c1 f8 1f             	sar    $0x1f,%eax
    c14c:	29 c2                	sub    %eax,%edx
    c14e:	89 d0                	mov    %edx,%eax
    c150:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    c156:	29 c1                	sub    %eax,%ecx
    c158:	89 c8                	mov    %ecx,%eax
    c15a:	85 c0                	test   %eax,%eax
    c15c:	75 13                	jne    c171 <out_fifo+0x73>
    c15e:	a1 cc 3d 01 00       	mov    0x13dcc,%eax
    c163:	85 c0                	test   %eax,%eax
    c165:	74 0a                	je     c171 <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    c167:	c7 05 cc 3d 01 00 00 	movl   $0x0,0x13dcc
    c16e:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    c171:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    c175:	8b 45 f4             	mov    -0xc(%ebp),%eax
    c178:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    c17b:	7c b8                	jl     c135 <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    c17d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    c181:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    c185:	7e 98                	jle    c11f <out_fifo+0x21>
    c187:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    c18b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    c18e:	3b 45 0c             	cmp    0xc(%ebp),%eax
    c191:	7c 83                	jl     c116 <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    c193:	c9                   	leave  
    c194:	c3                   	ret    

0000c195 <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    c195:	55                   	push   %ebp
    c196:	89 e5                	mov    %esp,%ebp
    c198:	83 ec 18             	sub    $0x18,%esp
    *old_crc = getbits(bs, 16);
    c19b:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
    c1a2:	00 
    c1a3:	8b 45 08             	mov    0x8(%ebp),%eax
    c1a6:	89 04 24             	mov    %eax,(%esp)
    c1a9:	e8 8b a8 ff ff       	call   6a39 <getbits>
    c1ae:	8b 55 0c             	mov    0xc(%ebp),%edx
    c1b1:	89 02                	mov    %eax,(%edx)
}
    c1b3:	c9                   	leave  
    c1b4:	c3                   	ret    

0000c1b5 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    c1b5:	55                   	push   %ebp
    c1b6:	89 e5                	mov    %esp,%ebp
    c1b8:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    c1bb:	8b 45 08             	mov    0x8(%ebp),%eax
    c1be:	8b 40 0c             	mov    0xc(%eax),%eax
    c1c1:	83 c0 1e             	add    $0x1e,%eax
    c1c4:	8b 14 85 00 0b 01 00 	mov    0x10b00(,%eax,4),%edx
    c1cb:	89 d0                	mov    %edx,%eax
    c1cd:	c1 e0 03             	shl    $0x3,%eax
    c1d0:	01 d0                	add    %edx,%eax
    c1d2:	c1 e0 04             	shl    $0x4,%eax
			/ s_freq[fr_ps.header->sampling_frequency];
    c1d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    c1d8:	db 45 ec             	fildl  -0x14(%ebp)
    c1db:	8b 45 08             	mov    0x8(%ebp),%eax
    c1de:	8b 40 10             	mov    0x10(%eax),%eax
    c1e1:	dd 04 c5 c0 0b 01 00 	fldl   0x10bc0(,%eax,8)
    c1e8:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    c1ea:	d9 7d ea             	fnstcw -0x16(%ebp)
    c1ed:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    c1f1:	b4 0c                	mov    $0xc,%ah
    c1f3:	66 89 45 e8          	mov    %ax,-0x18(%ebp)
    c1f7:	d9 6d e8             	fldcw  -0x18(%ebp)
    c1fa:	db 5d fc             	fistpl -0x4(%ebp)
    c1fd:	d9 6d ea             	fldcw  -0x16(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    c200:	8b 45 08             	mov    0x8(%ebp),%eax
    c203:	8b 40 14             	mov    0x14(%eax),%eax
    c206:	85 c0                	test   %eax,%eax
    c208:	74 04                	je     c20e <main_data_slots+0x59>
    c20a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    c20e:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    c212:	8b 45 08             	mov    0x8(%ebp),%eax
    c215:	8b 40 08             	mov    0x8(%eax),%eax
    c218:	85 c0                	test   %eax,%eax
    c21a:	74 04                	je     c220 <main_data_slots+0x6b>
		nSlots -= 2;
    c21c:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    c220:	8b 45 10             	mov    0x10(%ebp),%eax
    c223:	83 f8 01             	cmp    $0x1,%eax
    c226:	75 06                	jne    c22e <main_data_slots+0x79>
		nSlots -= 17;
    c228:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    c22c:	eb 04                	jmp    c232 <main_data_slots+0x7d>
	else
		nSlots -=32;
    c22e:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    c232:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    c235:	c9                   	leave  
    c236:	c3                   	ret    
